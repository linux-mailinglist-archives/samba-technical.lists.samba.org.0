Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D26226BFF8C
	for <lists+samba-technical@lfdr.de>; Sun, 19 Mar 2023 07:13:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=UNsp2bInfeQul/hveMiIdhC9IqyC5QSEnsSYNxfVETI=; b=H41K4Zxha+Nu+VVV/b/at+uZmL
	sZtlSmdOd9lmSpyGZex+LW/xrdG2kCFVurEArBDI9y5ujWQZwGTKdQFh1Z4xHuv4cmcO1IQVKvb+m
	xl9S2naLDunGyekrMZIj+65Slr2hpRwc48RzZKYNDC0OmiPZcKzvHVbakVCtFoWJOt/aZJ+tEj0D1
	KJA2U439xU46obOzG1MYj0qNtghEyA9HoLBKgus51YuvEtVvp04hgK+ZlX1Ip2oIhgj8oYdoaR/IK
	lHYyYVchtK9QiKjG/WdHqe1EUh6Eq6Lcv6UZsX6aS/wlL5+FK8aI8nwXY60epAeG+0S6uFlVuWv+C
	BJqkivqQ==;
Received: from ip6-localhost ([::1]:62198 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pdmHe-003JDl-UG; Sun, 19 Mar 2023 06:12:47 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:46757) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pdmHb-003JDZ-6l; Sun, 19 Mar 2023 06:12:45 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id CD4C740158;
 Sun, 19 Mar 2023 09:12:39 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 766CE123;
 Sun, 19 Mar 2023 09:12:39 +0300 (MSK)
Message-ID: <c2ed6a14-6555-2f51-5bf4-c984aaa43a64@msgid.tls.msk.ru>
Date: Sun, 19 Mar 2023 09:12:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: samba@lists.samba.org, samba-technical <samba-technical@lists.samba.org>
Subject: mit-krb5 and heimdal binaries
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi!

I already asked a similar question before, but it keeps popping up in different
contexts and forms, and the more I use samba myself, the more often it comes to
me too, especially in context of using various security tokens for auth.  And the
more I think about all this, the more sane it looks to me.

The thing is: mit-krb5 has much better user-level support than heimdal. But samba
does not fully support mit-krb5 as an active directory domain controller.  The
AD-DC thing is server-side.

I can think of providing two builds of samba for a distribution (eg debian/ubuntu), -
one implementing whole ad-dc, as a complete thing, using their own set of libs,
linked with heimdal. And a usual set of more client-side packages, with their own
libraries, built against mit-krb5.  Or maybe some other combination also has its
right to be, - for example, smbclient built with mit-krb5, the rest is heimdal.

An essential part of this is that the two sets (built against mit-krb5 and heimdal)
do not share any internal libraries, each has its own libraries. This way, there's
no "mix" of differently built samba, each build uses only its own libs, so there's
no clash here.  They share the same smb.conf though.

So far, I've seen requests to build two versions of the server (again, with mit-krb5
and with heimdal), - and I faced the same issues too.  This is because a regular AD
member server is also good to have mit-krb5 support to integrate nicely into the auth
infrastructure. While for ad-dc, it is less often used as "end-user" server.

So I can think of a separate samba-ad-dc binary package providing whole samba suite
built against heimdal (maybe without smbclient and some other minor things), and
samba "file server" binary package providing regular server not suitable to use as
an ad-dc, but conflicting with samba-ad-dc, so it is not possible to install one
together with another.

This approach also has another good side effect, to discourage usage of samba-ad-dc
as a regular file server.

Or maybe the whole thing is moot now, and we just can provide regular samba built
against mit-krb5 to work as a good AD-DC?  That would be the best solution IMHO.

Thanks,

/mjt


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E690EBE36
	for <lists+samba-technical@lfdr.de>; Fri,  1 Nov 2019 07:58:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=8rjjY6eA2eKbf94AlF6pXw/GQJ01rHUOPGA664iApl4=; b=Gzyl8l/CXQ+R3JiXrCJWLmo73W
	P8NxS6PQrX843ut0RsR+DuaZB+8EX2fsrigD7LtDweWqhw89sKH+sb54udasTom2K/y3HmEjD9YuR
	alhBkjR3E90yqSFIiTLHJCFIQJjF651GuosexFMHkO/b9p6H4KP5qn6mcTbHxIAjKslImUIKIrF2C
	eSnanukYl0efvglzDa6Qy42mbodUd2CKz/ily6gJfofAjDRwwag+H00qL4lIDW8KxQQRqlbk9OLqI
	qjbiKm5mFfgpXeAnKT0u1rELdFkwDoriwWKYp/hellzY20LVUk9P2BebFT9IGrp6pq0RRsruaR099
	2pFCYYZA==;
Received: from localhost ([::1]:60552 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iQQrp-005pjW-Al; Fri, 01 Nov 2019 06:57:05 +0000
Received: from mailout1.hostsharing.net ([2a01:37:1000::53df:5fcc:0]:38467) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iQQrg-005pjP-Kh
 for samba-technical@lists.samba.org; Fri, 01 Nov 2019 06:56:59 +0000
Received: from h01.hostsharing.net (h01.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1d:0])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
 by mailout1.hostsharing.net (Postfix) with ESMTPS id C25DA101903A5
 for <samba-technical@lists.samba.org>; Fri,  1 Nov 2019 07:38:52 +0100 (CET)
Received: from webmail.hostsharing.net (h50.hostsharing.net [83.223.95.104])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by h01.hostsharing.net (Postfix) with ESMTPSA id 90AC16019029
 for <samba-technical@lists.samba.org>; Fri,  1 Nov 2019 07:38:52 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 01 Nov 2019 07:38:52 +0100
To: samba-technical@lists.samba.org
Subject: suddenly change: idmap uid + gid
Message-ID: <fcf6d6e4b21081a4a05b50c419a4facc@c-toph.de>
X-Sender: liste@c-toph.de
User-Agent: Roundcube Webmail/1.3.3
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
From: Hilberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: Hilberg <liste@c-toph.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi

The server suddenly changed the uid + gid. this happened to times, 
yesterday and the week after.
The samba is a AD member where we have many users (>20 000) and we use 
autorid in that way
[global]
	security = ads
	workgroup = CUSTOMER
	realm = CUSTOMER.COM
         winbind use default domain = yes
         winbind enum users = yes
         winbind enum group = yes
    	idmap config * : backend = autorid
	idmap config * : range = 1000000-8999999999

At the moment I have two questions:
Why this happened and is there a way to stop the disaster?
Is there a quick way to repair the disaster? I infects the profile 
directory used with acl.

thank you


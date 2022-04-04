Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 672AC4F1DF5
	for <lists+samba-technical@lfdr.de>; Mon,  4 Apr 2022 23:59:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=miDEyMJ3dw/81ccO4JFIt772T/xDRmU9GVroNTTXVGw=; b=pvFkdYbYFeS4Xr0tAqHunlnqKi
	UBj1YZNv/qA0PhCXJ6xzhDR8ibRpgjv4uaOTJK7KOWOmmtUbJ7lvSqEvmMBDtIl3lOr0yZna6kR6U
	pbCUa9xNXBg6rzc5nvfbxevb9LBbI0JJOh3PAYly7vjJDD+7yxM/EKNZX5WSOAZDj+HZcPqR4Tjir
	KJUXJP9l/iMwlaG9yllII367xvUeEDnG30+/qP5BDvk0kyDtn5qkPaxvZcbPBf3WsckPrR79PLr0X
	wCMXvjwTyG5ooLypI5LiAWAkjPMaDp5dZNPqWNAoedeuIEzesJ0VuUGVmW9/9FFTR3ZpH08no5KhG
	NzvVdR2g==;
Received: from ip6-localhost ([::1]:45576 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nbUiv-009stp-QF; Mon, 04 Apr 2022 21:58:57 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:41449) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nbUir-009stg-1m
 for samba-technical@lists.samba.org; Mon, 04 Apr 2022 21:58:55 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 41B5140150;
 Tue,  5 Apr 2022 00:58:51 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 77D3E30C;
 Tue,  5 Apr 2022 00:55:04 +0300 (MSK)
Message-ID: <81341b54-feea-514f-a2b0-3d0b4b5ffa60@msgid.tls.msk.ru>
Date: Tue, 5 Apr 2022 00:58:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: doing a test build of samba
Content-Language: en-US
To: Andrew Bartlett <abartlet@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
References: <245e18ba-a620-6a19-33d5-8794f010a617@msgid.tls.msk.ru>
 <942d4519-909a-22d6-6e45-75b976a9f29b@msgid.tls.msk.ru>
 <2165e797b4fab04bd8b625b7b182bf2d9982d2d3.camel@samba.org>
In-Reply-To: <2165e797b4fab04bd8b625b7b182bf2d9982d2d3.camel@samba.org>
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
Cc: Mathieu Parent <math.parent@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

05.04.2022 00:51, Andrew Bartlett wrote:

>> build enables -D WITH_NTVFS_FILESERVER=1.
>> This one, in turn does this:
> 
> This MUST NOT be enabled in production, as Samba upstream provides no
> security support for this code, which remains because it is hard work
> to remove due to the support it provides to some of our tests.

How about just removing $libdir/samba/service/smb.so for production
package?

It is not enabled by default in "server services" anyway, so in order
to trigger any issues in that code (security or not), one have to enable
it in the config first (server services = +smb).

But it is still not a big deal to just remove it on install, is it?

I especially looked at what's being enabled. I found this very module,
plus a few unrelated goodies.

> If you want to do a selftest build, do a selftest build but don't put
> it into the production binaries.

What else, besides smb.so, is wrong?

> If Debian can't handle that, talk to Debian :-)

Debian can, but why?

Thanks,

/mjt


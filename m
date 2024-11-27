Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5789DAA12
	for <lists+samba-technical@lfdr.de>; Wed, 27 Nov 2024 15:46:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=llQ6lyF0G4tS9ScH4r0skK6npnCgm4hHa/2TCFGIirM=; b=uDNd0WeJ5VP6Mntfl0Ay2UoqsN
	o+BnEJLbjNvkYCwfUAY7moqiSFZEJ3QW9AAN09d+BzRnTNuGb6+cYjpFT6LIej9mvIAmNrgY3vKHV
	4bWBZ7rOGjnSg2H01IOK57uqi5oYq/2pLyIUflctnip5Sxgt297rj5uEaqzsNWyl2ZTetIobfWeiv
	GUzzrE68ePA65esipLyF6f4I/E23QSKotKTZ1nIqDEkmzKzWSIcpEwLObU9+ng0esyUPon0OyDdkk
	+SoTBnc114Iz+mINZthOQmGInquteu4F7kB4SH4QZcYKKLa3hFTsZYc6Tsmgu2dOxskWxTD8M72zN
	fouufwTw==;
Received: from ip6-localhost ([::1]:31722 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tGJJL-000zOU-CB; Wed, 27 Nov 2024 14:46:35 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:47759) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tGJJG-000zON-RQ
 for samba-technical@lists.samba.org; Wed, 27 Nov 2024 14:46:33 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id AB759B5940;
 Wed, 27 Nov 2024 17:46:10 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 26E1917B896;
 Wed, 27 Nov 2024 17:46:28 +0300 (MSK)
Message-ID: <3a13673f-ee9c-4c28-95e6-b13d397e64c9@tls.msk.ru>
Date: Wed, 27 Nov 2024 17:46:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: missing rpath [was: building bundled talloc/tevent/tdb libs out
 of main samba sources]
To: Andrew Bartlett <abartlet@samba.org>, samba-technical@lists.samba.org
References: <d033ddfb-9e93-4bdf-8cbb-ec8d0ace7702@tls.msk.ru>
 <f6a0c35c4b22bfc273b812fabdaa65e80991c3b5.camel@samba.org>
 <548706c7-22f9-4715-8fb9-90aed04b8c54@tls.msk.ru>
 <71cfea1803e9e86dad4734dc28ea992e4d74db80.camel@samba.org>
 <01fd1b4b-41f0-4248-b3a2-e3842bc22a78@tls.msk.ru>
 <1c6c0b7f-0620-4e19-ab5b-c4b3e80ef4ff@tls.msk.ru>
Content-Language: en-US, ru-RU
In-Reply-To: <1c6c0b7f-0620-4e19-ab5b-c4b3e80ef4ff@tls.msk.ru>
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

27.11.2024 17:24, Michael Tokarev via samba-technical wrote:
...
> I removed --disable-rpath --disable-rpath-install and now everything
> is in order.

Actually it's not that simple.  With the new configure options, *all*
binaries have samba private rpath (/usr/lib/x86_64-linux-gnu/samba/ in
this case), since essentially everything is having samba private "replace"
library in deps.

Including things like talloc/tdb:

$ patchelf --print-rpath usr/lib/x86_64-linux-gnu/libtalloc.so
/usr/lib/x86_64-linux-gnu/samba

I guess the easiest would be to run patchelf on these to remove
this part, instead of tweaking samba build system for this,
which is already insanely complex.

/mjt


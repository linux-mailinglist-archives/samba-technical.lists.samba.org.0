Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA896212D5
	for <lists+samba-technical@lfdr.de>; Tue,  8 Nov 2022 14:43:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=D6+Ia7vAYJ74yIAOoY4uWKPSaBczAUlfiQcAu6gUrrY=; b=iEAWxmoBSUDWj2zyggBsRURJkx
	ICX4o2vga00ODdjPCy13nojOsrb2qbA7f/msq5oOzWmXws3nKSQcmUCM+eF1IyrU+uBbmegA748eI
	rXA/iQcFfDUaqH0lDRpprsiTO+Y5v9n8ybQzJNuGUnHmvnL6fprJZjtyLvAKb9PXRhKMmCh/wR07J
	PANmHRIVNkrXVqrfBghFWX/zKoLxesTEOU6wQTu9lwyH5Lc7gausRkQC9gg5A03xha4aqKMTTzxgi
	aB4OYlh1LsJkC/p9N+4pDI2ddeuYPi8mRKbmq/ErBUMiav94xoHHZ7kl2MthAl5BWgZGlFgR6l2/2
	qYS+rsCg==;
Received: from ip6-localhost ([::1]:40376 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1osOsK-00BYPr-Jj; Tue, 08 Nov 2022 13:42:48 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:36917) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1osOsF-00BYPi-Mf
 for samba-technical@lists.samba.org; Tue, 08 Nov 2022 13:42:46 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 5337B40115;
 Tue,  8 Nov 2022 16:42:41 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 2CBE930C;
 Tue,  8 Nov 2022 16:42:46 +0300 (MSK)
Message-ID: <dc57ecfe-0058-e0c6-f75c-e4274da0f1ee@msgid.tls.msk.ru>
Date: Tue, 8 Nov 2022 16:42:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: samba does not work with liburing 2.3
Content-Language: en-US
To: Stefan Metzmacher <metze@samba.org>, samba-technical@lists.samba.org,
 io-uring <io-uring@vger.kernel.org>
References: <5a3d3b11-0858-e85f-e381-943263a92202@msgid.tls.msk.ru>
 <df789124-d596-cec3-1ca0-cdebf7b823da@msgid.tls.msk.ru>
 <6dde692a-145f-63bd-95bd-1eb1c1b108ce@samba.org>
In-Reply-To: <6dde692a-145f-63bd-95bd-1eb1c1b108ce@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

08.11.2022 16:26, Stefan Metzmacher wrote:

>> http://bugs.debian.org/1023654
> 
> I don't see where this changes the struct size:

Yeah, I noticed that too after filing that bugreport,
indeed, the problem not in the size of the structures,
but in the changed way - old inline functions used the
deprecated ring_kmask & ring_kentries, while the new
ones uses new ring_mask & ring_entries.

> -       unsigned pad[4];
> +       unsigned ring_mask;
> +       unsigned ring_entries;
> +
> +       unsigned pad[2];
> 
> But I see a problem when you compile against 2.3 and run against 2.2
> as the new values are not filled.
> 
> The problem is the mixture of inline and non-inline functions...

Yeah.

> The packaging should make sure it requires the version is build against...

It is either Depends: liburing2 > $version, or, if the ABI is broken like
this, it is Depends: liburing3 > $newversion (with the soname bump).

At any rate, this is not exactly samba problem, but it affects samba.

Thanks,

/mjt



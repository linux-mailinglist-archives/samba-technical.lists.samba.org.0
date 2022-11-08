Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3995D621254
	for <lists+samba-technical@lfdr.de>; Tue,  8 Nov 2022 14:26:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=7Ckc7jMDPd9YeuBri1f4ih67bDnjtNql4LJnh2S4a9k=; b=JO1sw/Dr9+y4LctuaoeqvEOxrn
	QStHGcsOKQubTt43yPHIP8hs3DvzBk57IJl3SQWpHTUQmryAZWBekslPi1IZ4LERUHeeAKDZFubPc
	Lc7K3KYJWLxrnOLON+J92/BeRM1sAgSnXv90f13rMIS4U97gU6vF4OE5xgah1OwirHSLLgobDgoPP
	2p5Atv7RNuJWUSXs3H72xzmFRsN0SIzTgr4R++hxZE6U+d0FTv/jzkgAUAbk4Ka7mPZ+0EwtrRQXA
	e5xxJGOngp2HdPo76Vt+EbZuriwkESkdmnSTIqZFy+7KQMkyOPoh7DdDqmoFwICiLl2WK4j4+hT6j
	GJiG05aw==;
Received: from ip6-localhost ([::1]:50734 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1osOcK-00BY57-7o; Tue, 08 Nov 2022 13:26:16 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50820) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1osOcG-00BY4y-0O
 for samba-technical@lists.samba.org; Tue, 08 Nov 2022 13:26:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=7Ckc7jMDPd9YeuBri1f4ih67bDnjtNql4LJnh2S4a9k=; b=F333cTBKPAitqzKKOIMoOSfZAp
 U14tZcSunSnUWvZ6sjl06tz4PGlD8r2Di+EZ0dbMtCAP0e+OA7EeBhbXv8dugePxAWWiWb4C+F018
 krSzWtpd9WqYIDBcylMbQwrAdtAVAcHi+tENS2Mv5+rjOp3u0GYlPyIglh59IZTZtYJP4goiqzCmm
 Jk4c2iIGpZ/MxyyCjKRhp5V2stYbcJJVEgTV+mBodTG4tP7xlIcvEm9q6MpP8xi4UmM8/sY7J9bMh
 YJGIGWhmVYNZ8p2Na6n9GT4YR3aZ+Vtq8+5D/YHMOfEeAjNbI/rUPATcZkSttsN/UM1/QHLHoNuou
 bW/nyGYuSSr2mTKh1leXT/nLTDu+jrO38EsudaiEQpsC0724mXggC5bVvTIQtoIemPlqk1En8R8Ry
 Gn9UfdnhIJyAADxqbf+DHNbA71xuys79A/pNkbP7RLgEwgQnBB++EJLap+UPVPSHHjiJs3g/4/DbM
 0VY9FlmYoKBIIl5/siYXyWY5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1osOc7-007hrN-0n; Tue, 08 Nov 2022 13:26:03 +0000
Message-ID: <6dde692a-145f-63bd-95bd-1eb1c1b108ce@samba.org>
Date: Tue, 8 Nov 2022 14:26:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: samba does not work with liburing 2.3
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, samba-technical@lists.samba.org,
 io-uring <io-uring@vger.kernel.org>
References: <5a3d3b11-0858-e85f-e381-943263a92202@msgid.tls.msk.ru>
 <df789124-d596-cec3-1ca0-cdebf7b823da@msgid.tls.msk.ru>
In-Reply-To: <df789124-d596-cec3-1ca0-cdebf7b823da@msgid.tls.msk.ru>
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 08.11.22 um 13:56 schrieb Michael Tokarev via samba-technical:
> 08.11.2022 13:25, Michael Tokarev via samba-technical wrote:
>> FWIW, samba built against the relatively new liburing-2.3 does not
>> work right, io_uring-enabled samba just times out in various i/o
>> operations (eg from smbclient) when liburing used at compile time
>> was 2.3. It works fine with liburing 2.2.
> 
> This turned out to be debian packaging issue, but it might affect
> others too. liburing 2.3 breaks ABI by changing layout of the main
> struct io_uring object in a significant way.
> 
> http://bugs.debian.org/1023654

I don't see where this changes the struct size:

-       unsigned pad[4];
+       unsigned ring_mask;
+       unsigned ring_entries;
+
+       unsigned pad[2];

But I see a problem when you compile against 2.3 and run against 2.2
as the new values are not filled.

The problem is the mixture of inline and non-inline functions...

The packaging should make sure it requires the version is build against...

metze




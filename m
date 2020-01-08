Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D08A13451A
	for <lists+samba-technical@lfdr.de>; Wed,  8 Jan 2020 15:35:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=yQnU4oVuR5fMuh1Cln+kPSsH+v0G/8du5o790+MP97E=; b=l+ShkMDmTFjdgkdR39CFYXP8sG
	YH9yVSCJ+NOBICSaddANQDrCXZINgov0scxctY1HCZ/XsFKQYm9c9ijjU/lE+t/M+B5gCuP5CFqyd
	8JixNSY0VaLxLt/lmxK2Fl0A8UP/Q7FPyzmfJgSpBXJJ1qhQWWhoBv4unp2O9BawK9PHQRcBkSe2F
	3R6gUVhi8coce9Ad+B6URiTJPvEHGj1Dfag5R1KOKgoI/1Hee77HQ1faD4ssdTwvX1hhX1l4JX3BZ
	y2eWbhs6DkF63VH4efb1Jc+xm2xRCvPz9nWiGngL31tGZVRQD2xvecbbUE6pV2O7bJ+zpfnsJ8dUR
	5ouadhHA==;
Received: from localhost ([::1]:61288 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ipCPn-002krg-2Q; Wed, 08 Jan 2020 14:34:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30420) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ipCPi-002krZ-6r
 for samba-technical@lists.samba.org; Wed, 08 Jan 2020 14:34:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=yQnU4oVuR5fMuh1Cln+kPSsH+v0G/8du5o790+MP97E=; b=UpA7MT28Yw3FE8udnmMGXOggbI
 hqNnRdil2NnwW5153EOjTC6rZH6b2IecDE4VSZ6UFACom+CzxQGEBLW8bOMK/5w4DiwllRaAWoHAB
 tbms0qI/e6pCs0nvDozE1yIp6rTSFpfuDmakbswOXIpo4wHZSX1zzKtm7+ZHy5d0Js5NUhwfsjMN6
 BbalIbhyuhdF75W3kqjFG8aPdCX/djulg9A/rCnNaGb1YXdI8Qgwk/dkqxwYx0EBzLQvTkveyjexa
 c9HplbS4fuqALMXaVBQaf1M23FJNbvUjhBeZ7E1hUSMjHxgsvnTwugK28mM3n8Bg43sxdJXudA4KH
 Czk5u8+E/p44UAy6m9qNhj2r7vkFmFBAv9FP2xhEjOsS0NPIxhlB9YhN8baY3uRm8dJRV8OzYDVGH
 mNeHi8O6BMebKUlC2qakm7sJk2dkMsU2mp4/s0KO5b3RE7LqBLVJI/S9yUOwlBHkSrDDCQvUpWcdW
 j+Pt7epiyTxSrf6BhDQR9me4;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ipCPh-0007Ic-JH
 for samba-technical@lists.samba.org; Wed, 08 Jan 2020 14:34:25 +0000
Subject: Re: [PATCH] docs-xml/winbindnssinfo: clarify interaction with
 idmap_ad etc.
To: samba-technical@lists.samba.org
References: <20200107093340.GA7605@sernet.de>
Message-ID: <aa9bad27-fdde-8e3b-5f73-1c139b2fc395@samba.org>
Date: Wed, 8 Jan 2020 15:34:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200107093340.GA7605@sernet.de>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 1/7/20 um 10:33 AM schrieb Björn JACKE via samba-technical:
> review and eventually push appreciated...

pushed.

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


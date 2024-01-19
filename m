Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E056833104
	for <lists+samba-technical@lfdr.de>; Fri, 19 Jan 2024 23:56:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=fb2ifog0AvzIa1zmEGUmwv58TDjVEDhnZaln2MfdrgE=; b=ZLhutKK0Q/C8VnEnrvfNfAKEZz
	AYwxGniTlPBWUiJkf9yKN6oC5Kml0OaaYdg/v+d2nuhoRdlJYIxURpr6kDW5ZDcCD8DQf9LnKmjc8
	GUJ0viWrhodH02U1H8JCT5RwRUpIsnKbT2Iau9KH9jrZytamtYxO+RRFHQQKq09o6PbZHFMmF7a8f
	L8IMDy+ExBtYAIuBt3IlmZeCbddwcbWwb5BMaAtw4OfOFKnLxNgHwzzi/PUj1/2Z19RCEik3pijjA
	SiEOK+7I7JkfJjD1dm7/tWEC2erGNudpNYHXmBgXowEyUGyIqftcbMhp1Nq+meFEcxUAEOariZL6k
	nFoCGVag==;
Received: from ip6-localhost ([::1]:52944 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rQxll-0040ZL-CZ; Fri, 19 Jan 2024 22:55:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33890) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rQxlZ-0040ZE-Pf
 for samba-technical@lists.samba.org; Fri, 19 Jan 2024 22:55:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=fb2ifog0AvzIa1zmEGUmwv58TDjVEDhnZaln2MfdrgE=; b=WSHX3kcFs2h2DPowwhydggnnO2
 3Fx9fDbMhTxcn49zzLwZbmiGQ51dQ62db8FKsd9Ln1vkAiAYnMY4GXCgvAELKkQ3nH5ymazLoA8hu
 FnainK0JMMEzwJWoEZrTL5wFWDNwPeYGGt8U28yZAFC00i5AOiyzXVeqWVLyV1mJcyglRXIGSX1+F
 ZaCM5VGmYCTv9Q+nu9c2cZtJLRADyH3Gfbpk4FLUFELDE1csx4s0Yb39w0mYoWHJcfnMmE25lMhV6
 BRq+7fmwIos8VQRLQcUtkjQFxDnzcr+h8L6tf9xW/KL2Hw4imb1rQ8lhnq1ra7rNIGgGTQnw8g/g+
 hvJPMH6XHKvQLFXvHG7QUortkhoBLhXb3sMlJn9I5dHm+r21/FGSpOfYWy+vrF9YJCt/YVHZi/2gk
 mUZc7JllWhhdZH4CYpwfJJIj8XeU6icU12NJ3HXAvcYD/8Fdfa55krJVqTV3ZZmOFY6WIpjtZvzYs
 jKG80+my6bkrAcRDb/c2SGgf;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rQxlW-008nz9-2K; Fri, 19 Jan 2024 22:55:11 +0000
Date: Fri, 19 Jan 2024 14:55:08 -0800
To: Ralph Boehme <slow@samba.org>
Subject: Re: CTDB and per record persistency
Message-ID: <Zar9zONWdKHqmEFa@jeremy-HP-Z840-Workstation>
References: <DB9P192MB1684F7EFAB5DCC7D2390DB77FE9FA@DB9P192MB1684.EURP192.PROD.OUTLOOK.COM>
 <9872c173-8fcc-4ea4-bddb-c734c10d0334@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9872c173-8fcc-4ea4-bddb-c734c10d0334@samba.org>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: =?utf-8?B?6ZmIIOaWuei/mw==?= <sharingfun520@outlook.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Jan 05, 2024 at 04:36:13PM +0100, Ralph Boehme via samba-technical wrote:
>On 12/27/23 08:40, 陈 方进 via samba-technical wrote:
>>Hello , I learned from Ralph Böhme's speech on persistent handles at 
>>the 2018 SambaXP conference that amitay had proposed an idea 
>>regarding the persistence of each record in CTDB. I'm curious to
>>know if there has been any progress since then.
>
>no, unfortunately not. It's several months of work. I haven't been
>able to continue working on this in my spare time and so far there's 
>also no real interest in the industry to fund development of this 
>feature in Samba.

That's pretty sad IMHO. There are so many commercial
companies who use Samba that it's sad they can't
club together to make this happen.

Come on you guys, you know who you are :-). Let's
make this happen !


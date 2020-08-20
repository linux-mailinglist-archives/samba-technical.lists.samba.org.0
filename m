Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0011A24AF3D
	for <lists+samba-technical@lfdr.de>; Thu, 20 Aug 2020 08:31:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=UZLGXn4xcIgzk9vQC5DZndXRFIYycFdEEkgFLpOYvb8=; b=3C61L2Ciic9mWvGhIMuuJkr/2C
	bfmZJ2H02MdHSvt9QckAisrPJmjhFzJ6Gvk00mrbWDOtpyaGoutZa4X7lZUCOZlABTAiqMF4nHYyi
	DXwwwOZEXVhF2RyiV/hzQsjiaMvbs3K1R/SOnCbXPSGldu76pcL3s62ydQySBdzjWecxcXy02S+RJ
	hyDz34cdWz+t5fmgx5bdnCnYwh9ISaUNFEZWK7EoxJ33ylUX3HKso4qVR3r1fFBMiNomkBbZArf0X
	G9+7Z9MB40eGd67rLCtaSMtV5cy8Y/r8if0kF6tFa7Tqfp4inQe0uSp52wYFLfe3QHAcKaShC3+/F
	bM7g/xaQ==;
Received: from localhost ([::1]:59662 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k8e6S-00ENUl-6c; Thu, 20 Aug 2020 06:31:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58256) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k8e69-00ENUe-K3
 for samba-technical@lists.samba.org; Thu, 20 Aug 2020 06:30:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=UZLGXn4xcIgzk9vQC5DZndXRFIYycFdEEkgFLpOYvb8=; b=Z7WAx8K21FB0jtqh4vblDGh0cy
 E67S377uNQb/ReiYpDu+PxTNy6yKblC5IMDAK6jb2QBel8KSbC+aNXTYTJiI0gi4BshZG+VFmgYVZ
 sockXBzIjcyDLJxzMomaQrhJeKHInum+MjQKq8FS9giOIxt11SRYnlgGZVHhSn+4FTTc1WaeYihH3
 68mnF0BDda87k1dCKO10PJ/LFxek8J/THVbhEnD9G04HO5La557oh79qSB4GbWPoG8KzU0J/ibZVr
 5PnUnV5kIAxhkmWH/lw/0qUNjVE8AoZ5h9tbG4okcBIxoQqx2CgNIzzUzFWOIGaDQ10DT2pEuUk3U
 RdiGpLysotyeN6mI04aMGhXkrPL1MO9elefWOKWcIPIekb19bXfXY+P3uwDPs2KPLShsnza1CRyPH
 Wcgb1xTDn2ACGInW/LINTriAowDR1KK9Mm+R0v+YokYtOH5ynLSo/Q3SzazpubijUflqSfiInpA8t
 zXy4rMaKRe/VyAXcIETaihXQ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k8e68-0001Wz-Fu; Thu, 20 Aug 2020 06:30:52 +0000
Subject: Re: "auto" for Kerberos, a history
To: Andrew Bartlett <abartlet@samba.org>, samba-technical@lists.samba.org
References: <3749194.YmznvRLumo@magrathea>
 <02a8997f-b8c0-617a-2744-c970de255dca@samba.org>
 <88fea226ef46a6f2dc702c74e413860bd3425ab7.camel@samba.org>
Message-ID: <239bf247-b000-511c-cf12-d83a037e3c83@samba.org>
Date: Thu, 20 Aug 2020 07:30:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <88fea226ef46a6f2dc702c74e413860bd3425ab7.camel@samba.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 19/08/2020 23:10, Andrew Bartlett wrote:
> On Wed, 2020-08-19 at 22:13 +0100, Rowland penny via samba-technical
> wrote:
>>       -k KERBEROS, --kerberos=KERBEROS
>>                           Use Kerberos
>>
>> If you check the code, 'KERBEROS' is actually 'yes', 'auto' or 'no'
>>
>> What is 'auto' in this context ? surely using kerberos is binary,
>> you
>> either want to use it, or you don't, 'yes' or 'no', so what does
>> 'auto'
>> actually mean and do ?
>>
>> Do we really need 'auto', can we not decide what the parameter
>> defaults
>> (for instance) should be and remove 'auto' ?
> In this context, the current code behaviour is to try and obtain a
> kerberos ticket, but to fall back to NTLM as 'good enough protection'
> if this fails, for example if no KDC can be reached, or this is an IP
> address, or if the server does not offer Kerberos as an authentication
> type.
>
> The idea (when this was written) was to at least try Kerberos, rather
> than continuing to default to NTLM only.  (And on the flip side, to
> continue to work in the many - at the time - networks where AD was
> functioning only with NTLM).
>
> Andrew Bartlett
>
Why not just set the default to 'yes' and if this fails, fall back to 
NTLM, this is what 'auto' seems to mean. To me, 'auto' is confusing and 
to top it off, it doesn't seem to be documented anywhere.

Rowland




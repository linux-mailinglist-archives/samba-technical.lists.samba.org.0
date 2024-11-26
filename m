Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B45C99D9E02
	for <lists+samba-technical@lfdr.de>; Tue, 26 Nov 2024 20:26:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Net2eq9o5Nu3zGo3PZAXAHrrJk38EhZPInr1ysU5mDw=; b=ll+RiAs83LxSSCEL5ZoVGm6M0T
	FG1dIFA3RfzJwrQ73RLS19N/CDCqcbLgwl19JWzAKhxTgDpu4W5C2QKtYoLamtzy9kDNVC+LA6JP7
	2Vd93Ao2HyPnR8ea9yU6uysysrlHrsEbHFJMQJ51OYW0yMotOWk8x6V6hl98DP8QXQ6/XeO7WMrpy
	AQfxfS4xsZdoc4hYStf4hrVCNPA+2ABc681JNZLWl8f2ljy02ZjfkYKvVmVeC2qFeIPYSbziIAjiv
	iL/GXjnUq3fFYnXSAxwux+SwRV3RrZEWBgW+FqQr9kfbqwTpYyCvpYD8R0wVKeGGxp493iN3RR2Ra
	/G3FmtAg==;
Received: from ip6-localhost ([::1]:40248 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tG1CL-000v8o-RK; Tue, 26 Nov 2024 19:26:09 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64310) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tG1CH-000v8h-2t
 for samba-technical@lists.samba.org; Tue, 26 Nov 2024 19:26:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=Net2eq9o5Nu3zGo3PZAXAHrrJk38EhZPInr1ysU5mDw=; b=ztWUmp9gj6MNpMQYSPHj0JTQpa
 lm0Z8dk/yoHbg2Zo6D9AfU0mtBt1AQBA4ateZ8iI/0af7CEIUkjHFFYEVGvGcOmCastZlqvl3Dt3q
 LexdRyfOPCRaETlqx5hpjTCAvN56Kc+r9N8hvcsbj5D/24OcUzDHR98t2MSH1P2fDtSjARdw6vs/m
 nJsAN14FdtyppOMlStonG7rRvUcHzF6NYhbIIWU/3S/55JAhzq9MrdAVNS8cs2JIknIfUwZ96+5aP
 AxsXd4R9F/dAXjeMbPNGqcnLGfPLF+RoevKcwOdoV/d8wOTP1pSjoDIt/YEFYM0LhhZg7+QfkzPhE
 b1Rlge9Ttm7irVJUIr4ucmfQXB23stXQEYggwAT2CtKxJaPGMYHPhlf8M9rBdrSD8SxluCBqgsA/G
 wtHooOE0nW3dPP0aI9Z1b1t1gcSaAK911C+JuswAPYJbnhdioWhoT2/tRINJ8vHu1kS2f/6wd+qQq
 Q26NOxIIKVehDmoOZJIWSFV0;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.2:ECDHE_SECP256R1__ECDSA_SHA256__CHACHA20_POLY1305:256) (Exim)
 id 1tG1CE-001aQ9-2y; Tue, 26 Nov 2024 19:26:03 +0000
Subject: Re: Status query: SMB Direct in Samba
To: Ralph Boehme <slow@samba.org>,
 Samba Technical <samba-technical@lists.samba.org>, gd@samba.org
References: <9365ea2b-762f-3523-69e5-a1aba8be1c54@samba.org>
 <e9d93df3-b31d-473a-bd22-e5b81df1ccc1@samba.org>
Message-ID: <d2bc30d7-5bff-03a2-62e4-8fa48d5625fa@samba.org>
Date: Tue, 26 Nov 2024 13:26:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <e9d93df3-b31d-473a-bd22-e5b81df1ccc1@samba.org>
Content-Type: text/plain; charset=utf-8
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
From: "Christopher R. Hertel via samba-technical"
 <samba-technical@lists.samba.org>
Reply-To: "Christopher R. Hertel" <crh@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thanks for the pointer!

Chris -)-----

On 11/26/24 5:01 AM, Ralph Boehme wrote:
> Hi Chris,
> 
> cf https://samba.plus/stf-project
> 
> Cheers!
> -slow
> 
> On 11/25/24 9:24 PM, Christopher R. Hertel via samba-technical wrote:
>> Hi, all.
>>
>> I received an inquiry from a commercial vendor regarding SMB Direct in
>> Samba, so I went digging through the most recent documentation just to see
>> where things stand.
>>
>> I know that Multichannel was moved from Experimental to Enabled-by-default
>> back in 2021 (4.15 release), and that SMB Direct requires Multichannel.  I
>> also found presentations from 2018 through 2020, all about implementation
>> plans.  I didn't find a definitive "it works now" statement regarding SMB
>> Direct, though I see that we detect/support RDMA in the interface code.
>>
>> I poked through the wiki...
>>
>> Do we have an authoritative statement about support for SMB Direct and how
>> it is implemented?  If we do, please hit me with the clue-bat and point me
>> in the right direction.  I'd like to write it up if it hasn't been done
>> already.
>>
>> Thanks!
>>
>> Chris -)-----
>>
> 


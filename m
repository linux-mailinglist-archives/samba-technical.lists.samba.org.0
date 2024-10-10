Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 287DF999481
	for <lists+samba-technical@lfdr.de>; Thu, 10 Oct 2024 23:38:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=dKAa47nf+tm02aGWd4dWqKh/he4yj02NgA0Hc3Qu4CA=; b=hG0WYraY11ThA7V+7aOf5YD2Q3
	sR1fozE7PCRrJJM/PLLLRXd/QtUQTZphhiCJUM/d4EVYicoYUx3nV8qD1O3aoA41uX9Z/PpYt5beU
	HHbw0Bl4nT7wfAJASwSXGg0Lddp5x0bvyzYmfH9IM0nq2oLnNHH6IKcCAVLARFdWDNnpM6PMRrokj
	rFlgF7XgqR+dVSvX0HBA+EjwaeGnPsm9GbPUUrzqQiIZ9dfhUGoAHqCnqIiYSsrgumfaql0kDGy07
	GJa/m1bxaDVz/MpyGC0cDnZq1dWRzNmI4Cqtm3hgkelbmH8dyzBjSnYRIZYloL0qdwOTK0k2sp4cS
	pvvLSvLg==;
Received: from ip6-localhost ([::1]:30382 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sz0rM-003WiF-PP; Thu, 10 Oct 2024 21:38:12 +0000
Received: from cat-porwal-prod-mail10.catalyst.net.nz ([202.49.242.1]:36608) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sz0rH-003Wi7-Md
 for samba-technical@lists.samba.org; Thu, 10 Oct 2024 21:38:11 +0000
Received: from [192.168.192.96] (wlgwil-nat-office.catalyst.net.nz
 [202.78.240.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail10.catalyst.net.nz (Postfix) with ESMTPSA id 61BD2D5;
 Fri, 11 Oct 2024 10:21:23 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=catalyst.net.nz;
 s=default; t=1728595283;
 bh=qeUbalxqSW3maOV5rMyGh/XgQKMw2lRG7zXGKB/CnrY=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=YCbHWrW4Lb+fszwv4t3nkHfFLOVRqU4ZhBpKqaxT2+ducIJs7zE83RPD9viVBKhqF
 5MReCLkXduewsgr5Uys5+SdQvyKaR+w8YKO5MtxzfOyHGFUkIrsVEjQzF4pIf72maf
 ujrDG2pg1qnha25tnykAQUyvW0gghzIM8gDsS/mTVFjAxgDEw1jzOeHdsvYZMDa3zX
 sM51RCokjILFisQExhKRpjshoPODI+FQcL3ZkfMXP6zr/+hHYSLJXOupTE2MQ9F5/9
 k24BAdNPKEhmnnfv3iSNyDtgTfKxtQlfuZ/Ve3SFapoZtWgV3iGSlvE0DSpwx3TQbc
 rniJNKcwN9l6A==
Message-ID: <297faa9c-6788-436b-bfb3-8d2107b8596d@catalyst.net.nz>
Date: Fri, 11 Oct 2024 10:21:22 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: authentication policies in Samba 4.21
To: Stefan Kania <stefan@kania-online.de>, samba-technical@lists.samba.org
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
Content-Language: en-US
In-Reply-To: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

hi Stefan,

On 11/10/24 05:11, Stefan Kania via samba-technical wrote:
> I'm just testing how it's going on with the auth-policies in 4.21 and I 
> see now it's possible to set conditions with:
> user-allowed-to-authenticate-to
> ...
> 
> When I set a condition I see:
> "msDS-ComputerAllowedToAuthenticateTo": "O:SYG:SYD:(XA;OICI;CR;;;WD; 
> (@USER.ad://ext/AuthenticationSilo == \"win11-computer\"))",
> I can allow the users from the silo to authenticate
> But in the Windows-world it's possible to disallow the authentication, 
> then it looks like this:
> "msDS-ComputerAllowedToAuthenticateTo": "O:SYG:SYD:(XA;OICI;CR;;;WD; 
> (@USER.ad://ext/AuthenticationSilo != \"win11-computer\"))",
> 
> 
> Am I missing something or is it not yet possible?

That would be expected to work, with the effect that anyone who does not 
have ad://ext/AuthenticationSilo set to "win11-computer" would be allowed.

Another way to write it would be something like

  "O:SYG:SYD:(XD;OICI;CR;;;WD; (@USER.ad://ext/AuthenticationSilo == 
\"win11-computer\"))(A;OICI;CR;;;WD)"

where the XD ACE type means "conditional deny". If the condition is not 
met, we fall through to the second ACE which is a global allow.

There is a difference between conditional deny with '==' and a 
conditional allow with '!=' in the way they interact with other ACEs, 
and there could be a difference if ad://ext/AuthenticationSilo somehow 
had multiple values, but I don't think that can happen.

cheers,
Douglas



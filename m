Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D609B859A94
	for <lists+samba-technical@lfdr.de>; Mon, 19 Feb 2024 02:48:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=f7o2bsFMAmJYjE1pYG5qZWBN2kaqKhi1tfPyfqknCZA=; b=R3KJZqczJwakBU/bNHxKOtZ2+Z
	OoDCkia9blsdF36KqpYzMk6D1eFt1aDxm5/x6bcP5lQZHxtEB+7I1hkyrCvGlmzLCWYcE+a1mqIgl
	PxMz6bV1MRRWFD8TXo7R9ZmkMnHoTZjsOaWskapb6xzfTj6ZLXwEHEtXXlknbJmKjW79lyxIt3aRl
	NYmuHoth7Bz+qCKcXWly220USx+aBZ9geP3kDjJouma/0C9x1PIeuzV7rfXPhI2h8YvxmHJZ8tfYa
	qwvu37P8p3wZpZyNij48CLNP5gT1e/1ov1MZHQqtlWHFQKSfuVN2RPo1fLV31gElPz9bKllBfTXOR
	HWql6Ypw==;
Received: from ip6-localhost ([::1]:45642 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rbslc-008rNL-Nk; Mon, 19 Feb 2024 01:48:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49044) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rbslX-008rNE-O9
 for samba-technical@lists.samba.org; Mon, 19 Feb 2024 01:48:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=f7o2bsFMAmJYjE1pYG5qZWBN2kaqKhi1tfPyfqknCZA=; b=YZ1pEWfi83gnSe8yqZwapLoGTn
 EBL3J9CNHpe5xyuO2HlU06EY9qn2xRAZlTFptmM/Q1ZmaFW0vPCfB0fRw2tMXPJtR6N+nURpMv1XJ
 vaoo2GIhvZvyFXcZ8niH+VDl7NZ1slJDyX2mmm91rHv4/RYz2q4AO6e3ulRz1LTJaxIq7jy7M18yR
 ZaILIhhU8nS0WG5Xf/IfvOvI3EMZQj/fpmgvt83mcF7A3iTQMkiRv3W38EOno5yci4/6RmnZX6NU+
 VHrXGLDCAe9HKETx+EKQEWBy8z9gDopHi61zIjUrVs4CXNMqcgepzzyqqqSsZjfsnXWI+mi0Edkqd
 2DIYw/ng5CG/YWdZhjWb+Mb+WQ5nXNWekRHm6DwD87zo5+e1WcKQ8ZRqxv5HzeiGDo8Kmliyqd41u
 g3bm1ijn69tzf8PTdBoqN7El19FX79iD/+0MlPWCr5XX7/IuXrTgaZgRaoz8NU3mOP0mtqO17Mg8u
 ehW5IaRtFjWFIv3L5XOykH7P;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rbslT-00DggC-2B for samba-technical@lists.samba.org;
 Mon, 19 Feb 2024 01:48:16 +0000
Message-ID: <d7e23578-1526-4835-9438-306da6a95ac1@samba.org>
Date: Mon, 19 Feb 2024 14:48:06 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: setting up authentication policies in 4.20rc2
Content-Language: en-GB
To: samba-technical@lists.samba.org
References: <e8210ddc-4506-4255-bcbe-f24ff86b2f0a@kania-online.de>
In-Reply-To: <e8210ddc-4506-4255-bcbe-f24ff86b2f0a@kania-online.de>
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
From: Jo Sutton via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jo Sutton <jsutton@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 18/02/24 6:11 am, Stefan Kania via samba-technical wrote:
> Hi to all,
> 
> I just tried to setup authentication policies and authentication silos 
> in 4.20rc2.
> Following these steps:
> 1. create a policy
> samba-tool domain auth policy create --enforce --name winclient-pol
> 
> 2. create a silo
> samba-tool domain auth silo create --enforce --name=winclient-silo
> 
> 3. adding a at least one user and one host to the silo
> samba-tool domain auth silo member grant --name=winclient-silo 
> --member=winclient\$
> samba-tool domain auth silo member grant --name=winclient-silo 
> --member=padmin
> 
> BTW: In 4.19 it was "silo member add"
> 
> 4. Set single policy for all principals in this silo. with 4.19 that was 
> possible and that's by the way also possible with a windows DC. That's 
> on a windows DC called "Use a single policy for all principals that 
> belog to this authentication silo"
> 
> In 4.20 the option --policy is missing, you have only the option to add:
> --user-authentication-policy=
> --service-authentication-policy=
> --computer-authentication-policy=
> So it would be nice if the option --policy will be back
> 

We removed this option in commit 
c22400fd8ef961e472ce2803cf4a2ec58b778795. I don’t remember our exact 
reasoning, but we must have thought that it didn’t make much sense for a 
user and a computer to share the same authentication policy.

> The next step after creating the silo and the policy and adding the 
> clients and users to the silo would be adding:
>   --service-allowed-to-authenticate-from=SDDL
> and/or
> -service-allowed-to-authenticate-to=SDDL
> 
> But were can I get the SDDL for the user and the client?
> 

Can you explain what you’d like to accomplish in this scenario? If you 
want to make sure the user ‘padmin’ authenticates from the computer 
‘winclient$’, you can use 
‘--user-allowed-to-authenticate-from-device-silo=winclient-silo’, and 
make sure the user and the computer both belong to the silo. Or if you 
want to let only users in the silo authenticate to the computer 
‘winclient$’, you can use 
‘--computer-allowed-to-authenticate-to-by-silo=winclient-silo’.

> Stefan
> 
> 
> 
> 

Cheers,
Jo (she/her)


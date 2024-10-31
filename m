Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D30E9B8725
	for <lists+samba-technical@lfdr.de>; Fri,  1 Nov 2024 00:27:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=Fsymk85XtiODGyHQl6KzBv4Zbra44yqoe90kz6fotBs=; b=Bs2pg7phO5ICRFrYmGvYmdXa/B
	PDkYkjNLyeB5SQqPHzN9a9AL5MtHhwI0RKOYjymD+QB2PXBymvzB70ablLT/oN9KrP3W/XlaOFOy/
	ktccD7raW1GvmEvhZqz8QzFuDY/r1Kd4eDnDfAaNCpOv1j9U+BNzMU4T98Rm5i5h2UD74JLPmHWws
	d8KApGIfAwifB1YpZlCml8vlNi234MjNmNeB0ANYXhcBoC0KLPBo7wWdM/hiSgVxqMHlTaQh04gEs
	qc1hazscLGPhkURtAEbVFfSLMU0aROeTzdfEERNLJawyUHap4nQTRB2b8GBJhF895Mnt3DOlhnwrC
	IVVYMWFw==;
Received: from ip6-localhost ([::1]:56442 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t6eYv-005kU3-Q5; Thu, 31 Oct 2024 23:26:45 +0000
Received: from cat-hlzsim-prod-mail21.catalyst.net.nz
 ([103.250.241.204]:55864) by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t6eYo-005kTt-QS
 for samba-technical@lists.samba.org; Thu, 31 Oct 2024 23:26:43 +0000
Received: from [192.168.1.219] (unknown [114.23.142.188])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-hlzsim-prod-mail21.catalyst.net.nz (Postfix) with ESMTPSA id 7FB9CAD;
 Fri,  1 Nov 2024 12:26:29 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=catalyst.net.nz;
 s=default; t=1730417189;
 bh=hdEZd+TaRzeGQCq2A/XqeY0CbXQaUwYmHgtQKIb1sCc=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=uEbTgSkiaBHyzjCkHrK9/YEjcyGgfViDfMiESM8RB+XrjYIiN4t2ZYFcqH8AtMtwN
 AUWUsCDA9n3A99Yot9NnnbeKgTR6Ybscqf7qzdrCyf454XRWKR6XOIO6OaCwZ0qG7/
 gceK84aRbc5i6n1NiLgt6WDtdt9PMD+aSs6XzeC4TCEq8DX0prjpDvjHUth1bNvNc/
 Ssowml57ku1x6Qd7AI8qpNyxXwZJzPVlEMQcFlUO5+15qGEb2oXLxqgSwC1vOWaKR6
 WIbdEq0j+xonEi9L45rFA2cSTKLFAZOQaEWTifMVoIgWiQpbV4tNrSK9gabij6yKsp
 0anG4DxXck5qw==
Message-ID: <8d10d3e5-1d9f-48c8-9e91-22a3f4742996@catalyst.net.nz>
Date: Fri, 1 Nov 2024 12:26:28 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: authentication policies in Samba 4.21
To: Stefan Kania <stefan@kania-online.de>,
 samba-technical <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
 <7bf96a40-7472-47ca-b81c-7e9121c598b4@samba.org>
 <68fe1182-281f-42ea-ac18-b0a2bf49961d@samba.org>
 <afa75a49-2ae4-4e14-9363-d5c31d7ef2a9@kania-online.de>
 <b5f3c39b-43c8-4b43-943d-cd851128173c@kania-online.de>
 <5d10619f-c4ed-4190-a4d1-1cec480ee108@catalyst.net.nz>
 <c420e24b-562d-4592-a9df-d0dddd069e22@kania-online.de>
 <ab589c2f-f13b-4560-bd18-7a1e88634a0d@catalyst.net.nz>
 <1a14a7d4-3d56-4212-9420-0affed9ffd18@kania-online.de>
 <0f4e2d3b-12b2-4dfc-88ef-0b52c12bf6db@catalyst.net.nz>
 <70db5ba2-8cfc-42f4-a493-0228954debdb@kania-online.de>
 <84bb05ba-823e-40a7-ba6b-d3c7ec6f2af1@catalyst.net.nz>
 <664df4a2-5133-4094-a233-5c6838413072@kania-online.de>
 <898167c5-b7d7-4bb2-9f3e-979f41608bb4@kania-online.de>
 <489883dd-1318-4172-b0b0-0f379714f927@catalyst.net.nz>
 <cc717f18-2a82-4d46-959c-27da326a047f@kania-online.de>
 <9076ae93-ffed-4f04-89f4-f482c218f858@catalyst.net.nz>
 <8c89eab2-e466-4efe-94c4-4528964f50b3@kania-online.de>
Content-Language: en-NZ
In-Reply-To: <8c89eab2-e466-4efe-94c4-4528964f50b3@kania-online.de>
Content-Type: text/plain; charset=UTF-8
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

On 31/10/24 23:04, Stefan Kania wrote:
> Hi Douglas,
> 
> thank's for separating the attributs and thank you for the tip how to make the attribute for the SDDL readable :-)
> 
> There are a lot of different attribut. BTW that's the video I followd to get the policy working with Windows
> https://www.youtube.com/watch?v=6clJfHTmi2Q
> 
> If you watch the video you can see, that you can select different policies for computer, users or services in the same
> silo. What I did (the same is made in the video) I choose the same Policy for all three. But I think Microsoft in the
> background, is setting each policy on it's own.

That looks like this with samba-tool:

samba-tool domain auth silo create --enforce --name=win11-silo \
     --user-authentication-policy=policy-for-users \
     --computer-authentication-policy=policy-for-computers \
     --service-authentication-policy=policy-for-services

(Again, for people who might be dropping into this thread later,
the different policies are not for different types of client,
they are for different authentication target types).

I think some of the extra attributes that Windows has are just
there to help the GUI tool make sense of it. Let me explain.

A silo is used when the KDC is issuing a ticket to the client,
who gets an "ad://ext/AuthenticationSilo" claim in their PAC.
At that point neither the client nor the KDC needs to care
about policies, and from there the client just presents the
silo claim as part of its ticket. So a silo doesn't need a
msDS-ComputerAuthNPolicy.

At some point, the client might run into a situation where an
authentication policy has a security descriptor that uses an ACL
that contains an ACE that refers to the silo. Here the policy
doesn't need to know about the silo, because a) the KDC asserts it
exists, and b) it doesn't know what's in its security descriptor
anyway, because it could change at any time. So, I think, no
functional need for msDS-ComputerAuthNPolicyBL. These things don't
feature in the protocols.


There's also these in the silo:

>> msDS-AssignedAuthNPolicySiloBL: CN=WINCLIENT11,OU=firma,DC=winexample,DC=net
>> msDS-AssignedAuthNPolicySiloBL: CN=st ka,OU=firma,DC=winexample,DC=net

which for some reason Samba does not have. But I don't see how they can
have any effect -- the KDC reads the 'msDS-AssignedAuthNPolicySilo' on
the client object, and after that the silo object is out of the picture.

> So maybe that's the reason why they have three different entries in the silo.
> At the moment i don't know how to set the same attribute with Samba as they are in Windows, other then using a ldif-file.


I think these don't matter, unless you are adjusting the
settings using the Windows GUI. Which, yes, people will want
to do.

Douglas



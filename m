Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C679B593A
	for <lists+samba-technical@lfdr.de>; Wed, 30 Oct 2024 02:40:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=WQ/zNoJlQ0X4IZo427EGXBkw/h42orG9CiJaMzqsNzw=; b=MITxUSAmTOUDGGQ6PZaR7N1mLS
	o6ILnkG1ovinj3Lz28GR9MuGkNtKtPzEF1cg6dFTSCY+3v5Wbz6cNa0nN8oe7vAHfaYZEsj1mgCcR
	4zALcTcJjvUidwg4okvkJtxV1AmYeP9HNQFEsJEew//tgaW/f52/rEb5mAOoS6p8M8QId4As3LHVB
	Oxtr1pryH7QIt/cVH2RAmlbnN2K1hC1ej/hFkAuhoHXV3fCyZb754lsKDHgA8Cl3oNMOX7MdpiDCe
	cy7FtWaVnDyBf3IyKgke3v+gSNPpYMYtfqVgjAxlnHxZ5g1heouV+ZlQ+ABbzoRx/8FyGfTQQYNh0
	2WCEO5AA==;
Received: from ip6-localhost ([::1]:53650 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t5xh8-005X5Q-Lm; Wed, 30 Oct 2024 01:40:22 +0000
Received: from cat-porwal-prod-mail10.catalyst.net.nz ([202.49.242.1]:41534) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t5xh0-005X5I-A8
 for samba-technical@lists.samba.org; Wed, 30 Oct 2024 01:40:18 +0000
Received: from [192.168.192.96] (wlgwil-nat-office.catalyst.net.nz
 [202.78.240.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail10.catalyst.net.nz (Postfix) with ESMTPSA id 98599F2;
 Wed, 30 Oct 2024 14:40:00 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=catalyst.net.nz;
 s=default; t=1730252400;
 bh=BUeOj+q90MY7V8oKE4UdxuYouAMB4DlTZqdl/nmyNTE=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=GeghhabmHlrq9xLF2qoO2blyJxvs6IrgWjO647PNKm/bYqCwMWAglGtElLPWs7J/3
 b7oj70gSnKF4VEhF7c+ZhHxJ5Quhap8IjK/zwswVubfHgE4lM6VRPHIzqU/VCpFRVV
 H/0+7hn3B5nLB7l5yPOSPVKILL/VgONVUkYYLjCPDgl0PlBxndrSQtQSwRXkGVyDxc
 6lwZO2Roq/MxD+yJXaQLRpha9LXbSHuhCcUy1Eho1hpTHYAgWH3dULrZYpVCX0GODp
 kNxBP/ewWJD66IAAPERBGeyqEAqwLD5uu9mGTn5iyUj3D5n+ovFu8g0M1B9B6M/I4m
 l+tq80JIuSQGA==
Message-ID: <489883dd-1318-4172-b0b0-0f379714f927@catalyst.net.nz>
Date: Wed, 30 Oct 2024 14:39:59 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: authentication policies in Samba 4.21
To: Stefan Kania <stefan@kania-online.de>,
 samba-technical <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
 <48c2847c-7d05-4e1a-9e85-52b1ba5d0b30@catalyst.net.nz>
 <ef60d0ef-25df-4081-9764-5dbc05bfc655@kania-online.de>
 <1eb80efc-4bb2-4b7c-b339-5b92277e782e@samba.org>
 <49b4b9af-033a-4534-90e3-ac633ff8bfd8@kania-online.de>
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
Content-Language: en-US
In-Reply-To: <898167c5-b7d7-4bb2-9f3e-979f41608bb4@kania-online.de>
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

On 30/10/24 06:33, Stefan Kania wrote:
> I still not getting it working like expected. I now set up a Windows AD 
> (Server 2022)to test it and get the ldap output for the user, the 
> computer, the policy and the silo. I will post it here as soon as I'm 
> finished to compare the results.

Here is the next pitfall. With

   samba-tool domain auth policy modify --name win11-policy \
    --computer-allowed-to-authenticate-to \
     'O:SYG:SYD:(XA;OICI;CR;;;WD;(@USER.ad://ext/AuthenticationSilo != 
"win11-silo"))'

the '(@USER.ad://ext/AuthenticationSilo != "win11-silo")' condition will 
first look for '@USER.ad://ext/AuthenticationSilo'. If it does not exist 
(the user is in no silo) this will fail, and the condition will default 
to not-allowing.

In effect this condition says the user needs to be in a silo that isn't 
"win11-silo".

Douglas



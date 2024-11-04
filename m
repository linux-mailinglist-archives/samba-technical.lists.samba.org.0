Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA0E9BBEBB
	for <lists+samba-technical@lfdr.de>; Mon,  4 Nov 2024 21:23:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=8LCAQ6bKNQVMIwCm2Y+Gjv+OXh/MCmOg3lE9Nh6dius=; b=M9smi1aZExnnxD205AU6H2YVEF
	P8sCkYTGyjKmNHMS5B1Q9u+xgvmLNTNh1fxHsJ1u7UdBgSlYDmjR5XUHSTzlionEjJevsAhs16/sq
	kkongwsDB2AMrrqIRYPg5EYvDAwxrzSSuoWDN9TXEo1XFobhRbbkb4y0aU03XDxhwoSWmzE0xvBDt
	VEfboL/+5xQs7uC/Mab8oKAxHQVdweaG+WK2DKSkt3ldZLUAdvVG+12JnJAWcvQ3JhRCOWERHAhg5
	r/kvhDPon9N+xoZu8JpkQkSanIgDp7cjFGBFIZZQKR9CTY9WUdam1xKIbUJE2c+VC3dEfqAfwRa0x
	IPxD1L3w==;
Received: from ip6-localhost ([::1]:55534 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t83as-007mZ0-DS; Mon, 04 Nov 2024 20:22:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24002) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t83ao-007mYs-1h
 for samba-technical@lists.samba.org; Mon, 04 Nov 2024 20:22:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=8LCAQ6bKNQVMIwCm2Y+Gjv+OXh/MCmOg3lE9Nh6dius=; b=xAfmlxYWvMg4Thb5wxkFLx7zu8
 PdnrZbV4yCqlA704M4YEciGF3N29eFKeIygFLrNNA+wZr4ds8YgqEBktM6YjzRIqC5H8JrKp04D+m
 2DuTr3OHZqGE72bhyybDDg+Szs8n3IPMGr0ZquZzTYjP8+oHDTlIdrci1emPQf4PeMBR4sjJUfCRb
 UH5F4GbXUGuUjzsYiwyNsYM/yVPjiTltsUg2qSeNPAWi74U9Y6qg7lMAGuzBofkk3lnVvXfWGLlZp
 nEHROdFUUPcllGlwi9R1lnUaOjMgC1d+zQtL/+BOh9ZhyXP+Us8DuCgdA9VFSNdI4AkaivXGQLaNt
 Gr8vZP4KJXsAqw7Xg4dvIoqCtWEvlZrZbk5LseXBVs8x9CzEFYtJB6MsuiT+/o0CQsAjf6OHUVdfA
 zdXIzkC0Y5LCm2s5oribCqbelROyZc6UIEos3YCufbYJs++5VghKuLR5GG8HwHAnRhyhC4njccs5A
 hvxgYkXTWY1pZ/hmnKLrIisM;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t83am-00947L-2o for samba-technical@lists.samba.org;
 Mon, 04 Nov 2024 20:22:29 +0000
Message-ID: <4e9d2eec-6d2a-492f-8c4c-bab7d66ae90b@samba.org>
Date: Tue, 5 Nov 2024 09:22:09 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: authentication policies in Samba 4.21
To: samba-technical@lists.samba.org
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
 <eb80a2b2-2ab5-4ce3-8734-7c4d41fccb43@kania-online.de>
Content-Language: en-GB
In-Reply-To: <eb80a2b2-2ab5-4ce3-8734-7c4d41fccb43@kania-online.de>
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
From: Jennifer Sutton via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jennifer Sutton <jsutton@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 5/11/24 7:27 am, Stefan Kania via samba-technical wrote:
> Inside the policy (comparing to a Windows AD) I still missing:
> msDS-UserAllowedToAuthenticateFrom
> msDS-ServiceAllowedToAuthenticateFrom
> It's not possible to set this values with samba-tool

Have you tried --user-allowed-to-authenticate-from=SDDL and 
--service-allowed-to-authenticate-from=SDDL?

> 
> I'm missing:
> msDS-AssignedAuthNPolicySiloBL for all members

You don’t set this on the silo. You assign the members to the silo with 
‘samba-tool user auth silo assign <username> [options]’.

Cheers,
Jennifer (she/her)


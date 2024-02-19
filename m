Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 241E685A17E
	for <lists+samba-technical@lfdr.de>; Mon, 19 Feb 2024 11:58:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=a9HWY3zBvz/gRvHYDZT2wor7pq45qCPJ3hd2tlWa3TQ=; b=ZdSvRpNz1RfgEnIa62SVnJsWnm
	5U2gn7aHrcwUREiZ5JWYbnIJbUKbqeICFv8db/wVdeDzpaOf+AKHicZdRhawz9ufRHmQw8rLN014G
	iam9PUzea5EF0EUehhvu9haGRhD7UsWGgw9vuGNt5OdIgEpWbglqPmn/W2hkhQQJtNQWZryMdDznF
	b8B//7bETNWP95JoMssNWC92a6lmBQnq3lDcHSErRPr6Pf9sxWcU53+baKTsDvvjDdpVuGPPpuGKw
	w/fRBXjaLf3y1wJf7iQOn0h6a0NEmq5zLMK7oR8eWJo/cSvPbt3xyOfl5b9vQYcjPUTnqBtlq35VY
	0Ph1hzOA==;
Received: from ip6-localhost ([::1]:61366 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rc1ME-008t76-LN; Mon, 19 Feb 2024 10:58:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28992) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rc1Lz-008t3H-7m
 for samba-technical@lists.samba.org; Mon, 19 Feb 2024 10:58:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=a9HWY3zBvz/gRvHYDZT2wor7pq45qCPJ3hd2tlWa3TQ=; b=q+ZYzu0Zk2wiVr2OQW0f7FOq49
 jaHSVWWjH23C16A6Vkx0iYtSC+4hUUa9Od9Gla4sRno8BIIlgHpKMZxwtdFetFIAUPQwnsIDyVZuZ
 X+y8r2Czj3QfkSlvuTNUskNcVrRnsRJQckcMUK/RgFOcbQOdlzWNfxL+NqkurD/s2j2wzXUpnkSD5
 ahf5GaIulx2OwLPTUT/L4iSYWa360OQwho3KAE8aN/NNpRkGpB74RmEoe9iwzJvk5QwpZTig3xy/6
 AcHaevCpMe2V66aIyc+U662CQNOvO1nRt07rTbIUDDS9CmFZaacRm91NWFdhe4B1vRTIjt/6HT5L2
 0Uf43TwmSVsaNJ+NuNQf4UD4kVsI3UNU8JSGCkTc97turcqdQ/Ey8+S7ozzI0G8PqWLNaVVLUis45
 oDxIXrQrwNYvSlmahF7smPurVak/T3QpinIfYA08TKw/MiPpZOADoGBi0gbaIl4JYDgRUVtf7t9qH
 QKoSB96muTyuy/4/BGn/UCKu;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rc1Lx-00DlQc-2u for samba-technical@lists.samba.org;
 Mon, 19 Feb 2024 10:58:29 +0000
Message-ID: <bc7b6a45-8d96-40f3-b432-f59fbf4b723f@samba.org>
Date: Mon, 19 Feb 2024 11:58:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.19] Samba 4.19.6
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Samba 4.19.6 is scheduled for Monday, April 8 2024.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.19
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de



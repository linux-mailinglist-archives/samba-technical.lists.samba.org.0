Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A98FA92411
	for <lists+samba-technical@lfdr.de>; Thu, 17 Apr 2025 19:31:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=R0Z2KZ5YUVRnUjXkgiFGTuKCjOPPfj4GokH78tgPdkg=; b=NIco+OOGtLY3NduKIppMilTdUu
	5nOQx76w/EOJaNK8ibMyWjeLVrb2fyRoVlbf0hxYYuFh/qi0yaSwmyZsNhxbd38gyLbwMdM2Xzn1h
	7IhvT9xZluaIBzKxIy4e3f3XztblYRpov4UA6L+VeGnfZAOgtHg25lYuRJZqzXb0rACmAXHjjRkJ/
	3LsukPKqWyrJ+wJ/nPEac23S9YAP5nJFXzFHzaEXyxaBGtmvIT/zbtbgqjYQbVeICDKrTov/dWkqK
	wtxMXV2eX6P8McIzUyCN2xJCQkh0ZesLduZVsqCcCmIktA0ZGdrQHrWmYmb9IOZPpfs6n4yngVx0G
	9HABb+dw==;
Received: from ip6-localhost ([::1]:48634 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1u5T4v-00094N-E7; Thu, 17 Apr 2025 17:31:09 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20886) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u5T4q-00092Q-5V
 for samba-technical@lists.samba.org; Thu, 17 Apr 2025 17:31:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=R0Z2KZ5YUVRnUjXkgiFGTuKCjOPPfj4GokH78tgPdkg=; b=oQgQeDNUpdkRaNosNDTpKoQ1t2
 1YV7rjRaHu0DbRLU3MGH88DzyrcmUW6IZ5XpQqwDBJA0jTPZTJHfUvJchc36Erb4za+Bi/Rt36nWl
 izKK3iYWu0lNrsi0Ls8qIdAhF9KVTd3jDnsAE5k+Gg7E7+S03/uLH3Ulgp8moe54zAYxZHxciwZmc
 iFolmlIoR2gePHnHPBFiMiELyDN6Xgp7Fmj+WpCZLlSAKt526Gs1whqO8kInNoH3t6OtCs2hFjfNj
 BL2VbFOb5XOIWLS7a6JNxAKpLsx5ACbg+Vi4+kD+oTfb8BQUpdrEooVElcoVbsZTWLVM1A1r3S4sr
 e4+jSriLARnKYK+OiAuZoudbmwejcqJj/wfucI5xDXma3IlQU0FSmArRaJLtO1dXEgsD8/rTbhL31
 J/ifn1E34vZVMNbYGs5OxP5mwm3ipVBQF+wtlpfdgD8yUQfS6ZjJ8NkkbdUDu6GJML6UgsMCmTewz
 mvgDVPeR+oDabCVmDTw/sd/j;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u5T4j-000OZY-2v for samba-technical@lists.samba.org;
 Thu, 17 Apr 2025 17:30:57 +0000
Message-ID: <43d6d5e8-1cac-48d1-a379-38ebb933f6b9@samba.org>
Date: Thu, 17 Apr 2025 19:30:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.22] Samba 4.22.2
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

Samba 4.22.2 is scheduled for Thursday, June 5 2025.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.22
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de



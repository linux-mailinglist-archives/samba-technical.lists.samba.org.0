Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D067BC7612
	for <lists+samba-technical@lfdr.de>; Thu, 09 Oct 2025 06:38:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=hjEUkzHdPQsIBwoYX7kI3WKNBqDTfeFie7a2NVvXnsk=; b=qHBU58s1jAE4+kbp+q26+1M6iQ
	rxwtkU3VHfyzP1g51cHnyTRh11DTSYdccJtxgG/GdSpnFXOJFZoo2AMlBaplgBi353g9SvNbzVol/
	8jZVa3fxNJba/mmRdACSGnI2M+bHuzIiDfpIp3Z+dTalRuq1nLh3gA0xkaNz8aG0LWkv8/mxva7vs
	0QO1vTAD13lCAvF2sjBEW44c+l5PYUUXrkR+G8mOQSgjEVwzX4srGqfp6UUGfMPynXtvwxF/plQ7Q
	q5++2ANzbNnjJ2JkugunpPW++zE2CEd5N/tYkkT61yM7C8UZfMkmi4795sZqcnMS8zfQvtyNyoJWE
	CpnfOIYA==;
Received: from ip6-localhost ([::1]:54182 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v6iQ4-007LFH-QJ; Thu, 09 Oct 2025 04:38:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13454) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v6iQ0-007LF6-2H; Thu, 09 Oct 2025 04:38:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=hjEUkzHdPQsIBwoYX7kI3WKNBqDTfeFie7a2NVvXnsk=; b=zd+G+swgPPSi3PJSwmouwwPhKW
 NFh9cFveU0tWvokTuH3BH9L6CktzJyIPfWI4FPVzkkxfBUFjRFF+XNI/z3CwAUJY+3rA6cZFteYpC
 a3KrEJyhqGTAYcX3jBlLfZ6zy8SNkTaekeZ5NHYDLFcNLIuoxpAyR7VUpF9E2PyRxzWHh/qVr7CF2
 zrsLvPaCVEVgd1cMcYIcFsor7Wka5WGHd9rXac83100UCzBMZ3TDy2Ev6GQy7HHPdm9hNDobMbyN3
 Zyculg9sV9CUYVb9D7Yj0yKcrU3pQi7pZzMAtM5U2fEzCM6FjGvkBTw4AaASfh6HjeFmcJBZhtO36
 jQ8ZVjHIp25/wD/HlFhwfL0f/jshiR/Y1q5l2SrPXahhsujFhJUJuZSnlG2ubp/CWhLNChvyScM0D
 DuF+gwBKIZWYz0fr/6XlGL8liL0O09f8DkMoK0W9GhaGvdu3qCAlmrQWzSU/VLIfrYzD6l3TOa1oZ
 HNxeakxYcikN4Kg9asEAK9XT;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v6iPz-008FWc-0N; Thu, 09 Oct 2025 04:38:19 +0000
Message-ID: <20f5f042-d3de-411b-aa09-b2c46ee19cc8@samba.org>
Date: Thu, 9 Oct 2025 17:38:13 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-NZ
To: samba-technical <samba-technical@lists.samba.org>,
 samba <samba@lists.samba.org>
Subject: Heads-up: Upcoming Samba security releases
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
Reply-To: Douglas Bagnall <dbagnall@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a heads-up that there will be Samba security updates for 4.21, 
4.22, and 4.23 on Wednesday, October 15, 2025. Please make sure that 
your Samba servers will be updated soon after the release!

Impacted component:
  - AD DC (CVSS 10, High, when using a very unusual configuration)
  - File services (CVSS 4.3, Low, in a widely used configuration)

The AD DC bug will affect very few, possibly zero, users.

cheers,
Douglas Bagnall
Samba Team and Catalyst IT



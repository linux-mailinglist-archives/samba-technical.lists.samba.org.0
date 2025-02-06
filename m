Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F44A2A91F
	for <lists+samba-technical@lfdr.de>; Thu,  6 Feb 2025 14:09:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=RII9YRaqWISs4CKYXq3HQglD8wVUInxXOB+cY9FcQYA=; b=TGfzqSYip5WTJaKK2S25+9HXGk
	EbqAgvStQy3kYGWFzbYXUoVvjDRTF16VtvaM4TuYb7vlyjBwOuB3e+B7oaujsQFJxISavenvBHR52
	bxx368aw9lDiammefjg8cZ/+2hsTlWzEWUCNiR/EspC9UbIZUG4MBl841Ak6NvaVzrDAJ9ol6kAmY
	xo0JbKUZYNbIhnI3m8JonHDpUhNm/q/JtgqMebmY/tNoGCQ8PSXV7njt5WigacbzznXgS1TSwphzk
	UiT41WPUs8EYVLFX37yIkHNAIA8T8324mEv5QWNKSQpoRPEvp8+u9GR6dV1L4iaycbiWCJHcgV6lz
	q2KjQ1Yw==;
Received: from ip6-localhost ([::1]:35016 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tg1dS-00Bu7B-RC; Thu, 06 Feb 2025 13:09:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49562) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tg1dN-00Bu6k-VH
 for samba-technical@lists.samba.org; Thu, 06 Feb 2025 13:09:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=RII9YRaqWISs4CKYXq3HQglD8wVUInxXOB+cY9FcQYA=; b=GGoyBKRY7nEm2bdlOzNwu9duo/
 ZqaDTxt277qlKLX8UgPUfpjml4ErR0b6ge1PQQaXd0MAVWMq0T5xtFBpDO/qjpzayKEgrXgAzC1Dg
 iFGECI9Bh9zhg/D6J5/X2DVJQ1sLnpZYiNlZVGCtrAt8wJHRb4omWIGw2fMM5a11v/r8VQqD7O2iA
 GtF0oxIyXJmJGOL9jnIsIq+Fy9O746MaaOpv4JKWa31xtpeA6UvOfoiv0zdfi5IBObLidYIiv4GCd
 jGN/lb+GV0s/HU4NMy4uuj5peTzfPZFbxfiBOv33Hc252VdjtSOo5TSV214PZholH6EwDod5Yn6Fc
 6PztAci2qBT5v+EhGtMVyEIlG4HH3FRg1XSP21VmaNF0nkkgcMkgsthtNF+PSf4Nzpc+lyv4P5Bf1
 gkkim8/px2DxE5kaub0MJhXwOUmY2XlQ7bGX4MhdZSUCTaAX8WRuPgvm3jKfzoW4V7v5rBybuFSI7
 kxgbA28Tvlgx1Q01RAPOMAn4;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tg1dN-001MEg-2J for samba-technical@lists.samba.org;
 Thu, 06 Feb 2025 13:09:33 +0000
Message-ID: <47a09e41-2a09-41fd-a313-b6249fd29b24@samba.org>
Date: Thu, 6 Feb 2025 14:09:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE, en-US
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.22] Samba 4.22.0rc2
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

Samba 4.22.0rc2 is scheduled for Thursday, February 13 2025.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.22
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de



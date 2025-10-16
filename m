Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 749A2BE40A7
	for <lists+samba-technical@lfdr.de>; Thu, 16 Oct 2025 16:56:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=DeQgkZ5N8TQaatxPodAW4MEX+f6dTtFvDbVb9WAqINA=; b=EQYgHnEE4bDiMckL1zvN3xiMLm
	1xXffWX3bqW07biNKYxrnf40V7oRGgvQ7g8XN5uc8TW48EAJ+KZznMOFNSKYo29YM2kQFGaZubyfb
	HLyCBCWT7hTl01IBxr9dSnC315AAjXMAXPEkj8obcx8aoMXgvR8G8lSLJpW/l/2Xm4asgyNLXy2fp
	mu00WVBUv1dIj07OPxdmVbUTfvZJOfvajLqByzYS+jJzhIwD9x+IERBktD9eW/iEjlvBT1kxHjK0M
	QTOS64lGzj41ODiByKSZ6i/I9BySf7FuV3rFj2ioKSf+jOC5mDPw6UEWAXC/Od7dZjiLqT5/ZpmIN
	YNeHtSVw==;
Received: from ip6-localhost ([::1]:65368 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v9PPL-007z0F-Lh; Thu, 16 Oct 2025 14:56:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47140) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v9PP3-007yyz-Cz
 for samba-technical@lists.samba.org; Thu, 16 Oct 2025 14:56:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=DeQgkZ5N8TQaatxPodAW4MEX+f6dTtFvDbVb9WAqINA=; b=3KEBRhrhG9uzKXPy4DpYllFjaH
 DOb4D4fgXBjKUovy+nRx2hA7OSzpCn9mmR7kJS6ZnVTJsG7m+9+gOrpHO/fGJUm4hdc0C9pzYDJuQ
 qKeC3EnUEU0NByNqxx09V8zkEWo0RagmY7Vg9285jg0ephts8iF+v5PkGupnTf2FJSuufOHW9Tq/Q
 6il7NSHjHGTfJX3a/dn8NpggCStBh6CehGLLLoRB8bnCHT36G9NqED3VpqQrd7SHYWvH7wAlq/y02
 yCFxulOxJ0sB+dlgw1fIQKcUWubI8S0An7ps8813zQ1BnhfGp7l+bAFd9FzrkX95u7KBdxiCETAD0
 dBRBIlfzYTCDY1f/U01slIluBWaQo38recpU2gOX29r9Wzv2o8Y7BASHU9GS1xQDKgFUiAJ4/EfD2
 vosI2w2ZWcs53nZyb5ixAW4UliSovlmNFibXODF/QWGgLKUDKOuffFMzBz+3GdguQZ2vJU3v+N2F/
 b+BNITwP/lgkwE3EN2KxRCEW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v9PP2-009Ztu-2T for samba-technical@lists.samba.org;
 Thu, 16 Oct 2025 14:56:28 +0000
Message-ID: <8ecd77ce-ca5d-4ec9-a485-deb1e0def0ff@samba.org>
Date: Thu, 16 Oct 2025 16:56:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE, en-US
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.22] Samba 4.22.7
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

Samba 4.22.7 is scheduled for Thursday, December 18 2025.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.22
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org



Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D8F8271D9
	for <lists+samba-technical@lfdr.de>; Mon,  8 Jan 2024 15:51:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=Qu+/3S005pB+ynP/Vyn84uV+aS8I0svS9z99NvYDPJk=; b=uTU0UBxJsYP1R7YsLq8R1p9JTp
	jnwao+T1xGW1J3N2wv77Bx7PtOikJFKRfSb+iSPziw2wM/hKgvRTqiTsBP2c+3IjK6vX8jIwAVqUJ
	h1/r8LSGTPOpVSo3GdK7z04RW17r3CjSRPDnH9vjIRjhe2N7R2F26rELVK5g9fjcd6L6YkNVtZsyy
	w54m5vMvDSBX4YtJN/7zheBA9o2oCGjsh7yPU4dc7Jf5hqgppCkBbFvTH1JHjLaDfB0bR21ZMypDX
	b2tktUHyQBLHgb1IMeCcBFSDW9ce0LYVM1Tk4qP3jEe/ZdO63wtT95t7oXJc3LqbyQZ8bnjQbxZhl
	u80Geq3Q==;
Received: from ip6-localhost ([::1]:51216 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rMqyL-002nCu-KO; Mon, 08 Jan 2024 14:51:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47462) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rMqxg-002n8U-1E
 for samba-technical@lists.samba.org; Mon, 08 Jan 2024 14:50:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=Qu+/3S005pB+ynP/Vyn84uV+aS8I0svS9z99NvYDPJk=; b=pDUwZmoFUVMcSoIQXeNAd8cigR
 VaiHYQ9aPGoRb4BR81b/G6uJsNDTjZgNAWhWN92l89+SLOq3+17ZMxN2KYybTC6CWzCQVtPNwComw
 RQPE4DVDzQX1UpFe1QUeuBTm7OEYVoHNnYPkMKfM1VfJZnaS7Re3ac/A0ZXAKHT++eJSqYLz8f8yQ
 sa3/Gqc9+8PGymii92fJXvs3v068xDCOYA9KJwtWZ3Syk+TAWSnHPfAOSqgLRIlC2FKA4md7e0Z1n
 P4ff7SI2Ne7PMtXuR3l0FVfOutnaab6XUVtTyFa6iow9bcT5D76QFi7Hnl7rD8f+x3ZEgmDnaNTAv
 oMqoye4ikODBZF/VhtAdsgOPv4t8BhRoch5CfOul2Mf+XzIhGkqnoaYhJMoNe9UR4Vh90emzdJtKn
 vzoUSlPdTZMJhUSKi4eSdhfpXmwszmbdMFaP9vXaogngvz0PniFAzlvYVes0PCTi1PLoP8YYILc9e
 XWjXbz1kr+jdmNLW2C5jPBo1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rMqxc-0070re-2h for samba-technical@lists.samba.org;
 Mon, 08 Jan 2024 14:50:41 +0000
Message-ID: <83de9ace-13a0-4855-85ec-d88c6e1765ee@samba.org>
Date: Mon, 8 Jan 2024 15:50:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE, en-US
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.19] Samba 4.19.5
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Samba 4.19.5 is scheduled for Monday, February  19 2024.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.19
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de



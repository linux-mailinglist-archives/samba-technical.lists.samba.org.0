Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3AF9D894C
	for <lists+samba-technical@lfdr.de>; Mon, 25 Nov 2024 16:27:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=WA77Ip6XU+Rbxsfbf6LbmqDo5QdzzxJFxucwSqO8cNo=; b=w+SfDOz/cbWBPsbnmookznh3y8
	GYzYLeBwtiGfpWmWZMKVJEXgkO8OXvAOpGPCk1mXMHlQUhhSELoXm+c+1L2s/GJZz8DjtmC6eHd24
	nynSVbpYTMp/QQruDU+yNMyV4y8wKulMXTtA3NapJwZ/AieaVk0S3Bzzqcdpe4t4XfGtj1bA9AFxH
	zaWDSaarf6oE/oV+jJMV88fMgnoZx0U7bK5QxRN7DHW6K7u3mSpJR8/JMu/Vn1KlYEDawGwMCq6pL
	016n2PGSDlSM33sUjyj3EcyJIT+RRi7Kpqbv1WuMzoQ7BeICmmUJy1mYTU7IgyoGy47EvlNfVnxpp
	xtsMy6/g==;
Received: from ip6-localhost ([::1]:18110 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tFazJ-000kff-P4; Mon, 25 Nov 2024 15:26:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12920) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tFaz3-000keU-K1
 for samba-technical@lists.samba.org; Mon, 25 Nov 2024 15:26:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=WA77Ip6XU+Rbxsfbf6LbmqDo5QdzzxJFxucwSqO8cNo=; b=H6PUMVDNolbBLABgWM9FpS0UvN
 jC6X12KKbvmu2rVpwCktIKCheSfZf3Psf9nM3ViV8FnlGuaa1Z65zASGAV9dyQG0X8V+/J0IheDny
 EgRW0d2Q2wxtCo0pXz7JtKb8AgTz/yVsJNJvinvNhf7Ry+gbiGfy3vrMG12/z/74Z4WQwmyjVgs9u
 SCtu1rFgfKqjtl3Zpj+NFj1iIO50SeSsIptNxPZtlOmNXhinVUW4w6dsrtZfIPl+5De03KGxNcXjv
 9pE1dmhKbuex7BlKmqN4Ac5cfbeihEGMMbtii/Rm1Jv1dHgtR7u8k00h3NmYL68cVR8z3VvlCO8Vw
 IqzAlyNxGoFC8s2Egnyp1WbqIwtVhjb6EMVmXD3b+nGhhpkiok4aCi5y5xxJN84ip3mnNliXAfsON
 hweKNxlQM5lkf2PlqVCauR6UawExpXEEzJIbk3bt83zik9Px/jx9gK1PyVgvO0IwxoBkU+2amSeLz
 CndvVbY9aWd9Te4atWkye/lS;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tFaz3-001OrZ-0M for samba-technical@lists.samba.org;
 Mon, 25 Nov 2024 15:26:41 +0000
Message-ID: <bf107b78-fd58-458f-a5cb-a28517437f43@samba.org>
Date: Mon, 25 Nov 2024 16:26:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE, en-US
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.21] Samba 4.21.3
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

Samba 4.21.3 is scheduled for Monday, January 6 2025.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.21
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de



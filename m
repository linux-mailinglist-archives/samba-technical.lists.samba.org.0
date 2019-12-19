Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD3A1260EB
	for <lists+samba-technical@lfdr.de>; Thu, 19 Dec 2019 12:36:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=lvwK1DGz5H8oJLkhFOXYyhiHaJwDtZnGdPPo6Ar+Zyg=; b=yIdcrgUdUYH/j3jPm0id/ODp6z
	fkBWkbH4ZXBbkOfuAfxnm1NtBeUWyDsNEQ9l/omJbX2br7gDyc99hgMRyDCy092skAajVL0RHA7s6
	vpmR8r17fgbcOaeoqdFZJb6DU/Rlu2/kXMa0Q2aFO9kBW7CLWGlSjY6GKwXqdhI87Xa2hPXN6T02T
	6huA0OivyEIuFNHjAEvCmeHIFdj5Jb9Pn6ouhREa/tkEM0OhNRzD/8k9J9wtWn2AoHUSSl9DQtzkz
	VLpHKMe035V7CVpU2vNy/e7JCN97wZPmmgAP8wodqGBUgqdSPiIticDDSsRzPcboiFiNC+1PJcMvo
	UQByIt3A==;
Received: from localhost ([::1]:51482 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ihu5d-007rIj-4v; Thu, 19 Dec 2019 11:35:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48168) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ihu5X-007rIc-TS
 for samba-technical@lists.samba.org; Thu, 19 Dec 2019 11:35:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=lvwK1DGz5H8oJLkhFOXYyhiHaJwDtZnGdPPo6Ar+Zyg=; b=w6R0MnKdmjTVdphhdKn6WAIflC
 lkNnwzzlBsBpSNTo+s+bkSFw+o5e35PvRPxKD4xs0j353bv8KWOstaKL3FfqSsvEdKSBoc/O9RZsl
 Qf7j8SCWZLhwLzhcDKWVv9ez52vTSv298ljQwiPsMK/15vCI7I4PM+Q9peCnT7GBotWz4w3R4/kvS
 tYQokaWmF2b3xsMLk8Sw8MELbV8/yNiwqfBze6Lx+oJ0yCddIh2yNlk02s40DOXJdb0LqA5FANnpR
 wR4xCuLUusBSBY/yhkNvOoBJQsWt1yOIhivEOtL9MmkQ2U20q8l2TRZK26GsOS7Zh7VR0NFfk/Rur
 0LAneWfe5vHSCGRCGEqvkFKLoe17zz2mWCqJFf/KTjptObUHi5ar2PMzHlr5n+wrxvwDv4WO2aYSg
 c/obrpuV43YTJIzFTu/OSAz3TXp9iG2gu2qlU38kJcF3AOaaNR5OGqVwksyKpJsi3od6zLOwjUR3n
 HcdQzknZn7RFDq0GNFZBgMWC;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ihu5X-0005Vi-Ed
 for samba-technical@lists.samba.org; Thu, 19 Dec 2019 11:35:27 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: [Release Planning 4.12] Samba 4.12.0rc1
Organization: Samba Team
Message-ID: <cb8a8065-cd6b-cfc1-8de8-c156eec9895c@samba.org>
Date: Thu, 19 Dec 2019 12:35:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Samba 4.12.0rc1 is scheduled for Tuesday, January 21 2020.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.12
has been updated accordingly.

Please make sure that important changes end up in the release notes as
soon as possible.

Thanks!

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de


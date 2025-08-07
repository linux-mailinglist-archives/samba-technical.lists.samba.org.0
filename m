Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CA8B1DADA
	for <lists+samba-technical@lfdr.de>; Thu,  7 Aug 2025 17:32:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=xFKP7gQqrpuA71MFNgVajs56MVoex3Vh7wUUKQhuh/Y=; b=JY/MhPnEHYTgc5pea9U7pmForu
	aJ6xwSeifsDd+DCX8nJnWgO1jRwIsk1mYO5wGM/XXOfPZRlzAnFNFEF1JhTiFK1q33KKgDjDpAxV1
	x29sQfLqwuNx3odkC0Uu0bSEMtqeZXknnnEgOHsIAqzwgt2lUhGequKioGzxC0wjZpT612YcEn91g
	2jTciNuEJCYX2EhAQnJ309BZ3FcnkYs1WWi/ShAyeTECK5uMX67LTNdegW6FpiA3pk5NmbIuiWQGS
	9OwzOVLRKUeKifPDX4OxY6+fiIvYyaKZjphDpS1TeKwkkteJw6VXCsOfM2Gh90j/mmbsWW3gnoeoC
	2uL8w8xQ==;
Received: from ip6-localhost ([::1]:50470 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uk2bY-00EY7G-RN; Thu, 07 Aug 2025 15:32:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15710) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uk2bC-00EY4i-JW
 for samba-technical@lists.samba.org; Thu, 07 Aug 2025 15:32:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=xFKP7gQqrpuA71MFNgVajs56MVoex3Vh7wUUKQhuh/Y=; b=00ZpkwZ9pBCNJTiqxTo8pwAkQw
 Mmpw2I1Vi0bFfu+SczCrBjWaCwZZKeTJGrb9XtYZRNyHGNCsFcFSAe1uDKIX38giluoC9Re46a0vW
 UspCFnVepMh8RilHNgRpdDWHnl/Axtz83kfdIc0WtOAHKZJZZ8jpkTiA4v22X3sCzHOf1FYJvROTV
 ZDfVG2oRJ2drzEr2h+8QtIJf4p2G9hIGDXSXuAVnQUJ2xO0tZUe4vMQdm+peECPxvT5mtdw6ywLcU
 SU+Bff+pVpRCgMu1DhUCkGJVlr91YVhF4BeXsaBQcWrmPb7ryBp1a6Aw/EOYkF7/BOv72oYsvP+Jl
 BAe4XUV1b6ASYQPE/5qeIdNmhTA29LoCV+cxo+UM6wmptqWYGsR3G7GC2h+fjcum6Dh/VxSegMXKA
 q7rUtarvEBejRJtdkYnMSpeHJYgPgvx6nLAnnTsAPAX4LKGzEW6e3fnv+kNUYP/pAGpv9saJiCisp
 O4doq1jGAbuyrLzxeUSnF1kr;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uk2bC-001bzE-0x for samba-technical@lists.samba.org;
 Thu, 07 Aug 2025 15:32:10 +0000
Message-ID: <bb3a06b5-0ec5-4c97-b276-3acd6a85caa5@samba.org>
Date: Thu, 7 Aug 2025 17:32:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.23] Samba 4.23.0rc2
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

Samba 4.23.0rc2 is scheduled for Thursday, August 14 2025.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.23
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de



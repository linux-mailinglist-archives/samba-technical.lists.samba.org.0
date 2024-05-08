Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C87908BF857
	for <lists+samba-technical@lfdr.de>; Wed,  8 May 2024 10:20:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=+3Vz6kkRXl3XmYD1V+MtoJLViHfwLZBLgiqVUneUdfU=; b=jJAgx51B5OmfxoojQXV036Dpc1
	eNO/1UmXNbnokWnGIL4L4Nrwun2/wWgClFT3ZfY35TDne3ZMq35/1nSBVkDok/bXC+8B1gj3+872g
	G+OwrxqLZSIcs3e5cyolVVYBG5WPgKn70PnW7x5hVNSWY/5OuE890fgEm90YLkJuNNyBwv0lnbjOc
	7sxz7KYtBxUvrJ3FJgvfSYBT0j/Y/CP/cNOchdESfpR4xP3Lqa/N/OCga4zAn5FfsZ0Dteu1xlAot
	ZnLXyo38FyyZf3Rf+dKs55lq0MIXzN84/Bfj5Z2ExEUOr4GLcegslsi6ImkCgMwoYIZcvKO2AvVU2
	MOxw0CFQ==;
Received: from ip6-localhost ([::1]:62060 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s4cX1-008UkT-CM; Wed, 08 May 2024 08:20:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61166) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s4cWg-008UjN-TQ
 for samba-technical@lists.samba.org; Wed, 08 May 2024 08:19:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=+3Vz6kkRXl3XmYD1V+MtoJLViHfwLZBLgiqVUneUdfU=; b=M0gaANii6qVMAfgtVz4Mj9AQw/
 +jaoyxPO2oMURmTlIVN9VHKR1v4kbGv8DjmCiMGyWcvAJX7IwOLYDoYjk+B99kMnpprDP3DZEwyZy
 bRBRDSFUUFK5zdGZD/+KOI23J0Livfx3V8ATBn7gXh+d8r87ndu0ZV6dWPj3/AiizeLvlNq+L5S2U
 paAZ3PRo5a9+KXwTGzVa4z4OG5C5zq4SzrvadWPWRxdedwfbSLD+BSZ3DM4CJJpx4ehs7VESU98Zx
 7AZoWrh+etZdWIHSVEQNe9yu7jEKRAkwiu97RYiC38v9LBSGbL8WFmQhIet/h/jN6y6D/BbNSI5jf
 oyk4ci1fn3sXvSd1KQNpiC8kAj1q16IuAyL5o1uzp/n02t9bgnvU3NJ1Kcyf16zt5OrmcErnlnzSX
 3q2FWVWGd/+il/cqhyl5ZYQZzfXQvEAEGGCHjuL1ZiqC+IuTlJ84KZSVTzbVms+6dKkJKQxMN36WA
 QbK0wXO3SpKHb5C6LAwad8ij;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s4cWg-00AOVS-0p for samba-technical@lists.samba.org;
 Wed, 08 May 2024 08:19:46 +0000
Message-ID: <f55d4bc2-bfba-461c-bd8a-c3780aeb2556@samba.org>
Date: Wed, 8 May 2024 10:19:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.20] Samba 4.20.2
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

Samba 4.20.2 is scheduled for Wednesday, June 19 2024.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.20
has been updated accordingly.


Best,
Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de



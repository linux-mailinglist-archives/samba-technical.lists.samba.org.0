Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5927917F3
	for <lists+samba-technical@lfdr.de>; Mon,  4 Sep 2023 15:23:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=cWPPECLpbvEgjkAxa3hmDBtRQjQGY9eAZmM+AFAtmVY=; b=jVqCocETD1H5C9Myoi34ZdDvR1
	vuWOjn0jaZ/qgCbrsRFIFLWVLD3MWqIFsz/TTmlWn9Q7fYLTSEUB+R/yoSThimaSlDdtVuMZgrxgD
	358L1yYN1WvVyYphzyiT9oRhp3FN94ljMmhZy2/W5qSActtyqwQkLfTCYeBxPLvz3xnTwub+98KKy
	0RHOar/tmPYC6xo0/99SQG32ykRSMX6DxGMb0oNjRw/H/ylUX+0FW2FL8RD1oL1s6ednzcH/aTu5+
	WpPH42PKy4Egdv+kBFyLJmXDRh8/s570iqZ3n+4fVjsH0Mm2pZkeSJu86DOohMI8e44Ltab+XPGwK
	PdoiuH1w==;
Received: from ip6-localhost ([::1]:49892 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qd9Xb-000Mc8-LE; Mon, 04 Sep 2023 13:22:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34666) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qd9XM-000MRL-RK
 for samba-technical@lists.samba.org; Mon, 04 Sep 2023 13:22:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=NQF0MOWX4VZwDzVXQ+deZMAUkhf6XYJZ2V3PNr7BMt0=; b=QRDJtTrZXYkBw+8Mf4XCocdosR
 4BXpOg+a7zM5UnGQl1xSRVl9LzoyEFykPb1Sik+rKI4yVYHOjNXX3qLa6L2wXHD+TbmPz5s+DBxnW
 HVb9DTLrqYod9OC5WMCSbcTAJ3QbXvST1bT/uEDLVDpYt5YseR1Rn4fmKd3vkxTVHaa/CeXHvmJY4
 m9PyG8Fvs4X9tpL6L53+4+CbCiWnUFclStaSdyyjq4KO2Jsgkuv+QPv0TDyScOzkRyfqJaPfmLpQl
 0GFGE8nqIRm+QKh3bdYNbQmE5QrfSDSBBtkLyaaM4Eu1lMGszKoZj8viXxcxQiwhkTrtyL6Mtz3tn
 r1rbPcfzRXZs1LFiCk0XoeduuKDim8h7V7ejf2ZnzsE7up/hNx7AfaiNgqjkEgtHjJAcilGH8maiH
 kVZG2yXo9CV9D+XcQLhmwncK19FEa6mzpR3rxSvmks+ccRDAH4D/M3cLFdJ4wT5CPXIl+mZWbHxoo
 xV5g2oj5L0SbwYi09rd1ai1X;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qd9XK-00Bioi-0H for samba-technical@lists.samba.org;
 Mon, 04 Sep 2023 13:22:39 +0000
Message-ID: <5e16b9da-bd3e-ce90-ccc9-f2340addd028@samba.org>
Date: Mon, 4 Sep 2023 15:22:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.19] Samba 4.19.1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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

with today's release of Samba 4.19.0,
- Samba 4.18 has been turned into the *maintenance mode* and
- Samba 4.17 into the *security fixes only mode* (there will be a last 
bugfix release this week).
- Samba 4.16 is end of life now.

Samba 4.19.1 is scheduled for Monday, October 16 2023.
https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.19
has been updated accordingly.


Best,
Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de

Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 704528514B8
	for <lists+samba-technical@lfdr.de>; Mon, 12 Feb 2024 14:19:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=8qpotoP4Y4RmLrB2eZWbqiFh+CvPzqXJxeGpEfDcHak=; b=Y84p7DlcQUP/3cJbsn9JSMvd9p
	YBd9hyibGiDfvA9IgqivdyZnoUAS+At7zyXZuTGRY//9LkCZJ+Doa3Gey3Gbsa0ZAdm74vjryPSGY
	Jnbe515s1wRCiHb3Kfxa0wjmPjGkQZPCMPSa4cN4TNP2n885795fqH/sfcZwUL1bk2CEb4ijNNhHP
	v9FRO/3izB5+v4svuAuKMl8veQCnKTSioCwW0TAeoQkjwReG5wgfQBlZchvpq3MOenpXBEiwryrXP
	sVgl7MgX6w/3+HOAtHUM1FZLzc5KKnbMSC3w3exptSo7TXr/GJclfGghj8fMkM3160fECW0U2Mjxw
	VjNYt/oQ==;
Received: from ip6-localhost ([::1]:52202 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rZWDL-008H7g-5w; Mon, 12 Feb 2024 13:19:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:19898) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rZWDB-008H6t-Gs
 for samba-technical@lists.samba.org; Mon, 12 Feb 2024 13:19:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=8qpotoP4Y4RmLrB2eZWbqiFh+CvPzqXJxeGpEfDcHak=; b=K3g9cMaMxp2Ab9fVWX4DYg6ZI4
 aMGncRkAVx7eOBUedr9Lq31JImGbbk89bgBX4J1sYsofdD0xJFxFqiNeoEIbvEiza39vi5RpytFi5
 lmfB7IjAqrTbVecRbcykPqu0QXshsJ3RoDjNYWyOm4of2024WDplfdn24fhPFYmONHEcV8NlYJz5N
 DP8HQemdQUQEZjj/Rzbh03+gX/NOfUjbfyFt5b6SJn9dXLQHmwyqqL0btJb9EZMqNu0THzeQhwySN
 hfQsH4YWKnxOGhQX+dYVI67DBTkvk3eAQGcTKfCuYws19mhkDplW3mn7Fe239K3QIIW2z/mNGTR0d
 OQ9ytWOUwHcnBQFbPnqnYXP+CNx7rcAjpOpkB1Osg4C8uQMmoexFbKPCYiusV/4ZswxRFcP7v5w+R
 hSG7UBlc0Qw0fvmmJrW9qzCE0NWHcjd/dlTzzqR0LUAFMAfNteMs26OWzJ16JeGAnpqcw/BRQ1d9q
 X48OWrnkDOGgB3FPb9T0ZcLY;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rZWD9-00Chs8-2I for samba-technical@lists.samba.org;
 Mon, 12 Feb 2024 13:19:04 +0000
Message-ID: <f3b7987e-04f1-4a38-9077-24b4dccc9ff3@samba.org>
Date: Mon, 12 Feb 2024 14:19:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.20] Samba 4.20.0rc3
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

Samba 4.20.0rc3 is scheduled for Monday, February  26 2024.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.20
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de



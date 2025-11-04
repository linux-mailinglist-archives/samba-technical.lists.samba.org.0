Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 767F9C3058F
	for <lists+samba-technical@lfdr.de>; Tue, 04 Nov 2025 10:52:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=DBveFsh41PrYMdJe3QhZW5VWXkGrtsmf1E7MedGEa0o=; b=XEDw4OrmhViotudALgwskHRDqY
	pDXJBIayoE0PWrW4/9K5FWb8KgPXFMLHrtoaeficPw5oz/q4rGv7+BqIv9V6D4Fsier5RJwOmIuU0
	kfbQUB93zi3+gFC2Q2Aw85w5thAkX7rTTOfk23uBsAz35oT79S1VcgJ3kTXOeUQx+egcXWHr9BZIS
	Lujbe/vAMt793PkIfKApzqdW/r6oaMiVICQAcU9zbmE+4aSmtdnhjQPwTsi4me0EibSIYpi+L+wor
	gBPrklES8bLD8nm2Gay4gJLEBPpR4nfS7ydX6E04v7ZLOecnfo/wwXHH464lMyNPRs1uj4cgjd1de
	myaVy28g==;
Received: from ip6-localhost ([::1]:54180 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vGDiA-00BRds-DX; Tue, 04 Nov 2025 09:52:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37460) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vGDi5-00BRdl-Pd
 for samba-technical@lists.samba.org; Tue, 04 Nov 2025 09:52:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=DBveFsh41PrYMdJe3QhZW5VWXkGrtsmf1E7MedGEa0o=; b=LprvGLOcuk7ddrQg//0Hblo1N8
 Me0GaKXnDqJIdSjBYQcMz0YPGJ7gQUC5fZYg2bF4DMTf7f/qnZoVpSRhDVd2LokSAxxCn6XT03x9F
 Tg3dbDiH0h694po/MvfwQzLmu6aRjZBh7mGXGNVIAj60x5PAk1zpCZDgbK3acwGH1tx3ZYCGbIquT
 21lgQb8FNvJGk5C6iPzMXEgZzWj1Bw5GLQNVrdKozicEMzF5kNbxXdKawb8YLEDTXudh8aZkCApD6
 D/9Jg63shcMZeEyjbY3pye+mKW8BwaXFDRtqapL5be8ek2p1f/7lRKD7+KyL3EEHKrakVDHSTtLhp
 wAawb6iMpJpUBDPUa/tZCovzxtgeU6M/oYQd/W2P8jciWyDhAvx7oP/WOt+6mpFUorqNqOM3UU4Bh
 nHOxl+fM5mDj/bT80tXHSakByaJOZWdTBqOHMwqJVV0tE4o5aZZHJjAsYeOrgXMifax1U2uap4D64
 j+928G59B2kJvZz/OQkWa9od;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vGDi4-00CVT7-3D; Tue, 04 Nov 2025 09:52:17 +0000
Message-ID: <657cef07-c75c-43cb-99d7-78e7ee9bf955@samba.org>
Date: Tue, 4 Nov 2025 10:52:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Top 20 developers with open Merge Requests
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
References: <7684109.rdbgypaU67@magrathea>
Content-Language: en-US
In-Reply-To: <7684109.rdbgypaU67@magrathea>
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Andreas,

> together with Claude I wrote a little python script:
> 
> python3 /home/asn/junk/gitlab_mr_counter.py --top 20
> Fetching merge requests from samba-team/samba...
>    Fetched page 1 (100 MRs)...
>    Fetched page 2 (100 MRs)...
>    Fetched page 3 (21 MRs)...
> Total open merge requests fetched: 221

Is there a --no-draft or --only-draft option?
> Showing top 20 of 88 developers:
> 
> ================================
> | Developer         | Open MRs |
> ================================
> | David Mulder      |       25 |
> | Andrew Walker     |       16 |
> | Noel Power        |       11 |
> | Jennifer Sutton   |       10 |
> | Stefan Metzmacher |        9 |
> | Björn Jacke       |        8 |
> | Ralph Böhme       |        8 |
> | amit kumar        |        7 |
> | Andreas Schneider |        6 |
> | Andrew Bartlett   |        6 |
> | Alexander Klishin |        4 |
> | Andréas Leroux    |        4 |
> | Günther Deschner  |        4 |
> | Pavel Filipenský  |        4 |
> | ProhorP           |        4 |
> | Shachar Sharon    |        4 |
> | Oleg Kravtsov     |        3 |
> | Peter Eriksson    |        3 |
> | Vinit Agnihotri   |        3 |
> | Anoop C S         |        2 |
> ================================
> | SUBTOTAL (Top 20) |      141 |
> | TOTAL (All 88)    |      221 |
> ================================
> 
> 
> You might want to look into your MRs and make sure they are rebased on master
> and find a reviewer for them ...

Can you put the script somewhere?

Thanks!
metze


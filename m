Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1420097B1B4
	for <lists+samba-technical@lfdr.de>; Tue, 17 Sep 2024 17:11:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=hWp/4f3CIEiFHTTZ75Fa2ZKWCKe8rg2HCsXk343McKk=; b=vYwiFrp8dWmJlHDUyLOWCW1Q4D
	n+20rJfl2QmCI7I03ESBHmo8SiYAkBD6F5s4l2JjO8yO5Lme+xCphs7QX51CTl6tP+720ljA07YD8
	c5gzanKCgResSn9ReZTS/UoSL/T3PoGhZ+Y99y1prgSDsiOQBKtwacY9Hvl9jHyEI3fqm8FNafRxP
	jcaT/FhnSh0bYfx+kGJAx7cODUKnP/q/pRGCdUSO9g93NuO+soLtY0YZ3B3wSh1pGctBE/5ytHa85
	JHDdHK4nf99IhNPT8gx5MrOlchPh+AcF15dyd4xoqzJnR23qDkF3HPzo+++fFZvS3LXx/mtNPa59d
	XCQkuVHg==;
Received: from ip6-localhost ([::1]:47698 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sqZrR-000CKu-Nd; Tue, 17 Sep 2024 15:11:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62468) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sqZrN-000CKZ-81
 for samba-technical@lists.samba.org; Tue, 17 Sep 2024 15:11:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=hWp/4f3CIEiFHTTZ75Fa2ZKWCKe8rg2HCsXk343McKk=; b=oGCV6acqXK5Bkpj0lApBhQOxwA
 kCqUGdK3LzlHW8/F65grCmTTKj8jhKs3GphS4Js4IX4GIaQo8+Llv8+sB3l6GYNdlkP5xgWpjGqMZ
 J59PPM+AviJrPnRVEB4+hqCqmtwqQfKdT40WzmcyhsFovskFeq8XTCsCj4aWYY6N+MTp8rhlBc+qK
 mLIQ4CR2wOxnayP58CkSdi+VAxRFf834sCxDg748vVZKOaxegAqUfBeGj+jCb7RwrbJFSIz9AHMEA
 9NjU81XmNutW0agjgTWUXq6NFv/Kp+Gz4xmf/Jw0Ybd6rtwbECTgwdJ30+nwIr4b48exM8Yrmbq6y
 vbEZn0sb7JhG1GewWTGVWuqVSZ+3Uu91LJ/KgEV/nDhBgKKkQ/N4TXZf4C6ictxZW/Xjp3VUixqv7
 D2t5WDBsQR0zvkbrskMJk3Z1vhguqfA+SP8q8VZpOXuExUlEiQH/kjIWJpSIMTqHIZuV37MVvfhfL
 LBikwiq++rKZeaWkFmFOcbkB;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sqZrM-000ZLL-3B for samba-technical@lists.samba.org;
 Tue, 17 Sep 2024 15:11:21 +0000
Message-ID: <5c2cf047-c18c-4eec-ae09-c9783e995b49@samba.org>
Date: Tue, 17 Sep 2024 17:11:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE, en-US
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.20] Samba 4.20.6
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

Samba 4.20.6 is scheduled for Tuesday, November 19 2024.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.20
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de



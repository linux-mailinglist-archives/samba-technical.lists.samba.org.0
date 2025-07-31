Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE38B16EBB
	for <lists+samba-technical@lfdr.de>; Thu, 31 Jul 2025 11:33:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=VBDXT4d9twXf0WAw00ys5QYe25c59jo9xvEbnXtRDTQ=; b=ezfnWGQ6bhfV3bN4lLM1eRLvTb
	Qn3atuWIo54C3KzB0JyLa8WnxzTWVP3/TVJ9cOdR6iUrUNCmqFod5f7XbUrM4DegxsK23VCc+pTIq
	H2xdgSWy4nCCi/KbyNDBY6/9N5jKebLATvTcdpKeGDTpG2ZuiTEyYCWxq1nkD98nYONAeTdzSwzc8
	ku1+Q/NkccfOu3w9uIKlEcVCY9Q1VGBSM2EhrF9mjJDQsDS4D/Q2lyeR189m9XEeF6MkF6KOlQTrO
	q/0jGe8MNL6vp94mwyFGseFpzB239Q4EjYChkO/evk6ydf1nYDC8b/cETnvFzqyuurzKZR06MI1qY
	kyPie9Iw==;
Received: from ip6-localhost ([::1]:58460 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uhPeX-00C5ho-Ds; Thu, 31 Jul 2025 09:32:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40594) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uhPeS-00C5hh-SZ
 for samba-technical@lists.samba.org; Thu, 31 Jul 2025 09:32:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=VBDXT4d9twXf0WAw00ys5QYe25c59jo9xvEbnXtRDTQ=; b=lgvihNhb6yHEAA0ep/ANZw4tfn
 jzE4nZdPKp+XC/7Q4/Lc9B33X02xh9HjSq0qHWgtIbDYGvbkU6xGs62CRhXHJ7IPkuA8ydDA4Su2x
 B5R6GQ7IN4zRtWKSyV0vPepEgVBBvscOqXvStHdbSTg3TD+FT3jun66Xv+kdpyrQooGEegQlvoG/H
 5DZOktj7JZLxI9ZSX1Fva/Cl/q8x68X+WGoHhb+TuSRz5t9PdYK3TMXYagsJn5mVtkqGJpL/YErAv
 dCzA8tR9hrNYScxFizHafcO0vapoN93XZgAlAn+dZ+FkBazpJ4uIumws5JElEhxvcjX6au92FuqXw
 g/vXKBgbSv8ePnOtZ1ZMqqGBg7AI0U6M4UG+t4m9r4w79Ut7OdV/UIczlG1SOb8CZbAaqoUnwHyiq
 fGaKfm0o6+IGrEKLhLrMWmgAivGNfb7bRFVwwBAVW9NzSUOULVgu/aJMqsN5BwfgTq4RKD0cNYc/T
 BUTsq+4vA1d7Ik8xNJdvsEKh;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uhPeS-000Kcw-15 for samba-technical@lists.samba.org;
 Thu, 31 Jul 2025 09:32:40 +0000
Message-ID: <393ff584-9d8c-4659-a1e7-4c598b273165@samba.org>
Date: Thu, 31 Jul 2025 11:32:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE, en-US
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.23] Samba 4.23.0rc1
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

Samba 4.23.0rc1 is scheduled for Thursday, August 7 2025.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.23
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de



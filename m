Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 837FB57B21A
	for <lists+samba-technical@lfdr.de>; Wed, 20 Jul 2022 09:50:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=C8WuN7ptdtUP9qncai0eymBfxJCvjgIMB+llhRWP8Ug=; b=XEHkBnnKuTcqhkmJdgFRaMsoZc
	5JNxDNk7XznauerRd4w7KtGJgvlanKinDMwVBCZF7BmLXMvf6BSe2PjsdhbTaouWm01j4k7Omf8mK
	IEwNF6581sdwYxZ5Lr4ytHAJOHrI2x41BPpJwd3g2v6CHCY7EXNdZZMLbZ/bKMEbnKJyYTgx7YRYi
	WB2pAMXCr/LhRKG86iST48vBUWn0CCs7j8PjFrqDpO5pQNJg2cGvjwBGoR8KQY+0VJ1W7NgXkzj9h
	jN56uXmHwzynio6+jGUG/40DdLePBVQ+XhGtDlmjL+/eglawn60jvcB4SLfceUWFLA2Cl02VdKf61
	CycU/ONg==;
Received: from ip6-localhost ([::1]:24290 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oE4Sj-0010rX-DI; Wed, 20 Jul 2022 07:49:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25248) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oE4S0-0010qx-TP; Wed, 20 Jul 2022 07:48:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Cc:To:From:Date:Message-ID;
 bh=C8WuN7ptdtUP9qncai0eymBfxJCvjgIMB+llhRWP8Ug=; b=Q2rQig+T1jHz6YwurFmsLw5/OD
 2yDYtfZM+SnWO4mmtS8laaKouFCGmnfqcuMRCNRDuSGQZbY7bZ7GlbiCreWmyh18fnQkpo5envweH
 kk1jMwlmmJ1TERiH8ZnEuOWPFDAa8ImRJ7cIV/R26TMxvQCmGVsblsqtoQPRtPV6UWfSoPXSPjCz0
 NOGwFVtW/EMSi/1fWsJwQcUt41T0nSm502iPkqxTyQjrJ9Eyg10PQgKZlRvg+UcSUuvZi0EdHqMkj
 8F/4owaniOHogPGgBZq1Dr06rrYCSq3H4RX5Cgc6tBh4JEEtkPjxXqHVmgHrUoam5e07U9KM7MQv9
 Cvuku4U1kwsLD96IhEWuKuBevBi80clVnGG9gYMuMcgMetuJ2/NXB8eksz5qWoavMJMeBYTdm0HOj
 kYIZj/k3VtL6mwKL97IzCPIKNyEifI4h9HbVq5SmDxIvAFCNMpdB6jLkbW03XIlYtVlRVM3TglW1f
 /44+yXob+o1rXjM42AHthYqn;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oE4Rz-005av0-Uk; Wed, 20 Jul 2022 07:48:56 +0000
Message-ID: <486e031a-ea36-c5fa-aa83-904a55277336@samba.org>
Date: Wed, 20 Jul 2022 09:48:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: de-DE
Subject: Heads-up: Upcoming Samba security releases
To: samba-announce@lists.samba.org
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
Cc: samba@lists.samba.org, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

this is a heads-up that there will be Samba security updates for 4.14, 
4.15 and 4.16 on Wednesday, July 27 2022. Please make sure that your 
Samba servers will be updated soon after the release!

Impacted components:
  - File server (CVSS 4.3, Medium)
  - AD DC (CVSS 8.8, High, and CVSS 5.4, Medium)


Cheers,
Jule Anger

-- 
Jule Anger
Release Manager Samba Team      https://samba.org
SerNet Samba Team               https://sernet.de



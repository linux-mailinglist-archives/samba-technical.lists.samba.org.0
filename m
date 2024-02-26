Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8CA867402
	for <lists+samba-technical@lfdr.de>; Mon, 26 Feb 2024 12:57:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=r1/vpwSDdPdVQw4J7JGI+G4zZ7i8r/NFewhNIhetCg4=; b=J31bhPjSiTORmU7iErPlleJPG4
	CiLh6UAVgNjMtWQ2xG5MGCjPZ2YjjkJnaJ83n4J8r+BKjWSjoHD2LeA4H/oJ/afmDlfXdQxSjhvJP
	gitCmSn+y8LG1QGAANmMkmwnfK3owaupApiWNmzYmrf8x7lnPMJX3TX5pFwrw0vJ5hdN6aHz3rxRZ
	J+Kf6M5FVbXJvFUPz+K14pXGVYnV+dbwVs2RXgIH/zouyTwpdL4GuGlGvCs8nKnwVoqSQHnexQJP8
	x5RwlIWZl77A9MZtQ2q0ivJy+j+NUPXA9LXo3XcYPdq3k2DgokEQByQ/TDPc0DaeY8v8zn7Du9/R9
	vw8gMrPw==;
Received: from ip6-localhost ([::1]:36922 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1reZbe-009SGH-G7; Mon, 26 Feb 2024 11:57:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64604) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1reZbM-009SDk-0o
 for samba-technical@lists.samba.org; Mon, 26 Feb 2024 11:56:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=r1/vpwSDdPdVQw4J7JGI+G4zZ7i8r/NFewhNIhetCg4=; b=B5q+by/tenSmZvqprwLvNlV/JX
 cTMuYhdERTdAEfu73yFrbQEBDwijHvTrZc4CrCCZMJDJ3aLE3Q1JfIuMpojgvBEKRQ1BJF+p7Kdot
 W57TNA30WGqaTClzqdDW1dlXqL3Iiu2ALsQJlmrhgG/cB27d8bzxJT0hEhelt4oXFbG1kK7AP/3v/
 3j5UcqeGyTBWYt7bxMZsmCgUMwDI9rE4ETzQKfxbzHHzGK8L2/Duz+zRereXMEuAhcYEMsh96m7pT
 VmUZ3UgD0FCSXuaMA8C9OCnaxxD+jYye1z6w8KvYSWdoHy33HV/UHUmgOs/eyzbBshfsOkr/dBNAq
 RBolaGmTPcwg1SAlsPM+h+kW7rxzSL2GJ873Oat+0Lp88gHaRlNq1mzDHeZpMxqUmBNueqQfDqRjY
 lYN0vmoKyAPgNAFZBHJVe1W9iCjd8qx3vbpE8+bQaOzD16w5ykaKXo4AALY/Qlw9ddHka8SEBYO28
 x/ysnFs10nXwv+I/P/ma5eUI;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1reZbL-00Er07-24 for samba-technical@lists.samba.org;
 Mon, 26 Feb 2024 11:56:55 +0000
Message-ID: <53a1d645-058b-4367-a920-e9f585c36da4@samba.org>
Date: Mon, 26 Feb 2024 12:56:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE, en-US
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.20] Samba 4.20.0rc4
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

Samba 4.20.0rc4 is scheduled for Monday, March 11 2024.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.20
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de



Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F31AFB8E5
	for <lists+samba-technical@lfdr.de>; Mon,  7 Jul 2025 18:46:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=SrGblwY5m7Gy2Ayw0WQ2R8ivUFCbsmSxtRWwTRTRjUI=; b=3FGy7DYEQyL2uodzXcvMk+HAhI
	dpzL58RtmUxerEG5NrzDQ/zfDQYd7E6guJoyn6YoXFWCeG35TqSo4elkUzowklfAd9FYwswhBS3An
	934mZ7+alT9aMUUbU/MqQUlEfbBP5kbGndsEbfcswUgyGRgggyyO8x4kJqg/5QT85o/3btxFX4KJn
	hqp8l49Ja/YJ2sO89WwBf4ku0LjPiOpcBKWGng7LPtLLbRlSaM06Hxmk/IpubPKBunk82d6BxVqe/
	QXbCQuNBZxf+b8NFX3eYaxBTGIkleeZoFW913cW5UrbUWimXbkfzaK717uAko7e7uxraStjelce7G
	fhz6jfDA==;
Received: from ip6-localhost ([::1]:29478 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uYoyt-00Al9x-EA; Mon, 07 Jul 2025 16:46:16 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:19908) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uYoxf-00Akr3-D2
 for samba-technical@lists.samba.org; Mon, 07 Jul 2025 16:45:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=SrGblwY5m7Gy2Ayw0WQ2R8ivUFCbsmSxtRWwTRTRjUI=; b=sGQwmOhczpAvXvZExrjDOu2C1i
 zRWm77P0omkCTZ4P0ijgp2PPAMQOSm76vOE5RneAZVQnEG5TKvKm8UpTPaDaxsOo2pivhYyeTE6jM
 tVZUdnkGBg8LKT1/izok3DYefGPQBO9JHFTefCA8GAanoRrPYyPft3eZSXiudWD5vMHpV/L/ITbES
 iDVZrz75cVtP/5JqQUW30xalkhcneteFOebB66N5eEzFzif3jSPVkziTURL/Su5P6QAeFw24mU7HN
 78duYZVPwYWrywELd/8ZRpfJwHASr5RxD3VvXTWKkFyEqL5CywQBC5bN91MzZOSh0qb5NcCaK5GwU
 U0+EaBu7NppyJgVCPXhsiY41Q1LC0Fn9JgwGiPTvPjayakOYuyiXB4YOZRf1oxLHGSbvo1SXjKEUD
 OCi8fQvLBmibA4otg72voJ7cc1RmKMjwX/frSc4d68XakFf3XQRHCtn5d9/fQjpwt4QqR4PrVcalU
 4xGO1ugVzJznhBGxJ3Gn1A2A;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uYoxc-00EM6h-2w for samba-technical@lists.samba.org;
 Mon, 07 Jul 2025 16:44:57 +0000
Message-ID: <4c7df413-a652-4e77-8ed8-97e7d06ac702@samba.org>
Date: Mon, 7 Jul 2025 18:44:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.22 and 4.21] Samba 4.22.4 and 4.21.8
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

Samba 4.22.4 is scheduled for Thursday, August 21 2025.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.22
has been updated accordingly.


Samba 4.21.8 is scheduled for Tuesday, September 9 2025.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.21
has been updated accordingly.



Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de



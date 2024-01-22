Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E56835E39
	for <lists+samba-technical@lfdr.de>; Mon, 22 Jan 2024 10:31:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=RPWt0jjwPV/io9bgmjPGqTTjiCobVfPTWNpAQ3RaGFI=; b=HpCt5a9zXrJXWuZVYc60THlVLr
	JsqQ6630sEQUVpyxuYG1XAU6KHJmkbWtm0vk13WHQR8et4+JtHf+mxbfOTTTO90VCq3kn6ADj/vXm
	2b5iZDQbSY05sa51QMcgJMJYyBKclMs7WsR17oJacX8No6s15tHrWFDedykEhbZO5BMfsYFoThsmW
	OHa7rhY5gFOgcGdU9RXNqs7CUW4uEZJQOAKh2t7+6PTVLN/DovOmQvYEflAi9IuP7ccUQZc39hbzb
	WhrN6JllvV8VHW1r1INFKtcJ9Jfd0we5cQxyY4BCwTn9Ozl0OuufuUCgK2+s3bF/ENrI95t7nNsOQ
	ATYbTD+g==;
Received: from ip6-localhost ([::1]:22860 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rRqdh-004Ak4-G6; Mon, 22 Jan 2024 09:30:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42398) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rRqdc-004Ajx-EI
 for samba-technical@lists.samba.org; Mon, 22 Jan 2024 09:30:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=To:From:Date:Message-ID:CC;
 bh=RPWt0jjwPV/io9bgmjPGqTTjiCobVfPTWNpAQ3RaGFI=; b=tu/bUyFRjzIDBdK3YECvnrFKrl
 LZpKcQ7uxiV3CUh4dDxf9gZi3Uy2mxlpDOafylzQ1sqLlNlcYuMO5DqXO1WUD58tubDbpS9GAgn1k
 VV7EksBqFA6QDUoUg3XrtqpafSMSpn4ytV+UYqn6mFvlKn6+3f9ZTnp2s4VUNqkPxQWSV8YbS8UKP
 WCqWeHOIZXwLysiDa5noTvdHwzPy7Vbe6kJC46ptJrRDsOQBs1XMd81d1PUEmgSU7Y+eDCYOqk/FB
 BH7V1n8g9n7pkq4PzvRcRiH3KW81ZR2rYaxH9rCeHMAJbcVGv6+CYOpAbb29E1m7qMaPeYN8MjVQr
 FdbH+V3MSLF/8RvkRqN+uVTvRHNJcgEvK490MuviOzHwhGqrRTvnktxG/h5EYvVtdY/qdmIfF7F3F
 ro+Gldm7Tm1e7hi+gE+EyIIill31fGBDhdYZIq8A0u6IKhZwqROop/WJ5fliXhY22KovW1kkjfc7W
 2UAOXU2Z2c6ss7y7PpUgV84l;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rRqda-0099WA-2t for samba-technical@lists.samba.org;
 Mon, 22 Jan 2024 09:30:38 +0000
Message-ID: <cf0d2569-8efc-455b-bb2e-8433a2f11936@samba.org>
Date: Mon, 22 Jan 2024 10:30:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE, en-US
Subject: [Release Planning 4.20] Samba 4.20.0rc1
To: samba-technical@lists.samba.org
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

Samba 4.20.0rc1 is scheduled for Monday, January 29 2024.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.20
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de



Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E49902517C2
	for <lists+samba-technical@lfdr.de>; Tue, 25 Aug 2020 13:37:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=RWODN+rW9tSjzvFONBJ5S4z6fl+VfhFao8jZoMk7iJ4=; b=vRQ7Riq6mP3M+4daSH6fPwhSLP
	YLypDCHsVy50v4nHux9NO2jdYspcqfU7UUq+IFeHSGuKc/9HQvwONh3EYNwuRJIuY0GTkU1Na2ylw
	Lv5plOpnr0a2PgnJzg5SSXprJjEeM5RTSZD7Lqlrvx04HmiZgmAJwJECgCqdba12tTB08Y/QX5Pje
	xv8DTbV1D/lO0dANSr64MPKi93+Q6h7/QNopsO5l1UIqjDeGbYJXhFeO/okLPk7py19OqdFCgMEuG
	Fsk2qcfmSANFw+4aqsqFlML1ZHulkRKTjD1uStXiHIb6QGJHzaLZ2BZGXCDje7mAcOkpDO2BGwTc/
	uQhPVIrg==;
Received: from localhost ([::1]:24292 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kAXG9-000S0w-LY; Tue, 25 Aug 2020 11:37:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56516) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kAXG5-000S0Q-Dm
 for samba-technical@lists.samba.org; Tue, 25 Aug 2020 11:36:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:From:To:CC;
 bh=5CDv/qDDXUAQcoYb/IfiQS7Qx4eSmovJDBlMTByXQqg=; b=X5sFhSKkK8/aD45FsqrRvcOTlp
 l9vR2bd8U2YdLXXZe7MFXjQAlVC5VsqTyceE4AD4j0yN4L1ZbMmu+JAGRwXpqo6JYdUXJdyyXqJhO
 IRiBTU44K2w3QhY8qlTS8vkPt2yxCko2hk681QPdjX5+Ejt3E1xS7FjCrMtgKqX3juaLWL7x3Johl
 jc37m7pQiVe0fLRhIpN1eGGhu0jdpol3fhUs5p28BkIME3kPj11MKRdomhKVZepdmTv8L9VQtr6LK
 OW9yrEPHlP7BPBPdQnMgxQtFmCrkNopq+yXoEGzfYz2vC+Ltwr5hj2vWKezAE6/S9ArD81SfR/5Un
 Y40KvIjRIROjE2QepwDJEKd68sJ+W/TM0Z8z1sR0Bsyhl2qAKkNlvEba4be7caQBpLtdRQHuPhboA
 84TvNks9AiBlp1uwI9RS7Lk0i7SuKlvpzMeKeGLfAL5ROhXBHfjcjnT3rlVcIzjn9+tc41I7fy8oO
 Uu7bLTEfVyWv0cazIE7nbdHE;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kAXG3-0003uP-5L
 for samba-technical@lists.samba.org; Tue, 25 Aug 2020 11:36:55 +0000
Received: from localhost ([::1] helo=hr3.samba.org)
 by hr3.samba.org with esmtp (Exim 4.92)
 (envelope-from <github@samba.org>) id 1kAXG3-003ZWT-1V
 for samba-technical@lists.samba.org; Tue, 25 Aug 2020 11:36:55 +0000
MIME-Version: 1.0
Subject: Re: [PR PATCH] [Closed]: check_ctdb: return WARNING when no script
 was run, and fix scriptstatus split
To: samba-technical@lists.samba.org
In-Reply-To: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-191@samba.org>
References: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-191@samba.org>
Date: Tue, 25 Aug 2020 11:36:55 +0000
Message-Id: <E1kAXG3-003ZWT-1V@hr3.samba.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
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
From: Github bot account via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: github@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

VGhlcmUncyBhIGNsb3NlZCBwdWxsIHJlcXVlc3Qgb24gdGhlIFNhbWJhIFNhbWJhIEdpdGh1YiBy
ZXBvc2l0b3J5CgpjaGVja19jdGRiOiByZXR1cm4gV0FSTklORyB3aGVuIG5vIHNjcmlwdCB3YXMg
cnVuLCBhbmQgZml4IHNjcmlwdHN0YXR1cyBzcGxpdApodHRwczovL2dpdGh1Yi5jb20vc2FtYmEt
dGVhbS9zYW1iYS9wdWxsLzE5MQpEZXNjcmlwdGlvbjogCg==

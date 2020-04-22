Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 111871B34E9
	for <lists+samba-technical@lfdr.de>; Wed, 22 Apr 2020 04:15:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=KHkZzNWZxSTi9MsrYmpCU5fgILM91i8MjSKfXeDR0y8=; b=B0pwz21lv1ccQQl9yDLFHy7iOc
	EKxm2JHCsxUOz9BxHkpRpiM3nby7yLELZkihAKDLeDZ2qxK3wm2Z1peDkezG8hZ+1oyoff7fbrm89
	PcqycClv0lIbHqf2iuYa/zmFEPAPnGXtyX3Y1eObBg2Y4YZODi1x2dQE4J0E1gieXOFXEVSsWjDVT
	Pdml8eh51S3l4oOJr9xs5wprT53P40aDryZpKw1rJ1W0fxypkcrxPIlTrURF7KslEpw1kM3wP25Hq
	0pFVYMQ2bbMvH16Y4WqbvM8Bww4WexslHbfw/C0ZDQnr/MDBKiQey0ZCO1eLmyd5Ao7nYkfRzyU27
	6euSHt1Q==;
Received: from localhost ([::1]:48104 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jR4uQ-001RiY-Rv; Wed, 22 Apr 2020 02:14:42 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:17160) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jR4uK-001RiB-9F
 for samba-technical@lists.samba.org; Wed, 22 Apr 2020 02:14:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:From:To:CC;
 bh=sVbhw/3qzYW0guVW6pRMhQHP+FAIGfhtf4hoDIX/SV8=; b=Jn6uj8s0QbaErY+WhrV0uBeiPX
 MENkUh16yFu8kyhcFcoeT0ewqNVj3buz3qcrKEw9922kljN3SVcDZ8fo4UqPmtbEYEYCS98Jwhmtu
 ATprRCoBpfYwGp3m2jfxpO14geq10UfyiMTIh8qTQmU17wRg9c+I+AKWVTy6jmLRzHuFjGIHMKwvs
 tJkFPPWG4CL+TgMwv1x7U2F5SwVLeO7H3b65nPP2gdLwS6FtCDu009DT4HZbtbY4KbIlqxfJXfcLp
 oI9jWSz/pcDTfE/qDNxAEDCWfByWteR96yrVDsR/G4IzF435k3X9DSJfEPwzl3QnW+NK4GA4F3g6Z
 EZLGHNodCF/tzfX9Bp2kSMqG+Rw2/ViexDsleLFsM3Xdykqyf+Rc4O8JZ6kd5Y8noQLPtI53nLYBr
 P51z1uGxR4QhWv80nLaw/m6b1EHu+Q7Z77etobusUsZw2sJWHPNtQfvLFp5gFwXBN1yKrwMIAzlce
 EVz4NDznnP521uCcI024VFwD;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jR4uH-0007WR-Cm
 for samba-technical@lists.samba.org; Wed, 22 Apr 2020 02:14:33 +0000
Received: from localhost ([::1] helo=hr3.samba.org)
 by hr3.samba.org with esmtp (Exim 4.92)
 (envelope-from <github@samba.org>) id 1jR4uH-001FvA-90
 for samba-technical@lists.samba.org; Wed, 22 Apr 2020 02:14:33 +0000
MIME-Version: 1.0
Subject: Re: [PR PATCH] [Closed]: Update nfs-ganesha-callout
To: samba-technical@lists.samba.org
In-Reply-To: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-218@samba.org>
References: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-218@samba.org>
Date: Wed, 22 Apr 2020 02:14:33 +0000
Message-Id: <E1jR4uH-001FvA-90@hr3.samba.org>
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
ZXBvc2l0b3J5CgpVcGRhdGUgbmZzLWdhbmVzaGEtY2FsbG91dApodHRwczovL2dpdGh1Yi5jb20v
c2FtYmEtdGVhbS9zYW1iYS9wdWxsLzIxOApEZXNjcmlwdGlvbjogT24gZGViaWFuIGJ1c3Rlciwg
dGhpcyB2YXJpYWJsZSBkb2Vzbid0IGV4aXN0IGFueW1vcmUuIExvb2sgYXQgdGhpcyBQUiBhcyBh
IHJlZmVyZW5jZToNCmh0dHBzOi8vZ2l0aHViLmNvbS9nbHVzdGVyL3N0b3JoYXVnL3B1bGwvMzAN
Cg0KIyMgU2FtYmEgaXMgbW92aW5nIHRvIEdpdExhYg0KVGhlIHNhbWJhIHByb2plY3QgaXMgbW92
aW5nIHRvIEdpdExhYiwgcGxlYXNlIGNvbnNpZGVyIG9wZW5pbmcgYSBtZXJnZSByZXF1ZXN0IHRo
ZXJlIGluc3RlYWQuDQpJbnN0cnVjdGlvbnMgZm9yIHNldHRpbmcgdXAgY2FuIGJlIGZvdW5kIGF0
OiBodHRwczovL3dpa2kuc2FtYmEub3JnL2luZGV4LnBocC9TYW1iYV9DSV9vbl9naXRsYWINClRo
ZSBHaXRMYWIgcmVwb3NpdG9yeSBjYW4gYmUgZm91bmQgaGVyZTogaHR0cHM6Ly9naXRsYWIuY29t
L3NhbWJhLXRlYW0vc2FtYmENCgo=

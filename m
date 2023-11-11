Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 806E77E8819
	for <lists+samba-technical@lfdr.de>; Sat, 11 Nov 2023 03:10:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=Pcuu8emNY+MF8twyKJYT2BAfrgctSmpXXBmxrPH83QQ=; b=OX5XRUwixSTr5ksg/8DGualz/E
	HIo7h5NnU9vieO4bZyv1Q1XH66eOWSXfSBzRyjQEgvB1c4mVpfWvz0TYsFuzaTi9ddwpnUyfJcY3u
	gOUMSLuKP2v+PyXjdPLSqBC7x9C7IP2j6xpQB8R34XllWTYs8LgSa0O1lL96CjD1+owChger3qcCR
	X6uXrsghRvhBEVlgQ41VOKfCMSU39HGRd66lYegp38LxYsAfSBXfCuRnhjpqSAjrK2o37xtaobwIK
	yff81BqSzSW3D16f/PMQwDycsrcC9o4Jt9AlbL1xXeZQzRcxCVCcxCUzH2DiQSxQmDNXPxIqxwR/H
	/zNZxZpQ==;
Received: from ip6-localhost ([::1]:35574 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r1dRF-007mnD-CU; Sat, 11 Nov 2023 02:09:33 +0000
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:33497) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r1dRA-007mn3-83
 for samba-technical@lists.samba.org; Sat, 11 Nov 2023 02:09:31 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 0A98B32009D5
 for <samba-technical@lists.samba.org>; Fri, 10 Nov 2023 21:09:23 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute2.internal (MEProxy); Fri, 10 Nov 2023 21:09:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outurnate.com;
 h=cc:content-type:content-type:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm3; t=1699668563; x=1699754963; bh=Pcuu8emNY+MF8twyKJYT2BAfr
 gctSmpXXBmxrPH83QQ=; b=IFAwl7jMH9gv7h3moFXRsJ1sTfNWrorRU+YzQnsRT
 R7TTh+b0o8hpAAFN9cH3Z3ooKxfOvsRs4THbYYFnYzogZGDYu1nJ/G1DJVp7bDH5
 Gj7J6h2XtBjykyplWtqjN5JWA/a8zq0UhKWrADvjk3Onte0Wv2TU3td5BYC6ENEJ
 uGsZYuZDZrCIRn0tPGZhR7iNKm++PSq6wMrv+PDZS1iP5Ppvym9b2mxhCAZuIgd9
 OAoGU43y9VaLEHUCkQI1l6YhklmJT8iBKB3gWsgHAbT/XbrSnY1o6e8Sh3ky+t2D
 x3nWEOw67ZnvJhF+KZ7G2ErwS8SZFa2Hon9jkwfxlptNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1699668563; x=1699754963; bh=Pcuu8emNY+MF8twyKJYT2BAfrgctSmpXXBm
 xrPH83QQ=; b=iyGr2qfBcFyoUjr4sZ5GMPwqai1hSzbNtUSgVAAE6nbvPhh7qF4
 SJiapoF4VkCTHXlbkuUpDBOIeN+W92Ml/mMzaE9CaJAGAV/1KFf2/W7HIMp7lhze
 6L1e5DULLFWuqHPM/BCAHYYnZoyD4W2IVZwh5PvctbWkD2+aVwI9LVZ9n8raSZy1
 JW1Td8KsBy3GmvQmnhATuSXghZWIFdiLJTz8MYFJ9DGcA+cZNl/TbI8+UUO1CTtC
 aedPOpj6Hx85MolhCMSJMlpCkvC6Ooan3M9tx8ntCdK81h0qITRGYyijCfoNKB5u
 Arn9jquF3nyKKI8fyRIfDaJnS2MdaB8P9EQ==
X-ME-Sender: <xms:U-JOZcB6ISmlOFbu9oKt5kGeHhlkh1M_laa6GioHgO684KRryqMaTA>
 <xme:U-JOZejff4g6PHuQjW7ViW22YYjpvkmkGV_U0wpnPSxvFFN8MvRQ-LpOMJTTW-bvV
 3S2pHfnRHVRZXb_q2U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedruddvgedggeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsehttdertd
 erredtnecuhfhrohhmpedflfhovgcuffhilhhlohhnfdcuoehjohhsvghphhesohhuthhu
 rhhnrghtvgdrtghomheqnecuggftrfgrthhtvghrnhepkeejffejhfduieduveefuedttd
 fghedukeeuhfejhfffveegvddtiedugfevgedvnecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomhepjhhoshgvphhhsehouhhtuhhrnhgrthgvrdgtoh
 hm
X-ME-Proxy: <xmx:U-JOZfkd3ZJqQTfm-PGa8W6ndtBSy9vXpzqnBTHHh-CaxLpkAdY_GQ>
 <xmx:U-JOZSzlggWhvn_MJ2oXEupxNpCVL4kY60ozcqvrxFGRfJKrR3OzkA>
 <xmx:U-JOZRTgdJuB9mtcmFDf3y8JLKvTBa0gruDOQ4glAIgcxgnXmgSefA>
 <xmx:U-JOZYd9nqKsayqIeCIax4Y_n6c2qZFehxADoy4w-DXIDw1AeI6vuQ>
Feedback-ID: ic7c14608:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 3FCECB60089; Fri, 10 Nov 2023 21:09:23 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1108-g3a29173c6d-fm-20231031.005-g3a29173c
MIME-Version: 1.0
Message-Id: <922de58f-d011-427d-8248-9f8ce7c90e74@app.fastmail.com>
Date: Fri, 10 Nov 2023 21:09:03 -0500
To: samba-technical@lists.samba.org
Subject: I want to make ADCS support better and I need some advice
Content-Type: text/plain
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
From: Joe Dillon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Joe Dillon <joseph@outurnate.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I want to improve samba's support for auto-enrolling and auto-renewing certificates.  I've identified a few key issues I want to resolve:

1. Certificate Services Web Enrollment is required for discovering the PKI environment.  Web enrollment, while *probably* installed on a CA, isn't a component of auto enrollment, per MS-CAESO.  Additionally, CAWE *most likely* presents a certificate anchored by the PKI environment, which presents a chicken-egg type problem for using it to discover CA certificates.  Samba breaks this dependency cycle by retrieving the CA over HTTP, but that presents an opportunity for an attacker to potentially inject a rogue CA.
2. Samba's discovery of enrollment services/other PKI configuration assumes the current domain is the forest root domain.  I'm trying to work on this as a good first issue.
3. The GP client is currently limited to interacting with CA servers that expose WCCE and WSTEP endpoints.  These are optional roles, and as a result aren't guaranteed to exist.  Samba has MSRPC support, which is very unique on *nix platforms.  Samba could support MS-ICPR for CA servers that don't provide the web protocols.

I really want to help improve the above.  My challenge is my python skills.  I've written most of an MS-CAESO client in rust.  Should I complete this rust client, would it be of any use?  Should it be wrapped up in a nice python API?  Can I submit the necessary code to add MS-ICPR support to samba - purely so I could consume it myself?  Should I scrap the whole thing, learn python, and rewrite it?

Looking for advice more than anything

Thanks,
Joe Dillon


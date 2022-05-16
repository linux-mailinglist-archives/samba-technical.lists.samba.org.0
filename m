Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8E9529289
	for <lists+samba-technical@lfdr.de>; Mon, 16 May 2022 23:19:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Ytp2GX+wl/BdJs7n1l7QGd/oFdMET3jPbBU9kdhNa1E=; b=Lin7rp6jMpL7ha833EbQj+3ZhS
	2TtBB208V7+QHsBqgkJPSBXv5R/QeMG32rpJV56vORmrmz+Ay5ZMf3NZO/gSGDsqigWYHPodPtTyV
	93yrbs1DfJ2nxh9Y9Bmn/T2Vp8HGEDWpHTn5QRP/SEC8kn5K6HlIJRpfhupK0UKFjOcU/M8qo4JA7
	Cz6y9f/FIdj5ghITx+ihUwgQatuuNuAFf+oOzTIp4p0KXtC0H+ABKcJWQ2tSsw9fWtoGRn9TvJH12
	KL/ssW6QqHfFyVYBN/dtyU5+Y0LiXu0DWWQ+ZHDTpphEwkBWSafSzA3PbndYWN/JEpowefkSawi9s
	KNqRv0Hg==;
Received: from ip6-localhost ([::1]:50552 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nqi6U-001ecL-C8; Mon, 16 May 2022 21:18:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61614) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nqi6P-001ecC-Qe
 for samba-technical@lists.samba.org; Mon, 16 May 2022 21:18:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=Ytp2GX+wl/BdJs7n1l7QGd/oFdMET3jPbBU9kdhNa1E=; b=lep5acwKIdGFCEnvPOzxbgmqSe
 YSt8CJ0/4c4Euf66tWGjCv8va742chpIuKzJ1pee8fVTsbcP5TU8CyaK7dEFszGVLHcTelQbIcDLR
 QG2+kpRYWqzJXxhEkqSJqqzv1gcX2/Z4ToDUqcIM8RauwOpNIIPs3W/qv2AwHJohu+l47nyduG7qz
 s2VGP+JJh54GtMN4H3sQeUUt+1UqAZMRwN4hDCgzSFvMcXJw/I4FtrWcEmwYuITcK7ZdbdlSKRizx
 AS9m5+YlIxnHDjx88XJ3nyQhqMJCRqLYODJC4G5+UeVukEZ3Y8M8rXzhHYg5+NWF6MEu/qkOlVMgK
 y5bp2W+D5ZKb0zKvi9/e12u0BCmwiSG8WX430vJ0VG/s4mPt2pNYE5RJFNWAySUhGtiKWeSeGGqa/
 qVColQP7qk/vciX4HcD5F05Y7WiBuy2H2Jr4lXVurTM/GsQsmcg3EXI1XL+Mw56Zqeq08fI1pc0QY
 QkyrgveVnpJhbU29EsnyChE9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nqi6O-001Cwz-67
 for samba-technical@lists.samba.org; Mon, 16 May 2022 21:18:05 +0000
Message-ID: <12f08a5415b5f4b2ff1db903cdfff64b447e63f3.camel@samba.org>
Subject: Runners paused
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Tue, 17 May 2022 09:18:00 +1200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Just a heads up that I've paused our runners as I'm refreshing an API
key and Rackspace only allows one per account.

Normal service should resume soon.

Andrew,
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions



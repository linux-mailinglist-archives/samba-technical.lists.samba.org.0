Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8F528DE1
	for <lists+samba-technical@lfdr.de>; Fri, 24 May 2019 01:34:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Zw2tIsDOU3tzgDZSv0fKMfBLYEIA+vy9g+pKec1VYvk=; b=WM7A8J02YsXlVdwGvzfUrFpXBS
	1hVJzWwWoOiBNuMSpeHbMB7XdAIxdE5d2BDJuq9pxx8MNuD5WoqXKEvuVuh3xuDTEiAm0WT/l2SHA
	y7oEekx177cAvQXDYV9IBMsZF8JC9WC4yv8Qos0Yi+wiZc/Zko2y3FrYeAKHcNMRCSnfKIloWVANj
	mfsqJrTSb0ntDXFaUwiJBTd21aDHOCvPy3InGbThH9GgAHv3S70VVEk5f9axtkZ56Oj6yq3R815KB
	fsEAgPrT80OTFj6sNRV0zRsiRc3oJucQJijDYDG96svHk0iSz3jxYD+FK5ewpqeUOqPuiuc0njCoN
	m20sBC7Q==;
Received: from localhost ([::1]:23138 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hTxDi-001V6G-6k; Thu, 23 May 2019 23:33:58 +0000
Received: from ozlabs.org ([203.11.71.1]:33981) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hTxDd-001V69-Ht
 for samba-technical@lists.samba.org; Thu, 23 May 2019 23:33:55 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4595RX2Jk9z9s4V;
 Fri, 24 May 2019 09:33:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1558654424; bh=x/Zzpit31Nf7dQJojqGMiPxihBdq7ZhNEuhxXdSh0Ug=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TfwXKS7OKLgP1j2hpOgpuS+3lWDUtAz1aqWBrgtLAds6MQOu5obOM6Cemc2fhRpI2
 dmJXeM8PUhQ2OK8Cv7AS3EThx5N4hj5hgBsgq2JosLg7HkDRAyUpClouHo8P71QEBR
 GKg2Rz5z9+k4LK8iLNuY2vEMCLiJX9LUVd+FdHeGuDx6WljZ8WAbuFTFPu+4TS8j2J
 FLa8GiCV5AKnJ2C7RLYeb8UNl4zvvh2vtHg+kNDwjQGy4LZp7DGa+N9wDk29nX6272
 4tPPOA3ezlNS0y0P86ikuWEVCHNbGSZqe0Z2/zmeUW3RyvNvUi0ZpyMAOWD1XDsC19
 +zU8uIHcW+cow==
Date: Fri, 24 May 2019 09:33:42 +1000
To: Andreas Schneider <asn@samba.org>
Subject: Re: New csbuild run
Message-ID: <20190524093342.0616e494@martins.ozlabs.org>
In-Reply-To: <5821468.3VxPKbcTHU@magrathea.fritz.box>
References: <1902926.C4UlyRiazf@magrathea.fritz.box>
 <df4e9e89-12cc-e8c2-7905-8dd6c401b31c@suse.com>
 <20190522163104.5c7b8e98@martins.ozlabs.org>
 <5821468.3VxPKbcTHU@magrathea.fritz.box>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Cc: Noel Power <nopower@suse.com>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 22 May 2019 09:05:32 +0200, Andreas Schneider <asn@samba.org>
wrote:

> You can also replace docker with podman :-)

podman doesn't appear to even be in Debian testing.

I might try it under Docker...  ;-)

peace & happiness,
martin


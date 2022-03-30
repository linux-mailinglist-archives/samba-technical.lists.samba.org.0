Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BA14EB8C1
	for <lists+samba-technical@lfdr.de>; Wed, 30 Mar 2022 05:25:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=HMXOfXuGNMbp7OXUBmwtTcheWJ9mi4RKQ42OnPp+JcA=; b=AsKMIyHt0nv/VjxMeD/AkRWY0q
	e/+gpjvwDSb1DqgQ3IwxLHWx/5zLahg+L4+q7UtwusKW6meJCLRI2vzZrZ9MoCuCfPROCNG7PeVWf
	X5lJPocrYI75bKN5WM2vB+dzU4j8/FeB92TgkS3W1BIqqCBWrRuLrTUztQnGwqLRWtz81z79oXvr9
	ikE83miP3P91HvUtiASy+IlT6ZGsWlRCMfX3aW6EbMEjMqUt3WksKzoBYUecHYQqFT7TXidO5O9J+
	thQK0rflOJHcb9vjXO1tP07fGs4O+m0a7BquDWSOnn0F3ABXHwKYyDTzWS/fTw/zjR5/7psvjr6FL
	7ZFyXI4Q==;
Received: from ip6-localhost ([::1]:29714 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nZOx5-006cGT-Lu; Wed, 30 Mar 2022 03:24:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38024) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nZOx0-006cGK-4x
 for samba-technical@lists.samba.org; Wed, 30 Mar 2022 03:24:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=HMXOfXuGNMbp7OXUBmwtTcheWJ9mi4RKQ42OnPp+JcA=; b=AdpWK+krqkL+LWIiBGnQckhyEI
 zZ8XIRsQ+t8FeFPYOTR+oBs9NTZtVcjFx9RBoxH1xB4teGpRWRmCw8KwlVuGOw0lx8P1CUj1dKN/q
 qe3usBkMqfWtvknyagVaVVtOCs7DKtlc0LUE5TZIoy2qskPZybhfE5pW44qbW5EcNt7BnoCRJSFC3
 9oigYj/GezJYQT3xXaXK9gewLKKvMjURVEmqCJjusbKepKm6KzCM4OUVg62Kv1U18cIxPQYaa4BrJ
 vJxViscfaAC8d2hW9yrdi12dTa/xrlisVfOv5N+Q2URTrnDRONQtncvT+8QPWbzweQESv0d4KxVhL
 nHecbAm/I61Ugl/OntiX+D4cNC1Tm3IILKZjRPxPrS1FxEenAbq9Tzq+lOFexYxDKyFtP9dfBC1nX
 pXAIwBu2y+k195zTW8QC/Ci/S76qli24kxZdREPSfhkiM/jrGtRfi0u95v2pJ/FQJV7OGo03h0mPn
 UPVtdQIYosU943tTUQgMNfyo;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nZOwy-004Iwy-Gs
 for samba-technical@lists.samba.org; Wed, 30 Mar 2022 03:24:49 +0000
Message-ID: <c5c78237f38a1240141ebb8ef6bd25eba53ebabb.camel@samba.org>
Subject: FAST fast response is missing FX-FAST: Time sync issue
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Wed, 30 Mar 2022 16:24:43 +1300
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

I just joined Samba master (eg very close to 4.16) to a Windows 2019
server at functional level 2008R2.

I was getting replication failures until I sorted out my VM's time.

Until I did that and restarted samba I got a lot of LOGON_FAILURE in
the showrepl output and this curious message:

FAST fast response is missing FX-FAST 

I mention this not only to get the attention of those who know more,
but also so that when others see this, that they might check their time
sync until we can improve our error descriptions.

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions



Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1101809AE
	for <lists+samba-technical@lfdr.de>; Tue, 10 Mar 2020 21:56:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=HOcXWolVZQ+HLIF5VnpFVpnrcCjBJjoBNEwXiL4ArW4=; b=0I0JKqYy89qc9r95/My+BXoyKN
	7zm6JwH+adPocdzvxM2WtUHwBkxAfeDA/C2+el2spL9M2j45nG0cF7GdiMi0xLZem9BwgXCykDP8c
	/KHnOs6bQfQ6Nd8VeFVeTJ4d1fqfwULeJqlSSRl0dM8Y0pQlSnhyasbVSrkOZU39CM7KTSKYsBE3b
	41mJwu2+w9WsWOsDwcwNJkfeUcwr514/3bkRPduBIwxRfLJEJOanu3bgOY8GeshCDgWwhaa65ywZV
	lKwu93FdBp1MH2PipJcoBqF6m47ZGD+j8IP1eSSFOSezxnqMRWhEyfv0ixJ6WUPaxvoBzDzOB9+At
	aornyjig==;
Received: from ip6-localhost ([::1]:48990 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jBluh-00Flim-9q; Tue, 10 Mar 2020 20:55:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11008) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jBlua-00Flif-Ge
 for samba-technical@lists.samba.org; Tue, 10 Mar 2020 20:55:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=HOcXWolVZQ+HLIF5VnpFVpnrcCjBJjoBNEwXiL4ArW4=; b=HuPkcmiXNodXdNeTd/uoz24rWh
 +vfr97pvnSL0zam/bGPajls5vAoWAIfJWi0uPPaUwkTEftgqADZ+lhKpthbAV2pf0En65QGy9jn1U
 cRcOo1UDTS4homj1jkbCw9BAME6Qer8ZkrN21zqgiew+jBn+tVcJ+UuW3pM7rs3LroI0hL7V0eSIe
 abxaY1tVZfqdZSqLs/npi4P8mPsWIFOHQulRGb1tpA9ywqBAgHHcm0CWhooL1UtxFt0P9atmgscmJ
 Ansd7ZFXF9FnFirRi/NAQS5Kla496CYLGhNTMXBTSlQbBI0fL8Qgf3qZ/+tgRbx1xC1HGBVqWVH7Z
 77FV6CFyWtxzNBGknhHvw/naiuDRTIRCsXbMAp7WlrpmIIiLw4zeV1p4tqbuyhnAuJchHNf65KZoP
 JVnbbLycrNhAzadbAIC5qVc2qPlQ5ZesOqT8+Tsw/yuG0Ln2ou9gJRd8rZMa8XK2a2Ss/VBLBVP4M
 fXSM0SggxWhqQHlUcAmOttWP;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jBluZ-000464-BI
 for samba-technical@lists.samba.org; Tue, 10 Mar 2020 20:55:35 +0000
Message-ID: <3636fabee8e846a2e92385864aa307e3accfcfb0.camel@samba.org>
Subject: examples/libsmbclient/test*.c
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Wed, 11 Mar 2020 09:55:30 +1300
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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

With all the recent work around fixing libsmbclient I wanted to:
 - first say thanks, it is awesome to see this code getting some
attention!
 - mention examples/libsmbclient/test*.c

These are not a testsuite that could trivially be hooked up, they are
more example programs to be run manually, but perhaps they could be
reworked into cmocka tests.

They are already built, but nothing in our selftest runs them (verified
by git grep and by confirming with our LCOV results at
 https://samba-team.gitlab.io/samba/ )

Andrew Bartlett
-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT - Expert Open Source
Solutions
https://catalyst.net.nz/services/samba








Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 600336E996
	for <lists+samba-technical@lfdr.de>; Fri, 19 Jul 2019 18:47:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=dzR6OQOh1wVIuo8BClZQS8ITpmvSgjykxmN8EUjjeYc=; b=bYlARZmoSUW71UIJmgqNCB0g7o
	oS0Xm3tKsa7wkVL+af1g9p3MGMVnzI6VII7OeRK8Of1RwC2828PdU7ehm5PA+SPSAP1HyucbUxa2P
	VW2aRvnZSXza3Xoy06COlwCN5OrxMhdhdgwIYv1d1FM5EijppVu+Ylpw6Ift1P9OH9WCgNmb6aIuu
	90IawwuKEtHtNzgjnpEtGb3f3tfVJ3i8Nsb7PS2VvxobyxZhNhDBDXL07hTPcvRvICCsD0lVHTceM
	HDFaHj1DdmAKuyncBpr8WOLfFtoRMrXk4VhBZsQ7v6hTKfbvJWOrwbT55lHtGzoOdKu2+m4koKGFH
	GJbuN57A==;
Received: from localhost ([::1]:39928 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hoW2W-001DK0-Sp; Fri, 19 Jul 2019 16:47:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45612) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hoW2Q-001DIo-Cz; Fri, 19 Jul 2019 16:47:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:To:From:Date:CC;
 bh=dzR6OQOh1wVIuo8BClZQS8ITpmvSgjykxmN8EUjjeYc=; b=jVpOobpSAdRjJ9qEvDMPBfqtSE
 30Nk71E7qXBsbN7LUlpxJBDI5qYurzkI3HADQw39fS/qGi7JY+UDpTW9RPs9Ji1FOnXmDTzVzucJa
 o6jpCWOiWmozDpwjwg+ixmHq/PrAr+ViTdZ87lXKueS5C5WD6iMq9NsTwoYSbHtU6PKs=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hoW2Q-0004r1-6h; Fri, 19 Jul 2019 16:47:18 +0000
Date: Fri, 19 Jul 2019 18:47:17 +0200
To: Samba general <samba@lists.samba.org>, Samba Technical
 <samba-technical@lists.samba.org>
Subject: Article: SAMBA versus SMB: Adversarial Interoperability is Judo for
 Network Effects
Message-ID: <20190719184717.23f60b80@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

An interesting look at Samba's "Adversarial Interoperability" legacy:
https://www.eff.org/deeplinks/2019/07/samba-versus-smb-adversarial-interoperability-judo-network-effects

Cheers, David


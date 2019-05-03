Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1212F128AF
	for <lists+samba-technical@lfdr.de>; Fri,  3 May 2019 09:24:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=ZWA3qjp7vfRIBlx92mtTis+3Ja9PrzzPWcCg5A3RdEs=; b=5N9iVlW+Oj39N2nhJzUQyD7l/M
	wfm7xMP3roQHv5rOs2benrC+zY83n5uahlqRRwAed5W1LpZgozJlBLkWgKHftEmoHGX1Iq/5+HaBW
	odLTYvW3L/ZD1kcjY2Fv5T3N6dguFToZIw+KtFnghpVkJ4jFf1rhesLf3Io9o8jb2j4DK5HDUl0ks
	4yKxOVN0bctXw1AAeqOlifOwAnmmhjYg0t+0f6oundLMJMGdes3HLE715vZUS42abxQZjweqPbyax
	c6yB2WxUMvWRSEZmLDFK14exb61pLxOcb2YC46Ff0raVOragXWC8onbYyWYUP/aIM+UC3km2I5BxD
	qrKaV+iw==;
Received: from localhost ([::1]:23786 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hMSY6-002BSE-FR; Fri, 03 May 2019 07:24:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:43358) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hMSY1-002BS7-DF
 for samba-technical@lists.samba.org; Fri, 03 May 2019 07:23:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:To:From:Message-ID:CC;
 bh=ZWA3qjp7vfRIBlx92mtTis+3Ja9PrzzPWcCg5A3RdEs=; b=YwweCJ+2B1IMsfqDr05d/JTMg6
 iGgT+BXb1UkeD+JjTSRKxogG6iSDEcGj80kudNpNpTTzYx7y0012F43UI4//DDTq35UVXjUZZO6Yj
 PPQBJX2IUr0on//CX6Wr+05jcL1fwRN6FcmWFKl7nosrkR6tBaY0HkZmkebkKcbk/hLM=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hMSY0-0006uJ-Be
 for samba-technical@lists.samba.org; Fri, 03 May 2019 07:23:57 +0000
Message-ID: <1556868232.2951.47.camel@samba.org>
Subject: [PROPOSAL] Evict zlib
To: samba-technical@lists.samba.org
Date: Fri, 03 May 2019 19:23:52 +1200
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

It was recently pointed out that unused cryptography can be a pain for
users of our tarball.  I also recently did some work[1] where we
documented the location of cryptography in Samba.

With GnuTLS being a requirement now, I think zlib is also a reasonable
requirement and removing it would also remove some bad and un-used
crypto from the tree.

What do folks think?

Andrew Bartlett

[1] https://gitlab.com/catalyst-samba/samba-docs/wikis/cryptography/where-is-the-raw-crypto-implemented

-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba





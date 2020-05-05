Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCE71C5BC3
	for <lists+samba-technical@lfdr.de>; Tue,  5 May 2020 17:41:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=LoNXq3VtCN6HUmTNWE+dhEmmu/vjFanE85e817KeMm0=; b=3Hj+sVHndcaJ7o0id3UgIgGAk3
	6Dk0H9IUAkgfDDujIpZmVeRD/fcSx9hIc1lMzOPkRqEQtYLzwkTgnNN5iua/i8h8mguBS0pcInEeO
	wS1P+wth9DW5ZQ6yhUgndZgmklaQPZkOBTvWF+12XDK2lVIGGc1dTAm56z7+lOLVsrbbQubWlxKtV
	sgeuEPYSI+zNVrxgGSp7PiwvgktuJ+GeUr9sMa/kSugmpe1qiSq2RhmVdART/0jNJFvQSS4feh5ps
	9kKesa98270neI35Lg+rGDVs6Q1iHSmzrUhiPpMb1GupfHgx71C1bMPnA2v0MGadRhc5eDEKdD9/g
	MqDJmS4Q==;
Received: from localhost ([::1]:39400 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jVzh2-002q2c-ET; Tue, 05 May 2020 15:41:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47410) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jVzgu-002q2V-QJ
 for samba-technical@lists.samba.org; Tue, 05 May 2020 15:41:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=LoNXq3VtCN6HUmTNWE+dhEmmu/vjFanE85e817KeMm0=; b=vLPSCM2P4ilvf09NxBz5YpAaZu
 WbBAhM52ybpwJadcyYSW90Qym58HOi3hCxEODUSCf26pfKwZKTx0yRS4WbH5toxTeLsEMpW1xcEEw
 U4VLoQrZME/mbAzukqut9amKtLcJdv1GkPmhE00DA/kyWD8KzEW+lk8nApPrbJeXJM7/7wsqtCTZc
 8DMXA9pwJJSrrXePRYxGFPlYytoy/OAlQVBaghUPbcvj/OOfgE5gnAXtHozSNtx+mIIgmKUQw+tpP
 NEPVlCsNG1jFPZD0CeC3bOtCtR5vaEHAYNFQMbd3ZEQgFpbnONXCsYBzVc73eCab7xHYYbC8ODNOL
 10tKu93mRtph1AQppgBb81jUZ+MlDttr162Il4KugcVbm/ROEUlGcu6VD0TsQz4/NparqCA13SM7Z
 S8yD6iSP3kO9XgK/mmTc0NCM0BexbogRg+4fL+gUU3i0PKfj9wNb9SwhFwU3+Ym5bpaXq5soY0u+J
 7mX8Nx/2Js7XK8I6Jxki+DmM;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jVzgu-0004NW-8p
 for samba-technical@lists.samba.org; Tue, 05 May 2020 15:41:04 +0000
To: samba-technical@lists.samba.org
Subject: Gitlab and Sign-Off trailers
Date: Tue, 05 May 2020 17:41:03 +0200
Message-ID: <2494384.Zab67dHBYY@magrathea>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

I've looked into different solutions for checking sign-off trailers:

https://gitlab.com/libssh/libssh-mirror/-/merge_requests/104/commits

I've found one working solution so far.



	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D




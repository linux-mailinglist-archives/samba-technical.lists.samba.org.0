Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F8B23C51
	for <lists+samba-technical@lfdr.de>; Mon, 20 May 2019 17:38:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=Ij3t5MJDXjw/k6V7GkoOK57CIliAjDJjP9TdoLlgjgk=; b=N3yqPiwd0BGWbrnKUjqzQamtxy
	P5wo0kBs+g15YFKaOeTBZxnT0hdN27ff/vXq/4jEsubReB1mEqaxEnVyHGeyIgqDlQWd4sbpzcRxu
	gr+W+bVfIFm2KSyfmwTeWVySPZg62F5AqzE5Zsy0Lv8NLXiGBMyIOAot2qMiR+XfX+SVZ3sMyCl+T
	2eLS4vL2qyw0JlDc5ndbENqmimWnhGX4cioQw8BJeQX3V67DfRA2ZEye3/R7RZs5otvJCjen2UB4C
	Hc9zPndK1Q0btbcUOekCdBMfIsuILOls6sw3izEhnahCaRf1KIqC2v9voBKoAmPF65qbvruEsXOkL
	ihsBaKvQ==;
Received: from localhost ([::1]:61664 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hSkMC-000jFl-WE; Mon, 20 May 2019 15:37:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:50388) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hSkM7-000jFe-TM
 for samba-technical@lists.samba.org; Mon, 20 May 2019 15:37:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Date:To:From:CC;
 bh=Ij3t5MJDXjw/k6V7GkoOK57CIliAjDJjP9TdoLlgjgk=; b=IPLcqD8cccsWxU/+um0hY64Rfl
 dnDLsxVJf2g1OEXy8Ehplk9Jci6fmIbHhKDQumpuvbQZawoX+kqlEPidBS0KA3OF8CnExPA2gRD0o
 nCA8xKYAATc1LXi8mg5lqPOdAU1tjtcv06bclUifSqOn2sGtQEvi92BrAt2E08Ts8rWs=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hSkM6-0001RD-5w
 for samba-technical@lists.samba.org; Mon, 20 May 2019 15:37:38 +0000
To: samba-technical@lists.samba.org
Subject: Gitlab CI for uid_wrapper
Date: Mon, 20 May 2019 17:37:35 +0200
Message-ID: <2633872.RVl2Uuz1bL@magrathea.fritz.box>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

I have changes to enable gitlab CI for uid_wrapper. However I need someone to 
review the stuff to be able to push it upstream. The patches can be found 
here:

https://gitlab.com/cwrap/uid_wrapper/merge_requests

Could someone pick up that task?


Thanks!


	Andreas


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D




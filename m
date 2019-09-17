Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEDFB4A27
	for <lists+samba-technical@lfdr.de>; Tue, 17 Sep 2019 11:15:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=WwZjg/An37zpDJkGII+mxEpLBO455gH9xkJShYxLqhw=; b=hAqECju+bbbzpqOTt7hHY+DDuX
	6EczyDsS8HbVNtLozkCHVDoBmZtp0nDC5CZ5EnWdMaAgmnRLMKkmmyuW8EgM8YnvPH1ONZnlxQbbw
	Mi3VjphPrbicY/wAvSMB+TukX4k3sVUL/FtjKv3ZmCo5fJ/QeoP9Wf8q/l4wI1v8Q9kSt15nAvIvX
	/MdjgfxcVXhy9E7tG3cMdgjUYgd/HfUSAr5A0xJaH+NTxta53SD2VhNbkOrbld9OBUPlA2v4NHZZT
	MWkFF3aK4T4iyoddAx6jkvTtXs7JcAmQHgG4JQi4dpY3p/c1yC/CAdrQ0S6lvZAW1271I6hNgmuD6
	IMzjXmQQ==;
Received: from localhost ([::1]:25488 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iA9a2-006ADw-84; Tue, 17 Sep 2019 09:15:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54330) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iA9Zy-006ADp-FP
 for samba-technical@lists.samba.org; Tue, 17 Sep 2019 09:15:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=WwZjg/An37zpDJkGII+mxEpLBO455gH9xkJShYxLqhw=; b=hFFrGggr+h7TOUz2bN3sq8zsJM
 fR1VONpY8z4j42bZKG/2aEorZULo3TORyP+vPWr9+JwkYaTRFWcEnnMfnLY+sqXcuqU3sD8N1nAdp
 3g743vSS1P7qIoiNSyND5wtSFy+GKM3DZf5mRiKJIAGvV8G3LwJhpxv6rKS+IJvpiei4=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iA9Zy-0001lR-3M
 for samba-technical@lists.samba.org; Tue, 17 Sep 2019 09:15:22 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: [Release Planning 4.11] Samba 4.11.1
Openpgp: preference=signencrypt
Organization: Samba Team
Message-ID: <43d2884c-c637-a028-2f17-9857483a11b4@samba.org>
Date: Tue, 17 Sep 2019 11:15:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Samba 4.11.1 is scheduled for Tuesday, October 29 2019.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.11
has been updated accordingly.

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de


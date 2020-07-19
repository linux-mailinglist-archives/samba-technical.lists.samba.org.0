Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EDA224FF5
	for <lists+samba-technical@lfdr.de>; Sun, 19 Jul 2020 08:50:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=r7vh7lajWGx3ufodSqQRtDg6YskZAt6UPbCVO9PjpvU=; b=DH6Qb6ZxeCIoVwZixNToRezsVI
	OLnzhlV1B281RQidYksECw5zchptzvrNaq3zcOgBwomyjLIq2+DSqJmHCMO4VUI8HjOPOFhf+ePM6
	r8L5XkXsl79fAjUz8lfzlrqmMsj6GkcQ4BK79qKgVc0yv18ksMF17MsFwbsnywXInaen5C+TQQPjK
	7kHN9larP69qOsItOhVRK48tat1Bi2h8hMHClVaYTm7HG/VII/fc8XH81NbxXY8NZb9oqF0FSfMw9
	QtuLTwELzYyWPoPAwUsgeRpDrVqtshns6d7H/rxXTGvfykyf97Ohm3OP08GMyPYmtBdL1ddahUHFZ
	AkrSmsXw==;
Received: from localhost ([::1]:55658 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jx38o-008gG5-So; Sun, 19 Jul 2020 06:49:42 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:39941) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jx38Y-008gFy-GX
 for samba-technical@lists.samba.org; Sun, 19 Jul 2020 06:49:29 +0000
Received: by mail-ed1-x530.google.com with SMTP id b15so10626048edy.7
 for <samba-technical@lists.samba.org>; Sat, 18 Jul 2020 23:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=3eYzl9At55yE65OOXpnU8kQ9GWI34x4pyNj39Bm/+oc=;
 b=rHEicfjb6m5EcwEBKmNS/yhdDvMvbpUCJjJIdRgtQAjgFCha8MSRBmXOSwFgOnBe2r
 fhKyyvlHRQG2belHixtrSWrI1hG2miGC4LZsqYvlZD5LY2k4bM+R6uMNwYE+3XLjDy6E
 CQTh4XPF6G99tcL2YGmSYN+r6GGBx+hvgAphw+zjUqE3PiLjHly6FJcEQZcSI+ElaRMl
 EfshFpsPbshpHal/t15N178QCc8bOLELp+cC92zOtQz9k9hLVUR0BOHtL8E1qzN7zCmX
 +55gE2Ijpk6i/zhHEQ9bgoIiKhM+D0vG28k/RVhB1YKbEvg1iFE5BWmVQSlJSWrim09M
 aj8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=3eYzl9At55yE65OOXpnU8kQ9GWI34x4pyNj39Bm/+oc=;
 b=U3qIQCol8cTqaplfPVDjXWpFppj6QQ2QiP5ox5l1WROI7ja/VW0T9peQQiwbBBjc9n
 qRsvpTJRCN1el0O+2EFmlqh8NFhSoBjP47eg/o9Oh5hN2kGj0+TeqyLoIEYyzpoEIQbX
 UHC0nWHSqsjq00FHB/eey24fOxnB2sOkdYQzsBIdaJwYHsBssBDlRD6/Y5fRbfZkxllY
 /XlN2mKuPD6j8sawGIdmOP9fVPSn42kZmyMxZ3XMR6JoA+CKrWCcFLF1twcsa4IGe1Ql
 J6UF4h/4m0KM6VVlgigMNjJPq6pHjaiir6L+NYB/VUFoL5lBTMMArlb39OSD6MmB8/UM
 lMXw==
X-Gm-Message-State: AOAM531qviJkDiDN6QmPA5CkCc+UuaTJGWr1057a/10o8UWHBdbki+cC
 plaRu849hkgx0Dy0m/0nJPUs8qYxXcI+8NihzoU=
X-Google-Smtp-Source: ABdhPJy5Bs7GQURxpJ87z1AzErILlbA+vjyQZ5EQNTqzHasdYlme08zc/70lSs2uVHCL+UOLDmfFmrZnKCmOQ6SRHsk=
X-Received: by 2002:aa7:dd8e:: with SMTP id g14mr16977052edv.208.1595141365781; 
 Sat, 18 Jul 2020 23:49:25 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 19 Jul 2020 09:43:48 +0300
Message-ID: <CAH72RCWDx2Qsn3jo8_hAMC0m_8VwDHxxvg6JL8mwdEGR5TxN8w@mail.gmail.com>
Subject: GSoC 2020 Progress Update
To: Alexander Bokovoy <ab@samba.org>, "abartlet@samba.org" <abartlet@samba.org>,
 Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: hezekiah maina via samba-technical <samba-technical@lists.samba.org>
Reply-To: hezekiah maina <hezekiahmaina3@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Over the past two weeks I have been working on the following:
Packaging for Debian and RPM-based distributions
Domain Management components
Delegation Management components
Service Principal Name management
UI improvements for the application

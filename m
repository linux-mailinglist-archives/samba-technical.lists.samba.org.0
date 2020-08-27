Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D06255139
	for <lists+samba-technical@lfdr.de>; Fri, 28 Aug 2020 00:37:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=oRjmTuuwAWkwI52oBmLUh+y+tVroPnSUrIqkKuK07Ho=; b=CobBBh3Am7nSiimq6r5hnGMHra
	3/w93GJfk3jR4KrRBNxHVYgmR2kL1ghFj/BlUgBQA2zigsAFPFt4mvkcT7WKdoSzAP3yNq0ot4AW+
	Zo+DMkerzOiGKWvHdzkiNmhuPVBbz8djAoAqkiQ8fBI4WxusVzP+YIbmivuEvq+93beyQeK0af4dJ
	pUkq90CFGqWLKzheRlF/0ZxPebnfwSIERthx6G0vii40Dvc9BeVZGPjRo8QIspScOYwj7v7K+9Hrm
	YDJwk8B0ifCI7wVDp2IEnjEepW2r3c74YjByKcMjTxwSM4kSLQAYbtIGVCCfnh8HLToFde9o7a0GC
	PR5kBcKw==;
Received: from localhost ([::1]:18128 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kBQVY-0011Bp-7v; Thu, 27 Aug 2020 22:36:36 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:44064) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kBQVR-0011Bi-7P
 for samba-technical@lists.samba.org; Thu, 27 Aug 2020 22:36:33 +0000
Received: from [192.168.1.110] (unknown [114.23.142.188])
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id DBAA880888
 for <samba-technical@lists.samba.org>; Fri, 28 Aug 2020 10:36:08 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1598567769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oRjmTuuwAWkwI52oBmLUh+y+tVroPnSUrIqkKuK07Ho=;
 b=j5pBNBsm6w550OEEKtOJkx6hHE/U+DVfZgZow6izJd6yJNVEtVOcYkexZBvAUiTs4WwVg+
 z0EFGVdMFP2H0PurZcsKp6gImyIay6fGsiPKBF1tdesrwmQwi3N7+zhrRz9+Q2n4f5vf5U
 a4LEukO87QiG+hM0K20zXEmB/ETPi1P3yAMaqnQpcO0251GOMP6L8r/Q0EybJ5/9ocxyfE
 Sy4igEInihfb7sRA33r5bIoaCs36dbrgTiYwGaBv2379Sj1BZYUD670r5bGnpVorpUe25U
 bBOday9oUhYWcEkfyC1nqJ/n1Mug0+jep07qaRuBH96I/E0qTVH4RD0a0BN+Xg==
To: samba-technical <samba-technical@lists.samba.org>
Subject: Down to 5 open github pull requests.
Message-ID: <75617102-d5aa-a052-a4ad-c8c56f433861@catalyst.net.nz>
Date: Fri, 28 Aug 2020 10:36:07 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=douglasb@catalyst.net.nz
 smtp.mailfrom=douglas.bagnall@catalyst.net.nz
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

It seems github-bot is still awake, so you already know that PRs are closing.

There are 5 left.

Those are ones I didn't completely understand or dare look at (due to
mysterious phrases like "SunOS" and "wide links"), or which seemed to me
to have specific non-crazy value to the contributors, notwithstanding
implementation details (e.g. fix compilation of ffmpeg with libsmbclient).

I am going to give those ones a week or so to show signs of life, before I
close them too.

If anyone thinks they have a github PR they want to rescue (that is, push
over to gitlab or email as a patch here), now is a good time to do it.

https://github.com/samba-team/samba/pulls

Douglas


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E5924452A48
	for <lists+samba-technical@lfdr.de>; Tue, 16 Nov 2021 07:02:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=8P6w6Whabfi8JtIV6wN7lJfumYkrx1Fz4I3s6g/2Cvk=; b=K8XhoVNKTlk4SWG+U+BudVsjkA
	yAG7FOLf2gt8pSKxZgCSdgPacA/zvOoomGnuEJSv4fxP1GTyHiOZs0a6W1lczNjsy4yH7nSOyegZi
	n7KtfEo8jBTevSUnpVjS0ROHhdpNRBsghjRLVs0TtlIvThiU02S3kDz5LY6UBZ4fF/MvNjhyHmBXG
	zpA+bZ83xtTf60FnieDxVN67Je1Ib62jaLo87iPb5XH76bcOt1ZjfHfCM4AbyDF9/JEGEBHOza+oA
	OYCN7C3eXDOTr3pGSU+6/W4XND1Oo26SAeRe58dziiX274psPHfmMLSvqQBR7UFLrVCJVDL333xj5
	CQ90CmfA==;
Received: from ip6-localhost ([::1]:57238 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mmrXT-001mcp-Hk; Tue, 16 Nov 2021 06:01:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58274) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mmrXN-001mbu-CF
 for samba-technical@lists.samba.org; Tue, 16 Nov 2021 06:01:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=8P6w6Whabfi8JtIV6wN7lJfumYkrx1Fz4I3s6g/2Cvk=; b=H1j5U6CpQLp6F/c5OKCY2Wx0dX
 iPACtUKbgbHfYq0x3Q51zUUbz/IKdlk6eOSQFSRxfbHgLvSMH+GB7mQwPfXiCQFiq3uW2arTe5s9t
 VmCeZZtWnoMlwmVlJQJwK4ML0nxhyw0sH8piH8pba/W7d07MAMN1aPtOpoW2qRkplJ3vs84nivvw/
 dZdsfkEK1HQO4Fm5p1MWSuRMijGBDdylg5q0aYxWVk2WeDAi7jITTVDz7ZZMiH5AprVvinN+hJ+VG
 1Cf3K+OcryWtJwxUdmQ9V7xZAo6go4ILEeVY5/XM9bT6KVHP4yKDSAlKvM9nnJvkbxDrPe1w4tq5l
 ckhZPuaFlK3mCuY6ju87JbJpsQQoMqZREkZFMTHww7OquBZW2qB8/MkPt6WM5GG6nxqmYMDVkWXY+
 v4Sg3cZ6Lfze0LTb9Yt6PlVE6S3tfF9fBsDPj9+bp3IrgVw56CauWMfen4bTO2FeP2yg6rZPzIBEO
 /K2AxpZfwmSIOb1QdLtHX+JL;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mmrXI-007J1F-Al
 for samba-technical@lists.samba.org; Tue, 16 Nov 2021 06:01:41 +0000
Message-ID: <9480d292b7a87f26988fe5ab8d43819615e3e329.camel@samba.org>
Subject: Heimdal working around gcc strcmp issue, can someone check Samba
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Tue, 16 Nov 2021 19:01:33 +1300
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

I just got notified of this PR for Heimdal:
https://github.com/heimdal/heimdal/pull/855

Can someone work out how much this bites Samba (and can we just ban the
buggy compilers?)

Andrew,
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions



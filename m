Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 81392174987
	for <lists+samba-technical@lfdr.de>; Sat, 29 Feb 2020 22:42:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=IknEvSs0ANdYoKpisCGhDQSaIxZxPjYQ8kdO2NknD3Y=; b=M3121kZGpqCccbdekNUSwvUYi3
	srj4mfY8iUHE8gnJGuQAiZyh+PKqQzQ8kPGXUTY2f/RT7OQyQuEn/n1fEGwd9M8Tk1A5owHskhdF0
	K1wn2+MUW87bu3emXyYYkR+hlf0686Q8RIkdH2TPstYpqrX7QOL7eFXTatV6hlDCGYJCi7sQ/6qV7
	iOw4arfe2CztPBYixVQwdAYC6TlLywz0phZwtttssWYX2h9ITDwzBtKtQ2Vt3xpdNGp7NC7eNYEr/
	+rzyhyk9BJS5q/+4oiZMrZBHO8kLrqohuxvAyluG9eRMxSWDsl6j0O2S+noFE0ZjziT/cyraFPZdq
	lXoUCcwA==;
Received: from localhost ([::1]:34878 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j89rH-00CZF8-1V; Sat, 29 Feb 2020 21:41:15 +0000
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:36365) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1j89rB-00CZF1-Ax
 for samba-technical@lists.samba.org; Sat, 29 Feb 2020 21:41:12 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id B836C21FC5;
 Sat, 29 Feb 2020 16:23:12 -0500 (EST)
Received: from imap1 ([10.202.2.51])
 by compute5.internal (MEProxy); Sat, 29 Feb 2020 16:23:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=artmg.org; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=IknEvSs0ANdYoKpisCGhDQSaIxZxPjY
 Q8kdO2NknD3Y=; b=o1W8sMFYz4sUpWL2nvf6Iv+gUOiRh1dhbt+EvwLJSNTpf0f
 3Bet/8PjHga+I3JxgCBBus7WohPmNs56Gcv/7t3PbMx/YHnlRcU9VU74zUwncu3x
 jXC+ruU1wHALaljCjAVxKUL+Dx42hOy9QAuQ9k9lbJvnBdHj5x2me46Y6w7vZVOr
 yO1esOYgtP8x68BjI6TeLmZJBKciW1Uhs/W3/pcDa6SJsRembPsyx4h0GlsPxgPH
 KIyWjY5aQj665K1EjOBvOzhomOeJm8RyvPqH/w9wP9apijCP8c4NNhMo5BtNHIre
 pPrao4bcTV8a8m+BwA+i0PYCVd1wJslhImSigqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=IknEvS
 s0ANdYoKpisCGhDQSaIxZxPjYQ8kdO2NknD3Y=; b=Tjbdf7j3+oJR0wA3ms8LCU
 pXNt+vS/1FRl6lGJ0j89MgVrGqcUfUOSOfBwKPKBUMLDNUOBxCJiBcvYc/g4V7FY
 pYc9sNC4KEJL9GP2OZ6nA+SRaeqJWm1mYHpqhcR8BsBTnLLS51ABkI2YLR3E7gUa
 E2AJDr91AWnzXyEb6ZP/xJaWjRAeP0WyVToaOfWfMKd2aRzC7BU44sknIs5qbwh/
 cr34oRlvRQ1tn7KS9yFsjdIvj/HC7dO+74ppWnWa+Bbmk2g8gkQpnxGFAzArUCrh
 geduKz/IFpvm5jN1K+lGW6D6ZVjpAMbRPrkav03BPTbpqcxCSJwTN0V5DLZQdE/Q
 ==
X-ME-Sender: <xms:QNZaXlEIXKStFwJm8mH1feB_FIgNacscS6Z4VBrgRTjoMMQlJLK3nw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedruddttddgudehudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehr
 thcuoffifdcuoehsmhgslhhotghksegrrhhtmhhgrdhorhhgqeenucffohhmrghinhepgh
 hithhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepshhmsghlohgtkhesrghrthhmghdrohhrgh
X-ME-Proxy: <xmx:QNZaXkUnfxD9YropuIxlEU08LtIQCA9pJN7jNLYuRKj-Hp4Cc6Yv3A>
 <xmx:QNZaXgTP-LNzHvHykyOPfAGDpXWVyuacf3wJSEVqDMzNHCFbD2a-mQ>
 <xmx:QNZaXimpsHalTjJbq3VQ4oJ_22sIum0uu4d5W6dt62YhY4ND0iMnEQ>
 <xmx:QNZaXia2x96VHFaGoY2l_Os8dUni0Q-fik4A_uHEYbpsjPGzn3S91w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 17FC9C200A4; Sat, 29 Feb 2020 16:23:12 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-967-g014f925-fmstable-20200226v1
Mime-Version: 1.0
Message-Id: <8876f34a-e659-4a31-87d1-676e7a7a43b2@www.fastmail.com>
In-Reply-To: <058076d9-60d8-4967-805b-3b2cf718600b@www.fastmail.com>
References: <mailman.231.1582110513.713.samba@lists.samba.org>
 <f09b7d28-4b3d-4211-b151-bb51d783ef4d@www.fastmail.com>
 <20200224193237.GA15759@jeremy-ThinkPad-X1>
 <d3a08bb5-3f56-4c51-b50c-78b7aeacb75d@www.fastmail.com>
 <20200224203401.GB15879@jeremy-ThinkPad-X1>
 <058076d9-60d8-4967-805b-3b2cf718600b@www.fastmail.com>
Date: Sat, 29 Feb 2020 21:22:50 +0000
To: "Jeremy Allison" <jra@samba.org>
Subject: =?UTF-8?Q?Re:_[Samba]_vfs_fruit_disk=5Ffree_fails_on_tmsize_overflow_wit?=
 =?UTF-8?Q?h_macOS_Time_Machine?=
Content-Type: text/plain
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
From: Art MG via samba-technical <samba-technical@lists.samba.org>
Reply-To: Art MG <smblock@artmg.org>
Cc: Art MG via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

> On Thu, Feb 27, 2020 at 09:25PM +0000, Art MG via samba-technical wrote:
> I will raise the PR shortly from
> https://gitlab.com/artmg/samba/-/blob/artmg-tmsize-prevent-overflow/source3/modules/vfs_fruit.c

I added the PR #1184 https://gitlab.com/samba-team/samba/-/merge_requests/1184

However I added against Master whereas my branch was taken from v4-11-test so it is showing over 300 commits. What is the best way to fix the PR?

I appreciate your guidance
Art


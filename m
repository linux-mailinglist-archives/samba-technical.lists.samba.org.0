Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A74EE8D1A66
	for <lists+samba-technical@lfdr.de>; Tue, 28 May 2024 13:57:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Zc23hdEHBo5kKRPkgEHrdaLud6IaC0z3onzDIz+YR9s=; b=jz5EA3De4MHhPQmv99721+suBD
	ejp1D6g9AA17XOpfcun1ovHsrTLN+iFfvhO6qk2cGrSP52cHtj7eOKCCeCpKCXBD/lB5LJlSGkzyx
	XACrbDjBPbMoGf23EPFlRrxhvYL2jMLzOOmvEopZF6iUHdGZ47/iKL/4PZVqSHuY6pZwriJ8J/BlB
	R963AQrdK3evcF9JYOQcQr0C95FtvRRoaJJqmHd3WYfFuD/jBhwbYU5lmDVVBRQd0HP1U/lYzyL9/
	PusGYh90UEqtgqlENdv1xj2dsKJq2xD08OSqgeRZnffOziqcjx3Eco1JYisdNhmsMiOh/M0JqMlhN
	ke6p3fmg==;
Received: from ip6-localhost ([::1]:55170 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sBvRk-00A8is-Jm; Tue, 28 May 2024 11:56:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42216) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sBvRg-00A8il-UC
 for samba-technical@lists.samba.org; Tue, 28 May 2024 11:56:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Zc23hdEHBo5kKRPkgEHrdaLud6IaC0z3onzDIz+YR9s=; b=jrAGxB3+TcXNM358P+HIz+lJVy
 i8K7Kq80PFTqh4E5jjhEOFFh4t6dvDys7Hlgqc4qmwIt1uV17onb9gTB9p2s/ZEqEDWmiV8dNyvQy
 cKRmNzsblND1LqRoFqznAHbpdQav9FD3TCcBL57aoiMqFcKGB8eay3wCoE4zeulgy2TMGCIJ5eDoq
 YkbNCnAtyTmTT/L0xE+UKuziIMspIfic1uMuNbAhjZ4hFrZwjrrpklmDBPUnDYoNos0f8FTaMDXiw
 UHXOAKRu+L6KYzxFmdE7QoNNljnwoyYxtVmOVXlyIQv8pFuHo/aqp2lA5QT7Icd0HmVdPi1ETseWU
 uzNOghJ9T4KrjI6oavSRVc8OIYQDxNjvbNPbvqbezrGEjY1iAt3fvQ4GwA4RWD2vhaiYSKSorNc5+
 pRYu1750zPB18hhsckzG12svae8dqpJ9fzCEVfXyaSU/IPJhHSvESaMi1RdAOzBl3QOnW3apzm7mQ
 ZB9idrEjzUO3RhDeDsWYwbFp;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sBvRe-00Dc4p-0n; Tue, 28 May 2024 11:56:46 +0000
To: abartlet@samba.org
Subject: Re: Fwd: Regression: ldb performance with indexes
Date: Tue, 28 May 2024 13:56:44 +0200
Message-ID: <5597028.rdbgypaU67@magrathea>
In-Reply-To: <2090201.YKUYFuaPT4@magrathea>
References: <4856178.OV4Wx5bFTl@magrathea> <2262962.t9SDvczpPo@magrathea>
 <2090201.YKUYFuaPT4@magrathea>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, 14 May 2024 16:31:53 GMT+2 Andreas Schneider via samba-technical 
wrote:
> > Using a red black tree doesn't solve the issue:
> > 
> > $ bash repro_dev_ldb.sh 10000 indexes
> > RED BLACK TREE
> > RED BLACK TREE
> > RED BLACK TREE
> > Added 2 records successfully
> > RED BLACK TREE
> > Added 10000 records successfully
> > 
> > real    0m9.299s
> > user    0m9.212s
> > sys     0m0.263s
> > 
> > https://git.samba.org/?p=asn/samba.git;a=shortlog;h=refs/heads/asn-ldb
> 
> The thing is that those subtrees have 4 entries, with 10000 entries we walk
> 4x10000 so 40000.
> 
> This needs to be optimized. As dbwrap_rbt is similar to tdb we share the
> same problems. Those could be removed if a real rbtree is used.
> 
> So someone with more ldb knowlege should look into this. I dunno if we
> always need all those 4 entries and are then overwriting stuff or if we
> always traverse those 4 entries but don't have too if we found the one we
> need.
> 
> With two rbtrees we could just push nodes from one tree to another. It is
> just pointer that should be fast. Allocating memory and traversing is
> probably what makes it so extremely slow.

Andrew,

any comments?


Best regards


	Andreas


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D




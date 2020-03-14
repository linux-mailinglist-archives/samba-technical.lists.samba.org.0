Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E4A1854B8
	for <lists+samba-technical@lfdr.de>; Sat, 14 Mar 2020 05:59:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=xFoyW43hDXXeCgLaC5BSGF7eL2y931ZOwE1D9bkhHPg=; b=sw6R5/ERfoQZlhq+7anVn9AavT
	bWnUmQn99ERx+fpJfqWnzd9LKJBblZA0Z17zaBDoS15K8mVUTrGB3NiCHle3a94f+f7om5PZb7LrI
	CPX5LDP0EL5uaH68me0n5SH2bm/nGGrnMns+spuVfqihsyPEI7kWZ7fbQy41a0goFYImDTOTDqiDN
	0BK0HpQEFZ8dmX5Zfnfjg6X6S6S/TpCJiw47CGEQPNT4eSCe/VwVEt+OJqtQ/pW2l5/vIJOB82bwv
	r3Xem6U15My0fNu1odKjrycxNu/k/mZ+nzNpRJ+5l8/ncSbJWXuXtshboFqsjW/w8iRXRu99xCtA4
	RAwLWjzA==;
Received: from ip6-localhost ([::1]:34820 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jCyso-00G2lM-LL; Sat, 14 Mar 2020 04:58:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:22166) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jCysj-00G2lF-TX
 for samba-technical@lists.samba.org; Sat, 14 Mar 2020 04:58:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=xFoyW43hDXXeCgLaC5BSGF7eL2y931ZOwE1D9bkhHPg=; b=NrDZcvhMiFHb/klaOWvMCvhJwM
 W5uG9C8uaQudrlJN1b4ylEC+ce2fp8yHzoOSBG62KqFiGbZeiEqmz/tBhR6OUviuxz3zQyGMxA5te
 vZ1nYbCRRFj88Hf02tq5wCPnbcaiA+cXSLjSFWhUWYjzSwO/i6DytoFz/mP6ixzkFAi4cqUQcQJLt
 VEYizsP16JzC2w9TIc9McJ3SGyOnB0cVV8H2cz48TSk8bAI6yACgJt4aHna8BBy8RIqRmx5qvxgaz
 2vKf0g/ovYWolXwhO4qXXoXPxx/dAm4dYKQ5mu1p1z2ltBPKKM96t26JZAwyb/nzLpUR9BP2TVUcF
 IhsKhrxGepvGZNMjwn3gat0/6wGYcHA9ujp3Qe8xkggFkHJZouMRlqinTdgv3g00sxaCcyfNVGa6s
 jGoJ7bpc/UQEC5x7GvP9YvmO1v5me5+3NK1pY2f/31Mea7zxS5DnPT7ktU2odcL6FWjIlC6bhohNT
 7IZGc/hlhM4hntvxE01auvuM;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jCysh-0005ae-2s; Sat, 14 Mar 2020 04:58:39 +0000
Date: Fri, 13 Mar 2020 21:58:35 -0700
To: metze@samba.org, samba-technical@lists.samba.org
Subject: Re: Fighting waf for C preprocessor output.
Message-ID: <20200314045835.GA22912@jeremy-acer>
References: <20200314031555.GA16932@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200314031555.GA16932@jeremy-acer>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Mar 13, 2020 at 08:15:55PM -0700, Jeremy Allison via samba-technical wrote:
> Does anyone know how to make waf generate
> the actual gcc command line it uses to
> compile .c -> .o ?
> 
> Doing:
> 
> PYTHONHASHSEED=1 WAF_MAKE=1  ./buildtools/bin/waf -v build
> 
> causes it to dump out a python array, bracketed
> by [] characters, but I was hoping not to have
> to fight it any more :-).

Never mind, I turned it into a command line using
the magic of Emacs macros :-).


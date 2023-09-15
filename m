Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 603B37A17EA
	for <lists+samba-technical@lfdr.de>; Fri, 15 Sep 2023 10:03:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=19/cuoNTfPR3J8+gXeptbW+zCEJ2VfjjEFfbZXcz2go=; b=wXR2IKq8yXHuiPQ2yyY4ShvaK4
	I3Ncpg3JS6X5wP1PhlXAZUH229MloDg/dgCzj2SEtDnewLiI82vgrXf1udMspejZEvUL+/ZHpVxyX
	e8wHAIHZVXINVm26M2klKG8Tz7CuUZUCZ0/mmfUCMOzepv20acmLbh2+sd8hrp/kiMCdKL6YBJAff
	NKz1rxXoQbHBiFscrXIA6RYUL0hla7IRu5+wb0SOHNnU+g5aI9HFbknUsL7qq40aed4cBRXDk3Bak
	7do4waEBks58llwdDP22z4Q8wEJq3BrOEnrqIVgOvMB6qtIgKR3yPHf/1tO72ivzKR9cKgf3HuZNF
	6K+pTtFw==;
Received: from ip6-localhost ([::1]:37250 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qh3n0-004VP6-BQ; Fri, 15 Sep 2023 08:02:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30882) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qh3mt-004VOx-14
 for samba-technical@lists.samba.org; Fri, 15 Sep 2023 08:02:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=19/cuoNTfPR3J8+gXeptbW+zCEJ2VfjjEFfbZXcz2go=; b=loWrDSy7nYiz4vIk6OYyqwYLkm
 sAXSyjCK7PAysWlhLZJIn4VZgirb8CpdBHB4Bx/ux9dO0cnyCTeeXO5WexJhCHZSqaSh1okUfMenR
 gZuIrJSmtroKtiNIJ6Lv97FkuIw7eqS9vBVjAy9xcgAbfTAe5xb68zM6t1bMDpa4i9a2/nzjZWeQP
 8ewbETn12MRkcGosZsonruFe+iPFGIZpJ+qOKixPuPhs/Y5RgVZfo715vDbwrjR32lXmteBNYKpZ9
 gY50UQKziMpQieYBppY8EXmA23WIey01DR8vDa11qmaSkN4nlcRyBxkpTS1I9AEOdpoyZOXyodWYu
 d35cXpe+qtDmCyaLQep37zbyShNME9EsVJQe74hpcsE7bNGPJMyfPPcMV8dXFGIgS2a+S2GdVvGCV
 Faf4xj3/hN/2cFRdGed5VXFIRQOWNpQqSK9RUirGlxO1N7wKVAOp3+ockcEn7elyMu0Ixz1bYy8bd
 itpjAwIJjuQtsydwZBNB1kUR;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qh3mq-00DeEu-0M; Fri, 15 Sep 2023 08:02:48 +0000
Message-ID: <10fa91cb-8275-b297-5dda-458cd292773c@samba.org>
Date: Fri, 15 Sep 2023 10:02:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [SCM] Samba Shared Repository - branch master updated
Content-Language: en-US, de-DE
To: samba-technical@lists.samba.org,
 Joseph Sutton <josephsutton@catalyst.net.nz>,
 Andrew Bartlett <abartlet@samba.org>
References: <E1qgurV-00D6IX-Sc@hrx0.samba.org>
In-Reply-To: <E1qgurV-00D6IX-Sc@hrx0.samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 15.09.23 um 00:31 schrieb Andrew Bartlett:
> commit 5c580dbdb3e6a70c8d2f5059e2b7293a7e780414
> Author: Joseph Sutton<josephsutton@catalyst.net.nz>
> Date:   Mon Sep 4 13:20:34 2023 +1200
> 
>      s4:kdc: Add correct Asserted Identity SID in response to an S4U2Self request
>      
>      I’m not sure exactly how this check was supposed to work. But in any
>      case, within fast_unwrap_request() the Heimdal KDC replaces the outer
>      padata with the padata from the inner FAST request. Hence, this check
>      does not accomplish anything useful: at no point should the KDC plugin
>      see the outer padata.
>      
>      A couple of unwanted consequences resulted from this check. One was that
>      a client who sent empty FX‐FAST padata within the inner FAST request
>      would receive the*Authentication Authority*  Asserted Identity SID
>      instead of the*Service*  Asserted Identity SID. Another consequence was
>      that a client could in the same manner bypass the restriction on
>      performing S4U2Self with an RODC‐issued TGT.
>      
>      Overall, samba_wdc_is_s4u2self_req() is somewhat of a hack. But the
>      Heimdal plugin API gives us nothing better to work with.
>      
>      Signed-off-by: Joseph Sutton<josephsutton@catalyst.net.nz>
>      Reviewed-by: Andrew Bartlett<abartlet@samba.org>

Shouldn't we backport this?

metze


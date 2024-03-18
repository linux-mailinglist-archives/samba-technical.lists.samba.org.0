Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 386DD87E3AC
	for <lists+samba-technical@lfdr.de>; Mon, 18 Mar 2024 07:29:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=0I3bYIJj0YR+K/qPvlachxMPLQtrp6BTdnRgGFSd/L4=; b=H8XF0HUCHhJn6m4d7juWr3rzVe
	zeu6kflWZrEAWEvif9a7SqIQhXcUm1dIeadx0Vefzz8FA1+ISaqg1gcg/yPzFxgr5u2yEopkx2Bj9
	uV41LMKzow9oYHr4PRX6hEAev3Cs3vFA9njq4piWleJXxBa13X6Y4h/wpX31Hie0K0MoW4sXCrj+D
	nWf3QV/bbUEq63bTRgJAWbtOY2X7N1g4NiVsDkJm0c4TDF7erKyytBCmQd17So/bgW+M3jiTWv4KY
	z/KHvrTSY06tljxfeLmL7CTiMuM5o0KgvPcfXJlF3B/l4HP3MJVQq1PiJb17gvu3gvVBVGm46Oi2m
	aIdBl1Gg==;
Received: from ip6-localhost ([::1]:59794 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rm6Tr-000cSq-Pl; Mon, 18 Mar 2024 06:28:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29920) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rm6Te-000cSj-BP
 for samba-technical@lists.samba.org; Mon, 18 Mar 2024 06:28:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=0I3bYIJj0YR+K/qPvlachxMPLQtrp6BTdnRgGFSd/L4=; b=Emdjvxj4TrEL/gr5D4VyfB1u6p
 gVRmoNWmKa0kYid7hTnKM85VYstfQMc4DuU/VdqNlk8NSa4+E2zSr+00LuplVPF/dg2dlHFVxHkJ/
 00Jipg7nSGGfFdgAQL4fg6ywrQe0svOMR+K7o8SAVAziOLWbhttKyH00WQQmsa55Yz/QZyoy0tSJp
 7ZURHc9DezPlrYZdiUkW+rd3cb/bEGzU8Q3zLw12vACP4oI1iGkKqfcBDNDmZnidmNL4sfN+HfVEX
 hqLyKIsVuBNS8ASWoo2+sMFwAk0QUGCbqbSHAiguWA0aM4fxywd0075TvUb5afXZLiXpXErychb12
 Yh/wCt5u3Q1dGEZsMaoqo7nFm1rqW22gz1XqnUnLJTUg91cQYxrIVIjYwPmKVNqjQ+zh0l3mJCtJN
 VmJBZ4AOXt4IgCIbxGImouqVr2rajo0XHIh8Fo8PgtF/IQSk3BlVqwgpLM4VMVKP+DYU7WdCLfYsw
 DBVou6NTu4LtgFiqO0n7MGfR;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rm6Td-001WEZ-0i; Mon, 18 Mar 2024 06:28:05 +0000
Message-ID: <9798849ee0a75b7a9c6d05104eb23f589dbd4f72.camel@samba.org>
Subject: Re: libndr 4.0 issues.
To: Michael Tokarev <mjt@tls.msk.ru>, Upstream Samba Technical Mailing list
 <samba-technical@lists.samba.org>
Date: Mon, 18 Mar 2024 19:27:59 +1300
In-Reply-To: <5c521818-f293-4549-9d3f-afce5354fbf1@tls.msk.ru>
References: <e7c468ef-5466-4ae7-97c9-39c9fe6d627e@samba.org>
 <9aa8499f-c764-4963-8112-a3f571f2a237@tls.msk.ru>
 <9dbc25ad89a932a035c943c7a4b9c1de37441996.camel@samba.org>
 <6906e5c4-edbf-4731-a254-3a08bc4b3e31@tls.msk.ru>
 <5c521818-f293-4549-9d3f-afce5354fbf1@tls.msk.ru>
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

On Tue, 2024-01-30 at 14:09 +0300, Michael Tokarev wrote:
> 30.01.2024 13:04, Michael Tokarev via samba-technical:
> ...
> > Now, the "right but not exactly trivial" way would be to actually
> > use
> > the symbol versioning mechanism.  It is not a black magic, it's
> > actually
> > quite simple once you understand how it works.  So that will be the
> > same
> > set of (wrapper/compat) functions but done in a stright-forward,
> > clean
> > way, without hackish re-#defines.  You write
> > ndr_size_string_v3(uint32)
> > which just call new ndr_size_string(uint64), and mark the v3 one in
> > the
> > ld script (or right in the code) as belonging to the previous
> > version.
> > Having ABI/*.syms files makes it easy to implement proper symbol
> > versioning,
> > but this has to be done (so at least some python/waf code needs to
> > be
> > written), and done in a way to be at least somewhat compatible with
> > the before-versioned symbols - that means, at least on per-library
> > basis,
> > after ABI bumping.
> 
> Samba does use some form of symbol versioning already, so there's no
> conversion needed.  But it does not allow for multiple versions of
> the
> same symbol, and the versioning itself is done a bit wrong.  Namely,
> current wafsamba only looks when the given symbol appeared, not when
> it changed.  For example, when a program uses one of the changed in
> v4
> symbols, such as that same ndr_size_string(), it gets linked with
> ndr_size_string@NDR_0.0.1 (it was ndr version 0.0.1 when this symbol
> first appeared), instead of the correct-by-now ndr_size_string@NDR_4.
> 0.0,
> since it's version 4.0.0 when this symbol with this signature first
> appeared -- ndr_size_string@NDR_0.0.1 is not compatible with current
> interface.
> 
> I just committed a change to debian bumping all changed symbols
> minver to current:
> 
> https://salsa.debian.org/samba-team/samba/-/commit/b48cc627abb0ea1aa924de420419dcb2c21616dc
> 
> 
> but this should be done in wafsamba using this @VER mechanism.

Thanks for doing this.  If you are able to help us change this
correctly (eg with a patch) upstream, I'm happy to take a look.

An idea that, perhaps now too late, was being tossed around the
Catalyst office was to patch Samba 4.20 with the revert
of  c75be6c326119a64e95513b3bad3f78522f4587a.  
Depending on how you feel about the int -> uint32_t parts of the ABI,
this could potentially allow you to set the libndr version to 3.0.1.

I think backports (as a general concept) are best done in such a way
that they don't provide public libs (except say libwbclient), but just
in case the above helps with backports I wanted to mention the
possability.

Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead                https://catalyst.net.nz/services/samba
Catalyst.Net Ltd

Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company

Samba Development and Support: https://catalyst.net.nz/services/samba

Catalyst IT - Expert Open Source Solutions



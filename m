Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEA9846A8E
	for <lists+samba-technical@lfdr.de>; Fri,  2 Feb 2024 09:22:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=0gKfR2GXFD3Bp0gGS2UdPKpgs/N4dpJ0BnqLopJEFMs=; b=17CKJcAWINqlT42WgrGg4xaKC5
	ENI065IWFnUlHcOss7WkGhWMqUBFR/rx3E+F5dYA6U/1o1suND2wfgYRiAU2t19sddJF99Kzvm+hP
	N4HBrEGJOkYQEVTfmYIBJV3WmH2V5PWW0EAnlsx5n1VPJC9Q1K9tet5yw2RL+k1fV+FWy8wyfCwaP
	2mO6GIthM5zhDNB/D+wlgAYPTxvaPwtNWX35d0a6veFqQ8jiGIiHJ00H5SGUriv5cghL7HSKG/W9u
	31wKQ/S6V+unsdMcnF0Vio6BAuJ2ADksXFPmDfH10H2KZmGhV6dPPmg3Rq00Inxhz64Twq5y6lz4R
	N6RitTag==;
Received: from ip6-localhost ([::1]:51282 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rVong-007KzF-Jz; Fri, 02 Feb 2024 08:21:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18460) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rVonc-007Kz8-Iz
 for samba-technical@lists.samba.org; Fri, 02 Feb 2024 08:21:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=ud1cJ5lG6/q87mnId8oSSE0DYC5JPpsk1LDLXRxBcAk=; b=snkqocj77ful7BAoH92fokqh3K
 ete2IvbllIBmT2Dn9GFi01nzhfadt+gPb+v/zvr5VTrNjJM7bL2UK9iKItGDyrTxEMj9L1QJmKWbh
 Yl0pX9t8dWlxDoDs7/yc6fsVMp74vGznILHOKxm8O2r+NkiyvxBTcl+WoOn7DCfAta/MxcwzvdFIG
 D8EtvTfxlJIyuWEgxJybWsotdBd1+I4NdCnn0afaW/4Pvy0KIbZ1mdZl2kAjOiCk5XHUen0OOLUNR
 O4rg/iA2zOpjixlBojoXDUUS++TP4hwgNl/Kn7PtaMs/Z7EhLreDbliYtqVlXJVTHfijuCRiAMQaD
 bthnncvwy5y4JGFSdbQPkDThqdj1VX7epHFDE0eD9sSSiWYloqrVd5kcmMBBi6v2WKBszAj4bXgTH
 ZxlsmBx61IRnxrR6H9WmsgXhggD+kYsfHk7rG1Mgu50sm1n1xKCkhppmbpDs/LwhPDpz8bz8haem0
 YfeQP2PETvnoAv5JWAXyfgv/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rVonZ-00B9tw-01; Fri, 02 Feb 2024 08:21:21 +0000
Message-ID: <d117b1ca8691a040dc187a0c7c767acf96c4e13a.camel@samba.org>
Subject: Re: Looking to once again re-bundle LDB
To: Andreas Schneider <asn@samba.org>, Upstream Samba Technical Mailing list
 <samba-technical@lists.samba.org>
Date: Fri, 02 Feb 2024 21:21:17 +1300
In-Reply-To: <2272182.vFx2qVVIhK@magrathea>
References: <7fb8e63cdc9de2c284cffc792c458df3b017c392.camel@samba.org>
 <2272182.vFx2qVVIhK@magrathea>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2024-02-01 at 15:22 +0100, Andreas Schneider wrote:
> On Tuesday, 5 December 2023 04:47:56 CET Andrew Bartlett via samba-
> technical wrote:
> > Just a heads up that I'm still keen to reduce the burden of an
> > LDBrelease at Samba security release time.
> > The rough consensus at the end of
> > https://gitlab.com/samba-team/samba/-/merge_requests/374 seems to
> > be tomake ldb: - for public consumers behave like any other Samba
> > public library (eglibwbclient), by removing the independent tarball
> > and build system.
> 
> If it is done that way I'm fine with moving it back to Samba and do
> release it with Samba releases.

Thanks so much.  As I mention below another of my MRs makes more sense
with this done, so I'll get this done soon.
> >  - for Samba builds by default, to install ldb as a private
> > library.
> > The version numbers would remain, but could then diverge between
> > ldband pyldb-util for example (they would no longer be the tarball
> > number,so would move just like other SO numbers do).
> > We would change the ldb modules dir to have the version string in
> > it,so that modules are not installed for the wrong version.
> 
> Sounds good.
> > My current motivation comes from working on a pyldb change that
> > wouldchange pyldb-util, but also a long-running desire to make this
> > simpler.
> > Debian currently has this patch:
> > https://sources.debian.org/src/samba/2%3A4.19.3%2Bdfsg-1/debian/patches/Forc
> > e-LDB-as-standalone.patch/
> > This makes Samba public libldb as a public library, but from the
> > mainSamba build, so that the ldb build system is no longer used.
> 
> Fine by me.

Thank you so much for your flexibility and understanding.
Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/Samba Team Member (since 2001) https://samba.orgSamba Team Lead                https://catalyst.net.nz/services/sambaCatalyst.Net Ltd
Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company
Samba Development and Support: https://catalyst.net.nz/services/samba
Catalyst IT - Expert Open Source Solutions

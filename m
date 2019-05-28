Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3381D2CE59
	for <lists+samba-technical@lfdr.de>; Tue, 28 May 2019 20:17:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=feP45vmPABjqHenJQ422o4t3Eamg7fAyJx85oa/hVww=; b=cKZAZVVTE06BNJmapZycBuuAzJ
	8ooOJeoa8Jatj2fJeyDlLBo8ZXwey28lMZzOEU8DxGVZUjqmQEUkFER7uUEjtuv2PWLxEsTKxjmLX
	2I0QWg4tUwkauL+sTTGCl3iPa5HV6BXveXfu1md3D9LSnkgKsFvpnrUXju78DSqV/EXGHr+MTKvAC
	o8B8nkAZJk4jpnUf2Hw24JE1RXND7MGQWD0dvyAMqP03nd/0wFrTmFQgX0Zs6hkmGTc/YZ+LZGx8e
	OmJWLSgmxe/SUPeKdCnvXoy34X36uaFT/l9GKl4EKwd9D4gfszF9VoPkJu1bLQeaQ25T0q+xZcwnH
	oISyu1lw==;
Received: from localhost ([::1]:40124 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hVgeX-002NMc-E3; Tue, 28 May 2019 18:16:49 +0000
Received: from [2a01:4f8:192:486::147:1] (port=31378 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hVgeT-002NMV-Dh
 for samba-technical@lists.samba.org; Tue, 28 May 2019 18:16:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=feP45vmPABjqHenJQ422o4t3Eamg7fAyJx85oa/hVww=; b=kx/QyzVjNU+M1H7vNfrEFEqJBM
 vCpWQQl26SHgQ+wAW72ZAyS9Az+pieb4gYPQLbElPqRbtCLfEXLx1TPBcpz9RwDbtPv6dllNrYFp3
 oLedCUAncXVqgD+pYwHbW/GwDljKspCC+t2Zpe3xwwtqcoi7ADT84yzxRfhQuIbyg6x0=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hVgeN-00027z-38; Tue, 28 May 2019 18:16:39 +0000
Date: Tue, 28 May 2019 11:16:36 -0700
To: Alexander Bokovoy <ab@samba.org>
Subject: Re: Implement lsaRQueryForestTrustInformation in source3
Message-ID: <20190528181636.GB2170@jra4>
References: <20190528090355.GB4871@onega.vda.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190528090355.GB4871@onega.vda.li>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, May 28, 2019 at 12:03:55PM +0300, Alexander Bokovoy via samba-technical wrote:
> Hi,
> 
> while working on fixing FreeIPA ipasam module to allow establishing
> forest trust with a shared secret from Windows side, I stumbled upon the
> difference we have in lsaRQueryForestTrustInformation handling between
> Samba AD DC and smbd.
> 
> Windows asks for lsaRQueryForestTrustInformation to retrieve details
> about a trust. We have implementation for lsaRSetForestTrustInformation
> in source3/rpc_server/lsa/srv_lsa_nt.c. However,
> lsaRQueryForestTrustInformation is a stub:
> 
> NTSTATUS _lsa_lsaRQueryForestTrustInformation(struct pipes_struct *p,
>                                               struct lsa_lsaRQueryForestTrustInformation *r)
> {
>         p->fault_state = DCERPC_FAULT_OP_RNG_ERROR;
>         return NT_STATUS_NOT_IMPLEMENTED;
> }
> 
> lsaRSetForestTrustInformation() was implemented as a part of the commit
> d638f4a3b824 by Sumit Bose. It depends on a PASSDB module that
> implements enum_trusted_domains() helper. We have a single in-tree PASSDB
> module that implement it: pdb_dsdb (Samba AD DC). Also, ipasam
> implements it. Another in-tree PASSDB module, pdb_ldap, implements
> enum_trusteddoms() which can be abstracted out to implement
> enum_trusted_domains() -- in ipasam we actually implement
> enum_trusteddoms() on top of enum_trusted_domains, so the storage is the
> same.
> 
> As a result, we can reuse the code from pdb_ldap/ipasam to implement
> remaining part for lsaRQueryForestTrustInformation without any trouble.
> This would mostly benefit FreeIPA because in order to be able to
> establish trust to such smbd instance, one needs more than just smbd.
> For Samba AD DC actual LSA RPC server end point is implemented in
> source4, thus the code in source3/rpc_server/lsa/ did not matter for
> that.
> 
> However, this would complete a missing functionality and if I'll add
> the same code to pdb_ldap and pdb_tdbsam, we can actually test LSA RPC
> lsaRQueryForestTrustInformation in the test suite.
> 
> Is anyone against this plan?

Sounds OK to me, but the devil, as ever, is in the details :-).

I'll reserve judgement until I see the code :-) !

Cheers,

	Jeremy.


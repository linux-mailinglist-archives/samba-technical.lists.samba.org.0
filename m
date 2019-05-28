Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5552C24C
	for <lists+samba-technical@lfdr.de>; Tue, 28 May 2019 11:04:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=yNiLpgA57i0zm/GqV/U0DMfQLUts8Saj9qrpEgHLnxk=; b=zh+HchaVc7E4GutNUVXPCeq+o3
	NpyhiLBBc7gkaHN+J0tJPpEMasWi8eS1aC2LOEnji3wG5TQ6c+JZB7KSBZnAqMYGi2LMFBvGcdCGS
	ylioe0+Kmp7BMMRxafoci1rQ1QIoY8d/B5jZB7Nz8JCKRYx5kkZ4rIImMlB0wtMBVEfF3ESnPMBvm
	zahS4+tDAidA6RiwUwbbSo+vbEaJXIE/uuz5IJgbMAh+Z7WxBjAuu+PI35jlIzXqhIjppXod55EbX
	cdRqp+TeofafDR9sD8A4vNc0Ovso5nvwbom6se59tCtV2ZPZ2SvfE7AsOkZ9Qi+Y5G9qupyUEEU5g
	zudfJihg==;
Received: from localhost ([::1]:56630 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hVY1h-002IeW-7H; Tue, 28 May 2019 09:04:09 +0000
Received: from [2a01:4f8:192:486::147:1] (port=53250 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hVY1c-002IeI-Pa
 for samba-technical@lists.samba.org; Tue, 28 May 2019 09:04:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:To:From:Date:CC;
 bh=yNiLpgA57i0zm/GqV/U0DMfQLUts8Saj9qrpEgHLnxk=; b=RfteqSwYGvcH7Ddhc2f0Ei5KdV
 Cz/i6QqGcGHls0tLQVoREqxXriv41Q4PhBCADmtg4J9kVKDf0g2nqXitIdlNCxJJTcSU0sJCX/8EY
 bs9k3ob5imNiERhINn/7EIBlTK3mq28AiWfuPbvQ9F3OLyiuUfATq1Van/0t+6sHyG7c=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hVY1W-00068t-C2
 for samba-technical@lists.samba.org; Tue, 28 May 2019 09:03:58 +0000
Date: Tue, 28 May 2019 12:03:55 +0300
To: samba-technical@lists.samba.org
Subject: Implement lsaRQueryForestTrustInformation in source3
Message-ID: <20190528090355.GB4871@onega.vda.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.11.4 (2019-03-13)
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

while working on fixing FreeIPA ipasam module to allow establishing
forest trust with a shared secret from Windows side, I stumbled upon the
difference we have in lsaRQueryForestTrustInformation handling between
Samba AD DC and smbd.

Windows asks for lsaRQueryForestTrustInformation to retrieve details
about a trust. We have implementation for lsaRSetForestTrustInformation
in source3/rpc_server/lsa/srv_lsa_nt.c. However,
lsaRQueryForestTrustInformation is a stub:

NTSTATUS _lsa_lsaRQueryForestTrustInformation(struct pipes_struct *p,
                                              struct lsa_lsaRQueryForestTrustInformation *r)
{
        p->fault_state = DCERPC_FAULT_OP_RNG_ERROR;
        return NT_STATUS_NOT_IMPLEMENTED;
}

lsaRSetForestTrustInformation() was implemented as a part of the commit
d638f4a3b824 by Sumit Bose. It depends on a PASSDB module that
implements enum_trusted_domains() helper. We have a single in-tree PASSDB
module that implement it: pdb_dsdb (Samba AD DC). Also, ipasam
implements it. Another in-tree PASSDB module, pdb_ldap, implements
enum_trusteddoms() which can be abstracted out to implement
enum_trusted_domains() -- in ipasam we actually implement
enum_trusteddoms() on top of enum_trusted_domains, so the storage is the
same.

As a result, we can reuse the code from pdb_ldap/ipasam to implement
remaining part for lsaRQueryForestTrustInformation without any trouble.
This would mostly benefit FreeIPA because in order to be able to
establish trust to such smbd instance, one needs more than just smbd.
For Samba AD DC actual LSA RPC server end point is implemented in
source4, thus the code in source3/rpc_server/lsa/ did not matter for
that.

However, this would complete a missing functionality and if I'll add
the same code to pdb_ldap and pdb_tdbsam, we can actually test LSA RPC
lsaRQueryForestTrustInformation in the test suite.

Is anyone against this plan?

-- 
/ Alexander Bokovoy


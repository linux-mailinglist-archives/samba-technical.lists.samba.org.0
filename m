Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA58258CF5
	for <lists+samba-technical@lfdr.de>; Tue,  1 Sep 2020 12:44:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=1bcgXU10V2nJWUf14wdBmxnP8306iWeEEjYDd+N0kgA=; b=MG9d6M3qjF1QTc4U04KMnCINOT
	ZiU6rL+ltycVmxupONwmxsMZBJJp50Mf2mb/iHDygFDaMrBvDf6vGyt15ATVb4F+EAhVpu/CIpyqi
	NCtMS8JEPOvPLurxycetjvSK4VUgSGCi7diAe8c+u4OBKWvxhBEMV/AiR3kfDTvmbiAauncSb6Wep
	kspe9cdD0v1LzV6fLuqYAuaYbZTq4Q+4n792ImvjPR5CX+CyXDDtEpsL3ztgt6bBBks7V3jqrGCJ0
	Up6MQNO1V9aAJ/DUYKd4X2koQszESQOiVkEqWYTEtrj1qXyX649Lp8Xm0iYbGPrR+jNOgcuzxbSIo
	YuvwTc8g==;
Received: from localhost ([::1]:50688 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kD3l0-003Gm9-HI; Tue, 01 Sep 2020 10:43:18 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:44717) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kD3kv-003Gm2-4B
 for samba-technical@lists.samba.org; Tue, 01 Sep 2020 10:43:15 +0000
Received: from intern.sernet.de by mail.sernet.de with esmtps (Exim 4.92 #3)
 id 1kD3ku-0002XN-2x; Tue, 01 Sep 2020 12:43:12 +0200
Received: by intern.sernet.de
 id 1kD3kt-0004td-VC; Tue, 01 Sep 2020 12:43:11 +0200
Received: from bjacke by pell.sernet.de with local (Exim 4.93)
 (envelope-from <bjacke@sernet.de>)
 id 1kD3kt-003CnR-Or; Tue, 01 Sep 2020 12:43:11 +0200
Date: Tue, 1 Sep 2020 12:43:11 +0200
To: Karolin Seeger <kseeger@samba.org>
Subject: Re: PATCH: make disabling of vfs_snapper consistent with our
 configure/build system
Message-ID: <20200901104311.GB760902@sernet.de>
Mail-Followup-To: Karolin Seeger <kseeger@samba.org>,
 samba-technical@lists.samba.org
References: <20200710114452.GB1572444@sernet.de>
 <54f90e98-9d7a-337e-defb-27fb756130fd@samba.org>
 <20200710194428.GA1596727@sernet.de>
 <63044415-9473-1572-2cd5-fa1fa5e012e1@samba.org>
 <20200720170142.1583649f@samba.org>
 <15eadeabe4d9fc23e9a311a51a007fa020781ccc.camel@samba.org>
 <20200812115841.GD272474@sernet.de>
 <38124182-985f-8a79-aa9a-1cbb2241dc3f@samba.org>
 <951676ca1d57de76f0a5494140ebdc985b607731.camel@samba.org>
 <aa86e306-0c2e-763c-bb4c-3ba9fc4a9d52@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa86e306-0c2e-763c-bb4c-3ba9fc4a9d52@samba.org>
X-Q: Die Schriftsteller koennen nicht so schnell schreiben, wie die
 Regierungen Kriege machen; denn das Schreiben verlangt Denkarbeit. - Brecht
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
From: =?utf-8?q?Bj=C3=B6rn_JACKE_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?iso-8859-1?Q?Bj=F6rn?= JACKE <bj@SerNet.DE>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 2020-08-31 at 14:53 +0200 Karolin Seeger via samba-technical sent off:
> The point with 4.13.0 is, that the !snapper in the vfs module list does
> not work any longer (and it does in 4.12). It has been broken by commit
> 7ae03a19b3ca895ba5f97a6bd4f9539d8daa6e0a.
> 
> Additionally, Samba does not build by default on many non Linux
> plattforms any longer. The auto dection mode "build if possible" is very
> nice for vendors.
> 
> Can we revert this patch for 4.13.0?

reverting the mentioned patch is the most simple and straight forward solution
as the newly introduced option is not required and the generic module
activate/deactive mechanism can be used. Any other solution with redundant new
options adds more complexity or and possibly conflicts.

RB+ from me for the revert of 7ae03a19b3ca895ba5f97a6bd4f9539d8daa6e0a

Björn


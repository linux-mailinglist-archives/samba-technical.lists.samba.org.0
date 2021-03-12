Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DA18F338321
	for <lists+samba-technical@lfdr.de>; Fri, 12 Mar 2021 02:23:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Y/WhYYzaPsxPZ7fRN0t2sJtaudHeJ2BDnfWEPDUoOpM=; b=X1G8zs9i1Bu1CGpCrW9AypTiWt
	At+Qom5D74aUzfi45Nbc8AGMYDtN/A5aRUKhLGPy5+9Wvb7uqHzDSbIWO7shptSLIkZ/VPDpEWK0g
	M0ty3dSv3BmEGfpAMgOAsxgAdpWJVgBuay3M+Q9IKxtrpSo4AgoBZrR6suKzwhL+7pcgr8JBcCxbY
	QXyKY8b7LfFOaymldUZfFfzE+MftFQMJehnZ8mPkotk/5Shha49JD1dI90i29z+VqmIF8JF3lRDtK
	4/V/podWwIR/RVVOMVqqCSCXT/q8nEcioTckQbkLgU1IYvU8NaUkYWAjibSDtltpLG/GKTM+ofXwJ
	WDXb1A3Q==;
Received: from ip6-localhost ([::1]:59426 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lKWWX-0056SB-3A; Fri, 12 Mar 2021 01:23:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55164) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lKWWR-0056S0-Lb; Fri, 12 Mar 2021 01:23:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=Y/WhYYzaPsxPZ7fRN0t2sJtaudHeJ2BDnfWEPDUoOpM=; b=1uiVXPaMAk2U3GIszFFYAS1wR2
 ciqZj1YOySgPnandk00DUIbiM1A7z68TiyKBCFCyMw7M51XcMtVF78fJhDHY+KOpf/YdK+Co689jF
 KD+n8zrvIqhKdfIi0Vp7oD1qWqBH0Alme2oo3WxYAfBtagJi+DbXFdnomnfMXYz9YHMp2eKr+WbT/
 HcWKEjq479cfTI6/JN/Y2b9Sv1ClrfbGumECrRZy8wRC4GBnCDEhU45zICRsFDxCopZBvY1Ff/0XA
 Wisl1qu2YCnEhq0W27BQ7muQYjMWQFY8j6gQPF7K6FSAks3BWdhSELW8lVlsaT1ZxsKG1y8hpV9dv
 tyF7GjXXAaO934jPQuqB0ZLOW/XBYwqxZ1PruYhCySzsj9cWsxk5shkddBVyxUKhkTVQOOr71aRWF
 x6Fp1+iGhCxQM7NIZ3uHLIW8KODiSturo1YpfBgCUqN2BxGDK1qNcT6us1dLVhYjVXtAzPGLO0vLj
 B1iDrYSJbIeCw3TiRy6K37Lo;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lKWWQ-0001E6-Bz; Fri, 12 Mar 2021 01:23:23 +0000
Message-ID: <7afd6f64a286d8c0b8616d681e96c75fe81a3f86.camel@samba.org>
Subject: Re: I want to delete the Samba module
 source3/modules/vfs_tru64acl.c for Samba 4.15.0 release
To: Jeremy Allison <jra@samba.org>, samba-technical@lists.samba.org, 
 samba@lists.samba.org
Date: Fri, 12 Mar 2021 14:23:08 +1300
In-Reply-To: <20210312005626.GC1939059@jeremy-acer>
References: <20210312005626.GC1939059@jeremy-acer>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
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

On Thu, 2021-03-11 at 16:56 -0800, Jeremy Allison via samba-technical
wrote:
> This reference:
> 
> https://en.wikipedia.org/wiki/Tru64_UNIX
> 
> shows the date support was discontinued for
> the entire Tru64 OS was 31 December 2012.
> 
> I'd like to remove source3/modules/vfs_tru64acl.c
> from our tree as part of the VFS modernization.
> 
> Any objections ?

We have no practical way to test any changes in that code and I
strongly suspect nobody has even read it in a while:

	DEBUG(10, ("Hi! This is tru64acl_sys_acl_get_file.\n"));

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions







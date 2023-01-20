Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 566DE6756F1
	for <lists+samba-technical@lfdr.de>; Fri, 20 Jan 2023 15:21:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=i/QptElc1Rys5CqmJywuncbTK0Vr1bwZxAuaxjPVSvY=; b=e08GAmIQEfCPoVQxzeLjml/XMx
	Pi7be62TlY+KYPhP5Ez41bS3F9Hvkadj3dwsolCATf0OMpMbFBva1jtEQRl7ve9lT831X3E+9Mmm2
	q3WsX+hNLk/cennN/RWtjg3WHLf27+7kQolV6tfoVwYJidEZ/tTgeId27VCh2kcXSnIihriyXEq90
	1ZdP2dp41s/q/IDcpu79vca7eBygMD8LPTbADQP1B35tIfzB0L+93GyNe/+Yw87bx2InLMSDZtgpS
	jiZqsO8yFV5WgtEXPjZwYFRYEBD2TgcKzcnFpVCCtpmVDq5DGZsSf4VyRKg1uUZI457Xo8VqwRiSZ
	P0qPkBuA==;
Received: from ip6-localhost ([::1]:44302 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pIsGc-001CMY-Bx; Fri, 20 Jan 2023 14:21:18 +0000
Received: from mx.cjr.nz ([51.158.111.142]:50848) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pIsGT-001CMP-6N
 for samba-technical@lists.samba.org; Fri, 20 Jan 2023 14:21:14 +0000
Received: from authenticated-user (mx.cjr.nz [51.158.111.142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pc)
 by mx.cjr.nz (Postfix) with ESMTPSA id D8F497FC21;
 Fri, 20 Jan 2023 14:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjr.nz; s=dkim;
 t=1674224465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i/QptElc1Rys5CqmJywuncbTK0Vr1bwZxAuaxjPVSvY=;
 b=hnQ/nuSjgTb0o46XWymkpchmWuQgCLMXxC3J6dEmG7dImpoRMYBpYt2ZSAMp2rlnWP4H4H
 5neXAY8zBU2uoK8yaV284XC5VDDZ+lRNLggbIFbubPYbMl+cif2+3uKGAS/NWYqAsf9Oy3
 Y+1bV1YrA/rRlext+QoRd1gbY5DCjTU7hRzF2yUuv2KW4X2uGqNLKVxva8vJJg/mSw6pY3
 b2OIgENbIYDfMxyG92nQ2sfh60d0J8XyjztRSdBko3LEOoEloL0ETDdoQBXEp7tJrqWyG0
 gWQh+eNUzgnqYRAG7fPve8m1f4ujJX30QHCkbP0cMGOcV18lnVa2QF07uHKX5g==
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Steve French
 <stfrench@microsoft.com>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] cifs: Get rid of unneeded conditional in the
 smb2_get_aead_req()
In-Reply-To: <20230120120857.60444-1-andriy.shevchenko@linux.intel.com>
References: <20230120120857.60444-1-andriy.shevchenko@linux.intel.com>
Date: Fri, 20 Jan 2023 11:21:01 -0300
Message-ID: <87r0vpe182.fsf@cjr.nz>
MIME-Version: 1.0
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
From: Paulo Alcantara via samba-technical <samba-technical@lists.samba.org>
Reply-To: Paulo Alcantara <pc@cjr.nz>
Cc: Steve French <sfrench@samba.org>, Tom Talpey <tom@talpey.com>,
 Shyam Prasad N <sprasad@microsoft.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ronnie Sahlberg <lsahlber@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:

> In the smb2_get_aead_req() the skip variable is used only for
> the very first iteration of the two nested loops, which means
> it's basically in invariant to those loops. Hence, instead of
> using conditional on each iteration, unconditionally assing
> the 'skip' variable before the loops and at the end of the
> inner loop.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  fs/cifs/smb2ops.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)

Reviewed-by: Paulo Alcantara (SUSE) <pc@cjr.nz>


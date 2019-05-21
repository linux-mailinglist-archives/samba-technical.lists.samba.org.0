Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1963B24C8D
	for <lists+samba-technical@lfdr.de>; Tue, 21 May 2019 12:20:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=piC/lp69UifXC9EKS1iD78oSdeWIG0YDjg95J2rlhfY=; b=lTu7pJs24GUTrptrDjC0lqzoCD
	bcIdYoE77c49jeTvXJySB9SJvQIOcxiHjri7NmuNnSn3DKBCUnPqMld4jFggRZynyLZBSJfYK6z9P
	IoUFvGACXsczmQX7ywYlNe8GsdSWwmG41MYL0yWMTR/tIY6cgkzacxe+eAa6jhdornuobz+q+tWRF
	3g+6kQWWXX3A2QJsu04Q241FDH4h0zILeVI/XLZHJ751Y/SkQE4oBio5EhJ34TqXb2dyWsPjahfEd
	wy5kYE0hOqBV/DW2tFyKHXOkbSzJ2QywADyIriEZ/DjtJT6ER3R3UBPVfbXkJhWxC8xMCRg5SvpnC
	ZLRkFzIw==;
Received: from localhost ([::1]:45114 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hT1sP-000wcs-L6; Tue, 21 May 2019 10:20:09 +0000
Received: from [2a01:4f8:192:486::147:1] (port=35522 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hT1sL-000wck-Is
 for samba-technical@lists.samba.org; Tue, 21 May 2019 10:20:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:To:From:Message-ID:CC;
 bh=piC/lp69UifXC9EKS1iD78oSdeWIG0YDjg95J2rlhfY=; b=GZrHupy0P6tBacrfbHsj1OfJa6
 kZf5iHk1oDt8NFsiRLRSVd/+fc9E35KU7m9i/BJvszoKXeC4dhtUxitDTvSLXNhxH+8pNDtGUKsNI
 uXWohurxDoynn6C3kLyxYcD4aEC2NrVk8x47GEZF1GGrtfhAW1X5kTVY4wDSzIXr/Nxc=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hT1sE-00029K-Oh
 for samba-technical@lists.samba.org; Tue, 21 May 2019 10:19:59 +0000
Message-ID: <62f2c20b39ce898a9fcbb5fd2248d559a44bcc20.camel@samba.org>
Subject: Re: Downgrade issue with new ldb 2.0.0
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Tue, 21 May 2019 22:19:55 +1200
In-Reply-To: <1554696019.25595.8.camel@samba.org>
References: <1554696019.25595.8.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2019-04-08 at 16:00 +1200, Andrew Bartlett via samba-technical
wrote:
> Just a heads-up that we have noticed that we need to write a
> downgrade
> script (like sambaundoguididx) for Samba 4.11 (master) -> 4.10 and
> below. 
> 
> The symptom (eg on a dbcheck --reindex) is:
> 
> Invalid @ATTRIBUTES element for 'accountExpires'
> Failed to connect to 'tdb:///usr/local/samba/private/sam.ldb' with
> backend 'tdb': Unable to load ltdb cache records for backend 'ldb_tdb
> backend'
> 
> There is no issue on upgrade, just downgrade.
> 
> For non-Samba users of ldb additionally the ORDERED_INTEGER value
> would
> need to be specified in @ATTRIBUTES to opt in to this feature, so
> this
> really only matters for Samba because it auto-upgrades the @ATTRIBUTE
> record.
> 
> I'll soon write a script which drops the problem record by directly
> modifying the ldb, similar to sambaundoguididx.

So, I've been thinking long and hard about how to do this right, and
what I'm going to do (subject to comment here) is to finish the tie (as
it should always have been) of ORDERED_INTEGER support to GUID indexed
DBs.

That way, the downgrade is via exactly sambaundoguididx, which can then
be upgraded by running Samba 4.8 or later. 

I'll do this in ldb_kv_index_key() and in
dsdb_schema_set_indices_and_attributes().

Thanks,

Andrew Bartlett
-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba




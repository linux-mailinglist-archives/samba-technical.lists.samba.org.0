Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C39D48D2738
	for <lists+samba-technical@lfdr.de>; Tue, 28 May 2024 23:42:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=TarCgMO/fFjl+XyZ16lnyVfYApJi4cR+tTUj1DNAzrM=; b=OBsZ3xAV4rX1lNxQq7eQegIXIP
	R9FPyIb82QE0g1ueowoR2vL1N6rnuLEwJppygZj5ST+MpYbnbEAc36se1uq77JG6wx2PfJZlhRljg
	bBchRbSwLxxeD9UgCXFhFkb56eUuA0hp8qbqKQCwFNYOSUCUj2CfdvKPeL5Onao0sqh2+BHBaihyL
	6bYNWyVI/Q8UeAjVoKq9+pYdMGYiJrvAaEEd3A83pFuZB99jM3zubYV7n1aRxgmNTMSbzcQDgHMLG
	3YE4KoCtagsmoqXP7KZ+rK9n8edRj3OePbbuWDj+83QlKqde0V3sWDfoZzRJ3Pi+hU0dknZJ3cD2g
	oaawiJPQ==;
Received: from ip6-localhost ([::1]:21598 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sC4aJ-00ABUr-4c; Tue, 28 May 2024 21:42:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44596) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sC4aB-00ABUQ-Kv; Tue, 28 May 2024 21:42:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=pxOL2GXoAjwPwqTbWiytv9MlvQB5hBxfYC8cgLgRGQY=; b=XBa31SA/w6ShSSk4gCspgCsXy8
 GUa/JoHSWyMBygV0hjTZSpE4Ntu0HPlZixPv5HlQo34vxvPXPI9kg0LnELlqSYLaRPulBUT4klpS7
 MgGYC44YN4Z3XPsKV93Za3pXJgGKV1inNobpDQWwl1COc4+ehlddlfgm9EMLV9NcVrUE0wUMc4tZ/
 xMURNvaCgKfzZKI/rLE+OZq0/uZrCHuGvsL/7HN3a1zGVWcQ2G4OoG+znzhrL8GTbFcNjYFpOvrqI
 y/1qOyxnSPdcPyxUCgaXOnny7PY39q1gnjdsWMtdugBrUd4LMBraN4XMAv3MARXgpAyve2iEvRWzE
 9iRFnE3y1G/H1b3MZ57acDYdPKvn5Ba5ujOp3Ap8FbbAP1Iw2JWdxXHVLkYLRRYSbMcY94BCRft6c
 Tz0fY4Tp/JOsuOsD2lQ7FjrS9aK6VGU2f96BsVcIdJTWYhu/CWDDMmDctEY15u0O7W6+nlXcSj/aP
 KLqITvMumaDW5QiVCG0Yap7E;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sC4aA-00DgzL-1K; Tue, 28 May 2024 21:42:11 +0000
Message-ID: <61470965da3082bca8589558676204b96164dfaa.camel@samba.org>
Subject: SAMBA_VERSION_VENDOR_SUFFIX in VERSION
To: samba@lists.samba.org
Date: Wed, 29 May 2024 09:42:05 +1200
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Kia Ora Samba packagers,

I just wanted to ask nicely if you could fill
in SAMBA_VERSION_VENDOR_SUFFIX in the VERSION file when you build
Samba?

Debian does it like this:  
https://salsa.debian.org/samba-team/samba/-/blob/master/debian/rules?ref_type=heads#L163

(that is, a simple sed on the VERSION file)

Likewise if you are a Samba user and use a Samba package that doesn't
do this, can you ask them to add it?

This really helps us when debugging, as we know what package you are
using and so what patches might be applied, or if this is just the
upstream tarball.  In particular the version string given in the crash
backtrace will have this info.
Thanks,

Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/Samba Team Member (since 2001) https://samba.orgSamba Team Lead                https://catalyst.net.nz/services/sambaCatalyst.Net Ltd
Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company
Samba Development and Support: https://catalyst.net.nz/services/samba
Catalyst IT - Expert Open Source Solutions

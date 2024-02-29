Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF3F86D412
	for <lists+samba-technical@lfdr.de>; Thu, 29 Feb 2024 21:20:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=U2lOSFyAGCRiPUk+/ROJ3O7UXCjcdhukMcQaU3PcnW8=; b=SfQq4fCUUoNN4BTxbleXn2PuXh
	fDlGKDeqggXhlxmXXwCaPKeiuUo+F9GaTV21I6zPZ1ZNuh0pNywO98JqXMmOBr0ucvqsF7n0TxvzY
	zkfX8HJMHP1aG/2lmppkMYdHpmlq7qObktPC0+lJcbAsbiVMQ5m7XrFAUFvIZyxfd40oslpcQVsGZ
	kwglBBBXR8flrju+PxZLvFII/19upAAUK+fDCLVkf0zxAGH7XI25gBvOqTC1UqLRiPo4T6MtRIMLC
	nz46QvUofX4A06lvFkS/mSs0/l2kZAfpKE42KXWvLnLGsYa7tlx0ME1BjGX/5afiUT4T6c3l+k2+b
	rNZ/Ipyg==;
Received: from ip6-localhost ([::1]:60850 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rfmst-009j2B-7I; Thu, 29 Feb 2024 20:20:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16778) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rfmsn-009j22-H1
 for samba-technical@lists.samba.org; Thu, 29 Feb 2024 20:20:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=SCIJSCDh4DIB8mpi2uv65wmtGBXgrzmgmxujtUgIxaI=; b=yPJFBal7/L29zc3824ehahct8x
 v36GxMaOgyD0SbOtoAJEWVVHlk1kacDbyKaH68Rgi9f89SH1Ad4g08qS+ZAYTHA6S6FbNt4XmEyoc
 GDExdYSdvH0OKW4Y0/vqhY4fekjNmE/mN+ixVnfeNPVbfYal+me4yfdxJS91o/yjUS5pu+3TOgDN2
 WV2FjGPShXBVvYpiphkbBFRjdlpBbM0/Fsy/gb/26qm55QHqkyWQP8O8A7eGoYGgUZBBX64vE/Xn5
 h39TugcLkbw7I/xn2DvNwrYFxfF0Es2qgdTgTxTVsBWc6DOqjUHoKmV9Oy19JwIV47yjlu80y0dpf
 1VPMj1EegcZfDMlI8k2oq8Yy+hBDK2mNGJrC1U9Vb/GWzBYPkiRPz7EP/8NFdtaD8ZcF+t6PzEBYT
 3msToT5Xr1+dLIhk+LDx1jWUYkoYl4lqCKTix6nZLGkE3M/swed4lnxXDmMc5oNVQMjbWVfiOIo7D
 5nyl//ugVuaeAChlPTYcP3QI;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rfmsm-00FUoZ-0l; Thu, 29 Feb 2024 20:19:56 +0000
Message-ID: <975d227206d53fe93ef5cb5a3561f5363eae1832.camel@samba.org>
Subject: Re: Regression: ldb performance with indexes
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
Date: Fri, 01 Mar 2024 09:19:52 +1300
In-Reply-To: <2223722.hkbZ0PkbqX@magrathea>
References: <2223722.hkbZ0PkbqX@magrathea>
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

On Thu, 2024-02-29 at 16:36 +0100, Andreas Schneider via samba-
technical wrote:
> Hi,
> my colleagues discovered a performance issue in libldb:
> https://bugzilla.samba.org/show_bug.cgi?id=15590
> 
> As soon as you use indexes, ldbadd will be magnitudes slower than it
> was before.
> Could some ldb expert please look into it?

Your subject says a regression.  What version is this a regression
against?
The very nature of a DB index is that it will take time to create,
possibly a lot of time, but should make reads faster.
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




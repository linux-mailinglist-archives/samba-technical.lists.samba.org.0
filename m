Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 231C33DEA42
	for <lists+samba-technical@lfdr.de>; Tue,  3 Aug 2021 12:03:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=eijQgWnm7LdJd9I+eyVO52uCAzEHoAJnGvqsYdkiyxE=; b=3O4+1hHnhBbRTFlZP+IWPKRW3/
	0QnOh0TNiRrgM70z0hVF/G0XjgCV/R5oXHJMciNMSk8KJ/pTR48gsnJaJ7EPp7eMomOiLkw99cbKK
	EB4V+Uz95EGzpsnFMsqxWWsDaLDu/Eb2wi3wB6jVcTo3zLPkWVq8rMQHbjXVgCGwshtkMS7PIEeFH
	KpjDUCY9lQkCuKETXkufvawY5DF9cLQ2Ujk2Yz6uas9e6Uv2RYwE6CbgOSCwJReEwxKHd4uuMdASV
	rDA8eXfC4wcSBn24rmJSxqhG0UT8xnM3n+eYfrI52YdFQg4nRzNecoh5mMPBzJrLzsdQNgRFNid36
	gaq/mCVw==;
Received: from ip6-localhost ([::1]:50996 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mArH3-004Bj1-40; Tue, 03 Aug 2021 10:03:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63014) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mArGx-004Bir-Nq
 for samba-technical@lists.samba.org; Tue, 03 Aug 2021 10:03:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=eijQgWnm7LdJd9I+eyVO52uCAzEHoAJnGvqsYdkiyxE=; b=Gps6nqJxmeyLhmI1gR0e6A2Vrp
 +c573Nfc4SAmOPlj7H+vaQzCOUAQlCBWzqG+IWRKas4OmwVrgFDs+Sp2PCPVGeU0HT1DffC4G2a2q
 i2fM3Lf6F/sZklPL4TfmuHlQcnCbI+2vpOHDUR6qViYfyWKKYvlPcvPMPC5zZhlhpsd5iXCTkA2j2
 vb2S9nkLvesf6KhjG/PHOssT3iafvQg36z6X/1CgrHEBqn1y/FIRWpPB3R/v91z4E3t8K1ZQbbYSB
 v3KHCoqsV0rSeIXonAaVfQ6+umaoBzGMCel0kdp4651kNxO7X6Z+RyKgoX11lwYTc9mZjYwTXPLiQ
 Nj77Nv/7y5IoVKHh6tdSPg24R86+EAGPV8SoggwKrtaWhUT0mxLaopvGBcJzAJr8ABTWlnyBNHrP7
 v3WnweVt9gbt25rh0pjf/SXvV4tpx+YOn9sqhe38kyeRLbPzkp2ve0QXhODX8EnAgPbS7rBwEzM2T
 8KHrJtmxU5N+kCW9aU39MWew;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mArGw-000O3H-1k; Tue, 03 Aug 2021 10:03:42 +0000
Message-ID: <098761f1fe21bdb0790e49b97f20b77c86ea1aa6.camel@samba.org>
Subject: Re: Autobuild paths too long again
To: Andreas Schneider <asn@samba.org>, Isaac Boukris <iboukris@samba.org>
Date: Tue, 03 Aug 2021 22:03:38 +1200
In-Reply-To: <4329737.EkWKPh09Hk@magrathea>
References: <f3d35fd592abf06db2277ad15bf22f3a9804b7ba.camel@samba.org>
 <4329737.EkWKPh09Hk@magrathea>
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2021-08-03 at 11:09 +0200, Andreas Schneider via samba-
technical wrote:
> On Tuesday, August 3, 2021 6:52:09 AM CEST Andrew Bartlett wrote:
> > Since (I'm pretty sure) this commit:
> 
> Hi Andrew,
> 
> > commit 7e9c97ba1cd960df2688718561c4a117b79b259b
> > Author:     Isaac Boukris <iboukris@samba.org>
> > AuthorDate: Thu Oct 8 14:00:44 2020 +0200
> > Commit:     Andreas Schneider <asn@cryptomilk.org>
> > CommitDate: Wed Jul 7 15:01:22 2021 +0000
> > 
> >     selftest: Add test for one-way trust wbinfo auth
> > 
> >     Signed-off-by: Isaac Boukris <iboukris@samba.org>
> >     Reviewed-by: Andreas Schneider <asn@samba.org>
> >     Reviewed-by: Andrew Bartlett <abartlet@samba.org>
> > 
> >     Autobuild-User(master): Andreas Schneider <asn@cryptomilk.org>
> >     Autobuild-Date(master): Wed Jul  7 15:01:22 UTC 2021 on sn-
> > devel-
> > 184
> > 
> > I've not been able to push.
> > 
> > Can someone please fix this up again.  The issue is that winbind
> > socket
> > path is too long, which gives:
> 
> But the name of the env
> 
> ad_member_oneway
> ad_member_idmap_rid
> 
> is three chars shorter than ad_member_idmap_rid.

I think the issue is the mix with running under 
samba-ad-dc-4a-mitkrb5. 

ad_member_idmap_rid runs under
samba-admem-mit

We probably need to rename the autobuild job this time.

> However I would suggest we check this early enough and fail earlier
> to be 
> sure:
> 
> https://gitlab.com/samba-team/samba/-/merge_requests/2101
> 
> 
> 	Andreas

Thanks, at least some clear diagnostics would be nice.

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions



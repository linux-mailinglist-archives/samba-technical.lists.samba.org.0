Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 625A83DEA27
	for <lists+samba-technical@lfdr.de>; Tue,  3 Aug 2021 11:58:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=p3UPpViJ7HzZq5R9vt9a7sVvhf/hxNqQlx8mCs2cOvg=; b=IWgNrh+C+Qh6Xe5Y52BC3AQ7n3
	gLHTN3JLcgcg7PgiDFtEZi+4YbXZSqfJHBYevcnfcVoLdpZtm3GiLv9W6jngbWjvjQvTrFEffxEq+
	6qSqSXd+OeGcK5WpfANAjPVeJShYbNQZSuUxMN0MOunhGBu0O6dZNBdbyFDcISogG/OUuuD8fnEY/
	PLqAaf0yG1PkfORMwc3DTcO6rvjCIq8s51mI7f2dHpQgsO9w56jYVf9V2tBLPZDTzfS/9elwhuYeC
	GdZiaGlDXcN/XRY89go0PdUW57TM6afhSXBxzPMlbZeZIetGBlE0dXaCU7Ey4km7HgblrqkeJU21z
	Y9ZyIQRw==;
Received: from ip6-localhost ([::1]:50300 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mArBm-004BQI-DD; Tue, 03 Aug 2021 09:58:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61014) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mArBh-004BQ8-C6
 for samba-technical@lists.samba.org; Tue, 03 Aug 2021 09:58:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=p3UPpViJ7HzZq5R9vt9a7sVvhf/hxNqQlx8mCs2cOvg=; b=hro20D3wdCMkohoJqw0tr44y+g
 6Au/RUOpPOf2yq1i7lBR3CoijRhr0V9PUxZLguEryItqdE++s+2ob633le+fTy72MnAAcOZpcoBs3
 VfU0+AvhbP11gRCtZlHwN9IHPlnUbGeMsaaDqO+YGx7+ZxPizEgkEkEYb1K6rcfY3nYGLxS/oPKvd
 xZkTK2qxwxh7z5FB1vfqwR3zImK8J5roXB7g7aOS+fv2YpETCc/LPuIIrvp74lYrh8c0AYnbSyo+o
 7y6HE8Xr2s8AEwdKYj450FYcXKUqtcr30MktVlTYUsNWy8ydJpbA31fPmi5nUY6YqF3V5Et45vWPX
 SLklIW72f5FpkuQGxD3CZ44zZ+l/3C1C7ZZ2pAi4k4y1D0/99Ca7iLxuoCdyqT6h8FAn9VPUa2jjO
 1cUcfJq1xjleFCWuuyDKkGF3dZ3DXc9vZy5lIHNuSmpO342F+skuni4hqtF6XoLawiOcs6SgHKSv8
 ix2yacHJ+ZJpBPSplFH3eb8r;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mArBg-000NxG-Dp; Tue, 03 Aug 2021 09:58:16 +0000
To: Andrew Bartlett <abartlet@samba.org>, samba-technical@lists.samba.org,
 Martin Schwenke <martin@meltin.net>
Subject: Re: Autobuild paths too long again
Date: Tue, 03 Aug 2021 11:58:16 +0200
Message-ID: <1844799.PPI7QROb2N@magrathea>
In-Reply-To: <20210803150319.1cab1e0c@martins.ozlabs.org>
References: <f3d35fd592abf06db2277ad15bf22f3a9804b7ba.camel@samba.org>
 <20210803150319.1cab1e0c@martins.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, August 3, 2021 7:03:19 AM CEST Martin Schwenke via samba-technical 
wrote:
> On Tue, 03 Aug 2021 16:52:09 +1200, Andrew Bartlett via samba-technical
> 
> <samba-technical@lists.samba.org> wrote:
> > Since (I'm pretty sure) this commit:
> > 
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
> >     Autobuild-Date(master): Wed Jul  7 15:01:22 UTC 2021 on sn-devel-
> > 
> > 184
> > 
> > I've not been able to push.
> > 
> > Can someone please fix this up again.  The issue is that winbind socket
> > path is too long, which gives:
> > 
> > [...]
> 
> Given that this is ongoing pain, socket wrapper is in use here and we're
> testing...
> 
> I wonder if an additional socket wrapper hack might be useful.  Could
> we make socket wrapper optionally put all Unix domain sockets in some
> top-level (i.e. short) socket wrapper directory and then name the
> sockets by hashing the path?

If socket_wrapper is the issue we should see errors that SOCKET_WRAPPER_DIR is 
too long.

In case of winbind and the windbind socket path, we should not start with a 
clear message what is wrong.


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D




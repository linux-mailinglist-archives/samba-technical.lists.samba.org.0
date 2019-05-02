Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63301123E7
	for <lists+samba-technical@lfdr.de>; Thu,  2 May 2019 23:10:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=ucCNva+anbpYlz3OocmVo3Q9z0JhpAstjZu2q+eVINk=; b=24pRhpMLHI9Lh3EJdVZE7I69Aa
	UI5q4vEqYo7lljEgX8ouoMchsp2ns1ZxVlgogPuVbu6lEA3y82v+EFP1fMlSVQVzkepWKYbibZ2vH
	0Yi1Raif/WjfgJh3MwRgsYUj12iYRKltIyRODPNBISxiCIdA/XtwDcMMcyKy+wIuoVAeo2FhcJxZw
	jqewRjOpuuqVOP50AjP+pFxhs5UPzfQXgRvFMmSnAojGFYnq4eagvISudPX7w1VaruR5KTqLLTGmn
	d5zLM74EFapjBjdDZbWIR3yIfYve2ZDiITj7GtFG7UBvSx1S9Uy41CcvZ3g6AhjkEMSM/ZnbtqYkH
	6US62LUw==;
Received: from localhost ([::1]:59368 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hMIxp-00296S-3d; Thu, 02 May 2019 21:09:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:52626) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hMIxk-00296L-9n
 for samba-technical@lists.samba.org; Thu, 02 May 2019 21:09:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=ucCNva+anbpYlz3OocmVo3Q9z0JhpAstjZu2q+eVINk=; b=Qxj5sm3GrPhCVD59Yyhpo1VHOL
 u6u5HnzCWQltohmNiVTkXpFEZLa1KSxHH0OupmJ3s/KMrgA1QgcHInqXB0HlnKoI+TxCPEgEPqeL8
 GwMTNDxVFDFIRjHnJKhX56SjysSck3Fp9UWvEsdmuyqzd2PHBWBA0/USXXTgoPteDPzw=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hMIxj-0006qT-E0; Thu, 02 May 2019 21:09:51 +0000
Date: Thu, 2 May 2019 14:09:48 -0700
To: David Disseldorp <ddiss@samba.org>
Subject: Re: [PATCH] Samba: CephFS Snapshots VFS module
Message-ID: <20190502210948.GA184424@jra4>
References: <20190329184531.0c78e06b@echidna.suse.de>
 <20190501232047.57ba6ffc@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190501232047.57ba6ffc@samba.org>
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
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, May 01, 2019 at 11:20:47PM +0200, David Disseldorp via samba-technical wrote:
> On Fri, 29 Mar 2019 18:45:31 +0100, David Disseldorp via samba-technical wrote:
> 
> > The attached patchset adds a new ceph_snapshots Samba VFS module which
> > handles snapshot enumeration and timewarp/@GMT token mapping.
> > 
> > This patchset depends on a new CephFS virtual xattr to obtain the
> > snapshot creation time, which is pending merge:
> > https://tracker.ceph.com/issues/38838
> 
> The Ceph changes have been merged upstream, so I'd like to proceed with
> this patchset in it's current state.
> 
> Review/push appreciated.

Quick question during review.

There are a several uses of:

+       char snaps_path[PATH_MAX + 1];
..
+       ret = snprintf(snaps_path, sizeof(snaps_path), "%s/%s",
+                      parent_dir, snapdir);

You have a talloc context available (or talloc_tos()),
isn't it easier to just do a

char *snaps_path = NULL;
snaps_path = talloc_asprintf(mem_ctx,
			"%s/%s",
			parent_dir,
			snapdir);

and then TALLOC_FREE after use ?

I'm not really worried about optimization here
(unless you've got the numbers), just that
talloc_asprintf() seems to be the idiom we
commonly use inside source3/smbd/open.c to
construct pathnames.

Not really a criticism, just wondered if
this was a concious decision here ?

Jeremy.


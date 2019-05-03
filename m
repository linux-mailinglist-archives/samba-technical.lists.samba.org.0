Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id F017812CE5
	for <lists+samba-technical@lfdr.de>; Fri,  3 May 2019 13:50:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=hFcABAq0qYECN9Dq5nRtQZZO0UdBUK50sb6TyAa8GSo=; b=hvV0Gl+DBVtlwqDl5H8aoVU8h9
	HNl6X2dSnDhaDjLaagyEccLt5dFJ41BM+1Evb2NIQ/f0qg2Mab804xiRnVn8HPFf2AAd9C7lE6VYF
	VqHzP9QDljyg2p7bRkBG4GU9DTsBLWLUDgdCfgOZxk7buqJSQSDZkRCDcvaA4vaU5sNmCYP98lb9N
	jHlxomylU29BDMOGaZcy2uO5DvRNL5jEJ0WUiO8JSHEFnJsLHXATeXmHM1uTy1xJoxhrJR/ra9pPQ
	NTqAgGvCxoTISltWvf4WG8uKgf5Y5QT7A6vhDUSWUWJqNuvubdTw6Ahe+meGiPqcv4kprPXrl4onR
	BtzJDImA==;
Received: from localhost ([::1]:53814 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hMWgs-002Fjv-GR; Fri, 03 May 2019 11:49:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:45550) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hMWgn-002Fjo-Vx
 for samba-technical@lists.samba.org; Fri, 03 May 2019 11:49:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=hFcABAq0qYECN9Dq5nRtQZZO0UdBUK50sb6TyAa8GSo=; b=B9Pezs5AcD8whQCRYrNmRpfT8b
 dgnuBQtfnfOCfa/8z3klFGlPtCfE5dRUOOhdEg8rY5gCoVA7GWXoFWhHH1a0Bu8dUz+6YDRBHZVUJ
 FmaARDR4+USA+/EJL5so7TS+RMxbQ/rxt9SeUST5CSRKLLXXl3MQQx+79hGXq6XB3isU=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hMWgm-0000s9-SD; Fri, 03 May 2019 11:49:17 +0000
Date: Fri, 3 May 2019 13:49:10 +0200
To: Jeremy Allison <jra@samba.org>
Subject: Re: [PATCH] Samba: CephFS Snapshots VFS module
Message-ID: <20190503134910.72cfa80d@samba.org>
In-Reply-To: <20190502210948.GA184424@jra4>
References: <20190329184531.0c78e06b@echidna.suse.de>
 <20190501232047.57ba6ffc@samba.org> <20190502210948.GA184424@jra4>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2 May 2019 14:09:48 -0700, Jeremy Allison wrote:

> On Wed, May 01, 2019 at 11:20:47PM +0200, David Disseldorp via samba-technical wrote:
> > On Fri, 29 Mar 2019 18:45:31 +0100, David Disseldorp via samba-technical wrote:
> >   
> > > The attached patchset adds a new ceph_snapshots Samba VFS module which
> > > handles snapshot enumeration and timewarp/@GMT token mapping.
> > > 
> > > This patchset depends on a new CephFS virtual xattr to obtain the
> > > snapshot creation time, which is pending merge:
> > > https://tracker.ceph.com/issues/38838  
> > 
> > The Ceph changes have been merged upstream, so I'd like to proceed with
> > this patchset in it's current state.
> > 
> > Review/push appreciated.  
> 
> Quick question during review.
> 
> There are a several uses of:
> 
> +       char snaps_path[PATH_MAX + 1];
> ..
> +       ret = snprintf(snaps_path, sizeof(snaps_path), "%s/%s",
> +                      parent_dir, snapdir);
> 
> You have a talloc context available (or talloc_tos()),
> isn't it easier to just do a
> 
> char *snaps_path = NULL;
> snaps_path = talloc_asprintf(mem_ctx,
> 			"%s/%s",
> 			parent_dir,
> 			snapdir);
> 
> and then TALLOC_FREE after use ?
> 
> I'm not really worried about optimization here
> (unless you've got the numbers), just that
> talloc_asprintf() seems to be the idiom we
> commonly use inside source3/smbd/open.c to
> construct pathnames.
> 
> Not really a criticism, just wondered if
> this was a concious decision here ?

Thanks for the feedback Jeremy.
As these uses are just temporary buffers I decided to use the stack.
I don't really have a strong preference here, though I'd normally like
to avoid talloc_tos().

Cheers, David


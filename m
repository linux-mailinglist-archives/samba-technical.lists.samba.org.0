Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3D429AE0
	for <lists+samba-technical@lfdr.de>; Fri, 24 May 2019 17:20:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=S/dI7RPZUEcSKp8/h6JMeuRz0w3v7kHcfuFfinU4KSI=; b=QgquHXtksK/050uz/NghJZKCU3
	nbsh6IYqkZnQig8jayzi/x6LqB6PkmxG9GxsyGVBpBM2oYPDYuw2fpRuAApNT3rxNnG7qo36aN4rS
	U5JoDeD+n8hYabC/sruMH0qHeK1aXnsPkWdSVZ8tm/a3fioueN11VN4nYOrC9S41p9WZQHaqkF2KW
	mThBMKEGf2gXVIurumxLSuJFODSYSgBAyAFp9i/CWfN1gxzRat86/xjcLVo6fU2mNQF3+TVSga3Kb
	ns1WzGgK/WTRxr6qBA5km340oiv9Xh2/fLhariV+xtnmvMirZ+mhcTMiifC1/vPIy26zldR3ayHJW
	LSb2Cc+A==;
Received: from localhost ([::1]:21870 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hUByr-001cSn-BZ; Fri, 24 May 2019 15:19:37 +0000
Received: from [173.255.197.46] (port=47814 helo=fieldses.org) 
 by hr1.samba.org with esmtp (Exim) id 1hUBym-001cSg-LY
 for samba-technical@lists.samba.org; Fri, 24 May 2019 15:19:34 +0000
Received: by fieldses.org (Postfix, from userid 2815)
 id BAAAABD2; Fri, 24 May 2019 11:07:45 -0400 (EDT)
Date: Fri, 24 May 2019 11:07:45 -0400
To: Amir Goldstein <amir73il@gmail.com>
Subject: Re: Better interop for NFS/SMB file share mode/reservation
Message-ID: <20190524150745.GB22420@fieldses.org>
References: <CAOQ4uxjxQoCWqfp+f91--tyR81PREsssT=RV9uRgCQFs+yk7mw@mail.gmail.com>
 <20190214210652.GC9216@fieldses.org>
 <20190305214748.GD27437@fieldses.org>
 <20190306151150.GC2426@fieldses.org>
 <1ade4724a4e505baf7b7c23a76e44d58b931da1f.camel@kernel.org>
 <20190306210743.GE19279@jra3>
 <F00A0481-0AC7-411E-8353-BF104713F524@samba.org>
 <5ebdb58b-26d9-c0f2-bd67-883bc4678ac7@samba.org>
 <CAOQ4uxiBLw_L=SqCjLU6W60LbtWiLaBh=5Cb4HnSAFqCW0z1WA@mail.gmail.com>
 <CAOQ4uxiJQj+wvL8UxfDWe+BAD_7cmHBa5Z3L5Gv0LaDc2TKgUg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOQ4uxiJQj+wvL8UxfDWe+BAD_7cmHBa5Z3L5Gv0LaDc2TKgUg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
From: "J. Bruce Fields via samba-technical" <samba-technical@lists.samba.org>
Reply-To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 devel@lists.nfs-ganesha.org, samba-technical <samba-technical@lists.samba.org>,
 Jeff Layton <jlayton@kernel.org>, Stefan Metzmacher <metze@samba.org>,
 Volker.Lendecke@sernet.de, Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, May 24, 2019 at 10:12:10AM +0300, Amir Goldstein wrote:
> Some of you may have already seen the reports from my session at LSF/MM
> on Samba/NFS interop: https://lwn.net/Articles/788335/
> 
> It should not be a surprise to anyone here to know that I have had interesting
> and productive conversations with NFS folks about improving samba interop.
> It should not be a surprise to anyone here to know that the rest of the audience
> was, generally speaking, uninterested in the problem.

Eh, especially after a couple days of highly technical talks and people
have trouble focusing on stuff outside their area.  I wouldn't take that
as opposition, if that's what you mean.

I think the only place where there's any entrenched opposition is (alas)
ACLs.

Lease/lock stuff, for example, should be no problem.  It's mainly just a
matter of people finding time.

> Which provides a re-enforcement to the point I was trying to make in session -
> The path of least resistance for NFS-Samba interop is the communicate with
> each other (both human and software wise) and try to leave VFS out of the
> discussion for as much as possible (hence dropping linux-fsdevel from
> this thread).

I've got a strong preference for doing stuff in the VFS.

Maybe the approaches aren't incompatible--if we can do something without
new kernel interfaces for now, it doesn't rule out later moving some of
the logic into the kernel if that helps.

That said, I'm not comfortable depending on an assumption that knfsd and
SMB are the only users of a filesystem.  If we're going to introduce
some new kind of lock, for example, I'd like it enforced against
everyone.  In knfsd, we broke that rule for open deny modes and I think
it was a mistake.

--b.

> An idea that has already been thrown around is to use some samba daemon as
> an arbitrator for opening files and locks. Of course, this would be an
> opt-in feature
> for NFS servers.
> 
> For example, can we use fanotify permission hooks to delegate access control
> checks from knfsd to a daemon?  Right now, the information in
> permission events is
> rather minimal, but as an fanotify developer, I can assure you, that
> we can enrich the
> information passed by knfsd on open permission events if that is deemed useful.
> 
> I will be attending SambaXP, so if any of the Samba guys would like to, we could
> find a slot in the Hallway track or at a local bar to discuss those options.


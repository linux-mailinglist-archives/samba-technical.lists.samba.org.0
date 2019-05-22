Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6A825C03
	for <lists+samba-technical@lfdr.de>; Wed, 22 May 2019 05:14:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=7Q9ezC3lNEiXZcLhQbMtY1+4bmaSTJXqVDmtd+DbcEM=; b=H4calGotYp+9tG/KW5VTuVGX9g
	LXNLYYp00kqxin4SUlFaLWLtskHEwPdUh33KOQlqS8ALm+ZMh78PA2Re8apr18exUibHSJBl9J6nA
	LFjf/xDxjD+rx9zIksmNIplE4MAMDevX3IhSqXFrtB7zJ6LtOfNJEN5zTp8IuWLQsrUb5LjhTjIYB
	Mhw+G8s0ZUJtFtsa5TMUVmRjDCkFvm6SShMHYLpN/BubyPmGltPZoc5mlO/oBUVdHK9XaQXEdzkQ5
	WOx0ncOxzGjTQD5kBSNXZ3CGyhyO5lxA/sv2FVnYLdIUpY4eK7Q8cFSjudt0x9nIHASgQP2egpUzb
	KL7C1Vig==;
Received: from localhost ([::1]:42044 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hTHh8-001ARA-Q9; Wed, 22 May 2019 03:13:34 +0000
Received: from bilbo.ozlabs.org ([203.11.71.1]:56667 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hTHh2-001AR3-LW
 for samba-technical@lists.samba.org; Wed, 22 May 2019 03:13:32 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 457yPr5xgYz9sDn;
 Wed, 22 May 2019 13:13:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1558494801; bh=bJvfRCBEi+DD1K7bkP6BvZYYm4WM/RUMVOjvvfPRfMk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=W66ZMGEzCe9s6n/haQZ6PzgQ1IVGXavtWZpmLCN+Z/jIzrOBUmOcQCiQm1+8I1Xni
 XcD21J/gnF8CeMy+StX3A2bbneN8MfAAQgVMfU1krklqfk0oCXAy/SgtZNzhDVUf1E
 6SiVu1UOcGSgayT4s2JnkFJ8tAMPF/M/7KfcGO34NqRr7oTVk1mO9Teo+4VnqlCekx
 qfiSaiqXpXSPEh3Lp8TUQfsm7znzD0e7CNSSPIphqozSMj1HfWOKcieOBA3MGPgJcn
 NRPaFRlC8Df2ceR9oVweJNrnNCMW8FGakl7fa9erp4WqQvTDS14UOY3D1SAUVG9dKO
 bIHVLz/M3OISQ==
Date: Wed, 22 May 2019 13:13:19 +1000
To: Andreas Schneider <asn@samba.org>
Subject: Re: New csbuild run
Message-ID: <20190522131319.2bbe393a@martins.ozlabs.org>
In-Reply-To: <3206132.ajtiDnVues@magrathea.fritz.box>
References: <1902926.C4UlyRiazf@magrathea.fritz.box>
 <4043444.PDZQgdqHAT@magrathea.fritz.box>
 <20190521162924.4444f055@martins.ozlabs.org>
 <3206132.ajtiDnVues@magrathea.fritz.box>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 21 May 2019 08:54:13 +0200, Andreas Schneider <asn@samba.org>
wrote:

> On Tuesday, May 21, 2019 8:29:24 AM CEST Martin Schwenke wrote:
> > Hi Andreas,
> > 
> > On Tue, 21 May 2019 08:19:26 +0200, Andreas Schneider <asn@samba.org>
> > 
> > wrote:  
> > > On Tuesday, May 21, 2019 3:36:07 AM CEST Martin Schwenke wrote:  
> > > > How can I run this locally on my laptop?  
> > > 
> > > you need to install csbuild which is normally available on Fedora. You
> > > should use Fedora 29 or newer.
> > > 
> > > You can run it like this:
> > > 
> > > https://gitlab.com/samba-team/devel/samba/commit/
> > > 5e996a902488ecb3f6e6afcd528cfdd135038c50#587d266bb27a4dc3022bbed44dfa19849
> > > df3044c_228_289
> > > 
> > > Line 289-296
> > > 
> > > for 'make -j$(nproc)' you use e.g. 'make -j8'
> > > 
> > > You don't have to specify a commit range if you just want to get all
> > > errors. But normally it compare a range. It will create a diff what is
> > > new, fixed or currently not working.
> > > 
> > > for '--git-commit-range $CI_COMMIT_RANGE' you use for example:
> > >     --git-commit-range master-mybranch~20..master-mybranch
> > > 
> > > which will compare the last 20 commits. It is interesting once you fix
> > > something.
> > > 
> > > As csbuild also finds quite some false positives, the above command is
> > > interesting, because of the diff it just doesn't report them as 'new' if
> > > it is in both commits. So normally you only get newly introduced issues.
> > > 
> > > Does that answer your question?  
> > 
> > Almost.  :-)
> > 
> > I run Debian, so is csbuild available from some other place than as a
> > package in Fedora?  I know that I could find a Fedora RPM
> > and unpack it, but I figure there must be a web site somewhere that I
> > can download it from.   Unfortunately, searching the internet for
> > "csbuild" finds too many other things.  :-(  
> 
> I just found:
> 
> https://github.com/kdudka/csbuild-deb

Thanks!  Will use that as plan B if Noel's Docker method doesn't
fly...  :-)

peace & happiness,
martin


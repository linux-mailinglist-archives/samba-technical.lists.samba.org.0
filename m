Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB2E4C420A
	for <lists+samba-technical@lfdr.de>; Fri, 25 Feb 2022 11:16:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=7O30mPN88yI4hvEOCFFsbQb6EBkeFCUh7mnO17ID5LY=; b=x+I1CrDJ/5jql1UTAWbExNOCAo
	YQge4IlEPx4AdaW85I+QTBxaul4v3ul0UADgknwhV1nhel2s8F/zkIvF8PDEELs52Zz01+5SMYit2
	eBwhg27nSnvGZ6nbfhiiI4s5m2tIaXQNnpaglV52CkGn7QEbJLykbnFD0oEmbzJkX5PEn6ZCJ0Y2N
	aVQ/Ew33BGaI6gnUBH3cu22rRgPowJSPOAcjKCamW/oEpaD4sGLqelW/+c4YR5li0IA5KFofBhtcJ
	pG/xfDgjDbD0pdObE30j7SFuklVRFyxJmkOmX0n6mMSwL559+2xhRYyJu7w0ffBPy559CeHM7ZWJ3
	cYzKYwoQ==;
Received: from ip6-localhost ([::1]:49218 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nNXeP-00BdlO-Rp; Fri, 25 Feb 2022 10:16:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49210) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nNXeK-00BdlF-7m
 for samba-technical@lists.samba.org; Fri, 25 Feb 2022 10:16:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=7O30mPN88yI4hvEOCFFsbQb6EBkeFCUh7mnO17ID5LY=; b=hoUZXfSpv4TO4rb+WQYcDQ5kbY
 pIGrVN1hisMhkIR4AWbFED4vV80GNOO7y1Nu3fYoovOKrPwBIJSWCY8T1czKari7BhvaWG22E/4QT
 buYt8lkFNlnmjFedT8N+3upZRZsUn/6DKrfIly/6juR00S5NybkxTeG+zkNl91bMmk/1zEBWjoTLP
 agY/XS5OXtCJgquMUB16XLtECHvcrFxA/BL98FsybIajQhF90zXFBpNlrfBBfYO72ORGUhuHYiuaN
 WHzpqKk+BCYa9bljDvAocNPBQWRwgLrodWeGTk+R0Tu3So4kv56bLPvOcGPH72ir8lBrV3Jq0K4G5
 eL4yNZNxdo3adCNrUvZj3PIj6jK2b/dxpnYWP1o+H/AyvK3KxDNhFBF35Gjj/U3KL6lO4bQKWabeG
 yoRoAbdT26Atnq+LsgXM8POh/dVKR5ZErrTNjC3WhNhWmsyZLZ0JaZElXyMgaIU9LfTID7phtICxd
 gyM3TxJ6VVzjK1m7CHLPMgu+;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nNXeI-005Ra8-PL; Fri, 25 Feb 2022 10:16:30 +0000
Date: Fri, 25 Feb 2022 12:16:27 +0200
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: MIT Kerberos version support for the AD DC in master (eg 1.20
 and 1.19)
Message-ID: <Yhise5JFfPM4fheF@pinega.vda.li>
References: <reply-4ecf65ee6e5c0adbf25c57ec268d6f8e@gitlab.com>
 <note_855084458@gitlab.com>
 <23462492d1a7b61ee1c40313445f737296421f2a.camel@samba.org>
 <2427635.MdZvMZBkg4@magrathea>
 <d61e615650ba4f3d531d3ba0e2b73b27293ec59b.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d61e615650ba4f3d531d3ba0e2b73b27293ec59b.camel@samba.org>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: Andreas Schneider <asn@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On pe, 25 helmi 2022, Andrew Bartlett via samba-technical wrote:
> On Fri, 2022-02-25 at 10:41 +0100, Andreas Schneider via samba-
> technical wrote:
> > On Friday, February 25, 2022 9:48:52 AM CET Andrew Bartlett via
> > samba-
> > technical wrote:
> > > I think this is a discussion worth having somewhere a little less
> > > hidden than a MR.  So sent to Samba-technical, but BCC to the
> > > MR.  Lets
> > > see if that works...
> > > 
> > > On 
> > > https://gitlab.com/samba-team/samba/-/merge_requests/2330#note_855084458
> > > Andreas, Alexander and I are caught on the philosophical point of
> > > what
> > > MIT krb5 versions we should be including runtime support for in
> > > master.
> > > 
> > > My point is that we test MIT 1.20 on Fedora.  The non-Fedora builds
> > > all
> > > build Heimdal.  That is, with these changes the MIT 1.19 support is
> > > untested in our CI, so we shouldn't put untested code in such
> > > important
> > > codepaths.
> > 
> > This is not true!
> > 
> > Take a look at the pipeline:
> > 
> > https://gitlab.com/samba-team/devel/samba/-/pipelines/478777772
> > 
> > samba-addc-mit120 - This runner tests MIT Kerberos 1.20 (pre-
> > release). It
> >                     tests the most important bits which have
> > significantly
> >                     changed. Like the KDB interface, S4U and RBCD.
> >                     If you look at the log you can see:
> >     $ if [ -x "$(command -v krb5-config)" ]; then krb5-config --
> > version; fi
> >     Kerberos 5 release 1.20-prerelease
> 
> Thanks for that.  I missed that detail when I looked over the patches,
> I didn't consider that the patch was further extending the number of
> jobs (this is a different also difficult issue). 
> 
> > 
> > samba-addc-mit-1 - This runner tests MIT Kerberos 1.19
> >     From the log:
> >     $ if [ -x "$(command -v krb5-config)" ]; then krb5-config --
> > version; fi
> >     Kerberos 5 release 1.19.2
> > 
> > samba-addc-mit-4a - This runner tests MIT Kerberos 1.19
> > samba-addc-mit-4b - This runner tests MIT Kerberos 1.19
> > samba-admem-mit - This runner tests MIT Kerberos 1.19
> > samba-mitkrb5 - This runner tests MIT Kerberos 1.19
> > 
> > > I'm honestly not making this argument to destroy the MIT KDC
> > > effort, on
> > > the contrary I want it to succeed!
> > > 
> > > But for it to be a long-term success we must also be able to learn
> > > from
> > > the past 6 months in particular to ensure we have a viable,
> > > practised
> > > process for changes need to be made in both codebases.
> > > 
> > > In particular, I'm concerned that the AD DC 'will build and
> > > securely
> > > operate against the MIT version found on enterprise distributions'
> > > is
> > > just not a promise we can keep, so setting that up as the baseline
> > > expectation sets us up to fail.
> > 
> > What sense does it make to drop support for the latest MIT Kerberos
> > release 
> > (version 1.19) and require our users to build MIT Kerberos from git
> > master 
> > with the next Samba release?
> 
> Fair enough.  This makes a lot of sense.  It also answers a bit of my
> question (that I've been trying to figure out how to artfully put) of
> how to make incremental development of features that cross the
> Samba/KDC boundary practical and viable.
> 
> More importantly this looks like a pattern we can follow - security
> releases will be harder, but even that could be handled similarly (with
> an in-script private build of MIT rather than a COPR repo).

Yes, the use of COPR is simply to provide a test target until there is a
release of MIT 1.20 available, beta or otherwise.

So the real goal is to make it an overlapping CI testing until we get
all MIT platforms to migrate to 1.20 once it is released. During past 6
months it was a real pain to work on solving conflicts when Kerberos
test suite changes were done in master without testing them against a
proper MIT target. Now that we have a capable MIT-based AD DC target,
this will hopefully be less tolling.


-- 
/ Alexander Bokovoy


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D442D1073DA
	for <lists+samba-technical@lfdr.de>; Fri, 22 Nov 2019 15:08:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=/AZRFBrts0MAaUahI6OwW/olHj2RPZrpSINQpqH7fqY=; b=0i4A4d5KyGmn30AST+a1VUPY7u
	6I4sMBLusrt7uhYBumICHMEIMnBmbQlJxOpZyBNOCbLL198lb9i4hkUS0hdnKeOIq0ihMdi9c7Wcr
	cpgFBvIMXWjN+3/PM9ZJY0W94P8+zihBNR3KYv4s1JIVql6jXaoHQ1vYl3EVJmIJb+frISuu7J4XF
	dnlg2ushZo/cUoWFTG5SeCkq44Lu5Tlegeydj2MYtirPIgshhVLt3W9vQ0VP8gCgxV2mjPc478IcH
	RrMix1eVnn6Slz3haCvBuH0+zgKbr4K2IZG9Q0iG0FW3ijQ/3Kmg31WAOqdmqMc4XL/mSzcvQHPTh
	L/BQ9Y/A==;
Received: from localhost ([::1]:24796 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iY9bC-0024Iq-Sn; Fri, 22 Nov 2019 14:07:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57196) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iY9b9-0024Ij-J9
 for samba-technical@lists.samba.org; Fri, 22 Nov 2019 14:07:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=/AZRFBrts0MAaUahI6OwW/olHj2RPZrpSINQpqH7fqY=; b=AcqbhaKLqYqewk2HfOo+Pab/Yi
 2C/6HnMBnr6vDewlYrUTi6qcXs41Tox7cuqKeeU2FuF81X7ji1Er7cC5h7sjFSx6wuf644VMyUwb0
 C/CK4nNnTZZ/275Prn1DaY/wxrjxC6upPxTQ1AMI/AEtZNeGaKmdODtJtmjEI+95oNMuIQKUuNQ1Y
 qf2/EOsgrC9S6W8kIbWhE93REMVYpcR3mBsDzafHVmp9mUTbAIIopeFf5fSIl8SHhMeTKLAPGMdUu
 vXMPpRyyfRHrXubl9ixHsqWcv1FjWR3ogwWRNK4GujvX4Nx/kOu3yARt3P2Nv2jOaR1cGGVQ6yP+C
 7Ua7yLGovZmDB2kXQw6K+3Im8CjZzmBH9FKL9d7HjrxzVL3/UACn15GWlThyjrXERZ0AHPFfkO3Y5
 7anW7tn0kKKdwEimTeG3jKwIkDObptMwcJn1yRD2Cfoqh6UH8fV41T10jRlu+mIQuFq4s6D8G65mR
 G6wnghHfTNa72AbKvutTqBYE;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iY9b8-0004qj-S3; Fri, 22 Nov 2019 14:07:46 +0000
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: libpytalloc-util 2.2.0 broke the ABI
Date: Fri, 22 Nov 2019 15:07:44 +0100
Message-ID: <20458013.Ilke4jX49h@magrathea>
In-Reply-To: <118908fe1f076becc0c7e3c3debf680b444f9bbb.camel@samba.org>
References: <1647506.J1yn77AgSA@magrathea>
 <118908fe1f076becc0c7e3c3debf680b444f9bbb.camel@samba.org>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Friday, 22 November 2019 10:13:12 CET Andrew Bartlett wrote:
> On Thu, 2019-11-21 at 14:41 +0100, Andreas Schneider via samba-
> 
> technical wrote:
> > This has been introduced by commit
> > 24127acae0f05f0011c4008e75f1a1de31584199
> > 
> >     ABI: Remove unused .py3*.sigs files
> >     
> >     These are no longer used by the build system so avoid
> >     confusion by removing them from the tree.
> > 
> > I'm investigating how we are fixing this in RHEL now. Maybe we have to add
> > the symbols back in our package.
> 
> Ouch.  What I will say is this:  The py3.sigs stuff was a disaster,
> Debian tried to make it better (but seemed to make it worse, as far as
> I could tell, even minor upgrades failed the debian ABI checker), so I
> dropped both the additional patch and then disabled py3 libs from
> Samba.
> 
> Debian has of course had py3 re-enabled now, but my disable of the py3
> build caused Debian not to be able to ship Python3 bindings for ages.
> 
> The Fedora packages had dramas with how much of the python ABI to
> embed.
> 
> And then this.  I'm kind of glad we accidentally dropped the whole .py3
> ABI file, even if we have to clean up this mess.  It has single-
> handedly caused much confusion, work and frustration in packaging
> Samba.

We have to restore the ABI with the .PY3 in the name to deal with it in RHEL 
8.2. For RHEL 8.3 we need to fix it correctly upstream. Currently we try to 
have a workaround in our package.

> > For Samba I guess we should bump the SO version of libpytalloc-util to 3
> > asap.
> And here re-starts our library versioning discussion.  Could we at
> lease merge my 'remove ldb independent version logic', so we can bump
> the pyldb-util ABI without a whole ldb version bump?

Yes, I will discuss it with Alexander again. We need to use a different SO 
version for each library.
 
> > In addition I think we need a CI job which runs the abi-compliance-checker
> > for all public libraries.
> > 
> > Fedora provides packages for abi-dumper and abi-compliance-checker. So we
> > could keep an ABI dump from the current released version in the source
> > tree
> > and compare against that one if we break anything.
> 
> Yeah, I guess that's a useful idea.  Perhaps extend one of the CI jobs?
> (Please don't create a whole new one if possible).

For a start, 'others' would be the right place, where libt* and libldb is 
built.

Maybe we can add it to autobuild.py.


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D




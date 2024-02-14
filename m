Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E49C8540E5
	for <lists+samba-technical@lfdr.de>; Wed, 14 Feb 2024 01:46:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=hFKGK/+Yct4ulhsYUvsc1q+xZ2oAkEyn+r22nLgXeCM=; b=iQv/nh9x/CwFjve3x+X+xHLC3w
	0WhgKSHZN63HmHmRDgL6dV37YnyLRFwKw4NLnIWa61DhzRMtPTldbyKocgvodcDhNwNP2dJcI2d3W
	CBuCFqNfdbVoXF7L5HnDGAMr4B5XWyconeX38dnOQLLHjIMPH6r6k9pbzFcFKiQJouhPOZr3+y38S
	BUJHxHDl25Ds6PrBNsjd4ClCHPU65KiQWLpy2vVhVWMnOOfkzonUuqce6KzTopC5l0rbsZEMsvynn
	+YnT/2pD/yaZxvHP/0yJp81qB6qNiDSa6SkrJLImgpvyyFsChBQt7DU6hkr2waFEpzsSBOFe5wpzr
	clzGinpw==;
Received: from ip6-localhost ([::1]:50960 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ra3PV-008NN2-No; Wed, 14 Feb 2024 00:46:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49814) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ra3PQ-008NMv-Nc
 for samba-technical@lists.samba.org; Wed, 14 Feb 2024 00:45:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=hFKGK/+Yct4ulhsYUvsc1q+xZ2oAkEyn+r22nLgXeCM=; b=AkbfpU315Zhc21KE6RTuOBUXFU
 FUqtoROlGJq1Pu/6IoSF8V4Pi8rnCuqKrMNap0w7XTHjQDYsKCYR8yV+aSWtGBGvoyzky9G4OeI5e
 STu0L8FGMH+ULhuz0/cT/puB2aUOhwGYK53PrnSI7r9+g5AxFJMuALsxUIrXJCeZJqz1sHil48RCg
 9CFDP4xYXUpQgcE/Bj84/KZTh58Up3ak3x44Tdb/vr/tEqV9QA/6F/jKra3dRBq+pSXQKv9BxzG0F
 hgcsVtlGjESJ5SQyd3oztnORRLY2GbN5yOoDFqXpB8AKnlf5PuFnXd1283X5Hv/zabn16mvSCXz/h
 gBW/kwu10Hl0dBq+uTBcyUEebJ/5kxQNlWNWal4A6j4QxTKs7THAPDMUD1FNNVyKuMuDMjJ2wIbgj
 AUf5KDMLzI5Yl+a37VmQ2q2gk4tv/XsHuSTG/Kbvij5tkriwKjlHnCrIIirbI0p8i1b8qWX05EbTS
 QdHXmluM42zPPywf77LrUnjp;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ra3PP-00Cwor-0I; Wed, 14 Feb 2024 00:45:55 +0000
Message-ID: <28b2669c5d1834b15eddbfcda3c976a83def8b92.camel@samba.org>
Subject: Re: Looking to once again re-bundle LDB
To: Andreas Schneider <asn@samba.org>, Upstream Samba Technical Mailing list
 <samba-technical@lists.samba.org>, Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 14 Feb 2024 13:45:49 +1300
In-Reply-To: <2272182.vFx2qVVIhK@magrathea>
References: <7fb8e63cdc9de2c284cffc792c458df3b017c392.camel@samba.org>
 <2272182.vFx2qVVIhK@magrathea>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2024-02-01 at 15:22 +0100, Andreas Schneider wrote:
> On Tuesday, 5 December 2023 04:47:56 CET Andrew Bartlett via samba-
> technical 
> wrote:
> > Just a heads up that I'm still keen to reduce the burden of an LDB
> > release at Samba security release time.
> > 
> > The rough consensus at the end of
> > https://gitlab.com/samba-team/samba/-/merge_requests/374
> >  seems to be to
> > make ldb:
> >  - for public consumers behave like any other Samba public library
> > (eg
> > libwbclient), by removing the independent tarball and build system.
> 
> If it is done that way I'm fine with moving it back to Samba and do
> release it 
> with Samba releases.
> 
> >  - for Samba builds by default, to install ldb as a private
> > library.
> > 
> > The version numbers would remain, but could then diverge between
> > ldb
> > and pyldb-util for example (they would no longer be the tarball
> > number,
> > so would move just like other SO numbers do).
> > 
> > We would change the ldb modules dir to have the version string in
> > it,
> > so that modules are not installed for the wrong version.
> 
> Sounds good.

I've chickened out of this small aspect. 

It would mean a repackage of sssd for every single Samba version (well,
LDB version, but they change pretty often), and that would make Samba
security releases more painful, not less. 

(sssd is often built with an option to not check it is running against
the correct LDB version as we don't break the ABI often). 

I'll make it possible, you can set the ldb modules path to whatever
string is desired, but I won't make it the default (partly as getting
the LDB version string into dynconfig turned out to be harder than I
would have liked)

What do you think?

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



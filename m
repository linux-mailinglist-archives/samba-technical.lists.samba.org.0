Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A40FA8D2BDD
	for <lists+samba-technical@lfdr.de>; Wed, 29 May 2024 07:00:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=1NWw/BcF27QOP35FO6IqgbUqmlYtaMSfbOVZDUPUxB0=; b=LplhOV4xXqlfZhvDxNL+g4vPUW
	7Y6xfXfuqkxuPTOXT9JKhWRtHQqYJy5OAYqsS1vjlL2QZXVTEaVTIpkDFRkYxCaoyxijT+XFQzMPc
	xskmKGNB9+KY2gLV9Lg+6cuh58kMQeNWvmsSU43hePkLzgYiNb0OS+c482u9jf3k0ylWhniUPYz6F
	n5StM5THdRoKrVQaArL4xdF8Jq8HkqLs/B2kre1pOo1S3akyRMFdXedB102lPKbbbNe4aE2z6HCXg
	TG4doYm6B8tJflataWI+AgbN3ozjBrepjQMbT2zxO02x/EQs0teGAvTgL5d1z0QTWADgwgk06hu/A
	azzLW/5g==;
Received: from ip6-localhost ([::1]:20876 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sCBQM-00ACna-MX; Wed, 29 May 2024 05:00:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44930) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sCBQJ-00ACnT-5G
 for samba-technical@lists.samba.org; Wed, 29 May 2024 05:00:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=1NWw/BcF27QOP35FO6IqgbUqmlYtaMSfbOVZDUPUxB0=; b=SvQrXmEnmXGbI0DOotxnOk2+RO
 cmPeA+yWm8LNDss6MbLXCMHJmCCjx8/AM5VAh+f56WmLlSfdpWPG+orRocCv8upwOGwymGReELaWO
 m8YapLxHx0OZ442dC9dn5myDD2gXGnMPjyapyocGKB9D+mXP11iCIy6qyj1woQkfAQkdjDiNov66y
 twFGG9tFMhnrpInWxDHIl044sJZ5148ibl0oReLft8U6ibHPHn4j9nhvBQLzMhebMmweJJHLoas00
 4iQpwSwNceRA61srdGr0hQaK9kO+brnrnqvZD56qHrl98gtDxx2HcnMktfZefU9Hv5CcHiwSWlD2X
 7IhWD1dy8Zlz3LT1cWaIm2nh2LrYKgzl5QDUDadNGjscyINVWcAvBr4+hjAIoFuG9izGXZ101vnvP
 z0mAB7C19uAdGljAYD+wo19okMAt4WHQ4sXAbFqwFpezJ21pig7J+81yobITMX/YPW/5Vkdlt/Oq6
 5Q1rR1gbS6Aer2+tJh59Y0il;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sCBQH-00DjwU-2E; Wed, 29 May 2024 05:00:25 +0000
To: abartlet@samba.org, Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Subject: Re: Fwd: Regression: ldb performance with indexes
Date: Wed, 29 May 2024 07:00:24 +0200
Message-ID: <21756342.4csPzL39Zc@magrathea>
In-Reply-To: <db7e729b-ee1d-45a1-b93f-23e229c8db22@catalyst.net.nz>
References: <4856178.OV4Wx5bFTl@magrathea> <5597028.rdbgypaU67@magrathea>
 <db7e729b-ee1d-45a1-b93f-23e229c8db22@catalyst.net.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

On Wednesday, 29 May 2024 02:40:00 GMT+2 Douglas Bagnall wrote:
> On 28/05/24 23:56, Andreas Schneider via samba-technical wrote:
> > On Tuesday, 14 May 2024 16:31:53 GMT+2 Andreas Schneider via
> > samba-technical> 
> > wrote:
> >>> Using a red black tree doesn't solve the issue:
> >>> 
> >>> $ bash repro_dev_ldb.sh 10000 indexes
> >>> RED BLACK TREE
> >>> RED BLACK TREE
> >>> RED BLACK TREE
> >>> Added 2 records successfully
> >>> RED BLACK TREE
> >>> Added 10000 records successfully
> >>> 
> >>> real    0m9.299s
> >>> user    0m9.212s
> >>> sys     0m0.263s
> >>> 
> >>> https://git.samba.org/?p=asn/samba.git;a=shortlog;h=refs/heads/asn-ldb
> >> 
> >> The thing is that those subtrees have 4 entries, with 10000 entries we
> >> walk
> >> 4x10000 so 40000.
> >> 
> >> This needs to be optimized. As dbwrap_rbt is similar to tdb we share the
> >> same problems. Those could be removed if a real rbtree is used.
> >> 
> >> So someone with more ldb knowlege should look into this. I dunno if we
> >> always need all those 4 entries and are then overwriting stuff or if we
> >> always traverse those 4 entries but don't have too if we found the one we
> >> need.
> >> 
> >> With two rbtrees we could just push nodes from one tree to another. It is
> >> just pointer that should be fast. Allocating memory and traversing is
> >> probably what makes it so extremely slow.
> > 
> > Andrew,
> > 
> > any comments?
> 
> I might be able to look at it soon.

I'm happy to look into it together if someone can explain the stuff to me. :-)


	Andreas


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D




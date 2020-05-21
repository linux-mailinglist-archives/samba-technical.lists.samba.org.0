Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C27F1DD9A3
	for <lists+samba-technical@lfdr.de>; Thu, 21 May 2020 23:43:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=aBf7TuKZtHsVvjh0EKVB5dddzeOxtKLXiq6+4I2WTrM=; b=PBsLJ0OlzC0YMFJHhnw0QoW0iv
	GO35ajbUwUaGI9M8i1f6Xg9uyQ2SNbejHM4vdevosi96Str73bajTBm3OKh8exT3Ak46X4a/vk/t/
	GjD3bkKqjFteuy8Iy0KKLyV48IxZXjUTcTFdlpytXEd/Sf9nJ83kVnpTcnUJ5Z1vH9BY3Cfoqhl05
	dQb80DCYezIS8BGf03dJlP+8HMWc6HIgvVzgkPqsdI+QbaTbSnlnc4m9bXXVQPB90XSrGYAQVA0Ps
	PHxn4m9u8UYQM4a1/KCswILAb0ajTrSwdtT1mkFV0Dg46bcQhKA0G+UfkOG0q/5v+wVs7oRxbztNE
	/Y+t8nbQ==;
Received: from localhost ([::1]:48756 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jbsyH-005PNE-VS; Thu, 21 May 2020 21:43:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39996) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jbsyD-005PN7-FJ
 for samba-technical@lists.samba.org; Thu, 21 May 2020 21:43:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=aBf7TuKZtHsVvjh0EKVB5dddzeOxtKLXiq6+4I2WTrM=; b=F65tQozs4neezx+6N5bzQLT1Z4
 N/eXFYWNRIXMcazQcL4+I5tFz2wCTvnBF1592BLjX5xo5+cw/25e8p2YF2+wfspItRBD70TF55tAo
 7I6wv8aJd/hjUL8dtQSn9mNHBEQiB9elXVSUrRQ2OGqyg9UfX04HKYYh3TBF60p9NphpxYOknPBD2
 PNaIZ3X96fsJcjJWKR/2rr3ej1H15b67QROMIi0KfgJ1UuQICVioKMEP/Z8RSsTNHa5HrBjK3HWhM
 6KfgqHiJW+uprwN6AnrKUfzXt0e4HdGfJmjSGSp1uHXfZ5p/q8kCoeDn5i64bbgqblH6367BbGk8G
 I3Cu2KuMIXOUdoAqN7SoryTYXFz249xN1BwuDBwlyfcjW/VTeBgaEmctUFinXHx1bokZ1ooVAxbBY
 bTVmH6jU2Ji/W24h+6/HeXI2QGczBr7a8CLNmaao+78QwnTQjSZ/Lj9iP7K6bQOwX2Ey/CtP9aPm9
 pV4V60N5DvReRvyCI8c+1HhD;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jbsyC-0000y3-Ck; Thu, 21 May 2020 21:43:16 +0000
Date: Thu, 21 May 2020 14:43:13 -0700
To: Jeremy Allison <jra@samba.org>
Subject: Re: Avoiding further (LDAP) stack proliferation in Samba
Message-ID: <20200521214312.GA12586@samba.org>
References: <7f08ecb52a4a94d95e39af436e94ab852cf0da55.camel@samba.org>
 <20200521012158.GB10353@jeremy-acer>
 <4ce022a6c65422e40e1a583f95cefbbc7585393c.camel@samba.org>
 <20200521021959.GB12847@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200521021959.GB12847@jeremy-acer>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
From: Christof Schmitt via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christof Schmitt <cs@samba.org>
Cc: swen@linux.ibm.com,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, May 20, 2020 at 07:19:59PM -0700, Jeremy Allison wrote:
> On Thu, May 21, 2020 at 01:53:36PM +1200, Andrew Bartlett wrote:
> > On Wed, 2020-05-20 at 18:21 -0700, Jeremy Allison via samba-technical
> > > 
> > > Are there tevent_req async versions of ldb_search() and ldb_request()
> > > (haven't looked, don't have the time right now, sorry) ? If not, is
> > > is easy to add them ?
> > 
> > No, and I've been told that gluing the two different async
> > architectures together isn't trivial, but it would be worth someone who
> > really understands (or perhaps the opposite, someone who doesn't and so
> > doesn't know what is impossible?) having a red hot go.  
> > 
> > Thankfully in this case all the calls are synchronous (some with
> > callbacks), none return to the main event loop, so this doesn't impact
> > this use case.  This is why I suggested ldb_search() and ldb_request()
> > would be a good match.
> > 
> > > New code is moving to tevent_req and async as much as possible, so
> > > to standardize on an internal ldap stack - which would be an
> > > amazingly
> > > good thing to do IMHO it needs to have tevent_req and async
> > > functionality
> > > I think.
> > 
> > It may be that we are unwilling to commit to the use of LDB if there
> > isn't a clear path to being able to use tevent_req in the future.  
> > 
> > In that case, all I would ask is that we do other things to merge the
> > stacks first, for example:
> >  - have LDB use more common layers with tldap under the hood.  Some
> > ASN.1 parsing is shared, but there is a lot that is not.
> >  - have tldap and LDB share structures (and so helper functions) like
> > ldb_message and ldb_dn
> >  - have common ASN.1 parsing for controls
> >  - do likewise with the smbldap code and libads.
> > 
> > Currently we have at least thee different ways an LDAP search response
> > is expressed, for example.  This makes it harder to have common utility
> > functions.
> > 
> > Imagine if we could prepare a struct ldb_request, but instead of
> > passing it to ldb, we pass it to (say) tldap, and the responses are
> > again ldb stuctures that we can use ldb utility functions on?  
> > 
> > This would work around the existing non-tevent async architecture of
> > LDB but still avoid all the collateral duplication (which is my bigger
> > concern).
> > 
> > I know I'm asking a lot, but as I said, unless we pause now and plan
> > the later merge work becomes quite epic.
> 
> That sounds like a sensible plan to me, but having said
> that I'm not going to be the one doing the work :-).
> 
> As we as a community have decided tevent_req is "The Way"
> then helping our older stacks integrate better with it
> is certainly a good way to make progress IMHO (and I'm
> as guilty as anyone as the author of the horrible hack inside smbd
> to do async opens which sidesteps tevent_req in order
> to reduce code changes).

So i am trying to understand where this leaves us. The driver behind
Swen's patchset is to move away from libads with the end goal of being
able to better control the domain controller selection.

Now there is tldap and ldb as possible ldap libraries. Do we need to
look at the integration of those components first, before adding the
ldap library usage in winbindd?

The goal of having one ldap client stack is worthwhile. From what i can
see, tldap implements the async tevent model, with the exception of the
gensec part. Also the async calls are currently not used.

I have not looked in ldb much, on a quick look, it seems to use the
openldap library again. Would it make sense to have ldb use tldap as
backend and eventually move away from openldap?

Christof


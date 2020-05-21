Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F130D1DC4F1
	for <lists+samba-technical@lfdr.de>; Thu, 21 May 2020 03:54:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=7vSte9OPdyoHxdYftsVy+IR69i9+Zve/pmalZhnO9BQ=; b=C1jV60JaCLtMC+GznxHhZvP3nj
	F9/DSZKIpNpj16kTFLdpDatlIvp4+S13pHIMq8MnsmhF71p9f5hl6iFNDRhDP4hcU+DNmtYBliBIU
	/AVxuBmcRHwGc7FtWu+krMcJF2yzDxUU10PN2+zuM26OKMfFkgn1w3D2ou0HoztY8ZNw1qZ/+Ii+T
	m+/ImVeVpy7QtKlRZGjN3MPzDEOec31aO7hvuiTBAOh36v/nPp4zi4CFyXF6EzBYA3ojYxCHjoqYo
	QAZvfV8fBDeY4clvRf+uhGTQOtcnyMmQmWNVO9vXLXnIA+jvGD+bOenYttazez4ZbtTbOwwDSWLRe
	eovi49hg==;
Received: from localhost ([::1]:64972 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jbaPK-005JvY-UY; Thu, 21 May 2020 01:54:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55492) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jbaP3-005JvR-W2
 for samba-technical@lists.samba.org; Thu, 21 May 2020 01:53:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=7vSte9OPdyoHxdYftsVy+IR69i9+Zve/pmalZhnO9BQ=; b=vgeQLHuUSyd28ilywBdkEeHYZE
 3fPsew9MTG8/ihImJzYjYYypyIe0kAv5DNx/OzU981u+6d41H7HUC1KRraUGtzcQuRSuXV9fWrOSS
 WxAKHudUzFSsa9/DT/MXJB+mpHzYxiJ4vzVNp1iio+aW+qTRljBWbNZLx0w3ctGtf7xk1QhkMdhpE
 mHizLALQrJBacsLi986sngzl+XmOALJSh5u0gNPWCzOc5tFDbaBqJpovp8mDzLnWidz3HNQdmm8cO
 QEKwIc/8SeXC7ri1u50StWJllsfAnThw6CR2CFm8rib9myI3/kmUqgwlI6NUbU/x/k96wGilnzLsY
 BGjtyNAN943YF7YvqLmdyzGNuDusnqVpBOUDXRG0l+CixadosxBMCu+r7avKsZ+n5CIvhnH5fjxhZ
 Wj/6abIMBTcRFi6fusk03CgTA8QBQL70mcsYqOtfUGJbnvVEFMqbgFBcI9U+pzQcsWAxVv9y8As68
 C8x4WXYajRkNHFnk5kfsM8wc;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jbaP1-0007GX-76; Thu, 21 May 2020 01:53:44 +0000
Message-ID: <4ce022a6c65422e40e1a583f95cefbbc7585393c.camel@samba.org>
Subject: Re: Avoiding further (LDAP) stack proliferation in Samba
To: Jeremy Allison <jra@samba.org>
Date: Thu, 21 May 2020 13:53:36 +1200
In-Reply-To: <20200521012158.GB10353@jeremy-acer>
References: <7f08ecb52a4a94d95e39af436e94ab852cf0da55.camel@samba.org>
 <20200521012158.GB10353@jeremy-acer>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 swen@linux.ibm.com, cs@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2020-05-20 at 18:21 -0700, Jeremy Allison via samba-technical
wrote:
> On Thu, May 21, 2020 at 11:47:50AM +1200, Andrew Bartlett wrote:
> > However, I quite strongly feel that we should not further
> > proliferate
> > the new or substantial new use of tldap in Samba without:
> >  - offsetting work to reduce, not increase the number of LDAP
> > protocol
> > stacks
> > and
> >  - substantial sharing of structures, ASN.1 parsing and other
> > utility
> > code
> > 
> > My preference, as these are all sync or local callback based calls
> > is
> > that you implement this with LDB.  LDB is a mature, extensively
> > used
> > LDAP client library (not just the directory store for the AD DC).  
> > 
> > The routines you would need are ldb_search() and
> > ldb_request().  The
> > timeout can be easily set on each request and I can assist with
> > further
> > guidance if need be.
> 
> Are there tevent_req async versions of ldb_search() and ldb_request()
> (haven't looked, don't have the time right now, sorry) ? If not, is
> is easy to add them ?

No, and I've been told that gluing the two different async
architectures together isn't trivial, but it would be worth someone who
really understands (or perhaps the opposite, someone who doesn't and so
doesn't know what is impossible?) having a red hot go.  

Thankfully in this case all the calls are synchronous (some with
callbacks), none return to the main event loop, so this doesn't impact
this use case.  This is why I suggested ldb_search() and ldb_request()
would be a good match.

> New code is moving to tevent_req and async as much as possible, so
> to standardize on an internal ldap stack - which would be an
> amazingly
> good thing to do IMHO it needs to have tevent_req and async
> functionality
> I think.

It may be that we are unwilling to commit to the use of LDB if there
isn't a clear path to being able to use tevent_req in the future.  

In that case, all I would ask is that we do other things to merge the
stacks first, for example:
 - have LDB use more common layers with tldap under the hood.  Some
ASN.1 parsing is shared, but there is a lot that is not.
 - have tldap and LDB share structures (and so helper functions) like
ldb_message and ldb_dn
 - have common ASN.1 parsing for controls
 - do likewise with the smbldap code and libads.

Currently we have at least thee different ways an LDAP search response
is expressed, for example.  This makes it harder to have common utility
functions.

Imagine if we could prepare a struct ldb_request, but instead of
passing it to ldb, we pass it to (say) tldap, and the responses are
again ldb stuctures that we can use ldb utility functions on?  

This would work around the existing non-tevent async architecture of
LDB but still avoid all the collateral duplication (which is my bigger
concern).

I know I'm asking a lot, but as I said, unless we pause now and plan
the later merge work becomes quite epic.

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba





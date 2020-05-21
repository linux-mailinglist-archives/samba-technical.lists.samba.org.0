Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4861DC51B
	for <lists+samba-technical@lfdr.de>; Thu, 21 May 2020 04:20:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=U7G5WaRldzQW71RQImvt3LdBDkPr1JaXGPLI8lqauvw=; b=WJRv5L2WxGemXtpQay4ILBM0l/
	OUiJqlsCUhkxuXy/+9BHfiIbZCMDCQxqsmVeR2qyCixcpq+0q1NQjIXaUKdD0dPlL1gxh3Zc9nCb+
	oYUR6+Co/F37pmepiV5TjmX41Ibb4e6nY9kI4RVuj5yXjoYvpRwb6Ug4ZWRSMg6JV6A1z6OeWvK+P
	uhHBFxBBE4cyTjv5/uQhVoF+P0/l0yJaFeBndVPjnKQjbI32klNtast5SmLz0swyE9XNCcHmksPhR
	usfaenfSWLM87YzG1LsITAO6i3VAQ5SEoJm9A8RMPYMBYppnxcIcx7Y3cNg45KHt7kOxP+JIXsa//
	HKjdBUvQ==;
Received: from localhost ([::1]:18182 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jbaod-005K2w-FC; Thu, 21 May 2020 02:20:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63172) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jbaoY-005K2p-AA
 for samba-technical@lists.samba.org; Thu, 21 May 2020 02:20:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=U7G5WaRldzQW71RQImvt3LdBDkPr1JaXGPLI8lqauvw=; b=JOBMclICiVUWgRSfIcWK/oR2PM
 t4wjwwsO2G/QxBnolX6UHWuDsNKLyendKFDyaUdBRghQ6VMukPa5+poCrCtWdUC9RQTCalc1y9YHW
 2oUQXroUFJZWX6BHqhVXId8xRzUmYazWO/vIL6wAHPviUMyQZRP1pj4SPkoF9zfAir58ahqlrceBC
 UKycC+2H3Jk1Qi7+F3b2ASGDoIXBZXCp+q9gMwJMO5x7thkwDOf0ivBLgAiBbIaMLde5glcIDBgeZ
 gX6ObwhGoZhXw/Pn+sHM9QSyMTcQJ5ZdRSP16iNYn3QLm2pPwLkaE7hVtINO9VW1f/UsgahTtQhqH
 /KvBPO/RNzGoNMn2aXsWhlKznPCoGkQ7JDtVCgFYJ2W4QxLXgtidKwUoX/9iQkyR38no1iJHMklmg
 gfcdVRPnmVe2Ruq6zb4S5Nnrn4GDiAZqk0pE4cNg5L+9VujaED5qqEVndUvhEcdYqVhR+8PaJNRD/
 RppCIpTDFFY7sqLLw+DlRQl1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jbaoX-0007Pr-3t; Thu, 21 May 2020 02:20:05 +0000
Date: Wed, 20 May 2020 19:19:59 -0700
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Avoiding further (LDAP) stack proliferation in Samba
Message-ID: <20200521021959.GB12847@jeremy-acer>
References: <7f08ecb52a4a94d95e39af436e94ab852cf0da55.camel@samba.org>
 <20200521012158.GB10353@jeremy-acer>
 <4ce022a6c65422e40e1a583f95cefbbc7585393c.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ce022a6c65422e40e1a583f95cefbbc7585393c.camel@samba.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 swen@linux.ibm.com, cs@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, May 21, 2020 at 01:53:36PM +1200, Andrew Bartlett wrote:
> On Wed, 2020-05-20 at 18:21 -0700, Jeremy Allison via samba-technical
> > 
> > Are there tevent_req async versions of ldb_search() and ldb_request()
> > (haven't looked, don't have the time right now, sorry) ? If not, is
> > is easy to add them ?
> 
> No, and I've been told that gluing the two different async
> architectures together isn't trivial, but it would be worth someone who
> really understands (or perhaps the opposite, someone who doesn't and so
> doesn't know what is impossible?) having a red hot go.  
> 
> Thankfully in this case all the calls are synchronous (some with
> callbacks), none return to the main event loop, so this doesn't impact
> this use case.  This is why I suggested ldb_search() and ldb_request()
> would be a good match.
> 
> > New code is moving to tevent_req and async as much as possible, so
> > to standardize on an internal ldap stack - which would be an
> > amazingly
> > good thing to do IMHO it needs to have tevent_req and async
> > functionality
> > I think.
> 
> It may be that we are unwilling to commit to the use of LDB if there
> isn't a clear path to being able to use tevent_req in the future.  
> 
> In that case, all I would ask is that we do other things to merge the
> stacks first, for example:
>  - have LDB use more common layers with tldap under the hood.  Some
> ASN.1 parsing is shared, but there is a lot that is not.
>  - have tldap and LDB share structures (and so helper functions) like
> ldb_message and ldb_dn
>  - have common ASN.1 parsing for controls
>  - do likewise with the smbldap code and libads.
> 
> Currently we have at least thee different ways an LDAP search response
> is expressed, for example.  This makes it harder to have common utility
> functions.
> 
> Imagine if we could prepare a struct ldb_request, but instead of
> passing it to ldb, we pass it to (say) tldap, and the responses are
> again ldb stuctures that we can use ldb utility functions on?  
> 
> This would work around the existing non-tevent async architecture of
> LDB but still avoid all the collateral duplication (which is my bigger
> concern).
> 
> I know I'm asking a lot, but as I said, unless we pause now and plan
> the later merge work becomes quite epic.

That sounds like a sensible plan to me, but having said
that I'm not going to be the one doing the work :-).

As we as a community have decided tevent_req is "The Way"
then helping our older stacks integrate better with it
is certainly a good way to make progress IMHO (and I'm
as guilty as anyone as the author of the horrible hack inside smbd
to do async opens which sidesteps tevent_req in order
to reduce code changes).


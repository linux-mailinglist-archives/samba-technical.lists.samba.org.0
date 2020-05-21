Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A51E1DC492
	for <lists+samba-technical@lfdr.de>; Thu, 21 May 2020 03:23:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=MfiWo0zfXnIa28sw1RGKeyTvTTRuQ9Puj/LC9t7CdEc=; b=SfJ3HatdW318NR8HGLnvAXooGB
	rVeQMMMOXll46/20gunaPSI5VxfYpviFpszqjlyxNAasDxxL+eOF44+bNAOown9ViBR/hr+Ue7VCI
	8TLHTKZoBE3rZmEg1+cZ3LayW9YfDjLsH/w+alzG1E7x0mZXeVUK2WLe9QeXCHJmGthIzIc6bkgb0
	oTuqkPejKSswGqeK/AoYow25X5oc2j7EMBc73VcQbumdW2P9jN+VzXP5lSEEiJBXqirCNc4hLvoqg
	098EAURYA/SFIogF5h9YNeVQZaiSAXARv0WA3I3hAc5S29tgt8Ftv9Zs6Bkmy4KG+pJJAxZGrZ8lp
	iyDqFYYA==;
Received: from localhost ([::1]:64234 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jbZuU-005JoY-MZ; Thu, 21 May 2020 01:22:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47468) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jbZuQ-005JoR-8W
 for samba-technical@lists.samba.org; Thu, 21 May 2020 01:22:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=MfiWo0zfXnIa28sw1RGKeyTvTTRuQ9Puj/LC9t7CdEc=; b=ioMOOsZ+JAdWZgu19jSbrzKsrA
 GyePAjLTKsGq/gUXQitOtET/5MhHk6yUi49fEdvGRMm3ubjUqKZO7EOVH3JNqLNA6gBTVvAusEeuZ
 nkEsbP4iQL6FzI/BdEBQXgInPgw3/ZN/PyLHpTkz2KJmgdaNneA3+U5p0K5NWxdTuzs7BhFLLtIfU
 hFW1Q6ZR0IXuIwfEcem/9WF2ENIt0toX0oLGF1zqBuMd6Afo/kfB96/GKI4bb8hOyvTBs4FqRf78t
 d7NJIkLIl7L0lZgKOOnk1Br6o/sHMj9J5BeXNyTbABxyc991XntJj9hBGLvfJXAYl8fnkZYbjhOwf
 Ganp1Itr/8iicmjhGjXUH3AXEUN38u9pGDN1nMkwx7dGgGsbDLCoRxjP34YhZEWblQhg/QN/hz9vX
 vWEd5RduM2inYJicXaGFIDH/D2BVpmXpH/8P5yEQs0hhwh4AfC1SSXFvsUnniyvsxR/axdGTCzWAn
 EOH5dRV1gMstpy8CGLmDx326;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jbZuO-00071f-Qn; Thu, 21 May 2020 01:22:05 +0000
Date: Wed, 20 May 2020 18:21:58 -0700
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Avoiding further (LDAP) stack proliferation in Samba
Message-ID: <20200521012158.GB10353@jeremy-acer>
References: <7f08ecb52a4a94d95e39af436e94ab852cf0da55.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f08ecb52a4a94d95e39af436e94ab852cf0da55.camel@samba.org>
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
Cc: cs@samba.org, swen@linux.ibm.com,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, May 21, 2020 at 11:47:50AM +1200, Andrew Bartlett wrote:
> G'Day Sswen and Christian,
> 
> As this is a more 'meta' question, I wanted to write to the broader
> mailing list in regard to: 
> https://gitlab.com/samba-team/samba/-/merge_requests/1351#note_346327256
> which is following on from Jermey's comment: https://gitlab.com/samba-team/samba/-/merge_requests/1258#note_320352109
> 
> I'm really sorry this discussion has come up on what might, in other
> circumstances been a great demonstration of showing the broader design
> that started the tldap changes.
> 
> Jermey asked earlier to see the broader designs and given the broader
> implications I think it is appropriate to have that raised on the list
> here.  
> 
> Explaining our plans in public before we have code is not something we
> do well in Samba - we fear (and this mail shows that is a genuine fear)
> that others will jump in and suggest things.  Much easier to have the
> code finished and put any questions to bed with: well, this is written
> and works!
> 
> However, I quite strongly feel that we should not further proliferate
> the new or substantial new use of tldap in Samba without:
>  - offsetting work to reduce, not increase the number of LDAP protocol
> stacks
> and
>  - substantial sharing of structures, ASN.1 parsing and other utility
> code
> 
> My preference, as these are all sync or local callback based calls is
> that you implement this with LDB.  LDB is a mature, extensively used
> LDAP client library (not just the directory store for the AD DC).  
> 
> The routines you would need are ldb_search() and ldb_request().  The
> timeout can be easily set on each request and I can assist with further
> guidance if need be.

Are there tevent_req async versions of ldb_search() and ldb_request()
(haven't looked, don't have the time right now, sorry) ? If not, is
is easy to add them ?

New code is moving to tevent_req and async as much as possible, so
to standardize on an internal ldap stack - which would be an amazingly
good thing to do IMHO it needs to have tevent_req and async functionality
I think.


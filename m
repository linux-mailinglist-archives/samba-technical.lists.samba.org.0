Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E3B1F4E92
	for <lists+samba-technical@lfdr.de>; Wed, 10 Jun 2020 09:09:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=5w2Pnh+aJYZLSdnSS1x9tIWZ1rXoET3R0z3U01wmCQY=; b=2jcpB0T79CX8LOr9f1dPInlXw2
	ItvHWM6E0kSrDdAQOegF0z0+malY5ovtzUWLYbzAcwC63xmTECnzSPmE9eWEIWYbhXO15kEqcu8e8
	9vF2B22dCJQw6org+WNDcwWNjyN+foUlQDa7gBgMRcnHkjDyI0sV0oLgZiUi57li2Ns6fHOkbgKTV
	zi8z42L00T5jlJy82hjEbBN6jqiRh5/H8SeqQr/rvuYjKjR8PKeU20N6I/Y4wMtl1pWaMRSlaes3V
	ryzcSLl3v7PvJvR+PyK/5pzp7+/bLaLxdAGc5B0Ic5P0fZTzubEDgIzcDMb48q7ESxMLandMTC8NO
	oZ8kSUgw==;
Received: from localhost ([::1]:20292 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jiuqe-009huW-MH; Wed, 10 Jun 2020 07:08:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31278) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jiuqI-009huP-Ch
 for samba-technical@lists.samba.org; Wed, 10 Jun 2020 07:08:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=5w2Pnh+aJYZLSdnSS1x9tIWZ1rXoET3R0z3U01wmCQY=; b=G+6OGJut8oqisylllo0U57J2V9
 1ePMO0e7ZXyWupEd4Ar1HdqELrcaSm8kMOqNR8QRxBSqaRCcxQC67m9yCxgYXCbrX85HjYHKv3ws+
 b3JKS5N4F3jxJvsgnkwtHqFQn8i49ELw1pt3t3yis/gl5lqG0UEO0dTKspcgI8Vg+QY9NAK1wdmgP
 K9Wc58nPDH/rkGnX/3UEtNKSkbqLOzpSiUXRhsna/EOJEhHY0LjZYqnjR0oP0tBABVFaTZMeG1AnM
 79tGG4isJSKF5UNg1mKVn51yPv0NSeLQm1qgh6L19H/41UiN5ud0jW4zsb4GtcuqYsoNZKZDzRXfg
 in6tPVmL/4/jSId/b8d2OYqtzj9N++695Z/aY6lRMyYZDTdtm60WYCgVSLzH7mnWemMv1sbzj0c4z
 VwXqgSG9fuWrIAAVH/F1d1nuMUTjo71bcql4eVaKDObV02vAd9VzGSWa9tusovyd4nZPuE0GomFyf
 YSxiOmACMTdhHrBl+BEbzWSE;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jiuqG-0005HP-QP; Wed, 10 Jun 2020 07:08:09 +0000
Message-ID: <e530f93b80c095696fe588a51615bb3bfce106cc.camel@samba.org>
Subject: Re: Merge Request Template for Gitlab
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
Date: Wed, 10 Jun 2020 19:08:02 +1200
In-Reply-To: <4274398.2CJHkuDXdR@magrathea>
References: <3443591.AXIHuhjjAK@magrathea>
 <573f3e2b88f8051073ada03ecb2658d8f1a8a58d.camel@samba.org>
 <4274398.2CJHkuDXdR@magrathea>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2020-06-10 at 07:23 +0200, Andreas Schneider wrote:
> On Tuesday, 9 June 2020 20:35:01 CEST Andrew Bartlett wrote:
> > Thanks for suggesting this.  I've made that change so others can
> > give
> > feedback based on how this works in the real world.
> > 
> > The only change I've made is to reference README.Coding not
> > CONTRIBUTION.md.
> 
> Thanks! +1
> 
> > >  * [ ] Code modified for feature
> > 
> > I'm not sure exactly what you mean by this checkbox.
> 
> Maybe name it: Preparation for a feature
> 
> There will be follow up merge requests ...
> 
> Better ideas?

* [ ] (optional) This MR is just one part towards a larger feature.

> > >  * [ ] Test suite updated with functionality tests
> > >  * [ ] Test suite updated with negative tests
> > >  * [ ] Documentation updated
> > >  * [ ] CI timeout is 3h or higher (see Settings/CICD/General
> > > 
> > > pipelines/
> > > Timeout)
> > 
> > This is not needed for the shared development repo, but saying so
> > in a
> > succinct way will be a challenge.
> > 
> > Some wording pointing at the Contributing page on the wiki might be
> > a
> > good idea also.
> 
> We could make it a link to the contribution page where it is
> described in 
> detail.

Sounds good.  Remind me what the syntax for that would be?  To many
wiki/markdown syntaxes muddle my brain...

> > > ## Reviewer's checklist:
> > >  * [ ] Any issues marked for closing are addressed
> > >  * [ ] There is a test suite reasonably covering new
> > > functionality
> > > 
> > > or
> > > modifications
> > > 
> > >  * [ ] Function naming, parameters, return values, types, etc.,
> > > are
> > > 
> > > consistent
> > > and according to `CONTRIBUTION.md`
> > > 
> > >  * [ ] This feature/change has adequate documentation added
> > >  * [ ] No obvious mistakes in the code
> > > 
> > > ====== /template ======
> > > 
> > > 
> > > Settings -> General -> Merge Requests -> Default description
> > > template
> > > for
> > > merge requests
> > 
> > Finally, we should just be aware that this feature is not in GitLab
> > CE,
> > so we would loose it (just as we would loose the Approve button) if
> > we
> > moved off gitlab.com.
> > 
> > (That said, it is entirely possible GitLab will open source it if
> > we
> > ask, so we should do that)
> 
> The templates for Issues go into the git repo via
> .gitlab/issue_templates 
> iirc. They would just need to add support for merge requests too.
> Doesn't seem 
> to be a too big deal.

They even have merge request templates.  But they don't have a
*default* MR template, so until we fill in that pre-repo setting
nothing shows up by default.  Very strange, but yes, a fix would be
quite simple.

> > Thank you *so* much for proposing this.
> > 
> > Everyone else:
> > 
> > Please have a go with the templates over the next few days and help
> > us
> > get one that helps us all!
> 
> Sugestions are very welcome. I can then use the improvements for
> libssh too 
> :-)
>  

Thanks Andreas!

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba





Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 316B31F4CD7
	for <lists+samba-technical@lfdr.de>; Wed, 10 Jun 2020 07:24:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=jyzXex192JAoNLOjLrzRjjDr4EztIAyfIfasGDdxtks=; b=tAHP4sykCZeEEZnV6eKmfr6WKT
	k9CMCVhNPCoIXV8rpQWyqJpmlSHP0ejihEe5R3n2hBF1perMpJlvwSPAuWcDle151t+NJ231eCA0T
	sMeU1xdNbxBexKHFSbgsBf1HaA2Ii3wDylLhk7r57Bi025uyA3xfuZL2o4UFhngE7uPSyO7Leufrx
	rdjbHBrlGNO3DZgEK9bJOZEtoctREr5pjNDnVYbA0FJEbYs9MffUq74LXydWgrGf6rBcRvbYBcyHX
	xsrPHT5d0MZQWrNhrz+5Yo6D4AVRKOjZzFmi/yd0ZfA765nmcUqSHr99kIVaeYoaGNynDGmSPhqfg
	OQ5kYMRA==;
Received: from localhost ([::1]:64136 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jitD4-009hEU-Ci; Wed, 10 Jun 2020 05:23:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53368) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jitCu-009hEN-SJ
 for samba-technical@lists.samba.org; Wed, 10 Jun 2020 05:23:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=jyzXex192JAoNLOjLrzRjjDr4EztIAyfIfasGDdxtks=; b=f1V3+t/CdX003Vy5LzER8MmGuD
 zSLeybQOV8Ee4QIxgTWTiWBBp9PravFuq5/XRspoEIxUsfESIle2R+2WVXi6ga/RA5eAxqNEw93tJ
 sd90lsnGyZJe15qt5/ZeB/oJg3cpRfrx72DaKwA+J4UyaqVN60lsoKiOAZeDuSbEDYBUY8Yk41BB8
 qx/AdUZ/AJdPfHTo5uvX982Vq4NYa8NJbNfenTtqMf1MyqXrvFsGZAWs+VNJ6+sG8DQPdnQGcFBj0
 R5mvhjKkc+O6fSV0lIaSYdRsGo0/Yii8nCbKsR+DZDJwkDqSgiVc1p5phXecwB5y8/axshklq8zar
 xNyXq4wbuYUpGx7MXF/NjX8dzx7k28HbSTOPk0DZIbIwBE1Xy2orz+X9V41T9RoVKKUA/PBDbiiW0
 kuM6uCLZ2DvakArefDaaXU1c34mFATMnUkpWJF5Y/wzy2TAxCKXFPG/5lFCChcM3sYypCc3iRMe5U
 atJWKRXH5SD4wUbPAKG4GecH;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jitCu-000375-3b; Wed, 10 Jun 2020 05:23:24 +0000
To: samba-technical@lists.samba.org, Andrew Bartlett <abartlet@samba.org>
Subject: Re: Merge Request Template for Gitlab
Date: Wed, 10 Jun 2020 07:23:23 +0200
Message-ID: <4274398.2CJHkuDXdR@magrathea>
In-Reply-To: <573f3e2b88f8051073ada03ecb2658d8f1a8a58d.camel@samba.org>
References: <3443591.AXIHuhjjAK@magrathea>
 <573f3e2b88f8051073ada03ecb2658d8f1a8a58d.camel@samba.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, 9 June 2020 20:35:01 CEST Andrew Bartlett wrote:
> Thanks for suggesting this.  I've made that change so others can give
> feedback based on how this works in the real world.
> 
> The only change I've made is to reference README.Coding not
> CONTRIBUTION.md.

Thanks! +1

> >  * [ ] Code modified for feature
> 
> I'm not sure exactly what you mean by this checkbox.

Maybe name it: Preparation for a feature

There will be follow up merge requests ...

Better ideas?

> >  * [ ] Test suite updated with functionality tests
> >  * [ ] Test suite updated with negative tests
> >  * [ ] Documentation updated
> >  * [ ] CI timeout is 3h or higher (see Settings/CICD/General
> > 
> > pipelines/
> > Timeout)
> 
> This is not needed for the shared development repo, but saying so in a
> succinct way will be a challenge.
> 
> Some wording pointing at the Contributing page on the wiki might be a
> good idea also.

We could make it a link to the contribution page where it is described in 
detail.

> > ## Reviewer's checklist:
> >  * [ ] Any issues marked for closing are addressed
> >  * [ ] There is a test suite reasonably covering new functionality
> > 
> > or
> > modifications
> > 
> >  * [ ] Function naming, parameters, return values, types, etc., are
> > 
> > consistent
> > and according to `CONTRIBUTION.md`
> > 
> >  * [ ] This feature/change has adequate documentation added
> >  * [ ] No obvious mistakes in the code
> > 
> > ====== /template ======
> > 
> > 
> > Settings -> General -> Merge Requests -> Default description template
> > for
> > merge requests
> 
> Finally, we should just be aware that this feature is not in GitLab CE,
> so we would loose it (just as we would loose the Approve button) if we
> moved off gitlab.com.
> 
> (That said, it is entirely possible GitLab will open source it if we
> ask, so we should do that)

The templates for Issues go into the git repo via .gitlab/issue_templates 
iirc. They would just need to add support for merge requests too. Doesn't seem 
to be a too big deal.

> Thank you *so* much for proposing this.
> 
> Everyone else:
> 
> Please have a go with the templates over the next few days and help us
> get one that helps us all!

Sugestions are very welcome. I can then use the improvements for libssh too 
:-)
 


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D




Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DD42141BF3
	for <lists+samba-technical@lfdr.de>; Wed, 12 Jun 2019 08:05:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=XWWT1Qy/H6abdmw2x/vbCUy52gTjSxvPDmJPIbnl3Ko=; b=xx3kaQLTLmCNrbt88+YhVZO8Ez
	b9h9UFbvME2r5syeOOml/h0f81phvjNcmPfzGOXfDqHRflCGOhGuLf9kJoqI7AXinA5S0KHP6kyLG
	zpzQ8xvRFIv+xiC8yhBDXl7nMlRRvqTfCLIekKJwCg5vyzffHKfnHucSq5Q3OAiRzyoLlfFScywVh
	ed98Hjr3SzIK22X1RbFOFIu1ahSGOCX5SSUUUtqchzgCg5g/p/wGEAWCzIMfGm5efz6NRCfUstZO1
	eR3Tt/Mi/Of0l/59+e3Ekt9t0Alypgb2XWOiavdpCxF+8rLrkpZUpag6ZB32INGgNRlPnvmUguT36
	M0pvjc+A==;
Received: from localhost ([::1]:30276 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hawNu-0014vA-53; Wed, 12 Jun 2019 06:05:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35830) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hawNp-0014v3-Qz
 for samba-technical@lists.samba.org; Wed, 12 Jun 2019 06:05:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=XWWT1Qy/H6abdmw2x/vbCUy52gTjSxvPDmJPIbnl3Ko=; b=CNYtkg3BjtQLbuxMFYfkAiv3nR
 vYMbWnVucJSy1dJuBCmSKLGhDK5knM7iG0qy+gp9VmNi+vfGAJAMf/bBBCJ1HyiRAvS7yCGpoP4n1
 WPzoGgVcZsvpehIzHzgt+CVWJVieWD+jDEHwFOb06DV8akKS+THpEof20BSac6JwUG/w=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hawNo-0000w4-Rb; Wed, 12 Jun 2019 06:05:17 +0000
Message-ID: <9c4fa2da0d467c72a822f0151a08b006daf332bd.camel@samba.org>
Subject: Re: Some bugzilla work and thoughts
To: Anoop C S <anoopcs@cryptolab.net>
Date: Wed, 12 Jun 2019 08:05:14 +0200
In-Reply-To: <f916dfd9c395ea1589daddefaa31f8ef4615cd8e.camel@cryptolab.net>
References: <c976289f207aa7ab941cb368e38e806201eff36c.camel@samba.org>
 <f916dfd9c395ea1589daddefaa31f8ef4615cd8e.camel@cryptolab.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2019-06-12 at 10:54 +0530, Anoop C S via samba-technical wrote:
> 
> 
> It would be good to have an indication regarding the release
> version/tag to which a particular bug fix has gone through while it
> is
> getting closed as RESOLVED+FIXED. We could either use a bugzilla
> comment or built-in 'Fixed in version' field to mark the version/tag.

Yeah, I generally do that, indeed that search takes most of the time
when doing triage.  Perhaps one of the bugzilla admins can comment on
the practicality of extra fields. 

Andrew Bartlett
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba





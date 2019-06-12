Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 531AA43116
	for <lists+samba-technical@lfdr.de>; Wed, 12 Jun 2019 22:46:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=1s0q5s3RVyHlrLwwv9CyhFVkYze89cUg2QIeJH1JZvw=; b=n4sr7t9cgfZIi3IIeMOdg6U/h0
	nEos/PslAEC7L3IpjOiqif0lj0nDEzLvR/zlmCkQqRi1W+/eiqmujLx3nKpTRmx1SHKF9sJjCj+Hh
	/E587WiqnpfPldgknJUWfBXRCVs3xZwjS4f3VC7VNqtZ3DTcOeWLESXDkPi3FM8k+Ytc3lszEFONY
	08RZ7UcLx+Rk1jtlJfSywUVlFMRr1Cx0WjS2coAsv4j7zpR1it6bV+yild16lTfSJQlTDesOl+oxr
	nw+ZI4XpKf8hP1SNowevvuFeyfgFtqT2Gjls6FSK1Cq77v/0TzRtgdvldNesSvZJXtQInBtKKOhUV
	ZriWMFnw==;
Received: from localhost ([::1]:62180 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hbA7k-001MyW-UU; Wed, 12 Jun 2019 20:45:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33628) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hbA7g-001MyP-DD
 for samba-technical@lists.samba.org; Wed, 12 Jun 2019 20:45:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=1s0q5s3RVyHlrLwwv9CyhFVkYze89cUg2QIeJH1JZvw=; b=YowqKuoVZW9cABArlPGEyPtTTv
 hOscJqpteRKeKlv+Pu/4f+XojxwS5F5OL+9A3uvVWJm/0JH9e8SpE/xA3dfV2BFgEQAuNhC3UpHT2
 NKBGPnwBNNQP4WcRSQFRBL18QW/2qjwN9CEq4+K9d5S9uzRpEfpLS4wswm7jKjAF9vFA=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hbA7f-0002PN-IY; Wed, 12 Jun 2019 20:45:32 +0000
Message-ID: <e5622276b22de37212b27b908ee9dc065519fa72.camel@samba.org>
Subject: Re: Some bugzilla work and thoughts
To: =?ISO-8859-1?Q?Bj=F6rn?= JACKE <bj@SerNet.DE>
Date: Wed, 12 Jun 2019 22:45:22 +0200
In-Reply-To: <20190612135627.GA24651@sernet.de>
References: <c976289f207aa7ab941cb368e38e806201eff36c.camel@samba.org>
 <f916dfd9c395ea1589daddefaa31f8ef4615cd8e.camel@cryptolab.net>
 <9c4fa2da0d467c72a822f0151a08b006daf332bd.camel@samba.org>
 <20190612135627.GA24651@sernet.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Anoop C S <anoopcs@cryptolab.net>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2019-06-12 at 15:56 +0200, Björn JACKE wrote:
> On the other hand I think it's not too
> much to ask
> for also to look the exact release version up in the release notes
> (or the git
> history if you prefer) in case that someone is interested in the
> exact
> version where a fix went in. All the bug IDs are listed nicely in the
> release notes already.

A bot that looks for BUG: URLs and adds comments saying that a commit
with id xxxxx was applied to branch yyyy mentioning this bug would be
incredibly helpful.  

Most of the triage time is spent finding that by hand.  (And our users
should not have to do that, it requires git searches or reading
multiple release note files to determine which version something landed
in). 

Our bugzilla as currently used requires way to much manual work that
could be automated, costing both team members and our end users. 

Andrew Bartlett
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba





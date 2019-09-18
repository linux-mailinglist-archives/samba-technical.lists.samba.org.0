Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F599B6CAB
	for <lists+samba-technical@lfdr.de>; Wed, 18 Sep 2019 21:35:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=O60zk54d8v91HszWZdLPiflr8gW6alHQWNvX6rufiVE=; b=3Yno5eBFZ65DOEeE6i35vOT63o
	SVOLesaGV64YjzTWvT2uRLqo5WkBf8Znb7pN5Nfg6uXWWH4z5MVF9feAY6b5DhY/2bXrMZF/dG9sG
	kMYQKhm0UkSyC1drpVwFdqJNPxNEO+1Pz5azVdTNe1pHkswUOw9zTK+VhWWDkGYSQ58P/Fif+idbN
	ipHy3WlEsq9sqfrn1N+xm85yRlalS4lfmBz7Po2yqqeEDA+a5R23nmxndimZi8jbf6ruL8vxQeGrI
	FrU0Wr65iub3OI/7pJd7sgomPWQW0T+4X57FXL8KvuvcsJD4bmYpvoD2SwZ+CXfOglYsZCxSIZQ1I
	7DpnIX4g==;
Received: from localhost ([::1]:36198 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iAfj0-006gAT-GH; Wed, 18 Sep 2019 19:34:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34932) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iAfiw-006gAL-CT
 for samba-technical@lists.samba.org; Wed, 18 Sep 2019 19:34:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:To:From:Message-ID:CC;
 bh=O60zk54d8v91HszWZdLPiflr8gW6alHQWNvX6rufiVE=; b=icZPxlYip+117dlhDoq0jyXWSe
 o+4Bku6jz7VXxySadEy/MHe3kF+rr94o+H2a30UfbGusbM4ZfGoMh9Zmxvm+oYBOVY7gA8bHcQLIM
 K7sPG+9zTYntEd9YeVXVoxMNsh9ee0C8TN2HQID4fcnntKusVjuDPxiHgPJYPw6cCqOE=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iAfiu-00011d-I8; Wed, 18 Sep 2019 19:34:45 +0000
Message-ID: <2ae2122f66e0daa1033851ef89f247c6cc687043.camel@samba.org>
Subject: Re: Sites and services and queries for SRV records ...
To: Richard Sharpe <realrichardsharpe@gmail.com>, samba-technical
 <samba-technical@lists.samba.org>
Date: Thu, 19 Sep 2019 07:34:38 +1200
In-Reply-To: <CACyXjPxh=feYNk3o=DWxQN5xc4s8T5NNffoi_boTck1N39Rx8w@mail.gmail.com>
References: <CACyXjPxh=feYNk3o=DWxQN5xc4s8T5NNffoi_boTck1N39Rx8w@mail.gmail.com>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2019-09-18 at 12:18 -0700, Richard Sharpe via samba-technical
wrote:
> Hi folks,
> 
> I thought, perhaps naively, that if an organization is using sites
> and
> services, and you do a query for SRV records from Site A for
> _ldap._tcp.<realm> that the Windows DNS servers would return the SRV
> records ordered with those for Site A first.
> 
> Is there more that you have to do to ensure that? What I am seeing
> looks like standard random round-robin order.

There are SRV records under the site for this purpose, the idea is that
clients should try finding a DC there first.

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba





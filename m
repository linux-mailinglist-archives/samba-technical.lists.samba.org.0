Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9FB182762
	for <lists+samba-technical@lfdr.de>; Thu, 12 Mar 2020 04:18:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=HPirIpIK1Y3A3NDO954+t9AKxj2tzyQ2zFDmrcW6/0s=; b=GTaXT3GtwgalyqB/Styj/35Vij
	6HJaBClvTzxq66XkVAfdgI48WiF2ZsMb/hsD2kQDzvD5YE12OetlUn3VFN4VcM25kGc6+b5AEhgFk
	bFadN7kon5kTPO327blT5BjTq3TJnUsHq5i5Aa0lH35H0CABFTWe37RO65z8fvgAd9AMV8+r6f8+F
	Uj50dMsQbWB1nRmlpqI8cadsR/ue5Osnc4W3EP/QJGkrmsUIQ928XJ9q73KR24V4zVDyGcspCGxr4
	uGQtZLYaPXYjjJkOlICmJJ0Pw90h8SK2CJY4obaGrhFeMNwfq52PZkEGWwXaotwhL5gYvaccXXGIQ
	wryFb1Sw==;
Received: from ip6-localhost ([::1]:34022 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jCELw-00FstU-6X; Thu, 12 Mar 2020 03:17:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25390) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jCELq-00FstN-78
 for samba-technical@lists.samba.org; Thu, 12 Mar 2020 03:17:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=HPirIpIK1Y3A3NDO954+t9AKxj2tzyQ2zFDmrcW6/0s=; b=OepVkvzY5Ib3RJd57YQZoZ0ciF
 A3wDXQaza/69Hs9lLbAuvAbF7dindr75VfarMOM6FVuRANbFlXBR2WNtwjhI4vwc3ZQFarp1q4HNP
 g/LGAX/jKYN2MWXazFNt71kK4CFuTJyjL1A9XWBHLEcC88KehckU0+eCrp7Zb0BwKTBrASoP0L664
 JhT0tR/Zk5oCqO+9xj3pCv90YfFR1pNmwNALnSlVqXkZpf0gK0RUJw49NM8RwowhZkEPKB1uApsGO
 i1xr2xzw2lxJ1s6t3dsBsUNpZ0kD1z48gFfgglRy6qjaGaEtHhGCk8brrehc8vblZxXbzImBwqS9U
 zUGdYTSwtD+GLpxsyBkKL6e/xhcdWWOXUWvt925K/JtbW/pRkjQX1C+NQsQud6I3O9STF3ZCKnTS2
 150ATyQFAYcLQHo+2eohgIzWDps8wA4I3zlgDX2zGkh8kOO3Qev9qF+fpa47XHN8YPRP9tM60sLh/
 F6vbLBlHyqjx8H+qhkyedzNH;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jCELo-0000p1-JO; Thu, 12 Mar 2020 03:17:37 +0000
Message-ID: <7999f917f76d922dfd725d185903fdf47e1a7e9b.camel@samba.org>
Subject: Retire Fedora 29 / OpenSUSE 15.0 from CI?
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 asn@samba.org
Date: Thu, 12 Mar 2020 16:17:32 +1300
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

G'Day Andreas and the list,

It bothers me a little that for every Samba change we make we spin up
37 builds on 37 VMs.  It feels a little excessive, and while CI is
awesome when it saves us all time we should also use the earth and
Samba Team's resources carefully.  (Even jobs aimed at the 'free' CI
can be run on our servers if GitLab.com's servers are busy, and the
planet pays either way). 

Therefore I wondered if we should also stop running CI on Fedora 29 and
OpenSUSE 15.0, both of which are now it is EOL upstream?

Both went EOL in Nov/Dec 2019.

In the future I think we should set policy to only CI on (some, subject
to other constraints) supported distributions. 

What do folks think?

Andrew Bartlett
-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT - Expert Open Source
Solutions
https://catalyst.net.nz/services/samba








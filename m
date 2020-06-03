Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D0B1EC874
	for <lists+samba-technical@lfdr.de>; Wed,  3 Jun 2020 06:34:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=fAb/i7rvDh8Tgy3JWkNerbF2lxIy7DpYTqBctKc6itQ=; b=ncVdVyyQ747qnXjTvYmX5V2CNB
	UzqKys8PFoiVA2WbHete1yvTBYHp/5hToPhdjBgo7M2OavHuORzd/22kup2u73rSRqRvlrmC3cksi
	H3Cv923sCHqRjGuLMQqGduueOKz/gAlfT/87LCybX+Uwg5Ig+6scr9Ocy5PrULs6T56G2TtElO9ON
	znMMPr7MUN0m/DKNcmQCDZsC1op8b7AtUIVif71VKFRu5eDE1uctJq0i+nDlnUdFo1GZnFK4aEYww
	jC2bQPg/FhBoyG4twnnlHcnRzygyERjoX0PQm9awTdTuhbAQ0Q6KKePrYHbM/3PhKW8zULGSfoTvB
	8tUmK8wA==;
Received: from localhost ([::1]:41124 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jgL5k-008YHf-TF; Wed, 03 Jun 2020 04:33:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43124) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jgL5f-008YHY-LI
 for samba-technical@lists.samba.org; Wed, 03 Jun 2020 04:33:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=fAb/i7rvDh8Tgy3JWkNerbF2lxIy7DpYTqBctKc6itQ=; b=fvRaC+zuARplWZeoYXQtjdvwJU
 sLZnufKI84tNVlla/VTx3R/HpXfT2AtNdqYk/bfdRgUyWb3wT6WoPgw2Hcg2rNfCOjbYkCDDxfnKl
 e9AGrl8zhHqA99RwYeplPNofwSnfZRKIet4PKMoLhpTv0dsFNNJ5YCP98vIOYZFGAzrYDc48Qjfkc
 pqvRs20rVTzWdcIWSoY+AyTI0NrDapj0J14y/HhiZUm9MDmmxq3HHLiVnxhZOlqz5OQR+jGjfWoAC
 2lrnueo/l3mAM6YFWa5qhXrsF9vyKYcblvBQx3HNk7/b1YR+sikkdIQpVhlOFhE22WoF91+l8fqpb
 TNXlqAnRjEPhLkiTXRSFSbJVZpSDjQrLxk5W74IgLEFIHx7RvBu5o4y6saZf3p0O3t7HvTgI+nQ0f
 b/xVmt67pbSih+xLjFaHc4L3wt8qHb+rjZ9TkE+6+Wc2tr9EsniPpOPT1dK8cODbYhVtJlvUDCuvz
 AbjVCb5bb6E2VA5nd6F+rg2/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jgL5e-0006gk-H6
 for samba-technical@lists.samba.org; Wed, 03 Jun 2020 04:33:23 +0000
Message-ID: <c1d1f0b3ddeaecefce07c39961c5ca992f408bf2.camel@samba.org>
Subject: Remove the "Using Git for Samba Development" wiki page?
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Wed, 03 Jun 2020 16:33:18 +1200
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

With the new "Contribute" page mostly covering the same ground, I
wondered about removing the "Using Git for Samba Development" and
replacing it with a redirect to "Contribute".

Written at a time when Git was new to Samba developers and the
industry, it is showing it's age and I think the 'basic git' elements
are now superseded by better documentation elsewhere.

Similarly, I would now like to slim down the "Samba CI on GitLab" page
to only have details not duplicated elsewhere on the wiki.

In short, I'm trying to reduce some of the conflicting instructions.

Does anybody have any thoughts or objections?

Thanks,

Andrew Bartlett
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba





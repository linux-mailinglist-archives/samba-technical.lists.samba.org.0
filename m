Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E167744E26D
	for <lists+samba-technical@lfdr.de>; Fri, 12 Nov 2021 08:41:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=JsCY03Mp5ve/+omRqils2V/F608P6Aewha668ypZcBU=; b=DtshnWYyajHMkYRZQ/UXBNQUCt
	Y+XBEW0XqQ5Q9otPXGbnhAnr/+8SfkNGRlf8pGwN30keVkFZ0POLHEKxteofpkSEtFALnf5Qqk6H1
	Vr/cEIpnoTssB6xdj6Otk4uYex3cZQNLmAirHNO301G2ySz2Xfx8m+UiqEc2ui6qu928PlFuAjZtd
	VPMzRM/MnAQyZOE09TsqYhlIwBHsHY2IYE4qsxU9a+66S40UQyWWAT1dTPuP4aqNvbUSVpqivbsqq
	8GRBWkvXNf9agOxK3mB8Wy81SEOyiC9dO6AXEtfrfqvUjQ2ara54EHwyuPEonpRYSpwXxR377rw81
	M2E2ydzw==;
Received: from ip6-localhost ([::1]:54534 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mlRAC-000kN1-Ec; Fri, 12 Nov 2021 07:40:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58214) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mlRA1-000kMs-NI
 for samba-technical@lists.samba.org; Fri, 12 Nov 2021 07:39:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=JsCY03Mp5ve/+omRqils2V/F608P6Aewha668ypZcBU=; b=BdKcOac/i5QHlhfn+Rtmijsx8C
 p77reRiDijlhCSr0ugmpaFUEI3Ne8We2JYOVLbWJOup3ITYDFRjm9pa1n/dgladTq2aU8iqLeLuFD
 dvhU88sRU+eUY/d/uGB0FL2y56cEOX/PBSV3cjV8b3NX6Fu7cpfsB9HyP0idPrN0OCM9BY7EuNjJN
 M769GM8wPVonHaqKEuKdgrS70WdMr+SBwS7afImMA/5Fq3iqSBZQsiiPnVZsaaJORiaGXXzXA3ECx
 qvVZHhPgDnsndiNAkfHULtY2HhwI4mgK07kYF/1FfrAUJ6Ah8t27FWx1UOsl9hUWq7TO1vEc1CMSY
 fA8AYTukAPIH/YaJoQLQqjzhNRtO8ZhpfKp2lKQWtuoVQATTvZaWwtRZw+z4FWKCJQ9TMeVnDYp1h
 Bh6LkXuSpoKl0vNa7NlBFMilB5Vs47W9MGjx98XwBt25feaDvYvt+eO4yKyjrLZ4OzbaGvaMo7V/B
 XQVZ+E6KCspgBj2YMuJghSUH;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mlR9z-006oEn-7n
 for samba-technical@lists.samba.org; Fri, 12 Nov 2021 07:39:43 +0000
Message-ID: <f4f292d60951b18d7be31def569bb6e4c23258ef.camel@samba.org>
Subject: GitLab CI runners rebuilt
To: samba-technical@lists.samba.org
Date: Fri, 12 Nov 2021 20:39:40 +1300
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
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

I've rebuilt the GitLab CI runners and destroyed the old bastion host.

Hopefully nothing will be noticed, but just in case there are different
wobbles over the weekend I figure I should tell folks.

We need to do this every few weeks as the Rackspace images we use get
updated, that keeps the runner start fast and the instances more
secure.

Andrew Bartlett
-- 
Andrew Bartlett (he/him)        https://samba.org/~abartlet/
Samba Team Member (since 2001)  https://samba.org
Samba Developer, Catalyst IT    https://catalyst.net.nz/services/samba




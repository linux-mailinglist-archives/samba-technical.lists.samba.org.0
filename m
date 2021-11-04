Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BFF445161
	for <lists+samba-technical@lfdr.de>; Thu,  4 Nov 2021 10:56:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=jpEwq6h0pf3Q+ORww6umvRp+B5uyDCebv3Lab2UqtOo=; b=e+owSqlr444BNadGWDzIvSknA8
	T7JSVJnEca0t9G5bgYbIzUNmUSDiwcmGrEiPhBSJ2J9iDRxOccriAVMeM8i3pB+gqCL5cYZlQ2IPK
	iFa++P+YwqqEI68Iyl/MRulLGDu3hmkZFivP4/n0FJE+si33NHTRB8484tlVGwXsXhq8vArXyU2Qd
	NklrO4fegVeX8GX8EuEaOuXWho6HylcQU0Ozb7qw0RCae5LqQ23IaPH3zpxWrMERJW+uLT0oHFT8S
	+cAsIL/Jb9EFax/osZnKUWVZuMnuyawBtRqWbIAOtx20pcQO4wnSSFC/Tcfs5Dm2zahobMV5yFA+/
	768Fr+sw==;
Received: from ip6-localhost ([::1]:48530 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1miZTb-006tkA-V2; Thu, 04 Nov 2021 09:56:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57394) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1miZTJ-006tjB-Rv; Thu, 04 Nov 2021 09:55:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=jpEwq6h0pf3Q+ORww6umvRp+B5uyDCebv3Lab2UqtOo=; b=fgm6fKdAe+h01pikbtb65IQaAx
 90XQps6QD/NtN4viegvya0FiLe4eGSvbuHm0RDV1tPE1OR7LSWig9uIebKV15M9xwtO9ndhYLurDi
 y4vUyrz6WjIBMgeiF50XMhJhF8WOcMHAE7KlOGfjEEAaPJzMi79sacQYg3okBDfvg0kkuD+DcdSWv
 JK55BWTLJE0WcKnH5T6rRij1tdkoe/mtiLxda5wuHPtTy8U2mbPSKm6zsAVXylg4Gegd5juHwoMdI
 JuXGzlQ1Jk1I83JiBzFtNUL3/qUUyM5tqVTRMRANxaRdEl1gqPU2KL4Xpo08uL3ZLGfumhzkobtR5
 yoVfxgodzrSZS5iOX5STw8oDlleS4ebpyXSShrWOYo0+S6A3vP/t+YckQgCvhcRpiQJK3lV4+ef5u
 VuJOzavDcbij6o/jIORVAvD8SptFbOBmAXcAsT6xpOs7QfJQ3EM5Y4zSiCYP7ir89Z09TL5y1IYKg
 62cnaYmeAwbuTpNWc705ecvm;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1miZTH-00574k-U9; Thu, 04 Nov 2021 09:55:49 +0000
Message-ID: <654d3e50d01a29a8e67a3a188e2b3e10aa4f3f1b.camel@samba.org>
Subject: Upcoming Samba security release
To: samba-announce@lists.samba.org
Date: Thu, 04 Nov 2021 22:55:43 +1300
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
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
Cc: samba@lists.samba.org, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

this is a heads-up that there will be Samba security updates
on Tuesday, November 9. Please make sure that your Samba servers
will be updated immediately after the release!

Impacted components:

* AD DC (CVSS 8.8, high)
* AD Domain member (CVSS 8.1, high)
* File server (CVSS 4.8 medium)

Cheers,

Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions



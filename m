Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D43908554D7
	for <lists+samba-technical@lfdr.de>; Wed, 14 Feb 2024 22:33:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=WqtGkIh27LJbw27gOisqs9qpX9M/izDxmf5p0xAI2+E=; b=u/AU5KUgeTYAqYA3KwQVJUgtNO
	h7tKoAzzRiUNHqm2sxv9hD6m1KGqe67IGiDC85gUSdGyGT/6UPfwpXHpnBEwD57SwX4kofVkbvKzE
	X7iHjpvn2/vwI8mxXlSVKutbw4TfdOI04NcYQLNntFXSGxAvev1t7VwIbAIZR3wg4TZGigCkzMZeL
	P7wfT6k3Tct6aivsunJoFD9Dxe4BPx9zMk+Lm9ec4bxHSt6rpPpBxJYldLismr/t0jAo1CSyYvklD
	meqXs0whZpC1VVFLSrtJjwt2B4NZMOaa5HQgOCt3Z3oM4L2E4pudXEI2n4dMF9sXeIjtc9K4Ojg5I
	Or50O/Hw==;
Received: from ip6-localhost ([::1]:23922 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1raMsV-008WC4-FI; Wed, 14 Feb 2024 21:33:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57902) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1raMsQ-008WBx-Pp
 for samba-technical@lists.samba.org; Wed, 14 Feb 2024 21:33:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=AYOThFI/Hv94KRckHg3jRN+R8iDIyypUlPmOmZpyD/Q=; b=AK5D6Nxp3QiMVBnXUx0+6V9ruO
 zXCOnMToBwaTVWXnoMFTEpEwnVl8u+W7RfoeVJFg4u8vxPf7dfwI1Uc+VydsB/RwuooYl1d4iTk1B
 wSUJc6QtwH9qSRni4rKzpCfZMVlQjwYlghWu8HjLENJl35oHzYR5BM149k6qRGF5S2Z2sY2ZOtomC
 hBqfEg1TLYQt52Fk9GMHdkarfs701CCKzTUeSlSmph3dIMRjmrSMyVv/bRHpxKa9uAtjsQ9uReNaU
 ddC5szyX9I5Uixn0WeGS5wBrqk5GuomzBUgtfXltmRYohfybfR8WoLXcXs1MWeVWgU+I6rVAgqnsD
 9ucIRhBMfFGDSxXcysPs1lWrU28agmkwmtnfVulKB2+dE80ZzK+xmaRB3TSd/34dzx7cnHdmdvfiy
 t8yT/CRp22Bu7b4om2q0g20OSJ3YIVIdEI0J6H3cWqGz3A4jTef5UL9ZCKk6e8+LQlSVcWMcAfskL
 0aKv8wchjRRGriwDzy0anRle;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1raMsO-00D5r9-2X; Wed, 14 Feb 2024 21:33:09 +0000
Message-ID: <5cb9a079ca40e8a02e83fbdbb3bba0159ce2c4d4.camel@samba.org>
Subject: Why the MIT KDC is marked 'not supported'
To: Alexander Bokovoy <ab@samba.org>, Michael Tokarev <mjt@tls.msk.ru>
Date: Thu, 15 Feb 2024 10:33:05 +1300
In-Reply-To: <Zc0LAN08B3wPY8pr@toolbox>
References: <7fb8e63cdc9de2c284cffc792c458df3b017c392.camel@samba.org>
 <2272182.vFx2qVVIhK@magrathea>
 <28b2669c5d1834b15eddbfcda3c976a83def8b92.camel@samba.org>
 <16f5f6dd-cc2e-44e5-acb9-9308768a3e1d@tls.msk.ru>
 <C44D3455-ED69-4750-8E67-6B140B582934@samba.org>
 <372bd541-decd-4c1e-abf2-940833c4cfc9@tls.msk.ru>
 <Zcz2oHdkRyYgJK6E@toolbox>
 <dc921798-03f9-4045-957a-dadedc51993f@tls.msk.ru>
 <Zc0LAN08B3wPY8pr@toolbox>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
Cc: Andreas Schneider <asn@samba.org>,
 Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2024-02-14 at 20:48 +0200, Alexander Bokovoy wrote:
> I think that statement of 'not supported' added more damage than
> helped.

The reason the MIT KDC was marked by
07c49d25cdca605bd84294603713d51f913a7ed2 as not-supported is because of
these things:
 - very strange bugs (computer GPOs not working), now long-gone, but
that just couldn't be explained and which were not getting worked on
 - an MIT specific security that was not getting worked on at the time 
https://www.samba.org/samba/security/CVE-2018-16853.html https://bugzil
la.samba.org/show_bug.cgi?id=13571
 - No viable path to delivering security fixes for new AD KDC security
issues when the require matching changes in the MIT KDC

The latter is a remaining blocker.  We have no viable way to deploy a
security update that requires changes in the MIT KDC.  
As an example, CVE-2022-37967 (KrbtgtFullPacSignature) was published by
us in November 2022 but the commit to require MIT 1.21 and so close
that hole for users was in July 2023.
I hope this clarifies the situation,

Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead                https://catalyst.net.nz/services/samba
Catalyst.Net Ltd


Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company

Samba Development and Support: https://catalyst.net.nz/services/samba

Catalyst IT - Expert Open Source Solutions




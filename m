Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D6360E646
	for <lists+samba-technical@lfdr.de>; Wed, 26 Oct 2022 19:16:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=G1o43gI9mJMGJSZNjwg6OxABdDhq7SPBN66ggDYmFw4=; b=RT3AYg8c+kcSyv9bvX9kqwKr9s
	LdHTJa4hdjUoBuYRqdBagh2doxhjCPM4qpDYN/xtYBD1Pfu/YrtbotPWJ30/sSFU2RVs8z6AxiGqt
	Icvkw59VtEXIvELTd33xf55RpF/s3fT6E05S6q7RCjt5OxkYLVvlDhZ9wSZ+uCivpHFZjyShOOpA7
	2Q1cNe76PysY9rW5oMLT6NoBScev7h+wYWyHarALAeVWDfmOcqP5Az8bTnYeTO8aUmNEpUXKuExNZ
	7vgxmBqPg90JUKyJ9Ge3kVo9pwutHe2vERL6MAEXCkx7AUXaO4CsuyR7uKwmekNEy5Ifp6f5YWtal
	PONv1vYg==;
Received: from ip6-localhost ([::1]:44788 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1onk0u-006HNi-4U; Wed, 26 Oct 2022 17:16:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:19634) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1onk0p-006HNZ-TD
 for samba-technical@lists.samba.org; Wed, 26 Oct 2022 17:16:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=Y2UM0MbWI82UTqeUlr30GNA0h/qicTuDUI3L4TaYtCU=; b=kp7dGZX5/1HuPS8yevx8tC+A12
 G3Yp7wS55z7p3Afkaes6UErtDGqWJ3Q2Z8ud8h7ftBFSmP09BrPDwJtg5YvopypwFrr9Pbte7D7dc
 x6IQq/sTKH0HrLdvphqBM3LIfvn1lc07O39uCFM32JteYHvGvLWuw9TWjGY/hbKseFuxT21Va8Os7
 lIWBsRIDvV0G7BHKdEYS3gjuKb7lQEE37dA04Akdor+xYidpoUw5O+YjwNl5XjqRBInj9WgOZeDkG
 lTd3syriFdnvw5FVUq7mrIZV2WBf4RYUlzxVCIDl+s41xfkHnALMKxXATAr+YH+/V3+0DgWgMogAZ
 Kx2tf4f9ZHMOy3GRpOst0lb4lpy/MXy0B8Dx9PoSbsVFsb7WbNlqajuw1GalAwRadPXYxdtDUTwJs
 ia7wxye2u/BFkjJ8soH/mGuA0avpkPzT6sw4sVgeqWdt41SdAeBEPqcvzQKzRmKEDahr3+S7JwxAQ
 vItICDSO2wp1q63RPUd262ep;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1onk0o-005uKt-3m; Wed, 26 Oct 2022 17:16:19 +0000
Message-ID: <d386ec21bdb1093cfd871645c4d1f4080ae24a01.camel@samba.org>
Subject: Re: Could we move to GnuTLS 3.6.13 minimum and Ubuntu 22.04 as our
 primary testing distribution?
To: Andreas Schneider <asn@samba.org>, Upstream Samba Technical Mailing list
 <samba-technical@lists.samba.org>
Date: Thu, 27 Oct 2022 06:16:12 +1300
In-Reply-To: <3206570.44csPzL39Z@magrathea>
References: <fb434777e5cf9c369de54b4c47b894c162ce91b6.camel@samba.org>
 <db0531ab8158841c10ddbc9d6b9ff031c88f8860.camel@samba.org>
 <3206570.44csPzL39Z@magrathea>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2022-10-26 at 15:32 +0200, Andreas Schneider wrote:
> On Monday, 24 October 2022 23:27:44 CEST Andrew Bartlett via samba-
> technical wrote:
> > (Corrected subject, I realised we couldn't go GnuTLS 3.7 and don't
> > needto so far)
> 
> I think you have to ask metze when he has the time to update sn-devel 
> :-)

Sure, but I wanted to get any other objections first, to avoid asking
for things that are not needed.
Likewise there is work needed to rebuild the CI host to boot 22.04
worker images, which should ideally run the same kernel as sn-devel,
but I can handle that.
Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/Samba Team Member (since 2001) https://samba.orgSamba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba
Samba Development and Support, Catalyst IT - Expert Open SourceSolutions

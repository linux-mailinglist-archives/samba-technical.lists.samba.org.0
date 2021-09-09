Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1524043D2
	for <lists+samba-technical@lfdr.de>; Thu,  9 Sep 2021 05:03:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=MwNOI2TIRuW0qIG0xvZzRFzlELZwHQKED2E3jIk9W2o=; b=MKxzFQMRSSDeyAyGEnFkbF/1mU
	C1K2xlhzY4RosVHbc0xSyc+XkVF2b3oCXmzVnR8PzlCE7rssb5P4eHbPW1IaZlIB98T6n+dhtktHn
	hjisx18LhVxp3QX3R+/nGxnCBQ5r70WYgGQQ/30KlBo/30hD0mgL8nwaN1fQiv2eR2gqie1BxFUp7
	BneKiKPkxmjFgPjd/kWTzV6bfP/98FNly0sVfzBvfNPQdGkLuVns42Fg8lmPMyp+6xxrFnpiIH2qL
	McxvPKHobhXmj8+6WbWblf/5qlqf6xyxD42KMM7VVwUvxOgKNlsjYIk/VA96xc3KJLG5GWYppzHU/
	aOn86mIg==;
Received: from ip6-localhost ([::1]:55818 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mOAKk-00DxSa-MW; Thu, 09 Sep 2021 03:02:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10014) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mOAKe-00DxSQ-QM
 for samba-technical@lists.samba.org; Thu, 09 Sep 2021 03:02:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=MwNOI2TIRuW0qIG0xvZzRFzlELZwHQKED2E3jIk9W2o=; b=p8bKNHqumaodNgUTs3ntBLvBVu
 h4BgnFgppW/iwAiAyivQng0NTuXZCjNJ0uJMcX5x9gz1gmrW6ZmPgPMKSw0qF/h8veE1z+eU2Ggnn
 KtIVfkbFgO3p7Rv8Bw9gDIqclFJzBcVEn1x3IlRot5pLttVBFuWlQnrMDqYez68kLe2A+gW27kq8V
 UWHNGMG2SieEI7ucMhVqxxk8N3Xm9ZAYX25bAAb8hmenZeSDDqAXToDKSvW5L77Ks6PNhAAdf21go
 eeATGahSINMipSz9UPpLeqVuluOKBVOieuf9nxJjwpaP13kSnOQRVQqYsL1BDN0bbcW6rf7jPfpBU
 yzgE5jiAtx2Q5J31U2DpKkMF6CcXGpLWDaYLaNIc7cRdh95dP/rIrzgyfuOJgLP392m1sjPTRPqRb
 JswqDTStc6hL/KevgaKr0/9PXCEWpnfFVKkwiiUXefvsOuCOL0Gc9LmdSLyAp09tsWgo9CN/bWQsJ
 5rm5FAGclWYqwUZg6xI18kii;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mOAKd-005JqS-3J; Thu, 09 Sep 2021 03:02:31 +0000
Message-ID: <234c2471b64eb5a311dddea3a61951fbd11beaf5.camel@samba.org>
Subject: Re: Is Samba's compile_commands.json useful?
To: Martin Schwenke <martin@meltin.net>, Samba Technical
 <samba-technical@lists.samba.org>
Date: Thu, 09 Sep 2021 15:02:27 +1200
In-Reply-To: <20210909122517.5bc193cb@martins.ozlabs.org>
References: <20210909122517.5bc193cb@martins.ozlabs.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2021-09-09 at 12:25 +1000, Martin Schwenke via samba-technical
wrote:
> 
> I'm trying to understand how the automatically generated
> 
> compile_commands.json can be useful without all of these options.
> 
> 
> 
> What am I missing?
> 
> 
> 
> Thanks...
> 

On the other hand, has this perhaps regressed with the recent waf
upgrade and changes?  Perhaps try some older versions and check?  If
so, then we probably need a fix and a test to keep it fixed.

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions







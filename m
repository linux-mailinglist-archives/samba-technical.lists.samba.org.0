Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5438B83CD
	for <lists+samba-technical@lfdr.de>; Wed,  1 May 2024 02:43:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=k26Ip9+F5Liqxk/y8ETmVzslscdj4zAewlpE+UG/HYE=; b=kHAtjzUHqZKy2Dat+uUHB6THQi
	Jj681+x7P6Uny/u9FaIV+x9tY21JzY1kHfc9Mhs+9Pma2rnTiDfMuWUbvp/Yb0KpWJn2RD9yW20UX
	5VteuO0OlzgiHEYQoYWcy0ezlvDQ23Uy+f7ysKkJzkM56VLoIWCbyXdfMX/G/wlqIMrovpBSKBEX/
	lWM7eKiiefKm9w4hEXzt2jKIMTyYIQTll0PRe4VLrbZkfKJzoMjIyu7Hy2ITgg5hrjrSGx/xUZQr/
	ejE1XY8Lhspjg+e48x3eKjx0K/h9etic+XZjX8VsVhC6F56acWwTF6JpdtLDAf+MhcasPE4eEqDV2
	p+CjdVHA==;
Received: from ip6-localhost ([::1]:51936 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s1y3p-007vjm-Cs; Wed, 01 May 2024 00:43:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36474) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s1y3i-007vje-NT
 for samba-technical@lists.samba.org; Wed, 01 May 2024 00:42:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=XWOTksgB71B8JlbPqKp2G58q/RkzUi/oQNlrXRvy7Hk=; b=J3lW+FTFP9YgJGTRObieIxCtgQ
 94Fx+yzE3Q03CV8cxUtX+CgyJPNoWadxtTaRzlEj9OzQnszlhqa/qibQfEroRteY5pti/ASpHqzey
 OemRIlCAqy8ewaXlmDwcz8yYRI9hmJD4o3TfOB2azT7x3b1BM507tqW0CjTMVuJ6uYBG+4wXcYrxF
 xNAG53H5g/tpH0oKXTZON8smo7RDVOE/XYbdNfmVq4mt+eR2BRc6QgYe0q2EaYGMOEayOD2Y1SH/Q
 uECT2TbNciwTjl4E2Hdo+nS4u9quE+qlfLPUl/cJJs1qGclgLxa14JDoai/sLO8voUHPc8OMmSMpL
 6PMwIfMtznSypn4xgtYlBpTzxtPFX1pSFr+Bv8AkO6oyb+CYpGfO3sWFvELzfkRpQgp1GCO2fmW9Z
 WD4MFQUABOWvgGN7D1oGPsbZPHqzvPlsal/ZThhJeeRkF5EEgylEjgf+nBfuUlLpiOGNUXE677dSG
 eoaduWE2K+s7FqY6IztlEmXF;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s1y3h-009CZ5-0x; Wed, 01 May 2024 00:42:53 +0000
Message-ID: <594a2d2acd1adc9fe9a14214d1f9acdd9548b422.camel@samba.org>
Subject: Re: Fwd: Regression: ldb performance with indexes
To: Andreas Schneider <asn@samba.org>, =?ISO-8859-1?Q?Andr=E9as?= LEROUX
 <aleroux@tranquil.it>, samba-technical@lists.samba.org
Date: Wed, 01 May 2024 12:42:48 +1200
In-Reply-To: <2680239.lGaqSPkdTl@magrathea>
References: <4856178.OV4Wx5bFTl@magrathea>
 <b7669c93-fb36-4949-bea0-c295836ebd27@tranquil.it>
 <f09a03b8f405c2cc9a2e97df5576a927eb823cdd.camel@samba.org>
 <2680239.lGaqSPkdTl@magrathea>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: yalemu@tranquil.it, Denis CARDON <dcardon@tranquil.it>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2024-04-17 at 15:53 +0200, Andreas Schneider wrote:
> On Friday, 22 March 2024 21:35:27 GMT+2 Andrew Bartlett via samba-
> technical wrote:
> > Firstly, these are very impressive improvements.
> 
> Hi Andréas,
> I agree, this is great work. 
> > Thanks so much for your work debugging this and getting to the root
> > ofthe problem, this is very much appreciated.Do you have any data
> > on how much of the improvement is due to ldbpatch, and how much is
> > due to each of the other patches?
> > Did you happen to use Brendan Greg's FlameGraph tool for the
> > debugging(this is what we often use), and if so, can you share the
> > graphs?  Iwant to understand if perhaps we need to consider
> > restructuring thecaller.
> > https://www.brendangregg.com/FlameGraphs/cpuflamegraphs.html#Instructions
> > 
> > For this series if you could please: - send in a send in a Samba
> > Developer Declaration per
> > https://www.samba.org/samba/devel/copyright-policy.html
> >  - create a gitlab account - let me know the username
> > Once I give you access to the devel repo, so you can run the
> > fulltestsuite under our quota, please follow our contribution steps
> > here:
> > https://wiki.samba.org/index.php/Contribute#Subsequent_Merge_Requests_(and_c
> > omplex_first_requests)
> 
> I didn't see a merge request so far? Any update on that?

Andréas,
Thanks for creating a GitLab account and following up on our paperwork.
I can see your MR for the tdb_find patches, but it would be awesome if
you could raise one for the LDB in-memory-TDB change also. 

In the meantime Douglas is running a performance test on our test
server to confirm things, but it would be great to move this along so
our users can benefit.

Make sure to include your Signed-off-by and 

BUG: 
https://bugzilla.samba.org/show_bug.cgi?id=15590 id="-x-evo-selection-start-marker">
Thanks,
Andrew Bartlett

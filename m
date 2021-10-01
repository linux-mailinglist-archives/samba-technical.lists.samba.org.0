Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A4A41F44C
	for <lists+samba-technical@lfdr.de>; Fri,  1 Oct 2021 20:03:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=P/mrA4aLjTMkMhw3cvyKfCfGU+pRXCj/qIXbTlByPkU=; b=zZNZyPvrXFf2KCyK7uszBhXgya
	eo3znsmi8hRv/dxUNW3JR7WwHCXUo6blIOelG0EmFNy6r1TRF5Ek6tKE//HETssTa6Mlz2L6UqPd1
	hN2MvrQDNRTUqAAbiKZQ+q0/Cb58oljlwimwMlbW0x7JMXvXFctj2nX9BXrijNGBt1s29u39QWhum
	Z3CFCZ9DzdnViX4zp2sdn/kmqlHlQqg1qwVdowEWCcwEbuyJkyoYuNxaa2UNc9zs8lNY/2N1YCkIv
	i/+Cn74arCHWkyMwcmJNoeCWiTbyc7f7c920a8TA0EV2oFXrjjFP6ZGfS+lycsnVgeeXK77yNFxgO
	WqTN+g4g==;
Received: from ip6-localhost ([::1]:27350 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mWMrz-003Mt3-RI; Fri, 01 Oct 2021 18:02:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40974) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mWMru-003Msu-FJ
 for samba-technical@lists.samba.org; Fri, 01 Oct 2021 18:02:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=P/mrA4aLjTMkMhw3cvyKfCfGU+pRXCj/qIXbTlByPkU=; b=Ntxx1f4C9oS5MHUMTDEqdvReSZ
 NJSAEa2fHfmDfEr1HkPMuwH6mnerE5N5Bdwk3yCuJGg+/JyXOKJxD4u0xMlcfASc3IXNbSK5/Q5zx
 D5A73OymXIVQXJcJQg27qgvo1ilPq4FMz/dRq1USz4MNIMstUMk//TkFVL7Mmu5pFy61IpWLkiE7Z
 MnbJx9PDjt3U4WcjLbEtLcl15XNb1aAHP+NR9oO+jx4VFps2lrPD1s5A19iwVA9xPotrPMsHSrBYr
 rY37qovjbAWuGSd5jvCpx0Ynz9+OKpiYCm3SoqkFMRH9sFtX9EXGlus68kKDjWkhVSKZLYe8z+nCb
 IL27SocT9JqAMgOz24qfnrEhdJDfwem9AD6p1xt6M2kTnqjHoZkA2GVuVML3oKDCwwkfcRRaxY+Ky
 JiECjLp0wdKDEZZ3wfvoQuiJ4K7g9p4p5flQaLIzaDa4oA2+KYwUCTjY2ONL0PPKCV6VtFrrZ4o9x
 9fEfTYOhosQf2XWkpBzTIodc;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mWMrs-0016OE-He
 for samba-technical@lists.samba.org; Fri, 01 Oct 2021 18:02:45 +0000
Message-ID: <b5c58afe933683be74b8c1509e697ea319024c07.camel@samba.org>
Subject: "RN: " syntax for the automated WHATSNEW generation
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Sat, 02 Oct 2021 07:02:36 +1300
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

I was just asking a new contributor to prepare a patch for backporting,
and realised I don't know exactly the new RN: syntax.  Is it strictly
one line (which might go on for a bit) or multi-line, and what is the
guidance etc?

Can someone who knows the exact syntax and what should be in the note
please document the

RN: ....

syntax for the wiki:

https://wiki.samba.org/index.php/Samba_Release_Planning#Release_Branch_Checkin_Procedure

Thanks!

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions



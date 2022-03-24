Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7284E5ED5
	for <lists+samba-technical@lfdr.de>; Thu, 24 Mar 2022 07:41:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=bvnyEhZBgrvFAUu+HGk6ytL4qWpcslsJOHMPdsm0xJ8=; b=bW1aj7/ZVu2YEdJLjdxRIPoCB7
	2/WUFF7ZBdfbhZgEHRJzOGHruiAyr1CdYHqy4oKHS1gBKcAKG/jLu9MvunZAAwxPH+2HGK+4LEtnJ
	SyWcgFMq1+IigLrqaeh0R2eCpKfu1kRtYk7wDPXj14grg87MRM4SbU09U1+C8VnUbduRrZZsdLjpn
	bspmTbv72dLdu4CXiz+1Ln9kF4Ki3EZGdOWS+uI8i0vprZ8I26PZ6t80DbH7Jn0xjqQlUEHopriUt
	o2Sh3YRrjmr6HhpBDoRrNQVPyT7qeypSWHhwUJiYUWeqy/8TVV2vCIvHrba8wtsuxHE0oS4CCmYpR
	n85jJ6Bg==;
Received: from ip6-localhost ([::1]:22024 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nXH91-004kS3-3T; Thu, 24 Mar 2022 06:40:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37818) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nXH8c-004kRt-11
 for samba-technical@lists.samba.org; Thu, 24 Mar 2022 06:40:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=bvnyEhZBgrvFAUu+HGk6ytL4qWpcslsJOHMPdsm0xJ8=; b=yHqTsOEcvGdoPoURb8fTz7vGLK
 oLrNtZBJjMsxjGTwx3TGlrBLT6gcwThsWFaJ03ZljJaFo427OwawaHltMvHgdYrEk4CK1npi/pxk1
 fe64WcWE4eRsdvL5HgRdmkgWJuW7IB1r3KsKAtSKnAOJ1v9uCjwJeKU71WRuSRGGJfajQ+pa7mf3J
 MEUZTKUskhTEKqDWQwH0PflF/TgowdJNhZ1wU4ZVpMjm6hBulj9F9rkIxfUgXof3GxkZRqGcYkY04
 L2AS2SP54koNEKnVSbwQa1qkqtbdmoHue/PHg/uoVrJvNrb06gLrHct/EVGK+77oaHY2s1Ho8vxXN
 mLRZNlF+QKdwyz/fFEwMkFqLPsKLVThhTGJo5wJFRuclzzkwM0fwGNJihzGgsr2mxR9TYGLznMYok
 bY2p0NsnODjQMWtemyZ5TI+vrXCZkhZUhLlD7AnVHEBGqeIlyy3JEv4n9waLvh7rZB5CUvlrLmX1j
 Byi6A2j420ZEzYDb9P4/ARap;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nXH8Y-003Bsd-0M
 for samba-technical@lists.samba.org; Thu, 24 Mar 2022 06:39:58 +0000
Message-ID: <798cdbdcc5bb1f59af4d9c7353a569dbb55036d8.camel@samba.org>
Subject: Re: getpwuid(13891) failed Failed to finalize nt token
To: samba-technical@lists.samba.org
Date: Thu, 24 Mar 2022 06:39:56 +0000
In-Reply-To: <HE1PR06MB31486C485C9614D48D1B0FDFEE189@HE1PR06MB3148.eurprd06.prod.outlook.com>
References: <HE1PR06MB314825C38C5FED0EFE6E2B76EE189@HE1PR06MB3148.eurprd06.prod.outlook.com>
 <be695e607739913e530fb1c8a0ccc191ea8eefe0.camel@samba.org>
 <HE1PR06MB31488952C3D608E9374C7FC6EE189@HE1PR06MB3148.eurprd06.prod.outlook.com>
 <007c551a46cbad5f4e8179c156ce647891f519d5.camel@samba.org>
 <HE1PR06MB31486C485C9614D48D1B0FDFEE189@HE1PR06MB3148.eurprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2022-03-23 at 22:35 +0000, capricorn cap via samba-technical
wrote:
> We never got it to working properly. With Security set as Domain.
> Only couple of users were able to browse to their home folders and we
> were getting getuid error so we change the settings to Security ADS
> and I installed krb5-user package but now we are getting prompt to
> enter username and password and even though I enter it I got the same
> error as posted before.

So it has never worked, what were you using previously ? There must
have been something, or you would not be using an EOL Samba version on
an LTS version of Debian that is very close to being EOL.

Rowland




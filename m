Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A40223F55D
	for <lists+samba-technical@lfdr.de>; Sat,  8 Aug 2020 02:04:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=R3vGFQH4AFYc6w8II2syrEUI67rntmuomRlLzF80LUM=; b=QuIcMzlr4Ta3l+D7Ai5tlta2sn
	/4VnEONNiXs0BvnLZZ+qbkZekZXhOcpDPTyIOXh2Th9O9SgIO2XVFAPG67ak1JWT19Nf3mOsyLNk1
	N0TC/WIO2rb4g0sBv6rkxogylV1AkAD7Ft/1nOTK+G7ubJoSitHlEFDH3jQ7jhieZpajkfm8MUBvs
	l/z6Y2lJiWjq+ULWHIpJQL2NbCYdAFFXmJfWwi3zkQMJvJoc+LlUUtopNXL56n9kzYe88aDQrVZtw
	jFRCECGwvyuJH8ayLHZmrhCUtBUtsFNbMOlAowYI4IpBvGuKdukghaahei3xaVPKDRArZx3+0V96V
	bZlIDWTQ==;
Received: from localhost ([::1]:43406 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k4CKd-00CsAh-98; Sat, 08 Aug 2020 00:03:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53510) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k4CKW-00CsAa-64
 for samba-technical@lists.samba.org; Sat, 08 Aug 2020 00:03:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=R3vGFQH4AFYc6w8II2syrEUI67rntmuomRlLzF80LUM=; b=ZOYdT/741EzHKPGGqqPjizkmzW
 m63OeeNI5RbgSXSWLBSsjxqSJvcIRWj5Qp0z0H1chOBKGN+CsaF/0Z3ei9bE2ELVFAz652C7g8/0h
 QTnN7XzuswJT6wREeXvAptI9nb03MosqTJpxig/mtEoC5lsyXnZrm3nEZEKxX1CF+gInnjLrRLmcS
 67SZ0kT1LqjAg0ZLczNpgccz4VrxmTMfSdDP3rRJoRrpecDh8+2XidbQ7LiX9mCrr78phMxB0ID6D
 DIPyHICVGVP1YjIJaZcX3LGItbFwEdu0t9WTRHALpTDjam3modWrdj725O3xiNq3t6Asu66TnyaSa
 YN345N3o9vyZ0SDKC15YUMRlu1SGs/xn8p8oA9/r+S71fSy45+8s4jef2gPgpusZl5O1xBlrduggq
 ebqowb42mdqa6x0uu3UyA5pgrUAz3fckPb9ZoD8fehPEifXNVGNYHHc+UD/k7G7n01eiBcyb5hi7/
 reGbVVYRORBV+JdrfxNZ6V64;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k4CKR-0000pL-5o; Sat, 08 Aug 2020 00:03:15 +0000
Date: Fri, 7 Aug 2020 17:03:10 -0700
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Deprecate SMBv1 options and NT4-like domains for Samba 4.13?
Message-ID: <20200808000310.GD6256@jeremy-acer>
References: <efd53968d989fa5b909d5b23df58b171410970db.camel@samba.org>
 <20200729190254.GA10865@jeremy-acer>
 <b9b6de10f01ad24305ade2a88f3581acec937f8b.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9b6de10f01ad24305ade2a88f3581acec937f8b.camel@samba.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, Aug 08, 2020 at 10:42:38AM +1200, Andrew Bartlett wrote:
> On Wed, 2020-07-29 at 12:02 -0700, Jeremy Allison via samba-technical
> wrote:
> > On Wed, Jul 01, 2020 at 03:19:19PM +1200, Andrew Bartlett via samba-
> > technical wrote:
> 
> > > So I present to you this MR:
> > > 
> > > https://gitlab.com/samba-team/samba/-/merge_requests/1398
> 
> > > Parameter
> > > Name                     Description                Default
> > > --------------                     -----------                -----
> > > -
> > > domain logons                      Deprecated                 no
> > > raw NTLMv2 auth                    Deprecated                 no
> > > client plaintext auth              Deprecated                 no
> > > client NTLMv2 auth                 Deprecated                 yes
> > > client lanman auth                 Deprecated                 no
> > > client use spnego                  Deprecated                 yes
> > > 
> > > If I get time I also hope to fold the only-used-by-attackers LMv2
> > > into
> > > "raw NTLMv2 auth", so we can remove both in 4.14.
> > 
> > Sorry for the delay, just catching up on old stuff
> > in my inbox :-).
> > 
> > That looks good to me ! It's really good to start
> > marking obsolete stuff as, well, obsolete :-).
> > 
> > Anyone else got comments ?
> 
> Can I get some further consensus here?  I would really like to merge my
> branch once I add the last required test, but I don't want to blindside
> anyone.

+1 from me, but hopefully others will comment here too !


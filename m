Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1652942DF
	for <lists+samba-technical@lfdr.de>; Tue, 20 Oct 2020 21:17:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=IdzaiqfA1Wgk0vo1uhWrhqyXO6Y4NH5WBIYNHll0ay4=; b=aVwNgQOxgFB32uaQKCO01/OqU1
	/WxzExbBrdJCO3eeXqhY2jaxwizoZfWTILeSkcAFgCzT89p80chW0A4JtIHEJnWttNDIs98RjOSI4
	Q6oq63khJF8AnvYT24667MOQdLcJx2Sqn0KHLNpdfchXh0SVEF5QKOJFLtRFcutXOrb/LN6qhQHQ8
	oVgQozUyUZfONDXWVkNaGjl8GCWYIcz6hc4q9SPMYC2U1AId6TIxtNA1S0l2GZp1pnP7y8PEP9Ln0
	/Hl8VMNH4maVrJl/d7gPsFnOtdCPtRfcj5HvGXzSiXm1DkwjLyiJ99jBktbWfwjmapfbyO9FXsDyS
	OLhuafTg==;
Received: from ip6-localhost ([::1]:27334 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kUx82-00CwqI-3I; Tue, 20 Oct 2020 19:17:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34628) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUx7y-00CwqB-2l
 for samba-technical@lists.samba.org; Tue, 20 Oct 2020 19:17:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=IdzaiqfA1Wgk0vo1uhWrhqyXO6Y4NH5WBIYNHll0ay4=; b=v9wl4HszKhMD7rvpHXY6O4T9f8
 eFlmWy2Jy7QwW/fZlsEoE3hBEKy/aepFICOpvFIQVGeEUjaHdfXPpT1lLtXVfNitxSMtPnCeZ79hh
 ArU0mFdlsMmFZSLsHQsK9K71kBfWiA5kX7GaWbSkVT1Z11sh9vgHXVK7DprtpZyX0FATbjGSjOMWA
 F0HxubSYE5pkgs8xr3j2m6Z5VflYfTeV0qPeRkogWnqJkxmrVouZDuXewp0BmyAHeO+Yqdn/UVNRl
 Gcs6ckK0PefqD5IYHdawsELGUdoGH6gajXtn59QQwUgQPxhIKX01xE94SP31UlJyxUidG4vVqjiSu
 zk74Nu/UVg2Fm4GfjP77grY48FYmXRMfv8csRNB/cVySKcTLOr9kk9OqbCdefiWUCF4sKyd/qTmIv
 rujDxS/+ywlYEwD9mZgMez7LAE3CUO5DeJdPgkQdSpkSRnCzQsDGrpbe2gRy7EfrWBlL1D7fqgfr7
 cauO+n+tZQ/U6QxH2PbMDggL;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUx7w-0003ko-UA; Tue, 20 Oct 2020 19:16:57 +0000
Date: Tue, 20 Oct 2020 12:16:54 -0700
To: Arran Cudbard-Bell <a.cudbardb@freeradius.org>
Subject: Re: talloc: talloc_set_memlimit causes all reallocs to fail when
 used on pools.   talloc_set_memlimit not enforced correctly on pools.
Message-ID: <20201020191654.GF642265@jeremy-acer>
References: <E2A6FEEF-3C46-43A6-818C-D226924EB9F7@freeradius.org>
 <20201016202528.GF67086@jeremy-acer>
 <E75C5FB4-2800-498A-868B-7F3A3CB4E802@freeradius.org>
 <20201020020246.GB564927@jeremy-acer>
 <20201020035308.GA601524@jeremy-acer>
 <2F0B2708-7AC6-4FF5-99FA-8D4B8F1BAB2E@freeradius.org>
 <20201020055023.GA606244@jeremy-acer>
 <D37CFB0F-61FE-43C4-A161-DB949FF9F175@freeradius.org>
 <20201020183336.GB642265@jeremy-acer>
 <69C11FCA-3EF2-4E1F-9835-5D3FFB80D883@freeradius.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69C11FCA-3EF2-4E1F-9835-5D3FFB80D883@freeradius.org>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Oct 20, 2020 at 01:42:00PM -0500, Arran Cudbard-Bell wrote:
> 
> 
> > On Oct 20, 2020, at 1:33 PM, Jeremy Allison <jra@samba.org> wrote:
> > 
> > On Tue, Oct 20, 2020 at 01:03:14PM -0500, Arran Cudbard-Bell wrote:
> >> 
> >> Then there's another issue with object_count ending
> >> up off by one, which means talloc_free_children doesn't
> >> actually return memory to the pool, and that messes up
> >> some of the other tests I'm adding.  Just tracking down
> >> when and why this happens now.... It might have been a
> >> pre-existing issue and not related to this patch, I'm just
> >> seeing it because of using talloc_free_children to reset
> >> the pool between some tests.
> 
> Apologies, there was a steal I didn't spot in the tests.
> One of the chunks was moved out of the pool into the root ctx.
> 
> Explicitly freeing the chunk or stealing it back into the pool
> means talloc_free_children works as expected.

FYI, once you've gotten everything working can you
send your test cases to me so I can add them into
the regression test suite for talloc ?

Then we'll add a new bug in bugzilla, update the minor library
version number and create a gitlab MR.


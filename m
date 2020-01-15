Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B037913BA44
	for <lists+samba-technical@lfdr.de>; Wed, 15 Jan 2020 08:19:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=rIcxzAjDNhMYdXT6kfqHonmV7Rrd97LW4EVUtPglNPE=; b=eDNFPC79ppD4RYbeGpu3n9fBEx
	XXEKQUOIYeqHzXGvvy+VHAMgUukhoj9vC26jn/utxFHUo5/FXNEZ3Bx1diWC1g6mr14Awa/mw3qtf
	I5MV4SNDUMoLYoRY+qUmKv4zPxbu+xzeAN9tQHjZS+rPB86Meo05OV8J2ahVMjBR6WG++L7fAVuIs
	ydbmDAx24v2V+0Sk5cKcHD1OGom6n17xtqmUIh4lGs4DouwaTLLSSaJ8e66SQ3Fb74Cq0Q/9D+ASH
	w6h8wcYP6LgsMI5rFIff5bE7tv8bhBDsvwjh5DsBHLlE/45OYKJeNdU991DPiK0aKsWnGWITa9IxT
	ymurUUXA==;
Received: from localhost ([::1]:30744 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ircwN-003URR-0t; Wed, 15 Jan 2020 07:18:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48280) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ircw6-003URK-EZ
 for samba-technical@lists.samba.org; Wed, 15 Jan 2020 07:17:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=rIcxzAjDNhMYdXT6kfqHonmV7Rrd97LW4EVUtPglNPE=; b=XcGnqKW9Cmw2Mfc8FBbdj82CeE
 Px3rLkXCfFaM4nBrLR9JzyTymu/4b/Wm6KRD86tOTq0cPCRXbzv8OXly/QLf0zLwrLl5fn2ZI7fWQ
 EQE0zQJfucPBzAq5eShLNH/DbcQdo80rowvjCwD1IMDEo3LSvx8OZXBRKn27IIpXyh2T9Miolkyn8
 /ZIkRs3SBer8fXm0xPF44mlaTNH7G2nSqkcm4lHkPGHYDrIkw0A74LsO2iEWngfXNSTaz5MSd2ZQo
 cZkxGTZavOmp2N0NEpOHgi23C2O50HVmczXEdPfdWb4U3rwjDC06TdgQtNp5M4dikRL3FP/DmMaEH
 O9iUker6IkTdMCDIqV9Dy051n+wRlF4WtJz7bjSiEiEbTyb80bm1+/y7qaADjVXlJBoDSSAyfXFR9
 RQqE11euqilfiLsKEJfK38YSFVs8n/kQjV/llA5VyAUZPbmstSafRdfubKh3X0CctxLhGEHleMVs4
 +tNZzu39M74+1XkpsopX5zGO;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ircw2-0002C8-Bx; Wed, 15 Jan 2020 07:17:50 +0000
To: Jeremy Allison <jra@samba.org>, samba-technical@lists.samba.org
Subject: Re: [EXAMPLE] How to add a source3 fuzz target
Date: Wed, 15 Jan 2020 08:17:49 +0100
Message-ID: <2840624.rQlG0VLy1U@magrathea>
In-Reply-To: <454ccfed-8b35-29e8-e074-0ec8df418def@catalyst.net.nz>
References: <5af970f9-d9e1-5993-f5e0-480139c2ad2e@catalyst.net.nz>
 <20200113213841.GB111855@jra4>
 <454ccfed-8b35-29e8-e074-0ec8df418def@catalyst.net.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wednesday, 15 January 2020 05:02:51 CET Douglas Bagnall via samba-technical 
wrote:
> Right now, in the
> dark corner of a Google cloud data centre, oss-fuzz is thrashing the
> daylights out of bin/fuzz_ndr_icoffeemachine. We might want to revisit that.

Do we even use DCOM at all?

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D




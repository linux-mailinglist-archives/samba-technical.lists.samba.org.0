Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD2CBD852
	for <lists+samba-technical@lfdr.de>; Wed, 25 Sep 2019 08:32:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=SAoerkmoPZDB3qlBqOKRmmr30l5vvkc6yI/OV7sRwcE=; b=YceqM4CQpv6s3pdArag7Tl/fY2
	fRZtqcbdXA3mtno/Pk36fiamwahRVq/z9VpidxN+J7LlM6EmhKQbrEOyeD7r9XD/5SjKEdNJouiSk
	cxzh0rgBrf62tURr0z3YwRP3obcaMF5AJPUzP0/eeKS7g+LKts7yvWQWm130N2W0wBQcMv3LifI9v
	iYkLU69NypVEymF1wGKaJEvcuIZz0LGtgYoE2M5+DenAaoPYZpNRxtYeaj9uhTQ0fPkOLiSHo4FbE
	uiMMNsY185NAD1Vo1PPOXM1Ngr554R9/X5nZJ6WTYwNgOQpJwcfUeQs8yyNl935Y77z6OzoI7l8QH
	Y9GPdnYA==;
Received: from localhost ([::1]:51624 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iD0qc-008QVQ-Gg; Wed, 25 Sep 2019 06:32:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25062) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iD0qP-008QVE-Qv
 for samba-technical@lists.samba.org; Wed, 25 Sep 2019 06:32:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Date:Cc:To:From;
 bh=SAoerkmoPZDB3qlBqOKRmmr30l5vvkc6yI/OV7sRwcE=; b=Z05Ed2np7V9C5uF27/JnTiuiH3
 abfvglUtm/asW8YY1Sq6ejcSWtOonQFjnS0oLkok1HgJibY+dAJyMLzsxyRcZye2t0rj8gPitKXDv
 kxRDkZjNL6HpxJJAcvXogtR0zhmaL8o2T0q3nkm8L0PcILLGm4b9Qd4LNxmFXkhm1Uvw=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iD0qL-0003Xr-5C; Wed, 25 Sep 2019 06:32:05 +0000
To: samba-technical@lists.samba.org, Andrew Bartlett <abartlet@samba.org>
Subject: Re: [PATCH 1/2] s3:tests: Add smbspool_argv_wrapper
Date: Wed, 25 Sep 2019 08:32:04 +0200
Message-ID: <22426626.D4Gb86SXTN@magrathea.fritz.box>
In-Reply-To: <1569390687.4377.132.camel@samba.org>
References: <2aa99e06bac234dd24ad6e2e50762977c0bf51d0.camel@redhat.com>
 <1569390687.4377.132.camel@samba.org>
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
Cc: bmason@redhat.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wednesday, 25 September 2019 07:51:27 CEST Andrew Bartlett via samba-
technical wrote:
> On Tue, 2019-09-24 at 17:37 -0700, Bryan Mason via samba-technical
> 
> wrote:
> > This patch, along with the next one, is intended to catch problems
> > like https://bugzilla.samba.org/show_bug.cgi?id=14128 where CUPS puts
> > a sanitized Device URI in argv[0].  This patch creates a utility to
> > pass the Device URI in argv[0]; the next patch actually uses this
> > utility to perform the test.
> > 
> > Please review and comment.  Thanks.

Thank you very much for working on this!!!

> Thanks for the patches.  Can you please either:
>  - submit them as a merge request to our gitlab repo
>  - attach them to a mail
> 
> Sadly samba-technical is set up in such a way that your patches have
> been munged and credited to the mailing list, not yourself.
> 
> See also our contributing instructions (which need work) and copyright
> policy:
> https://wiki.samba.org/index.php/Contribute
> https://www.samba.org/samba/devel/copyright-policy.html
> 
> Sorry!

Bryan, if you need help let me know. I can create a MR on gitlab for you if 
you send me the patches as attachments.


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D




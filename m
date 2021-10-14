Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B184942CFE2
	for <lists+samba-technical@lfdr.de>; Thu, 14 Oct 2021 03:26:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=0oaX0I/iMYdTFM+wqd5pBP1kJdXY/LjaPBNDnuD9nv4=; b=lB60o8TvY+Or46jJq0tjNfYWEB
	VbE8rnksT1n8ZBRhwRUPvcbTmcCdWqkVbGNldxpjprXvWJRChsd2/34GZWRZJbwrQzP3MKgt4hKpD
	k3L0zniIFLDdO0lKEPhOtyLs3rOve1g2M1AbC826lb53to8+g+XbO7Zn9bZIRpNcn20k4ANA3utPB
	cuINsmg8+OOOMZnc/1eGkryoMHoIGOpppjPG8x30GIEMh8kKNxCLP9T+20DzN+N+Gg7NTpo8YRl5n
	eifZJCJwBDoeCjQZQexYNvYzYZ//MecEGLLgMXr1avgGi8jphhZLVL/xVn1Skbi8Sx5CAbJjc4uZU
	l/nkZnwQ==;
Received: from ip6-localhost ([::1]:59898 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mapV7-007SjE-Jx; Thu, 14 Oct 2021 01:25:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56406) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mapUw-007Sj5-D7
 for samba-technical@lists.samba.org; Thu, 14 Oct 2021 01:25:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=0oaX0I/iMYdTFM+wqd5pBP1kJdXY/LjaPBNDnuD9nv4=; b=lA654jTFzsrgCR9cUUGXfi8ucp
 Gu6vI/9w0etJDMlh9yRN4BjEjAR1z59v30O74T10RLHcD0iFJKrPmT36T+pckPIttMadTGL8LdIKZ
 2Xv3en3WlhZuCqmc82PzdjeOVqHl++9STEokVVGDxg9rIWoIMBqfKU7EX9ThWi2ZTREcVfWmpdil5
 WYPNjKuKMEbR7To7BsstknMrJyifj5/oemFleEUa9jhJS9C88pD46vhetJpjMqyv7Gs+YOaLH/fuI
 Eg0qVC+F62h34d+OO7QlvakmsPWSRWT1fk4lvRSoXpeffgCVAY7201rRy8QbkA2kuLUw+LI20I6mV
 S0UDYMJDVUDnPxVwRZDa8M4xtUvaofWxR03frUPpNj1MzLwfiICkTv7QGzZB9YfCnEwY3Pil1sn3u
 Hvp4Z0vl4YQhfhnQi8NoF8C1s7r2m4VIUny3R4HoTXhvOVGkP44IrqpTn+kLiBUGXKJtxOpo5M+3z
 X9MYJS01CeoQaWasYphCB7W9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mapUv-001FNP-Fc
 for samba-technical@lists.samba.org; Thu, 14 Oct 2021 01:25:30 +0000
Message-ID: <1ae04c1227ce92c481b9929edf3b5eacc8d55063.camel@samba.org>
Subject: Re: GitLab pipeline trouble
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Thu, 14 Oct 2021 14:25:25 +1300
In-Reply-To: <a01a4caeae1cb27f3bd43aef1c4058450e984db6.camel@samba.org>
References: <a01a4caeae1cb27f3bd43aef1c4058450e984db6.camel@samba.org>
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

On Thu, 2021-10-14 at 09:01 +1300, Andrew Bartlett via samba-technical
wrote:
> I've just put up 
> https://gitlab.com/samba-team/samba/-/merge_requests/2204
> 
> which should restore running our full testsuite.  Take care merging
> MRs
> proposed until we get the commit in.
> 
> It looks to me (I tested, honest!) that GitLab updated overnight, but
> perhaps I just screwed up.  I've also found and fixed why it wanted
> to
> double our CI bill, which would have been BAD...

I'm pretty sure this was just my stuff-up, so please rebase on master
and it should all be working again.

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions







Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDBBAABF8
	for <lists+samba-technical@lfdr.de>; Thu,  5 Sep 2019 21:30:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=L2qfm352btEmhzYWfQD6hD/AP43h8d7NtItjFGIm5q8=; b=5TuUUCfNf+j8MpO5kxnKXoVKXY
	FHlrvil0vHs3o1rlObJ8DtLHySCkMPuwoW/+SSaLPmrhRGNoEMatrqXGbstNYX3QrITOQqqfUZ6Np
	w2VhGyvdKt7q003rEnF5eD/7yJOaPfa7C1mEyVUF9g/Op3HTyXQbBSc/VaKOlIVNUJHWJGTBFn3aj
	HAkzbq1ctQM8b1FsElpxzDIm1NHM2J8ZCh8zlbIbRvfqYdVEiDFg9JCony/lOXLth70VasXzWEGzf
	BEG5Wp5omR25GUVH3mQUAZA8eMtmY+823CP4uINNHaNj6UUWN8NTdeyPWMw5chhY3jxQI8pRd/vB3
	esr3GD2A==;
Received: from localhost ([::1]:27256 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i5xSK-003opM-Ny; Thu, 05 Sep 2019 19:30:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50416) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5xSF-003opF-Dv
 for samba-technical@lists.samba.org; Thu, 05 Sep 2019 19:30:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=L2qfm352btEmhzYWfQD6hD/AP43h8d7NtItjFGIm5q8=; b=fNaryyMGKzMun6opCSito1PwYE
 RYvXh2R933Wp9IQGx7OiU0zfDnWsUrxSQbMUUm5pJwwenxU/Qp4wjB04s1SWYJxKLICxsqdXm7b13
 hG+KCPe07SqqPyVQkjDVTX7KhMepEWAZnJ+AkZTyoZofdXG2EvZe5lNMPx1qI4RQfgaE=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5xSE-00064c-6D; Thu, 05 Sep 2019 19:30:02 +0000
Message-ID: <646138d109724d66429657115422b9d1b2e803bc.camel@samba.org>
Subject: PROPOSAL: deprecate all authentication worse than NTLMv2 in NTLMSSP
To: Stefan Metzmacher <metze@samba.org>, Jeremy Allison <jra@samba.org>
Date: Fri, 06 Sep 2019 07:29:58 +1200
In-Reply-To: <1567660854.20732.0.camel@samba.org>
References: <ad9719c06273cac4686726b293ce9e78fecd8ca4.camel@samba.org>
 <e5796781-277a-5e10-cd55-0322f42783d7@samba.org>
 <20190904155450.GA162682@jra4>
 <43fda24acfc63961446586339798f9d7801601bf.camel@samba.org>
 <827f8bfd-22c9-7305-228c-9230d6fa3960@samba.org>
 <1567660854.20732.0.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2019-09-05 at 17:20 +1200, Andrew Bartlett via samba-technical
wrote:
> On Thu, 2019-09-05 at 06:21 +0200, Stefan Metzmacher wrote:
> > 
> > Can you do the same for the client side parameters?
> 
> See https://gitlab.com/samba-team/samba/merge_requests/770
> 
> There may be more, but this is most of the weak authentication
> parameters. 

Any comments on this MR?

Thanks,

Andrew Bartlett
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba





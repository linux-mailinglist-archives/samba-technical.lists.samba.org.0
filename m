Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C0252932B
	for <lists+samba-technical@lfdr.de>; Mon, 16 May 2022 23:50:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=hQp6BFTactM57pfls1wwefkr9zuvXT6sA9myn37jtjE=; b=m43cRYhfjL0Rs6ZZOzGvNaqXtE
	mFOir42zivlbQczcxSh4ztWgDpSX5W349ugm3PmDS+4rFTO10RKoqB/VSYWSImBpVFFaUKSgqgdM5
	pfei04rce9QhF3CTowiM9ipPCsYy05lHsrrVauu78iG/DFF1MQQFQDZ9pl5husKYhq5p9I/7RDlCs
	JKdFwbXh+SWtABMJiaAMwzYEuLcYbx4QuuNXcUkq+xffwpfm5y6Q8Y9Svy4/VqEqEatDytGoyjoBX
	1ZL3Ee4XSvGeGfk0x3FW7naTcaTO8LRsTc8GzmaRYXZKUkQdY6i4dUQtgs/Ovb9pklehtJ6+MgZSO
	SbmGpxlA==;
Received: from ip6-localhost ([::1]:51220 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nqibN-001ew5-Rj; Mon, 16 May 2022 21:50:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61616) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nqibI-001evw-IQ
 for samba-technical@lists.samba.org; Mon, 16 May 2022 21:50:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=hQp6BFTactM57pfls1wwefkr9zuvXT6sA9myn37jtjE=; b=EDecxTZax4JRtyrYHMIMAHigpu
 ZJ2hxJawHQ4huEMK0FUm6WHwNeM8WfiCmhF0dHLTsGGJxUTYTJTPk4AsmtSn0PHzstSsB3G9zjFzl
 N9vS9E+Yw8AsD8YK92OCNInTLmgeWfCln2ARwd1Jhc0D/ue+JdujahDUfNPVy/6dV6cGUngf27KoY
 sTobAWQsBZd7xSBg3lta35u5XGx0M4E3iFMQDWApKl6hazFdaKyw46MXn6V2i8J+XfmRIUzQy1RBQ
 ZiXtxhNGp6Iy8U0GCHU65DyHHufYQrhhc+bM3jzejcn4RBG+F99sWFmEB/pht2DMBTcJtyjXGjnLs
 ghOjP0XI0A+CbSe1Qb213EqWADa3MO1tc669HQUnQV/Uwnd1jimfPqVx/ovghze215EUJJeAtM6rD
 n9bx5kHb9bUgNZR5DnNehqqD0ydyjosYfZZWQQWy/BjWA0O9gBpZWfv+OlkOrNTY8YwKIJdMhjjyL
 iwW+YHNwa7Qg2EmHqsnvlMF+;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nqibG-001DAe-LC
 for samba-technical@lists.samba.org; Mon, 16 May 2022 21:49:59 +0000
Message-ID: <80f9fac48df5dce0bb997d2f1e558f7b3d7a2e3a.camel@samba.org>
Subject: Re: Runners paused
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Tue, 17 May 2022 09:49:55 +1200
In-Reply-To: <12f08a5415b5f4b2ff1db903cdfff64b447e63f3.camel@samba.org>
References: <12f08a5415b5f4b2ff1db903cdfff64b447e63f3.camel@samba.org>
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

On Tue, 2022-05-17 at 09:18 +1200, Andrew Bartlett wrote:
> Just a heads up that I've paused our runners as I'm refreshing an API
> key and Rackspace only allows one per account.
> 
> Normal service should resume soon.
> 
> Andrew,

And we are back in normal service as far as I can tell.

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions



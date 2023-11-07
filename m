Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB437E4D72
	for <lists+samba-technical@lfdr.de>; Wed,  8 Nov 2023 00:34:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=NRUMgFiQbntEYD8eNC0l97dIYJxln9yI2vewsmL/7rQ=; b=OueHZHGJ0uKau9tXnl+RsPpN4U
	fz5+SyH/SWR1ZaZfOnVPvpZhEl6ULmV6/SCmTlT5w5ElmuhwYrgwyxzBPl91afLCrMkLYId881DCw
	vetd/fC4mttene4IdCa6z1lXG+jBo2FOCOyvdsAPw5EIbzak8Uq1liH3FMUaQDVfT9vf0xJ/vUafX
	cdOJSXLRJQ17SHolZQXEPeb7tEoL50GlRzotwQmJi6IT0fjFCntNntErGjx9EKyg8712Z6sf9aUsy
	t19+V065oLiYNH9XgcISo8baczqQcnVtrPy0AOOUkM4SMODCfrCD4SIXre1edA987DFdWMKYVQI+v
	wa/58OmA==;
Received: from ip6-localhost ([::1]:33000 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r0VZQ-0071ca-UL; Tue, 07 Nov 2023 23:33:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33550) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r0VZI-0071cQ-RM
 for samba-technical@lists.samba.org; Tue, 07 Nov 2023 23:33:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=NRUMgFiQbntEYD8eNC0l97dIYJxln9yI2vewsmL/7rQ=; b=NCt195+FpmWm8kYXQ3FW56Lp9I
 SeAyhlf+HZ3R/cuBmp6etS+SbnhUrNO5Nwaa5a4QKfslPbibi0Z1F79VukpWmyKhdoXGZlbkAfWAg
 NGflhOad+sLfhtTyjpqfYORliUT+bXE0Tn16iUgEJ3lNWJf1MXgVkZUyRhH8F6Fbq8zCEMXDgzuy+
 uiRBON2jVIThL23ZEJo70QEArvSQkZ7gxLYMxnQfg4IUYIflpaWKd2yXxZUXPVtrWnpZJIWPMPv+f
 yohrW7et2Ec+1oPNAgPlTzLkTZtceBxpl2UJBS3al8qddw24f8Sxzends++Wl1IpkQhBXrDVrqZ7Q
 mlj8XJqCjnXwmqdPmRfBN43Q61rr/Zm/qbwLp2YNxF/AHJHACZSabIxCE+E1T3gVzeuoY1cNO/ias
 GhAZOFOL7a6aKhaSAkY21gHYPRAxGeM7FigFnB69Ic6hVyoGgDLXWD5rAgyPy3sJuoUebjKnUjl/R
 iOV2HA/THt+fQEpMx7vvTBQs;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r0VZG-004x3L-1X; Tue, 07 Nov 2023 23:33:10 +0000
Date: Tue, 7 Nov 2023 15:33:07 -0800
To: Ralph Boehme <slow@samba.org>
Subject: Re: [SMB3UNIX] Add POSIX fs-info to the sepc
Message-ID: <ZUrJMw4ivztcUe9J@jeremy-HP-Z840-Workstation>
References: <e15589c9-1481-4344-8030-85fc737a1b56@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <e15589c9-1481-4344-8030-85fc737a1b56@samba.org>
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
Cc: Stefan Metzmacher <metze@samba.org>, Volker Lendecke <vl@samba.org>,
 Tom Talpey <tom@talpey.com>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>,
 David Mulder <david.mulder@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, Nov 04, 2023 at 05:08:36PM +0100, Ralph Boehme wrote:
>Hi Jeremy,
>
>I just noticed that POSIX fs-info is not in the SMB3 UNIX spec.
>
>As it's the same as CIFS UNIX, I've just created a section for it in 
>the new spec.
>
>Can you please take a quick look before David reviews and possibly 
>merges? Thanks!
>
>https://codeberg.org/SMB3UNIX/smb3_posix_spec/pulls/4
>
>Btw, I wonder whether it would make sense to host the spec on gitlab, 
>so the whole team can more easily cooporate on it, rather then having 
>everyone interested to sign up to codeberg too.
>
>I'd also like to host it on git.samba.org, automatically mirroring the 
>primary cooperation platform.
>
>Thoughts?

All of this (including the change) LGTM.





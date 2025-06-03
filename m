Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC28ACC593
	for <lists+samba-technical@lfdr.de>; Tue,  3 Jun 2025 13:39:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=styyyXKx+PWC2wxLA+sLmxGt/e8OEeQ7TUOsf+nkd6g=; b=oaRC/WXric2OA1K5rluc7/JzPn
	X1BqGp85+04q9lxReI1VidxboHXOlXf6SqE4Au5UYYRa7pkDpf9+6LqdsMdno+UduVBI8ZiWrBWii
	kKjS9UO8ksLSA1fwXKq+QBxHkuaMbb+GjsMeqSXadepM+sdx0Nyf8oeTzNMoHntrlQMbkXx1M0gNZ
	HfsvxU32BWHkvqsiuE8zD6iaRk7c7BC98xwt1GAJwv2rG5ZqPHL6QHZg8AhfuT5ZmKI6Ud1mNU4+R
	zsbvvYun41kecZjjBTJX2Fx4U6qtq2eJ1m/Z0Jq5K4BzJi/y/2XROfG2WHfoMpb5GeXPL9lCZvebN
	DuehDU+A==;
Received: from ip6-localhost ([::1]:39978 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uMPz9-006WTa-It; Tue, 03 Jun 2025 11:39:15 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:61834) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uMPz5-006WTT-8m
 for samba-technical@lists.samba.org; Tue, 03 Jun 2025 11:39:13 +0000
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-32a63ff3bdfso44072681fa.3
 for <samba-technical@lists.samba.org>; Tue, 03 Jun 2025 04:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ulkuderner.net; s=ulkuderner.net; t=1748950750; x=1749555550;
 darn=lists.samba.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SLAuU2/obV+6mDv/jSpA1AtfoL/5XZsHdGSOZa7x+L0=;
 b=R5ghMKj7QNS97PxxpkgW94u+gtg7sR3PNtEoIqCExPHbOyaVywkeYbkPQ4zyWz04U3
 XDPf/mVshcrc/EKGFIqXWWZFLE6n1iDc1m6sE27tq1vLMKCmP4fo5QHb3L6DFZYDLzjg
 s0q8UlJG9drtWcH15yTdzu6qOJE90OkFq24Go=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748950750; x=1749555550;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SLAuU2/obV+6mDv/jSpA1AtfoL/5XZsHdGSOZa7x+L0=;
 b=N/H1JbrfvlLxAI53QrVuZRVdDUOxxB7O5A9l9V4rMTCkXIaLF2hqZ5v7KXECKVkMWP
 g8k/AgCXdhiPfQxlVQfZUJT/u/qic+vD2SEKgGq9PtOUt00VcInCM79/8RiQLrHOAqcZ
 LuJsjnItxikcwR4t86J7Y1RGADVTXI+DtGy1+BdC70/pDzz/BMgDxppMvrJOrEJ9du9z
 AM+ZnUjbh9gXziXx33glKsh37AWKDwctI9XdixOBRbh7t23dWrkOY2lgej6XM+UMsr1R
 K1MzFfKio85QSh2gMdB2CVja6d6NOXwIRnkptuUOS5cUnziwpUZbCWiEU67m3fydZ58X
 8qmg==
X-Gm-Message-State: AOJu0Yy694pn5heA5o0hu8F8ZlWi/RSXB8iLfrA+mOChz6YTgb4odUw1
 tqqXKfvcCfrUfQB9Xqp3M9tGp2k/PZ1t7YWSAmAgPoSkSO9n0xYKH3glAxwiLExXXjLj/sTG6/7
 rAnc6cGovX3a7G39jnWYkqOLOtNDCAaaicTk80g/yjQ==
X-Gm-Gg: ASbGncsnVLLlKK84QN90SEt9oD2fGgevytba1YcbOtqpTxjyikYWCyl9rxNbcvCxu4Q
 Sgxrs7PODLU0mLhl4c/SR2t23JDyKh5k+H5Ini9iHYTwS49CFAfk3+6r32NOJCJKb5b4QS0SOhc
 gcUFtFQGqRBCX01Pi1SZVBUKiwVzpNzJ3NcNSevBQQNRo=
X-Google-Smtp-Source: AGHT+IFEDQfiGVU2FTF8pXRoyP/8OyVBY6bBqw568hQ52lwh9X3Wc0geSAHWpG6fZfquqRHeWZGL3motF9FjH9v2lgY=
X-Received: by 2002:a2e:bc26:0:b0:32a:63f2:6029 with SMTP id
 38308e7fff4ca-32a9ea394d9mr33423041fa.20.1748950749625; Tue, 03 Jun 2025
 04:39:09 -0700 (PDT)
MIME-Version: 1.0
References: <a049e002-cfa4-4c25-9575-3bec7dac765c@tls.msk.ru>
In-Reply-To: <a049e002-cfa4-4c25-9575-3bec7dac765c@tls.msk.ru>
Date: Tue, 3 Jun 2025 14:38:58 +0300
X-Gm-Features: AX0GCFt4oWsEIOh_tH_iE5DJamLhrZyzdBfGjopzP4cF0CbY-NC3tLDUZ-mQafY
Message-ID: <CAFJ-+QtW9+kRfnDmT6mcjzCC5=BO-ZZeKNJ5q6jkKQZ=SX-mgQ@mail.gmail.com>
Subject: Re: bind9 version 20 support?
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Caglar Ulkuderner via samba-technical <samba-technical@lists.samba.org>
Reply-To: Caglar Ulkuderner <caglar@ulkuderner.net>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Michael,

https://gitlab.com/samba-team/samba/-/merge_requests/3932

Cheers,
Caglar

On Mon, Jun 2, 2025 at 18:00 Michael Tokarev via samba-technical <
samba-technical@lists.samba.org> wrote:

> Hi!
>
> It looks like samba 4.22 does not have support for named
> (bind9) versions 19 and 20.  In particular, version 20 is
> shipped with to-become-stable debian "trixie" release, and
> it looks like samba wont work with bind9 there.
>
> Adding support for these seems to be simple, but maybe
> someone already did it?
>
> Thanks,
>
> /mjt
>
>

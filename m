Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DBD77C343
	for <lists+samba-technical@lfdr.de>; Tue, 15 Aug 2023 00:09:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=d+hSrL28D4qy53jfaZwStcBiY8tNgEP0kqqP8u2bebk=; b=QZuv6Zf3OXG0usRXcwddlaICnF
	hlC2MVIfzGut79OFTNILGPUdqrgy9wM0v0PFwGLjFOkU0RpVmfIoX/ORqjKEYS5fFkViMjxIm4kJw
	Mh5uRh6l3X//IxlYKXJmjxD/k1x78FmAKQzHf9zbXvaWSKK2OHUl4eUkQRBkRM1wkg9z1UM61Br0i
	a6napDQ5yYIpiPzaDjKvRITX9SyYprzEHb7Za6tH7fCGw5F0Pc1z66UQTKiEkJh2K+6+pDmU3Te7j
	6dKdi+YlVGIMQjTTgJDUXEkOUn/8LyfBrGimjB7/lFdybmx5JD0bmq2H0dizhQISTy7RTPbxLZImN
	mSbbrHkA==;
Received: from ip6-localhost ([::1]:36676 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qVfjg-00CDtN-EJ; Mon, 14 Aug 2023 22:08:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24328) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qVfjY-00CDtE-LB
 for samba-technical@lists.samba.org; Mon, 14 Aug 2023 22:08:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=d+hSrL28D4qy53jfaZwStcBiY8tNgEP0kqqP8u2bebk=; b=TfR2Vzz8qhD+VHlizD06s7JL31
 Sgd5h1VHCQle2Nv0gYtBCAg8BKNUzA8yX0zNEDVIlctO6FR/1tUxxR4AUEp0WW1jHMpcCuC01Ic7N
 zuy3B6H+SJhO8rxtH5b1/KbayfBd6q918swv8kTeO1Nith8z0TnSafnrXThnEj27boCCOv3vdLZiH
 XNFfkN1qOWh4Ymx5hVQuzwhriSCByU34VuBi8TIumQr6TlP0SizfXocS4qRq3/XNpj5STSWsOt2dM
 qj8krHhY0wHhsEODYxtEBa4En5c2b8xTNkIcWqRmITbUDZFsffwVV20f8bxiP9AwYYdfJ6o5DrCnv
 QzxgbQrof8ZG+4XJCeAlMwP5m5ykhYBoJyQM8aI48K+S+jD9jYbmfcoAugvUmEwNQgFm1A9Pl0qFr
 9aEy8Yhu/zTRb8T5VVKuJu3b0yvGGSLNrPgiYC/mYUPhv7+kch0Q4e3zcRSM1DFMSAPa83a6PfTPa
 u8+zQtMEnUCL3gillGXeqVsv;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qVfjX-0083B7-0k; Mon, 14 Aug 2023 22:08:19 +0000
Date: Mon, 14 Aug 2023 15:08:15 -0700
To: Jelmer =?utf-8?Q?Vernoo=C4=B3?= <jelmer@samba.org>
Subject: Re: Rust bindings for TDB
Message-ID: <ZNqlz0tOaiMc2M1r@jeremy-rocky-laptop>
References: <79BC9465-F780-4944-B996-35D7974F0DA7@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <79BC9465-F780-4944-B996-35D7974F0DA7@samba.org>
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

On Tue, Aug 08, 2023 at 10:43:01AM +0000, Jelmer Vernooĳ via samba-technical wrote:
>I've created Rust bindings for TDB. Th. Rust crate can be found at https://crates.io/crates/trivialdb (TDB was already taken :-( ). Documentation will be available on https://docs.rs/trivialdb/ at some point - it's waiting for their build image to include libtdb-dev.
>
>These bindings aim to provide a Rust idiomatic interface to TDB, and cover most of the existing TDB API.
>
>For now, this lives in its own git repository at https://github.com/jelmer/tdb-rs. I'm happy to see it shipped in the main samba repository if there's an appetite for that, but it would add another tool chain so perhaps it's better to keep it separate for now.

Thanks a *LOT* for doing this Jelmer !

Maybe we'll be dragged, kicking and screaming
into the post-C future sooner rather than later :-).

Thanks once again !

Jeremy.


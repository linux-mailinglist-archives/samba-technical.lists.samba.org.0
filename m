Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D446260D1C9
	for <lists+samba-technical@lfdr.de>; Tue, 25 Oct 2022 18:45:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=ElHVdP9mxidpscHMwR/QTWmh6zCQ1i2CUbTYGJa5Lu4=; b=SHRycIlNA9DWYWKJ9Ow+uVfhlQ
	9obG/tmqwKlnc38AEkg8Kqrz1fsEXKPl2QaVr08lbYVS39HCPJZZmM32uyL6mvaoevf9k4gCnVFQ4
	K8o1HODNagkMmTyIzPbrQrYa0Xo83ULlMiHRdhNIaHMkcPDtPiAARX1skGAVrWuDXx76xJJ3XbN69
	Y3K0nAx3mHxq9O38X0FAH2Yx0dOkl2leE8Apcfv6r0MMbL2IM3DQU9TFPe7jB+T4FkGurnli3Vz6O
	+qjwgnERKiWy0mhTrBV49Z/Y9us7KGWrfWaDhBmtzsPPZrsImo4Vs9YrTKDyzThEApAjXUpxSIZuH
	9r+ylQTQ==;
Received: from ip6-localhost ([::1]:58544 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1onN3d-005xMl-2e; Tue, 25 Oct 2022 16:45:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30890) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1onN3X-005xMb-Km
 for samba-technical@lists.samba.org; Tue, 25 Oct 2022 16:45:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=ElHVdP9mxidpscHMwR/QTWmh6zCQ1i2CUbTYGJa5Lu4=; b=cJqBcu6sWl37MEVRU/s/Ot91Qc
 HhyPy6hZnhNQ+O0oviq49YP8r/3lScg4aVkDURX3ychiYCgejO0FEc+PWUuMAybR5XYOuCeREo1db
 fM38mHl8LoGlFYQ/YFqx6nvAA2aBdonsdxg5DKRhh+z47xKcJkWD7CNdilkopWdVHKkdNfLWLUnrn
 Vc+Mq30+BSAMi2/n8rBfavyBv8R2HOHCIhDyvm3e+/cEPO0axRrxND4d1dKVw1nY3GB292YU9neIB
 Kg43f63etZnKHlTQST3OM6UviUP2Yl6mZQgj25t/7ebwYmpQjsrTOq4mVMC7+Vw/6Qp7HvlXtJ6C9
 EB8bnaqANS6ehNMBVcwZTbJQgjMNxzcihlcJU7SoFnQQTxaw6sqSSfiDah9V2l6TJTv07njxdn02d
 Nj2pDZqYfJ/ikp1FC4RW4QxUIxemgyYxKENTtl71hQFn1BX57VlIutAz/hgO62Vnl1OfXVxJwEEr4
 XnVHTpkJEJjZjdt/3M6xh9TY;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1onN3W-005kyT-Le; Tue, 25 Oct 2022 16:45:35 +0000
Date: Tue, 25 Oct 2022 09:45:32 -0700
To: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: smbclient --max-protocol=NT1: why it requres setting MIN
 protocol too?
Message-ID: <Y1gSrECALfFgazNj@jeremy-acer>
References: <24ff5bf2-8bf0-6a88-a3b1-aab36099c9b3@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <24ff5bf2-8bf0-6a88-a3b1-aab36099c9b3@msgid.tls.msk.ru>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Oct 25, 2022 at 06:45:55PM +0300, Michael Tokarev via samba-technical wrote:
>Hi!
>
>When trying to use current smbclient to connect to, say, a windowsXP machine
>(which implements only NT1 protocol), smbclient has to be told to use lower
>protocol version than it's default - this is intended.
>
>But the thing is that it doesn't work:
>
>  $ smbclient --max-protocol=NT1 //testhost/share
>  Unable to initialize messaging context
>  protocol negotiation failed: NT_STATUS_INVALID_PARAMETER_MIX
>
>Using -m/--max-protocol=NT1 *also* requires setting another option:
>
>  $ smbclient --max-protocol=NT1 --option='client min protocol = CORE' //testhost/share
>
>This way it actually works.
>
>Can't smbclient either warn about this situation, or better yet,
>lower its min protocol automatically if it is greater than
>the requested max protocol?

I think that's a great idea for usability. Can you log
a bug so we can track it ?

Thanks,

Jeremy.


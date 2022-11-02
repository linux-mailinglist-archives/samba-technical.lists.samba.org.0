Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5D9615D43
	for <lists+samba-technical@lfdr.de>; Wed,  2 Nov 2022 09:01:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=x14JnnOWy3X5+j2IulWP1YdMDAOp4laWqw//zsY0Y2Q=; b=wDuZExc7ZoNsomSEf7JCjJJR7N
	3N8HYG4o9XRv7J1QPea1nV617vuw2/oUbU9EUmShH1HQzge2wj6OEP1MvXx7fby8LetSmCodt6dFa
	gNXA8yNqCMNUetH/VrPudfm6Ndg0Mc6xSXEBT9p0swMurGBsR3wUdALghpw0ndg+znFZGIo3uvnTs
	KUpJgd/kmkNcgv2oPu99QlwsDeoYJneQFufYiCLMhvo0wnonCDOdLmU+FoJv0+dUL9nQFJ/kyYNRt
	0eB8KHd07ulsY2inKI4ZjueX8UZQVEqboA/C3nWFaH9PvXnOjCFP7rCVKGJU44cwiI4z942Lzw0HP
	smqEMtgQ==;
Received: from ip6-localhost ([::1]:64500 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oq8gI-00A1ga-1u; Wed, 02 Nov 2022 08:01:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64576) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oq8gC-00A1gD-BV
 for samba-technical@lists.samba.org; Wed, 02 Nov 2022 08:00:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=x14JnnOWy3X5+j2IulWP1YdMDAOp4laWqw//zsY0Y2Q=; b=St2AVjIzTrR4IAqoR0iw6iRYyN
 BNFe12RuRgeC5JlPulhsnIeUpGa2fFmMviTCNl0VX3n/MdcpRmgSUtp/cRkiOhuheP3kqHwz9l61r
 WWAYdr1KEvYxVJiwtnrlBjO32JK9fiSU3XuFYJfeenkaXQ5jDDpDqFUUvHkhLzPNPgT1qG1NIoxGH
 mRi07P98L0H/yl4ezkkCaCHiJN3eNWgsUQhWAaK0Kn8W4w1HmWb/EJghJ4VJmLJ+LQv+JiRO56oPn
 SXxQO2+NW2PXRXbLvY+r/lIxow19E/WHqcaX3wBtZp0+86vbUdPfGQ32dwisLnzk08TMNUAPlIauS
 gApbXTTLlHfWHRzcLHO7ndyX5LPXvKfRxe9WXcIKc3X1O3EEjMDPORWgPIB1omdzzfZnW2zvnJpXq
 fbRp5Fu8o7hMR7YlX3yqiQ2YgPMrrvLQAe56F07w+OHQGP8hK8ZISftX2SQi1MbxSwT+eDkx1lnna
 lVLxYc5hw2+lppxjvXrYJ8Fm;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oq8gC-006qWw-2s; Wed, 02 Nov 2022 08:00:56 +0000
To: samba-technical@lists.samba.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: [PATCH 2/2] ndr: revert libndr.so.3 soname bump
Date: Wed, 02 Nov 2022 09:00:55 +0100
Message-ID: <2262146.ElGaqSPkdT@magrathea>
In-Reply-To: <20221101092113.2691975-2-mjt@msgid.tls.msk.ru>
References: <20221101092113.2691975-1-mjt@tls.msk.ru>
 <20221101092113.2691975-2-mjt@msgid.tls.msk.ru>
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
Cc: Pavel =?ISO-8859-1?Q?Filipensk=FD?= <pfilipen@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, 1 November 2022 10:21:13 CET Michael Tokarev wrote:
> After the previous change adding compatibility symbol, revert
> libndr soname bump from 2.0.0 to 3.0.0, and bump it to 2.0.1
> instead. This renames whole ndr-3.0.0.sigs to ndr-2.0.1.sigs.
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  librpc/ABI/{ndr-3.0.0.sigs => ndr-2.0.1.sigs} | 0
>  librpc/wscript_build                          | 2 +-
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename librpc/ABI/{ndr-3.0.0.sigs => ndr-2.0.1.sigs} (100%)
> 
> diff --git a/librpc/ABI/ndr-3.0.0.sigs b/librpc/ABI/ndr-2.0.1.sigs
> similarity index 100%
> rename from librpc/ABI/ndr-3.0.0.sigs
> rename to librpc/ABI/ndr-2.0.1.sigs
> diff --git a/librpc/wscript_build b/librpc/wscript_build
> index cf9085c0884..dbe66a23f45 100644
> --- a/librpc/wscript_build
> +++ b/librpc/wscript_build
> @@ -654,7 +654,7 @@ bld.SAMBA_LIBRARY('ndr',
>      public_deps='samba-errors talloc samba-util util_str_hex',
>      public_headers='gen_ndr/misc.h gen_ndr/ndr_misc.h ndr/libndr.h:ndr.h',
>      header_path= [('*gen_ndr*', 'gen_ndr')],
> -    vnum='3.0.0',
> +    vnum='2.0.1',
>      abi_directory='ABI',
>      abi_match='!ndr_table_* ndr_* GUID_* _ndr_pull_error*
> _ndr_push_error*', )

Please fix packaging and rebuild packages depending on this library.

libndr is not a stable API! We never claimed that and there is not guarantee 
that the API/ABI will stay the same in future!


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D




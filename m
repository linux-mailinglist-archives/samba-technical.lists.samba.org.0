Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1997AC827AE
	for <lists+samba-technical@lfdr.de>; Mon, 24 Nov 2025 22:07:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=p4Uhj2hqlAoIG3tYbLXlsV42mkOA4ZEbg7RqaiqbhJU=; b=XWmL6PVOr8xC3JjhrqJZ14BJV8
	aOlrJzB5Krmd8TlY5fsRoVmKfrBqelsAhhHcPc0l6xXXJHHFil9EwQ0rev0QuZ1u61oZAiYJGYWbf
	AMyxNnxANBCdXjVYpob3wHZAjaWw6QoIBiJWIgdYS311VRkQm1TYXN5VUk+V0r7KFghUWiFtrVu+r
	8MTZ+zX1BPGUjPGNNtSGDUcYujbXWPLnSa+7GvcwIGyqWCdUUu94UZMWlFhllXAtd+PWQ9Af0SXBz
	R2C4xK/txVJ6SoCwjxA4BxUEvEyM8dvimZqySu5xMgKacTmc3tgKmPqLWLcU/FmKp8yb2fZb5o0fN
	9bMi/4cQ==;
Received: from ip6-localhost ([::1]:22580 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNdmC-00D2I0-SH; Mon, 24 Nov 2025 21:07:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62982) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNdm8-00D2Ht-Bk
 for samba-technical@lists.samba.org; Mon, 24 Nov 2025 21:07:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=p4Uhj2hqlAoIG3tYbLXlsV42mkOA4ZEbg7RqaiqbhJU=; b=cg318w7C3Ts8Jmmi6y+2AkCHpJ
 R6JxWsNAuXEckDJ2ltHVyYCyu59YdawOJCAfhJ5YbfumbbCU4xFQ6ByjTmCjPUAt3Aabvz1h37ARX
 goYmNoKRodY8bw4hUNmrJFcU7LSa9z0D6grfkO58fBp9UElRBgfu31NIfMHMAPevsoJk68gN3FLEB
 zRtKySKoq7Jno87VcQhOzuM2F7Cr0x4lMkx489XRdORnmMQUFTdMushRLs7SUD596oMZ4lFpUQJTY
 HnY+3bVht8ZA9JfUdt6jeBQH0qzKRNwbwObLljVtOQJ33+Id9q0NuJ8HMdpzalaratLK6eJlFFDzn
 NbvITx9ytfdW2o617FjG88d/0yWnlQf+YfRrmoL5KcHjQWjIq/xtLtYipd8wqxadb7r/VoKj61gjs
 pWcVV/sCvuftEMnuIn1PcZmO9Za2FfMLH+eFl9GCYdatDMuxEu8RxmFocrfgYZRu2cAdhMW+yKroS
 cc1RczhrNys2tUM72VJq2dfr;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNdm7-00FSzE-1p; Mon, 24 Nov 2025 21:07:07 +0000
Message-ID: <63d42fdd-d3d0-4d4e-98a9-bf1926cbd9d0@samba.org>
Date: Mon, 24 Nov 2025 22:07:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] smb: smbdirect/client/server: relax
 WARN_ON_ONCE(SMBDIRECT_SOCKET_*) checks
To: Paulo Alcantara <pc@manguebit.org>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org
References: <cover.1764016346.git.metze@samba.org>
 <a5d65f2d2e7cb45bd47317b726f86568@manguebit.org>
Content-Language: en-US
In-Reply-To: <a5d65f2d2e7cb45bd47317b726f86568@manguebit.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: Tom Talpey <tom@talpey.com>, Steve French <smfrench@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 24.11.25 um 21:56 schrieb Paulo Alcantara:
> Stefan Metzmacher <metze@samba.org> writes:
> 
>> The patches should relax the checks if an error happened before,
>> they are intended for 6.18 final, as far as I can see the
>> problem was introduced during the 6.18 cycle only.
> 
> Since we're late in the v6.18 cycle, I would suggest leave all this
> churn (e.g. adding new helpers) for v6.19 and then provide a simple fix
> for the problem instead.  This way it will get a higher chance to be
> merged in next -rc.

I'd actually like to leave it as I posted, if that's
really too complex, I'd leave it alone and let 6.18.1
pick it up via the Fixes tags. If someone else likes
to propose and test a different patchset for 6.18 that's
also fine for me.

metze


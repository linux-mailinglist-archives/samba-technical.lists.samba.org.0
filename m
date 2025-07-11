Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 18056B01006
	for <lists+samba-technical@lfdr.de>; Fri, 11 Jul 2025 02:02:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=D2Vjdv6qb/yD7HIfMrxbOy5cqFeySwJ2HZWcVIx+IOA=; b=GSnygM5zwhcM9hE4uFGVMH0qfr
	Rt1DXN2LyLeaxWbby+yaZ6dAToDnQPLiJqS7Z4R43B7NxNCTfsTXPzH3Xb2U0lmWXNxbDOEKVnMO/
	GfYLdqUXH6aY82dDNGVbud+TkBXsjyJU1Ac4f4/3/yDfZITQgWLeYJbXYsNalzpiVLmnylGjjeGS+
	eKtsxHmy4AIsATv5JYsgwX1i9C3iqdy3m+jiRKPX4Jaw0wf1SFI4KHommypXJfhwf3Ja1wJ4/PhEE
	TAqbwvR4d3k0+dYKSLm8n96G35R7rcSh7drLSiU36SubAEFWB8tfUtakY9mtjd9AheAWzBDsprsWl
	l0I4jaJg==;
Received: from ip6-localhost ([::1]:45172 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ua1Cy-00AxVw-3j; Fri, 11 Jul 2025 00:01:44 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30]:59547) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ua1Cs-00AxVp-MS
 for samba-technical@lists.samba.org; Fri, 11 Jul 2025 00:01:41 +0000
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-2eff5d1c7efso977618fac.2
 for <samba-technical@lists.samba.org>; Thu, 10 Jul 2025 17:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752192094; x=1752796894; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UOlgRew0JxYvvkq1FH7VOS2J6OyoGpuXhptV8QxCyLA=;
 b=jw1DJeuBKRDNBWgXpoUfNnuToftaQzxfNwbGlUsCuSGq0/U/XRbCqF5BNPXHL2RRb1
 XwehfU2zRzStp3rnI3itp9Zqfn7IIAXXEWfaSEJzyu4iwbHbjxthioYLWS2YNAcv2IWU
 dMjhuXl6jTYpYVc9TCnUaQhlaRc2OYDN3aMT2M8vI1UMB0J9zgKYhcOxX/6tZ0HojIy1
 t5YBoL2JE4omgr12wv2GYq6gZXvqCc+PFSPgnpEpjkfeqYOp3nBOuDY2ukf5f5b5CR7s
 nRaXI6ui9saXgeEF6JYNNarhGznrfSFvjXrUSwSxnE9trcma8Jga+dnPQSnCUvO0Tpbk
 zL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752192094; x=1752796894;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UOlgRew0JxYvvkq1FH7VOS2J6OyoGpuXhptV8QxCyLA=;
 b=QFNqn23YBlz1PAcaUZ7mugIQRkWtikzY6P7I7b0w19LK8d6tD9wpe6rUle9LB2WT4i
 bB5rG3PI7bUp8PrJlr4ztZN+5yBuZLqUj4cKWkBDQj5DEDBFmYAFKpEpTupRacXyPdDs
 BvYksnOBPlpia1eTsW9UzM8mYA0wnwyl4d/G3lN71VCRx/zdD2BTqk+uMdlkxbf8T1Mr
 sjuk9e+k2sbH1aYqTmWwWFHBd7O5oe4mlFj7ziceQzhV3qT0p8dq4OE/MYCgLtOQnQjQ
 McuFB8iSf1yt3ha76/dDNtQ6TsnZQKA7tFF3ClhvrUlV7+719C8kSn37DwTNpyJITh3o
 KjbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0q7R06ImqPFxQuv91sS2xDicSg7WFy1CiLV8uCIpK5deYUX8QPMIMIFdcRl7tGNrfmAV6Q/La2biEb2vEuBM=@lists.samba.org
X-Gm-Message-State: AOJu0YyTKxFkezA2pW19vNg/0Ai3dBWWMhgpnqZt5SOGFH+mFGIk7nuy
 cuHB7+7dDLQSvBvVVqcY76qn7YqU2599OwBh8j2QhQvFWvvYL9WHErp0v5jwJb0hdZV3D+WIWCq
 OabuhhmLXwD3dkCw1ITaZ8D19IP7wUgE=
X-Gm-Gg: ASbGncsUw8QWtmyAPliKpme+l6YE5jGgDU8kJaJt66itw3fX5FuhQqoDCWX+ALcgV98
 +Zxd1AV0ATEVnEKEfdgzLG7FZl6x9lurvECVYNEAHzlidb/hEiTLA46Pw2ASL+BYenlKPU8RGzn
 mR0XWguR15oW46C3C71Mx9TM4ZUlTSagbn1rGLM+e0pUk+7UHC7f2tAtV9V6Y43gLHexO1IPbcn
 oqtDLUa5kPG4ZyEfyh/OHS3WkUIrqpY/yLJyO8=
X-Google-Smtp-Source: AGHT+IHy5Of0Q0N8K/o/1xqMf6hAkfmIroTlna2a3sHaEsOuQS7zTbJpw0IQ8jk58gIVzt9BMdKMrBgKYKuJqPJM0SA=
X-Received: by 2002:a05:6870:bb16:b0:2c1:6948:d57c with SMTP id
 586e51a60fabf-2ff270740a5mr885059fac.28.1752192093981; Thu, 10 Jul 2025
 17:01:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250705025118.48080-1-wangzhaolong@huaweicloud.com>
 <bb5dba5b431172ae8b268470d6e37419@manguebit.org>
In-Reply-To: <bb5dba5b431172ae8b268470d6e37419@manguebit.org>
Date: Thu, 10 Jul 2025 19:01:21 -0500
X-Gm-Features: Ac12FXz95EOcjBNe65Q2YRjuVNVHyWG8MIyRH_tlHeKdsd-2fwByFxVDDjNpNOs
Message-ID: <CAH2r5mtF8WNQbZqg+f1AB_2CiuK1-U3e65v8RnYJMNMAPFX+hg@mail.gmail.com>
Subject: Re: [PATCH] smb: client: fix use-after-free in crypt_message when
 using async crypto
To: Paulo Alcantara <pc@manguebit.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: linux-cifs@vger.kernel.org, yi.zhang@huawei.com, ematsumiya@suse.de,
 Wang Zhaolong <wangzhaolong@huaweicloud.com>, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, sfrench@samba.org, wangzhaolong1@huawei.com,
 chengzhihao1@huawei.com, yangerkun@huawei.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next pending more testing

On Thu, Jul 10, 2025 at 6:19=E2=80=AFPM Paulo Alcantara <pc@manguebit.org> =
wrote:

> Wang Zhaolong <wangzhaolong@huaweicloud.com> writes:
>
> > The CVE-2024-50047 fix removed asynchronous crypto handling from
> > crypt_message(), assuming all crypto operations are synchronous.
> > However, when hardware crypto accelerators are used, this can cause
> > use-after-free crashes:
> >
> >   crypt_message()
> >     // Allocate the creq buffer containing the req
> >     creq =3D smb2_get_aead_req(..., &req);
> >
> >     // Async encryption returns -EINPROGRESS immediately
> >     rc =3D enc ? crypto_aead_encrypt(req) : crypto_aead_decrypt(req);
> >
> >     // Free creq while async operation is still in progress
> >     kvfree_sensitive(creq, ...);
> >
> > Hardware crypto modules often implement async AEAD operations for
> > performance. When crypto_aead_encrypt/decrypt() returns -EINPROGRESS,
> > the operation completes asynchronously. Without crypto_wait_req(),
> > the function immediately frees the request buffer, leading to crashes
> > when the driver later accesses the freed memory.
> >
> > This results in a use-after-free condition when the hardware crypto
> > driver later accesses the freed request structure, leading to kernel
> > crashes with NULL pointer dereferences.
> >
> > The issue occurs because crypto_alloc_aead() with mask=3D0 doesn't
> > guarantee synchronous operation. Even without CRYPTO_ALG_ASYNC in
> > the mask, async implementations can be selected.
> >
> > Fix by restoring the async crypto handling:
> > - DECLARE_CRYPTO_WAIT(wait) for completion tracking
> > - aead_request_set_callback() for async completion notification
> > - crypto_wait_req() to wait for operation completion
> >
> > This ensures the request buffer isn't freed until the crypto operation
> > completes, whether synchronous or asynchronous, while preserving the
> > CVE-2024-50047 fix.
> >
> > Fixes: b0abcd65ec54 ("smb: client: fix UAF in async decryption")
> > Link:
> https://lore.kernel.org/all/8b784a13-87b0-4131-9ff9-7a8993538749@huaweicl=
oud.com/
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Wang Zhaolong <wangzhaolong@huaweicloud.com>
> > ---
> >  fs/smb/client/smb2ops.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
>
> Reviewed-by: Paulo Alcantara (Red Hat) <pc@manguebit.org>
>
>

--=20
Thanks,

Steve

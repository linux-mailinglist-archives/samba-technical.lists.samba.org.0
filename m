Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E10758EB
	for <lists+samba-technical@lfdr.de>; Thu, 25 Jul 2019 22:36:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=bZH1EfO+wp4ZZepYUwOn6w2UpQm5V1jccHCzgFCqyAE=; b=gavRzXCBxScM11GhOCFRk9DV+F
	yCse9I15oCXuiQdV34HdIK/GkDtzIJTUOKGmUUaLZGq+c4d4WPHPdahw1FKHM1WwooQUJOpiLwTo3
	FhLPx5YVJ6pdGHSEh6dgb9exAPmXVnAUzqYOKwadWdfDWKVUVdHToXnZO7tuU2VO7F0vLm/uVxQXV
	fpoEVNnQtBlfqdWrWgdFYUvzcuI5UarOswksKkwRxZSwCClR0pYEUCg2f1vW4jryKZTHLxEZejVE8
	4fJZor85c4hsSQn3UE0KR9z+Z+mlt4m95M9n2DNrZuLDemxCUCNnBjGxifQ9H4fCNmTwUTzSabt0B
	V/+aXJfA==;
Received: from localhost ([::1]:29408 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hqkSn-000Lc1-Db; Thu, 25 Jul 2019 20:35:45 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:45702) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hqkSi-000Lbs-HS
 for samba-technical@lists.samba.org; Thu, 25 Jul 2019 20:35:42 +0000
Received: by mail-lj1-x242.google.com with SMTP id m23so49194785lje.12
 for <samba-technical@lists.samba.org>; Thu, 25 Jul 2019 13:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bZH1EfO+wp4ZZepYUwOn6w2UpQm5V1jccHCzgFCqyAE=;
 b=I/SbeOa8k5S8/M7sVSOen0A+TyTVCHMCzF/FbUKc5gXpS83cIUlnNWsABNgzRrohMV
 CNa1akp/y9X8N2IjtLMu+vRWp6d4g8sjcmYED3KjUV1gdaOsd9nB84co5NNH1Ios69bD
 ZrUosYNmc78JfRsXfA1C6FATWO9H7DP/hvuU6PruMXcOTF7eKaEBiLFdDvq8yOrPY+zC
 gojt5sSW9bmJFqwrvhTFFGM3ydrgIDkTs+LkVZdZNwoc7EI/DNt9k7EHw6jgjnIhJahl
 XMgxtMxx327dvT9YtwwPIUItWPOxjEa+L0Km/dvILnsPEmfGawo/Ygapg9Ur+8wMLKhJ
 o0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bZH1EfO+wp4ZZepYUwOn6w2UpQm5V1jccHCzgFCqyAE=;
 b=IRsNRQXrQGB6N8KLN4pDzGA9Q84HLi1VZcxJkSkMdftkcQoGQAUxyLPedEFFiAlHkl
 Pky1RE21M6DZ9o1XT+9q4jCAZzVvr7/i3A3tIMMSMLuhKkxPPN/1Rty7+o4ZKufSYZU/
 vBybM9XjUB4K19tIhvfQM6YPIr8HnsbBwZdgIchfJwzT9O4e46HrCibOVvtg24Lm3ogE
 yxrjhirTaOxuYZ9Fryx82qwa6IzvyRwWqvoT4NUxyYb5T7nq7/oFYDg2Eq8leyvYrW7r
 8rPdXTOaHFeJDWO9nWazc/7Y0BTYWVXBHwJOoet8m6Kxdcq+dRhW22P6nmD20W2MD6ou
 M3jg==
X-Gm-Message-State: APjAAAXzAzuE7sOrJmQuhPWnzqhQwf6OcaXF7y/v92GmZnNHVqDrq1mG
 y7+gdKQ93SYiSpNBLsHYS/Qwim/ULzu8emOLV9Uv
X-Google-Smtp-Source: APXvYqyCpZoR6mH4jGliesmebXDKnBSJSvMH10sJOh78OipnpgT6Ur5RY8DiqAJhXEZzpNUZHov+Sw9DK9ImJ4hOv0w=
X-Received: by 2002:a2e:8945:: with SMTP id b5mr46051581ljk.93.1564086939506; 
 Thu, 25 Jul 2019 13:35:39 -0700 (PDT)
MIME-Version: 1.0
References: <380e1b86-1911-b8a5-6b02-276b6d4be4fe@wallix.com>
In-Reply-To: <380e1b86-1911-b8a5-6b02-276b6d4be4fe@wallix.com>
Date: Thu, 25 Jul 2019 13:35:27 -0700
Message-ID: <CAKywueSO=choOsw6THnEnmN4UwhACHU1o1pJX8ypx0wjVTmiKQ@mail.gmail.com>
Subject: Re: PROBLEM: Kernel oops when mounting a encryptData CIFS share with
 CONFIG_DEBUG_VIRTUAL
To: Sebastien Tisserant <stisserant@wallix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Pavel Shilovsky via samba-technical <samba-technical@lists.samba.org>
Reply-To: Pavel Shilovsky <pavel.shilovsky@gmail.com>
Cc: Steve French <sfrench@samba.org>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 Cristian Popi <cpopi@wallix.com>, Cyrille Mucchietto <cmucchietto@wallix.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

=D1=87=D1=82, 25 =D0=B8=D1=8E=D0=BB. 2019 =D0=B3. =D0=B2 09:57, Sebastien T=
isserant via samba-technical
<samba-technical@lists.samba.org>:
...
>
> mount works without CONFIG_DEBUG_VIRTUAL
>
> If we don't set CONFIG_VMAP_STACK mount works with CONFIG_DEBUG_VIRTUAL
>
>
> We have the following (very quick and dirty) patch :
>
> Index: linux-4.19.60/fs/cifs/smb2ops.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-4.19.60.orig/fs/cifs/smb2ops.c
> +++ linux-4.19.60/fs/cifs/smb2ops.c
> @@ -2545,7 +2545,15 @@ fill_transform_hdr(struct smb2_transform
>  static inline void smb2_sg_set_buf(struct scatterlist *sg, const void *b=
uf,
>                     unsigned int buflen)
>  {
> -    sg_set_page(sg, virt_to_page(buf), buflen, offset_in_page(buf));
> +      void *addr;
> +      /*
> +       * VMAP_STACK (at least) puts stack into the vmalloc address space
> +      */
> +      if (is_vmalloc_addr(buf))
> +              addr =3D vmalloc_to_page(buf);
> +      else
> +              addr =3D virt_to_page(buf);
> +      sg_set_page(sg, addr, buflen, offset_in_page(buf));
>  }
>
>  /* Assumes the first rqst has a transform header as the first iov.
>
>

Thanks for reporting this. The patch looks good to me. Did you test
your scenario all together with it (not only mounting)?


Best regards,
Pavel Shilovskiy


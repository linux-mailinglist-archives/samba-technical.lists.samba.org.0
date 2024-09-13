Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD7C97764C
	for <lists+samba-technical@lfdr.de>; Fri, 13 Sep 2024 03:14:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=gAgjzjVLvrd0brRCe5Bge88sB90MQTZTYNADq3HWyr4=; b=6CX/A0leN2atkbmGUna1kXuae6
	deS+0bbZv37ue8HA851pd9ePIVF0X6bdXn08+fW07mAJ5GTmadVzV9U0vLaA167auimJQbZUe4pU5
	/jV0OBE1E+WE8lou2jINXR8j416n3/n1tsDU6SFbeP+FFtX0lkGwjLlL/A4ZMjqrrsajA7Evg/GtS
	7aWJhFGRZL8BVNPv41d42eeGYLk062fFfEz6RnNX7DR4/zper+ig4E2A/kXPEKu5dz1KMGwEP/Ek7
	qumQnyEWpNqiwUbtzK8spm7xSiXqUttxdPyP+ohq7jGNmHh3aRDDpwfM2fSr/hsLqfhXqUmxvZNUV
	3M82947Q==;
Received: from ip6-localhost ([::1]:57360 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1soutA-008MI2-Py; Fri, 13 Sep 2024 01:14:20 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:59630) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sout6-008MHv-Fb
 for samba-technical@lists.samba.org; Fri, 13 Sep 2024 01:14:18 +0000
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5365b6bd901so1853516e87.2
 for <samba-technical@lists.samba.org>; Thu, 12 Sep 2024 18:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726190054; x=1726794854; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gAgjzjVLvrd0brRCe5Bge88sB90MQTZTYNADq3HWyr4=;
 b=G0ZHKpkSlRzIsdn9sQVSictjp1QPTcvLkXVl0PT5vwwGIiunMTKRONT58KTZnCv7QB
 d9X+uCsXKyFv9zE8nVE5KdfxM+KhELfclUSHAKWo/EBevcbiA8m/5d0Y4rNQrwVxoSml
 slmavBV5Jh8RH1urY7XrBI8sh3BBvT5Qyo4ze13hWPH80tT+DlIRXDPqz2BpzW79XuHe
 mEHVSHh5op/ok6DVBhdkCG9zm9EMBHPtZaM5vouCJq7+N6xZK7n1w0LQozrfCzAv0sia
 idXTcpj+yRwIg6DflLqCuJFFFUTnoE8E9ZqFWNCHLOh40lzkEarg4Wvuq/tmXPn4Mu05
 sj1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726190054; x=1726794854;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gAgjzjVLvrd0brRCe5Bge88sB90MQTZTYNADq3HWyr4=;
 b=jMRLBIMUSKnbGMP7C8QQaq23YLy1s2ed9DiY6fOyYOJg84t3NEVKi2W/eE0AC3r027
 nKFLTOEfPbrpE+7cnvQTgjwIjoTAqM0VMo2UmuOvwvMgOO+bLEwoKNvr0FlAwoKWqNq2
 U+WQfufjEm9bsI4RaVKlJavCHfgvlqTmu9gIC1DxmLa0jMqKmwPyXLuzaSp1kn3IfIx0
 /3tPklFP3w8OhHbTSJJm2Hww/OvBaHlWhMokqLs4wDpv1gjyxUj5ryuwCvRySDMXKT0I
 nI1i0N8ePEaqQ4KDvTyY6W3ZRBdGmSpppCFUyYtwRuhX9+shYdQ70wyY6tBAtfGw7hbq
 bbBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUM38JM5Hnlyf5BKhsp6QSZJTl32w7q+bX58ifV/96yJ48Bu4qItsJNGo8tABzZgkkZtcaoEKjuVQJZV7j6Iw8=@lists.samba.org
X-Gm-Message-State: AOJu0YympzlMUyahVNWcAE4J/QuXOsuGCW4S4bza3EbLSRBLKC1UGac8
 iTG2QwjTSKuG4jbYDdheVbqI8+pwIdLKHzZNYBLqxl+Nym3jjaJGxpJA0Wo1DmGa0LwvaEcI8Ch
 suAlXTZABN6TnoZROzPryqCo90mI=
X-Google-Smtp-Source: AGHT+IGlElygHVCvY0Le33o89IgiMFttT6HzN3W3uVWF3oe3t7E2JSa0on0oe9QBj841OoS5+B8fw2UwWTAdQvK5aa0=
X-Received: by 2002:a05:6512:12c4:b0:52c:db0a:a550 with SMTP id
 2adb3069b0e04-53678feb66dmr2789764e87.42.1726190054084; Thu, 12 Sep 2024
 18:14:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240913000053.123052-1-qianqiang.liu@163.com>
In-Reply-To: <20240913000053.123052-1-qianqiang.liu@163.com>
Date: Thu, 12 Sep 2024 20:14:02 -0500
Message-ID: <CAH2r5mvsuTE=DoP-TwzSsREbGTgnsdNMMnPzK2ypLts6YuX_dg@mail.gmail.com>
Subject: Re: [PATCH] smb: client: compress: fix a potential issue of freeing
 an invalid pointer
To: Qianqiang Liu <qianqiang.liu@163.com>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: ematsumiya@suse.de, sfrench@samba.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, linux-cifs@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Good catch.

Added to cifs-2.6.git for-next

On Thu, Sep 12, 2024 at 7:02=E2=80=AFPM Qianqiang Liu <qianqiang.liu@163.co=
m> wrote:
>
> The dst pointer may not be initialized when calling kvfree(dst)
>
> Fixes: 13b68d44990d9 ("smb: client: compress: LZ77 code improvements clea=
nup")
> Signed-off-by: Qianqiang Liu <qianqiang.liu@163.com>
> ---
>  fs/smb/client/compress.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/smb/client/compress.c b/fs/smb/client/compress.c
> index 65d3d219e8bc..daf84e39861c 100644
> --- a/fs/smb/client/compress.c
> +++ b/fs/smb/client/compress.c
> @@ -318,7 +318,7 @@ int smb_compress(struct TCP_Server_Info *server, stru=
ct smb_rqst *rq, compress_s
>  {
>         struct iov_iter iter;
>         u32 slen, dlen;
> -       void *src, *dst;
> +       void *src, *dst =3D NULL;
>         int ret;
>
>         if (!server || !rq || !rq->rq_iov || !rq->rq_iov->iov_base)
> --
> 2.34.1
>
>


--=20
Thanks,

Steve


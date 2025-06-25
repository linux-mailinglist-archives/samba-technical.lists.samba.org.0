Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFF9AE8F44
	for <lists+samba-technical@lfdr.de>; Wed, 25 Jun 2025 22:14:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=WfT2F4WO2WkloBm9pwG8+Zygrf5do3v691T8Lv7s6Gs=; b=I3z0m5DZ+4SO8YKsh5oZQdVA2o
	tMkTYZBPy2JCNc2/7VVXAOWi+N8YG5MH3Xl3nmaaYYQ6aMLnvKhxGnprSFALD5TcJzuAqAuvh60KT
	lmK6eKTURogPeiHZfWD0yGWNLJuMyWyU8FTgH2i8JfTzxbuShrl2MiMAP53Jhw9WsR+r2/ztZbHN/
	OfJaa2PPqK//pmwPsAwGha3HS8bHf1xaVDMatIuiS6SbKjPsyfeqimfcN0QcxEK5LgYBzGdaCg/Mf
	Jye8e5Bhte7ndMusU2TFdpbIbPQgo0yrMC2lu2Ml1IdzLYy27QjZ2kfchiC0PkrTVMKql5Eg/JdTr
	KkMi8XGg==;
Received: from ip6-localhost ([::1]:44846 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uUWUH-007rA2-40; Wed, 25 Jun 2025 20:12:53 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32]:53657) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uUSpC-007qPp-38
 for samba-technical@lists.samba.org; Wed, 25 Jun 2025 16:18:16 +0000
Received: by mail-qv1-xf32.google.com with SMTP id
 6a1803df08f44-6face367320so1044786d6.3
 for <samba-technical@lists.samba.org>; Wed, 25 Jun 2025 09:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750868292; x=1751473092; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WfT2F4WO2WkloBm9pwG8+Zygrf5do3v691T8Lv7s6Gs=;
 b=fnhguFGdTj+nvxnDX6f3zVXHBFJvlqvnilGk/dq9LcEo22lWrm5rSWQdOcA/Gbi3Yp
 xFi5ZDdzjY4nRjkdaZloUufuXL0cwOZl3xj9Y1xTb/W6gwYGztoDDaOQ7plm+TBEXtT9
 mGO7Kc6wssHR/ChlUmT5Cyc1ActxBk2ssAlNeBBCSUnW30IMnuhcHftOVGl0lEHLBkGn
 6uiZAs8AC32Tz1e587NFfZoqfWfzpHN0vkXV/LIQZ/HvI5K+kNPJFGSVz+g7md8h+D0Z
 mi1zMy6GpIAtj6qzq/tZ0Mcv3kfcNOESglFqKAjmGEgH2IuAdKUzF3RRpbVwwIb8GBeS
 noLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750868292; x=1751473092;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WfT2F4WO2WkloBm9pwG8+Zygrf5do3v691T8Lv7s6Gs=;
 b=tpswwQoRDMkSEdYHn/QdeOm4FJPp1VqWXG+kMZ18Kv8N277+Nq5vZt1U4T6RLQBXTn
 eU+6NqaOLA2DU6s/a6F1xT9UHOtYsdX5kf2ItcUVCosDJOCsBgTLgk15a3Otb0PX1AYf
 /YjqsDP7oPn0Kr/PR02UVWEHWEwOqxscTJw8TuMC58R951yk/fvZYxbDCAKJmKfgEn0V
 6t51esWkJzXbSblLH+qI2zhNWGqTRbLvkRNFs2CRaesSNeIFlAl1su8n23VKZdg525zI
 gznUyoC7LfQS90YtziMkm2KffGo8XsNl8itWsd4f+pESHYqwnM2sQo17gy0EEimJsoA8
 nqhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKFQ7jJ7Ia6r95tlnLuLTgKyWxRtXzURBr2ARqgDE7f92x/Ix4I2ReTT/aQzc3ZQZ+Jmgy5K0VuWDNfM1sJ6s=@lists.samba.org
X-Gm-Message-State: AOJu0YzOOD9Qr1UKVhj5yhykdpIs20iH0amgGmeTv0UwKhDNZAe2d0me
 GtJMTuIX5bAGlV1OV7XYPfCHEXQ0bTiZE0UME1Vw8iumyZnUMyuKxJFbmdPKwV0YtUJC2opr187
 xjFN4HpmLgum9hJjBgzqpoJ1ONNz402E=
X-Gm-Gg: ASbGncv1DWQ4VVyXq4SCWO71n/LBKsvlvi+MvfNOlqYU5Ac+yWYZ1mrYCgA7hE1xbZu
 qgGqAWqy+yaXqZnGa1qV5Wwyay2/R1CCNqDOETHNZvJ1RJKchsk6UaWi4ee6e/jXY1RF5vaJIRP
 M0PMXAsHKfZa9dCROb+BPqR2cobrNk7nLyuvX0QkrgpTmAQj3JVlsGC0HMP2tn8OgB2X0RrYoDH
 /fIhRxj2x3B09o=
X-Google-Smtp-Source: AGHT+IELVnY9tWrfOK3EsALn6P8OmKArGPKfHIvcM+6sdbam/jdoARe6b70fUsDAprc8WsO3jhu7dqTc4yo34L1olQk=
X-Received: by 2002:a05:6214:319e:b0:6fa:fddf:7343 with SMTP id
 6a1803df08f44-6fd5efac289mr66108346d6.23.1750868291450; Wed, 25 Jun 2025
 09:18:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250625081638.944583-1-metze@samba.org>
 <1288833.1750842098@warthog.procyon.org.uk>
In-Reply-To: <1288833.1750842098@warthog.procyon.org.uk>
Date: Wed, 25 Jun 2025 11:17:59 -0500
X-Gm-Features: Ac12FXzxnQoEVJkG624DXsVcwyPbnW2_OyENvdllI_HLO4Jis4ayKMsY_20entg
Message-ID: <CAH2r5mutiF0D6_SGSguYD2zbJCtZj454DQQMGO8JmJ9VtyqSmA@mail.gmail.com>
Subject: Re: [PATCH v2] smb: client: let smbd_post_send_iter() respect the
 peers max_send_size and transmit all data
To: David Howells <dhowells@redhat.com>
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
Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, Stefan Metzmacher <metze@samba.org>,
 stable+noautosel@kernel.org, Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Added to cifs-2.6.git for-next and updated with rb and tested-by from
David and tested-by from Meetakshi

On Wed, Jun 25, 2025 at 4:03=E2=80=AFAM David Howells <dhowells@redhat.com>=
 wrote:
>
> Stefan Metzmacher <metze@samba.org> wrote:
>
> > We should not send smbdirect_data_transfer messages larger than
> > the negotiated max_send_size, typically 1364 bytes, which means
> > 24 bytes of the smbdirect_data_transfer header + 1340 payload bytes.
> >
> > This happened when doing an SMB2 write with more than 1340 bytes
> > (which is done inline as it's below rdma_readwrite_threshold).
> >
> > It means the peer resets the connection.
> >
> > When testing between cifs.ko and ksmbd.ko something like this
> > is logged:
> >
> > client:
> >
> >     CIFS: VFS: RDMA transport re-established
> >     siw: got TERMINATE. layer 1, type 2, code 2
> >     siw: got TERMINATE. layer 1, type 2, code 2
> >     siw: got TERMINATE. layer 1, type 2, code 2
> >     siw: got TERMINATE. layer 1, type 2, code 2
> >     siw: got TERMINATE. layer 1, type 2, code 2
> >     siw: got TERMINATE. layer 1, type 2, code 2
> >     siw: got TERMINATE. layer 1, type 2, code 2
> >     siw: got TERMINATE. layer 1, type 2, code 2
> >     siw: got TERMINATE. layer 1, type 2, code 2
> >     CIFS: VFS: \\carina Send error in SessSetup =3D -11
> >     smb2_reconnect: 12 callbacks suppressed
> >     CIFS: VFS: reconnect tcon failed rc =3D -11
> >     CIFS: VFS: reconnect tcon failed rc =3D -11
> >     CIFS: VFS: reconnect tcon failed rc =3D -11
> >     CIFS: VFS: SMB: Zero rsize calculated, using minimum value 65536
> >
> > and:
> >
> >     CIFS: VFS: RDMA transport re-established
> >     siw: got TERMINATE. layer 1, type 2, code 2
> >     CIFS: VFS: smbd_recv:1894 disconnected
> >     siw: got TERMINATE. layer 1, type 2, code 2
> >
> > The ksmbd dmesg is showing things like:
> >
> >     smb_direct: Recv error. status=3D'local length error (1)' opcode=3D=
128
> >     smb_direct: disconnected
> >     smb_direct: Recv error. status=3D'local length error (1)' opcode=3D=
128
> >     ksmbd: smb_direct: disconnected
> >     ksmbd: sock_read failed: -107
> >
> > As smbd_post_send_iter() limits the transmitted number of bytes
> > we need loop over it in order to transmit the whole iter.
> >
> > Cc: Steve French <sfrench@samba.org>
> > Cc: David Howells <dhowells@redhat.com>
> > Cc: Tom Talpey <tom@talpey.com>
> > Cc: linux-cifs@vger.kernel.org
> > Cc: <stable+noautosel@kernel.org> # sp->max_send_size should be info->m=
ax_send_size in backports
> > Fixes: 3d78fe73fa12 ("cifs: Build the RDMA SGE list directly from an it=
erator")
> > Signed-off-by: Stefan Metzmacher <metze@samba.org>
>
> Reviewed-by: David Howells <dhowells@redhat.com>
> Tested-by: David Howells <dhowells@redhat.com>
>
>


--=20
Thanks,

Steve


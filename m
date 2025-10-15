Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 85819BDE890
	for <lists+samba-technical@lfdr.de>; Wed, 15 Oct 2025 14:48:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=K5nSTrhH2BKHdQ2lCNCKTv5b55Vmr09NnhD8LaRBaNE=; b=MNfyPfOkFDTBqlsp37EYSCTHId
	Vadpw/OEjJV7n2Uq5xKMeXoZ22oeZwMLZXUxMS4IsjVgYTrdpOemVb6Bzz81iXh4mH7Y9u9CIrqSG
	SZSqW2fl/SQr1U8JvAY/cb9X3yGWneyH2NWf3ULoWrF9/Yqp6lIczRBJBY6ANkXyBJw9eUl/1c5Zm
	+tM+/yz7skTmH009PX1aMnuoS5830IHsZ6BrDNCWn15aRm/aeXX+zkMvqeU/IGtoDDdUmc9XJ40UP
	D8jH8TuBxtqJIlOgW5KSb2Ax1pUaOIxprx38pvvAq9pRAMZyNv7aca4PsoXnqhipiwni9sxRI0frc
	MmZRm93w==;
Received: from ip6-localhost ([::1]:37780 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v90ut-007pe3-0V; Wed, 15 Oct 2025 12:47:43 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:61829) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v90un-007pdv-Op
 for samba-technical@lists.samba.org; Wed, 15 Oct 2025 12:47:40 +0000
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-81fdd5d7b59so96496576d6.3
 for <samba-technical@lists.samba.org>; Wed, 15 Oct 2025 05:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760532456; x=1761137256; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K5nSTrhH2BKHdQ2lCNCKTv5b55Vmr09NnhD8LaRBaNE=;
 b=ixg4oAlQzQMX2nTl3Z50kz7TV4W2TcaO4AwGxZtypHdew8r6byym26aOBIWZW5t/sX
 Kz7K3otpsPwkF7oUKm3pGOQg5Itgqwo3aIGij1OBm0chkI0nPOWa9gJyVOoOIbMB8Pqr
 uG04X2dg+mCjZfmVB/E3onhcGkg6MHs0g1qwUByeY9Fm4dW4Z349rAlldfla7cTnS7kO
 Fm5OArThCjs9+FSxUSlzhmOPFHTsf1vP8qzYT4jENQozcwxzYc19rpZ3BK0apWONWpKT
 pLm/VFfUTg/ODW2q62Zo/2pLoE/kIKRXIB7FyN+zGCskqxid0y4WYhgKghujVLkRnohJ
 nlDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760532456; x=1761137256;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K5nSTrhH2BKHdQ2lCNCKTv5b55Vmr09NnhD8LaRBaNE=;
 b=KZCMPTI0Zb/9fSCkOwWkzYKc2TnUCTy41tmvF7FLz9c6ypLLQGkzqssPmNMdKX9XaF
 QHiOE275JKiZpzhebJ6sFgQUG7l7YtwNukImlbHdpQvYHfXKiEfq0HMcpWA7tnUDT0eK
 C6/bSrIUMthfFV0caq1irspz+2yc0xhXGBu8ok3RNiJs4fKHObFdJYFq4PNVZNbCjui3
 VNKNkuIf6LjYX9MARBXbLs7M9DeC9vhYgY3H8gB6o1WWAV5leXp7sCKm+U7OVH1w1GbL
 E77bKAKm2FoHsZwhn2qYLuGfNNj5PLmHYpS0DghGP5d5HrIY+u0+5qMfaxwszt6t1tlT
 SXBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUv/r0L7ywXQMbO7+wSKJH52W70P/X2SFWgrxOgmOu5SKkK4OK6EUDPvYSHOigyThVjS+L1qysQjKvWVgoXeLk=@lists.samba.org
X-Gm-Message-State: AOJu0YzW3gNPobGWZIdx22uuhih3RYBrkFrxqZXgl8PMKDHr9G5kC439
 PS7kXkS3Tzc1SUwyAOUTuR65IS4GdI+8swforviFntbxcYPtr2sJHqzyR94tmwoDi5QIu/DTgo6
 M7DHZECjAQjTHnkeSPKj9fyEfEhW88j8=
X-Gm-Gg: ASbGncvh86WUV9p5QJDxo2661Gy3fq8Bnj+owMilOAK/nap50+gXdv4NQB8ovSyHRcf
 m6oOElaIJNooc6hh4J2bh2uXNEa6PdWmSqI9tr27eGqvUtE2P8USQeOiVN9iil5Dmxe5s2eesUM
 Nk7Q9gs5g0QjGZAyreK4QlV+bmK0M1CqMWxsG0lo+ByVi3LjHRE3wyPTTv/tNoSJatsEVeUuTjT
 S+YooVH7xzihtCXxZlGA6RMmaXCqCNN5X7EOBZHDXEpHomew8Z/7uPslt5tzxuSxjkcsFBtBElP
 +5IbGiaAyAFYqxcNF071w7MnVWX4BCtuwjyav0YAcTB78a3We1ChrAVX8f/1mIfaw6liyeyzcbD
 rRWLAR4Kc2BcphbbQ1jfVFkhF4h4XNVHgEwBsGCAf
X-Google-Smtp-Source: AGHT+IF62bqoQuCp73EEVfVxaaSqmFM+khKNICG0CY8KpU8GilmURda0BLy48rcxDI/e7CzdXtL18x9Coeinsage2Mk=
X-Received: by 2002:a05:6214:5007:b0:7e9:bba6:511c with SMTP id
 6a1803df08f44-87b20ff9c75mr352467346d6.5.1760532455726; Wed, 15 Oct 2025
 05:47:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1760295528.git.metze@samba.org>
 <6d275bab3ee66cf653c9e1e242a0a87efa352063.1760295528.git.metze@samba.org>
 <7af986c8-7050-4b51-962e-dc3984ee1f58@samba.org>
In-Reply-To: <7af986c8-7050-4b51-962e-dc3984ee1f58@samba.org>
Date: Wed, 15 Oct 2025 07:47:22 -0500
X-Gm-Features: AS18NWCp2w-q0vpSgOTKtiWRl-iepuEymc9PaYb5Xdb57OMr96NlZvWm4yo_dxM
Message-ID: <CAH2r5mtW+FJ2mK_DwEDWY1J222o3BrRivE+j7h0+npVOgDvmXg@mail.gmail.com>
Subject: Re: [PATCH 10/10] smb: client: let destroy_mr_list() keep
 smbdirect_mr_io memory if registered
To: Stefan Metzmacher <metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

cifs-2.6.git for-next updated with newer version of  "smb: client: let
destroy_mr_list() keep smbdirect_mr_io memory if registered"

Let me know if additional changes needed or if you spot any issues

On Wed, Oct 15, 2025 at 2:20=E2=80=AFAM Stefan Metzmacher <metze@samba.org>=
 wrote:
>
> Hi Steve,
>
> as already discussed, one additional hunk is needed...
>
> > @@ -2402,6 +2448,9 @@ static int allocate_mr_list(struct smbdirect_sock=
et *sc)
> >                       goto kzalloc_mr_failed;
> >               }
> >
> > +             kref_init(&mr->kref);
> > +             mutex_init(&mr->mutex);
> > +
> >               mr->mr =3D ib_alloc_mr(sc->ib.pd,
> >                                    sc->mr_io.type,
> >                                    sp->max_frmr_depth);
>
> Here we're missing the following hunk:
>
> @@ -2483,6 +2483,7 @@ static int allocate_mr_list(struct smbdirect_socket=
 *sc)
>   kcalloc_sgl_failed:
>          ib_dereg_mr(mr->mr);
>   ib_alloc_mr_failed:
> +       mutex_destroy(&mr->mutex);
>          kfree(mr);
>   kzalloc_mr_failed:
>          destroy_mr_list(sc);
>
> I fixed it in my for-6.18/fs-smb-20251015-v2 branch,
> up to commit e4418cd1d5d80a8c24530ac0a41a5451c44f82bf.
> git fetch https://git.samba.org/metze/linux/wip.git for-6.18/fs-smb-20251=
015-v2
>
> The above hunk is the only difference to the current sfrench-cifs-2.6/for=
-next
> (at commit 7949ce089965bd025a8d46dbaa2f5d0a2bd4ec77), I only moved my com=
mits
> to the top. So you can just replace 7949ce089965bd025a8d46dbaa2f5d0a2bd4e=
c77 by
> e4418cd1d5d80a8c24530ac0a41a5451c44f82bf.
>
> Thanks!
> metze
>


--=20
Thanks,

Steve


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E64B3BCFC87
	for <lists+samba-technical@lfdr.de>; Sat, 11 Oct 2025 22:01:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=hfL+PrpKvMN9jJeKubgjHEY0rwUSNs6+/9bmODOXmYo=; b=x4A91j402GiZ15SQe3E+0ZpJWp
	3sVYw/kZwta1/dgAWRnAtJixj2aN2+HBG/cM4ztO4Rg6SMMFREdCbNxeLp8NaM7Iv4FyD3LtjTOdL
	Gpw3hU9nrwtdxEOpXNX/dDh9eqQrbXC6bdQ0CSpnUt7/4VA9yRTTNw8CLjQeKj5qyoFIv6nueY0P+
	MNM9xvJNtwrGXg4KI6ziStcJr0fD/Q3mj0bV5mqXb6grJXNEBySlJ1pWAXVi4wfznycyHnwYfw6nT
	kdWjz8+YBo4EpnXJokBU8AlZG3ZyIfMRADEWi/x+zXh9M7TroznyntkDvPPyJqywkpgRA1PnwyxTX
	Gh/CGXbg==;
Received: from ip6-localhost ([::1]:38854 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v7fmA-007ZPi-W2; Sat, 11 Oct 2025 20:01:11 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:55426) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v7fm6-007ZPa-7S
 for samba-technical@lists.samba.org; Sat, 11 Oct 2025 20:01:08 +0000
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-80ff41475cdso58513556d6.2
 for <samba-technical@lists.samba.org>; Sat, 11 Oct 2025 13:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760212864; x=1760817664; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hfL+PrpKvMN9jJeKubgjHEY0rwUSNs6+/9bmODOXmYo=;
 b=L/n5gL5h1DD4H9+f2XDpzEIQoq8kIXio7kvHyLe66qgEOE10r8MoQpKo3VTAnEKmpi
 I5iGP4teXMxH7kn6o2vNWitKYUqa/+J18KHm3yMW03gZABCRXMKiONrmqrcXuL20MzK7
 ePf9DU7o2uo77aIjIJzKnqfbHFq6yhrxUFGgbUeHxMNN45+fBy07LWVdUATajy4XSVcb
 CgWhiZdY0/w75j7sds+yaFjgyYSMF5N5pUUsnWfeVjsCSNrvXq+5QpdPNbXTj173kMLZ
 22EIt3whsB4aJ6qxnkN+Klngzc4y53F8ypoHl5NxHOHkAgNUJTJ0AdhqjhPErscHDbBD
 qXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760212864; x=1760817664;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hfL+PrpKvMN9jJeKubgjHEY0rwUSNs6+/9bmODOXmYo=;
 b=r4g499+cl+7xQ4BvHqZDqYFAYJBK5JQG26OsIpzN3iTF6ARsP0sPsJ4NloAchcu9WR
 PWZ+ZFE0/bobCi8ZTo02CQyT7rVR90kmdEDUrO/3eW87a40N0ozcWYb7n5wiSCh5pObB
 qw0h7RINQOObJWW3qwOQ4tV/WysirKJDVtYhXH4/YKsa8N/Wdev4X4fLzUV/iDE7zLuP
 N4zne+cQ09/Cu7exxy+D/p6tWqbIrgndsOdYk5vvTnsGkrg4HRuQ/oIHr2Pktaj6k3gz
 f6TdyD228l7t0/sQw8ZMsIFz9fVrAutA6fkfI3Xg6/2uCvnNybvAHvEWkSWyS3EBtuoe
 Oe2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEbNF4ZohUYqDVCr/HEWOWqo3xN395+ENCckQCZrUKiuQ/HMxWAZ4NE/SBihE27w/wPS2GH7SzEnzolte+7tw=@lists.samba.org
X-Gm-Message-State: AOJu0YzGeUNgBEMLJFGy4JFz515bdUaOz29eI/m5UoV5+dYi02e/RxqN
 /FceBAkh/zwLP/Fcamd3Tz+BeDsOc2gpIMl+9+dizL9tuwWVf9Nbu06SqqZkVn5YMl9eP/4tYbZ
 X+IdyvJoigNILuelteHNgkWerznkP70s=
X-Gm-Gg: ASbGncugLPXERHBXnUXvnPmMq2CqOSdAZOwjMeIu1p3TPbwLNuzyBfNwrjkNnnqzXWH
 +7DrFXkRvtyf49xWjm/Mq8AHJlLi+N7NnGLr523t7x6B2jwAbC/9I2pPsyPu1PjHMV/bTi3sDDE
 zNdk17BTyeohueq4G/b3hA0fhHLYzEp/LSERa7l0mGFqZXSSvMyqm5h/XqqLzvvWOE38QYH43IU
 LIi0089F9dcAIOZKRW5OTcPTz+AoFYRFI88rfKu3Q6k2mBrlyt4eS4bqzMbMuQ4Rmx/6tZkxBg1
 OmfA6AQU6VZMqNz5WbEd5iiz2ldWFszR4nvH1AznEdxKzYnp5G6SxGEgXI/WlpumjqEnlEsmB1X
 aWgnITWELRqqlznPS8WVKloB1+JsCXKWHUJdEwuUO
X-Google-Smtp-Source: AGHT+IGPQgsa9k2a1Up8+w6cXCZMeV+WWQ7neAnv2u8rNwSSNXa4/xhGZLri+COAL8htLz8tCf0DrbfdaqC7StUYs9Q=
X-Received: by 2002:a05:6214:f23:b0:809:c3a1:27c8 with SMTP id
 6a1803df08f44-87b2efc2d9amr249718956d6.38.1760212864032; Sat, 11 Oct 2025
 13:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <f61abf77-4f12-4dc8-8b42-4bfe19aef174@web.de>
In-Reply-To: <f61abf77-4f12-4dc8-8b42-4bfe19aef174@web.de>
Date: Sat, 11 Oct 2025 15:00:52 -0500
X-Gm-Features: AS18NWCM0YwVW2bZ6DwJJ1L4nOwS-cEpGPRUjdlffaDFbiwcZQD4uBoAC9uA7ws
Message-ID: <CAH2r5mt7LOFRahepvnPyLb_f6-SsWXRkWZ=B+TB3bB-dLmZUcA@mail.gmail.com>
Subject: Re: [PATCH] smb: client: Return a status code only as a constant in
 sid_to_id()
To: Markus Elfring <Markus.Elfring@web.de>
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
Cc: linux-cifs@vger.kernel.org, Shyam Prasad N <sprasad@microsoft.com>,
 Paulo Alcantara <pc@manguebit.org>, kernel-janitors@vger.kernel.org,
 samba-technical@lists.samba.org, LKML <linux-kernel@vger.kernel.org>,
 Steve French <sfrench@samba.org>, Bharath SM <bharathsm@microsoft.com>,
 Tom Talpey <tom@talpey.com>, Qiujun Huang <hqjagain@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Fri, Oct 10, 2025 at 2:24=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 10 Oct 2025 21:04:16 +0200
>
> Return a status code without storing it in an intermediate variable.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  fs/smb/client/cifsacl.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/fs/smb/client/cifsacl.c b/fs/smb/client/cifsacl.c
> index 63b3b1290bed..ce2ebc213a1d 100644
> --- a/fs/smb/client/cifsacl.c
> +++ b/fs/smb/client/cifsacl.c
> @@ -339,7 +339,6 @@ int
>  sid_to_id(struct cifs_sb_info *cifs_sb, struct smb_sid *psid,
>                 struct cifs_fattr *fattr, uint sidtype)
>  {
> -       int rc =3D 0;
>         struct key *sidkey;
>         char *sidstr;
>         const struct cred *saved_cred;
> @@ -446,12 +445,12 @@ sid_to_id(struct cifs_sb_info *cifs_sb, struct smb_=
sid *psid,
>          * fails then we just fall back to using the ctx->linux_uid/linux=
_gid.
>          */
>  got_valid_id:
> -       rc =3D 0;
>         if (sidtype =3D=3D SIDOWNER)
>                 fattr->cf_uid =3D fuid;
>         else
>                 fattr->cf_gid =3D fgid;
> -       return rc;
> +
> +       return 0;
>  }
>
>  int
> --
> 2.51.0
>
>


--=20
Thanks,

Steve


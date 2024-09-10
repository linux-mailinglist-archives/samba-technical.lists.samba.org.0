Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 84489972990
	for <lists+samba-technical@lfdr.de>; Tue, 10 Sep 2024 08:31:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=IJ4nrcrs/k1qQl102+7XLuBeo+Tbgkt7HJYe02llZ/A=; b=FgJaiFMV5j6rLTzk4fWOK2xEIj
	CYPmA93aMw+tMX6xjeW3b4MyOShHfYD7wIHiQnbZiYnvLdUUDEN9lTFbXlWdIi85CNYw7nnVDZyh/
	2bca9RZzaJd+7p4fgLyQGwKDmoF5BYhmSJfWxWdcuZAcGjBqbRoGuD127MsZ5MCcGJMbKJU/Yo0i1
	f9P5/rSN/iv1BMWGubNG09PRTbNZTFiNsE+/qbiic6EE3aN8fwwi7XUY2sWwJe1RaSMCgLRPlDhbN
	ssUtDg4mdX/TAb3GPfYW5E2GBGjZ5Wx9xBQu6JcPKq/v0PiAT2xa8IUZdU8Zcu3huGdB2AILX2y+X
	h6mWeW8Q==;
Received: from ip6-localhost ([::1]:41048 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1snuP5-008BOe-87; Tue, 10 Sep 2024 06:31:07 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:56442) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1snuOx-008BOW-Nk
 for samba-technical@lists.samba.org; Tue, 10 Sep 2024 06:31:03 +0000
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5366fd6fdf1so297124e87.0
 for <samba-technical@lists.samba.org>; Mon, 09 Sep 2024 23:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725949858; x=1726554658; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IJ4nrcrs/k1qQl102+7XLuBeo+Tbgkt7HJYe02llZ/A=;
 b=Y5qTZQAwPH2Q3ZkyW7OUomy2vnrdLakf/siOwk4Qh2ovjcnI+79M2kehA4oUPED6hG
 ySl5iH0h8Oi+ddh/UX7RnrtHnFjXQxkFE+vnXl4XouRfCBrmBBnPu/J/oqeB2hS/FvVd
 bbjFlPM8Hf570zl+5venij56iZummY0cxOK8GY31M9QXoZ0sNhWSzDo/JP+fSYoge7Ic
 u60RSpg/AhAUn+VL147CwMEa1OOh0zsrsKrpvPPrPXg2OHz7605XMFbUmSMi/MRbv79e
 I9/1aJ4gp+4O7ywNwzjrim0GE+5Eguo1gfwOU1eJzy8s3d2giK68CuTFqvCCROprPMJn
 r5Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725949858; x=1726554658;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IJ4nrcrs/k1qQl102+7XLuBeo+Tbgkt7HJYe02llZ/A=;
 b=bipsKGVIQbmtdDlvU+AU6FSz6+oBFwHpM78yEnnY5YfYCjxX0HwVRPUhLt3zdu6MR+
 Ncbu14/8dCWNn99L/6IgTLCFh+rLYUKD0M3oQ2PJUNWNKmK24jGX+Yl2yjfpanf95K//
 0c8AT0KP8Lyl+MVlhSkyeCNkVAD0DRFz9OIbS9Eaga+GbpwjivHXHv2r8z4j3N4tihxk
 XWIwiKBIvqX6v66EHNzEAYEZ4+vFYXCEcPchKSpwAUfqRX84I9x5pwDFDpn/QS1D5KAx
 pu+tbR5Tj6uPs6ulTVoA9xHFmL8vaIjjNAsHTqAnnF3hAcJDuJf4dId4UV/VFViOen8s
 a3Gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAtJ7pIBqHyxBAKPMa3gex/3xibzDqMivwv64lkRO6tuGtYaI1nolkxu3i9DgVUCGifRDAiXwiqJlfWbHfeZ0=@lists.samba.org
X-Gm-Message-State: AOJu0YwCdsi0lrSHGschtKMkJKyjxbABSh12ukvyKZCkUMSJj0D5x5xk
 92G2ibppPvM6Vs+DXB4auC4v63KsQIbvoyW9yCGbHii8wXj1J1KnaPzdUCClBS/5UKe+Wx/Bn5F
 RVO6kWKmC21nDPdXxeZKFSTO/dNY=
X-Google-Smtp-Source: AGHT+IFOSlXYruaOL+tHCjzaJk85XUOG/a0mcGFk1uxlA+OH7ZcZd5T0rFpP0fLi2UIa2L4xIp+c6yS5+vz1sJO5IUc=
X-Received: by 2002:a05:6512:3f15:b0:52e:f2a6:8e1a with SMTP id
 2adb3069b0e04-536587b51f7mr10660826e87.29.1725949858123; Mon, 09 Sep 2024
 23:30:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240827085420.76655-1-shenlichuan@vivo.com>
 <CAH2r5mtEvkw-v6dr7KdxoA6kzhraEx06kosrYoD-p1kmkX7cgw@mail.gmail.com>
In-Reply-To: <CAH2r5mtEvkw-v6dr7KdxoA6kzhraEx06kosrYoD-p1kmkX7cgw@mail.gmail.com>
Date: Tue, 10 Sep 2024 01:30:46 -0500
Message-ID: <CAH2r5mvfMH6pW=6QwWEKyPHWnvuwA364KwVVirBj+irBi8DbRw@mail.gmail.com>
Subject: Re: [PATCH v1] smb: client: Use min() macro
To: Shen Lichuan <shenlichuan@vivo.com>
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
Cc: pc@manguebit.com, tom@talpey.com, sprasad@microsoft.com,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, sfrench@samba.org, bharathsm@microsoft.com,
 opensource.kernel@vivo.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Sat, Aug 31, 2024 at 11:43=E2=80=AFPM Steve French <smfrench@gmail.com> =
wrote:
>
> tentatively merged to cifs-2.6.git for-next-next (target for 6.12-rc)
> pending additional review and testing
>
> On Tue, Aug 27, 2024 at 3:54=E2=80=AFAM Shen Lichuan <shenlichuan@vivo.co=
m> wrote:
> >
> > Use the min() macro to simplify the function and improve
> > its readability.
> >
> > Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
> > ---
> >  fs/smb/client/cifsacl.c   | 2 +-
> >  fs/smb/client/smbdirect.c | 8 +++-----
> >  2 files changed, 4 insertions(+), 6 deletions(-)
> >
> > diff --git a/fs/smb/client/cifsacl.c b/fs/smb/client/cifsacl.c
> > index f5b6df82e857..2f9a1bb6e21c 100644
> > --- a/fs/smb/client/cifsacl.c
> > +++ b/fs/smb/client/cifsacl.c
> > @@ -187,7 +187,7 @@ compare_sids(const struct cifs_sid *ctsid, const st=
ruct cifs_sid *cwsid)
> >         /* compare all of the subauth values if any */
> >         num_sat =3D ctsid->num_subauth;
> >         num_saw =3D cwsid->num_subauth;
> > -       num_subauth =3D num_sat < num_saw ? num_sat : num_saw;
> > +       num_subauth =3D min(num_sat, num_saw);
> >         if (num_subauth) {
> >                 for (i =3D 0; i < num_subauth; ++i) {
> >                         if (ctsid->sub_auth[i] !=3D cwsid->sub_auth[i])=
 {
> > diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
> > index 7bcc379014ca..f307122b59fe 100644
> > --- a/fs/smb/client/smbdirect.c
> > +++ b/fs/smb/client/smbdirect.c
> > @@ -1584,11 +1584,9 @@ static struct smbd_connection *_smbd_get_connect=
ion(
> >         memset(&conn_param, 0, sizeof(conn_param));
> >         conn_param.initiator_depth =3D 0;
> >
> > -       conn_param.responder_resources =3D
> > -               info->id->device->attrs.max_qp_rd_atom
> > -                       < SMBD_CM_RESPONDER_RESOURCES ?
> > -               info->id->device->attrs.max_qp_rd_atom :
> > -               SMBD_CM_RESPONDER_RESOURCES;
> > +       conn_param.responder_resources =3D
> > +               min(info->id->device->attrs.max_qp_rd_atom,
> > +                   SMBD_CM_RESPONDER_RESOURCES);
> >         info->responder_resources =3D conn_param.responder_resources;
> >         log_rdma_mr(INFO, "responder_resources=3D%d\n",
> >                 info->responder_resources);
> > --
> > 2.17.1
> >
> >
>
>
> --
> Thanks,
>
> Steve



--=20
Thanks,

Steve


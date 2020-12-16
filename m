Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B65B32DC9BC
	for <lists+samba-technical@lfdr.de>; Thu, 17 Dec 2020 00:53:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=qJz+C0ERc2UWVYT1HQ+o8MvvqAQvC5TFrGvET7J2Bq8=; b=XyknLowLbFoSb5883jhbat6bcj
	ClHS0/3uFp0AhGG8SsWe1I0Bg3iG0ethlitu/pT2DSvrjxWUNGW77mLmEB4dbkR0XqslGkCYl4lku
	rAn/OZnkycJ8J5L807fGi/lIdeS4ioJqZiapeuQJiVyZPFRewR3tb5fT+hoSTz7jYap0IgoQDkoiX
	ChMjepV6xon6DZZk7D5vemMxpgCZWnn4uXw0/KEuus7L4x70gn1LcD6E9g64JY1RMoCiYMTC7TPxr
	R7Y7/Z2+WgsBLPSyWWvZaBRobU2bFthSLSDctyzFAAjpvff6rgjI6MxjxoSLHjOSDsSJyv6nSa7HH
	B6thMuhQ==;
Received: from ip6-localhost ([::1]:54196 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kpgbT-001jxL-Vc; Wed, 16 Dec 2020 23:53:08 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:40979) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kpgbN-001jxE-VM
 for samba-technical@lists.samba.org; Wed, 16 Dec 2020 23:53:04 +0000
Received: by mail-ej1-x633.google.com with SMTP id ce23so35295006ejb.8
 for <samba-technical@lists.samba.org>; Wed, 16 Dec 2020 15:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qJz+C0ERc2UWVYT1HQ+o8MvvqAQvC5TFrGvET7J2Bq8=;
 b=dPk9AUv1u9OkFt8XWIAKEWb46RTSJE7l+JBfanjKcDuBxEvETx9+vkf7PkimlMlQWB
 gvs5r6vklYvaNxObrtkhGzvONq8Z58OKD6j8mSdixXZGDnByb6WYTMBLXx4U9UTHYdYh
 BsuYkUwxRhIuacurwKxczlVr1JZCOomXw3IJwHexKnpIGd2IPpQUT+iDheCQt8FJUFJV
 aaaPXMeNO1in2smxqLDuZNnrnqdpLrIAYX/ABPpsiRfEkmyld2+d4P67eXB5Hw1HRNxi
 lJ6RHcAggzKHnyw5APWwJIymHZG/bskW5/zuvvpIZZW0l4LCREg8eUp8lzZ1VINe/I06
 NWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qJz+C0ERc2UWVYT1HQ+o8MvvqAQvC5TFrGvET7J2Bq8=;
 b=bvbi7F6I/xKqs0G2INk0WXk3V5E4uLtVmP2qzO5yHHgLNAmmtxQ+JA3GWmtJaappaV
 Wp8hxysIJ1f2E3jlQXQpG/+8xlbLCeJeXzE0hSHnbTqk6/psUeweOwGoHaEUiQX7JcFF
 +gcGrnfaOMvFG13EUCJ2aU/vcZhiKajU8z70J+8apRWAQSrwaQrKmU8RCRdJcGgWlhWj
 5fBH/1mvhxBPIGJtqQ3nSA34OhkKz7hQmpwSloXROIbu2ziShrBLx0o/jUOQjY47Yvi5
 8sS2IEiGdAjlHQBugPCPXQkq19jtXTyCbtOBKl2VX686fD8TFk4sf7niyr/OJQZZ8WhW
 ea0w==
X-Gm-Message-State: AOAM531IiAtE6ucob518gKid/pNJNmzzHqtaLWH30vyC+zsM9nrjBRoW
 QGamNXft+arqTLZBfzis23Zo6obqWPKwXbWz/A==
X-Google-Smtp-Source: ABdhPJyXpvnh+K0JgR++S3CLt+y8fG8gXwBbc3r33uipinIXXVZxyrKMZ2jM6qLDi4bVJo9AMmltVk8Yp+BOKcZUfKc=
X-Received: by 2002:a17:906:5290:: with SMTP id
 c16mr33844706ejm.188.1608162778880; 
 Wed, 16 Dec 2020 15:52:58 -0800 (PST)
MIME-Version: 1.0
References: <20201119214042.6113-1-pboris@amazon.com>
 <20201120214918.12517-1-pboris@amazon.com>
 <87lfe4d9v1.fsf@suse.com> <022C2616-108B-420D-BFA8-45D30122C945@amazon.com>
In-Reply-To: <022C2616-108B-420D-BFA8-45D30122C945@amazon.com>
Date: Wed, 16 Dec 2020 15:52:47 -0800
Message-ID: <CAKywueRpj_-o6NsWATgbANzFrVedpnu6d8LHukgpZ4XiJ88+tg@mail.gmail.com>
Subject: Re: [PATCH] Extend cifs acl utilities to handle SACLs
To: "Protopopov, Boris" <pboris@amazon.com>
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
Reply-To: Pavel Shilovsky <piastryyy@gmail.com>
Cc: "sfrench@samba.org" <sfrench@samba.org>,
 Boris Protopopov via samba-technical <samba-technical@lists.samba.org>,
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

No worries. I fixed the patch and re-pushed to the next branch. Thanks!
--
Best regards,
Pavel Shilovsky

=D0=BF=D1=82, 11 =D0=B4=D0=B5=D0=BA. 2020 =D0=B3. =D0=B2 08:11, Protopopov,=
 Boris via samba-technical
<samba-technical@lists.samba.org>:
>
> Hi, Aur=C3=A9lien,
>
> Thanks for pointing this out.
>
> Hi, Pavel,
>
> Sorry for the typo, can you plz tweak the patch prior to merge; alternati=
vely, I can resubmit if that is preferred.
>
> Boris.
>
> =EF=BB=BFOn 12/11/20, 3:30 AM, "Aur=C3=A9lien Aptel" <aaptel@suse.com> wr=
ote:
>
>     CAUTION: This email originated from outside of the organization. Do n=
ot click links or open attachments unless you can confirm the sender and kn=
ow the content is safe.
>
>
>
>     Boris Protopopov via samba-technical <samba-technical@lists.samba.org=
>
>     writes:
>
>     > Fixed error cases for insufficient privileges, added
>     > attribute not supported error case for getcifsacl.
>     >
>     > Signed-off-by: Boris Protopopov <pboris@amazon.com>
>     > ---
>     >  getcifsacl.c | 17 ++++++++++++++---
>     >  1 file changed, 14 insertions(+), 3 deletions(-)
>     >
>     > diff --git a/getcifsacl.c b/getcifsacl.c
>     > index 1c72e7c..c1974d3 100644
>     > --- a/getcifsacl.c
>     > +++ b/getcifsacl.c
>     > @@ -445,15 +445,26 @@ getxattr:
>     >                       free(attrval);
>     >                       bufsize +=3D BUFSIZE;
>     >                       goto cifsacl;
>     > -             } else if ((errno =3D=3D EPERM || errno =3D=3D EACCES=
) &&
>     > -                        !(strcmp(attrname, ATTRNAME_NTSD_FULL))) {
>     > +             } else if (errno =3D=3D EIO && !(strcmp(attrname, ATT=
RNAME_NTSD_FULL))) {
>     >                       /*
>     >                        * attempt to fetch SACL in addition to owner=
 and DACL via
>     >                        * ATTRNAME_NTSD_FULL, fall back to owner/DAC=
L via
>     >                        * ATTRNAME_ACL if not allowed
>     > +                      * CIFS client maps STATUS_PRIVILEGE_NOT_HELD=
 to EIO
>     >                        */
>     > -                     fprintf(stderr, "Insufficient permissions to =
fetch full descriptor for %s\n",
>     > +                     fprintf(stderr, "WARGNING: Insufficient privi=
ledges to fetch SACL for %s\n",
>
>     There's a typo WARGNING -> WARNING
>
>     --
>     Aur=C3=A9lien Aptel / SUSE Labs Samba Team
>     GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
>     SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnb=
erg, DE
>     GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=
=C3=BCnchen)
>
>


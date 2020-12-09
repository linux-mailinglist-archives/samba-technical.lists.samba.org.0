Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 101CD2D4EC8
	for <lists+samba-technical@lfdr.de>; Thu, 10 Dec 2020 00:29:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=HBGCvDZ8btLiNdbjDQMPCk46WdOWgEW6iZMTOpf7JIs=; b=yvF85Cwg5R4TFMCqz1owJWcgij
	C2oVydjtnX//pCncTqVc/uY3XEnLKL/qJNZzmnufNkt0fcoBQIxQR7an+5KrctYzbLzJbEDewaWVp
	xKDGr8IUpJbnu5vbkWhvG4d6pmX0H8lPXt6/6stod90T1PjpiaDNg1trlS8xmCm12bj4++GyDEfQe
	A0pDuwrxWD2DhCimdt+/atT0FkmjKNAYKjQ9TbqnnZz86wPCHbGNV7F35zJqOCXgsxO5zorkZ7aWM
	LENRDSk7omW0ZaNlUFHOtc6K5xOOP+OuYIRkzGidgsBjsPs530AYCDUNCABB0ym/sEODcQSI2+DFV
	CA5TB3tQ==;
Received: from ip6-localhost ([::1]:65124 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kn8tP-000Kz3-69; Wed, 09 Dec 2020 23:29:07 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:38049) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kn8tJ-000Kyw-Oy
 for samba-technical@lists.samba.org; Wed, 09 Dec 2020 23:29:03 +0000
Received: by mail-ed1-x542.google.com with SMTP id cw27so3512158edb.5
 for <samba-technical@lists.samba.org>; Wed, 09 Dec 2020 15:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HBGCvDZ8btLiNdbjDQMPCk46WdOWgEW6iZMTOpf7JIs=;
 b=j9C+7IcBjfWHnDVBhX5QDeVdAnIP0q3hXGo1v/qwhIibmG6Kb40YcQYolxX4eoIfvy
 Q29Gr2ukfCvTDPEe1rWLr62ZuRvV+wLy4Ss6P0H6w+Q02SsBJ1Il7aG3FNqp922Ma2hH
 ddzPlFFxeE02w0acY2uu3DwT2R9kPi961vFta0yyxAbciB74lbkPb4Wo6iq2mgOGjPkP
 2WdvjfBzNHJYVkk+Z4qeZB8XILbZoSd1BBznVVKqq1FMySbnOZw0y96WL9+boFFtQgWw
 G3cUMl2JX2bjGbPycgW1qX5OZKXPQHP+iszCyOna4rzC5h/kT0/WFEn+r56MM9MALaea
 NuMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HBGCvDZ8btLiNdbjDQMPCk46WdOWgEW6iZMTOpf7JIs=;
 b=CDxzUIeeon81HjHbZY7hyAqjmB89g8GHAMCkm5bEG3M41einqZz/EGuzthH4o2NC0J
 v3JmD26yO5PY2Eo0lEigLa0/2Hbc9eq7ISfYiq798y9aueMEMyEdjIO9X6uJWzl8o1Uy
 umqPrUcoCll1Aouc+rIKC2ICcOfIYZJAYoK7Ykj8u8KkO0beD9ZWrT3IMp8lwupOpUhF
 BdAX1R0BQChcXxuud+x2i67e5oBIYBaZBF3tNZbNmMcGfhkRbSq2T6rv/yxKrwUfsqYW
 FmpiqHctRjAChtBRGr1Vbpmg1CrBq8AziB15ySeKxrtwH7mjw12b9Yct18/aww8gmlTt
 NI/A==
X-Gm-Message-State: AOAM532AQkaJc9IMLyrARf05yhJxjyQYBaPUpd57doG/qziKfJ6OVZ43
 1M+7J3HunaFZpsm4oAJYWrIFtiMaNRUNUW+tQEJiDVk=
X-Google-Smtp-Source: ABdhPJwIpvUm63auonjG7fJqCGjCoKvpQdefiFc+bE4IOgZwpHLI05W6Ck4WyTbdh/Nh9uxQ3jR9ZPdYXu9XQLd6IRg=
X-Received: by 2002:a17:906:b793:: with SMTP id
 dt19mr3362895ejb.120.1607541138651; 
 Wed, 09 Dec 2020 11:12:18 -0800 (PST)
MIME-Version: 1.0
References: <20201119214042.6113-1-pboris@amazon.com>
 <20201120214918.12517-1-pboris@amazon.com>
In-Reply-To: <20201120214918.12517-1-pboris@amazon.com>
Date: Wed, 9 Dec 2020 11:12:07 -0800
Message-ID: <CAKywueTTWktt3pB5Auz0UxUOp47OowD6egb+WCuT-dQYxfvZUg@mail.gmail.com>
Subject: Re: [PATCH] Extend cifs acl utilities to handle SACLs
To: Boris Protopopov <pboris@amazon.com>
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
Cc: Steve French <sfrench@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Squashed the 2nd patch into the 1st and merged into "next". Please let
me know if you'd like those patches to go separately.
--
Best regards,
Pavel Shilovsky

=D0=BF=D1=82, 20 =D0=BD=D0=BE=D1=8F=D0=B1. 2020 =D0=B3. =D0=B2 14:07, Boris=
 Protopopov via samba-technical
<samba-technical@lists.samba.org>:
>
> Fixed error cases for insufficient privileges, added
> attribute not supported error case for getcifsacl.
>
> Signed-off-by: Boris Protopopov <pboris@amazon.com>
> ---
>  getcifsacl.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/getcifsacl.c b/getcifsacl.c
> index 1c72e7c..c1974d3 100644
> --- a/getcifsacl.c
> +++ b/getcifsacl.c
> @@ -445,15 +445,26 @@ getxattr:
>                         free(attrval);
>                         bufsize +=3D BUFSIZE;
>                         goto cifsacl;
> -               } else if ((errno =3D=3D EPERM || errno =3D=3D EACCES) &&
> -                          !(strcmp(attrname, ATTRNAME_NTSD_FULL))) {
> +               } else if (errno =3D=3D EIO && !(strcmp(attrname, ATTRNAM=
E_NTSD_FULL))) {
>                         /*
>                          * attempt to fetch SACL in addition to owner and=
 DACL via
>                          * ATTRNAME_NTSD_FULL, fall back to owner/DACL vi=
a
>                          * ATTRNAME_ACL if not allowed
> +                        * CIFS client maps STATUS_PRIVILEGE_NOT_HELD to =
EIO
>                          */
> -                       fprintf(stderr, "Insufficient permissions to fetc=
h full descriptor for %s\n",
> +                       fprintf(stderr, "WARGNING: Insufficient priviledg=
es to fetch SACL for %s\n",
>                                 filename);
> +                       fprintf(stderr, "          Fetching owner info an=
d DACL only\n");
> +                       attrname =3D ATTRNAME_ACL;
> +                       goto getxattr;
> +               } else if (errno =3D=3D EOPNOTSUPP && !(strcmp(attrname, =
ATTRNAME_NTSD_FULL))) {
> +                       /*
> +                        * no support for fetching SACL, fall back to own=
er/DACL via
> +                        * ATTRNAME_ACL
> +                        */
> +                       fprintf(stderr, "WARNING: CIFS client does not su=
pport fetching SACL for %s\n",
> +                               filename);
> +                       fprintf(stderr, "          Fetching owner info an=
d DACL only\n");
>                         attrname =3D ATTRNAME_ACL;
>                         goto getxattr;
>                 } else {
> --
> 2.23.3
>
>


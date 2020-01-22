Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D20661448E0
	for <lists+samba-technical@lfdr.de>; Wed, 22 Jan 2020 01:26:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=YJUFydQOHJtIkFbRTL42mdIWMgmFTOzV0gMgMMwvfKA=; b=hvt4ZA0FlHVpMIAYB1x6h3+X54
	Z+u940b6yiPMqlQkLnTWSm+o45mFfDRGLaWgSKdXCGliKz+VG80nvj/sH/Bkf+gzvtxDdSk5vqHl4
	bzo4WIzBG0wLbMYmAcmmjVK6yRzn/ohjS/XgL/nhwJfpeuI9XcztLF2vo8K0Acpp91KU8UmK2mXSl
	8EHbMRtbwV9H85SXvOJe0sPDA0DMBsblUbfKJhx0U2l1Pi5mTeEOtLBtj/+2YWUspRL3r61eiVS5y
	0jEjuQqUt0v8DCGxbS5phx70ZVwwcayDGb/8i8ufW7oYaCG1CLhu1ogsCk2na+aDiQXR3oLoPreLs
	RD4BkJSQ==;
Received: from localhost ([::1]:22622 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iu3qN-0049t8-6N; Wed, 22 Jan 2020 00:26:03 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:47036) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iu3qH-0049t1-PO
 for samba-technical@lists.samba.org; Wed, 22 Jan 2020 00:26:00 +0000
Received: by mail-wr1-x443.google.com with SMTP id z7so5376806wrl.13
 for <samba-technical@lists.samba.org>; Tue, 21 Jan 2020 16:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YJUFydQOHJtIkFbRTL42mdIWMgmFTOzV0gMgMMwvfKA=;
 b=kOD7sbiS54fVkCmUDaSJ/Ifj4slr5fXvFIqdD+9ZIbaKs2SU7+4NGzpHSPz8rPzM/K
 0TJ0qcm4rGgslJGUALjGuq9YkRxcPDNHSIkQiBC+GwU5/Dhc5cx8fNzDfeHF+1qbBOss
 aOR2ym9+69xyElRDWXWzFDVCVIT11l53Up96519e584IBzN5vun5Yw7K+R33/nval4TV
 sbM3m2uaXBBtgcaOSseHM3IbKqZQh2GsQ0NYGCnOlpUmacFOb/7VSstGdtB0qO6dufZm
 NR8ZXc4WZV5xGVyeE9AHR8fwfdmBixOPbMkaXDx8X2tJUepKBoIM/wZuCIQPAUdIiWha
 OJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YJUFydQOHJtIkFbRTL42mdIWMgmFTOzV0gMgMMwvfKA=;
 b=plu0bUno4FaO/3Rfnc5Tqj5S9aOYsLgw1Hj76wSAAJlckd9qgAq74jS3Rkrl7TFUtJ
 Z7UFyCGzqHwoQNTvnYkkdGO16MNtre0YIcg+gfItaYeJJdD8ZVzier7l9cNpUEhOZ2iY
 hJNSzXjEoAU70Xyz3fl04/3ozrrKZS1CcxKk+ouVd2VkFZa5pSfPtHrKJB4lGUTLa6tX
 H22J0QPf3MN+omLfxK2Fft6G6815k9+mPUpsmQVkdQS+XD8c3J7+n/BHVOmE8EwZacsS
 5W4Pm4qJqLz6ikolw46FVbjZDTtSY5Q7ZqGe1jmLjMoQ9VoV598GbHkLdmdeEgcnSuKd
 JLUQ==
X-Gm-Message-State: APjAAAVJnme/grMZQptpqV4XCgLPTMXM+oTvhZfxJvU+SC+A0EpVgxpK
 jepJiVtqHPhd+onip8G+aFfpnk6r9Nzt6eLxpwx7OFY=
X-Google-Smtp-Source: APXvYqzueXcfblW2WXruWbzzwxJmu4W6PRMjZ7QZst5r9WyXa3vPuMSS1uKlPQNqinr3X2iVN8Dr4RrKGCS9dGT5rA4=
X-Received: by 2002:a2e:9708:: with SMTP id r8mr17779288lji.92.1579652754963; 
 Tue, 21 Jan 2020 16:25:54 -0800 (PST)
MIME-Version: 1.0
References: <20200106163119.9083-1-boris.v.protopopov@gmail.com>
In-Reply-To: <20200106163119.9083-1-boris.v.protopopov@gmail.com>
Date: Tue, 21 Jan 2020 16:25:43 -0800
Message-ID: <CAKywueQu5sK8gbNurZw0qZppbAJ9C4myqzPdD_6vSVJw=LXPsQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] Convert owner and group SID offsets to LE format
To: Boris Protopopov <boris.v.protopopov@gmail.com>
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
Cc: Steve French <sfrench@samba.org>, linux-cifs <linux-cifs@vger.kernel.org>,
 sblbir@amazon.com, samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

=D0=BF=D0=BD, 6 =D1=8F=D0=BD=D0=B2. 2020 =D0=B3. =D0=B2 08:31, Boris Protop=
opov <boris.v.protopopov@gmail.com>:
>
> Convert owner and group SID offsets to LE format
> when writing to ntsd
>
> Signed-off-by: Boris Protopopov <boris.v.protopopov@gmail.com>
> ---
>  setcifsacl.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/setcifsacl.c b/setcifsacl.c
> index f3d0189..9a301e2 100644
> --- a/setcifsacl.c
> +++ b/setcifsacl.c
> @@ -114,12 +114,14 @@ copy_sec_desc(const struct cifs_ntsd *pntsd, struct=
 cifs_ntsd *pnntsd,
>         if (dacloffset <=3D osidsoffset) {
>                 /* owners placed at end of ACL */
>                 nowner_sid_ptr =3D (struct cifs_sid *)((char *)pnntsd + d=
acloffset + size);
> -               pnntsd->osidoffset =3D dacloffset + size;
> +               osidsoffset =3D dacloffset + size;
> +               pnntsd->osidoffset =3D htole32(osidsoffset);
>                 size =3D copy_cifs_sid(nowner_sid_ptr, owner_sid_ptr);
>                 bufsize +=3D size;
>                 /* put group SID after owner SID */
>                 ngroup_sid_ptr =3D (struct cifs_sid *)((char *)nowner_sid=
_ptr + size);
> -               pnntsd->gsidoffset =3D pnntsd->osidoffset + size;
> +               gsidsoffset =3D osidsoffset + size;
> +               pnntsd->gsidoffset =3D htole32(gsidsoffset);
>         } else {
>                 /*
>                  * Most servers put the owner information at the beginnin=
g,
> --
> 2.14.5
>

Merged into "next". Thanks!

--
Best regards,
Pavel Shilovsky


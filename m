Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5F565CCDD
	for <lists+samba-technical@lfdr.de>; Wed,  4 Jan 2023 07:17:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=3BavZglX0MPdgww54nttciFXCCwjf30VKpnky7JodDU=; b=lJQMDIZmhCiBGzZ0DfjMCSPpvt
	NlmY6qS1SI2fLDhd2qIB9vdXYBPSDd0TvyFGZvAha1vNJvuVeMF/wEvuowtMO36NXoaWlbjF2NN2Y
	PYewLp7Dl2QvpJ7v4PWP7Q5ZGJ1PfBD7B2bO2lC61btlawl/Rxzy/2AZQAFmRQJosWAf1HrTqFix9
	SqZu+Tjakgv04MefPrXphCItZj5FL3gf3/DtZxKbMWAmF+qW2deP2fCIfyvO7Mhly0jnSsZ20Ye60
	750sw+sp/dG5lkOTaK5+qfJ7wMUFj5LsEafn1BRxv6u0SwDxb8Ym/Y/0GaUm95ZU1gMQLlC3BW3yO
	b9XmghFA==;
Received: from ip6-localhost ([::1]:49746 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pCx4V-00EVZE-FQ; Wed, 04 Jan 2023 06:16:19 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:34512) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pCx4O-00EVZ5-Kf
 for samba-technical@lists.samba.org; Wed, 04 Jan 2023 06:16:14 +0000
Received: by mail-lj1-x233.google.com with SMTP id x37so27558941ljq.1
 for <samba-technical@lists.samba.org>; Tue, 03 Jan 2023 22:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3BavZglX0MPdgww54nttciFXCCwjf30VKpnky7JodDU=;
 b=Qq79tdd0yaMmHaZS5CCz9PBJlAk+Jf22rxPTc+IbPrbIaSvvLtAh5QSFvA9kz2Wlk1
 UVVtAqTO+mTALd1PqyQtyeBxLOuIidTjasPHSnfiDFJ42vCEZvoX693tBhvS1n5faX3f
 cKuJJ7knluPcW2fLqqfeGYa0/vMTJjUolL8pSWH9SrJvipIQVitww2za4hf9Vl26CYa5
 GYPVGftcdse+wdjTxs+4/mCaQ2FYrk2huSUzJpRTN8Fe9SP41wcAZBIk1Kx3gwA4aeq0
 vPA4XwjzU5ij9R8LkB+cxHAjH/a1aa9ht0Swd6gkz0105dB/5kGh9f5oIRLrEXi2UHqV
 BlYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3BavZglX0MPdgww54nttciFXCCwjf30VKpnky7JodDU=;
 b=4cqB8+xMkIlr0QDLPOJuQWA9Sdo8JqKx6Qjb/7g3ugeACWFSKrKEM24B5QVLvFAgEv
 IS2JbOcOQf/plW8SaRii+q59t2V612PfxxMQRXTRzg26GUSBXrAdcDipNvr5J7vYfPd/
 nytSvB03ELcvjTTZpb2N0SR8TQa9wp3mDFfDxUF2oZ7Rh3a2Np6DIBgb/7Tx+dS/Fvy2
 7JTZeeEl+LpKlWuRAaKDyuzcUxOaUaFje1CIAdKIW0gTDCbpPtXNLPLGDu75FwObsZI0
 ltxkPxm0GDVC4t2GUpjQRsdyD9jUMoa7/OzI5ytpFN9TCaxulbQFAkrP5IL4jTU2efe6
 qHkw==
X-Gm-Message-State: AFqh2kpQfy1/PW8WzJbVI22YkwmBL5Yx5vTNz9M2Pd45UdFrPkAM/AgQ
 /ucsME5D9r+wcVPFOEG0GF8GGlixsmo9zQq7L0E=
X-Google-Smtp-Source: AMrXdXuPZ2NjRL9c4q75G634zp+LrTt7Gko+NpayLpKB4m/3fmH1i5M+NaX/IcI0p+zg6t3FzzaojvJY0uB+impGCjE=
X-Received: by 2002:a05:651c:204f:b0:27f:dfc2:5037 with SMTP id
 t15-20020a05651c204f00b0027fdfc25037mr693060ljo.229.1672812971164; Tue, 03
 Jan 2023 22:16:11 -0800 (PST)
MIME-Version: 1.0
References: <20221229-cifs-kmap-v1-1-c70d0e9a53eb@intel.com>
 <13173438.uLZWGnKmhe@suse>
In-Reply-To: <13173438.uLZWGnKmhe@suse>
Date: Wed, 4 Jan 2023 00:15:59 -0600
Message-ID: <CAH2r5msJRmfwAnh1p23sN0VVkAJ7oovxxOYA3vUr+0o_p4WKog@mail.gmail.com>
Subject: Re: [PATCH] cifs: Fix kmap_local_page() unmapping
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
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
Cc: Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org,
 Paulo Alcantara <pc@cjr.nz>, Ira Weiny <ira.weiny@intel.com>,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next pending testing

On Thu, Dec 29, 2022 at 4:38 PM Fabio M. De Francesco
<fmdefrancesco@gmail.com> wrote:
>
> On gioved=C3=AC 29 dicembre 2022 23:04:46 CET Ira Weiny wrote:
> > kmap_local_page() requires kunmap_local() to unmap the mapping.  In
> > addition memcpy_page() is provided to perform this common memcpy
> > pattern.
> >
> > Replace the kmap_local_page() and broken kunmap() with memcpy_page()
> >
> > Fixes: d406d26745ab ("cifs: skip alloc when request has no pages")
> > Cc: Paulo Alcantara <pc@cjr.nz>
> > Cc: Steve French <sfrench@samba.org>
> > Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
> > Cc: linux-cifs@vger.kernel.org
> > Cc: samba-technical@lists.samba.org
> > Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> > ---
> >  fs/cifs/smb2ops.c | 9 ++-------
> >  1 file changed, 2 insertions(+), 7 deletions(-)
> >
> > diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
> > index dc160de7a6de..0d7e9bcd9f34 100644
> > --- a/fs/cifs/smb2ops.c
> > +++ b/fs/cifs/smb2ops.c
> > @@ -4488,17 +4488,12 @@ smb3_init_transform_rq(struct TCP_Server_Info
> *server,
> > int num_rqst,
> >
> >               /* copy pages form the old */
> >               for (j =3D 0; j < npages; j++) {
> > -                     char *dst, *src;
> >                       unsigned int offset, len;
> >
> >                       rqst_page_get_length(new, j, &len, &offset);
> >
> > -                     dst =3D kmap_local_page(new->rq_pages[j]) +
> offset;
> > -                     src =3D kmap_local_page(old->rq_pages[j]) +
> offset;
> > -
> > -                     memcpy(dst, src, len);
> > -                     kunmap(new->rq_pages[j]);
> > -                     kunmap(old->rq_pages[j]);
> > +                     memcpy_page(new->rq_pages[j], offset,
> > +                                 old->rq_pages[j], offset, len);
> >
> FWIW, it looks good to me...
>
> Reviewed-by: Fabio M. De Francesco
>
> Thanks,
>
> Fabio
> >               }
> >       }
> >
> >
> > ---
> > base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
> > change-id: 20221229-cifs-kmap-6700dabafcdf
> >
> > Best regards,
> > --
> > Ira Weiny <ira.weiny@intel.com>
>
>
>


--=20
Thanks,

Steve


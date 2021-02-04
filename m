Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E017E30EDA2
	for <lists+samba-technical@lfdr.de>; Thu,  4 Feb 2021 08:47:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=iLcUJdrs52W/hZid9oz/FacsNne9vdbJbV42t64F0Aw=; b=CseCXdGXwBC5VX8NcQ5CY0RYRJ
	6sNeVxrq5JVd/zN05SxUapztmWCYePVoC/lVgcI9d2QzYKEGMPPc8oHLT81EiqPcKFsn2JA07drGh
	Bifxcaoq0YKMKs7v0Ygb7/WllhzePNScFcILRphc/YiSeetkUou0t8jJk3PaygEIRfo5JtNCjOyip
	jSZatsa2daU30fiO6qm7Rd2YLV+f/ZM3i8BKOdQw+VoeCQLeA0OmWVHvbtFWtU2BRhrz2Icpg+d77
	yh8SeR3JKYtgtj2pzjhhMl8+qj6mxyBchdeXN5GViJra2gGR59OwqHhDbSbnn7JlzRzwtRoxxyIE6
	sEOimm/w==;
Received: from ip6-localhost ([::1]:62818 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l7ZL3-00Akp8-OT; Thu, 04 Feb 2021 07:46:05 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:41293) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l7ZKu-00Akp1-Mv
 for samba-technical@lists.samba.org; Thu, 04 Feb 2021 07:46:00 +0000
Received: by mail-yb1-xb30.google.com with SMTP id e132so2249514ybh.8
 for <samba-technical@lists.samba.org>; Wed, 03 Feb 2021 23:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iLcUJdrs52W/hZid9oz/FacsNne9vdbJbV42t64F0Aw=;
 b=YIy6eSaQCKRABjGAJmjLjMeT2noEKBrBc+GiGgbLQfZ+2b2CxW0S2ye78WrQBUBwU1
 8Dvtx+kWU9bokvCpjI2U/rBRjmbW8yK34ls0EOYn5pr0L4ORQR43Q2CXnFKu92gtxRzu
 x/5C/Qcn+XAvwZPMnBT6fH/rhNDoHfsBHPDVNHZHyNsYu8LhZGAt2Oe8d8dQg1XMmajJ
 GSoZtCihHei5jN+CE+wk69q0aG3QVlH9Kx/LfPGHzT5JONxkbyjTPDki/gzagQ/AYwTe
 B8UsI2zNWSs41OV+xnlLw4XyyFH+7tG4naxk1Qtz4FalDLr/ajG7K3vPjMCbBcssoOVY
 YLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iLcUJdrs52W/hZid9oz/FacsNne9vdbJbV42t64F0Aw=;
 b=XBjoLgqNCXtZYntdeyv7VB6khR5mBFjaBEuUJ5kJZXibPQAwfIKsHJ6nT25x0HXnk4
 AkZ1x89YYmSzeZ7gNkwmX5th7niAN84Lm4iS0PbzRciGl9TFON0E6z5k5gKfXI3YRffz
 dsSdmCV7gZYfvVP/TWnTkQJEeHpj8FZl+aYbQ/gM71nnVR1y1/oWhLiDi4vNsZ+uYcNi
 6Rq2upiq3TjyU/ShXrTzwgK6b2a4rvL4AppCW4SpNCIYsIvrSMR1sZ4398xFZ9aiZJwx
 7I7QJtNTz4j3Y/x5LKOClVNUmpXmWlO8Zzfl+cstWOSJ4tWsp6x0V5loR0AIV4hxNnRH
 8eaw==
X-Gm-Message-State: AOAM533bWoqeg9mEPja0U4GIKEHaDKDUTZFsK4by7aSYlkpwtFnQvZil
 INQTHRf9XQ31AnI4j/hLT3I4h3lUav9qo/adX6U=
X-Google-Smtp-Source: ABdhPJwOeTLKN8YpKLnkJZFUhvyxQRI5+GP/+JuEibEXrNFCRF/07ZnFA1LGGAOAt6nw20b8HTyb/tfbUw237JShgFc=
X-Received: by 2002:a25:380e:: with SMTP id f14mr10238494yba.185.1612424751804; 
 Wed, 03 Feb 2021 23:45:51 -0800 (PST)
MIME-Version: 1.0
References: <CANT5p=p60ahfnrxU=sazMszPaxWWp4YLKiDWkZs0mf8iie-TbQ@mail.gmail.com>
 <874kiw9ih7.fsf@suse.com>
In-Reply-To: <874kiw9ih7.fsf@suse.com>
Date: Wed, 3 Feb 2021 23:45:40 -0800
Message-ID: <CANT5p=p4OsxafPLiOfpY6JWVr1-sSB+nFgmY33fhybjtihW_HQ@mail.gmail.com>
Subject: Re: [PATCH] cifs: Changes made to crediting code to make debugging
 easier.
To: =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>
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
From: Shyam Prasad N via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shyam Prasad N <nspmangalore@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Steve French <smfrench@gmail.com>, sribhat.msa@outlook.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thanks Aur=C3=A9lien. Will test it out with 3.1.1.

Steve asked me to resend this as separate patches, so that it becomes
easier for the reviewer.
Will send out the updated set of patches soon.

Regards,
Shyam

On Mon, Feb 1, 2021 at 2:43 AM Aur=C3=A9lien Aptel <aaptel@suse.com> wrote:
>
> Shyam Prasad N <nspmangalore@gmail.com> writes:
> > Specifically, I keen on your views on the following:
> > @@ -1159,7 +1181,9 @@ compound_send_recv(const unsigned int xid,
> > struct cifs_ses *ses,
> >         /*
> >          * Compounding is never used during session establish.
> >          */
> > -       if ((ses->status =3D=3D CifsNew) || (optype & CIFS_NEG_OP))
> > +       if ((ses->status =3D=3D CifsNew) ||
> > +                       (optype & CIFS_NEG_OP) ||
> > +                       (optype & CIFS_SESS_OP))
> >                 smb311_update_preauth_hash(ses, rqst[0].rq_iov,
> >                                            rqst[0].rq_nvec);
> >
> > @@ -1224,7 +1248,9 @@ compound_send_recv(const unsigned int xid,
> > struct cifs_ses *ses,
> >         /*
> >          * Compounding is never used during session establish.
> >          */
> > -       if ((ses->status =3D=3D CifsNew) || (optype & CIFS_NEG_OP)) {
> > +       if ((ses->status =3D=3D CifsNew) ||
> > +                       (optype & CIFS_NEG_OP) ||
> > +                       (optype & CIFS_SESS_OP)) {
> >                 struct kvec iov =3D {
> >                         .iov_base =3D resp_iov[0].iov_base,
> >                         .iov_len =3D resp_iov[0].iov_len
>
> preauth should be updated for both negprot and sess_setup (except last
> response from server) so that looks correct. But ses->status will be
> CifsNew until its fully established (covering the SESS scenario) so this
> shouldn't change anything. You can test this code path by mounting with
> vers=3D3.1.1 with and without multichannel.
>
> Also there are no 80 columns limit anymore, I think it's more readable
> as 1 line.
>
> Cheers,
> --
> Aur=C3=A9lien Aptel / SUSE Labs Samba Team
> GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
> SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg,=
 DE
> GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=
=BCnchen)
>


--=20
Regards,
Shyam


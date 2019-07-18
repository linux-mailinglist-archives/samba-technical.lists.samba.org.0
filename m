Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAF26D48B
	for <lists+samba-technical@lfdr.de>; Thu, 18 Jul 2019 21:17:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Rx+6w8XptityNCdEgx5pTTlMbRzV7PLUr2FP+Exj/Ww=; b=sn0qOGtDte3Db5dIyRGQfZICww
	HVsFYDMZPCW7KNJ9NnyGWwlveLzwAWvMCZw0GxKYwjlO2oSCcd8DyBQsM/Pi66tcXJfS+Hcua1Xw5
	pUk8OD2trPbIdBDaPuvHhF3+y7zKnVChqA6TS7km45TkLRbb7HSbefsAgnum2Z7v1nAInEeoOjj8y
	QICe0f7OE21b08L0WoXGHUQafWv1kdyEI/LEJGW3MelatOFBSFjsjII7RYngN4GIDl9ah8eYRoXCC
	UhW1kC6Ev129HdT5X8aaMSP7rSnZPaZcVkOCZH6wj8yZLBAL1YYBhQYMmHEnp5em+tPaIOynk1dL7
	a8zTLrkA==;
Received: from localhost ([::1]:59792 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hoBtc-0010AZ-5d; Thu, 18 Jul 2019 19:16:52 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:41021) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hoBtX-0010AS-IL
 for samba-technical@lists.samba.org; Thu, 18 Jul 2019 19:16:49 +0000
Received: by mail-lj1-x242.google.com with SMTP id d24so28440264ljg.8
 for <samba-technical@lists.samba.org>; Thu, 18 Jul 2019 12:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Rx+6w8XptityNCdEgx5pTTlMbRzV7PLUr2FP+Exj/Ww=;
 b=Z5/jeRnwo3XyLf+X3ZoKp2KbGfNINKZGquH7fYcG7EGQFMSJ1My27nSwMVVu0XXE81
 uqP1mQuYHpHkl3fxryZ519UD7PnNFz8O8BVpXymgPmU3TWYCuq8QSUh8eMO4BsThgpjn
 9drGnDxFU4+kWg3CgMD8qFLE76kyMCWdYDqhIMTTfRm50bWu9bIyoUyyD3zTXnP25LY5
 IExaS5kOlf6SGFvvnR61QuhnMUYuR4mNPK+n1qkMBm1r4r/g2BWlIPYE94wn/025TVaA
 7oDxRKPfFimE3su3jQRBA8wXI8AV7YbeXWfSbiXox5MCcyil2NdY+SWjwRJsrv4WPALF
 aDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Rx+6w8XptityNCdEgx5pTTlMbRzV7PLUr2FP+Exj/Ww=;
 b=gNi04XNxmw6sOxysz4cyhxiapbk4fVPGAW3SJQZ3Li0HzQuXM62B+3bQzIgWqzgEnq
 PDxukuxZzMhk18ygNYoe9FV/wX+n+IPspTxweJM2+nOwBzQnNRhRe9wwOw5Vzce3j3aq
 Kose31tUURmn2hWkhfW4v2ZEdqX6JbYmKKTZqp8R5nE6+NodTXewoJYH0RmgPU7FCl4L
 7bsUrsS7VsTnIXWSOoYzEYedfG0haNzPAywPJqu/Pk51UI93mOAWKm+PNYiuh27+i6ea
 sUFPcRXjSY1qHAFf9iPXdOOFLPy659O9KL9QB8j3Vctcp/MXZA7EF7VOY9I80trPreMj
 90Ww==
X-Gm-Message-State: APjAAAWlYwWIjQ30Tm/S52TzoiLTE6VbnZVlMNNN2SPYYm6iirfjBOHH
 bEQOcnfZAyeiZaB2Mj4Ic7fV3++CrssHhz/9tw==
X-Google-Smtp-Source: APXvYqxXl7Cu8GUcPGMjyavqcwmw+SmdIOB5sgUavusLwqrHG7iC3Wv7lFBqrI9QMl4LvYt1JnvUA50/G8ABVne0inQ=
X-Received: by 2002:a05:651c:87:: with SMTP id
 7mr17585296ljq.184.1563477406566; 
 Thu, 18 Jul 2019 12:16:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mtn5SyUao9Y3f-_ubqgSV8t3RSj2fzAR9bE5ZQQ5dFcRQ@mail.gmail.com>
 <CAKywueQEk84q-3PNNvGQNYLc9DXfygy+75LNBfyTKRo-iFvmGw@mail.gmail.com>
 <CAH2r5mu4y69J4ChFhbejFhG50P5CnKLwKRUAZZ+C+aMx09Qg2Q@mail.gmail.com>
In-Reply-To: <CAH2r5mu4y69J4ChFhbejFhG50P5CnKLwKRUAZZ+C+aMx09Qg2Q@mail.gmail.com>
Date: Thu, 18 Jul 2019 12:16:35 -0700
Message-ID: <CAKywueQbwNiQsn70-Meu46pyGUCncYDKYLRD7SnyzqoAddGmUQ@mail.gmail.com>
Subject: Re: [SMB3][PATCH] Speed up open by skipping query
 FILE_INTERNAL_INFORMATION
To: Steve French <smfrench@gmail.com>
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
Reply-To: Pavel Shilovsky <pavel.shilovsky@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is good improvement at almost no cost! We should definitely get
this functionality in!

Best regards,
Pavel Shilovskiy

=D1=87=D1=82, 18 =D0=B8=D1=8E=D0=BB. 2019 =D0=B3. =D0=B2 11:46, Steve Frenc=
h <smfrench@gmail.com>:
>
> Also fyi - did some experiments today.  Perf across the open vfs entry
> point averaged about 20% better with the patch
>
> On Thu, Jul 18, 2019 at 12:37 PM Pavel Shilovsky
> <pavel.shilovsky@gmail.com> wrote:
> >
> > index 54bffb2a1786..e6a1fc72018f 100644
> > --- a/fs/cifs/smb2file.c
> > +++ b/fs/cifs/smb2file.c
> > @@ -88,14 +88,20 @@ smb2_open_file(const unsigned int xid, struct
> > cifs_open_parms *oparms,
> >   }
> >
> >   if (buf) {
> > - /* open response does not have IndexNumber field - get it */
> > - rc =3D SMB2_get_srv_num(xid, oparms->tcon, fid->persistent_fid,
> > + /* if open response does not have IndexNumber field - get it */
> > + if (smb2_data->IndexNumber =3D=3D 0) {
> >
> > What's about a server returning 0 for the IndexNumber?
> >
> > - if (rsp->OplockLevel =3D=3D SMB2_OPLOCK_LEVEL_LEASE)
> > - *oplock =3D smb2_parse_lease_state(server, rsp,
> > - &oparms->fid->epoch,
> > - oparms->fid->lease_key);
> > - else
> > +
> > + *oplock =3D smb2_parse_contexts(server, rsp, &oparms->fid->epoch,
> > +       oparms->fid->lease_key,
> > +       buf);
> > + if (*oplock =3D=3D 0) /* no lease open context found */
> >   *oplock =3D rsp->OplockLevel;
> >
> > oplock being 0 here probably means that the lease state which is
> > granted is NONE. You still need to keep if (rsp->OplockLevel =3D=3D
> > SMB2_OPLOCK_LEVEL_LEASE) gate.
> >
> >  /* See MS-SMB2 2.2.14.2.9 */
> >  struct on_disk_id {
> >
> > Please prefix the structure name with "create_".
> >
> > Best regards,
> > Pavel Shilovskiy
> >
> > =D1=87=D1=82, 18 =D0=B8=D1=8E=D0=BB. 2019 =D0=B3. =D0=B2 00:43, Steve F=
rench via samba-technical
> > <samba-technical@lists.samba.org>:
> > >
> > > Now that we have the qfid context returned on open we can cut 1/3 of
> > > the traffic on open by not sending the query FILE_INTERNAL_INFORMATIO=
N
> > >
> > >
> > >
> > > --
> > > Thanks,
> > >
> > > Steve
>
>
>
> --
> Thanks,
>
> Steve


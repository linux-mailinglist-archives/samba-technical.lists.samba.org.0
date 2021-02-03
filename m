Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E9F30D871
	for <lists+samba-technical@lfdr.de>; Wed,  3 Feb 2021 12:23:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=tu/+mTirw/K7owTpOJg7K1Mo5BLblRxTxQu8JK3/gac=; b=EwukeWmdRmNhjTB0HkCZko2Env
	G15fOPmbRtzIFDxfB5MWXfSJx54h3nYVTcuwleprS1gvkqJap+Trv/lYlNWLPfppOlR79qZ0X/qRp
	motc4Kv1bBuiHiw3qldOYnSbdoS2b0wO4BpxDycdWs/mgDNfIEtbVCSixmHEA7c+2g750Mexhj6Wk
	Se0KHuuqkxLjVNHjjJaWMJNonS3A6HbeTRfz8zXTgyzRIm4KQjvu/QvBX8OUAF/pleyLUfTzDwrxL
	pZAuBzY81Rnn/9J6PU88KOR1UGTV8O9ftqGg0pS//j1yVtaDQD1NTkmy83Tq95JmEMKPQpJzoKX7M
	MrhFhYtA==;
Received: from ip6-localhost ([::1]:42400 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l7GFO-00AUF5-6v; Wed, 03 Feb 2021 11:22:58 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:42031) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l7GFI-00AUEy-Ly
 for samba-technical@lists.samba.org; Wed, 03 Feb 2021 11:22:55 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id b187so9518696ybg.9
 for <samba-technical@lists.samba.org>; Wed, 03 Feb 2021 03:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tu/+mTirw/K7owTpOJg7K1Mo5BLblRxTxQu8JK3/gac=;
 b=QM9WFeEzEbMAP4HX5AqPMsNIyZyYjdnRHKPXqjYIN5Gd6eamJWmG6yT60m5RK2zIV7
 CbYNXhbH9z/v8496FbOARTHv/nlX549WfJW3aqbaOwW5yPJQfSn4sFbFj2Vmwuxj1A7o
 +MQgpYPWEorux5bg8fu2Ef7AuXVLSX3XXpJJOqca9d4S/XpbbKrN3qwQDM38M7pHBpIF
 kuJwTH7VkiQz1DH8rlBaOMqUPqcVKBoJekDe3ujjuaEinka7z1hA6ZmgInUCgU/WfIhz
 cqaTUPurTepjooyHC/QbcD3MTh8RJCufXw6PVpWIAmo03rRmoO/AoMbwsKbsO977Kg07
 14wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tu/+mTirw/K7owTpOJg7K1Mo5BLblRxTxQu8JK3/gac=;
 b=Pl1A4A6COFHPlkrJkrXV/aZyFH/jCl/yei3mYQzBaWgw7rO2NwLOcd/6plRUkNjFIR
 2E+0RAQi7NR6JqZFJjuKVMNekiftr87zSDYZD3Xda85BIwlFS0DILdNJke9VQxxXzsld
 bUgGcxz0Kyzs4bVzGD/OTjLwRJz9mNENO6KlAV74aA878q+G48CDE5Q8ef0yBHG5ma6t
 K270MSNkXyFbHADAmuJP3kc0QPSGdqp0BU+udjC9Q2znbHkvGfjcokcMrc6dZcBwbtcU
 3MDjaKX4FzELeTd/3LpkuJqBzUZfhcE9/XncbdHbN67VHtdZfmbrfOTazqFEu9UyCyWI
 +Xig==
X-Gm-Message-State: AOAM531ZSZw0Apg5MGSzqqzhAur4fyqIVwkb6APtuEYvnySVCBL1+leU
 +eAmHC3eiT8delRmFBgGjays72Mv2bYnMDTgXQQ=
X-Google-Smtp-Source: ABdhPJzksX8ExPMQjFfGcQgIs7J+2TtyxKUpIKuKJWG0o5ZSnYZ13keUCepotp6AJW4CaA2JQYMU5XFANJoJCvO4kAk=
X-Received: by 2002:a25:ce92:: with SMTP id x140mr3757458ybe.327.1612351368107; 
 Wed, 03 Feb 2021 03:22:48 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5mt7Z2wJTLFp1T0qtsrJb95FPKoffBN9WBM=JAi=HcyiOg@mail.gmail.com>
 <CAKywueTvFL7GA3he21XjX8fig73iT5OCAd=JjBq6OOwOavcehA@mail.gmail.com>
 <CAH2r5mv82FGWtU4PuojFuhYfYS61VX8trtihj8Zk1N5aG3Driw@mail.gmail.com>
In-Reply-To: <CAH2r5mv82FGWtU4PuojFuhYfYS61VX8trtihj8Zk1N5aG3Driw@mail.gmail.com>
Date: Wed, 3 Feb 2021 03:22:37 -0800
Message-ID: <CANT5p=ryavNegdVqJRua6BMHsXcD7brdaPdQJ24BTX44rZ0cxQ@mail.gmail.com>
Subject: Re: PATCH] smb3: include current dialect (SMB3.1.1) when version 3 or
 greater requested on mount
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
From: Shyam Prasad N via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shyam Prasad N <nspmangalore@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Reviewed the patch in for-next.
Looks good to me.

Reviewed-by: Shyam Prasad N <sprasad@microsoft.com>

Regards,
Shyam

On Tue, Feb 2, 2021 at 8:23 PM Steve French <smfrench@gmail.com> wrote:
>
> updated as suggested (see attached) and merged into cifs-2.6.git for-next
>
> On Tue, Feb 2, 2021 at 11:58 AM Pavel Shilovsky <piastryyy@gmail.com> wro=
te:
> >
> > =D0=BF=D0=BD, 1 =D1=84=D0=B5=D0=B2=D1=80. 2021 =D0=B3. =D0=B2 22:15, St=
eve French <smfrench@gmail.com>:
> > >
> > > SMB3.1.1 is the newest, and preferred dialect, and is included in
> > > the requested dialect list by default (ie if no vers=3D is specified
> > > on mount) but it should also be requested if SMB3 or later is request=
ed
> > > (vers=3D3 instead of a specific dialect: vers=3D2.1, vers=3D3.02 or v=
ers=3D3.0).
> > >
> > > Currently specifying "vers=3D3" only requests smb3.0 and smb3.02 but =
this
> > > patch fixes it to also request smb3.1.1 dialect, as it is the newest
> > > and most secure dialect and is a "version 3 or later" dialect (the in=
tent
> > > of "vers=3D3").
> > >
> > > Signed-off-by: Steve French <stfrench@microsoft.com>
> > > Suggested-by: Pavel Shilovsky <pshilov@microsoft.com>
> > > ---
> > >  fs/cifs/fs_context.c |  2 +-
> > >  fs/cifs/smb2pdu.c    | 19 +++++++++++++------
> > >  2 files changed, 14 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/fs/cifs/fs_context.c b/fs/cifs/fs_context.c
> > > index 5111aadfdb6b..479c24695281 100644
> > > --- a/fs/cifs/fs_context.c
> > > +++ b/fs/cifs/fs_context.c
> > > @@ -391,7 +391,7 @@ cifs_parse_smb_version(char *value, struct
> > > smb3_fs_context *ctx, bool is_smb3)
> > >   ctx->vals =3D &smb3any_values;
> > >   break;
> > >   case Smb_default:
> > > - ctx->ops =3D &smb30_operations; /* currently identical with 3.0 */
> > > + ctx->ops =3D &smb30_operations;
> > >   ctx->vals =3D &smbdefault_values;
> > >   break;
> > >   default:
> > > diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
> > > index 794fc3b68b4f..52625549c3b5 100644
> > > --- a/fs/cifs/smb2pdu.c
> > > +++ b/fs/cifs/smb2pdu.c
> > > @@ -814,8 +814,9 @@ SMB2_negotiate(const unsigned int xid, struct cif=
s_ses *ses)
> > >      SMB3ANY_VERSION_STRING) =3D=3D 0) {
> > >   req->Dialects[0] =3D cpu_to_le16(SMB30_PROT_ID);
> > >   req->Dialects[1] =3D cpu_to_le16(SMB302_PROT_ID);
> > > - req->DialectCount =3D cpu_to_le16(2);
> > > - total_len +=3D 4;
> > > + req->Dialects[2] =3D cpu_to_le16(SMB311_PROT_ID);
> > > + req->DialectCount =3D cpu_to_le16(3);
> > > + total_len +=3D 6;
> > >   } else if (strcmp(server->vals->version_string,
> > >      SMBDEFAULT_VERSION_STRING) =3D=3D 0) {
> > >   req->Dialects[0] =3D cpu_to_le16(SMB21_PROT_ID);
> > > @@ -848,6 +849,8 @@ SMB2_negotiate(const unsigned int xid, struct cif=
s_ses *ses)
> > >   memcpy(req->ClientGUID, server->client_guid,
> > >   SMB2_CLIENT_GUID_SIZE);
> > >   if ((server->vals->protocol_id =3D=3D SMB311_PROT_ID) ||
> > > +     (strcmp(server->vals->version_string,
> > > +      SMB3ANY_VERSION_STRING) =3D=3D 0) ||
> > >       (strcmp(server->vals->version_string,
> > >        SMBDEFAULT_VERSION_STRING) =3D=3D 0))
> > >   assemble_neg_contexts(req, server, &total_len);
> > > @@ -883,6 +886,9 @@ SMB2_negotiate(const unsigned int xid, struct cif=
s_ses *ses)
> > >   cifs_server_dbg(VFS,
> > >   "SMB2.1 dialect returned but not requested\n");
> > >   return -EIO;
> > > + } else if (rsp->DialectRevision =3D=3D cpu_to_le16(SMB311_PROT_ID))=
 {
> >
> > I think we should include comment "/* ops set to 3.0 by default for
> > default so update */" as in smbdefault case to improve readability.
> >
> > > + server->ops =3D &smb311_operations;
> > > + server->vals =3D &smb311_values;
> > >   }
> > >   } else if (strcmp(server->vals->version_string,
> > >      SMBDEFAULT_VERSION_STRING) =3D=3D 0) {
> > > @@ -1042,10 +1048,11 @@ int smb3_validate_negotiate(const unsigned in=
t
> > > xid, struct cifs_tcon *tcon)
> > >   SMB3ANY_VERSION_STRING) =3D=3D 0) {
> > >   pneg_inbuf->Dialects[0] =3D cpu_to_le16(SMB30_PROT_ID);
> > >   pneg_inbuf->Dialects[1] =3D cpu_to_le16(SMB302_PROT_ID);
> > > - pneg_inbuf->DialectCount =3D cpu_to_le16(2);
> > > - /* structure is big enough for 3 dialects, sending only 2 */
> > > + pneg_inbuf->Dialects[2] =3D cpu_to_le16(SMB311_PROT_ID);
> > > + pneg_inbuf->DialectCount =3D cpu_to_le16(3);
> > > + /* SMB 2.1 not included so subtract one dialect from len */
> > >   inbuflen =3D sizeof(*pneg_inbuf) -
> > > - (2 * sizeof(pneg_inbuf->Dialects[0]));
> > > + (sizeof(pneg_inbuf->Dialects[0]));
> > >   } else if (strcmp(server->vals->version_string,
> > >   SMBDEFAULT_VERSION_STRING) =3D=3D 0) {
> > >   pneg_inbuf->Dialects[0] =3D cpu_to_le16(SMB21_PROT_ID);
> > > @@ -1053,7 +1060,7 @@ int smb3_validate_negotiate(const unsigned int
> > > xid, struct cifs_tcon *tcon)
> > >   pneg_inbuf->Dialects[2] =3D cpu_to_le16(SMB302_PROT_ID);
> > >   pneg_inbuf->Dialects[3] =3D cpu_to_le16(SMB311_PROT_ID);
> > >   pneg_inbuf->DialectCount =3D cpu_to_le16(4);
> > > - /* structure is big enough for 3 dialects */
> > > + /* structure is big enough for 4 dialects */
> > >   inbuflen =3D sizeof(*pneg_inbuf);
> > >   } else {
> > >   /* otherwise specific dialect was requested */
> > >
> > > --
> > > Thanks,
> > >
> > > Steve
> >
> > Looks good overall.
> >
> > Reviewed-by: Pavel Shilovsky <pshilov@microsoft.com>
> > --
> > Best regards,
> > Pavel Shilovsky
>
>
>
> --
> Thanks,
>
> Steve



--=20
Regards,
Shyam


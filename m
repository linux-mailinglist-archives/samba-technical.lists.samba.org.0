Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C15827DE9
	for <lists+samba-technical@lfdr.de>; Tue,  9 Jan 2024 05:42:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=I+MaGzSw3/QUMbGJ2pNKRoyhD2PK6ruOtlyc8Ghda58=; b=Vud9Md3sQCiexIA7dZ1J4nYcUw
	SIsSllVjYl3rUqDDGOOb0RJvETaBvGvwuH5jaFgLestUDNr4pyjrqiIi3tk9FzNCJk0CbvWAVieyD
	R9TOnSpAPQTAeYmjELTj/GEcCZoP3haDNmXD52JnO7RHNiAxF8HZ3fY4zQdjCNoAMmx+5miiO0WSQ
	EzrDhNT6+2aT259nY1p0NtFb9g/jeAz09A0ovrgQP4z/y3eXgXxg5szvkQr3k4OJ87Q7zhO8pGS7m
	JxLU3RNjC+4cOFwEq+AL8FTwFdzdDVL++uUPyBrG4PFIZhSbmuSbYC/rUGYFxxZvaQU2fMjz6XGgD
	FUixrSAA==;
Received: from ip6-localhost ([::1]:26520 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rN3w3-002qkl-MY; Tue, 09 Jan 2024 04:41:55 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236]:52647) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rN3vx-002qke-7r
 for samba-technical@lists.samba.org; Tue, 09 Jan 2024 04:41:53 +0000
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2cc7b9281d1so32478491fa.1
 for <samba-technical@lists.samba.org>; Mon, 08 Jan 2024 20:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704775307; x=1705380107; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=I+MaGzSw3/QUMbGJ2pNKRoyhD2PK6ruOtlyc8Ghda58=;
 b=lewxXpO7NU5uO5yB/EK59s0RcM9lA1sBZoJU6AYl4n15wcjz4/9R+tMZx6CkSetGdA
 n6ylX69oemmpZUSxr9kjL2VJpH6ZwFYujpDNU3q26uJIfNUhbS/plfS3WvWwVisSLLZN
 U7OFZyTWeqbg9y0Pd6uvKCYNoft4u+Hi3Mb0VT3EwN8Af5oTtxC/4xZm6OSwi5aZHGUq
 pkepwTcm4tINgHjscKrn/6P8KpOv427Om5dvnqpCbzjir2OyUOn/+e1GabMt1rS33PJa
 b15is9Hxd1TwogNQ6GaJ8iiG6hj3zMTC7IUDHZ1NbYUFBf/Og0Wm4fgRfIW9EIIbHloF
 w7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704775307; x=1705380107;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I+MaGzSw3/QUMbGJ2pNKRoyhD2PK6ruOtlyc8Ghda58=;
 b=lepWK8fP07v/IAO0KMk+LSI2+GkneDQz0IbEsPgq5KKVd7hp3xB5gZDmznL2yRAxcN
 9yK96nxt1heYMhnFvg8CnrslDtZrblbl44O9gcLiCddKM0ArMI9y98XlNR6v56yGZ83U
 PfsXfGC3IDddJZXRogipp2Ak0VldvE37A4X7NBSYtoIqkW96+dF3ymbEevZYREncaInL
 RzF0wJvMGAdUTVec6UeZquG/DBc/w6FhmIy7WkVQgLvW1ndlV3Ldxq1kXzg8HKX/9QMw
 CeTiN2ZYF0iKNAIf22ZEmtMaeqdiJlQ/qQw390w3lx+SSSBLupxE9LkX1Nf7/IYRnu+P
 MvvA==
X-Gm-Message-State: AOJu0YzZsJNuP4h5XMchklWWC4xTNIfQIOsRoFhzv6Gf0KyNJbKdCwtn
 Mnv4sGYWHR485BY6fkBuVYlSNNNTwB2ZgScqrVw=
X-Google-Smtp-Source: AGHT+IHRojv8WFvlgFekjmDbBFUJiTIDJoOTbnz/ONms9vEbYS7wEgh+m6mZOOBWaQrnrqhJlGEuRF4zd84jD6F8QXE=
X-Received: by 2002:a2e:8091:0:b0:2cd:13bf:78d7 with SMTP id
 i17-20020a2e8091000000b002cd13bf78d7mr2062772ljg.10.1704775306831; Mon, 08
 Jan 2024 20:41:46 -0800 (PST)
MIME-Version: 1.0
References: <b628a706-d356-4629-a433-59dfda24bb94@moroto.mountain>
 <eac139a7-76d4-4067-8c25-15e30692aaf9@moroto.mountain>
 <4c6b12c9-0502-400a-b2ba-dad89ef4f652@wanadoo.fr>
In-Reply-To: <4c6b12c9-0502-400a-b2ba-dad89ef4f652@wanadoo.fr>
Date: Mon, 8 Jan 2024 22:41:35 -0600
Message-ID: <CAH2r5mu0BnSuOcbG9L=Y0Hhe6GAtOxUJ1R4wkVmXn7A-Vgxndw@mail.gmail.com>
Subject: Re: [PATCH 2/3] cifs: make cifs_chan_update_iface() a void function
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Type: multipart/mixed; boundary="00000000000096091d060e7beea4"
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
Cc: Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>,
 Shyam Prasad N <sprasad@microsoft.com>, linux-cifs@vger.kernel.org,
 kernel-janitors@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>,
 Steve French <sfrench@samba.org>, Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--00000000000096091d060e7beea4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

added the trivial change Christophe Suggested


On Mon, Jan 8, 2024 at 1:09=E2=80=AFPM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> Le 08/01/2024 =C3=A0 10:08, Dan Carpenter a =C3=A9crit :
> > The return values for cifs_chan_update_iface() didn't match what the
> > documentation said and nothing was checking them anyway.  Just make it
> > a void function.
> >
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >   fs/smb/client/cifsproto.h |  2 +-
> >   fs/smb/client/sess.c      | 17 +++++++----------
> >   2 files changed, 8 insertions(+), 11 deletions(-)
> >
> > diff --git a/fs/smb/client/cifsproto.h b/fs/smb/client/cifsproto.h
> > index afbab86331a1..a841bf4967fa 100644
> > --- a/fs/smb/client/cifsproto.h
> > +++ b/fs/smb/client/cifsproto.h
> > @@ -656,7 +656,7 @@ cifs_chan_is_iface_active(struct cifs_ses *ses,
> >                         struct TCP_Server_Info *server);
> >   void
> >   cifs_disable_secondary_channels(struct cifs_ses *ses);
> > -int
> > +void
> >   cifs_chan_update_iface(struct cifs_ses *ses, struct TCP_Server_Info *=
server);
> >   int
> >   SMB3_request_interfaces(const unsigned int xid, struct cifs_tcon *tco=
n, bool in_mount);
> > diff --git a/fs/smb/client/sess.c b/fs/smb/client/sess.c
> > index 775c6a4a2f4b..f7b216dd06b2 100644
> > --- a/fs/smb/client/sess.c
> > +++ b/fs/smb/client/sess.c
> > @@ -356,10 +356,9 @@ cifs_disable_secondary_channels(struct cifs_ses *s=
es)
> >
> >   /*
> >    * update the iface for the channel if necessary.
> > - * will return 0 when iface is updated, 1 if removed, 2 otherwise
> >    * Must be called with chan_lock held.
> >    */
> > -int
> > +void
> >   cifs_chan_update_iface(struct cifs_ses *ses, struct TCP_Server_Info *=
server)
> >   {
> >       unsigned int chan_index;
> > @@ -368,20 +367,19 @@ cifs_chan_update_iface(struct cifs_ses *ses, stru=
ct TCP_Server_Info *server)
> >       struct cifs_server_iface *old_iface =3D NULL;
> >       struct cifs_server_iface *last_iface =3D NULL;
> >       struct sockaddr_storage ss;
> > -     int rc =3D 0;
> >
> >       spin_lock(&ses->chan_lock);
> >       chan_index =3D cifs_ses_get_chan_index(ses, server);
> >       if (chan_index =3D=3D CIFS_INVAL_CHAN_INDEX) {
> >               spin_unlock(&ses->chan_lock);
> > -             return 0;
> > +             return;
> >       }
> >
> >       if (ses->chans[chan_index].iface) {
> >               old_iface =3D ses->chans[chan_index].iface;
> >               if (old_iface->is_active) {
> >                       spin_unlock(&ses->chan_lock);
> > -                     return 1;
> > +                     return;
> >               }
> >       }
> >       spin_unlock(&ses->chan_lock);
> > @@ -394,7 +392,7 @@ cifs_chan_update_iface(struct cifs_ses *ses, struct=
 TCP_Server_Info *server)
> >       if (!ses->iface_count) {
> >               spin_unlock(&ses->iface_lock);
> >               cifs_dbg(VFS, "server %s does not advertise interfaces\n"=
, ses->server->hostname);
> > -             return 0;
> > +             return;
> >       }
> >
> >       last_iface =3D list_last_entry(&ses->iface_list, struct cifs_serv=
er_iface,
> > @@ -434,7 +432,6 @@ cifs_chan_update_iface(struct cifs_ses *ses, struct=
 TCP_Server_Info *server)
> >       }
> >
> >       if (list_entry_is_head(iface, &ses->iface_list, iface_head)) {
> > -             rc =3D 1;
> >               iface =3D NULL;
> >               cifs_dbg(FYI, "unable to find a suitable iface\n");
> >       }
> > @@ -449,7 +446,7 @@ cifs_chan_update_iface(struct cifs_ses *ses, struct=
 TCP_Server_Info *server)
> >               }
> >
> >               spin_unlock(&ses->iface_lock);
> > -             return 0;
> > +             return;
> >       }
> >
> >       /* now drop the ref to the current iface */
> > @@ -478,13 +475,13 @@ cifs_chan_update_iface(struct cifs_ses *ses, stru=
ct TCP_Server_Info *server)
> >       chan_index =3D cifs_ses_get_chan_index(ses, server);
> >       if (chan_index =3D=3D CIFS_INVAL_CHAN_INDEX) {
> >               spin_unlock(&ses->chan_lock);
> > -             return 0;
> > +             return;
> >       }
> >
> >       ses->chans[chan_index].iface =3D iface;
> >       spin_unlock(&ses->chan_lock);
> >
> > -     return rc;
> > +     return;
>
> just remove this one?
>
> CJ
>
> >   }
> >
> >   /*
>
>


--=20
Thanks,

Steve

--00000000000096091d060e7beea4
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0017-cifs-remove-unneeded-return-statement.patch"
Content-Disposition: attachment; 
	filename="0017-cifs-remove-unneeded-return-statement.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lr5v6ymp0>
X-Attachment-Id: f_lr5v6ymp0

RnJvbSBhM2Y3NjNmZGNiMmY3ODRjMzU1YWVkNjZkZGFjNjc0OGZmOGRiZmE2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IE1vbiwgOCBKYW4gMjAyNCAyMjozNzoxMCAtMDYwMApTdWJqZWN0OiBbUEFUQ0ggMTcv
MTddIGNpZnM6IHJlbW92ZSB1bm5lZWRlZCByZXR1cm4gc3RhdGVtZW50CgpSZXR1cm4gc3RhdGVt
ZW50IHdhcyBub3QgbmVlZGVkIGF0IGVuZCBvZiBjaWZzX2NoYW5fdXBkYXRlX2lmYWNlCgpTdWdn
ZXN0ZWQtYnk6IENocmlzdG9waGUgSmFpbGxldCA8Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28u
ZnI+ClNpZ25lZC1vZmYtYnk6IFN0ZXZlIEZyZW5jaCA8c3RmcmVuY2hAbWljcm9zb2Z0LmNvbT4K
LS0tCiBmcy9zbWIvY2xpZW50L3Nlc3MuYyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ZzL3NtYi9jbGllbnQvc2Vzcy5jIGIvZnMvc21iL2NsaWVu
dC9zZXNzLmMKaW5kZXggZjdiMjE2ZGQwNmIyLi5jZGU4MTA0MmJlYmQgMTAwNjQ0Ci0tLSBhL2Zz
L3NtYi9jbGllbnQvc2Vzcy5jCisrKyBiL2ZzL3NtYi9jbGllbnQvc2Vzcy5jCkBAIC00ODAsOCAr
NDgwLDYgQEAgY2lmc19jaGFuX3VwZGF0ZV9pZmFjZShzdHJ1Y3QgY2lmc19zZXMgKnNlcywgc3Ry
dWN0IFRDUF9TZXJ2ZXJfSW5mbyAqc2VydmVyKQogCiAJc2VzLT5jaGFuc1tjaGFuX2luZGV4XS5p
ZmFjZSA9IGlmYWNlOwogCXNwaW5fdW5sb2NrKCZzZXMtPmNoYW5fbG9jayk7Ci0KLQlyZXR1cm47
CiB9CiAKIC8qCi0tIAoyLjQwLjEKCg==
--00000000000096091d060e7beea4--


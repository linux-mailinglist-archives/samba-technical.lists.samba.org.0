Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 52110A676EE
	for <lists+samba-technical@lfdr.de>; Tue, 18 Mar 2025 15:53:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=JCX1OeueJixUkz6vpARB1ZP0NyY4RPNqrKaN8sBVG1c=; b=hi3ry7fcexiXiIHfPWuDGj8ocB
	jx4QZ+U+Cf1G74ILbVCCd/SInV9u9e83Yibt8FBwFNJJ8UdFPPQOVb7COR3VAUVFdHGgxiEPbwh1y
	UIAJaNlmIM7zDy32BbvggwVRo+M/xKJLBzhYFHVqbUizeg9GgcXYKhLS22J4kmcUZa8TMSmzS0mYW
	mLhmTUeaSksnRppdvsgmSLZHAwb7fm/+xdun3WblvnD7h7HR0WjYkxOQ9BIYHPEY9Ya0X0DyRoRac
	bAiTMGDZEtZNJNsHhD3z9Q9G3YycYWu3BOGsaAfJ7w1VHG+61NKbUTpwu50RxmVVQtFHJM6THFs5l
	JT7iUGdw==;
Received: from ip6-localhost ([::1]:42100 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tuYKF-00GUFe-VP; Tue, 18 Mar 2025 14:53:52 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:47299) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tuYKC-00GUFX-DK
 for samba-technical@lists.samba.org; Tue, 18 Mar 2025 14:53:50 +0000
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-30613802a04so65102471fa.2
 for <samba-technical@lists.samba.org>; Tue, 18 Mar 2025 07:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742309615; x=1742914415; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JCX1OeueJixUkz6vpARB1ZP0NyY4RPNqrKaN8sBVG1c=;
 b=MCVK8ulkzOr//co/j2WCbAyGKg7Vwh0JzSltPR9fMKZloM4Q7F94wirDBMdd3KF8VT
 zNxghjjaJLN95w8BehEYttYl5RR8y9GbBdkKs6SS9wHN53KivMNbRH8Tfr64YOqXycZ0
 VFhxE68cLcPpqVQxJExHp1hH5lOJ/XiR/F04XyhfKFTIdFYCs9FORmNQ7gTitgt5kv8D
 YdCS/lTCEZZhDF7DgMfTOmrxtps0dE0NyOF3CAILUWwUTzliKwraJ5ucSnRVVSQwzJWH
 AY3zEuLgWlqL0jX/Gh5z8RMWKvjzvOcoktBnzER2BaGIwzf33azNpunqXrGCLzMvZxNp
 7nww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742309615; x=1742914415;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JCX1OeueJixUkz6vpARB1ZP0NyY4RPNqrKaN8sBVG1c=;
 b=K4/06tPk2wNifreYommEbIyCPsZULEeIMXFyx/IZ41U8UH4Q0HloT6S5vlieTKx1dp
 M62JmNJpjhPkLJmvgm9UGYKrewz/VaOW/aAOce8K2kB07u0yxFOQb/tbu5QGqB9wF4rY
 CUvyB3o8cq/qO4hv/yL4Nne9IjJIq449GEiZOZagAzRlbDLI+dP66pfZzEcgSSdS8u5q
 Bg+0wpLAxCGHh2N4MKbMD6XyC8qloP3MjtNriUOeW+PsIfAO6CHE7YjoWw/y2ANt2Un1
 d/2h7ORRi3+6pmqfaZ/HXFiI8rQ3slxkFHtfWv3ixClZd8j4NkM/LkBtKR+sLptMrPpI
 bPWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUs/POT7bdBfcX4lRfrwxBWTzmxhAtfraFEL+rPOz071vUYfjgk5iZtFL3q3SqDOJtxTiBiqE3iDkOANRp6DI=@lists.samba.org
X-Gm-Message-State: AOJu0YzuBxv77eR+woHVNjjsM7P6iRRmX07D+4hTdzQkrHUwIT8yZFxV
 /y4CW5sZMuKLoRZBlQV2AfD0s85VVQbmLGXwv5HhL1wDkvoDdcoV1TYD7zgws488kJBxd3LE4Mc
 f897w1VD1JASnurUg7xVVB7fckVM=
X-Gm-Gg: ASbGncv+l+2f2pnbAT81b0/l0vhKclmsBoBmYS9dqyTAIM40bGjcRFkCGPdeBki1F6g
 UVWhNqU8KwVzibwerd98nh6jokncWzQIjg1xQ5BfEouJIYSODu5qG8Bg1NQMVKVvrH3AgQ0me9S
 sVZfb8uN6uf3C5JRQdxtautr/DnPNwRbNNyHU=
X-Google-Smtp-Source: AGHT+IEffRJcHBxfC84c0MY+7SqV/ayZZE4qWUDDWPAmJpHHYOTB3EnXbM/CwiNecCzYwD0ZPiPKnH340g79qGFMNp8=
X-Received: by 2002:a05:651c:2228:b0:30b:9813:afff with SMTP id
 38308e7fff4ca-30c9ff1deaamr33113881fa.31.1742309615305; Tue, 18 Mar 2025
 07:53:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mt4ej2EtMHAc9Vro325XoMA++iktxcx28k1OGte_sxhVg@mail.gmail.com>
 <20250318041821.24433-1-chunjie.zhu@cloud.com>
In-Reply-To: <20250318041821.24433-1-chunjie.zhu@cloud.com>
Date: Tue, 18 Mar 2025 09:53:23 -0500
X-Gm-Features: AQ5f1JpDrX6GZyeuHJBJpx7VHoQbSFC1uafX0BXtOfPZg30P5iV2D3cvq1le95g
Message-ID: <CAH2r5mv27yTcE3wjSOj1vQ8S1Lgbw3LdAevNtB5UiAF24yWoaw@mail.gmail.com>
Subject: Re: Re: [PATCH] open hardlink on deferred close file return EINVAL
To: Chunjie Zhu <chunjie.zhu@cloud.com>
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
Cc: pc@manguebit.com, linux-cifs@vger.kernel.org, sprasad@microsoft.com,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 lsahlber@redhat.com, sfrench@samba.org, tom@talpey.com,
 ross.lagerwall@cloud.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Wouldn't a simpler fix be to either not include the lease key when
opening the hardlink of the file which already has a lease on the
other filename? or alternatively don't request a lease at all on the
second open? or if we get the error invalid parameter then check if
the problem was the other open of the hardlink and either immediately
close it and reopen (if deferred close) or retry the open without
requesting leases?

Failing intentionally seems wrong

On Mon, Mar 17, 2025 at 11:19=E2=80=AFPM Chunjie Zhu <chunjie.zhu@cloud.com=
> wrote:
>
> If we run 2 applications on a CIFS client machine, one application opens =
file A,
> the other application opens file B which is hard link of file A, this iss=
ue would
> happen, as well.
>
> The purpose of this patch is to reduce the CIFS protocol network communic=
ation as
> we can decide how to responsd to application at client side.
>
> > It is fixed by running with leases disable (via mount parm), but
> > wouldn't it be better to fix the error so apps don't break.  Ideas?
> >
>
> Ideas,
>
> Extend SMB SMB_COM_OPEN_ANDX and SMB_COM_NT_CREATE_ANDX messages, add fil=
e alias
> into open or create request messages, an alias means a hard link of the o=
riginal
> file.
>
> > On Mon, Mar 17, 2025 at 3:41=3DE2=3D80=3DAFAM Chunjie Zhu <chunjie.zhu@=
cloud.com>=3D
> >  wrote:
> > >
> > > The following Python script results in unexpected behaviour when run =
on
> > > a CIFS filesystem against a Windows Server:
> > >
> > >     # Create file
> > >     fd =3D3D os.open('test', os.O_WRONLY|os.O_CREAT)
> > >     os.write(fd, b'foo')
> > >     os.close(fd)
> > >
> > >     # Open and close the file to leave a pending deferred close
> > >     fd =3D3D os.open('test', os.O_RDONLY|os.O_DIRECT)
> > >     os.close(fd)
> > >
> > >     # Try to open the file via a hard link
> > >     os.link('test', 'new')
> > >     newfd =3D3D os.open('new', os.O_RDONLY|os.O_DIRECT)
> > >
> > > The final open returns EINVAL due to the server returning
> > > STATUS_INVALID_PARAMETER. The root cause of this is that the client
> > > caches lease keys per inode, but the spec requires them to be related=
 to
> > > the filename which causes problems when hard links are involved:
> > >
> > > From MS-SMB2 section 3.3.5.9.11:
> > >
> > > "The server MUST attempt to locate a Lease by performing a lookup in =
the
> > > LeaseTable.LeaseList using the LeaseKey in the
> > > SMB2_CREATE_REQUEST_LEASE_V2 as the lookup key. If a lease is found,
> > > Lease.FileDeleteOnClose is FALSE, and Lease.Filename does not match t=
he
> > > file name for the incoming request, the request MUST be failed with
> > > STATUS_INVALID_PARAMETER"
> > >
> > > The client side can return EINVAL directly without invoking server
> > > operations. This reduces client server network communication overhead=
.
> > >
> > > Signed-off-by: Chunjie Zhu <chunjie.zhu@cloud.com>
> > > ---
> > >  fs/smb/client/cifsproto.h |  2 ++
> > >  fs/smb/client/file.c      | 29 +++++++++++++++++++++++++++++
> > >  2 files changed, 31 insertions(+)
> > >
> > > diff --git a/fs/smb/client/cifsproto.h b/fs/smb/client/cifsproto.h
> > > index 260a6299bddb..b563c227792e 100644
> > > --- a/fs/smb/client/cifsproto.h
> > > +++ b/fs/smb/client/cifsproto.h
> > > @@ -157,6 +157,8 @@ extern int cifs_get_writable_path(struct cifs_tco=
n *t=3D
> > con, const char *name,
> > >  extern struct cifsFileInfo *find_readable_file(struct cifsInodeInfo =
*, b=3D
> > ool);
> > >  extern int cifs_get_readable_path(struct cifs_tcon *tcon, const char=
 *na=3D
> > me,
> > >                                   struct cifsFileInfo **ret_file);
> > > +extern int cifs_get_hardlink_path(struct cifs_tcon *tcon, struct ino=
de *=3D
> > inode,
> > > +                                 struct file *file);
> > >  extern unsigned int smbCalcSize(void *buf);
> > >  extern int decode_negTokenInit(unsigned char *security_blob, int len=
gth,
> > >                         struct TCP_Server_Info *server);
> > > diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
> > > index 4cbb5487bd8d..0a66cce6e0ff 100644
> > > --- a/fs/smb/client/file.c
> > > +++ b/fs/smb/client/file.c
> > > @@ -751,6 +751,12 @@ int cifs_open(struct inode *inode, struct file *=
file=3D
> > )
> > >                 } else {
> > >                         _cifsFileInfo_put(cfile, true, false);
> > >                 }
> > > +       } else {
> > > +               /* hard link on the defeered close file */
> > > +               rc =3D3D cifs_get_hardlink_path(tcon, inode, file);
> > > +               if (rc) {
> > > +                       goto out;
> > > +               }
> > >         }
> > >
> > >         if (server->oplocks)
> > > @@ -2413,6 +2419,29 @@ cifs_get_readable_path(struct cifs_tcon *tcon,=
 con=3D
> > st char *name,
> > >         return -ENOENT;
> > >  }
> > >
> > > +int
> > > +cifs_get_hardlink_path(struct cifs_tcon *tcon, struct inode *inode,
> > > +                               struct file *file)
> > > +{
> > > +       struct cifsFileInfo *open_file =3D3D NULL;
> > > +       struct cifsInodeInfo *cinode =3D3D CIFS_I(inode);
> > > +       int rc =3D3D 0;
> > > +
> > > +       spin_lock(&tcon->open_file_lock);
> > > +       spin_lock(&cinode->open_file_lock);
> > > +
> > > +       list_for_each_entry(open_file, &cinode->openFileList, flist) =
{
> > > +               if (file->f_flags =3D3D=3D3D open_file->f_flags) {
> > > +                       rc =3D3D -EINVAL;
> > > +                       break;
> > > +               }
> > > +       }
> > > +
> > > +       spin_unlock(&cinode->open_file_lock);
> > > +       spin_unlock(&tcon->open_file_lock);
> > > +       return rc;
> > > +}
> > > +
> > >  void
> > >  cifs_writedata_release(struct kref *refcount)
> > >  {
> > > --
> > > 2.34.1
> > >
> > >
> >
> >
> > --=3D20
> > Thanks,
> >
> > Steve
> >



--=20
Thanks,

Steve


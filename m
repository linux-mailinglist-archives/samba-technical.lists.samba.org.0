Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 782EFA66304
	for <lists+samba-technical@lfdr.de>; Tue, 18 Mar 2025 00:52:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=jrBORXB5rVNSStbpGpwaCLo3Te5UtqGzW5H6VysXPyw=; b=Ek/whY+jbeJxvx62UETJBqeJX/
	/fL95VbG4QE1Jm1ZbNTy+MscxbmjfmH/ZGYvKcvSVuc7Ddt3nkEMbCTWdCmPGKepQ5KUHKZB6CS+B
	C434Eytxx3srlh9zrpwG6g5dsfWcXwZmDyqYYTbnj3bZMUE5bmds4JmILvwGSiizAVAXSzCrc0+tx
	JtMlbwPK2LFyMO24gkxh8lCMTZLYR2pJMpjIF0uc6O5zR0+f8Of5eaqHIB+9Vm3Ezf2ln2FCZuQLH
	afCARWlIM/VxxNAjhMhQZg7vCjecC1ijhdr8XLeKNiU/5+tZXm6u4NgD0doORRJmii62BQNeDY2Te
	u5QyavMQ==;
Received: from ip6-localhost ([::1]:47266 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tuKFc-00GRsP-1c; Mon, 17 Mar 2025 23:52:08 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:46534) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tuKFY-00GRsI-MH
 for samba-technical@lists.samba.org; Mon, 17 Mar 2025 23:52:06 +0000
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5495078cd59so5503778e87.1
 for <samba-technical@lists.samba.org>; Mon, 17 Mar 2025 16:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742255511; x=1742860311; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jrBORXB5rVNSStbpGpwaCLo3Te5UtqGzW5H6VysXPyw=;
 b=ilygLRVnitvAfnNGG0oLN0TUS7/C9yEuYvf55LWqDVL2oOJJaHf46F44+Ji6AZGYUA
 tNfInmWvud1K7+Th2hbFsTdSyJ8Jq2wkmeoWXz5OG0odC43xuY1QHTeULxLX8eVF2KxA
 ynOZcnJuH0B13RGLKyBovuK8i3mNi2jQthcJ6x9bSpCT50sL7MoWjueytvvvGXYapYVG
 td5mZGkpv88HY2Nj3pUfvv0LuWzNyD4W2hbIFm/2pZQuZGxof4/9TbIT2zJ9rWfX/65s
 cuZYjYBf6fvzqrf2wnIC0NBIpSFMHkvWeLbXQmC20o+s9li7ai8WCNTOODag3Fnqdm5m
 QxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742255511; x=1742860311;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jrBORXB5rVNSStbpGpwaCLo3Te5UtqGzW5H6VysXPyw=;
 b=cghmulmq+0+02fco664QzwL1fosST+BPBWIjwbu3rpZRCOQAzqoG5Sr3oYtdc/om6v
 /AkfGfg0CqZHRiXBBbYylzd/QGYv6TJJ6nLW6xZW3X9Wo09KLMNwTLMKqTnUngfZZpfq
 x7z8xOo1YEt44lGBb8nDEjC6wt4e0yVzuyYdXKIL5LAojBFBoh2bKSbGP/+acdREkHXs
 v2AbJ4X9qO7FWupVdJY9n606iGU5GmUm04oXF+xL2k/Z6o082DRIu6UH0HE0tEC8rB3A
 jXhplHXEQmDCrYiTAHwF3CRPRb3+gRwj13Cem5NOYuqpAA+e7B/ktpnHIlePeN4G/bAu
 ADbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7+85rDrVqDyov9+4Fa53YisTnQFk25s2jUQijpNZ0GW+So7ZccVGl0OdRvMHuPQoY4i1OsQxCGVZiL9uHEqk=@lists.samba.org
X-Gm-Message-State: AOJu0Yz4oZxR611+RDOY1r9GJt5dZV1zPgX3HJYR0KB1VMp88MtSGVYx
 f+Q6DS8tQU2/A1h/mIB7Rwy+xCTw4yOe2eoJnVkmPRuXp39B2p+4EfFo3I7WlXra5S58SxnMrBR
 3JzOb7gGcsHgd3yAc2fb2D4hgHIw=
X-Gm-Gg: ASbGncuTxM4kI6MVuSf69JcIOpZ85R0lsV/YVXFyW6NnGZC3+WenpOVY9lGIEQAs7jJ
 I6/8KsFZQbyYDGvFPbmiZam0URTbyXLoY7jzYSp85niAdTQ4+yPHFq6CernOvw3uEEMEjW4mBGN
 LayiqEZFCZnvw37XFXIniZhJKLkDK33gnBvvcGyARRpAXnkzG30BJBM0BaHhE=
X-Google-Smtp-Source: AGHT+IFJRlaXuYU5HaNxFuHLK4gwNm8IMoNUdEXbl+RJG0FG4H/1U6jGoe3AvVyP4HOsNboQlvozKZIcYSP5YLWR/28=
X-Received: by 2002:a05:6512:2345:b0:549:4d7d:b61b with SMTP id
 2adb3069b0e04-54a03cf4dddmr1782307e87.35.1742255510341; Mon, 17 Mar 2025
 16:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250317083915.20004-1-chunjie.zhu@cloud.com>
In-Reply-To: <20250317083915.20004-1-chunjie.zhu@cloud.com>
Date: Mon, 17 Mar 2025 18:51:39 -0500
X-Gm-Features: AQ5f1JrEQ1Pw0sXu7tJidiw44xYb6j4T_MP9tYTExTR0x3vMnxdeX9ZVEj5cUQ8
Message-ID: <CAH2r5mt4ej2EtMHAc9Vro325XoMA++iktxcx28k1OGte_sxhVg@mail.gmail.com>
Subject: Re: [PATCH] open hardlink on deferred close file return EINVAL
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
Cc: Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>,
 Shyam Prasad N <sprasad@microsoft.com>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 Ronnie Sahlberg <lsahlber@redhat.com>, Steve French <sfrench@samba.org>,
 ross.lagerwall@cloud.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I tried out the patch and it does fix getting STATUS_INVALID_PARAMETER
error from the server, but doesn't fix the issue of getting EINVAL

Traceback (most recent call last):
  File "/root/hl-test.py", line 15, in <module>
    newfd =3D os.open('new', os.O_RDONLY|os.O_DIRECT)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
OSError: [Errno 22] Invalid argument: 'new'

It is fixed by running with leases disable (via mount parm), but
wouldn't it be better to fix the error so apps don't break.  Ideas?

On Mon, Mar 17, 2025 at 3:41=E2=80=AFAM Chunjie Zhu <chunjie.zhu@cloud.com>=
 wrote:
>
> The following Python script results in unexpected behaviour when run on
> a CIFS filesystem against a Windows Server:
>
>     # Create file
>     fd =3D os.open('test', os.O_WRONLY|os.O_CREAT)
>     os.write(fd, b'foo')
>     os.close(fd)
>
>     # Open and close the file to leave a pending deferred close
>     fd =3D os.open('test', os.O_RDONLY|os.O_DIRECT)
>     os.close(fd)
>
>     # Try to open the file via a hard link
>     os.link('test', 'new')
>     newfd =3D os.open('new', os.O_RDONLY|os.O_DIRECT)
>
> The final open returns EINVAL due to the server returning
> STATUS_INVALID_PARAMETER. The root cause of this is that the client
> caches lease keys per inode, but the spec requires them to be related to
> the filename which causes problems when hard links are involved:
>
> From MS-SMB2 section 3.3.5.9.11:
>
> "The server MUST attempt to locate a Lease by performing a lookup in the
> LeaseTable.LeaseList using the LeaseKey in the
> SMB2_CREATE_REQUEST_LEASE_V2 as the lookup key. If a lease is found,
> Lease.FileDeleteOnClose is FALSE, and Lease.Filename does not match the
> file name for the incoming request, the request MUST be failed with
> STATUS_INVALID_PARAMETER"
>
> The client side can return EINVAL directly without invoking server
> operations. This reduces client server network communication overhead.
>
> Signed-off-by: Chunjie Zhu <chunjie.zhu@cloud.com>
> ---
>  fs/smb/client/cifsproto.h |  2 ++
>  fs/smb/client/file.c      | 29 +++++++++++++++++++++++++++++
>  2 files changed, 31 insertions(+)
>
> diff --git a/fs/smb/client/cifsproto.h b/fs/smb/client/cifsproto.h
> index 260a6299bddb..b563c227792e 100644
> --- a/fs/smb/client/cifsproto.h
> +++ b/fs/smb/client/cifsproto.h
> @@ -157,6 +157,8 @@ extern int cifs_get_writable_path(struct cifs_tcon *t=
con, const char *name,
>  extern struct cifsFileInfo *find_readable_file(struct cifsInodeInfo *, b=
ool);
>  extern int cifs_get_readable_path(struct cifs_tcon *tcon, const char *na=
me,
>                                   struct cifsFileInfo **ret_file);
> +extern int cifs_get_hardlink_path(struct cifs_tcon *tcon, struct inode *=
inode,
> +                                 struct file *file);
>  extern unsigned int smbCalcSize(void *buf);
>  extern int decode_negTokenInit(unsigned char *security_blob, int length,
>                         struct TCP_Server_Info *server);
> diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
> index 4cbb5487bd8d..0a66cce6e0ff 100644
> --- a/fs/smb/client/file.c
> +++ b/fs/smb/client/file.c
> @@ -751,6 +751,12 @@ int cifs_open(struct inode *inode, struct file *file=
)
>                 } else {
>                         _cifsFileInfo_put(cfile, true, false);
>                 }
> +       } else {
> +               /* hard link on the defeered close file */
> +               rc =3D cifs_get_hardlink_path(tcon, inode, file);
> +               if (rc) {
> +                       goto out;
> +               }
>         }
>
>         if (server->oplocks)
> @@ -2413,6 +2419,29 @@ cifs_get_readable_path(struct cifs_tcon *tcon, con=
st char *name,
>         return -ENOENT;
>  }
>
> +int
> +cifs_get_hardlink_path(struct cifs_tcon *tcon, struct inode *inode,
> +                               struct file *file)
> +{
> +       struct cifsFileInfo *open_file =3D NULL;
> +       struct cifsInodeInfo *cinode =3D CIFS_I(inode);
> +       int rc =3D 0;
> +
> +       spin_lock(&tcon->open_file_lock);
> +       spin_lock(&cinode->open_file_lock);
> +
> +       list_for_each_entry(open_file, &cinode->openFileList, flist) {
> +               if (file->f_flags =3D=3D open_file->f_flags) {
> +                       rc =3D -EINVAL;
> +                       break;
> +               }
> +       }
> +
> +       spin_unlock(&cinode->open_file_lock);
> +       spin_unlock(&tcon->open_file_lock);
> +       return rc;
> +}
> +
>  void
>  cifs_writedata_release(struct kref *refcount)
>  {
> --
> 2.34.1
>
>


--=20
Thanks,

Steve


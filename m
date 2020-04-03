Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD5919DD0A
	for <lists+samba-technical@lfdr.de>; Fri,  3 Apr 2020 19:46:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=3OG8lFAEpJ09PZ/amzynXTCfwlvvxyjDXOX5w5FKr+E=; b=0JAT6/EeX2ulh3Yam5l85lDKJZ
	KPE9e652FP+TjF9nRdFtV+4OtDMzNWB7Ke7tHCm73u9GIN+yILUu+vlHd/tayl+OLdmVIlY49zEKe
	m+wgvnIj2NBSy2dxT3qcWFdCQzHWgNf5u2wV9rKGkH2G6guJij+XezEBvu3ZjQyUml3XMNV/m5WB1
	B0JEhpq9DxrLL6Fqm8GgLzXrwgrv34hcbhNXK3jAe+sEafv3a3KjHWN+AjasI/+xB9uIwISAbafeG
	gyB1Cbvh7vXhaD5fq5X6o4AND8XwCbm8iyfi4I0+ZJizR6+aCDDHDE8SgrXjD59APXusxxzp90UTP
	1q+A5Gkw==;
Received: from localhost ([::1]:62712 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jKQOA-003Eys-4S; Fri, 03 Apr 2020 17:45:54 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:39665) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jKQO4-003Eyl-T8
 for samba-technical@lists.samba.org; Fri, 03 Apr 2020 17:45:51 +0000
Received: by mail-lj1-x243.google.com with SMTP id i20so7814013ljn.6
 for <samba-technical@lists.samba.org>; Fri, 03 Apr 2020 10:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3OG8lFAEpJ09PZ/amzynXTCfwlvvxyjDXOX5w5FKr+E=;
 b=c1EHZ+clPAWskLmSC3jpCk5UIX7b/XtexdwIcUD9HOrR8CtL/iTql9iWeBCfi256iD
 RllSfX0R8t+mX/Hw8j/25w3jsjKOdSerTOjRBQcUawF/q0GrY8h11x+Nt3d4xmAR34Rk
 0jReMQ0cq+XT0z5phNMO94+HLRB1kkH8ihdMCMSTGqBeEgAQ0TNbK4sObsaGMH04m8hq
 q5sU26F0NNBgpomrExzJGOF36nXHk479xi3z2mIuyA58AEB33efE7blAP7vIXx0KtZEx
 m+HYZ65UvXnzGg9JiauEUEgbDANbPvBvrQgJNgGtmwtHhv5P1nIWHSeW+drzSdOZT7Mp
 DI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3OG8lFAEpJ09PZ/amzynXTCfwlvvxyjDXOX5w5FKr+E=;
 b=sQ39n0lT6f89aTchZNam5yJokaR6dmw0n2rO4qCmVCf7xmmj8G+3ACDjdprWYAEFhT
 KYZN2qTXAxHx1S5IqyemZ/jjGOUNkwIcqUCZYbwgoJSM4sG2F+HciFHyup1qFd1WSKgr
 zHhPneV/W/NFRtc8wyX1XDXRWFg+VEyTAwye7zhaCQCr8Ib3DbcxpOgEQPiiac67VvNf
 cZpIiODdL3XiKuNtrNKHmrR+1uw/Up98LWhX3tINpg8QoZqyFqyWsr6Cs3ETxFMELJnt
 GdKBp5gulpb7Nmjk6kFFve2K+5lQoQS6oP29XlwP3cF2obbxrzkA7IZ5WIy+QTGzY9DU
 vIfg==
X-Gm-Message-State: AGi0PubfVCS2j+9+cPmxkxyhxsLuPrVfvokJ2pbOc0/IdB1+5uyTzowc
 yk8qiH2OP+VkFkuXXVCLeDnP0elzcJekJi2JT5DsrS8=
X-Google-Smtp-Source: APiQypKswfo9xNyj+/d6s59JkX9q1IJnDbYyFvHL6THRjzlPxz7q8rMYLs+JQ+FvfBscxHdQ7ZPTUdheclnNj16dBb0=
X-Received: by 2002:a2e:94cb:: with SMTP id r11mr5456019ljh.276.1585935946971; 
 Fri, 03 Apr 2020 10:45:46 -0700 (PDT)
MIME-Version: 1.0
References: <1585696903-96794-1-git-send-email-longli@linuxonhyperv.com>
In-Reply-To: <1585696903-96794-1-git-send-email-longli@linuxonhyperv.com>
Date: Fri, 3 Apr 2020 10:45:35 -0700
Message-ID: <CAKywueRg8kJ+0aOehM-QKGuRwbDSb2TA5vNje8eSCdMqBT+EdQ@mail.gmail.com>
Subject: Re: [PATCH] cifs: Allocate crypto structures on the fly for
 calculating signatures of incoming packets
To: Long Li <longli@microsoft.com>
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
 samba-technical <samba-technical@lists.samba.org>,
 Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

=D0=B2=D1=82, 31 =D0=BC=D0=B0=D1=80. 2020 =D0=B3. =D0=B2 16:22, <longli@lin=
uxonhyperv.com>:
>
> From: Long Li <longli@microsoft.com>
>
> CIFS uses pre-allocated crypto structures to calculate signatures for bot=
h
> incoming and outgoing packets. In this way it doesn't need to allocate cr=
ypto
> structures for every packet, but it requires a lock to prevent concurrent
> access to crypto structures.
>
> Remove the lock by allocating crypto structures on the fly for
> incoming packets. At the same time, we can still use pre-allocated crypto
> structures for outgoing packets, as they are already protected by transpo=
rt
> lock srv_mutex.
>
> Signed-off-by: Long Li <longli@microsoft.com>
> ---
>  fs/cifs/cifsglob.h      |  3 +-
>  fs/cifs/smb2proto.h     |  6 ++-
>  fs/cifs/smb2transport.c | 87 +++++++++++++++++++++++++----------------
>  3 files changed, 60 insertions(+), 36 deletions(-)
>
> diff --git a/fs/cifs/cifsglob.h b/fs/cifs/cifsglob.h
> index 0d956360e984..7448e7202e7a 100644
> --- a/fs/cifs/cifsglob.h
> +++ b/fs/cifs/cifsglob.h
> @@ -426,7 +426,8 @@ struct smb_version_operations {
>         /* generate new lease key */
>         void (*new_lease_key)(struct cifs_fid *);
>         int (*generate_signingkey)(struct cifs_ses *);
> -       int (*calc_signature)(struct smb_rqst *, struct TCP_Server_Info *=
);
> +       int (*calc_signature)(struct smb_rqst *, struct TCP_Server_Info *=
,
> +                               bool allocate_crypto);
>         int (*set_integrity)(const unsigned int, struct cifs_tcon *tcon,
>                              struct cifsFileInfo *src_file);
>         int (*enum_snapshots)(const unsigned int xid, struct cifs_tcon *t=
con,
> diff --git a/fs/cifs/smb2proto.h b/fs/cifs/smb2proto.h
> index 4d1ff7b66fdc..087d5f14320b 100644
> --- a/fs/cifs/smb2proto.h
> +++ b/fs/cifs/smb2proto.h
> @@ -55,9 +55,11 @@ extern struct cifs_ses *smb2_find_smb_ses(struct TCP_S=
erver_Info *server,
>  extern struct cifs_tcon *smb2_find_smb_tcon(struct TCP_Server_Info *serv=
er,
>                                                 __u64 ses_id, __u32  tid)=
;
>  extern int smb2_calc_signature(struct smb_rqst *rqst,
> -                               struct TCP_Server_Info *server);
> +                               struct TCP_Server_Info *server,
> +                               bool allocate_crypto);
>  extern int smb3_calc_signature(struct smb_rqst *rqst,
> -                               struct TCP_Server_Info *server);
> +                               struct TCP_Server_Info *server,
> +                               bool allocate_crypto);
>  extern void smb2_echo_request(struct work_struct *work);
>  extern __le32 smb2_get_lease_state(struct cifsInodeInfo *cinode);
>  extern bool smb2_is_valid_oplock_break(char *buffer,
> diff --git a/fs/cifs/smb2transport.c b/fs/cifs/smb2transport.c
> index 08b703b7a15e..c01e19a3b112 100644
> --- a/fs/cifs/smb2transport.c
> +++ b/fs/cifs/smb2transport.c
> @@ -40,14 +40,6 @@
>  #include "smb2status.h"
>  #include "smb2glob.h"
>
> -static int
> -smb2_crypto_shash_allocate(struct TCP_Server_Info *server)
> -{
> -       return cifs_alloc_hash("hmac(sha256)",
> -                              &server->secmech.hmacsha256,
> -                              &server->secmech.sdeschmacsha256);
> -}
> -
>  static int
>  smb3_crypto_shash_allocate(struct TCP_Server_Info *server)
>  {
> @@ -219,7 +211,8 @@ smb2_find_smb_tcon(struct TCP_Server_Info *server, __=
u64 ses_id, __u32  tid)
>  }
>
>  int
> -smb2_calc_signature(struct smb_rqst *rqst, struct TCP_Server_Info *serve=
r)
> +smb2_calc_signature(struct smb_rqst *rqst, struct TCP_Server_Info *serve=
r,
> +                       bool allocate_crypto)
>  {
>         int rc;
>         unsigned char smb2_signature[SMB2_HMACSHA256_SIZE];
> @@ -228,6 +221,8 @@ smb2_calc_signature(struct smb_rqst *rqst, struct TCP=
_Server_Info *server)
>         struct smb2_sync_hdr *shdr =3D (struct smb2_sync_hdr *)iov[0].iov=
_base;
>         struct cifs_ses *ses;
>         struct shash_desc *shash;
> +       struct crypto_shash *hash;
> +       struct sdesc *sdesc =3D NULL;
>         struct smb_rqst drqst;
>
>         ses =3D smb2_find_smb_ses(server, shdr->SessionId);
> @@ -239,24 +234,32 @@ smb2_calc_signature(struct smb_rqst *rqst, struct T=
CP_Server_Info *server)
>         memset(smb2_signature, 0x0, SMB2_HMACSHA256_SIZE);
>         memset(shdr->Signature, 0x0, SMB2_SIGNATURE_SIZE);
>
> -       rc =3D smb2_crypto_shash_allocate(server);
> -       if (rc) {
> -               cifs_server_dbg(VFS, "%s: sha256 alloc failed\n", __func_=
_);
> -               return rc;
> +       if (allocate_crypto) {
> +               rc =3D cifs_alloc_hash("hmac(sha256)", &hash, &sdesc);
> +               if (rc) {
> +                       cifs_server_dbg(VFS,
> +                                       "%s: sha256 alloc failed\n", __fu=
nc__);
> +                       return rc;
> +               }
> +               shash =3D &sdesc->shash;
> +       } else {
> +               hash =3D server->secmech.hmacsha256;
> +               shash =3D &server->secmech.sdeschmacsha256->shash;
>         }

smb2_crypto_shash_allocate() unconditionally allocated
server->secmech.hmacsha256 and server->secmech.sdeschmacsha256->shash.
Now the code doesn't allocate those variables at all. Unlike SMB3
where structures are allocated in during key generation, for SMB2 we
do it on demand in smb2_calc_signature(). So, the code above should be
changed to call smb2_crypto_shash_allocate() in "else" block.

--
Best regards,
Pavel Shilovsky


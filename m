Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 778D774FE36
	for <lists+samba-technical@lfdr.de>; Wed, 12 Jul 2023 06:31:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=8FEG/oH6gh544Z3hupFRjyPw2jcIZbPPkJZIsg/itb0=; b=vKfeuQjSG9n86z60o/k4YbgMeU
	7758GWlpC2Nbk/9t16FzTjUh/x6rHquePjmW34wbaix9IVVgRKVtp1v6xJ01GAena/9MlV/bntLzR
	Ievf4sv+iNlfzCIJLnOujK2vv5bEfsSvbcZ701WBMmrQPbG2HQS2nsnbQYxAw0zVDWvJGLzkgwf45
	eye1VjhgCWIyMA7fkyURaseUqvawoC3WkFUFzjzLZRNaK4R9RmgK8lhlNLbMFRhst9sQW1X/UJYqz
	G4fY/ijzJnf4FCVXF9ZaJZqL9jZRw5g425StcEa1DTB70p8DZ8bj2Vjd2eO+ZanJOy5ipV8vEDgEr
	fDYg3ghw==;
Received: from ip6-localhost ([::1]:64094 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qJRV6-001GwK-4N; Wed, 12 Jul 2023 04:30:52 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:56333) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qJRUx-001GwB-Ha
 for samba-technical@lists.samba.org; Wed, 12 Jul 2023 04:30:47 +0000
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b701dee4bfso106686001fa.0
 for <samba-technical@lists.samba.org>; Tue, 11 Jul 2023 21:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689136240; x=1691728240;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8FEG/oH6gh544Z3hupFRjyPw2jcIZbPPkJZIsg/itb0=;
 b=mGbit/QZhR5zf5HHGqic70EOrefPwZyYsBYoUr1mMVgh5v7Qbr7zEhj2GoCeJqxgPl
 Qb4UEyX5X059JCyQ6NJeoxIkqvMTZGePS8sW5CcPoELai4x+2XvU9jp1bDVpBMS/tEhO
 gccopfMxyVSXXqXO59N+wtSmFooWumUnHOTtN/j/FvDtgRrXR49WRLrAweqEGUL94z3y
 uK8KxwShzNK32Em0GlE51szEsnfNw+2pwMgeHP/zJteEJ3I45pKjDMMEiz8Zt1wKUKG9
 fz6J/AyU2j3lsmJplI9gpp48fiB98Ib75zpyTMN1ldMyQ6MJBhjNk3hMfIfTJSQNM59t
 fqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689136240; x=1691728240;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8FEG/oH6gh544Z3hupFRjyPw2jcIZbPPkJZIsg/itb0=;
 b=Wa6seapfFecaHWi3r9sbHqfi8cqlYEXWaf7XIdZUa385LfBYzSKEhNGmO9HgB/Tl4z
 bSaWRhs3CYv/oba6d/hieWMNS/lf+mwlsfDPdfOIDPReNWbd8lTu4WxX+87q9f3PZHbn
 jpmpIPc1xpjHwzZ30PmRDNQwXbNb5oaQ3fPp/XMhwElslHfGiCygqoQ+nY5Y84PPMaT8
 LPgpaor3JdDZ5pWEBYgI4iK8h8xiDxJKbCQnFJwateO/05KhJPTaruEljm8eT9lxPoFy
 boi2T2j0oXFQ+QpQZUPht0E/hrWGS9hZ8HwfZ73KhswVqKumMvxjkjJTod3KVQkfcmS4
 NSow==
X-Gm-Message-State: ABy/qLYahmT+Nmh6xzShYuhuFt6n9KT6DR7aiayMVzQ4PrE2YTAXDHKf
 IIndrm9fTjgCensR0HJR52R8w3SXOK5dFa/UpBo=
X-Google-Smtp-Source: APBJJlE40OEhJ2PYH91T4HIq5pcd6q70yeow9XhxzdrP/Z+spXJCkguhiExdfD1Jt8YBmYRMzz3wtEuVM4cmaQLivS8=
X-Received: by 2002:a2e:99d4:0:b0:2b4:765b:f6ee with SMTP id
 l20-20020a2e99d4000000b002b4765bf6eemr14552766ljj.41.1689136240040; Tue, 11
 Jul 2023 21:30:40 -0700 (PDT)
MIME-Version: 1.0
References: <ZK3h3+dHBGONHt+S@work>
In-Reply-To: <ZK3h3+dHBGONHt+S@work>
Date: Tue, 11 Jul 2023 23:30:28 -0500
Message-ID: <CAH2r5msw8i2Bx4NxWPWei6WGjusAHPSgm4s7c-haTtD+O9z4mQ@mail.gmail.com>
Subject: Re: [PATCH] smb: client: Fix -Wstringop-overflow issues
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
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
 linux-kernel@vger.kernel.org, samba-technical@lists.samba.org,
 Christian Brauner <brauner@kernel.org>, Ronnie Sahlberg <lsahlber@redhat.com>,
 Steve French <sfrench@samba.org>, linux-hardening@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

tentatively merged into cifs-2.6.git for-next pending testing

On Tue, Jul 11, 2023 at 6:20=E2=80=AFPM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
>
> pSMB->hdr.Protocol is an array of size 4 bytes, hence when the compiler
> analyzes this line of code
>
>         parm_data =3D ((char *) &pSMB->hdr.Protocol) + offset;
>
> it legitimately complains about the fact that offset points outside the
> bounds of the array. Notice that the compiler gives priority to the objec=
t
> as an array, rather than merely the address of one more byte in a structu=
re
> to wich offset should be added (which seems to be the actual intention of
> the original implementation).
>
> Fix this by explicitly instructing the compiler to treat the code as a
> sequence of bytes in struct smb_com_transaction2_spi_req, and not as an
> array accessed through pointer notation.
>
> Notice that ((char *)pSMB) + sizeof(pSMB->hdr.smb_buf_length) points to
> the same address as ((char *) &pSMB->hdr.Protocol), therefore this result=
s
> in no differences in binary output.
>
> Fixes the following -Wstringop-overflow warnings when built s390
> architecture with defconfig (GCC 13):
>   CC [M]  fs/smb/client/cifssmb.o
> In function 'cifs_init_ace',
>     inlined from 'posix_acl_to_cifs' at fs/smb/client/cifssmb.c:3046:3,
>     inlined from 'cifs_do_set_acl' at fs/smb/client/cifssmb.c:3191:15:
> fs/smb/client/cifssmb.c:2987:31: warning: writing 1 byte into a region of=
 size 0 [-Wstringop-overflow=3D]
>  2987 |         cifs_ace->cifs_e_perm =3D local_ace->e_perm;
>       |         ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
> In file included from fs/smb/client/cifssmb.c:27:
> fs/smb/client/cifspdu.h: In function 'cifs_do_set_acl':
> fs/smb/client/cifspdu.h:384:14: note: at offset [7, 11] into destination =
object 'Protocol' of size 4
>   384 |         __u8 Protocol[4];
>       |              ^~~~~~~~
> In function 'cifs_init_ace',
>     inlined from 'posix_acl_to_cifs' at fs/smb/client/cifssmb.c:3046:3,
>     inlined from 'cifs_do_set_acl' at fs/smb/client/cifssmb.c:3191:15:
> fs/smb/client/cifssmb.c:2988:30: warning: writing 1 byte into a region of=
 size 0 [-Wstringop-overflow=3D]
>  2988 |         cifs_ace->cifs_e_tag =3D  local_ace->e_tag;
>       |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
> fs/smb/client/cifspdu.h: In function 'cifs_do_set_acl':
> fs/smb/client/cifspdu.h:384:14: note: at offset [6, 10] into destination =
object 'Protocol' of size 4
>   384 |         __u8 Protocol[4];
>       |              ^~~~~~~~
>
> This helps with the ongoing efforts to globally enable
> -Wstringop-overflow.
>
> Link: https://github.com/KSPP/linux/issues/310
> Fixes: dc1af4c4b472 ("cifs: implement set acl method")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  fs/smb/client/cifssmb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/smb/client/cifssmb.c b/fs/smb/client/cifssmb.c
> index 19f7385abeec..9dee267f1893 100644
> --- a/fs/smb/client/cifssmb.c
> +++ b/fs/smb/client/cifssmb.c
> @@ -3184,7 +3184,7 @@ int cifs_do_set_acl(const unsigned int xid, struct =
cifs_tcon *tcon,
>         param_offset =3D offsetof(struct smb_com_transaction2_spi_req,
>                                 InformationLevel) - 4;
>         offset =3D param_offset + params;
> -       parm_data =3D ((char *) &pSMB->hdr.Protocol) + offset;
> +       parm_data =3D ((char *)pSMB) + sizeof(pSMB->hdr.smb_buf_length) +=
 offset;
>         pSMB->ParameterOffset =3D cpu_to_le16(param_offset);
>
>         /* convert to on the wire format for POSIX ACL */
> --
> 2.34.1
>


--=20
Thanks,

Steve


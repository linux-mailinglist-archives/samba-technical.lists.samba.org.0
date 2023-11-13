Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 438A77EA609
	for <lists+samba-technical@lfdr.de>; Mon, 13 Nov 2023 23:23:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=A2lUqDXZqftceSAE/EIfmIXCfWy49ECBlUcQBJOXPgk=; b=WHy1Oh7gjsIvDev/ulqAQU0BFP
	UR1EGF5vvLURrntPTWBIn51dc96RAv/zLkfJgNKzf4TIx/Idfd6V9DUwUMklWLOG+WYRP8aOL9v+q
	4SSsEa7C27+BVohStKJQbr74+3tK7EFejz70wk9RXerdDomR3MXV9H8i7jOh36vyHQb3YZPwvajGW
	4ymZHT0sIZEIjrpy8Tj0e0Oler7r/fTXC43hrUCIVuKTF2lTYTprVNKqlKVDsCSqZi1ga2yqEDbW0
	lggh7WAc9WTEWNZnogU3W/7fe4U2oZLZHDvy2VD4oQvImhAnPvZs2ofkE3uJKUwOvdojwgqom+fZs
	QASQ0UEg==;
Received: from ip6-localhost ([::1]:29950 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r2fLC-0089l7-1Q; Mon, 13 Nov 2023 22:23:34 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:50234) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r2fL2-0089ky-Ar
 for samba-technical@lists.samba.org; Mon, 13 Nov 2023 22:23:30 +0000
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-507ad511315so7144881e87.0
 for <samba-technical@lists.samba.org>; Mon, 13 Nov 2023 14:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699914203; x=1700519003; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A2lUqDXZqftceSAE/EIfmIXCfWy49ECBlUcQBJOXPgk=;
 b=UlncKJGbp0umt2RsO/5FSgJ5JL1emYrqd26/zH7dGYXHexWKugdUcMPllWbcYKxl7f
 e2Sl28JaOBM63hyYoQ5yvXnK/Ujl3MT7ISp1XdIW0Fa9FQ6zjYE1+cAUKqKH4ud6Kb8s
 eoeR9Q9v2PwG+DeLuMu45N2Ml0Hxr1I3F69dj84Rq4FmHjqmFqbFk/fi5L1afq9fuDsl
 OjU7NaPxyhJG0kCerorYW0QAcMDj3XT+9xuFcm37umFH/fMdBBVA/8o8V0PXhKh8PHxH
 MI36sJdWb+CyZYx9J69NOCGfUFKCvuYBZD/pE85lWyou4KIEYaAjvI162hk0tOCxwfpf
 uxrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699914203; x=1700519003;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A2lUqDXZqftceSAE/EIfmIXCfWy49ECBlUcQBJOXPgk=;
 b=ZX0/lwY5ri+e5C3AZG8IaXzTxyY3PJy3mW3cobdi0VPS974lKyYHQ8fm9wuNiCvUj4
 Ld49n0Ce22EYRRPXmpUTAK/zri6n+OgfsstmZQoLCZpgmLEc8PVXRceqZl9n7J+eu/QG
 5V8C4NWQIQnMJQM/kHDJapGV23FX2Ggo6aaTuOgSDq3AIYwQ2a8/kBdttTe5FDeytRkh
 Oy4Q0Qqnq0AnWJT+hGWcIUZ3MMVMVp3T3LbLaJCBPwoWOoDJ0dFiIPlTJ5+OZpEoZTTx
 KVKA5pNA9SXM6jmV71LOsWbIEA7pyKGD3Y20qHZn5LCrTxnKWwbJbm7nSBJ34ooYozo1
 QIkA==
X-Gm-Message-State: AOJu0YxQE5FpLj+9yhEzlzWL7gMZpp29GT1kfD9s+o8jNm074sdksgc0
 2sVmDHYik9+5pIJK+rGYL6OxFQbQWMX3F/eOPmQ=
X-Google-Smtp-Source: AGHT+IFr6X1XkLCqQA0hMWpN32lZWWNiSSsFNeVxo8xuLBlvHKHIMKV+WYspvbgfnHFpWcrYXaRyFd/HgvI3CP7hHyI=
X-Received: by 2002:a19:ae17:0:b0:506:926c:9b0d with SMTP id
 f23-20020a19ae17000000b00506926c9b0dmr4564696lfc.20.1699914202741; Mon, 13
 Nov 2023 14:23:22 -0800 (PST)
MIME-Version: 1.0
References: <20231113164241.32310-1-eesina@astralinux.ru>
In-Reply-To: <20231113164241.32310-1-eesina@astralinux.ru>
Date: Mon, 13 Nov 2023 16:23:11 -0600
Message-ID: <CAH2r5mvSXmRx8j65hLZEpiHOs-72zDpUYF-uy4reR3R3vUzfZA@mail.gmail.com>
Subject: Re: [PATCH] cifs: fix check of rc in function generate_smb3signingkey
To: Ekaterina Esina <eesina@astralinux.ru>
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
 Shyam Prasad N <sprasad@microsoft.com>, lvc-project@linuxtesting.org,
 linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org,
 samba-technical@lists.samba.org, Aurelien Aptel <aaptel@suse.com>,
 Ronnie Sahlberg <lsahlber@redhat.com>, Steve French <sfrench@samba.org>,
 Anastasia Belova <abelova@astralinux.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

tentatively merged into cifs-2.6.git for-next pending testing

On Mon, Nov 13, 2023 at 10:43=E2=80=AFAM Ekaterina Esina <eesina@astralinux=
.ru> wrote:
>
> Remove extra check after condition, add check after generating key
> for encryption. The check is needed to return non zero rc before
> rewriting it with generating key for decryption.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: d70e9fa55884 ("cifs: try opening channels after mounting")
> Signed-off-by: Ekaterina Esina <eesina@astralinux.ru>
> Co-developed-by: Anastasia Belova <abelova@astralinux.ru>
> Signed-off-by: Anastasia Belova <abelova@astralinux.ru>
> ---
>  fs/smb/client/smb2transport.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/fs/smb/client/smb2transport.c b/fs/smb/client/smb2transport.=
c
> index 84ea67301303..5a3ca62d2f07 100644
> --- a/fs/smb/client/smb2transport.c
> +++ b/fs/smb/client/smb2transport.c
> @@ -458,6 +458,8 @@ generate_smb3signingkey(struct cifs_ses *ses,
>                                   ptriplet->encryption.context,
>                                   ses->smb3encryptionkey,
>                                   SMB3_ENC_DEC_KEY_SIZE);
> +               if (rc)
> +                       return rc;
>                 rc =3D generate_key(ses, ptriplet->decryption.label,
>                                   ptriplet->decryption.context,
>                                   ses->smb3decryptionkey,
> @@ -466,9 +468,6 @@ generate_smb3signingkey(struct cifs_ses *ses,
>                         return rc;
>         }
>
> -       if (rc)
> -               return rc;
> -
>  #ifdef CONFIG_CIFS_DEBUG_DUMP_KEYS
>         cifs_dbg(VFS, "%s: dumping generated AES session keys\n", __func_=
_);
>         /*
> --
> 2.30.2
>
>


--=20
Thanks,

Steve


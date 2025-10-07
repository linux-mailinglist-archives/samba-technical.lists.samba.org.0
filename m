Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0CCBC26BB
	for <lists+samba-technical@lfdr.de>; Tue, 07 Oct 2025 20:41:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=bgixTp66/wF3ZLblegPyEnfFW2saZwup+K1H+9SeEGo=; b=4ZHesHS3ctWrk+E8o9vxGLeFYx
	iDVLuEz1JUWl4ylDXl/0TwAb/pYIrlEedmg9aiUQ0PQnjKRjmuQiyGuEkJB9YVYABe8dNkqSgMygM
	dQ910HXUfBgVXca991GY8u1kuU4YmEG098I2d4BXrYSuZHUgLK58p7CKFrepE58WsSfVTXKLknkMT
	kRPDmRQuraeJOdVvEMORtLWgDuEJuXOWHJ9sCSBHZs8T7dRmEzLZTuF4Govm84Z/XWlC8fCI1L07+
	Bd1w0fP+X2t6zPPeGP19IbAD1u6APn33pa3kC2n5seX9kugZMQtjMR9x0Kk0oxzGlXlpRDScDqwjm
	dm+kxxgA==;
Received: from ip6-localhost ([::1]:48720 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v6Ccn-007Fzk-I9; Tue, 07 Oct 2025 18:41:25 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:57492) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v6Cci-007Fzd-Rz
 for samba-technical@lists.samba.org; Tue, 07 Oct 2025 18:41:23 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id
 6a1803df08f44-70ba7aa131fso71753536d6.2
 for <samba-technical@lists.samba.org>; Tue, 07 Oct 2025 11:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759862479; x=1760467279; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bgixTp66/wF3ZLblegPyEnfFW2saZwup+K1H+9SeEGo=;
 b=MQvcpq1MJ51azvJglrk810Bunroo0p6M/dLO8Z393EQ3zYOp2mMYjngSnlKKcniCn1
 vxD3Ye7u3tA8/9PKOL1yznbiCvgoAoMJ9G/QLWzE5wfXkRCGrWdzUC93k1l0rTDCT/BF
 yQ8sAB+YxZXgbJEA94Fya7Xq4kbdqKL7CPzyZbXRrXjspVW+aawQrGYzFJIiwsek8zGW
 J2kDxOfuEAvl0UY9gFso0OIyXuOdrzlH2tIRa60lCdbb9JjyNjvsp8CRAqffzW3VJIrV
 CG73zKN1/PnKQY0tZ9mnPMgghE7HiqEn0uzfp0vd+jVKYzsV9HXRk3zMgrDB8dCXJ68d
 xemA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759862479; x=1760467279;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bgixTp66/wF3ZLblegPyEnfFW2saZwup+K1H+9SeEGo=;
 b=Ngw/ywxoKclIaMfaD98jQPygGVrBT3hytvPjErFWTJD2/g64v+mcFRXHgApmIEhkz1
 Tu1n6TqKUD3+vGNYfTnnFp27R4dvQopX0MacW7DfmcSQcJUE5O7K8dowRcCUOqtwAA1r
 qDLiQi05E5/tEzb79eRK8c9x0HTPAZof6BUBUAszucuoF5I/G0sXaRCLdJlBihU6YMTH
 20TTugzH2OIj1uo5rV7R42fFyWESQRERB2ZgRG8ggG3IO2yI+LTfr/Ufb3wtuylYwBRb
 3c+J96NwncUMEItjfF01R+1ifU3O3j4QQE86OYMZ7ZeP0nLWmKlJiUWvc4jrRWCB877k
 iCeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVS0G98I2yA/s9BMkK2X27OzYUw0QoDjGpO9kXOrTN5NPZcaZzyGmTcss3PDRMH3O9w12qtP3weG+1AErNewhU=@lists.samba.org
X-Gm-Message-State: AOJu0YzqrlYnRzLMm6FiYz59YPai5T5QAJM7IfIFgCMQqgFQNQxkcxnN
 3FCn6HDTz3qo1VP/0+om/w0GygqeJrc8TvkaTPjyINoyayi//czTqRYfaHOGXvPzhJZCRxlXSJV
 9EP/ZZNCuctSy8N3/6rd2XXXpruBLw7U=
X-Gm-Gg: ASbGnctEL4An4s7RXxs3egv/VVEKZHj2iGYM95grLeF7ixm+fBuy0lMZEky4Pl/W6Ec
 IZ5YCOxto02fj/6CG7pgjqUluWIdgKr7Gty6aU+cOJ04lNKFXXXmwH7eavxYq+FQJY0T/xfoCVh
 wTH/oIqUFosK6je0iO6SKxGw2TZlzQLyI67sE4WUbPy+wyogkEQ4fAMq+8AiQ8dJZgWwIWm8jxX
 Q7isUGDNZ++YD46mBYEBxZ0dErbXO36YATtQIdF20/pOx2ryBOItb4c7nbxqVQapng3P/jhi85I
 Xv4oCyjIfgnK7pw5oKsJ64MYZpvFAcOmScAiWDDLDO65S6o9hCLBjs7HtL4rw7jl28xe3/h8rjT
 uPGbPfxLbspVhxVzAIc10FEGj6uIFgN1ArieIEsjRpTsqlw==
X-Google-Smtp-Source: AGHT+IGAMaE//thkRYv+ZrpKF5RBJeySCJyfuh/WlBoUDmdbdLu2J8HHznMto8B8AiACvjHNGwfsCkFdmIperQb8fJ4=
X-Received: by 2002:a05:6214:2aa6:b0:824:30f8:ed70 with SMTP id
 6a1803df08f44-87b2107268fmr6367856d6.9.1759862478535; Tue, 07 Oct 2025
 11:41:18 -0700 (PDT)
MIME-Version: 1.0
References: <20251007082603.16174-1-wangfushuai@baidu.com>
In-Reply-To: <20251007082603.16174-1-wangfushuai@baidu.com>
Date: Tue, 7 Oct 2025 13:41:06 -0500
X-Gm-Features: AS18NWDX3J4Uc_xYcuVgMqAXVA6vY8sa8xSNr6lLcFhs5hl5VboMY8BBFdwzWwM
Message-ID: <CAH2r5mvws19ho44YJDROdNUy3FtWfxyVE8QcbCTbFJ_VWYNQ9Q@mail.gmail.com>
Subject: Re: [PATCH v5] cifs: Fix copy_to_iter return value check
To: Fushuai Wang <wangfushuai@baidu.com>, David Howells <dhowells@redhat.com>
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
Cc: linux-cifs@vger.kernel.org, sprasad@microsoft.com, pc@manguebit.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org, tom@talpey.com,
 bharathsm@microsoft.com, Markus.Elfring@web.de
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

David suggested fixing this line:

 +                       return -1;

to

 +                       return -EIO;

which makes sense to me since returning -1 could be confusing.

On Tue, Oct 7, 2025 at 3:27=E2=80=AFAM Fushuai Wang <wangfushuai@baidu.com>=
 wrote:
>
> The return value of copy_to_iter() function will never be negative,
> it is the number of bytes copied, or zero if nothing was copied.
> Update the check to treat 0 as an error, and return -1 in that case.
>
> Fixes: d08089f649a0 ("cifs: Change the I/O paths to use an iterator rathe=
r than a page list")
> Signed-off-by: Fushuai Wang <wangfushuai@baidu.com>
> ---
> v5: no code changes, only improve commit format
> v4: no code changes, only add version description
> v3: use size_t type for (copied) and check for (copied =3D=3D 0) as error=
.
> v2: use (!length) check for error condition.
> v1: use (length <=3D 0) check for error condition.
>
>  fs/smb/client/smb2ops.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/fs/smb/client/smb2ops.c b/fs/smb/client/smb2ops.c
> index 058050f744c0..ac8a5bd6aec4 100644
> --- a/fs/smb/client/smb2ops.c
> +++ b/fs/smb/client/smb2ops.c
> @@ -4650,7 +4650,7 @@ handle_read_data(struct TCP_Server_Info *server, st=
ruct mid_q_entry *mid,
>         unsigned int pad_len;
>         struct cifs_io_subrequest *rdata =3D mid->callback_data;
>         struct smb2_hdr *shdr =3D (struct smb2_hdr *)buf;
> -       int length;
> +       size_t copied;
>         bool use_rdma_mr =3D false;
>
>         if (shdr->Command !=3D SMB2_READ) {
> @@ -4763,10 +4763,10 @@ handle_read_data(struct TCP_Server_Info *server, =
struct mid_q_entry *mid,
>         } else if (buf_len >=3D data_offset + data_len) {
>                 /* read response payload is in buf */
>                 WARN_ONCE(buffer, "read data can be either in buf or in b=
uffer");
> -               length =3D copy_to_iter(buf + data_offset, data_len, &rda=
ta->subreq.io_iter);
> -               if (length < 0)
> -                       return length;
> -               rdata->got_bytes =3D data_len;
> +               copied =3D copy_to_iter(buf + data_offset, data_len, &rda=
ta->subreq.io_iter);
> +               if (copied =3D=3D 0)
> +                       return -1;
> +               rdata->got_bytes =3D copied;
>         } else {
>                 /* read response payload cannot be in both buf and pages =
*/
>                 WARN_ONCE(1, "buf can not contain only a part of read dat=
a");

> --
> 2.36.1
>
>


--
Thanks,

Steve


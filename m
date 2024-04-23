Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DA28AF6F0
	for <lists+samba-technical@lfdr.de>; Tue, 23 Apr 2024 20:58:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=nsPyp10OeuKCiKp5cBxCcE/H7nRREeJ5Tm8uW6q5gxA=; b=Xxyhmgzxc+A5+HAfY6L7A47y6D
	D/JOwDyhROq2J65oT8jKVjTj7dVtgTwkzE4GuL4GjcdFiEDVyR/WEsMu6V9/RcJcwhpsRzRT4ZVoI
	g6WttinXLk164mA4ZJdXy5ryInqDoazqmY9EOiW5Mkc1+YWyfknYVX4V232fthIjemwt12kVSWLQp
	qdl46yOgWjsnhbr91Oe/NRWjsngP40NHZL/rLjToD0xfOsJMZkcNATK5xJIHYUZURbb89oc6xXorW
	N7+O3AVSkT6wWyi7o89cp8hkULsNLFhnZrINvY7frso+ZeBeHoTn4bvI+PQT7G9DoUyQlUfrVtnHQ
	Qr75iM8w==;
Received: from ip6-localhost ([::1]:36648 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rzLKu-005TAz-Li; Tue, 23 Apr 2024 18:57:48 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:60500) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rzLKp-005TAp-5i
 for samba-technical@lists.samba.org; Tue, 23 Apr 2024 18:57:45 +0000
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2d895e2c6efso91652051fa.0
 for <samba-technical@lists.samba.org>; Tue, 23 Apr 2024 11:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713898662; x=1714503462; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nsPyp10OeuKCiKp5cBxCcE/H7nRREeJ5Tm8uW6q5gxA=;
 b=mMB0KgemIQzUzjAu0YxMU4cYZ55h4i3rUYHsX6viXB26pQRWAOncVJU78/PTpWjXDw
 /aiy7OSL50fj1xq/QcY7OxArcGA3lTnjSJV1DLH51UjOrOC2tDBNaed0vNxSrMvR4P7Z
 fSSrd2m2Q3lTRDVl3E5ZAUnf/16n8th0cEOFwifBJvel7JunNknWg9zCE5eaE8l33tIE
 kRf8dGjsyEkFtUXX5Rv2jV9pMVkUuL8PtzuX8tUqr9m4YXV/MGKBToiUxfdGshyAThcj
 SYdACQaSo/YvUdxASGvCShUOIYlAYbku2ElddvQQCQ3HaFGaFL7ZqJKtTWthfpON5rRw
 1hXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713898662; x=1714503462;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nsPyp10OeuKCiKp5cBxCcE/H7nRREeJ5Tm8uW6q5gxA=;
 b=oIhn0ksazMWIapC2px5z/9WpaUf1HgAsLYD6FhyDKP5/uGjqUv2CKor35ppeGol9Yh
 M9UgNPkugjEDYnkeSIWDmtbi6Yy/Lez4Bnhpb7MHzgmIQkJ/3F/jYrzrTbDrOxEHlJlJ
 0lQuGGNFd6ypJ8ZOmMdlZ8f0su+mdpNCjT6U3NqE1kekJiODLZbzkR0rkJPBmta08kBD
 /gLaracpr8GPyTWx8aKuuVkwDCRZ7A4gYv0YwdYNdIm5R3KN6f4GaUXF6/ZmYrpvAV9f
 vUM2pjhK3jzqPdd8swI3IhuCnpVv06Lfy38SvUMjT//f7xD2s280SBC7TzQL/cJXGhNl
 QwGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbav1Kwu3uKSvv4d3mrg6vtCX5bR+2cRM3BmNO+F9SgiNFjgEFH6CJj1+lwtIV6okp2T29bD//jGReodgMJXjESP5XubYIGbUHcRn0NTLb
X-Gm-Message-State: AOJu0YwBdN0zqi+0jsm6TDUyr32fBAy01c8I83cS0NqelPnk68u20MhI
 V/2Jb2I50PUZPllfhbpYkmP3hv22ynAsxHJXh4H4kYXAg70aQ4s1g9x2fU5PEuthap1a6w6+hpt
 krRStRVhs0yIPWnKeLAIwihMcAyM=
X-Google-Smtp-Source: AGHT+IHyUbgmTQf8WX/KSODwBX8UO62Tz1THto0rGm8zXU1bsDSgxeFNTae5Mwrjovdr+Z0pnTT4lcY1hnZFn8QvvTo=
X-Received: by 2002:a2e:be8c:0:b0:2da:78e:f766 with SMTP id
 a12-20020a2ebe8c000000b002da078ef766mr94273ljr.38.1713898661255; Tue, 23 Apr
 2024 11:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <20231204203514.2093855-1-sashal@kernel.org>
 <20231204203514.2093855-15-sashal@kernel.org>
In-Reply-To: <20231204203514.2093855-15-sashal@kernel.org>
Date: Tue, 23 Apr 2024 13:57:29 -0500
Message-ID: <CAH2r5mt2gwyyAqotBv5U1esJQggGUbz8_J=6k_Z69X2dRRK8Ug@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.1 15/17] smb: client,
 common: fix fortify warnings
To: Sasha Levin <sashal@kernel.org>
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
Cc: linux-cifs@vger.kernel.org, Dmitry Antipov <dmantipov@yandex.ru>,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, sfrench@samba.org, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Note that kernels that backported this fix will also need this ksmbd
fix (fixes a bug when Macs mount to ksmbd)

commit 0268a7cc7fdc47d90b6c18859de7718d5059f6f1
Author: Namjae Jeon <linkinjeon@kernel.org>
Date:   Fri Apr 19 23:46:34 2024 +0900

    ksmbd: common: use struct_group_attr instead of struct_group for
network_open_info

    4byte padding cause the connection issue with the applications of MacOS=
.
    smb2_close response size increases by 4 bytes by padding, And the smb
    client of MacOS check it and stop the connection. This patch use
    struct_group_attr instead of struct_group for network_open_info to use
     __packed to avoid padding.

    Fixes: 0015eb6e1238 ("smb: client, common: fix fortify warnings")
    Cc: stable@vger.kernel.org
    Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>
    Signed-off-by: Steve French <stfrench@microsoft.com>

On Mon, Dec 4, 2023 at 2:36=E2=80=AFPM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> From: Dmitry Antipov <dmantipov@yandex.ru>
>
> [ Upstream commit 0015eb6e12384ff1c589928e84deac2ad1ceb236 ]
>
> When compiling with gcc version 14.0.0 20231126 (experimental)
> and CONFIG_FORTIFY_SOURCE=3Dy, I've noticed the following:
>
> In file included from ./include/linux/string.h:295,
>                  from ./include/linux/bitmap.h:12,
>                  from ./include/linux/cpumask.h:12,
>                  from ./arch/x86/include/asm/paravirt.h:17,
>                  from ./arch/x86/include/asm/cpuid.h:62,
>                  from ./arch/x86/include/asm/processor.h:19,
>                  from ./arch/x86/include/asm/cpufeature.h:5,
>                  from ./arch/x86/include/asm/thread_info.h:53,
>                  from ./include/linux/thread_info.h:60,
>                  from ./arch/x86/include/asm/preempt.h:9,
>                  from ./include/linux/preempt.h:79,
>                  from ./include/linux/spinlock.h:56,
>                  from ./include/linux/wait.h:9,
>                  from ./include/linux/wait_bit.h:8,
>                  from ./include/linux/fs.h:6,
>                  from fs/smb/client/smb2pdu.c:18:
> In function 'fortify_memcpy_chk',
>     inlined from '__SMB2_close' at fs/smb/client/smb2pdu.c:3480:4:
> ./include/linux/fortify-string.h:588:25: warning: call to '__read_overflo=
w2_field'
> declared with attribute warning: detected read beyond size of field (2nd =
parameter);
> maybe use struct_group()? [-Wattribute-warning]
>   588 |                         __read_overflow2_field(q_size_field, size=
);
>       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~
>
> and:
>
> In file included from ./include/linux/string.h:295,
>                  from ./include/linux/bitmap.h:12,
>                  from ./include/linux/cpumask.h:12,
>                  from ./arch/x86/include/asm/paravirt.h:17,
>                  from ./arch/x86/include/asm/cpuid.h:62,
>                  from ./arch/x86/include/asm/processor.h:19,
>                  from ./arch/x86/include/asm/cpufeature.h:5,
>                  from ./arch/x86/include/asm/thread_info.h:53,
>                  from ./include/linux/thread_info.h:60,
>                  from ./arch/x86/include/asm/preempt.h:9,
>                  from ./include/linux/preempt.h:79,
>                  from ./include/linux/spinlock.h:56,
>                  from ./include/linux/wait.h:9,
>                  from ./include/linux/wait_bit.h:8,
>                  from ./include/linux/fs.h:6,
>                  from fs/smb/client/cifssmb.c:17:
> In function 'fortify_memcpy_chk',
>     inlined from 'CIFS_open' at fs/smb/client/cifssmb.c:1248:3:
> ./include/linux/fortify-string.h:588:25: warning: call to '__read_overflo=
w2_field'
> declared with attribute warning: detected read beyond size of field (2nd =
parameter);
> maybe use struct_group()? [-Wattribute-warning]
>   588 |                         __read_overflow2_field(q_size_field, size=
);
>       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~
>
> In both cases, the fortification logic inteprets calls to 'memcpy()' as a=
n
> attempts to copy an amount of data which exceeds the size of the specifie=
d
> field (i.e. more than 8 bytes from __le64 value) and thus issues an overr=
ead
> warning. Both of these warnings may be silenced by using the convenient
> 'struct_group()' quirk.
>
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> Acked-by: Namjae Jeon <linkinjeon@kernel.org>
> Signed-off-by: Steve French <stfrench@microsoft.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  fs/smb/client/cifspdu.h | 24 ++++++++++++++----------
>  fs/smb/client/cifssmb.c |  6 ++++--
>  fs/smb/client/smb2pdu.c |  8 +++-----
>  fs/smb/client/smb2pdu.h | 16 +++++++++-------
>  fs/smb/common/smb2pdu.h | 17 ++++++++++-------
>  5 files changed, 40 insertions(+), 31 deletions(-)
>
> diff --git a/fs/smb/client/cifspdu.h b/fs/smb/client/cifspdu.h
> index c403816d0b6c1..97bb1838555b4 100644
> --- a/fs/smb/client/cifspdu.h
> +++ b/fs/smb/client/cifspdu.h
> @@ -882,11 +882,13 @@ typedef struct smb_com_open_rsp {
>         __u8 OplockLevel;
>         __u16 Fid;
>         __le32 CreateAction;
> -       __le64 CreationTime;
> -       __le64 LastAccessTime;
> -       __le64 LastWriteTime;
> -       __le64 ChangeTime;
> -       __le32 FileAttributes;
> +       struct_group(common_attributes,
> +               __le64 CreationTime;
> +               __le64 LastAccessTime;
> +               __le64 LastWriteTime;
> +               __le64 ChangeTime;
> +               __le32 FileAttributes;
> +       );
>         __le64 AllocationSize;
>         __le64 EndOfFile;
>         __le16 FileType;
> @@ -2268,11 +2270,13 @@ typedef struct {
>  /* QueryFileInfo/QueryPathinfo (also for SetPath/SetFile) data buffer fo=
rmats */
>  /***********************************************************************=
*******/
>  typedef struct { /* data block encoding of response to level 263 QPathIn=
fo */
> -       __le64 CreationTime;
> -       __le64 LastAccessTime;
> -       __le64 LastWriteTime;
> -       __le64 ChangeTime;
> -       __le32 Attributes;
> +       struct_group(common_attributes,
> +               __le64 CreationTime;
> +               __le64 LastAccessTime;
> +               __le64 LastWriteTime;
> +               __le64 ChangeTime;
> +               __le32 Attributes;
> +       );
>         __u32 Pad1;
>         __le64 AllocationSize;
>         __le64 EndOfFile;       /* size ie offset to first free byte in f=
ile */
> diff --git a/fs/smb/client/cifssmb.c b/fs/smb/client/cifssmb.c
> index c90d4ec9292ca..67c5fc2b2db94 100644
> --- a/fs/smb/client/cifssmb.c
> +++ b/fs/smb/client/cifssmb.c
> @@ -1234,8 +1234,10 @@ CIFS_open(const unsigned int xid, struct cifs_open=
_parms *oparms, int *oplock,
>                 *oplock |=3D CIFS_CREATE_ACTION;
>
>         if (buf) {
> -               /* copy from CreationTime to Attributes */
> -               memcpy((char *)buf, (char *)&rsp->CreationTime, 36);
> +               /* copy commonly used attributes */
> +               memcpy(&buf->common_attributes,
> +                      &rsp->common_attributes,
> +                      sizeof(buf->common_attributes));
>                 /* the file_info buf is endian converted by caller */
>                 buf->AllocationSize =3D rsp->AllocationSize;
>                 buf->EndOfFile =3D rsp->EndOfFile;
> diff --git a/fs/smb/client/smb2pdu.c b/fs/smb/client/smb2pdu.c
> index 847d69d327c2a..aea7770fb5631 100644
> --- a/fs/smb/client/smb2pdu.c
> +++ b/fs/smb/client/smb2pdu.c
> @@ -3425,12 +3425,10 @@ __SMB2_close(const unsigned int xid, struct cifs_=
tcon *tcon,
>         } else {
>                 trace_smb3_close_done(xid, persistent_fid, tcon->tid,
>                                       ses->Suid);
> -               /*
> -                * Note that have to subtract 4 since struct network_open=
_info
> -                * has a final 4 byte pad that close response does not ha=
ve
> -                */
>                 if (pbuf)
> -                       memcpy(pbuf, (char *)&rsp->CreationTime, sizeof(*=
pbuf) - 4);
> +                       memcpy(&pbuf->network_open_info,
> +                              &rsp->network_open_info,
> +                              sizeof(pbuf->network_open_info));
>         }
>
>         atomic_dec(&tcon->num_remote_opens);
> diff --git a/fs/smb/client/smb2pdu.h b/fs/smb/client/smb2pdu.h
> index 1237bb86e93a8..8ac99563487c1 100644
> --- a/fs/smb/client/smb2pdu.h
> +++ b/fs/smb/client/smb2pdu.h
> @@ -339,13 +339,15 @@ struct smb2_file_reparse_point_info {
>  } __packed;
>
>  struct smb2_file_network_open_info {
> -       __le64 CreationTime;
> -       __le64 LastAccessTime;
> -       __le64 LastWriteTime;
> -       __le64 ChangeTime;
> -       __le64 AllocationSize;
> -       __le64 EndOfFile;
> -       __le32 Attributes;
> +       struct_group(network_open_info,
> +               __le64 CreationTime;
> +               __le64 LastAccessTime;
> +               __le64 LastWriteTime;
> +               __le64 ChangeTime;
> +               __le64 AllocationSize;
> +               __le64 EndOfFile;
> +               __le32 Attributes;
> +       );
>         __le32 Reserved;
>  } __packed; /* level 34 Query also similar returned in close rsp and ope=
n rsp */
>
> diff --git a/fs/smb/common/smb2pdu.h b/fs/smb/common/smb2pdu.h
> index 9619015d78f29..778c1e3b70bc1 100644
> --- a/fs/smb/common/smb2pdu.h
> +++ b/fs/smb/common/smb2pdu.h
> @@ -699,13 +699,16 @@ struct smb2_close_rsp {
>         __le16 StructureSize; /* 60 */
>         __le16 Flags;
>         __le32 Reserved;
> -       __le64 CreationTime;
> -       __le64 LastAccessTime;
> -       __le64 LastWriteTime;
> -       __le64 ChangeTime;
> -       __le64 AllocationSize;  /* Beginning of FILE_STANDARD_INFO equiva=
lent */
> -       __le64 EndOfFile;
> -       __le32 Attributes;
> +       struct_group(network_open_info,
> +               __le64 CreationTime;
> +               __le64 LastAccessTime;
> +               __le64 LastWriteTime;
> +               __le64 ChangeTime;
> +               /* Beginning of FILE_STANDARD_INFO equivalent */
> +               __le64 AllocationSize;
> +               __le64 EndOfFile;
> +               __le32 Attributes;
> +       );
>  } __packed;
>
>
> --
> 2.42.0
>
>


--=20
Thanks,

Steve


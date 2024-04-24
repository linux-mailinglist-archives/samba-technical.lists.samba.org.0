Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C25D8B00B9
	for <lists+samba-technical@lfdr.de>; Wed, 24 Apr 2024 06:56:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=sTa0ddi19PvhSuGL5F1fIfzICHhbPQ7+XRAogkqvhXg=; b=yGHSMPE2ega5oxdeC3vRYGnNsg
	dJ9eABISYUdXSlOnUlWcfihah0D00/cV6d04ST1IezGDJcqpQsUzQ24Q+nNiVcy0zOTRtAeDnUYnq
	MEJJJD+O9piKlF4HIsukkGkShiaaXqWjoISaYmOlT8QsWj+mNMyWgCMcCihtA+No5kOjJjT5W9NvC
	fOSeEj1NDMQF+ZNCQbwgaz+8toSbqNWImAG0YLEH6gBLTf2hE7syz0cp5HqKvF7nf1U6nqDPCpJSq
	ELh6ajCmD+ZREF1tj50Q03nJ0EJ87Uh3lpIuPbN3ZwzhEHD+4z+SBSz85hSQtZGkYm0pUM0gixjDk
	6MzI6++g==;
Received: from ip6-localhost ([::1]:42288 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rzUfb-005UiN-0F; Wed, 24 Apr 2024 04:55:47 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1]:36510) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rzUfV-005Ui1-Ir
 for samba-technical@lists.samba.org; Wed, 24 Apr 2024 04:55:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 76CDFCE138F
 for <samba-technical@lists.samba.org>; Wed, 24 Apr 2024 04:36:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9670DC32782
 for <samba-technical@lists.samba.org>; Wed, 24 Apr 2024 04:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713933406;
 bh=tuSpJeVelX2QtRfHSrv0QUZCsOHtMcWqiSaVBdtewZI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Q2MSAfj3yxayUF9+Oz8+JlsgGXN7IugQC+IWyMJW76V4XmJwGE6Y6RXp5Q9CDGMZC
 UngAqVu0X04kCxtyWogsQidX1VMkPGQqV8ccMEo5A64U6sd1a5a0EzgIfXDKTNWCMR
 XzUsIn31WgWGCj1y4OzP+Iiux5QHbIofabX27g6k+IC+HjxGJICiqSOBUsxggec+Zk
 +41oKkeyQe9RV01ZdXuy/o1y4g/ooHMDQjVAzIe5GySSXb0Sebm8nSj37voIq2SZP+
 h6V7Nc8sKOehDY0hi/HNFSC0XrYq7xsv+6Mr6xx06bpiIkj5DjgfODuEo8jkOQJLWO
 1/fQ4w8raZANA==
Received: by mail-oo1-f41.google.com with SMTP id
 006d021491bc7-5ad28c0b85eso2143081eaf.2
 for <samba-technical@lists.samba.org>; Tue, 23 Apr 2024 21:36:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU/Hnmgd7pKPgAuTsKZmxgpUmfb7elM9c2IEOnVTvnkLxi02R+ia8feQygUV+C23ht9VjqNE4t+xvof2CLUFPxmFnAKP67t31o9bfr15yKM
X-Gm-Message-State: AOJu0Yz7HOGVTa74RWULYClt1FNGsFWGpTTGOlMCsLOQB8LgLAZArhJq
 L7EIabAeaji9QDbr+wcW9yf3/LpawqezwDOH1soDESLefUYVJqvlZ2caR3qDez5Yl+Y/3rtUBCU
 hOLdW318vdu93mH+8DkoopcCvMuM=
X-Google-Smtp-Source: AGHT+IEg0W5Eme7ZwqVBNJB+djHMHMyVJwSm+D3dx88b5Z7CAy1prCkiEaSrwPv8JwvaqQt/nWjqOmAvcDEiczmpQmc=
X-Received: by 2002:a4a:987:0:b0:5ac:9efc:3b02 with SMTP id
 129-20020a4a0987000000b005ac9efc3b02mr1251950ooa.8.1713933405856; Tue, 23 Apr
 2024 21:36:45 -0700 (PDT)
MIME-Version: 1.0
References: <ZihxUuQOkZ6Zz363@neat>
In-Reply-To: <ZihxUuQOkZ6Zz363@neat>
Date: Wed, 24 Apr 2024 13:36:34 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-i3Fjv-7JmQa8bSrWD69yFfi8jqfBJV51JgyseA-yXFQ@mail.gmail.com>
Message-ID: <CAKYAXd-i3Fjv-7JmQa8bSrWD69yFfi8jqfBJV51JgyseA-yXFQ@mail.gmail.com>
Subject: Re: [PATCH][next] smb: client: Fix struct_group() usage in __packed
 structs
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
From: Namjae Jeon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>,
 Shyam Prasad N <sprasad@microsoft.com>, linux-cifs@vger.kernel.org,
 Dmitry Antipov <dmantipov@yandex.ru>, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, Steve French <sfrench@samba.org>,
 Bharath SM <bharathsm@microsoft.com>, linux-hardening@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

2024=EB=85=84 4=EC=9B=94 24=EC=9D=BC (=EC=88=98) =EC=98=A4=EC=A0=84 11:41, =
Gustavo A. R. Silva <gustavoars@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> Use struct_group_attr() in __packed structs, instead of struct_group().
>
> Below you can see the pahole output before/after changes:
>
> pahole -C smb2_file_network_open_info fs/smb/client/smb2ops.o
> struct smb2_file_network_open_info {
>         union {
>                 struct {
>                         __le64     CreationTime;         /*     0     8 *=
/
>                         __le64     LastAccessTime;       /*     8     8 *=
/
>                         __le64     LastWriteTime;        /*    16     8 *=
/
>                         __le64     ChangeTime;           /*    24     8 *=
/
>                         __le64     AllocationSize;       /*    32     8 *=
/
>                         __le64     EndOfFile;            /*    40     8 *=
/
>                         __le32     Attributes;           /*    48     4 *=
/
>                 };                                       /*     0    56 *=
/
>                 struct {
>                         __le64     CreationTime;         /*     0     8 *=
/
>                         __le64     LastAccessTime;       /*     8     8 *=
/
>                         __le64     LastWriteTime;        /*    16     8 *=
/
>                         __le64     ChangeTime;           /*    24     8 *=
/
>                         __le64     AllocationSize;       /*    32     8 *=
/
>                         __le64     EndOfFile;            /*    40     8 *=
/
>                         __le32     Attributes;           /*    48     4 *=
/
>                 } network_open_info;                     /*     0    56 *=
/
>         };                                               /*     0    56 *=
/
>         __le32                     Reserved;             /*    56     4 *=
/
>
>         /* size: 60, cachelines: 1, members: 2 */
>         /* last cacheline: 60 bytes */
> } __attribute__((__packed__));
>
> pahole -C smb2_file_network_open_info fs/smb/client/smb2ops.o
> struct smb2_file_network_open_info {
>         union {
>                 struct {
>                         __le64     CreationTime;         /*     0     8 *=
/
>                         __le64     LastAccessTime;       /*     8     8 *=
/
>                         __le64     LastWriteTime;        /*    16     8 *=
/
>                         __le64     ChangeTime;           /*    24     8 *=
/
>                         __le64     AllocationSize;       /*    32     8 *=
/
>                         __le64     EndOfFile;            /*    40     8 *=
/
>                         __le32     Attributes;           /*    48     4 *=
/
>                 } __attribute__((__packed__));           /*     0    52 *=
/
>                 struct {
>                         __le64     CreationTime;         /*     0     8 *=
/
>                         __le64     LastAccessTime;       /*     8     8 *=
/
>                         __le64     LastWriteTime;        /*    16     8 *=
/
>                         __le64     ChangeTime;           /*    24     8 *=
/
>                         __le64     AllocationSize;       /*    32     8 *=
/
>                         __le64     EndOfFile;            /*    40     8 *=
/
>                         __le32     Attributes;           /*    48     4 *=
/
>                 } __attribute__((__packed__)) network_open_info;       /*=
     0    52 */
>         };                                               /*     0    52 *=
/
>         __le32                     Reserved;             /*    52     4 *=
/
>
>         /* size: 56, cachelines: 1, members: 2 */
>         /* last cacheline: 56 bytes */
> };
>
> pahole -C smb_com_open_rsp fs/smb/client/cifssmb.o
> struct smb_com_open_rsp {
>         ...
>
>         union {
>                 struct {
>                         __le64     CreationTime;         /*    48     8 *=
/
>                         __le64     LastAccessTime;       /*    56     8 *=
/
>                         /* --- cacheline 1 boundary (64 bytes) --- */
>                         __le64     LastWriteTime;        /*    64     8 *=
/
>                         __le64     ChangeTime;           /*    72     8 *=
/
>                         __le32     FileAttributes;       /*    80     4 *=
/
>                 };                                       /*    48    40 *=
/
>                 struct {
>                         __le64     CreationTime;         /*    48     8 *=
/
>                         __le64     LastAccessTime;       /*    56     8 *=
/
>                         /* --- cacheline 1 boundary (64 bytes) --- */
>                         __le64     LastWriteTime;        /*    64     8 *=
/
>                         __le64     ChangeTime;           /*    72     8 *=
/
>                         __le32     FileAttributes;       /*    80     4 *=
/
>                 } common_attributes;                     /*    48    40 *=
/
>         };                                               /*    48    40 *=
/
>
>         ...
>
>         /* size: 111, cachelines: 2, members: 14 */
>         /* last cacheline: 47 bytes */
> } __attribute__((__packed__));
>
> pahole -C smb_com_open_rsp fs/smb/client/cifssmb.o
> struct smb_com_open_rsp {
>         ...
>
>         union {
>                 struct {
>                         __le64     CreationTime;         /*    48     8 *=
/
>                         __le64     LastAccessTime;       /*    56     8 *=
/
>                         /* --- cacheline 1 boundary (64 bytes) --- */
>                         __le64     LastWriteTime;        /*    64     8 *=
/
>                         __le64     ChangeTime;           /*    72     8 *=
/
>                         __le32     FileAttributes;       /*    80     4 *=
/
>                 } __attribute__((__packed__));           /*    48    36 *=
/
>                 struct {
>                         __le64     CreationTime;         /*    48     8 *=
/
>                         __le64     LastAccessTime;       /*    56     8 *=
/
>                         /* --- cacheline 1 boundary (64 bytes) --- */
>                         __le64     LastWriteTime;        /*    64     8 *=
/
>                         __le64     ChangeTime;           /*    72     8 *=
/
>                         __le32     FileAttributes;       /*    80     4 *=
/
>                 } __attribute__((__packed__)) common_attributes;       /*=
    48    36 */
>         };                                               /*    48    36 *=
/
>
>         ...
>
>         /* size: 107, cachelines: 2, members: 14 */
>         /* last cacheline: 43 bytes */
> } __attribute__((__packed__));
>
> pahole -C FILE_ALL_INFO fs/smb/client/cifssmb.o
> typedef struct {
>         union {
>                 struct {
>                         __le64     CreationTime;         /*     0     8 *=
/
>                         __le64     LastAccessTime;       /*     8     8 *=
/
>                         __le64     LastWriteTime;        /*    16     8 *=
/
>                         __le64     ChangeTime;           /*    24     8 *=
/
>                         __le32     Attributes;           /*    32     4 *=
/
>                 };                                       /*     0    40 *=
/
>                 struct {
>                         __le64     CreationTime;         /*     0     8 *=
/
>                         __le64     LastAccessTime;       /*     8     8 *=
/
>                         __le64     LastWriteTime;        /*    16     8 *=
/
>                         __le64     ChangeTime;           /*    24     8 *=
/
>                         __le32     Attributes;           /*    32     4 *=
/
>                 } common_attributes;                     /*     0    40 *=
/
>         };                                               /*     0    40 *=
/
>
>         ...
>
>         /* size: 113, cachelines: 2, members: 17 */
>         /* last cacheline: 49 bytes */
> } __attribute__((__packed__)) FILE_ALL_INFO;
>
> pahole -C FILE_ALL_INFO fs/smb/client/cifssmb.o
> typedef struct {
>         union {
>                 struct {
>                         __le64     CreationTime;         /*     0     8 *=
/
>                         __le64     LastAccessTime;       /*     8     8 *=
/
>                         __le64     LastWriteTime;        /*    16     8 *=
/
>                         __le64     ChangeTime;           /*    24     8 *=
/
>                         __le32     Attributes;           /*    32     4 *=
/
>                 } __attribute__((__packed__));           /*     0    36 *=
/
>                 struct {
>                         __le64     CreationTime;         /*     0     8 *=
/
>                         __le64     LastAccessTime;       /*     8     8 *=
/
>                         __le64     LastWriteTime;        /*    16     8 *=
/
>                         __le64     ChangeTime;           /*    24     8 *=
/
>                         __le32     Attributes;           /*    32     4 *=
/
>                 } __attribute__((__packed__)) common_attributes;       /*=
     0    36 */
>         };                                               /*     0    36 *=
/
>
>         ...
>
>         /* size: 109, cachelines: 2, members: 17 */
>         /* last

cacheline: 45 bytes */
> } __attribute__((__packed__)) FILE_ALL_INFO;
>
> Fixes: 0015eb6e1238 ("smb: client, common: fix fortify warnings")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
Looks good to me:)
Reviewed-by: Namjae Jeon <linkinjeon@kernel.org>
Thanks!


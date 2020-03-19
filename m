Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 966E418AB36
	for <lists+samba-technical@lfdr.de>; Thu, 19 Mar 2020 04:37:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=KfFQJZwHtJbAjjnEwFgpYcdAo9ADyYbvlrT2oIwYXZM=; b=LaQb0GeX1GYZ38ePKRDaVrrojd
	yM5lL4iKhGnIHnvVNMIsO43rBiLhI0x55tS+x2aiUCAPR5d7IB4a4bwsRXAWvpRX2AIqqRB8l1pPD
	6/GcWO4JHBPcyUIyRD66bXK2RKOpuy+d1X8SHaFzzxxm5Pyu+0/JXdjb9VIX8r1VwHJ+QgQNYmu7e
	jkVXN1aCBXQz8i2RiL0VoP+PIBhzhaNnNIMc4ebwGrXiNfSA7OMtpY1oigUXqysANnylxnLtf4qAK
	XYZF+cM68zOBXMkNnzIU9w4gejMz9emZHLqpiMdnJ4S4w0CAz9U2fIeGrHCNM/R1jEPvwQ/Q+zh+j
	ZAYomj4Q==;
Received: from localhost ([::1]:38156 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jElz5-0007cA-5u; Thu, 19 Mar 2020 03:36:39 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744]:36408) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jElz0-0007c3-1y
 for samba-technical@lists.samba.org; Thu, 19 Mar 2020 03:36:36 +0000
Received: by mail-qk1-x744.google.com with SMTP id d11so1115382qko.3
 for <samba-technical@lists.samba.org>; Wed, 18 Mar 2020 20:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7BtgtR8SwYPeL605wErBE2LeGXp+qf3J+lsmtxy4HkM=;
 b=frVZBo31/b4C0L33CrwQUdmbi+SWoL/Ox4+GUq8edYlULfZP4Q8LISeMtpGAg9bp8U
 u0TRMi6Q5u1pwJEDOMRXFTdTZlm4i8QDe/ZFw0xGRmOqkRXDuDe+/e5rB1O3Z/sQ7LG5
 2yI41MTUVk6VqTng6wWX753B+bU39Z//kVUcjoTj0mXwKTf7URX27Kc0AiHsO2gpXMud
 6Zq/Ovwo3lYvEHKmj4A0855IZJMb86axy54Tl/PdBwrqYlj6b/CWuOpPHdjvE9GcUECr
 iST5izXV1o9qO2FIyf03LSJq1hXDca96TJzst0hSCB8kU8Ir71Ovbl4z35FNg4/QZCnZ
 9bkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7BtgtR8SwYPeL605wErBE2LeGXp+qf3J+lsmtxy4HkM=;
 b=cm/jI3DgnpFEzqg9iuRuTWDGO7a4NrqbZOOAhLWXfbmSFC/tbirhtMkOfdOWeDrIJu
 ksB7ZbvQkWKk/QttyqHKwpeA8yuX+TnOFfI7M7AK/cifPubgNcH3Gu1VWSnvzOrbY+bu
 keMKwu0V/GCg4dyVYydDeSV167/wVBfLceEldP1KxV0ZAuyTgfgwMBg/jxnRBI/omOg0
 9wY9aUUiT3t4dfqLJmTNMEnGPe/nTAFvvn+AyHjLMrlT6sKWkd/W+eywHrK9LZ29BsCh
 sWNuCbHcPVKYP+TcxJiceOEpCPr5nxunmJRAAHkw0aUYIav3bLv8GQ/FpvtZeo/DEIjO
 eGRg==
X-Gm-Message-State: ANhLgQ1vQzVGkoK1WwH85ky8qMwzDVqADxyFa7FAq2sUXctWclapnVx9
 kDo/wYAVAoIQ/kL85vENoWaSrIbA30pqfz3f4eE=
X-Google-Smtp-Source: ADFU+vuixxXD6E83Se+A3fxjBuDJbzgnVRlk4H3OzapPj/Tx8F4lMfrfSZdtESpHMHHETQqeVADTdm78AJ0c9JswMp4=
X-Received: by 2002:a25:2d48:: with SMTP id s8mr1511372ybe.183.1584588990679; 
 Wed, 18 Mar 2020 20:36:30 -0700 (PDT)
MIME-Version: 1.0
References: <ef49e240-fc8f-9eb4-af98-26bfd39104aa@huawei.com>
 <CAN05THQYxPcsgiHTqMcsTgB6ZDYaBMamu-sOe428H7EwSRU2HQ@mail.gmail.com>
 <90d04a37-2d4b-dcac-4b48-c6bb4200db20@huawei.com>
In-Reply-To: <90d04a37-2d4b-dcac-4b48-c6bb4200db20@huawei.com>
Date: Wed, 18 Mar 2020 22:36:18 -0500
Message-ID: <CAH2r5muuS2RQpGTBaY+aQS8bCJLN7pnMTbp4Ur2hhGZqk9zKXA@mail.gmail.com>
Subject: Re: [PATCH] CIFS: Fix bug which the return value by asynchronous read
 is error
To: Yilu Lin <linyilu@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
Cc: linux-cifs <linux-cifs@vger.kernel.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Steve French <sfrench@samba.org>,
 alex.chen@huawei.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Merged into cifs-2.6.git for-next

On Wed, Mar 18, 2020, 21:50 Yilu Lin <linyilu@huawei.com> wrote:

> Hi,
> The bug is trigerred by the following test program.
> First, run the command to create one file on the share
> directory=E3=80=82COMMAND=EF=BC=9Add if=3D/dev/zero of=3D/home/temp/cifs/=
sys.zero bs=3D512
> count=3D1000 oflag=3Ddirect
> And then run the c program by the command: ./pread /home/temp/cifs/sys.ze=
ro
> The program will return "pread -22 bytes".However, the expected result is
> "pread -1 bytes".
>
> C program code is showed below:
>
>     #include<stdio.h>
>     #include<stdlib.h>
>     #include<unistd.h>
>     #include <sys/types.h>
>     #include <sys/stat.h>
>     #define __USE_GNU 1
>     #include <fcntl.h>
>     int main(int argc, char *argv[])
>     {
>             int fd;
>             ssize_t len;
>             int ret;
>             int size =3D 512;
>             char *file=3Dargv[1];
>
>             unsigned char *buf2;
>             ret =3D posix_memalign((void **)&buf2, 512, size);
>             if (ret) {
>                     printf("malloc err!\n");
>                     return 0;
>             }
>
>             fd =3D open(file, O_RDWR | O_DIRECT);
>             if(fd =3D=3D -1) {
>                     printf("open error!\n");
>                     free(buf2);
>                     return 0;
>             }
>
>             len =3D pread(fd, buf2, 504, 511992);
>             printf("pread %d bytes\n", len);
>             free(buf2);
>             close(fd);
>             return 0;
>     }
>
> regards
> Yilu Lin
>
> =E5=9C=A8 2020/3/18 12:47, ronnie sahlberg =E5=86=99=E9=81=93:
> > Hi Yilu,
> >
> > I think your reasoning makes sense.
> > Do you have a small reproducer for this? A small C program that trigger=
s
> this?
> >
> > I am asking because if you do we would like to add it to our buildbot
> > to make  sure we don't get regressions.
> >
> >
> > regards
> > ronnie sahlberg
> >
> > On Wed, Mar 18, 2020 at 1:59 PM Yilu Lin <linyilu@huawei.com> wrote:
> >>
> >> This patch is used to fix the bug in collect_uncached_read_data()
> >> that rc is automatically converted from a signed number to an
> >> unsigned number when the CIFS asynchronous read fails.
> >> It will cause ctx->rc is error.
> >>
> >> Example:
> >> Share a directory and create a file on the Windows OS.
> >> Mount the directory to the Linux OS using CIFS.
> >> On the CIFS client of the Linux OS, invoke the pread interface to
> >> deliver the read request.
> >>
> >> The size of the read length plus offset of the read request is greater
> >> than the maximum file size.
> >>
> >> In this case, the CIFS server on the Windows OS returns a failure
> >> message (for example, the return value of
> >> smb2.nt_status is STATUS_INVALID_PARAMETER).
> >>
> >> After receiving the response message, the CIFS client parses
> >> smb2.nt_status to STATUS_INVALID_PARAMETER
> >> and converts it to the Linux error code (rdata->result=3D-22).
> >>
> >> Then the CIFS client invokes the collect_uncached_read_data function t=
o
> >> assign the value of rdata->result to rc, that is, rc=3Drdata->result=
=3D-22.
> >>
> >> The type of the ctx->total_len variable is unsigned integer,
> >> the type of the rc variable is integer, and the type of
> >> the ctx->rc variable is ssize_t.
> >>
> >> Therefore, during the ternary operation, the value of rc is
> >> automatically converted to an unsigned number. The final result is
> >> ctx->rc=3D4294967274. However, the expected result is ctx->rc=3D-22.
> >>
> >> Signed-off-by: Yilu Lin <linyilu@huawei.com>
> >> ---
> >>  fs/cifs/file.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/fs/cifs/file.c b/fs/cifs/file.c
> >> index 022029a5d..ff4ac244c 100644
> >> --- a/fs/cifs/file.c
> >> +++ b/fs/cifs/file.c
> >> @@ -3323,7 +3323,7 @@ again:
> >>         if (rc =3D=3D -ENODATA)
> >>                 rc =3D 0;
> >>
> >> -       ctx->rc =3D (rc =3D=3D 0) ? ctx->total_len : rc;
> >> +       ctx->rc =3D (rc =3D=3D 0) ? (ssize_t)ctx->total_len : rc;
> >>
> >>         mutex_unlock(&ctx->aio_mutex);
> >>
> >> --
> >> 2.19.1
> >>
> >>
> >
> > .
> >
>
>

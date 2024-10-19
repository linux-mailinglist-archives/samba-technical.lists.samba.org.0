Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E20F49A4B32
	for <lists+samba-technical@lfdr.de>; Sat, 19 Oct 2024 06:40:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=/pIdrHUk4NgYKPHrLj9iCkP4ATaF4vihyuIk6lFezro=; b=YiUhuvQLilbtHYOnVp8HXxUQSa
	K/K/Hi6Q/YsKuzBRK6QzllE2y41CGbSSeHI6EX1wc9RcxyZ82LkRkdahviKRrLSLc/x+8Mq64rjw4
	SRwP16qvYhWkzFLOlkxl+lPLReUomV9E5q9JhECeYfk1muMDfA4bC8pVNDVqXe5dgg+n2ClTXefGc
	hyfZm/LGAYEHI23zhr6lfDEKHxQxMTdn9Dma8k+1yLJGpaQS3+Iq/3/GiQKRca3Tgws9xY57n7Lo4
	bAon3k5fTHdWzIuSbEmNdk0GbGueBxpUBoV8LU2gltiO1ox7I3CYZ8vECkYj4k9vp2dncQIqv5TQ/
	5sLBH9wA==;
Received: from ip6-localhost ([::1]:23338 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t21Fj-004S71-MM; Sat, 19 Oct 2024 04:39:47 +0000
Received: from mail-ua1-f54.google.com ([209.85.222.54]:45400) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t21Fe-004S6u-M7
 for samba-technical@lists.samba.org; Sat, 19 Oct 2024 04:39:45 +0000
Received: by mail-ua1-f54.google.com with SMTP id
 a1e0cc1a2514c-84fcb49691fso864934241.3
 for <samba-technical@lists.samba.org>; Fri, 18 Oct 2024 21:39:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729312781; x=1729917581;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w/C/WxPzPfTvHgZ06DSHUsv01A/LcHYzu+JdzwJOqh0=;
 b=bdw15VjsY0NvVWb4cxcmiMSFO6IcWpsXsWbQdFK+z8kFDOm6yHkAxQ+g531wtSAoU2
 oDtMBuu62egk76lYGAOfLMLnkJd1MIMi0p9DDh4EK7uXYG9gqyI/rnEaoMXwf8rlWDsw
 sczbut2zuKbaRGPjPL/oYDYHDalhni1RoGQX2qZAx2Glwo/lSXQ45aF+XZIlVzuGKavd
 Thk62kYpDOptaRXpN+EOlHIWD97ww9mSSP9t6lk2FtIqwIw+L4oJn1/xBJ5rFtZmC39n
 FZZP9LyuXmp8yhb1HZ+H8tvYBb/FlieWZtodASQbe6pZo3jkavacsaTYA9odssxOMhjk
 MZ2Q==
X-Gm-Message-State: AOJu0YwBcrTgzUBQ/w2zPDyV3DokV7i0jvW12JHN9N57WZ70bofYwYqn
 Yf6MfmZr5dDkyMe9ih39VMwwn0HQaY02ztMCB6Kl+iPGlIomXSNTilxXtg==
X-Google-Smtp-Source: AGHT+IFEd2kOGdld77NhLWwpEtBVtOhuNQtdp+Hb3lwLLmgpd1rSjjNffmXk7cdUyk9ZMv1NiXa38g==
X-Received: by 2002:a05:6122:919:b0:50d:354a:19ae with SMTP id
 71dfb90a1353d-50dda3a0fd7mr4222219e0c.10.1729312780489; 
 Fri, 18 Oct 2024 21:39:40 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com.
 [209.85.222.49]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-50dd746c535sm438199e0c.5.2024.10.18.21.39.40
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Oct 2024 21:39:40 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id
 a1e0cc1a2514c-851f5d3001fso202895241.1
 for <samba-technical@lists.samba.org>; Fri, 18 Oct 2024 21:39:40 -0700 (PDT)
X-Received: by 2002:a05:6122:1d16:b0:50d:4cb8:5afd with SMTP id
 71dfb90a1353d-50dda1ac1edmr4524058e0c.4.1729312780006; Fri, 18 Oct 2024
 21:39:40 -0700 (PDT)
Received: from 1064022179695 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 19 Oct 2024 00:39:39 -0400
Received: from 1064022179695 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 19 Oct 2024 04:39:35 +0000
MIME-Version: 1.0 (Mimestream 1.4.1)
Date: Sat, 19 Oct 2024 00:39:39 -0400
X-Gmail-Original-Message-ID: <CAE8T=_Gkaz3=cqTNAcyYSH1Bd_Z+PMoptFJ5Junqi-EemhvDnw@mail.gmail.com>
Message-ID: <CAE8T=_Gkaz3=cqTNAcyYSH1Bd_Z+PMoptFJ5Junqi-EemhvDnw@mail.gmail.com>
Subject: Linux client sends unexpected FSCTL_GET_REPARSE_POINT for file stat
 when using SMB311 POSIX
To: samba-technical@lists.samba.org
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
From: =?utf-8?q?Jean-Fran=C3=A7ois_Roy_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?B?SmVhbi1GcmFuw6dvaXMgUm95?= <jf@devklog.net>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,

I=E2=80=99m new to the list, new to SMB, and new to Samba, so please forgiv=
e
misunderstandings and misconceptions.

I have been debugging a strange issue a home using a given server and share
and a variety of Linux clients (different kernels and user space). The
visible effect was issuing a stat command from a shell on a file in a
mounted share would either return =E2=80=9COperation not supported=E2=80=9D=
 or a directory
entry, depending on the client. This didn=E2=80=99t happen for all files, o=
nly
some, with no obvious pattern. This also specifically happens when using
SMB311 POSIX extensions. When omitting the posix mount flag, the operations
are different (of course) and the problem does not happen.

After reading some code and doing some packet captures, the issue boils
down to the Linux client issuing an erroneous (I believe) or unexpected
FSCTL_GET_REPARSE_POINT compound operation on what should be a totally
normal file in a normal directory tree. The server returns
STATUS_NOT_A_REPARSE_POINT (0xc0000275) which yields the visible errors.

I think for some reason cifs_open_data_reparse under smb311_posix_get_fattr=
 is
returning true, but I don=E2=80=99t see why it would do that given the pack=
ets I
have captured. I have not traced or debugged the kernel client yet, so I
don=E2=80=99t have more information about that hypothesis.

I don=E2=80=99t know what is special about the specific files that are trig=
gering
this fault. I have renamed one problematic file and the issue continued to
happen, so it=E2=80=99s not the specific file name file name length or tota=
l path
length. The file does not have any extended attributes.

I have shared representative packet captures and configurations on Google
Drive.
https://drive.google.com/drive/folders/1cyfc0WXCkXgpyzYv1oZ87ZyVqTL3r3dl

Some information about my setup:


   - Samba smbd version 4.22.0pre1-UNKNOWN (using
   quay.io/samba.org/samba-server:nightly@sha256:ff4b3a6ea834cdf4d9ac2d3410=
5c6ac3d66cdb095b5c3434ceb4095fab41aecf).
   This version has the patch for statfs under SMB311 POSIX connections.
   - Samba running as a container on a Kubernetes cluster, bare metal.
   Linux 6.11.1
   - Share root is on a openzfs dataset.
   - Client kernels I have tested: 6.11.1 (my own
   build), 6.6.44-production+truenas
   - All client kernels have `CONFIG_CIFS_ALLOW_INSECURE_LEGACY=3Dy`
   - Mount command (POSIX): mount -t smb3 -o user=3Dx,vers=3D3.1.1,posix
   //server/share mountpoint
   - Mount command (no POSIX): mount -t smb3 -o user=3Dx,vers=3D3.1.1
   //server/share mountpoint


I=E2=80=99m going to continue investigating (in particular setup QEMU to de=
bug the
kernel client on the latest kernel RC), but I thought I=E2=80=99d share my =
findings
so far.

Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C785F30859A
	for <lists+samba-technical@lfdr.de>; Fri, 29 Jan 2021 07:22:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=yzWO+5nzEqk+QreMpsNSddsSW+ctODNRAMzf13KFv0g=; b=UttI8XC2KUxp4L0ehyNNJFY6YC
	zAWpUQXHoBAWAaTjwltVaj3T2DgNo21Q5SJx7nl4uETbnK11IvrR7msqEGFVUY2Zx/ORo4Je8oJJo
	XkTFp5d8xPGlgTxStfVBMJx5yjGWNVKjK/8Z/8ssi4USZunRg29+G8pP0UFPL9ToqjOJHU/72P76q
	5KxdOFN0BBCkCOPC+QrTtqqb+Se5vCw7oSmnVIU/MPFrvNB8XO5+wXoA303XX03Bul06xOep2p6a4
	QU8bv7yIxKBvVDDNg8loZ9Qh1D0mHu27iXgypoCDCDgWvmMcCjopDHN+mxB/FkJecIA+JhTft26BD
	b3bM1o0A==;
Received: from ip6-localhost ([::1]:42928 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l5NAD-007gVB-1G; Fri, 29 Jan 2021 06:21:49 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:32905) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l5NA4-007gV3-JC
 for samba-technical@lists.samba.org; Fri, 29 Jan 2021 06:21:45 +0000
Received: by mail-lf1-x12a.google.com with SMTP id b2so10995265lfq.0
 for <samba-technical@lists.samba.org>; Thu, 28 Jan 2021 22:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ev8uJHlu4Y/XW8AO1G10tio69sdWAKBd84vumipXTgQ=;
 b=dxzVZWwlwDR2yDIhrlOSdFzHPxpmFaIzsIixgcCwjJvpOB+aOpUX0Or6IGfTkwF2SX
 OWxEPSlx+8WFQhK9rMBwcME0/nBYfXrR869LzxW3j5Iz46wio9jj+mzksQrklT9qmvbu
 RAyXD+Yi4rgRCT3QUBioJCUKsw6bPFiEW01SarkTxGthIcv5BNTYYgPQ+XBdA+pY+93s
 zT35ZGDmW8JJeR8xnxwJWmh2FqVx8tQW1RUjWVw96PSNm4ynR4NI5jW/XVYq6o44bWrf
 qk446WdLLFOHymdI0eB5Sn9P8sMNWHaXiuYb1qNH0XW6GHZ2GSuD/kikhPZYKpAwTddU
 USzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ev8uJHlu4Y/XW8AO1G10tio69sdWAKBd84vumipXTgQ=;
 b=U5ZhX4v3eYRjz5+DKVo7722fDkOBCr1PheYNlCPw0VE89KTwUz0LO3gAJw2kXw6xVW
 Zu9DeSkVjtBRo4uddUkxm6zMQPY4o7IwL6qDjVf28s48m0n8Lng+whXePGLrAWmviPcg
 fvyL4RU/48bu0dyb7vXwSWndjry6t9TwBkZWjFPqU/qx0xuvyH0DJGiu2KMAp9LLMUg+
 tXh9UTmkCbyGyjEQK4NZS7CqPQAUuhf2hn4qV1LsQ5PTXwjrCvQbU1UXAtoGOyr6fJsy
 m65/ER1TEMMKbEt4LuDViZ2/ow73vmwAkCBTFHFqN44+Vdb58pYprlrgz1ywKMzoGCFv
 vRmA==
X-Gm-Message-State: AOAM533WjSiuhSk+Y+Ff7fKaICSaPVZvffenxtJoK7qitE7wY69ZyBQt
 RwkGLtmCIo/CYXnpgKo9gGHItAA145nt8aG1n7c=
X-Google-Smtp-Source: ABdhPJz4RtYp7TT+IJ2d7eb02Dv/elNHlaWYXwviVuFsoCnxaKIfm/4TwzqCpz2OWOr88bXY2FI1ai7oLA9Fkcu1img=
X-Received: by 2002:a05:6512:1311:: with SMTP id
 x17mr1364591lfu.307.1611901278407; 
 Thu, 28 Jan 2021 22:21:18 -0800 (PST)
MIME-Version: 1.0
References: <smfrench/smb3-kernel/pull/21@github.com>
In-Reply-To: <smfrench/smb3-kernel/pull/21@github.com>
Date: Fri, 29 Jan 2021 00:21:06 -0600
Message-ID: <CAH2r5mtUEYDyFGesXGsK_rP2007EP3X58i9-NFUY=ZMZR-hU1g@mail.gmail.com>
Subject: Fwd: [smfrench/smb3-kernel] Cifsd fixes (#21)
To: Namjae Jeon <namjae.jeon@samsung.com>
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Merged into smb3-kernel github tree, and rebased on 5.11-rc5 pending more
testing (will try to kick off more testing this weekend).

---------- Forwarded message ---------
From: Namjae Jeon <notifications@github.com>
Date: Wed, Jan 27, 2021 at 11:25 PM
Subject: [smfrench/smb3-kernel] Cifsd fixes (#21)
To: smfrench/smb3-kernel <smb3-kernel@noreply.github.com>
Cc: Subscribed <subscribed@noreply.github.com>


Description for this pull request:

   - Avoid calling ksmbd_override_fsids recursively.
   - Make xattr format of ksmbd compatible with samba's one.
   - Use netdevice_notifier to configure TCP listeners.
   - Fix a build break with linux-5.11 kernel.

------------------------------
You can view, comment on, or merge this pull request online at:

  https://github.com/smfrench/smb3-kernel/pull/21
Commit Summary

   - cifsd: set supplementary groups when overriding credentials
   - cifsd: avoid calling ksmbd_override_fsids recursively
   - cifsd: Change alloc_iface() return type in transport_tcp.c
   - cifsd: Use netdevice_notifier to configure TCP listeners
   - cifsd: fix a memleak from netdevice_notifier
   - cifsd: make xattr format of ksmbd compatible with samba's one
   - cifsd: macros with complex values should be enclosed in parentheses
   - cifsd: fix build break with linux-5.11 kernel

File Changes

   - *M* fs/cifsd/Makefile
   <https://github.com/smfrench/smb3-kernel/pull/21/files#diff-13a1445bc5af=
cf91b3135cfc53c83b546ff6741cd17902937b4030162990820e>
   (2)
   - *M* fs/cifsd/auth.c
   <https://github.com/smfrench/smb3-kernel/pull/21/files#diff-381fb3a09da3=
451eeea4ae3029730c1c92bbed381327f311fd1e153ad96590aa>
   (34)
   - *M* fs/cifsd/auth.h
   <https://github.com/smfrench/smb3-kernel/pull/21/files#diff-9ee6f94aa7c9=
7acc87330571f4974c284e3638682d8662419067ac7049bca740>
   (2)
   - *M* fs/cifsd/crypto_ctx.c
   <https://github.com/smfrench/smb3-kernel/pull/21/files#diff-731c968a66f9=
44df8c362587d30f683400c61aa40b827b15837afcf329c27c32>
   (8)
   - *M* fs/cifsd/crypto_ctx.h
   <https://github.com/smfrench/smb3-kernel/pull/21/files#diff-44f4e94b5520=
200e7003e947b70571dec5d1f91b0fefe60cc24b84a56d192a5a>
   (4)
   - *M* fs/cifsd/ksmbd_server.h
   <https://github.com/smfrench/smb3-kernel/pull/21/files#diff-d7a6189bb902=
920845f1b16b60b23dc6e5b79619426ce81fec051cd575b2321b>
   (2)
   - *M* fs/cifsd/ksmbd_work.c
   <https://github.com/smfrench/smb3-kernel/pull/21/files#diff-45cdbce20e00=
968980ab5b673840997b7db3ef1ceb01959136146eed28efd756>
   (2)
   - *M* fs/cifsd/ksmbd_work.h
   <https://github.com/smfrench/smb3-kernel/pull/21/files#diff-28da00cf886c=
7c49441c784bace3139cdacc95987b46216d81c512f676fcf54d>
   (5)
   - *A* fs/cifsd/ndr.c
   <https://github.com/smfrench/smb3-kernel/pull/21/files#diff-fef259d09b45=
f87954b831ea54e078f4518f5c4417515873344c0de23921deea>
   (337)
   - *A* fs/cifsd/ndr.h
   <https://github.com/smfrench/smb3-kernel/pull/21/files#diff-a96203b39f53=
284684579596723fe5b0035eb91cf9856de440a84d55bdea5f17>
   (21)
   - *M* fs/cifsd/smb2pdu.c
   <https://github.com/smfrench/smb3-kernel/pull/21/files#diff-f7433629c858=
4faf4172019089efd7cde0f325939807b2b0a6120b2258f74715>
   (294)
   - *M* fs/cifsd/smb_common.c
   <https://github.com/smfrench/smb3-kernel/pull/21/files#diff-441aeb0c7e69=
99addc85a93c33c950ea637323e8d3eb79f19919033308dbb05b>
   (36)
   - *M* fs/cifsd/smbacl.c
   <https://github.com/smfrench/smb3-kernel/pull/21/files#diff-3d348fb0b8bd=
1408076e13cf84a5160305faa8af1d6a69d740fd36036b5b914c>
   (545)
   - *M* fs/cifsd/smbacl.h
   <https://github.com/smfrench/smb3-kernel/pull/21/files#diff-a1e66e03b569=
d8088f2c4266607a2b6c2589ab8813741e3c36210d6e4cd6bcb4>
   (35)
   - *M* fs/cifsd/transport_ipc.c
   <https://github.com/smfrench/smb3-kernel/pull/21/files#diff-70b141042a80=
072dba68db2b1456a183505658908438038fffdc0266c64413cf>
   (4)
   - *M* fs/cifsd/transport_tcp.c
   <https://github.com/smfrench/smb3-kernel/pull/21/files#diff-db0aa3a6adea=
bfd54633c447b9beaf27fbb46f6b1ecd8c72aef4fb72581a04b1>
   (126)
   - *M* fs/cifsd/unicode.c
   <https://github.com/smfrench/smb3-kernel/pull/21/files#diff-2bd5af44e29b=
547dd9fda5b3d24352adacbb8b8080e33241d6641a4f3df69ef0>
   (2)
   - *M* fs/cifsd/vfs.c
   <https://github.com/smfrench/smb3-kernel/pull/21/files#diff-249654a638ec=
41b364ee6977b6a0d3ad3f06e5a711f7f53d1d8e743acc276b8b>
   (462)
   - *M* fs/cifsd/vfs.h
   <https://github.com/smfrench/smb3-kernel/pull/21/files#diff-ba6b2ac156d8=
0a0d1650305ffe6147b0ab677fa20a5083df7bae9fc299822d35>
   (100)
   - *M* fs/cifsd/vfs_cache.h
   <https://github.com/smfrench/smb3-kernel/pull/21/files#diff-004686895854=
dcd4630e0991bb4eea14bf87d8056b6351516840ed6435112956>
   (2)

Patch Links:

   - https://github.com/smfrench/smb3-kernel/pull/21.patch
   - https://github.com/smfrench/smb3-kernel/pull/21.diff

=E2=80=94
You are receiving this because you are subscribed to this thread.
Reply to this email directly, view it on GitHub
<https://github.com/smfrench/smb3-kernel/pull/21>, or unsubscribe
<https://github.com/notifications/unsubscribe-auth/ADSTN5QP7UMTO6WHMMIMZ5TS=
4DYMNANCNFSM4WWNZCFQ>
.


--=20
Thanks,

Steve

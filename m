Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C53E9AA1172
	for <lists+samba-technical@lfdr.de>; Tue, 29 Apr 2025 18:21:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=uid5tg2WKagkoZW8ahMEAIIKaurQ/GgeHOIGBZrjfMI=; b=0owof4Rug1Mpw2OI6UbR+CQ3OT
	J+GE4hzFLB6j8s3qSLT/iEm9mWxa6cf+4LL0+bjcNEtzLGoBe75XRyfzmnzk4jJgPIE+tpeUBKFWA
	yDnnWB5wv7VU5XTV1kt+3MU1DesbnB0/VYLqOKBfExCgSWkRMzEcUxojee2W6hfPGysmtpvtxJsc3
	fCUqVFIHFKeNF7dxa3wr5YARQxlFjWem0UiIO3XEbwZmlJxqIu5WDJrdtdUxPtSXeLihLx4gqnVrD
	HcSRMSAB6WbwXav0AMEc/egCgH7HXqfc68YAgbKLs4P9BP5ePKY2kqROTV0i+6jRr0A4KV0U1eK8q
	MLOeLnKA==;
Received: from ip6-localhost ([::1]:61720 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1u9nhB-000zXJ-NJ; Tue, 29 Apr 2025 16:20:33 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:58750) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u9nh6-000zXC-MR
 for samba-technical@lists.samba.org; Tue, 29 Apr 2025 16:20:30 +0000
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-3106217268dso58937471fa.1
 for <samba-technical@lists.samba.org>; Tue, 29 Apr 2025 09:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745943627; x=1746548427; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uid5tg2WKagkoZW8ahMEAIIKaurQ/GgeHOIGBZrjfMI=;
 b=ZonP+8BVvhuYSaNduVFS+KFgva99JApMNEr6RlDU7o3C0dS/jv1/6R0NoquBy0WR2h
 ZgtNLAlX8ZZpWV+B4Fl2lKxPJEKS6EyxCJEB5IHRBONjc2vByv4vmvTW8rITjEb+evl9
 AQtn0iHtLNpETNCHh/5yYXWcc7oR/ezyIBQR6poBZU08ehK8a0NE2tF5ZSwA5Z3Jp8eM
 ob1CzDlj45ohnGxCqTqD6JlgBMBZxvL3pKz/bwZ+qSxrVkeSUavl/umFf8Wx1HS5UBro
 P7oya/AuI46jA3zbScHDxIy5Ps69/YFUDsxvPMoUWHQrTlA7OQe73xUEVLQVr5vcpNSS
 s8fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745943627; x=1746548427;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uid5tg2WKagkoZW8ahMEAIIKaurQ/GgeHOIGBZrjfMI=;
 b=tUtLhOF/wFWcownjWcZw7uDxBgMq5lrR4QVUcSN/LtL8ViY/37vRDxBl+ValYrwSjm
 QM7S9WSqiThbJfNP+U8vqo1S3zluAKErtbCuaj7LH9BpTCJOcCJfUVR2TUdPdNZ4v7Jd
 U0Ut3H9eXbX33KwLNGU8X04WzL/sRgNNQ5nry1YsUpTFRj/w2NcE9SZ9YDp2iyR7/HA7
 D2Rtq7KwJ5y/72Q12n2RkDeLfssorxVIy/Ty7yokDE+4mIuXvL0+svKw6vERBq8c+pd3
 HRn6mjXhROJPdA9jSHck8+ypPLnvOQGsOtbaedbLVTqrRDBueiqo+Rfnw+lslAkddtvm
 p7RQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIidgg2NDfWjAXArqAhUO9SLoBPc5xXmunuF2ljqidX1YsRcaZRhLQxxYFiTF2gZg56121V4Zv8kzDmVk5K+Q=@lists.samba.org
X-Gm-Message-State: AOJu0YyOGtdsX0ZDs031vbW/CDfT1jHjHAQllZGr6If4a04JbpXnxCoe
 l5FqnR4zEmwhwpo6uElZetVyus6sW1e95lRD6SqZdGp08BSiZNnRPmj0uD452V0ri+aEHkpr+FO
 XTnnKuFmC4RRFz9vrRa+8VckBzVM=
X-Gm-Gg: ASbGncvhWeifcusAkk/cOBWhDcVlGN8FceO5a8K/daifLWJxiZVgH8+E9vOtfRZ2tC8
 b/NF3sapw/33dNityVyq7XVIL6QSfvT1jnDt/t0HmLteG1vM0YNBwwvIITlq9sJWdmHEG9XvBVb
 EMXq/GM0YWmiv2nRLsxulifwR+oB8RKt3AMs/1W3Z4hPyTbgm5yuJej7II
X-Google-Smtp-Source: AGHT+IGcmzOe4ooum0VgSQDbgCwGIc6+9kCfQRumX2wBC7b8sYs0N4QmX6vP5KnX+x4vjdkQzw/VCnJ9lMzSMaHPjyM=
X-Received: by 2002:a2e:be06:0:b0:30b:d156:9e97 with SMTP id
 38308e7fff4ca-31d33ec36f6mr17449611fa.8.1745943626619; Tue, 29 Apr 2025
 09:20:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250430005915.5e1f3c82@deetop.local.jro.nz>
In-Reply-To: <20250430005915.5e1f3c82@deetop.local.jro.nz>
Date: Tue, 29 Apr 2025 11:20:14 -0500
X-Gm-Features: ATxdqUFaAZeGlEEMhjAdhmuIw1kpGSjmwQ4WjCxKnWeTHLbLEGBpz-3jrYAtG7A
Message-ID: <CAH2r5mvi+N7w=EmzSgH9YxEEbDLn0HXZ8cni1PKC+3d6qaS4XA@mail.gmail.com>
Subject: Re: [PATCH] smb: client: fix zero length for mkdir POSIX create
 context
To: Jethro Donaldson <devel@jro.nz>
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
Cc: pc@manguebit.com, linux-cifs@vger.kernel.org,
 "Volker.Lendecke@sernet.de" <Volker.Lendecke@sernet.de>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Good catch.  I did verify that this fixes posix mkdir to ksmbd.  It
didn't fail to Samba with posix extensions because Samba didn't check
for the incorrect length field.   The fix also avoids another problem,
an rmmod crash.  See below.

I added Cc: stable, and added the patch to cifs-2.6.git for-next


[ 1249.919717] RIP: 0010:__slab_err+0x1d/0x30
[ 1249.919719] Code: 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 44
00 00 55 48 89 e5 e8 72 ff ff ff be 01 00 00 00 bf 05 00 00 00 e8 33
b2 1c 00 <0f> 0b 5d 31 f6 31 ff c3 cc cc cc cc 0f 1f 80 00 00 00 00 90
90 90
[ 1249.919721] RSP: 0018:ffffcf3041b0bab8 EFLAGS: 00010046
[ 1249.919723] RAX: 0000000000000000 RBX: ffffcf3041b0bb00 RCX: 00000000000=
00000
[ 1249.919724] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00000000000=
00000
[ 1249.919725] RBP: ffffcf3041b0bab8 R08: 0000000000000000 R09: 00000000000=
00000
[ 1249.919727] R10: 0000000000000000 R11: 0000000000000000 R12: ffff8c1b664=
fed00
[ 1249.919728] R13: ffff8c1b9cda6600 R14: dead000000000122 R15: ffff8c1b9cd=
a6600
[ 1249.919729] FS:  00007d4b43e26080(0000) GS:ffff8c2312c9b000(0000)
knlGS:0000000000000000
[ 1249.919730] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1249.919732] CR2: 0000634aa6374a88 CR3: 00000002b21fe006 CR4: 00000000003=
726f0
[ 1249.919733] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 00000000000=
00000
[ 1249.919734] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 00000000000=
00400
[ 1249.919735] Call Trace:
[ 1249.919737]  <TASK>
[ 1249.919739]  free_partial.cold+0x137/0x191
[ 1249.919743]  __kmem_cache_shutdown+0x46/0xa0
[ 1249.919746]  kmem_cache_destroy+0x3e/0x1c0
[ 1249.919750]  cifs_destroy_request_bufs+0x39/0x50 [cifs]
[ 1249.919814]  exit_cifs+0x3a/0xcc0 [cifs]
[ 1249.919873]  __do_sys_delete_module.isra.0+0x19d/0x2e0
[ 1249.919877]  __x64_sys_delete_module+0x12/0x20

On Tue, Apr 29, 2025 at 8:17=E2=80=AFAM Jethro Donaldson <devel@jro.nz> wro=
te:
>
> smb: client: fix zero length for mkdir POSIX create context
>
> SMB create requests issued via smb311_posix_mkdir() have an incorrect
> length of zero bytes for the POSIX create context data. A ksmbd server
> rejects such requests and logs "cli req too short" causing mkdir to fail
> with "invalid argument" on the client side.
>
> Inspection of packets sent by cifs.ko using wireshark show valid data for
> the SMB2_POSIX_CREATE_CONTEXT is appended with the correct offset, but
> with an incorrect length of zero bytes. Fails with ksmbd+cifs.ko only as
> Windows server/client does not use POSIX extensions.
>
> Fix smb311_posix_mkdir() to set req->CreateContextsLength as part of
> appending the POSIX creation context to the request.
>
> Signed-off-by: Jethro Donaldson <devel@jro.nz>
> ---
>
> Tested as far as mkdir now works as expected.
>
> Patch is against stable tree at v6.14.4 tag (first patch - unsure if I've
> correctly done the base-commit thing, sorry).
>
> diff --git a/fs/smb/client/smb2pdu.c b/fs/smb/client/smb2pdu.c
> index 163b8fea47e8..e7118501fdcc 100644
> --- a/fs/smb/client/smb2pdu.c
> +++ b/fs/smb/client/smb2pdu.c
> @@ -2920,6 +2920,7 @@ int smb311_posix_mkdir(const unsigned int xid, stru=
ct inode *inode,
>                 req->CreateContextsOffset =3D cpu_to_le32(
>                         sizeof(struct smb2_create_req) +
>                         iov[1].iov_len);
> +               le32_add_cpu(&req->CreateContextsLength, iov[n_iov-1].iov=
_len);
>                 pc_buf =3D iov[n_iov-1].iov_base;
>         }
>
>
> base-commit: ea061bad207e1ba693b5488ba64c663f7ca03f50
> --
> 2.49.0
>


--=20
Thanks,

Steve


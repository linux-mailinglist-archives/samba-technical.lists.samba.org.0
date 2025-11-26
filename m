Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADB2C8A95A
	for <lists+samba-technical@lfdr.de>; Wed, 26 Nov 2025 16:18:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=/n2IMyT4UBDvSfcwRBffepGkIzE0NI5Ntu4zwVrBvtI=; b=MtoqIwJ0P7dus2oISsX8qg0hFX
	ntZfyQc3mRC/fDQQG9RwAp+Upt7jk72RmycAfc9PzhIp5aAtWfcrSsu3zL1NH0bOh/+0aGCI1Czkr
	E/5OSXivUX/7nz9GneyQj46YhB81gwC6u9kKa8fXlxRbNkXp4bCZtKEvIr5JCNi82C1S/yigze395
	EpSGhFP/nN6/GyuCnArqYopFEEXfGSR+x64KypUlCDsDDxNiEVvjYYxTvdgA6I3bNRgYK/n/5DdkN
	0iNBLBusdY1bXm6Z+437V3kTYLnwsdxLn24Lk9h/tLUq8oyk6tu+7gF1o1Z4MMXyFgxkML1oxq9yu
	IEk64ZDQ==;
Received: from ip6-localhost ([::1]:48472 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vOHGx-00DO0A-Vf; Wed, 26 Nov 2025 15:17:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25]:59060) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vOHGs-00DO02-Qn
 for samba-technical@lists.samba.org; Wed, 26 Nov 2025 15:17:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A49586020B
 for <samba-technical@lists.samba.org>; Wed, 26 Nov 2025 15:17:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D378C4CEF8
 for <samba-technical@lists.samba.org>; Wed, 26 Nov 2025 15:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764170237;
 bh=/n2IMyT4UBDvSfcwRBffepGkIzE0NI5Ntu4zwVrBvtI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SLRwb7fT7Jff6G2MPAW5+gMN8q3GdHFK5wDAh752DkzYkFd7tUrKRjujd1Z5/Mmpe
 rVPqsxEnYVMLjx6o5CtUgKvcWywCQV65fKumT0LKGg9G5giVdV2RzxqiDMomiuyG36
 pNzdO6+7rdBjevkNpXqVD8auYEY9vE+9ylnBSBLLrnWmuxNjVFC/LB9Fo+Xg6nKObM
 T1LTdhxabtY+QNzJOus0FnjqS575m4Vyse5hOK1yNo8qXVWMNa79S09IeKVCVpJvKB
 xzumoLxnpQIeT0HNT+7c2eC3/5JdFfMRePKeI7iij+d0Tgr7lxrvvlD6pAtSDxFGqh
 Lmm3FbH+N/UCg==
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-6419aaced59so9472941a12.0
 for <samba-technical@lists.samba.org>; Wed, 26 Nov 2025 07:17:17 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWOUhIfd+Y0pnpkiChAGGSNMry3BxaLbheBscqVSnbtZ0Am9DtJ2iKmY8VLymGgmCl0BOZ3qZC/IPMYtYbU/5M=@lists.samba.org
X-Gm-Message-State: AOJu0YyXqLcKVZG0efKrsAdVXelnSkbXOOkDClnqgMoTWmdwP0AqfIPl
 yGvRU32S+H66Tcq3tlYRmfSJYZEMXIqSMtj/kpesWjFxUJPNP/LR5JIuO+KEOU+vowKv1ePio/x
 0l/V2eyVunz3kXjmMpzKyVCP2JX1LjTA=
X-Google-Smtp-Source: AGHT+IH123LKj8eIYxZA00cVdSKsJ038DSdVfsNBAbRkT2TbspDoe30m7yPWucZaG5pSpNFhXs9LycH8U3wTRcV1L4Y=
X-Received: by 2002:a05:6402:3489:b0:63c:4da1:9a10 with SMTP id
 4fb4d7f45d1cf-645546a3c05mr16718820a12.31.1764170235879; Wed, 26 Nov 2025
 07:17:15 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764080338.git.metze@samba.org>
 <CAKYAXd_HKKBKx_B7+Z+b_jt+rHazuMkskYYPAp6BROPuy0uBfA@mail.gmail.com>
 <2786ee25-b543-48a8-8fff-e6c7ff341774@samba.org>
In-Reply-To: <2786ee25-b543-48a8-8fff-e6c7ff341774@samba.org>
Date: Thu, 27 Nov 2025 00:17:02 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8N-j8K1CUUH9_+wXpEZBo5i=K=ywkQPjJmmo76JbmXng@mail.gmail.com>
X-Gm-Features: AWmQ_bkqVgnyCnpD3sDHpobxA475gQK_ZOcqTm_BmFVg9DdXo_z4G3WaYPWokkI
Message-ID: <CAKYAXd8N-j8K1CUUH9_+wXpEZBo5i=K=ywkQPjJmmo76JbmXng@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] smb: smbdirect/client/server: relax
 WARN_ON_ONCE(SMBDIRECT_SOCKET_*) checks
To: Stefan Metzmacher <metze@samba.org>
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
Cc: linux-cifs@vger.kernel.org, Paulo Alcantara <pc@manguebit.org>,
 samba-technical@lists.samba.org, Tom Talpey <tom@talpey.com>,
 Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Nov 26, 2025 at 4:16=E2=80=AFPM Stefan Metzmacher <metze@samba.org>=
 wrote:
>
> Am 26.11.25 um 00:50 schrieb Namjae Jeon:
> > On Tue, Nov 25, 2025 at 11:22=E2=80=AFPM Stefan Metzmacher <metze@samba=
.org> wrote:
> >>
> >> Hi,
> >>
> >> here are some small cleanups for a problem Nanjae reported,
> >> where two WARN_ON_ONCE(sc->status !=3D ...) checks where triggered
> >> by a Windows 11 client.
> >>
> >> The patches should relax the checks if an error happened before,
> >> they are intended for 6.18 final, as far as I can see the
> >> problem was introduced during the 6.18 cycle only.
> >>
> >> Given that v1 of this patchset produced a very useful WARN_ONCE()
> >> message, I'd really propose to keep this for 6.18, also for the
> >> client where the actual problem may not exists, but if they
> >> exist, it will be useful to have the more useful messages
> >> in 6.16 final.
> > First, the warning message has been improved. Thanks.
> > However, when copying a 6-7GB file on a Windows client, the following
> > error occurs. These error messages did not occur when testing with the
> > older ksmbd rdma(https://github.com/namjaejeon/ksmbd).
>
> With transport_rdma.* from restored from 6.17?
I just tested it and this issue does not occur on ksmbd rdma of the 6.17 ke=
rnel.
>
> metze


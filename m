Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8F7ACA82D
	for <lists+samba-technical@lfdr.de>; Mon,  2 Jun 2025 04:37:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=9Zp9lICLn7YMJhD8ytpGNKovmeD/DkjslX4xw3DXW8g=; b=AJoeeCnc7TZ4/Ol0tqqond1C7k
	pM8+/ktTBmnVbnkmppNtd0r3evUbgOy68uPUqxTQOvG67AQhskW8i4daDd6VM2/RU2rFV6P5Iy8Pp
	d3MzzUr3Ir2S+zQsAr4ldnLyKnvM68aVidH7nsomX6BQssEiYoMsQWW/Re7zgkaDbKMvpVAyATcRF
	tuiT8mfIKl8Z8ZXFRnFZAyRQ2i+cFy5kWho89kwCp4JWTqDGPbXSkCnOJ7oQVmJMV9NDy99GVrqQ8
	BkSEBo90+JYw9wAGhnbVJ7ZWU+fbqiGjo4szz2vxAOxkqX1Wrn0+XrHt3AcStBQl954es3BEhdPen
	GVfWym0w==;
Received: from ip6-localhost ([::1]:51460 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uLv3B-006P6G-FZ; Mon, 02 Jun 2025 02:37:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25]:41724) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uLv33-006P69-22
 for samba-technical@lists.samba.org; Mon, 02 Jun 2025 02:37:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E932D61165
 for <samba-technical@lists.samba.org>; Mon,  2 Jun 2025 02:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48975C4CEF5
 for <samba-technical@lists.samba.org>; Mon,  2 Jun 2025 02:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748830810;
 bh=7risdpGz7FAd01z0rm02eT/UBIee2qwgomiUozxpsec=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dAFW5wI1cZL0qHqO5bLdmDc4DsxYySWfdiLkiYg+UGbYTYWmlVBtcCnKhVCQlA0wi
 1ooD4Zdr+qmfSNbyl+gB/kjUYm85j4bEAEvnTXrG7vNePIE9bC8sWtXJW9dtA1natx
 VRe/Z07EdKFqdM2JQTPtigtzNjx7GRE6bVGQoMdojNLm4TpVXykgiTuS1F0PLJhQrr
 sNAcQMMbrECgQrYzzwSKIgnTOFl9BdSxkXz8QdekjUEJQqUNqGTWqYhfBvfM/wJ0Il
 WN/VgKWWeyV+OZK8PLwH2W/Ctb/qfK2hgbln1yvlOqJSCjLRXHiSbtUqlD1P+QX9sX
 xIWMjAobOtxoQ==
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-6020ff8d54bso6875165a12.2
 for <samba-technical@lists.samba.org>; Sun, 01 Jun 2025 19:20:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVf7VhXwfVr0y2Q4QKW0Xorkqmeht8ZmDZTkD/9hu2kg/+oCUbXZNwciMQwU6gbUSi+09QRssRdXjTkjYExpM8=@lists.samba.org
X-Gm-Message-State: AOJu0Yw9vmDnA9i+4a3BEC7LTMRffLtikQ0DOVA1byeAhSrRwAvH+EOd
 M+ERZgP7557Nwz957a42x8N4uTA11/U0UNsLcLyqYQjqaSHepPPwXBNIVIoP727RMIHLpuEKSFV
 0cusDKZZn2IweeYvR2u19BRqp+BZH3ig=
X-Google-Smtp-Source: AGHT+IHRq1uDEdiPHSPdQUH2Nnj980Ixe/uA4Lo/f7Da1mvZ/2PN3NLTMgQ+SSSZsB2BarXLIlWJsPUD0BvX6GC+/jQ=
X-Received: by 2002:a17:907:7212:b0:ad8:9257:5733 with SMTP id
 a640c23a62f3a-adb493cbf58mr693342066b.20.1748830808831; Sun, 01 Jun 2025
 19:20:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1748446473.git.metze@samba.org>
 <b43ee94c3db13291156e70d37a3e843ad7d08b31.1748446473.git.metze@samba.org>
 <CAKYAXd_df0mwgAbJb3w_r_8JmJOAZjPfhjoFpWgTkWJFdMWUMA@mail.gmail.com>
 <096f20e9-3e59-4e80-8eeb-8a51f214c6f1@samba.org>
 <CAKYAXd86mLGAaAEUFcp1Vv+6p2O3MSJcwoor8MmjEypUo+Ofrg@mail.gmail.com>
 <CAH2r5mvQbL_R9wrFRHF9_3XwM3e-=2vK=i1uaSCk37-FZmJq9g@mail.gmail.com>
 <CAKYAXd9T81En40i3OigiTAmJabMr8yuCX9E1LT_JfaTmyefTag@mail.gmail.com>
 <CAH2r5mso54sXPcoJWDSU4E--XMH44wFY-cdww6_6yx5CxrFtdg@mail.gmail.com>
 <CAKYAXd_BVHPA8Jj6mtc_nsbby1HizZFEmCft20B_wcTM3pDUVg@mail.gmail.com>
 <CAH2r5mvygcy0-WwZNu6NvjXGrMtB5ZFLK7_w0rc6rVpaVDeBxA@mail.gmail.com>
In-Reply-To: <CAH2r5mvygcy0-WwZNu6NvjXGrMtB5ZFLK7_w0rc6rVpaVDeBxA@mail.gmail.com>
Date: Mon, 2 Jun 2025 11:19:56 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-4-WRw9bL-shqELhMO70fyznmeh0HByA=pyOcccu3sgg@mail.gmail.com>
X-Gm-Features: AX0GCFvRSzqkyCX0CC4bt_Ydy_QDFwc9l63WU8_kqYdKU6UKzHw2VQU2oSdGhpw
Message-ID: <CAKYAXd-4-WRw9bL-shqELhMO70fyznmeh0HByA=pyOcccu3sgg@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] smb: smbdirect: add smbdirect_pdu.h with
 protocol definitions
To: Steve French <smfrench@gmail.com>
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
Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>,
 CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Hyunchul Lee <hyc.lee@gmail.com>, Stefan Metzmacher <metze@samba.org>,
 Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Jun 2, 2025 at 10:57=E2=80=AFAM Steve French <smfrench@gmail.com> w=
rote:
>
> > Can you explain why he has split it into smbdirect_socket.h?
>
> The three header names seem plausible, but would be useful to have
> Metze's clarification/explanation:
> - the "protocol" related header info for smbdirect goes in
> smb/common/smbdirect/smbdirect_pdu.h   (we use similar name smb2pdu.h
> for the smb2/smb3 protocol related wire definitions)
> - smbdirect.h for internal smbdirect structure definitions
> - smbdirect_socket.h for things related to exporting it as a socket
> (since one of the goals is to make smbdirect useable by Samba
> userspace tools)
There is no need to do things in advance that are not yet concrete and
may change later.
He can just put these changes in his own queue and work on them.
I am pointing out why he is trying to put unfinished things in the public q=
ueue.
If You want to apply it, Please do it only on cifs.ko. When it is
properly implemented, I want to apply it to ksmbd.
>
> On Sun, Jun 1, 2025 at 12:00=E2=80=AFAM Namjae Jeon <linkinjeon@kernel.or=
g> wrote:
> >
> > On Sun, Jun 1, 2025 at 12:49=E2=80=AFPM Steve French <smfrench@gmail.co=
m> wrote:
> > >
> > > Moving to use common headers is something I did multiple times with k=
smbd and cifs.ko already, not a bad first step
> > This is not simply moved to the common header. He splits the header
> > into smaller pieces for some unknown reason.
> > Can you explain why he has split it into smbdirect_socket.h?
> > We doesn't need to do it now if he's thinking of creating a
> > smbdirect_socket.c file later.
> > >
> > > Thanks,
> > >
> > > Steve
> > >
> > > On Sat, May 31, 2025, 7:01=E2=80=AFPM Namjae Jeon <linkinjeon@kernel.=
org> wrote:
> > >>
> > >> On Sun, Jun 1, 2025 at 8:23=E2=80=AFAM Steve French <smfrench@gmail.=
com> wrote:
> > >> >
> > >> > I do like the small, relatively safe steps he is doing these in.
> > >> Small is okay, but I wonder when he will send the rest.
> > >> What if he just separates it like this and doesn't send the rest of
> > >> patches later?
> > >> I've never seen a case where the headers are separated first,
> > >> And send the main if it's implemented later. This is not a personal =
repository.
> > >>
> > >> Thanks.
> > >> >
> > >> > Thanks,
> > >> >
> > >> > Steve
> > >> >
> > >> > On Fri, May 30, 2025, 5:29=E2=80=AFPM Namjae Jeon <linkinjeon@kern=
el.org> wrote:
> > >> >>
> > >> >> On Sat, May 31, 2025 at 4:03=E2=80=AFAM Stefan Metzmacher <metze@=
samba.org> wrote:
> > >> >> >
> > >> >> > Am 29.05.25 um 01:28 schrieb Namjae Jeon:
> > >> >> > > On Thu, May 29, 2025 at 1:02=E2=80=AFAM Stefan Metzmacher <me=
tze@samba.org> wrote:
> > >> >> > >>
> > >> >> > >> This is just a start moving into a common smbdirect layer.
> > >> >> > >>
> > >> >> > >> It will be used in the next commits...
> > >> >> > >>
> > >> >> > >> Cc: Steve French <smfrench@gmail.com>
> > >> >> > >> Cc: Tom Talpey <tom@talpey.com>
> > >> >> > >> Cc: Long Li <longli@microsoft.com>
> > >> >> > >> Cc: Namjae Jeon <linkinjeon@kernel.org>
> > >> >> > >> Cc: Hyunchul Lee <hyc.lee@gmail.com>
> > >> >> > >> Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>
> > >> >> > >> Cc: linux-cifs@vger.kernel.org
> > >> >> > >> Cc: samba-technical@lists.samba.org
> > >> >> > >> Signed-off-by: Stefan Metzmacher <metze@samba.org>
> > >> >> > >> ---
> > >> >> > >>   fs/smb/common/smbdirect/smbdirect_pdu.h | 55 +++++++++++++=
++++++++++++
> > >> >> > >>   1 file changed, 55 insertions(+)
> > >> >> > >>   create mode 100644 fs/smb/common/smbdirect/smbdirect_pdu.h
> > >> >> > >>
> > >> >> > >> diff --git a/fs/smb/common/smbdirect/smbdirect_pdu.h b/fs/sm=
b/common/smbdirect/smbdirect_pdu.h
> > >> >> > >> new file mode 100644
> > >> >> > >> index 000000000000..ae9fdb05ce23
> > >> >> > >> --- /dev/null
> > >> >> > >> +++ b/fs/smb/common/smbdirect/smbdirect_pdu.h
> > >> >> > >> @@ -0,0 +1,55 @@
> > >> >> > >> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > >> >> > >> +/*
> > >> >> > >> + *   Copyright (c) 2017 Stefan Metzmacher
> > >> >> > > Isn't it 2025? It looks like a typo.
> > >> >> >
> > >> >> > I took it from here:
> > >> >> > https://git.samba.org/?p=3Dmetze/linux/smbdirect.git;a=3Dblob;f=
=3Dsmbdirect_private.h;hb=3D284ad8ea768c06e3cc70d6f2754929a6abbd2719
> > >> >> >
> > >> >> > > And why do you split the existing one into multiple header
> > >> >> > > files(smbdirect_pdu.h, smbdirect_socket.h, smbdirect.h)?
> > >> >> >
> > >> >> > In the end smbdirect.h will be the only header used outside
> > >> >> > of fs/smb/common/smbdirect, it will be the public api, to be us=
ed
> > >> >> > by the smb layer.
> > >> >> >
> > >> >> > smbdirect_pdu.h holds protocol definitions, while smbdirect_soc=
ket.h
> > >> >> > will be some kind of internal header that holds structures shar=
ed between multiple .c files.
> > >> >> >
> > >> >> > But we'll see I think this is a start in the correct direction.
> > >> >> When will you send the patches for multiple .c files?
> > >> >> I'm not sure if this is the right direction when I check only thi=
s patch-set.
> > >> >> I don't prefer to change the headers like this in advance without=
 a body.
> > >> >> When you're ready, how about sending the patches including the bo=
dy all at once?
> > >> >> >
> > >> >> > I try to focus on doing tiny steps avoiding doing to much at th=
e same time
> > >> >> > or even try to avoid thinking about the next step already...
> > >> >> >
> > >> >> > metze
>
>
>
> --
> Thanks,
>
> Steve


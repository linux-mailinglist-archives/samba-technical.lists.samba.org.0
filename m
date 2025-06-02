Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 158F0ACA81F
	for <lists+samba-technical@lfdr.de>; Mon,  2 Jun 2025 03:57:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ZHGTRI4OoccGkRynWoGInJUpFy17mwKB39OxXBmCuH8=; b=RbyW63xoOGbBGwWL8nodihbcTO
	BTLVOetdPekctbUPgF3WKoY4OakjvFzDVmvzZvOkNRxHVHQ1TmYjW4eA/3GHCRKP53O6bCx6UE+4t
	ZZUELst5+PyuuyVa5jXLvZ56D6m6IYcvtJJsrsnnemD3oRNe5KU8MBCumBlmUSjo2cH9pIEtXc3RP
	UUhO+L99LGGrEgtUXS4nhuTaS1rzGcmrkbs+h8VXAYwrkvzRMfBtiK759psp17om9OO5+UEt6yBp1
	bpHR27lmfQlynDvig3YZFUt6FeHFJThwewLOVASCoV5G/sxPiT2XbMN5eEf23X3qovW+HTlMI3Jc7
	OLc/6MwA==;
Received: from ip6-localhost ([::1]:49264 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uLuQI-006Ozq-31; Mon, 02 Jun 2025 01:57:10 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:44450) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uLuQ6-006Ozj-SG
 for samba-technical@lists.samba.org; Mon, 02 Jun 2025 01:57:07 +0000
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-32a6a1a5f6dso36491101fa.1
 for <samba-technical@lists.samba.org>; Sun, 01 Jun 2025 18:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748829417; x=1749434217; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZHGTRI4OoccGkRynWoGInJUpFy17mwKB39OxXBmCuH8=;
 b=kB+Ki6uz/YikddrzTP4aP9X2HrXo7eH9BuVhMPkvldKu58d2lj450DzzOux0mf6riV
 87H+xGoCAAZqZMfgUVNWV9+y/usE9f0RZnrs8GdIRfq3tsR8E92DtK+0a/PXJH3BqMll
 3muqQjAZhcRfm0xO0lW9O+12pNKGP5S35Oe+aKfpcmaPi8apPbjoI1mpM7Xz6MU6HUkg
 TdVxpBi/byXalryJ5zdZKtj0yynMI2OTFQ/pOAQ4jln6EX6+XA1JURbzVTAVwp5xLA9Y
 ZW2p8gMTxez4yLveju6xByoWRLxzrVWbhGNVDdnRjx4OXRa6XKxX9mEHClYx6rEzSuFc
 Bx8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748829417; x=1749434217;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZHGTRI4OoccGkRynWoGInJUpFy17mwKB39OxXBmCuH8=;
 b=UGaOE3KzoCABjYRaFavQMd2ISPUTq2Zr52wt3Mw/tatJcqX2UA+vigoZDL2zUjeTca
 8VGazkkQmEGUzvnBeqRl3/+VHsRrRGYRiKfXfrJfgh0Kxu4279ymE9QtpLhlsWQh0vB6
 wPopzIUtacGt4AuLcHa+5TDi1o2srK3DkrGIuzQ8TvnxQAJPH7xWhoQuZfaRS3sN7m1h
 l0fP6ueo5EteNotJrcpffm7vQag5N4qM0Xf8TFIcRsA0OSVEAw6bDLiJK8jncB8XNpbP
 dVILIOYUoaHEICPUnni8NAlDZ3vwuQSODfKeaHVKjz3473TulhPsNFRfNhBzoxfM+kHo
 xviQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUv2zMwQSfp+jd3txrTuSOhc2R+JUWdnbNkMtak9p6OQ7oiJlTDnzUSEgz34xRm9EGqt0rvNne7hbub4Vs3b+A=@lists.samba.org
X-Gm-Message-State: AOJu0YzXTs0MRyFDDO7Ql8mesjtP5gMIMvRDl4VvPwGa/yW/FaweXhV0
 rfdafN8Sg6C6BzAPz8vNsl6LNBlkT2PMKk626vCcuO2ZnwAGYtoHTvF6suf/DscrlRbvHlH59h7
 RME+XUKZBX1FQkGrjC6TVLJ/iyhWtLtc=
X-Gm-Gg: ASbGncthQlksIV4LHkoLJQs15FRGsbulZGOIf/fLSZkj6emolfyEuOes8QVzz4FBPsB
 KheCjDSB4eRQGsrwn57fTtNCVHAcXrv1G2w10S7m3wG9apU6/LAK7dM4DwgOI8riKgqw4l5InvI
 88OXmtc3UhoaR43zuEG78XLfNYv1ghFzK2pFudF0ghvJL3qAbxNGdBEd+v2EMyR2esEVrx08siN
 RMw
X-Google-Smtp-Source: AGHT+IEJVs0h6mmYJxZYvbe5X10CMO2Kyt68ftrFl6gVFuRA5aY8nZgVqa8fLfU9yQzt/nFb3Hvuu43oMkpzwc6APYY=
X-Received: by 2002:a05:651c:221a:b0:32a:6b16:3a20 with SMTP id
 38308e7fff4ca-32a8ce3871amr38651951fa.29.1748829416867; Sun, 01 Jun 2025
 18:56:56 -0700 (PDT)
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
In-Reply-To: <CAKYAXd_BVHPA8Jj6mtc_nsbby1HizZFEmCft20B_wcTM3pDUVg@mail.gmail.com>
Date: Sun, 1 Jun 2025 20:56:45 -0500
X-Gm-Features: AX0GCFsrkFzp3OvWJF63SovgSoF5lPD082yGsAPlfjTR_bDrLK5Z8cNbb9dt3lc
Message-ID: <CAH2r5mvygcy0-WwZNu6NvjXGrMtB5ZFLK7_w0rc6rVpaVDeBxA@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] smb: smbdirect: add smbdirect_pdu.h with
 protocol definitions
To: Namjae Jeon <linkinjeon@kernel.org>
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
Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>,
 CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Hyunchul Lee <hyc.lee@gmail.com>, Stefan Metzmacher <metze@samba.org>,
 Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

> Can you explain why he has split it into smbdirect_socket.h?

The three header names seem plausible, but would be useful to have
Metze's clarification/explanation:
- the "protocol" related header info for smbdirect goes in
smb/common/smbdirect/smbdirect_pdu.h   (we use similar name smb2pdu.h
for the smb2/smb3 protocol related wire definitions)
- smbdirect.h for internal smbdirect structure definitions
- smbdirect_socket.h for things related to exporting it as a socket
(since one of the goals is to make smbdirect useable by Samba
userspace tools)

On Sun, Jun 1, 2025 at 12:00=E2=80=AFAM Namjae Jeon <linkinjeon@kernel.org>=
 wrote:
>
> On Sun, Jun 1, 2025 at 12:49=E2=80=AFPM Steve French <smfrench@gmail.com>=
 wrote:
> >
> > Moving to use common headers is something I did multiple times with ksm=
bd and cifs.ko already, not a bad first step
> This is not simply moved to the common header. He splits the header
> into smaller pieces for some unknown reason.
> Can you explain why he has split it into smbdirect_socket.h?
> We doesn't need to do it now if he's thinking of creating a
> smbdirect_socket.c file later.
> >
> > Thanks,
> >
> > Steve
> >
> > On Sat, May 31, 2025, 7:01=E2=80=AFPM Namjae Jeon <linkinjeon@kernel.or=
g> wrote:
> >>
> >> On Sun, Jun 1, 2025 at 8:23=E2=80=AFAM Steve French <smfrench@gmail.co=
m> wrote:
> >> >
> >> > I do like the small, relatively safe steps he is doing these in.
> >> Small is okay, but I wonder when he will send the rest.
> >> What if he just separates it like this and doesn't send the rest of
> >> patches later?
> >> I've never seen a case where the headers are separated first,
> >> And send the main if it's implemented later. This is not a personal re=
pository.
> >>
> >> Thanks.
> >> >
> >> > Thanks,
> >> >
> >> > Steve
> >> >
> >> > On Fri, May 30, 2025, 5:29=E2=80=AFPM Namjae Jeon <linkinjeon@kernel=
.org> wrote:
> >> >>
> >> >> On Sat, May 31, 2025 at 4:03=E2=80=AFAM Stefan Metzmacher <metze@sa=
mba.org> wrote:
> >> >> >
> >> >> > Am 29.05.25 um 01:28 schrieb Namjae Jeon:
> >> >> > > On Thu, May 29, 2025 at 1:02=E2=80=AFAM Stefan Metzmacher <metz=
e@samba.org> wrote:
> >> >> > >>
> >> >> > >> This is just a start moving into a common smbdirect layer.
> >> >> > >>
> >> >> > >> It will be used in the next commits...
> >> >> > >>
> >> >> > >> Cc: Steve French <smfrench@gmail.com>
> >> >> > >> Cc: Tom Talpey <tom@talpey.com>
> >> >> > >> Cc: Long Li <longli@microsoft.com>
> >> >> > >> Cc: Namjae Jeon <linkinjeon@kernel.org>
> >> >> > >> Cc: Hyunchul Lee <hyc.lee@gmail.com>
> >> >> > >> Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>
> >> >> > >> Cc: linux-cifs@vger.kernel.org
> >> >> > >> Cc: samba-technical@lists.samba.org
> >> >> > >> Signed-off-by: Stefan Metzmacher <metze@samba.org>
> >> >> > >> ---
> >> >> > >>   fs/smb/common/smbdirect/smbdirect_pdu.h | 55 +++++++++++++++=
++++++++++
> >> >> > >>   1 file changed, 55 insertions(+)
> >> >> > >>   create mode 100644 fs/smb/common/smbdirect/smbdirect_pdu.h
> >> >> > >>
> >> >> > >> diff --git a/fs/smb/common/smbdirect/smbdirect_pdu.h b/fs/smb/=
common/smbdirect/smbdirect_pdu.h
> >> >> > >> new file mode 100644
> >> >> > >> index 000000000000..ae9fdb05ce23
> >> >> > >> --- /dev/null
> >> >> > >> +++ b/fs/smb/common/smbdirect/smbdirect_pdu.h
> >> >> > >> @@ -0,0 +1,55 @@
> >> >> > >> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> >> >> > >> +/*
> >> >> > >> + *   Copyright (c) 2017 Stefan Metzmacher
> >> >> > > Isn't it 2025? It looks like a typo.
> >> >> >
> >> >> > I took it from here:
> >> >> > https://git.samba.org/?p=3Dmetze/linux/smbdirect.git;a=3Dblob;f=
=3Dsmbdirect_private.h;hb=3D284ad8ea768c06e3cc70d6f2754929a6abbd2719
> >> >> >
> >> >> > > And why do you split the existing one into multiple header
> >> >> > > files(smbdirect_pdu.h, smbdirect_socket.h, smbdirect.h)?
> >> >> >
> >> >> > In the end smbdirect.h will be the only header used outside
> >> >> > of fs/smb/common/smbdirect, it will be the public api, to be used
> >> >> > by the smb layer.
> >> >> >
> >> >> > smbdirect_pdu.h holds protocol definitions, while smbdirect_socke=
t.h
> >> >> > will be some kind of internal header that holds structures shared=
 between multiple .c files.
> >> >> >
> >> >> > But we'll see I think this is a start in the correct direction.
> >> >> When will you send the patches for multiple .c files?
> >> >> I'm not sure if this is the right direction when I check only this =
patch-set.
> >> >> I don't prefer to change the headers like this in advance without a=
 body.
> >> >> When you're ready, how about sending the patches including the body=
 all at once?
> >> >> >
> >> >> > I try to focus on doing tiny steps avoiding doing to much at the =
same time
> >> >> > or even try to avoid thinking about the next step already...
> >> >> >
> >> >> > metze



--=20
Thanks,

Steve


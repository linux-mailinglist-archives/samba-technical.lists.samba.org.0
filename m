Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 374C1AC9DAB
	for <lists+samba-technical@lfdr.de>; Sun,  1 Jun 2025 05:50:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=rRXRjX3ojhP/kW9wJebm7I2ZDTwOrp7N+n0E/qoBvFs=; b=qBjX4RiDtPZ+s1uIEF665Injf5
	6lbF4lKx7fctwjLm1YZKU7Gn4XRh+IzlGyrqEgJlXnIK9j9bIy+4oGr14hnosii/D3irWUQfHP1e/
	8AAE4GIlNewoibkj4SdfeGnPmtRLg4sIRfAnAs4DhOhdQeTScq/yp51tWi22PUmVyoeMyBueMdzO8
	111MeIEc2S/DRlDC+4cflDwSosF5p8rie+uxDyx0WdwMY6nE+X7+PKP7rX1Ngss8crwCBBcBx9ntZ
	n9R3mBh8RChDB4WLOGSaOlIFFwqNHATxJNyT9mUqH0NjQcbprIe1VkrfpIAtxCwa4xoH0AUcMQD+F
	l37wudOg==;
Received: from ip6-localhost ([::1]:24570 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uLZhT-006NEb-3V; Sun, 01 Jun 2025 03:49:31 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:44150) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uLZhL-006NEU-3D
 for samba-technical@lists.samba.org; Sun, 01 Jun 2025 03:49:26 +0000
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5532a30ac41so4008413e87.0
 for <samba-technical@lists.samba.org>; Sat, 31 May 2025 20:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748749761; x=1749354561; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gul54LbIyfW0wfkYUdCP4tuBA/AVHDhfHIAxXBmrFG4=;
 b=M7jq91pNEkfqt2QgI3XMqb/xNCTTZcq6YdTtpc2UEcNDL3gPoeXAzqfBbYwGXjXnX3
 ukRg0V2TTO/0CxaZnqiJTy8me+dJ7yDADuhCVUuRSrkHq9+bZ1VNbefncn75znrznq9W
 5XhURyTpknoyt9FVNt/33455ZssFES75y9dDwwLFA3F6HVpnnTajJ42AUTtQmW+uIZVq
 iVmeKyDemQihovGs+pSL/6vT/MbOmj+s7eRKLmV0mPP6ZAlIDJhUwjKxFegSJcn3vcsJ
 XCvtW9ADBwEtqmEt/lE6hbdcTtfbUTmheVUYIGqU4hQK5TONNMbOuvHWQMe6+hAr+hjq
 57CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748749761; x=1749354561;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gul54LbIyfW0wfkYUdCP4tuBA/AVHDhfHIAxXBmrFG4=;
 b=wc7PC+D3JVit4Na6aDE9rxcXblLbqxM+9qT5J1xB+nMRFrWJeBEEGKL+a8WQOyMDjQ
 XlIJa+NP1bmrOsjUxhp2Wekqcu6z0HUTGMbJrr0apxp7ACKR+q1ZV4Xq3xPnLoRgz/Zh
 an8ymx2XMBqnpkBMo+wQQr9hz9wz4VY/0aH1f9dEt1vLr7kshP9jDgxdjxu+J9byBLVn
 VWLOJKHyjjSkNWFPqgromwjG9OHTpnSPwW38yDTwOBNBmYgY9XdGOAV5wzfcjWipjBz9
 6OvOaAfUk8mkidonuzLIk9aKvMLVpm3sBrsUz/qi9tQzqdqtNaQrLk4W4CykMUF1Ishd
 3gRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnuFXMCE697LkJiETj8rvTGcBYuD/rP55KbuDIOiBGaisoxtZtfEaagD3N4vUX78Cv8gswf9QVpJTAeIrjeTk=@lists.samba.org
X-Gm-Message-State: AOJu0YwxzjjRnGT4B5JP+WxKPCijIf1oa2jDcGLkTCI5JsDhRvP0k2zr
 dDxHkPtHAkJOEQNL91H90ZikHekx36GWegz1excEsJ75QNkRJNbac2nKLM6hBNYlrT6mLMSxElk
 xH2oxJty3OX5hQsHWNlbvK+/KgGng1dw=
X-Gm-Gg: ASbGncsb7IJ/FEw56AWXedNu9BnjFsPfrjBYum+VgftF0PxAnL0QkPeF0TR4DK+ZeIK
 0WOh2T5/8IAJuT/6p9iAaGNkfRYiEuVXLaSgPVr3jV0yKIcInXcPxnhLkt0V+t4uh5kv2l4C1PB
 NmuMxivnqGwyWqiztPLsV00pRkqqYCm5DMEdlOZRN2pJpQFfwbjvU1ualFZSpU+cu8iN+RD98Lc
 KEn
X-Google-Smtp-Source: AGHT+IELduPqWne0yisB3FKgxSiNc7w6Q4zP1KpaNP8GBg/sYo8WeCHELQZuukpYp+0JPp6BusqYi5vP3NiLGdf+emM=
X-Received: by 2002:a05:6512:ea0:b0:54f:c2ca:d33 with SMTP id
 2adb3069b0e04-5533b8f40f1mr2744387e87.20.1748749760887; Sat, 31 May 2025
 20:49:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1748446473.git.metze@samba.org>
 <b43ee94c3db13291156e70d37a3e843ad7d08b31.1748446473.git.metze@samba.org>
 <CAKYAXd_df0mwgAbJb3w_r_8JmJOAZjPfhjoFpWgTkWJFdMWUMA@mail.gmail.com>
 <096f20e9-3e59-4e80-8eeb-8a51f214c6f1@samba.org>
 <CAKYAXd86mLGAaAEUFcp1Vv+6p2O3MSJcwoor8MmjEypUo+Ofrg@mail.gmail.com>
 <CAH2r5mvQbL_R9wrFRHF9_3XwM3e-=2vK=i1uaSCk37-FZmJq9g@mail.gmail.com>
 <CAKYAXd9T81En40i3OigiTAmJabMr8yuCX9E1LT_JfaTmyefTag@mail.gmail.com>
In-Reply-To: <CAKYAXd9T81En40i3OigiTAmJabMr8yuCX9E1LT_JfaTmyefTag@mail.gmail.com>
Date: Sat, 31 May 2025 22:49:09 -0500
X-Gm-Features: AX0GCFvWg-fSxQlL-a7ijlVakEMEci2W1Cn1osej3wNLI9RZgT3tg66QrG1Lw4o
Message-ID: <CAH2r5mso54sXPcoJWDSU4E--XMH44wFY-cdww6_6yx5CxrFtdg@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] smb: smbdirect: add smbdirect_pdu.h with
 protocol definitions
To: Namjae Jeon <linkinjeon@kernel.org>
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
Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>,
 CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Hyunchul Lee <hyc.lee@gmail.com>, Stefan Metzmacher <metze@samba.org>,
 Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Moving to use common headers is something I did multiple times with ksmbd
and cifs.ko already, not a bad first step

Thanks,

Steve

On Sat, May 31, 2025, 7:01=E2=80=AFPM Namjae Jeon <linkinjeon@kernel.org> w=
rote:

> On Sun, Jun 1, 2025 at 8:23=E2=80=AFAM Steve French <smfrench@gmail.com> =
wrote:
> >
> > I do like the small, relatively safe steps he is doing these in.
> Small is okay, but I wonder when he will send the rest.
> What if he just separates it like this and doesn't send the rest of
> patches later?
> I've never seen a case where the headers are separated first,
> And send the main if it's implemented later. This is not a personal
> repository.
>
> Thanks.
> >
> > Thanks,
> >
> > Steve
> >
> > On Fri, May 30, 2025, 5:29=E2=80=AFPM Namjae Jeon <linkinjeon@kernel.or=
g> wrote:
> >>
> >> On Sat, May 31, 2025 at 4:03=E2=80=AFAM Stefan Metzmacher <metze@samba=
.org>
> wrote:
> >> >
> >> > Am 29.05.25 um 01:28 schrieb Namjae Jeon:
> >> > > On Thu, May 29, 2025 at 1:02=E2=80=AFAM Stefan Metzmacher <metze@s=
amba.org>
> wrote:
> >> > >>
> >> > >> This is just a start moving into a common smbdirect layer.
> >> > >>
> >> > >> It will be used in the next commits...
> >> > >>
> >> > >> Cc: Steve French <smfrench@gmail.com>
> >> > >> Cc: Tom Talpey <tom@talpey.com>
> >> > >> Cc: Long Li <longli@microsoft.com>
> >> > >> Cc: Namjae Jeon <linkinjeon@kernel.org>
> >> > >> Cc: Hyunchul Lee <hyc.lee@gmail.com>
> >> > >> Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>
> >> > >> Cc: linux-cifs@vger.kernel.org
> >> > >> Cc: samba-technical@lists.samba.org
> >> > >> Signed-off-by: Stefan Metzmacher <metze@samba.org>
> >> > >> ---
> >> > >>   fs/smb/common/smbdirect/smbdirect_pdu.h | 55
> +++++++++++++++++++++++++
> >> > >>   1 file changed, 55 insertions(+)
> >> > >>   create mode 100644 fs/smb/common/smbdirect/smbdirect_pdu.h
> >> > >>
> >> > >> diff --git a/fs/smb/common/smbdirect/smbdirect_pdu.h
> b/fs/smb/common/smbdirect/smbdirect_pdu.h
> >> > >> new file mode 100644
> >> > >> index 000000000000..ae9fdb05ce23
> >> > >> --- /dev/null
> >> > >> +++ b/fs/smb/common/smbdirect/smbdirect_pdu.h
> >> > >> @@ -0,0 +1,55 @@
> >> > >> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> >> > >> +/*
> >> > >> + *   Copyright (c) 2017 Stefan Metzmacher
> >> > > Isn't it 2025? It looks like a typo.
> >> >
> >> > I took it from here:
> >> >
> https://git.samba.org/?p=3Dmetze/linux/smbdirect.git;a=3Dblob;f=3Dsmbdire=
ct_private.h;hb=3D284ad8ea768c06e3cc70d6f2754929a6abbd2719
> >> >
> >> > > And why do you split the existing one into multiple header
> >> > > files(smbdirect_pdu.h, smbdirect_socket.h, smbdirect.h)?
> >> >
> >> > In the end smbdirect.h will be the only header used outside
> >> > of fs/smb/common/smbdirect, it will be the public api, to be used
> >> > by the smb layer.
> >> >
> >> > smbdirect_pdu.h holds protocol definitions, while smbdirect_socket.h
> >> > will be some kind of internal header that holds structures shared
> between multiple .c files.
> >> >
> >> > But we'll see I think this is a start in the correct direction.
> >> When will you send the patches for multiple .c files?
> >> I'm not sure if this is the right direction when I check only this
> patch-set.
> >> I don't prefer to change the headers like this in advance without a
> body.
> >> When you're ready, how about sending the patches including the body al=
l
> at once?
> >> >
> >> > I try to focus on doing tiny steps avoiding doing to much at the sam=
e
> time
> >> > or even try to avoid thinking about the next step already...
> >> >
> >> > metze
>

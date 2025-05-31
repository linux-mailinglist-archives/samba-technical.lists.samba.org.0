Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C6346AC9D59
	for <lists+samba-technical@lfdr.de>; Sun,  1 Jun 2025 01:24:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=9XSFwTv5+Et6Kry7Z3gcU225TycsM9F/RGaRHWwYQ9k=; b=g/B4jMyHtPQlxyIT0Mxz/eWNJu
	901e0oxn+4cA8E4lmQnBuAFSRIJDzMKaqR0vk9P4RcXH5cAg0HXtotj7ONBYARO+6I3D9jD3r+3U5
	DiSbRfBNsFpHnXLcy1eq/7Po0Pd2bJFFPizmWYNQYuVmyHMe4NmQPVl0o95mI8jsYRcLRS08q5Z1j
	p/M+V4k3iwbmU/5fdkZ6x1tyUQYvRUU/R1Xb7G38w0xzn880kXBQgoIcIjidR01jiG99MRgLtuJJs
	qqbLFZRvPWyercp1qKGu8PfctRqya+kSTlhh9jcDRK/MueXPRRomAh9Pk4QP45ZJp8rw+X1YTkXgG
	rHyBggfQ==;
Received: from ip6-localhost ([::1]:50416 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uLVYP-004WGc-3t; Sat, 31 May 2025 23:23:53 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:48523) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uLVYK-004WGV-56
 for samba-technical@lists.samba.org; Sat, 31 May 2025 23:23:50 +0000
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5532f9ac219so3817651e87.1
 for <samba-technical@lists.samba.org>; Sat, 31 May 2025 16:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748733826; x=1749338626; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=u4D6k1BM0MVgGDeoLclI7t3FQuW6uVSbwMDACscL2yo=;
 b=d9NBiRyzaPkwilhNhM2JKqw0aacZCrvQkAB1PtJVNP1BTgHNhpMtC5TdzSHO1csOS9
 An/Lioij4Kz4aa1mJE1/sxlhn3XxwklyC3E+7EdGsTJiWCZInUK93l7p0yjmtLDdbMel
 e+Ifgrz8l96bU9m3JhMGju+kq3AHVghRQdZBOCNI3vPjCoX2WnNQlqT2GsBQtnYM0jly
 9telZPiW1rLeWsaQdoWyMjBZHcIs8mykhEPbmOqEDceRW9QHQOJe+gP5cUjS3z3nOZm+
 aES+2W4F8IdBa1ClPpfXfxn9eOnpcfit7dnMlcYD5VJJt2YHyNWjdITM7vJkZHSFXjBX
 LgEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748733826; x=1749338626;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u4D6k1BM0MVgGDeoLclI7t3FQuW6uVSbwMDACscL2yo=;
 b=sbBDWnN7X2i9PaCsOPAFCLpGxdcG/IKiSHUQ0W2Oq8cuDVihfH1CuNxSpP5gXVm0bB
 lQpMLOQL5nOoqhGxhu62PpwFmBU8/ju6Yz6nRuIQtr/X3kSl94P4puGfO/PD/iW4YfJH
 CqrVhclDEqIR0d7oL608jxpY1Kjs/lTgYeRkNTSam4Oy7/Q9WoppF/KeJ5csRjaMbZ64
 2jIJYKpHdjnkhHLI1zA6LFOD2M58tVJ6HtGnKtUkf4qRjRDEqEXKwkZK8qoN/G/BcWGc
 0vdsDaYIg5KYXPkeXkaAwDvRupSyI1CSEl/SnJa0+lhgi7OcAC4fA7Cnhm2elDK/+J/s
 sTPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWj4TQYOJPHjCSdSMeLCvhofp7mczAfgpdNFaq2l4Tadl8Zz7DxgipMdSKXljq+bL7z5x30x/2G52zbPt8tWuc=@lists.samba.org
X-Gm-Message-State: AOJu0YxxfGGVSMuO8A6cQtz9V3Gki3Y4aFcMY0gzrPkd97AmPMk4lrJq
 EXbrBNZ+u/ebOy09x6741/WsIAZccLCZkKyGYsgLqg/YYp2b2cB1gbZwBdkCnFOLGqjoBwM7kxo
 GOIyqWKge9gHP0omEQfJgBTlEOApr1UA=
X-Gm-Gg: ASbGnct9eICuT2beHiBNFOxuXrlf7YYyWMONALbdlRxybO0xsBkSnL49Bqi3O9s9gAJ
 UXwRhl23bC5HaKqJXN5wDijxqMuIMu1veo5VbnJKU8ZA/p2xTk1UyghMRXHzzkBsGdF+Wev+4pY
 OR1Mst70UzGmBjwTQJF0tHvHq4e7anqoPAR1PGocycEgucmB2e129BfPMBwHyYLmt6PtU=
X-Google-Smtp-Source: AGHT+IFDtvBZUIw9ciuR+4goaYZMIHPTW5bANWUcA7+b+Up9C5LSY+MderN+i/HaImqG7YW3SspSmcMmy46Ar4Lu9KM=
X-Received: by 2002:a05:6512:400c:b0:553:2f4a:746d with SMTP id
 2adb3069b0e04-5533b8e102dmr2829774e87.6.1748733825472; Sat, 31 May 2025
 16:23:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1748446473.git.metze@samba.org>
 <b43ee94c3db13291156e70d37a3e843ad7d08b31.1748446473.git.metze@samba.org>
 <CAKYAXd_df0mwgAbJb3w_r_8JmJOAZjPfhjoFpWgTkWJFdMWUMA@mail.gmail.com>
 <096f20e9-3e59-4e80-8eeb-8a51f214c6f1@samba.org>
 <CAKYAXd86mLGAaAEUFcp1Vv+6p2O3MSJcwoor8MmjEypUo+Ofrg@mail.gmail.com>
In-Reply-To: <CAKYAXd86mLGAaAEUFcp1Vv+6p2O3MSJcwoor8MmjEypUo+Ofrg@mail.gmail.com>
Date: Sat, 31 May 2025 18:23:32 -0500
X-Gm-Features: AX0GCFs1XCNiehPO2X44f9GWmP__sJLcvtxxe_BYftDsScc1PyTxPxD4C70lisg
Message-ID: <CAH2r5mvQbL_R9wrFRHF9_3XwM3e-=2vK=i1uaSCk37-FZmJq9g@mail.gmail.com>
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

I do like the small, relatively safe steps he is doing these in.

Thanks,

Steve

On Fri, May 30, 2025, 5:29=E2=80=AFPM Namjae Jeon <linkinjeon@kernel.org> w=
rote:

> On Sat, May 31, 2025 at 4:03=E2=80=AFAM Stefan Metzmacher <metze@samba.or=
g> wrote:
> >
> > Am 29.05.25 um 01:28 schrieb Namjae Jeon:
> > > On Thu, May 29, 2025 at 1:02=E2=80=AFAM Stefan Metzmacher <metze@samb=
a.org>
> wrote:
> > >>
> > >> This is just a start moving into a common smbdirect layer.
> > >>
> > >> It will be used in the next commits...
> > >>
> > >> Cc: Steve French <smfrench@gmail.com>
> > >> Cc: Tom Talpey <tom@talpey.com>
> > >> Cc: Long Li <longli@microsoft.com>
> > >> Cc: Namjae Jeon <linkinjeon@kernel.org>
> > >> Cc: Hyunchul Lee <hyc.lee@gmail.com>
> > >> Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>
> > >> Cc: linux-cifs@vger.kernel.org
> > >> Cc: samba-technical@lists.samba.org
> > >> Signed-off-by: Stefan Metzmacher <metze@samba.org>
> > >> ---
> > >>   fs/smb/common/smbdirect/smbdirect_pdu.h | 55
> +++++++++++++++++++++++++
> > >>   1 file changed, 55 insertions(+)
> > >>   create mode 100644 fs/smb/common/smbdirect/smbdirect_pdu.h
> > >>
> > >> diff --git a/fs/smb/common/smbdirect/smbdirect_pdu.h
> b/fs/smb/common/smbdirect/smbdirect_pdu.h
> > >> new file mode 100644
> > >> index 000000000000..ae9fdb05ce23
> > >> --- /dev/null
> > >> +++ b/fs/smb/common/smbdirect/smbdirect_pdu.h
> > >> @@ -0,0 +1,55 @@
> > >> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > >> +/*
> > >> + *   Copyright (c) 2017 Stefan Metzmacher
> > > Isn't it 2025? It looks like a typo.
> >
> > I took it from here:
> >
> https://git.samba.org/?p=3Dmetze/linux/smbdirect.git;a=3Dblob;f=3Dsmbdire=
ct_private.h;hb=3D284ad8ea768c06e3cc70d6f2754929a6abbd2719
> >
> > > And why do you split the existing one into multiple header
> > > files(smbdirect_pdu.h, smbdirect_socket.h, smbdirect.h)?
> >
> > In the end smbdirect.h will be the only header used outside
> > of fs/smb/common/smbdirect, it will be the public api, to be used
> > by the smb layer.
> >
> > smbdirect_pdu.h holds protocol definitions, while smbdirect_socket.h
> > will be some kind of internal header that holds structures shared
> between multiple .c files.
> >
> > But we'll see I think this is a start in the correct direction.
> When will you send the patches for multiple .c files?
> I'm not sure if this is the right direction when I check only this
> patch-set.
> I don't prefer to change the headers like this in advance without a body.
> When you're ready, how about sending the patches including the body all a=
t
> once?
> >
> > I try to focus on doing tiny steps avoiding doing to much at the same
> time
> > or even try to avoid thinking about the next step already...
> >
> > metze
>

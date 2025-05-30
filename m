Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F018CAC9609
	for <lists+samba-technical@lfdr.de>; Fri, 30 May 2025 21:28:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=re2ChLKOQ+JxwBs930OOJvsEwxjS1nTmkImmlcIrOWs=; b=Uo3hhMWzRpiJgYQwmqC7OQQIxl
	yC1fhaKKhakH+joXXXEhPWDyMbIVINL//cpK6gx9y0pRzBdIH/eJdt81YCNtnQjaKi73qAoQ7P34r
	mTJC7DDeZyFQN6VC+l9QZzm5yOYYwWoJ7YTYYhmKfKbJ/tlvOAJxb6zAkQqOtHW4e3NLalfea/OBI
	NAHqAp/mKg1CrciXMOHStlS1CYLNTMi3hLMFizoKdw/ThS2TO7M7zvXbq/ztnFLT8RzttSShXI8Jl
	Hrj7BaGUl+Wh6YmjzhMSC6AjHXzI5LQGEcDbDSFvSq0gsgcgqnvdNHbgQUIzvDp1vhlKMSa1Tj4ee
	mRlJexsw==;
Received: from ip6-localhost ([::1]:55096 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uL5Oh-004UIG-K1; Fri, 30 May 2025 19:28:07 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:58713) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uL5Oc-004UI9-RR
 for samba-technical@lists.samba.org; Fri, 30 May 2025 19:28:05 +0000
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-54b10594812so3014382e87.1
 for <samba-technical@lists.samba.org>; Fri, 30 May 2025 12:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748633281; x=1749238081; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=re2ChLKOQ+JxwBs930OOJvsEwxjS1nTmkImmlcIrOWs=;
 b=N3JtKQt+fbPvblqynHSBKVA1hnqE8QWcnAs88B9Rk5/E5raKlGg++lXKam2fUGuNKm
 VmYY6u4KpOD44ytRUlP1xOj1qVIcS9fcFRlgZxrHWKsWpOY65Maz2UWeQ3LKdGdBun5T
 QG2p+WCd1CykiFJFMFvq49FMVtASv9bHeeyL8xEsiNQaQIksJ05akIgpJ1tD6l8cNgyn
 9xbOqmmdeiqOeJJuWRnHyVVca/xXuu3Ndx6ndXovupTAPKHZ8GBsWJbUI7iuuotmqFtU
 sM0flKeHhwuOfqayoPbG1NA6Tt89yFWjTvmiVRlPPpG32i066eI0XM9Vq9Yrr33kT6jA
 rpwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748633281; x=1749238081;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=re2ChLKOQ+JxwBs930OOJvsEwxjS1nTmkImmlcIrOWs=;
 b=ZyDrk5+afX7cDrs+oTv/i27Tt/mbKVu2lxFavd9YdxhFtgAC+vRcdlZGAq105VA+UI
 Hm5JEx8MD1TE0JEmoudc5EVGDTfLUn59JQpSRHib8Vqqt0S6dyAhgkh8thy38szJ9qNv
 0wHgFwL4z9+3ZM74HLHvHNndxJMpv7lR2xWGZYo2W0G6h1FumfV6rCr147v8ZHW1lZNa
 7iUwZKFJPFIbG4MGsjbONBbLvvGljf6xOIKE5lTh4dxu+FpKWmWtJSz57Rb3JVerMZ23
 X1J7v7nZvgx18UX7Y8ValN1pmiGBwefuZaAinPs01rfZZpayEcIHpNH8RGvB4b5qW5/F
 gXpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdC2tVijzHi8MzZzQV4Ua6xmJabrtoAlzDYqkn6lTyE1Pfa8/mQT/c8c/bpwovVzy2Jcogj788BfcqUdi0ZP8=@lists.samba.org
X-Gm-Message-State: AOJu0YzY6+LeLCJ5bQLfJBCWiE+LxVL3uSNnPUcg3+HOB85KzhrUc1Wl
 omaPEbm31apoJ+BdwOvF2qaK2lfCfqnwkMZITlVqTis9DPvYe7WRy84eXihh7FD1NiIZH58Ofuc
 PhtJERg9wOBmsuxsPRUFg2aCXL9joukU=
X-Gm-Gg: ASbGncuneYNV0BqF9fn8IOiBUXnrXZKiKjso4Kqizem2pjOVNAcmO9GRbZacJc5+qhG
 EjCCEfLUsUD2jievp/LQ3Hd3kMytFXkXDjsF0dTeNzrp71iTSgnIUj2c1QTxlQdxO6aLjIx9XeJ
 rkhGpFLuKbjeW9rgq8KQAogUEogLpnCkWi/i33gNDchEMspbyXbXS/aFu4TgAuKGAN/1I=
X-Google-Smtp-Source: AGHT+IHZY78+ghfvx9mHgZXp/sRB69mVFQcBsMxlpHgIJsCVofks9XNNhIOo6Wfxtl39c/v4RMyQKweHO3sLxS3HUcg=
X-Received: by 2002:a05:6512:1595:b0:553:35bb:f7b7 with SMTP id
 2adb3069b0e04-5533b90aabcmr1981315e87.32.1748633280806; Fri, 30 May 2025
 12:28:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1748446473.git.metze@samba.org>
 <b43ee94c3db13291156e70d37a3e843ad7d08b31.1748446473.git.metze@samba.org>
 <CAKYAXd_df0mwgAbJb3w_r_8JmJOAZjPfhjoFpWgTkWJFdMWUMA@mail.gmail.com>
 <096f20e9-3e59-4e80-8eeb-8a51f214c6f1@samba.org>
In-Reply-To: <096f20e9-3e59-4e80-8eeb-8a51f214c6f1@samba.org>
Date: Fri, 30 May 2025 14:27:49 -0500
X-Gm-Features: AX0GCFubCs8sKHn0tAwQeHSs-E4R094BYFfcCaE2Dk4sKG1XBLp8KhEo9FrbH-U
Message-ID: <CAH2r5mvCm=W-XsuQF0r43x5wV_O64Jzh-6HxLLD0KSYm7zgsSQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] smb: smbdirect: add smbdirect_pdu.h with
 protocol definitions
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, Hyunchul Lee <hyc.lee@gmail.com>,
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, May 30, 2025 at 2:03=E2=80=AFPM Stefan Metzmacher <metze@samba.org>=
 wrote:
>
> Am 29.05.25 um 01:28 schrieb Namjae Jeon:
> > On Thu, May 29, 2025 at 1:02=E2=80=AFAM Stefan Metzmacher <metze@samba.=
org> wrote:
> >>
> >> This is just a start moving into a common smbdirect layer.
> >>
> >> It will be used in the next commits...
> >>
> >> Cc: Steve French <smfrench@gmail.com>
> >> Cc: Tom Talpey <tom@talpey.com>
> >> Cc: Long Li <longli@microsoft.com>
> >> Cc: Namjae Jeon <linkinjeon@kernel.org>
> >> Cc: Hyunchul Lee <hyc.lee@gmail.com>
> >> Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>
> >> Cc: linux-cifs@vger.kernel.org
> >> Cc: samba-technical@lists.samba.org
> >> Signed-off-by: Stefan Metzmacher <metze@samba.org>
> >> ---
> >>   fs/smb/common/smbdirect/smbdirect_pdu.h | 55 +++++++++++++++++++++++=
++
> >>   1 file changed, 55 insertions(+)
> >>   create mode 100644 fs/smb/common/smbdirect/smbdirect_pdu.h
> >>
> >> diff --git a/fs/smb/common/smbdirect/smbdirect_pdu.h b/fs/smb/common/s=
mbdirect/smbdirect_pdu.h
> >> new file mode 100644
> >> index 000000000000..ae9fdb05ce23
> >> --- /dev/null
> >> +++ b/fs/smb/common/smbdirect/smbdirect_pdu.h
> >> @@ -0,0 +1,55 @@
> >> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> >> +/*
> >> + *   Copyright (c) 2017 Stefan Metzmacher
> > Isn't it 2025? It looks like a typo.
>
> I took it from here:
> https://git.samba.org/?p=3Dmetze/linux/smbdirect.git;a=3Dblob;f=3Dsmbdire=
ct_private.h;hb=3D284ad8ea768c06e3cc70d6f2754929a6abbd2719
>
> > And why do you split the existing one into multiple header
> > files(smbdirect_pdu.h, smbdirect_socket.h, smbdirect.h)?
>
> In the end smbdirect.h will be the only header used outside
> of fs/smb/common/smbdirect, it will be the public api, to be used
> by the smb layer.
>
> smbdirect_pdu.h holds protocol definitions, while smbdirect_socket.h
> will be some kind of internal header that holds structures shared between=
 multiple .c files.
>
> But we'll see I think this is a start in the correct direction.
>
> I try to focus on doing tiny steps avoiding doing to much at the same tim=
e
> or even try to avoid thinking about the next step already...

Makes sense to me. Seems like a very good plan
--=20
Thanks,

Steve


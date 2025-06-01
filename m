Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AB7AC9D64
	for <lists+samba-technical@lfdr.de>; Sun,  1 Jun 2025 02:02:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=J+BsXO0gHMSf5xAfok9HETPV4uJHFOZRHXwNI62aCaM=; b=wczJ6lbvSyqtoyOxqd6oYoq0zI
	Kg5BwfvKqQv2Ii7XxTOejl44pv4UvEqBXDl6Nk6eWiM7YK0JaN6bL18eX8if77um5rN/D5Msh1djO
	11f4qERDEBAUexJeBss93JKHFsSp0x+BnIZwsCRbvl50Xg2C9SWztfa9TpTUnwKcBJhftgoTDjfae
	FxR8N3b4xbB7mSQUI1KysNyPAYXmZleWbsbvI3bNDW3ThL1VipwiizlZlpng4105p/AP7IOqvPN97
	wHdoUNQcioMkoxD6ORuN5JoLT3HnFf1vrsUwEges2yK2N4HAGfmRZv6yNsODpKkI38TKvfDrtTveM
	r1X4BqtA==;
Received: from ip6-localhost ([::1]:29346 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uLW9L-004wpY-Db; Sun, 01 Jun 2025 00:02:03 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3]:36016) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uLW9F-004v7G-Qr
 for samba-technical@lists.samba.org; Sun, 01 Jun 2025 00:02:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E0CE9A431A3
 for <samba-technical@lists.samba.org>; Sun,  1 Jun 2025 00:01:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6982BC4CEF0
 for <samba-technical@lists.samba.org>; Sun,  1 Jun 2025 00:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748736104;
 bh=7N9hoi9D9+7rJ9bK4htUXWXyIIc3cgyWmv6TtmoD6/0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=maxXABHkjCL+y3sJ3DWx9oKA0De4CmpFBZRrIvEqasdmbG42uNNjNDemi9qEQAF77
 ek/8MQcqJbJ1PmZf1lii5kR5M5E68Bmoh4YK0GDnu1pNADPXo0ZzRdRRMJMTnKrn8D
 acWwqRMgQAsPKn77NJ3kPsKw01bDs6BVOOafVVKXGdAeXo4RA1EiGHEEZw+raCCz1y
 pU7g0t1PBa9W3cl8WANwigg5H+PI4omHFStipP6RAf1Tw8/iWjhUkb8OGGJtj7WjV+
 7cy96cNzeUkCsAzHRiako2oy3WjqCxzICMwAgcMlPrr+ZuErjK95pgN7scwDYpvoWd
 mQsJypu4nLVBw==
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-acbb85ce788so647576566b.3
 for <samba-technical@lists.samba.org>; Sat, 31 May 2025 17:01:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWbwP9ge4zCNUiQ+EH7HW0zuNF9RcwkfCH9eA6kvejUkT3mv60cLTiKsd6o17/7LEzObTspA4MxP7+4143iaJ8=@lists.samba.org
X-Gm-Message-State: AOJu0YzP87jaacugA9XGJLV6dUitD/FO6dFOJenAJcFCDjzSkBz+RjP3
 d6OkhKJ445oVkFH2Uaponz9p+qsY9kZjinRzEjs1vyWvjY5Zpf3h7asrVuB6UFLAJ/8VBeQOL/p
 LS9uvxzUjfWi1PYYGfPF790rbEFknC6M=
X-Google-Smtp-Source: AGHT+IGUks0gx7vn1CETHtFOfTjkJNMoEW3DezYuieuHwvWpsEO/KUWQ9n0Wo/kp0uItyAD5/Im8jvwbqNmQL440mEE=
X-Received: by 2002:a17:907:d90:b0:ad5:3055:a025 with SMTP id
 a640c23a62f3a-adb32248ccemr808741866b.6.1748736103035; Sat, 31 May 2025
 17:01:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1748446473.git.metze@samba.org>
 <b43ee94c3db13291156e70d37a3e843ad7d08b31.1748446473.git.metze@samba.org>
 <CAKYAXd_df0mwgAbJb3w_r_8JmJOAZjPfhjoFpWgTkWJFdMWUMA@mail.gmail.com>
 <096f20e9-3e59-4e80-8eeb-8a51f214c6f1@samba.org>
 <CAKYAXd86mLGAaAEUFcp1Vv+6p2O3MSJcwoor8MmjEypUo+Ofrg@mail.gmail.com>
 <CAH2r5mvQbL_R9wrFRHF9_3XwM3e-=2vK=i1uaSCk37-FZmJq9g@mail.gmail.com>
In-Reply-To: <CAH2r5mvQbL_R9wrFRHF9_3XwM3e-=2vK=i1uaSCk37-FZmJq9g@mail.gmail.com>
Date: Sun, 1 Jun 2025 09:01:31 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9T81En40i3OigiTAmJabMr8yuCX9E1LT_JfaTmyefTag@mail.gmail.com>
X-Gm-Features: AX0GCFvyiO_QsNb12aLyqhWjxv7hr6witTjdvmtGLMm57pqSHq_DJ5HswpiiSWg
Message-ID: <CAKYAXd9T81En40i3OigiTAmJabMr8yuCX9E1LT_JfaTmyefTag@mail.gmail.com>
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

On Sun, Jun 1, 2025 at 8:23=E2=80=AFAM Steve French <smfrench@gmail.com> wr=
ote:
>
> I do like the small, relatively safe steps he is doing these in.
Small is okay, but I wonder when he will send the rest.
What if he just separates it like this and doesn't send the rest of
patches later?
I've never seen a case where the headers are separated first,
And send the main if it's implemented later. This is not a personal reposit=
ory.

Thanks.
>
> Thanks,
>
> Steve
>
> On Fri, May 30, 2025, 5:29=E2=80=AFPM Namjae Jeon <linkinjeon@kernel.org>=
 wrote:
>>
>> On Sat, May 31, 2025 at 4:03=E2=80=AFAM Stefan Metzmacher <metze@samba.o=
rg> wrote:
>> >
>> > Am 29.05.25 um 01:28 schrieb Namjae Jeon:
>> > > On Thu, May 29, 2025 at 1:02=E2=80=AFAM Stefan Metzmacher <metze@sam=
ba.org> wrote:
>> > >>
>> > >> This is just a start moving into a common smbdirect layer.
>> > >>
>> > >> It will be used in the next commits...
>> > >>
>> > >> Cc: Steve French <smfrench@gmail.com>
>> > >> Cc: Tom Talpey <tom@talpey.com>
>> > >> Cc: Long Li <longli@microsoft.com>
>> > >> Cc: Namjae Jeon <linkinjeon@kernel.org>
>> > >> Cc: Hyunchul Lee <hyc.lee@gmail.com>
>> > >> Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>
>> > >> Cc: linux-cifs@vger.kernel.org
>> > >> Cc: samba-technical@lists.samba.org
>> > >> Signed-off-by: Stefan Metzmacher <metze@samba.org>
>> > >> ---
>> > >>   fs/smb/common/smbdirect/smbdirect_pdu.h | 55 ++++++++++++++++++++=
+++++
>> > >>   1 file changed, 55 insertions(+)
>> > >>   create mode 100644 fs/smb/common/smbdirect/smbdirect_pdu.h
>> > >>
>> > >> diff --git a/fs/smb/common/smbdirect/smbdirect_pdu.h b/fs/smb/commo=
n/smbdirect/smbdirect_pdu.h
>> > >> new file mode 100644
>> > >> index 000000000000..ae9fdb05ce23
>> > >> --- /dev/null
>> > >> +++ b/fs/smb/common/smbdirect/smbdirect_pdu.h
>> > >> @@ -0,0 +1,55 @@
>> > >> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> > >> +/*
>> > >> + *   Copyright (c) 2017 Stefan Metzmacher
>> > > Isn't it 2025? It looks like a typo.
>> >
>> > I took it from here:
>> > https://git.samba.org/?p=3Dmetze/linux/smbdirect.git;a=3Dblob;f=3Dsmbd=
irect_private.h;hb=3D284ad8ea768c06e3cc70d6f2754929a6abbd2719
>> >
>> > > And why do you split the existing one into multiple header
>> > > files(smbdirect_pdu.h, smbdirect_socket.h, smbdirect.h)?
>> >
>> > In the end smbdirect.h will be the only header used outside
>> > of fs/smb/common/smbdirect, it will be the public api, to be used
>> > by the smb layer.
>> >
>> > smbdirect_pdu.h holds protocol definitions, while smbdirect_socket.h
>> > will be some kind of internal header that holds structures shared betw=
een multiple .c files.
>> >
>> > But we'll see I think this is a start in the correct direction.
>> When will you send the patches for multiple .c files?
>> I'm not sure if this is the right direction when I check only this patch=
-set.
>> I don't prefer to change the headers like this in advance without a body=
.
>> When you're ready, how about sending the patches including the body all =
at once?
>> >
>> > I try to focus on doing tiny steps avoiding doing to much at the same =
time
>> > or even try to avoid thinking about the next step already...
>> >
>> > metze


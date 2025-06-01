Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8874CAC9DC8
	for <lists+samba-technical@lfdr.de>; Sun,  1 Jun 2025 07:00:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=1eywYf00hXktu4b58ZWLEmukBVFk5D+FjWvE1EosOcY=; b=UNFrLMHhBkPKwEoPYOu3YUWO3c
	6ep3sKTNuSQDXoX3J+HuHzOVmYB4z3VQknprRXNPE7GoCz5y1qTT2/Z/gelxDCWGWnYyQ3Ta+MckZ
	DPqJD6tjeaHLyfvNFMDXZDi1aVjgwow5mRZAWk7iOQg1/wJdx5wFR32mtAtRVPbN7dqQxlzYAJS5V
	oddADJCToOHA3GMWNApycSEikfQy/SCge3zjmxtEL4yps0536j6Bme+TqUwJx3MmaxlmdHOUZodYz
	MoKBbEUpNMYJq+/qtqBVApduhODqzINIV1YAG1Cta76PR+iORhyWLb0kwBO6NYXlRYi9AARuijFYr
	+a2G579Q==;
Received: from ip6-localhost ([::1]:45362 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uLanu-006Ner-LX; Sun, 01 Jun 2025 05:00:14 +0000
Received: from nyc.source.kernel.org ([147.75.193.91]:44748) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uLanl-006Neg-Pq
 for samba-technical@lists.samba.org; Sun, 01 Jun 2025 05:00:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 54974A4DCF5
 for <samba-technical@lists.samba.org>; Sun,  1 Jun 2025 05:00:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91AEFC4AF09
 for <samba-technical@lists.samba.org>; Sun,  1 Jun 2025 05:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748754000;
 bh=jziMLCYfG/IxcjddNwH84wkqmhcfMsiuDMt7+e3MGRs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GRsTeyzmEW7jZnwNXs66UMF2hEa1Us5Gyma6cghcCzlVqE5Zvisy2Bu2kheJiL/9h
 ECz3ksjUwAMjtlA8b+hH9LCn5GQ0AvMidn9QAWEjd0CA5QZvQJkeWRV5mmw1Sk5LVZ
 nM+ivpKn6yMf9T7XNrI3+geSrnJ2JwBqOBY1dGcvdLbJMkWlllXy1mzRPyv57O8y4A
 i+9wZVXluPJ+uISikQEK8GuFVBg/wTUVBd3+oQbQW3CXdMwkFYKYwvFuFbtZt4Ulj7
 noHQ+wE6XYjQcjFm3x60/nyiZZ/xDfsdPBskZMEgU+na5D5vNtwWY7ag48uDOdHq9d
 XarndC1YBz8IQ==
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-adb2e9fd208so493318466b.3
 for <samba-technical@lists.samba.org>; Sat, 31 May 2025 22:00:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW1aeJ341HxKph1HuYcRCcZ6lEWWGnJrXCeCEMcLC6Mwmi1BuGFPJBSU+EJwxt4fXC6xprNCXibyGRP2jroKvw=@lists.samba.org
X-Gm-Message-State: AOJu0YxcoEJNaY2dGVO5l+uuiAONdc+Xaeh641CSI//DQw62ccgmOQ7Y
 y3xSt2CxT1oNEVK4oVZrznrLiZkf8DtF9gIBtWY6mXnrFOoS46lhAjKsz36TLjBmF5Ja8jmypcc
 ACIcOR75lfjOGbQDeDZSz98a51MWdzD4=
X-Google-Smtp-Source: AGHT+IHBmixlrV+bNrpHCDSQFAtm1q9Soxc/KdMAbUMA7EMydYsIgj4O4t5zQ+7NS6VwHe0vrZktRis23VMhgWjvN/E=
X-Received: by 2002:a17:906:6a09:b0:ad5:3743:3fa1 with SMTP id
 a640c23a62f3a-adb3244fff4mr663385666b.50.1748753999171; Sat, 31 May 2025
 21:59:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1748446473.git.metze@samba.org>
 <b43ee94c3db13291156e70d37a3e843ad7d08b31.1748446473.git.metze@samba.org>
 <CAKYAXd_df0mwgAbJb3w_r_8JmJOAZjPfhjoFpWgTkWJFdMWUMA@mail.gmail.com>
 <096f20e9-3e59-4e80-8eeb-8a51f214c6f1@samba.org>
 <CAKYAXd86mLGAaAEUFcp1Vv+6p2O3MSJcwoor8MmjEypUo+Ofrg@mail.gmail.com>
 <CAH2r5mvQbL_R9wrFRHF9_3XwM3e-=2vK=i1uaSCk37-FZmJq9g@mail.gmail.com>
 <CAKYAXd9T81En40i3OigiTAmJabMr8yuCX9E1LT_JfaTmyefTag@mail.gmail.com>
 <CAH2r5mso54sXPcoJWDSU4E--XMH44wFY-cdww6_6yx5CxrFtdg@mail.gmail.com>
In-Reply-To: <CAH2r5mso54sXPcoJWDSU4E--XMH44wFY-cdww6_6yx5CxrFtdg@mail.gmail.com>
Date: Sun, 1 Jun 2025 13:59:47 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_BVHPA8Jj6mtc_nsbby1HizZFEmCft20B_wcTM3pDUVg@mail.gmail.com>
X-Gm-Features: AX0GCFtQ5-YDPzNW5y4CUF3RsinJIjhF4__cD8m27f_Y-FFUjpKHlmIIfl2mie4
Message-ID: <CAKYAXd_BVHPA8Jj6mtc_nsbby1HizZFEmCft20B_wcTM3pDUVg@mail.gmail.com>
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

On Sun, Jun 1, 2025 at 12:49=E2=80=AFPM Steve French <smfrench@gmail.com> w=
rote:
>
> Moving to use common headers is something I did multiple times with ksmbd=
 and cifs.ko already, not a bad first step
This is not simply moved to the common header. He splits the header
into smaller pieces for some unknown reason.
Can you explain why he has split it into smbdirect_socket.h?
We doesn't need to do it now if he's thinking of creating a
smbdirect_socket.c file later.
>
> Thanks,
>
> Steve
>
> On Sat, May 31, 2025, 7:01=E2=80=AFPM Namjae Jeon <linkinjeon@kernel.org>=
 wrote:
>>
>> On Sun, Jun 1, 2025 at 8:23=E2=80=AFAM Steve French <smfrench@gmail.com>=
 wrote:
>> >
>> > I do like the small, relatively safe steps he is doing these in.
>> Small is okay, but I wonder when he will send the rest.
>> What if he just separates it like this and doesn't send the rest of
>> patches later?
>> I've never seen a case where the headers are separated first,
>> And send the main if it's implemented later. This is not a personal repo=
sitory.
>>
>> Thanks.
>> >
>> > Thanks,
>> >
>> > Steve
>> >
>> > On Fri, May 30, 2025, 5:29=E2=80=AFPM Namjae Jeon <linkinjeon@kernel.o=
rg> wrote:
>> >>
>> >> On Sat, May 31, 2025 at 4:03=E2=80=AFAM Stefan Metzmacher <metze@samb=
a.org> wrote:
>> >> >
>> >> > Am 29.05.25 um 01:28 schrieb Namjae Jeon:
>> >> > > On Thu, May 29, 2025 at 1:02=E2=80=AFAM Stefan Metzmacher <metze@=
samba.org> wrote:
>> >> > >>
>> >> > >> This is just a start moving into a common smbdirect layer.
>> >> > >>
>> >> > >> It will be used in the next commits...
>> >> > >>
>> >> > >> Cc: Steve French <smfrench@gmail.com>
>> >> > >> Cc: Tom Talpey <tom@talpey.com>
>> >> > >> Cc: Long Li <longli@microsoft.com>
>> >> > >> Cc: Namjae Jeon <linkinjeon@kernel.org>
>> >> > >> Cc: Hyunchul Lee <hyc.lee@gmail.com>
>> >> > >> Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>
>> >> > >> Cc: linux-cifs@vger.kernel.org
>> >> > >> Cc: samba-technical@lists.samba.org
>> >> > >> Signed-off-by: Stefan Metzmacher <metze@samba.org>
>> >> > >> ---
>> >> > >>   fs/smb/common/smbdirect/smbdirect_pdu.h | 55 +++++++++++++++++=
++++++++
>> >> > >>   1 file changed, 55 insertions(+)
>> >> > >>   create mode 100644 fs/smb/common/smbdirect/smbdirect_pdu.h
>> >> > >>
>> >> > >> diff --git a/fs/smb/common/smbdirect/smbdirect_pdu.h b/fs/smb/co=
mmon/smbdirect/smbdirect_pdu.h
>> >> > >> new file mode 100644
>> >> > >> index 000000000000..ae9fdb05ce23
>> >> > >> --- /dev/null
>> >> > >> +++ b/fs/smb/common/smbdirect/smbdirect_pdu.h
>> >> > >> @@ -0,0 +1,55 @@
>> >> > >> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> >> > >> +/*
>> >> > >> + *   Copyright (c) 2017 Stefan Metzmacher
>> >> > > Isn't it 2025? It looks like a typo.
>> >> >
>> >> > I took it from here:
>> >> > https://git.samba.org/?p=3Dmetze/linux/smbdirect.git;a=3Dblob;f=3Ds=
mbdirect_private.h;hb=3D284ad8ea768c06e3cc70d6f2754929a6abbd2719
>> >> >
>> >> > > And why do you split the existing one into multiple header
>> >> > > files(smbdirect_pdu.h, smbdirect_socket.h, smbdirect.h)?
>> >> >
>> >> > In the end smbdirect.h will be the only header used outside
>> >> > of fs/smb/common/smbdirect, it will be the public api, to be used
>> >> > by the smb layer.
>> >> >
>> >> > smbdirect_pdu.h holds protocol definitions, while smbdirect_socket.=
h
>> >> > will be some kind of internal header that holds structures shared b=
etween multiple .c files.
>> >> >
>> >> > But we'll see I think this is a start in the correct direction.
>> >> When will you send the patches for multiple .c files?
>> >> I'm not sure if this is the right direction when I check only this pa=
tch-set.
>> >> I don't prefer to change the headers like this in advance without a b=
ody.
>> >> When you're ready, how about sending the patches including the body a=
ll at once?
>> >> >
>> >> > I try to focus on doing tiny steps avoiding doing to much at the sa=
me time
>> >> > or even try to avoid thinking about the next step already...
>> >> >
>> >> > metze


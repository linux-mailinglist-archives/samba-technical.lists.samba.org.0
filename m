Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 919A8AC97BA
	for <lists+samba-technical@lfdr.de>; Sat, 31 May 2025 00:30:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=mjj9bRBIQ8g1bP3oxpMdgbVHiD+grFzp1pLM9o76Wy8=; b=iao5wH1Z1uCtOW87PlvKC2wVkw
	mIu3OoZ9QfVgBB0+NoEemExpzGIpCwPc2IzqrCzcfXksuk3BtCnyDBryJpSoeC/mH6JVb22a99+cx
	c0oIKR62iOIZRtu7mKP5uZ3YZIGNhhS3TTgLjxLmI8Pg/1NAbfEf6GqdRYeBRDqzyaqiBzuptKS+U
	DR0Z3VAHFdjIobO1qf97Yvag5f1Fnt9fGoEQnLD4eeUTqlyRSN8j8UQN7HrUIyvoepUjpCdXhLL+e
	QIriVYVNR1pNh9h3OryoZIn1a2ZVZDvK4014MQT5wCwhlPhnX+RVNoww0JppxSgTuJfFUsDhHU2Ek
	AzcR6xmg==;
Received: from ip6-localhost ([::1]:49178 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uL8EC-004UUa-J3; Fri, 30 May 2025 22:29:28 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3]:38050) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uL8E6-004UUT-JJ
 for samba-technical@lists.samba.org; Fri, 30 May 2025 22:29:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1DE38A4FD40
 for <samba-technical@lists.samba.org>; Fri, 30 May 2025 22:29:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC1C2C4CEEF
 for <samba-technical@lists.samba.org>; Fri, 30 May 2025 22:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748644157;
 bh=aYrAz1A+HHeen4hKf9OBy9NdxZ9wDeOfzlo6epG//g8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=E7YJ2P5f6zkGacD1EuwbFFWb2iLrCTH6t4xYz0MCGwYzKSvKqsYBFGbeetKu3Q9wI
 fz/sctOZK8izojhBgM0ne+jOyRaGqfg5DkMcy/xXxBf2ZIlN4Lrw7QuYk1SJ5WHn0D
 ESvNLn52gpVvHdfKEt8x1W8/m9PMlM0HbONcbHxLFzhKcnhlKR84mGCh/cdSHi2Id0
 33w1hVcWQgi9Acle4L4rFz2d1mDxy4JUpyu4CRlhAx73zC60fE1svs9icMRqJ2cp2y
 w9ro0sujJZ5cf/wt5picdxSEvWOk5tusv/ZYexkiDOZrTHiobIXK03kiplOWYZKx8D
 BnMy5Afe+8oOQ==
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-ad1d1f57a01so459751466b.2
 for <samba-technical@lists.samba.org>; Fri, 30 May 2025 15:29:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUzeHshyRRd9lRU8Qh90JcJUdhQTGWVcu3zEagPI2ycxaa16hA8n/hnuVpEEYq8VINrdzHs1MqBN4UYtXNpPjk=@lists.samba.org
X-Gm-Message-State: AOJu0YzqFUBGpsx+i6YFWGYY2bqdH4hj340j7VOiH/XZgne4js0nsAWQ
 pqaFMJH1FcUTG7BYCBCubQKRLxpud3lVO5VraSlYPE16UxVNqar1xfchV35z4lvLBKGelsX3LDF
 VzE5XMejH5fOlRxOJxTL8i4+bW9B+cek=
X-Google-Smtp-Source: AGHT+IEq2kuUc5h63qtNYhbKdqCcQBoilIbCV8vV5aH4VJi8jFhqUey6HD0o9XnWyJUPTiR6PmL606dnntfdDypPpK0=
X-Received: by 2002:a17:907:9285:b0:ad8:9257:5735 with SMTP id
 a640c23a62f3a-adb32264a13mr486222366b.3.1748644156367; Fri, 30 May 2025
 15:29:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1748446473.git.metze@samba.org>
 <b43ee94c3db13291156e70d37a3e843ad7d08b31.1748446473.git.metze@samba.org>
 <CAKYAXd_df0mwgAbJb3w_r_8JmJOAZjPfhjoFpWgTkWJFdMWUMA@mail.gmail.com>
 <096f20e9-3e59-4e80-8eeb-8a51f214c6f1@samba.org>
In-Reply-To: <096f20e9-3e59-4e80-8eeb-8a51f214c6f1@samba.org>
Date: Sat, 31 May 2025 07:29:04 +0900
X-Gmail-Original-Message-ID: <CAKYAXd86mLGAaAEUFcp1Vv+6p2O3MSJcwoor8MmjEypUo+Ofrg@mail.gmail.com>
X-Gm-Features: AX0GCFshD-6nROV9r-RLT4OWJmza-sC10zJAD3TFU7xXLqNjxGp03nFNb2u5Omo
Message-ID: <CAKYAXd86mLGAaAEUFcp1Vv+6p2O3MSJcwoor8MmjEypUo+Ofrg@mail.gmail.com>
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
From: Namjae Jeon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, Hyunchul Lee <hyc.lee@gmail.com>,
 Tom Talpey <tom@talpey.com>, Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, May 31, 2025 at 4:03=E2=80=AFAM Stefan Metzmacher <metze@samba.org>=
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
When will you send the patches for multiple .c files?
I'm not sure if this is the right direction when I check only this patch-se=
t.
I don't prefer to change the headers like this in advance without a body.
When you're ready, how about sending the patches including the body all at =
once?
>
> I try to focus on doing tiny steps avoiding doing to much at the same tim=
e
> or even try to avoid thinking about the next step already...
>
> metze


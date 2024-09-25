Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 992F29865FA
	for <lists+samba-technical@lfdr.de>; Wed, 25 Sep 2024 19:52:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=vntbvLH7rqyOAKyTPuolDaXhL9GWPVckxp3Y+1WSIJ0=; b=XkRAVeM34EBIfcpd3fG2kI96LZ
	dhSArfhB4m/AAmSCVmwOCsTXv/ke7W225tTMN/9ol2knV5Eq+YIvawRTQqmQjsCinJGLKws1TBpdW
	zwCkXI5nMcmAjpslBTr2jYb8vUNDsmMYsLZyyaZ+XGbLU+BakvREtceerPkD86RqyEkI9yNkhuk4f
	gAHVtggnzj5G/tKDp2jV5u3yk18MRanyLtmd4ltxHYomL2pznwLOmImLpMg7Xn3l9faEsetcmhIbZ
	MolTgmsihOmUvqoPm7LU1bB43BSLOrOCtFjtfZGfXJepNCU8w5Tszm/lopAyJ0JWQfbB0MqHCzDPY
	aj9XFLqA==;
Received: from ip6-localhost ([::1]:40218 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1stWAD-000fhL-IV; Wed, 25 Sep 2024 17:50:57 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:47397) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1stWA9-000fhE-4v
 for samba-technical@lists.samba.org; Wed, 25 Sep 2024 17:50:55 +0000
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-535be093a43so148959e87.3
 for <samba-technical@lists.samba.org>; Wed, 25 Sep 2024 10:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727286651; x=1727891451; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1FH8rwk3er87y7EQSrSfkfYIDVp5KXDiUAFH2K6gy3I=;
 b=YJqfVyCqHDNeXgX67pTOPcg8vQgIIyd5anPmYXNmhk6qTJA7EwzS/u0L+JpEzRY38t
 cKmJ5wWlxGqH3EuErMW0CblB32KbJkbYUDZYi/vrYtRuyF0H77MOGI/msW3RKKS7/HOb
 xG+l2o/hxZYN6LAg+3FRnpF403Wpldo7vx9/tRjvhN8BhdwM1iawLQvbwERDj31kzeyy
 RmfIPY4e8ckpw5lUGdJYj++tUUeIiDzI82yVxxMpqvh67R2QsO1bubzehEVUFxbCfsOu
 0vP+Y6DyzcA6mzidsAp7aiO1ZQ5bFdMw+k8IRPGsYN3AtKv93I1qfgM9XOEP8buZyAFN
 EEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727286651; x=1727891451;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1FH8rwk3er87y7EQSrSfkfYIDVp5KXDiUAFH2K6gy3I=;
 b=mF3FkCrapYfqC1AIpRJhuKf5F+2haJzCFdV5RkgDQZ00nvWrGlL7YlqC+uhYdGo/cl
 dGACa0TuKUyPPwQWWlkitED27PwHFkPheJBP9WmPjwW+BX58R2CnLsgmBeFEYb2aOeU1
 lk2QXG5MNftTYzUvE3yiedAe5iUw8G/V1SFqVJdEriwIwcd/3ShC7hacadL5oFWgE2Mk
 +bwGb4MWIi3rs8mXWiuCTWPKs0OM1xJAoRzHmTNkVqj0IpdxqMFfqsbcFxzAaTDNB+RX
 z9ZDGo8IDPxhemaZwktbc0S7NZ4ibXydPEvTLeILjWqjMgIeAw8OfMtKEriZFaL0AEgN
 cLLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9gVAPcbDb9JWzCMnh2e6mjpmm8v0UA3KY7w0SLwScqPAUrC6arGfyCUE54aCPt3K2l2//HMwcSL0izj1B6IM=@lists.samba.org
X-Gm-Message-State: AOJu0Yy7TsxrTN+gIVpIWWlZ1wOLJnF6KnUa/nIfCwfkKtU+mm4Cish3
 Dv8J4KO+4z3fWVPNs0RLYOL1jzo6btY3uV4G5ktKWURAUNrcQpHmMelThPxFOA6/Ytx2xkfhu4t
 v4iNyWGiaSpf3joHR0ZsAWFrv/Vg=
X-Google-Smtp-Source: AGHT+IHNelNdV22WgfzA3PTK67DSLiiHxUD5zUm0kmEzhA6aPXbpjzE+8dB2Vd0OuQN+A5MEGoXwpz3YaL+fzX8ZvLk=
X-Received: by 2002:a05:6512:3ca4:b0:52c:cc38:592c with SMTP id
 2adb3069b0e04-538693ab0c1mr2395715e87.0.1727286651010; Wed, 25 Sep 2024
 10:50:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240925074323.9823-1-shenlichuan@vivo.com>
 <CAKYAXd-O3zANLJaQpaDc7VsUJTODRG5k08L+HG7sjLAwv7MpGg@mail.gmail.com>
In-Reply-To: <CAKYAXd-O3zANLJaQpaDc7VsUJTODRG5k08L+HG7sjLAwv7MpGg@mail.gmail.com>
Date: Wed, 25 Sep 2024 12:50:37 -0500
Message-ID: <CAH2r5mtY0xsi5MQ0W6uyx0Q6CAv4CW5w4530G0ewKeUf7WsfyQ@mail.gmail.com>
Subject: Re: [PATCH v1] smb: Correct typos in multiple comments across various
 files
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
Cc: Paulo Alcantara <pc@manguebit.com>, CIFS <linux-cifs@vger.kernel.org>,
 Shyam Prasad N <sprasad@microsoft.com>, Shen Lichuan <shenlichuan@vivo.com>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Tom Talpey <tom@talpey.com>,
 Steve French <sfrench@samba.org>, Bharath S M <bharathsm@microsoft.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, opensource.kernel@vivo.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Let me know if you want me to update ksmbd for next so we can send a few of
these Saturday upstream

On Wed, Sep 25, 2024, 9:13=E2=80=AFAM Namjae Jeon via samba-technical <
samba-technical@lists.samba.org> wrote:

> On Wed, Sep 25, 2024 at 4:43=E2=80=AFPM Shen Lichuan <shenlichuan@vivo.co=
m> wrote:
> >
> > Fixed some confusing typos that were currently identified witch
> codespell,
> > the details are as follows:
> >
> > -in the code comments:
> > fs/smb/common/smb2pdu.h:9: specfication =3D=3D> specification
> > fs/smb/common/smb2pdu.h:494: usally =3D=3D> usually
> > fs/smb/common/smb2pdu.h:1064: Attrubutes =3D=3D> Attributes
> > fs/smb/server/connection.c:28: cleand =3D=3D> cleaned
> > fs/smb/server/ksmbd_netlink.h:216: struture =3D=3D> structure
> > fs/smb/server/oplock.c:799: conains =3D=3D> contains
> > fs/smb/server/oplock.c:1487: containted =3D=3D> contained
> > fs/smb/server/server.c:282: proccessing =3D=3D> processing
> > fs/smb/server/smb_common.c:491: comforms =3D=3D> conforms
> > fs/smb/server/xattr.h:102: ATTRIBUITE =3D=3D> ATTRIBUTE
> >
> > Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
> Applied it to #ksmbd-for-next-next.
> Thanks!
>
>

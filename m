Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A8AA7CABC
	for <lists+samba-technical@lfdr.de>; Sat,  5 Apr 2025 19:17:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ghjQpHKusYxyadXLhZmBSkUSYQTR32eq6vdcMhfyIjQ=; b=Jb4I2Y0vxS38JwdRn+44Y6Q0X9
	50PDkhPGrw4DC7vBq0WiI+PaYuQPAIe0NhhF6OM+RwZzT8mcgfzl6a3569KeLF78vuX4JU0cJBKI0
	8UcVRafUp3SRC3pxJBmJE3ecitmUiPSC4liYtru94lEdUi2KJPuuNGUYjzaHuKw/shQRFhH+k4k0B
	CfSXZBamBx4s3KBhDvs9haHdzZL8XghBBY66XCQtKcPXYnT573JYmF4SNSKh+L526k2j2AXXrFORj
	SRQZJMTX+H6KpeSCRmBAv4skfPr8ZYkuKNsvDORaVophu0TOmdzAuymAIzewADOwI9HPdrr5QqkMn
	VQLx7aZg==;
Received: from ip6-localhost ([::1]:26438 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1u178b-001lBk-N6; Sat, 05 Apr 2025 17:16:57 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:42428) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u178X-001lBd-3l
 for samba-technical@lists.samba.org; Sat, 05 Apr 2025 17:16:55 +0000
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-54af20849adso2940587e87.1
 for <samba-technical@lists.samba.org>; Sat, 05 Apr 2025 10:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743873399; x=1744478199; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ghjQpHKusYxyadXLhZmBSkUSYQTR32eq6vdcMhfyIjQ=;
 b=dFShQgcrlN/b6Z2E+HKmvTfXH73lpDMmvMcL+/U5qUGqRIP3gmdtA3TmMCNak1iMu2
 WBkFJ+hjhlKaKqEGLNVFqaG8+8yApoTVhHB2LY+1uty8iwxixk9C1PdC73WjRkteIDHA
 7uulcaWak9X4LUvxDmh05rq63zgyJe0vTUjAKk87D0s0qAx3aUEFxPn5HkiparsLVWHl
 zKnnzBaGj8JDi5oY3ZHfKwHhp2hhDqiwPVYWkDaz8xV86Puh3uLqXyw6VWHHqHePl3mr
 cmZ8hyOEA/hul4zpXGURvxaYNbCfaAjjx0BDiZdgDjFAyLZZWGWhfAod1Fz8g3kOWlTe
 uHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743873399; x=1744478199;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ghjQpHKusYxyadXLhZmBSkUSYQTR32eq6vdcMhfyIjQ=;
 b=aqm2blIF0xNOoZCb7jtkHpMtQbwXRMJ12SctXzuoxpM2h6rS4rowP19C6ec+029fbX
 hFuohmeK5cbJnBLRAwIANNBq2N+YKEWMxEZGk24HG1HwGiiLpt3fI7XyUsCt6XHakyc7
 DpNbjVUi1Df29trDbTTOdbgJbQXeziiF6sV2aavFJjo9Wty6sHWMyCWgEOKRZFh8gLkv
 r8fzO/GUsdeGfWgY8W417eS+N/tFvyuC/1TSIGKuuhEnDJ/WC2AG4tULbS5fF4zjhrA+
 W57GXNCDItyAQglHVt+Q2EZtB7wBNzcsP2rbH0hDMQvy5AePmdRO6qznsoADkRTgsid3
 nGGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAlnLkmotrP25EobHxj1AQvqEKmXKVI1ZsqTEXob9Xl3aodQ2TuYNlNx3eeTJnS3ZETOWlqD//WWyOE8wCUFE=@lists.samba.org
X-Gm-Message-State: AOJu0YxGq80JosTw43kNupi0O/5nuevdhHdh0cdqZ1D+HUb8rOSBJcvv
 m6TIfTp0WBXkSxMItNLO5UOcP9+0+iFaZxcOm7up7i74Hquks2pu17WbluHP18NxH9XtrDlsjzs
 nR3Ttm2ZwAHYhr0nBpnLcCo0qmtY=
X-Gm-Gg: ASbGncuGdvDbsvSJr9nSNsM1ta7togBmiramt5wsl4zYRmfrHOBk/8TRGqGGJiUMc5K
 Vj29qvOdp8o2Ukcq2WrLkontAmRXKON4rl+mXVDYd5Ccu87iIlCcggylBnvJGXJgP8Cx24p2P3R
 /gpQJAv8Fdem5Cfw/R6s0QmNAcH7Io4DdxLE+Psc5m98xOnjUzSfHXv79363he
X-Google-Smtp-Source: AGHT+IG4/SsIy6Bz2/iK9JWB5DA5CYEZS2mOTNnhljcm6kX7i4N7N2r0sZflPJm0A+pI/ki6KhcoiQ3+LBIhIrB9ue0=
X-Received: by 2002:ac2:4f14:0:b0:545:3035:f0bb with SMTP id
 2adb3069b0e04-54c1ca866d9mr4778947e87.22.1743873399144; Sat, 05 Apr 2025
 10:16:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAJXSQBms+s2Whk7SfugzQ1kby-xyJ62aVLVvM05rPtFAo7247Q@mail.gmail.com>
In-Reply-To: <CAJXSQBms+s2Whk7SfugzQ1kby-xyJ62aVLVvM05rPtFAo7247Q@mail.gmail.com>
Date: Sat, 5 Apr 2025 12:16:27 -0500
X-Gm-Features: ATxdqUFd80OcBQkNwifuudccY6nfsd-84_NAujyDftFJe7Utl7_4sp5kgNzyHJ4
Message-ID: <CAH2r5ms2=o4baY-6_aLmHpJhBYwvaWXUKwZufKs-iT3vsEg_hA@mail.gmail.com>
Subject: Re: Issue with kernel 6.8.0-40-generic?
To: Junwen Sun <sunjw8888@gmail.com>
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
Cc: pc@manguebit.com, linux-cifs@vger.kernel.org, profnandaa@gmail.com,
 samba-technical <samba-technical@lists.samba.org>, 1marc1@gmail.com,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Good catch - it does look like a regression introduced by:

        cad3fc0a4c8c ("cifs: Throw -EOPNOTSUPP error on unsupported
reparse point type from parse_reparse_point()")

The "unhandled reparse tag: 0x9000701a" looks like (based on MS-FSCC
document) refers to

    "IO_REPARSE_TAG_CLOUD_7   0x9000701A  Used by the Cloud Files
filter, for files managed by a sync engine such as OneDrive"

Will need to revert that as it looks like there are multiple reparse
tags that it will break not just the onedrive one above


On Fri, Apr 4, 2025 at 10:24=E2=80=AFPM Junwen Sun <sunjw8888@gmail.com> wr=
ote:
>
> Dear all,
>
> This is my first time submit an issue about kernel, if I am doing this
> wrong, please correct me.
>
> I'm using Debian testing amd64 as a home server. Recently, it updated
> to linux-image-6.12.20-amd64 and I found that it couldn't mount
> OneDrive shared folder using cifs. If I boot the system with 6.12.19,
> then there is no such problem.
>
> It just likes the issue Marc encountered in this thread. And the issue
> was fixed by commit 'ec686804117a0421cf31d54427768aaf93aa0069'. So,
> I've done some research and found that in 6.12.20, there is a new
> commit 'fef9d44b24be9b6e3350b1ac47ff266bd9808246' in cifs which almost
> revert the commit 'ec686804117a0421cf31d54427768aaf93aa0069'. I guess
> it brings the same issue back to 6.12.20.
>
> Thanks very much in advance if someone can have a look into this issue ag=
ain.
>
> =E5=AD=99=E5=B3=BB=E6=96=87
> Sun Junwen



--=20
Thanks,

Steve


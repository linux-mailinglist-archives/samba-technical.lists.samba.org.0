Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B317EB9107C
	for <lists+samba-technical@lfdr.de>; Mon, 22 Sep 2025 14:02:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=FhZV690p2rHv5XbzmyKwJxCYd8X+TTMLUIeAqOGQgWY=; b=sc5nlyiwNNEjMaFrvwWdIbUuEO
	P2aBrSsq7SvAa0XrXew16O0EY6+gCHPpPhEVPFP/28rJ1SIJ/YnIEh+ue0SF9aoEQlPqcDssiyx+h
	5qOMEuFdumZrQCJcuOnylv64PSA1vcv9997VjpuyLzsuamsgxVqLjJr0nqW8xmB/UFGUJ/21Up8Pm
	sFDVtFgVW1vEfBSSsei5CQhPa2fWH6k4zFum+JXlVXAj6D3v4m+O0G92j2iyRErIgCtzdvs8I6D+9
	MHu6tX4bqDtpN2Yjev//qE0D56Sg5vovG6+HcZF31wgDDl4aVaQKDTvBlqo1o/4DysYsa02ROd7JQ
	FjJ5+wng==;
Received: from ip6-localhost ([::1]:45822 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v0fF9-004XPw-6i; Mon, 22 Sep 2025 12:02:07 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:40475) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0fF4-004XPo-GP
 for samba-technical@lists.samba.org; Mon, 22 Sep 2025 12:02:05 +0000
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-70fa62f5bf1so1377726d6.2
 for <samba-technical@lists.samba.org>; Mon, 22 Sep 2025 05:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758542520; x=1759147320; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ECZnkgoeOZzVgCoMyqK1Fb+bRs1tG6tQn7tqh90FSjU=;
 b=avPwYSmpg8vTXggHaILUGKGVc1kOrZYvR5NM8Obt7nt8N+YIUUfUSzUbR4uCSZHjHv
 /A+sxSGcGAJxwwoi0vDttY52TyRS1SUG9p93FXqnb56k96A4mA6A3g5TB6jJUzBfUzwz
 AyEs7Q88H9CFTyIly+qQ26fBG/33fCIR5hgC1YbbisOKAJGyS0o8mQsY8oC5hb+RNI19
 6NvA9aR62A0OpRxzcKu4XUo0f2u2RYjdIslY2zo/5nFgtgujanYcbTF4xDIvw09S88WG
 yH9pt7Kz7/EvszMPZJguOfXEDZs+r+UjGUFsOIafRmwBcGxYiRs86uPQ6pSxFsEQ8RCY
 UWQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758542520; x=1759147320;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ECZnkgoeOZzVgCoMyqK1Fb+bRs1tG6tQn7tqh90FSjU=;
 b=o/mTDNIH/fQpsKWNtU29YGaY1mOfpwRi609qtbnVAEiSUkKmVoFK6iO0+iM/MwB6hm
 Wndm5pTjHtJ9eG5ixbx9HBZrtO4xISGL1LR8RjVZrdJjXcF+baS5qeYLsEioyO1Kr6X8
 bDBsGL834yADqsQkKiCB4f+oWgnwSIsnsdUPwL0++sIXDbL5KHVwE/hybtI+fKRpd7ad
 5uo5HBxnFWJHhZcnrXiKSfQUnMM+Qf1sebyBFt4BhkZ6aWetoAVXiA1yihDJAe4orNWO
 uy/j11mkH4sIInoFR0HRohAgL6YPFD9MSn+pf8SBWOHdkpbB0lhz/N3DcGDsIFpbX0BP
 BV2A==
X-Gm-Message-State: AOJu0Yx28q7pZUSQuwDCN6AbV3CMoGT9iDMXMiibcP8qpmcmsLmxchtb
 SCNOzvmYL38WMrc2WlaSgtoG68BIYTrmG1WWYu3q3Kzil3Gm71ZV2jw1eSPl1B/Zj/twfPbbQtX
 HJ/zBxKnHhOYyaI8KLCml7xxFllW2OZH9Lg==
X-Gm-Gg: ASbGnct8myb2Ifive0PIVFeJmx62Srq55gfYPALOrA7jb6z7+8pjOZpqzv4Oqthk0LM
 Ks1LvsoNOSfkKt1Jit6CKtH/4Z7h43EEcF1IvIv/p/zx3Bih9aD0amzP85MGmYdkw8JwHg1gBxf
 JaIx9XVvjSqzDnXtyEpbMFWpqimFTls0VuCHo99puupTWplrp3St99fnk4itH3LuIZ6BVgI0649
 p4A0tnX
X-Google-Smtp-Source: AGHT+IFZTEa2XU0hNn5kAGky3rgnlg2qLvSlbBpi5iUz+3uIO0C6a/QVUv7eT64AuitlMUR+wHRfSKNnIeDD0Nov5sM=
X-Received: by 2002:a05:6214:2a88:b0:736:261c:d636 with SMTP id
 6a1803df08f44-7990201f05cmr93203426d6.0.1758542519200; Mon, 22 Sep 2025
 05:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <CADrT-m+CZf3_pzAkKXB0UVHkd1o6NJR2bN+udTf-PCEdvSS-eQ@mail.gmail.com>
 <db1fb336-7c9b-4816-acd8-e0815a460b80@tls.msk.ru>
 <1afde102d461529cb041d96e448b9d2d3f6fe836.camel@samba.org>
 <CADrT-m+wq8m42JjDt-eAZrMFqynz5yXKHk9q5ksUxiHew75Dpg@mail.gmail.com>
 <345d53679a0d41e1c930f37422eca0959eebbee7.camel@samba.org>
In-Reply-To: <345d53679a0d41e1c930f37422eca0959eebbee7.camel@samba.org>
Date: Mon, 22 Sep 2025 17:31:47 +0530
X-Gm-Features: AS18NWA4bT7oddXgdPCG8KTw29_Av-EYAzhgXWHJ4JJhRDx6QqhQwJfUinUz2oM
Message-ID: <CADrT-mJXJq7YqntxGkzyTeFKK_Oc4fXoJGHJ_yLX-69aBFxhng@mail.gmail.com>
Subject: Re: Proposal to change smbpasswd file format to address Y2K38
 coverity issue.
To: Andrew Bartlett <abartlet@samba.org>
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
From: Vinit Agnihotri via samba-technical <samba-technical@lists.samba.org>
Reply-To: Vinit Agnihotri <vinit.agnihotri@gmail.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

True,
tdb_sam is next in line :)

--vinit.

On Mon, Sep 22, 2025 at 2:04=E2=80=AFPM Andrew Bartlett <abartlet@samba.org=
> wrote:

> On Mon, 2025-09-22 at 10:55 +0530, Vinit Agnihotri via samba-technical
> wrote:
>
> Thank you Andrew and Michael for your valuable feedback/suggestion.
>
>
> @Andrew:
>
> Although this is true, I believe if we are to change this, then we better
>
> switch to 64-bit time_t, else someone has to revisit this after 80 years =
;)
>
>
> The smbpasswd file has many other limitations, 80 years should be well
> past its death.
>
> However, I note with more worry this in pdb_tdb, for the default tdbsam:
>
> /* times are stored as 32bit integer
> take care on system with 64bit wide time_t
> --SSS */
> uint32_t logon_time,
> logoff_time,
> kickoff_time,
> bad_password_time,
> pass_last_set_time,
> pass_can_change_time,
> pass_must_change_time;
>
> In short, I think we should do the very minimal change for smbpasswd, but
> tdb_sam should probably get a better fix.  I'm still not worried about th=
e
> code running in 80 years, NTLM will be more than totally deprecated by th=
en
> I hope, but there is much more of a case to fix the default backend
> properly.
>
> Andrew Bartlett
>
> --
>
> Andrew Bartlett (he/him)        https://samba.org/~abartlet/
> Samba Team Member (since 2001)  https://samba.org
>
>

--=20
One Ring to rule them all, One Ring to find them,
One Ring to bring them all and in the darkness bind them
In the Land of Mordor where the Shadows lie.

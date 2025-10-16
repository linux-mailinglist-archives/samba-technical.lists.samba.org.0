Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EC906BE46BE
	for <lists+samba-technical@lfdr.de>; Thu, 16 Oct 2025 18:01:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=iFQ+JESL9UIjpR6PcV9P6XUYYp4yVYWVkfQwglpsal0=; b=1LeImv8RRHrxRH3reFKcyDY86s
	zvalWlbKhBOPGTvmLel+Zi3Kqp53gURy6UIP3rJ3Aw/PMtkmnnsqoMBu71TnwmSBIHAd7A6pwrt/S
	LOgyGnMVxbjc7F3mCq3clntJ60X2nu2IzgVtVvJ+ayx1F9s7mUw+LEKbCmHSVszJ2SRFCHR5v1Rs8
	S2WEbOhUg31dLp73lHDlYvElxnw2fbaP3sC0yNdEjfVSr9vGdYT94D0ZVsi32BS4x803OyU0WT51n
	dubjw71zquawf6pRbOt2hByK1I6XcrkNzjSMLPKN1jfT+2lkX7Z6FrrmwCu42wMWLsQwenvNvkN5U
	GkMOKOIw==;
Received: from ip6-localhost ([::1]:40982 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v9QPm-007zb5-3o; Thu, 16 Oct 2025 16:01:18 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:54458) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v9QPg-007zay-Ub
 for samba-technical@lists.samba.org; Thu, 16 Oct 2025 16:01:15 +0000
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-7946137e7a2so16841966d6.0
 for <samba-technical@lists.samba.org>; Thu, 16 Oct 2025 09:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760630471; x=1761235271; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iFQ+JESL9UIjpR6PcV9P6XUYYp4yVYWVkfQwglpsal0=;
 b=aQhHZpb2UXb6+q5z1SYUsp2sk+MHEIoFY2BFZWcKtLakIltQOK53d4Ing0Tm8WlKEG
 hVMmdNRsenK3Iw7r6EYmuvXkP4xHyeq5qs4/FZP3CeCR/yE1wgJ8OJXwcwtTZ9SvTcAj
 uivzKBfjLMa/vwNgNrEPWPsO5/uIwj+uGdAKui0KaVoHllUxuTzBY1I660f1YUrCqrpt
 rYdJJ1+5BLQhTEGaHALorDU75EsWiSme04MJ0RRsf16j5zKH72JQGi5DCl5nbmGlRT42
 86eE5BKHrJhn1izZpBZluQidhOjklnJyKlW/m/CdSNPYn28y1ZG4QduCNAVu3jDNqMDw
 2G4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760630471; x=1761235271;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iFQ+JESL9UIjpR6PcV9P6XUYYp4yVYWVkfQwglpsal0=;
 b=uDFv5dFy82+NRudLIz6BTzU28sMqAGPzadKsZm53JMuyrBG0CDAEfW21jbRhRfW32f
 FssN46g6dh1CexR3z1JrAsNqZrPz5GRWEJaRkavEhuzey49qegMp8IiDdDYsnuObA3Sq
 2XXVcOndZR+ZBd5KKudXjiRzeyzjabJZ3oDLT/YZSzqa93LIENn22Pld/zR3eIAe04O1
 lpqnO8zHMYvuE7b9nYF6ilwTAHSQuGTiJ8vImzPWSdIbXtiJ8OAkHUEwsWWzKZTiFr2h
 r08v3UhXfP/ivvOEypGKo9sAjXY6ZbCgriHaDdPNrPNt+AolAEESfJZ7CGWpxCyjouDW
 VdHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaXQHDROeqKycFXBj4CE296Ntb7CKl5vGYMpHSzheTO23Yu385thR0X63rycuAp6aygls9p6ui/Uuky/wqcFc=@lists.samba.org
X-Gm-Message-State: AOJu0YwQVpCNGFXdILmjSSEItePm2b83ahKEm2N/Tu+T6zoZn4lGG4L9
 DrJNNjs5xqYlwpmnm/jBGqe4/ongqcgWTYTA1lKbpfw1gpfaHJHPzTbYF9qMwH3RQKHgZg1xMbc
 xeBApKqNpTFDFaioZjzRpdK1LiQwajz4=
X-Gm-Gg: ASbGnctdvCJJ/bqckbtiWpjAWH0XkK6bk2L4KOUXtIQ8l4wqq9CtO7ilgmCjm2h4j1d
 e8Ii7D9GxnTSzJS4okN5H6CVk6dxipORNaLG6ivOqI7NkB0hmDT7vWL4LcWYK3pnoGBjtmNcl+f
 /qqETMw+c17CtJeHzaqJgrT5HvXT+zxapPZygQ23MjCFoflzpYxtrARdor9PyY3y48PqWGLQmT1
 P7LYbZWh4wmfGcNUp5zcV81EcwSsfQU/M0woF9gDMUAmW2pJCx+bRA1aN8hS740aueXeiCjC5Sv
 3nKqL+Zv7R6Om1aGVfCwC8AKL9O4W2Viu1F/5nB5fgrjWAi/3PUyAIcuppJF7flQihbOZZFIBe5
 sdKOTCj7bxm6TWdq7v6a6PbS3kItrMpVrnQs5NM7ZkEGOWDTfMkNzI5mKxP6owqKgpTEiRzxl4M
 ajsvfYpnBU
X-Google-Smtp-Source: AGHT+IEjNzMcEiWFAsmyuj/Yi6bdGpUfk6izOvZ1EcmWMdmqpXJOOCJ14NVAuKFiY/6bCaKVNofLoAP/TbJKGrstSkg=
X-Received: by 2002:a05:6214:460c:b0:87c:21b0:79e9 with SMTP id
 6a1803df08f44-87c21b07fc2mr1201866d6.60.1760630469114; Thu, 16 Oct 2025
 09:01:09 -0700 (PDT)
MIME-Version: 1.0
References: <aPBeBxTQLeyFl4mx@chcpu18>
 <1f9e946d-91e3-4f9a-b26c-e69537cbbd4c@web.de>
In-Reply-To: <1f9e946d-91e3-4f9a-b26c-e69537cbbd4c@web.de>
Date: Thu, 16 Oct 2025 11:00:57 -0500
X-Gm-Features: AS18NWCxy8CAvRIZM1Ad_Rzkx26Gk4ZxkE8KTaqrRNxF0A5mEjrWE1pFjeru6T0
Message-ID: <CAH2r5mvKpoaD3DDPAc=xUpbcF4TH4nedNdvZg6LBiETG5x3-DQ@mail.gmail.com>
Subject: Re: [PATCH v2] smb: client: Fix refcount leak for cifs_sb_tlink
To: Markus Elfring <Markus.Elfring@web.de>
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
Cc: linux-cifs@vger.kernel.org, Shyam Prasad N <sprasad@microsoft.com>,
 Paulo Alcantara <pc@manguebit.org>, kernel-janitors@vger.kernel.org,
 samba-technical@lists.samba.org, LKML <linux-kernel@vger.kernel.org>,
 Steve French <sfrench@samba.org>, Bharath SM <bharathsm@microsoft.com>,
 Tom Talpey <tom@talpey.com>, Shuhao Fu <sfual@cse.ust.hk>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

The patch looks fine.  More important is focusing on the fixes (and
missing features) - minor wording of description can be helpful but
MUCH more important is focusing on xfstests, new test scenarios,
automated analysis to find places where use after frees possible etc,
fuzzing (like the great scripts Dr. Morris created for us to show some
potential security issues), fixing the various known bugs, adding the
missing features etc

On Thu, Oct 16, 2025 at 2:22=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> > Fix three refcount inconsistency issues related to `cifs_sb_tlink`.
>
> I find such an introduction sentence not so relevant here.
>
>
> > Comments for `cifs_sb_tlink` state that `cifs_put_tlink()` needs to be
> > called after successful calls to `cifs_sb_tlink()`. Three calls fail to
> > update refcount accordingly, leading to possible resource leaks.
>
> * Can it be preferred to refer to the term =E2=80=9Creference count=E2=80=
=9D?
>
> * Would you find a description of corresponding case distinctions more he=
lpful?
>
> * May resource leaks be indicated also in the summary phrase?
>
> * Would it be helpful to append parentheses to function names at more pla=
ces?
>
> * Is there a need to mention change steps more individually?
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/submitting-patches.rst?h=3Dv6.17#n94
>
> * Will development interests grow for the application of scope-based reso=
urce management?
>
>
> Regards,
> Markus
>


--=20
Thanks,

Steve


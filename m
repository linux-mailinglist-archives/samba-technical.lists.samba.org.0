Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EC6C3053E
	for <lists+samba-technical@lfdr.de>; Tue, 04 Nov 2025 10:46:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=xKJdWvkPbuojvyFkWrgOJDggLZVTca+r/oAisy+M4uA=; b=wI3Xvn0VmM5zdYcQr5AB04P2VM
	gvHbzLAH14TA/BnVbur04ZPO9bgW3k+Eza53gL1vjphN8NZHXJBLTTUSdEXCue6TcaXp1x3IdtDkx
	MpZPJR2cmJstdeJ8f21t88erZEI3szpT+E1BY5JUDoJHq/6ncaFecTZ4XsqUamqQ2ee6hBKgniuM9
	oW6e9a1Ub4NTMW0HKSZj++AISanXrCHwvImVQ1sn9WthZAu2Rvpv2oVSqbcVup6yXNl8M3Jt9bpHA
	Ck/P5dW5LSCgRioDLtoga3rz2XMMjmCYTMk2RMehsEYikDwOqo1NeHiF/kaY+TEUyhkyVXaNpzLzv
	bj2RApPA==;
Received: from ip6-localhost ([::1]:51772 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vGDbs-00BRTQ-UX; Tue, 04 Nov 2025 09:45:53 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:52587) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vGDbo-00BRTJ-Dg
 for samba-technical@lists.samba.org; Tue, 04 Nov 2025 09:45:50 +0000
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-640aa1445c3so3988188a12.1
 for <samba-technical@lists.samba.org>; Tue, 04 Nov 2025 01:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762249547; x=1762854347; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xKJdWvkPbuojvyFkWrgOJDggLZVTca+r/oAisy+M4uA=;
 b=iaCnwZmickTLuys8d2+362gNVQ12XbCvNfslE+GApu+grcMxTupXJJRXVLnB/yj8UG
 GdM60PwZkfFW/VIt76gSSBd/0a2se2Ze/zchbhFExWO01zfnrGgOsy1k8DNVR90txm2W
 hGkscfGu3m1glFW/tDWMaJBred1pIXm41A3hm/qtf/a1iBWnhidT8IhqZkMS/LGgL2Vo
 JqpohFMnUg428geGDxlZuliwnFpiMnfYdGlOXETbgU9UbrEqpnPKEb4k5PKGZYJO4eao
 gBezoa1ZY+EnqY7emzqQeXrIVezfDuXxdnnqWM3w3zgozw+yrEV0r5/ZXCR3xICN/2NB
 rXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762249547; x=1762854347;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xKJdWvkPbuojvyFkWrgOJDggLZVTca+r/oAisy+M4uA=;
 b=w+Taiwe8T4gWICsu0PwM9mTK7tponTKFWHNvp0MVbbWQRK3htkZGz2DEESiPkHw5O7
 6CtD/yYlr5Z9LPLdXRAm0lZ9fTGVu1XECZWHbkSWEL7IiG2prwR1FHGRjkvYMTsPwUSR
 FnPWsyFSFYQRG7b+4ixlXGggm0U9Zt+QWHRFd1U9JYiH+gtLVwQBBT5b/ySHImj2Pdz6
 K0d7Yzf6MA589GlSUOaxG0BI/ZuzxQzA5VwnUbyU26TCAPH68vHldj/LBT2fiemB7skH
 1Dsc8Vwro/drk5SL0DRYuv+1nGChphv2pN15Ronokvjel6IWJiuHHnZEMs0kPYYXpQdB
 QYGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4xsKlR1ZQsHEHcfmX0UFpeZZZpOkPkHqeQCi27VxbQp867mwgO7N0h8/uxW+gbC8JGLJLOQfX8psaR0Xxuyo=@lists.samba.org
X-Gm-Message-State: AOJu0YwgAq2+OowNNPBYysv8zZ+cj4+gSvtBjz0oaWW5dZfDKtTOOxKP
 SkcH860Ko2r/glAKxKqBOUE48aGu2dKRxkfQw2FIRTTXYNXGFTFujLgwi/HEXyF8slUIX/XEaxQ
 eNs4RW92Lg22nXSO0WWwtMu+f3+xazEJo1+FA+E3+XA==
X-Gm-Gg: ASbGncvlnBpqGgOYZp5qH0uHbEqZhYdWH7GKnRE8OgZB5BlJNwtZN6B9L8TfMeA8Yc1
 6cvTiQSjFiFDTRWUg+9lbr7dSU4ExhpB9Prrj/7o+CFRiELXVm4i5gRyf9j73AD4/3hkGPVITMV
 oUwhXK4BpcEiVvQzD61WvRho/sGWNcD6YNCxMz7esu1B3ZOa/BGvh1oIRhzfYShHHPxjVXZDuk3
 xVd5Yt1C2O8uPA+rkufAlgSWjPCnih9GouXBJNKeQ2UxahV3FiFj6uQAziznsJUXoRyFYo18PQi
 gVG/xg8p+o6B+8aDdbk=
X-Google-Smtp-Source: AGHT+IHXA2qJBi6f10DqUtNaDt/G9hT+Ey8B/WnoFdz3Hmrh6KCUpLdIDtROPfgXbvSfxz+h0BRwI+TkCKOqKrtbbyk=
X-Received: by 2002:a05:6402:1462:b0:640:ea21:8bfd with SMTP id
 4fb4d7f45d1cf-640ea219598mr1427481a12.31.1762249547237; Tue, 04 Nov 2025
 01:45:47 -0800 (PST)
MIME-Version: 1.0
References: <20251103-work-creds-guards-simple-v1-0-a3e156839e7f@kernel.org>
 <20251103-work-creds-guards-simple-v1-14-a3e156839e7f@kernel.org>
 <CAHk-=wiSmez2LFEpM05VUX=_GKJC8Ag68TJDByVPO=x4QwjyuA@mail.gmail.com>
In-Reply-To: <CAHk-=wiSmez2LFEpM05VUX=_GKJC8Ag68TJDByVPO=x4QwjyuA@mail.gmail.com>
Date: Tue, 4 Nov 2025 10:45:36 +0100
X-Gm-Features: AWmQ_bn9rw0ha0qFFSykU1xP6jfkkEMSMAVkMSHJG30ZX97XNHwd3yxbJVnihQI
Message-ID: <CAOQ4uxhw2Tc4YXwhkS=5EVC3Tg4F+QyrA7LE3V29pNhQ4WJeyA@mail.gmail.com>
Subject: Re: [PATCH 14/16] act: use credential guards in acct_write_process()
To: Linus Torvalds <torvalds@linux-foundation.org>
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
From: Amir Goldstein via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amir Goldstein <amir73il@gmail.com>
Cc: linux-aio@kvack.org, Christian Brauner <brauner@kernel.org>,
 linux-cifs@vger.kernel.org, netdev@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-unionfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 cgroups@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-nfs@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Nov 4, 2025 at 12:04=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Mon, 3 Nov 2025 at 20:27, Christian Brauner <brauner@kernel.org> wrote=
:
> >
> >         /* Perform file operations on behalf of whoever enabled account=
ing */
> > -       cred =3D override_creds(file->f_cred);
> > -
> > +       with_creds(file->f_cred);
>
> I'd almost prefer if we *only* did "scoped_with_creds()" and didn't
> have this version at all.
>
> Most of the cases want that anyway, and the couple of plain
> "with_creds()" cases look like they would only be cleaned up by making
> the cred scoping more explicit.
>
> What do you think?

I had a similar reaction but for another reason.

The 'with' lingo reminds me of python with statement (e.g.
with open_file('example.txt', 'w') as file:), which implies a scope.
So in my head I am reading "with_creds" as with_creds_do.

Add to that the dubious practice (IMO) of scoped statements
without an explicit {} scope and this can become a source of
human brainos, but maybe the only problematic brain is mine..

Thanks,
Amir.


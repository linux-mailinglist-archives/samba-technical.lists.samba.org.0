Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD0FA79984
	for <lists+samba-technical@lfdr.de>; Thu,  3 Apr 2025 03:00:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ygUwVrVi9cKpehC/2u0WMHNuJzBA8zwdUvkT+YYqi48=; b=WtM4aq3UsTXeg1IEz6pppi9RjM
	W6SZiX0wITtddaC3P8/rbVvwktZYTzIX17QqhA9Y0j7RosXorU7EwiGMx7gNtLmtxrfFVD4Gl94Y7
	vci1EmO85VAzCa/4vYVYo7K1LgP5YbosYq/7zugMU3MN9JA9BZwOOxXLShEgujZSIDs7VuvHZi1zI
	jCB47UXoyT3OuH0xiloxPQj5z1K3kN5qDFmiX/8dPyr6E43V43gE3zGxU7ViFWtQx0Hx3+ZM1Rn92
	F6WZeLjccWtgiVoH32kxz5gc8IOOKqvNpcUZ9/pEDZqWOyvPYG0Ks949OVqW/Fy2/sGgxjaBvFxKJ
	KSKMFzMA==;
Received: from ip6-localhost ([::1]:45898 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1u08wE-001bzX-2q; Thu, 03 Apr 2025 01:00:10 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:47446) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u08w7-001bzO-LM
 for samba-technical@lists.samba.org; Thu, 03 Apr 2025 01:00:06 +0000
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-54afb5fcebaso416955e87.3
 for <samba-technical@lists.samba.org>; Wed, 02 Apr 2025 17:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743641990; x=1744246790; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9pgjYKD7SVUE9VyHxnhFdkSdp4zL61MqgOFAdDIl1rY=;
 b=ayMCgltJ/H/NN1u65HzOtiLxIen5xEcIfZtCt6MZ1vNGP2byMSD4MGFn/WxV7X1UrS
 PHR80/kbEeSsXybjiOpt3ILCc0l/JGkE6BE/VoqVh3koE8ySWgezes2FcxMf8wOOy4V2
 Y3kZ3PKirznOGDwxlRf9MKjryWWKhGvkVSb49/YyCdj8L32k04chIuSguu0zxdECXDBy
 iZrnrATa0aee249bUCUgvMnMNXL870odc9dN4FvWdRmyDu6VAPHKU3hl8AkqmCl7DnL3
 56Ui1067WY6ynA0oLL08ZDybGVvPmOW8/WYhfJccMelyl3SAbT6PWfJPWmmGAAosWYWP
 8Gmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743641990; x=1744246790;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9pgjYKD7SVUE9VyHxnhFdkSdp4zL61MqgOFAdDIl1rY=;
 b=nx5lsqvJPJHoRp9SqLrNVJZe9ONuSxopadOWmyCBYqpVleuXaPOcLEsmYLcwPo/8ib
 gyakJgDmhEbL5+bnWTIVwmudNqeLi5mJSmcj3GIzv/hdNuC33Km+LCMKXshFKN8RtWnm
 a3FiGxI+4uPUgoptel5BPBE5M78JXi+mNlrCvVm1+Jl9RYrPQUAru5Y60bh70aAORbgc
 VabLEMenP2zT8rEPsOuchibd7O82babEXVEH5aLNcrV7j/Pgwl1T9rJVNE4IaAfl5M5/
 FKPDRVnb+wrBtWoyPFhz+Lcz+++YrYmEOGbTTgldCutPnt6nVhZtmb4LEfKsP/qjcjMB
 gSJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXArcE61JCjxlpn6nt2ehDOcH+JkCVpEVbGyzdDMtdAkJ4GqcwakYSBwdu9Z08/YRkhDT9cMjCmw4NmWLpI2o=@lists.samba.org
X-Gm-Message-State: AOJu0YxLqpGziPibvhcxTgznlPCu+07Im9uCUIqi9rrwBUqtmDemak6Y
 jo4ft1y4NkKel55nRxBRL+CiTcWHz3h9HlpwGtpsFYbmlbJe91JX3lJ93wQH/TSwQY0/dr6jvkJ
 yDmNcAsjaTPuvdZZq8uUa3jE6JeQ=
X-Gm-Gg: ASbGnctnfBvUbC4ZLWqZJ43APek0ZZJRj/bFgDRY+d9Htx0ZbCbhAA1+ozc3CoCel2a
 R36AAx/KkTlhtJAcnAhFtlZMDB3YYdWK06rsgEHd3JyGt3jtBlmHhXUFlWZdoFfXVLdPN3IGP+u
 mf84ViV5s/lvv+FifXkZYUKCnJSvFrp7e8hkm8Mm3h+OM7Oa2nMos7ftmma20=
X-Google-Smtp-Source: AGHT+IE2Pi5bLg9CiTq0rJ57La+QZ3FKACtkW7z8vROMVH+Mwlq18n82Lcl1qCY1o0g84JLbRECPXndnDrNptoARpG0=
X-Received: by 2002:a05:6512:31d4:b0:54a:c835:cc4d with SMTP id
 2adb3069b0e04-54c19c8ce3dmr1523990e87.49.1743641989757; Wed, 02 Apr 2025
 17:59:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250402202714.6799-1-kuniyu@amazon.com>
In-Reply-To: <20250402202714.6799-1-kuniyu@amazon.com>
Date: Wed, 2 Apr 2025 19:59:37 -0500
X-Gm-Features: AQ5f1Jq6AHKlRZA_D3DpNNZ3TnsdllNwvPUpyDfZOiRuosA16qShPzx1xtvnFQc
Message-ID: <CAH2r5msPRDdRHdTU-ki4udsu1R7hecrLms-fURs3dV=o-5Osbw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] cifs: Revert bogus fix for CVE-2024-54680 and its
 followup commit.
To: Kuniyuki Iwashima <kuniyu@amazon.com>
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
Cc: Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>,
 Shyam Prasad N <sprasad@microsoft.com>, linux-cifs@vger.kernel.org,
 Enzo Matsumiya <ematsumiya@suse.de>, samba-technical@lists.samba.org,
 Steve French <sfrench@samba.org>, Bharath SM <bharathsm@microsoft.com>,
 Wang Zhaolong <wangzhaolong1@huawei.com>,
 Kuniyuki Iwashima <kuni1840@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

might be helpful if there were eBPF tracepoints for some of this that would
be able to log warnings optionally if refcount issue on sock_release and/or
rmmod

On Wed, Apr 2, 2025 at 3:27=E2=80=AFPM Kuniyuki Iwashima <kuniyu@amazon.com=
> wrote:

> Commit e9f2517a3e18 ("smb: client: fix TCP timers deadlock after
> rmmod") was not only a bogus fix for LOCKDEP issue but also
> introduced a real TCP socket leak.
>
> I'm working on the LOCKDEP fix on the networking side, so let's
> revert the commit and its followup fix.
>
> For details, please see each commit.
>
>
> Changes:
>   v2: Add Cc: stable
>
>
> Kuniyuki Iwashima (2):
>   Revert "smb: client: Fix netns refcount imbalance causing leaks and
>     use-after-free"
>   Revert "smb: client: fix TCP timers deadlock after rmmod"
>
>  fs/smb/client/connect.c | 34 +++++++++-------------------------
>  1 file changed, 9 insertions(+), 25 deletions(-)
>
> --
> 2.48.1
>
>
>

--=20
Thanks,

Steve

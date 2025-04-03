Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BBCA79A68
	for <lists+samba-technical@lfdr.de>; Thu,  3 Apr 2025 05:20:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=CiIkKQKIy0XxhkSJxnoNEJ2UClSeAt3PNfoi3TRl3cM=; b=c3aPiE4oBYGhtQHjrx3T6W5OXT
	UwAzc1e/+4U2L9+WCejfmHE7vthAC9Agy/Wlsy7t1buKIEs5mc4HgUCmEwVVCqlB4ryzRX2NVSC4F
	x3ECp0voS8li3WJ9UFq/IGPMgoN1KUJ+7ovDi8pAB18brBWTZNiC/Zs8SfP/bSoU8xF8Hl6O4uc+N
	QaSWZ1otsCsGeqp0NgPhRMB2Meh9jnKhIko1h/hVpOcGQLbm0dbTd3qDsxAOfU78ewCTmm4glFo+u
	dWB/3r9w3BQcdPIHxO/uwJBK3SvxKz1YONVfoxcH4Potc0V5iYSSalcAs4FZOZQ6kYWkINkfUCBtT
	wZZ4FLXQ==;
Received: from ip6-localhost ([::1]:44064 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1u0B7d-001cJ9-43; Thu, 03 Apr 2025 03:20:05 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:57772) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u0B7Y-001cIz-VG
 for samba-technical@lists.samba.org; Thu, 03 Apr 2025 03:20:03 +0000
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-30bfe0d2b6dso3536751fa.3
 for <samba-technical@lists.samba.org>; Wed, 02 Apr 2025 20:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743650388; x=1744255188; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CiIkKQKIy0XxhkSJxnoNEJ2UClSeAt3PNfoi3TRl3cM=;
 b=SSRvG12I+5W4BZYKIO8AO4BIbMnQ9ZRdgDL2Cn/rYQBCXAKnGC5QNGYN9X6QEWiq+c
 B698iY0UJUbx8rMflTQl0wjeeB6TwVHRyjHD7K7YlYbtrRcxYxrTuI3esZ951LejYuW3
 5xN5fa/GjdPbJxXPQ9OqBVWW7h4sLvtEEvFF7AQpfQ/4MjXc61SO7we7WJqkee/unq6i
 SOtxEGxMmoTawpyIzCwaFKy5L+ObnNjYNpD0uhwxfG2RCEeHU1zVyYDyje0WuJMEEVJC
 g1KS0jivK4C/oyYNOkBTPQltrpLnNSbCE4vesQ/RGS3NiY2UIm9otEYWCEaA/7/uhwSd
 xttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743650388; x=1744255188;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CiIkKQKIy0XxhkSJxnoNEJ2UClSeAt3PNfoi3TRl3cM=;
 b=kf/GRhqxdrDUS4KOADILY9Gya47Hruts4UCYa/dT+o3DbNu2Md50uEgdOeAW6S5jeO
 gv4VJ+AOOy3swrxRtR224y9x4djbGTfwkbFiPV4Yv/P+uC3m153WdZPW2p+FFxmzFdXh
 IqeaUjA9r8W56kcvy56svTgHsUQ1yja79a0yPNBqaiA67UXaqdKHfPNO0s1JE24vWONg
 /ymBCun0BFuxMzTmi6NJBQ0lUs/4WEckEgk4ldpl5Ry/Da/QIugTIEjuuOlEtcvpXmcZ
 Baev/08nGngKO3m/x0LG8ooH1HSyO8A91PD/9JpN/5vGMwwec+lmgPnzn6gVPlUAW15G
 WRHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUr6jl/hLEVzqlGRmtztz166/5GOTIc9WrK4k8YbIWURkZFOsMP3SGtUSDQjCeG2XAueLYbJYA7YCMdgiUrkY0=@lists.samba.org
X-Gm-Message-State: AOJu0YymE0brg9679+ostIsCeQDnEUaO5zDm2Jq2Gen3l0jIWB9aONhT
 8mr2LF6yS5rwGh0RfbKu/g+ZB4gzA+0dOGK3bR2cWj3qlKGJpEPmF6v5qcP7+fjGI2N7ZsWpg3Z
 6gq0Fd4DnGdUDDxVROTrF9P4XYIA=
X-Gm-Gg: ASbGncsKHEomE6FuOQwr2CP3CmrVHJgGgrFlLo4f2U0haL8qfXJhFdkAR6XXr5aApKA
 RBmiNvfXaUuV/TOu7TjWazfRMUXumrJQW+lBIsLQJtEmYg2JRlCsZIQzqWX2IyGokgzUHaegUQX
 PI1swzJhnjrVJzDD236WOWnfZdGjJH8VaoRt2o29vVXMA+gS4soFwy20h8Y+M=
X-Google-Smtp-Source: AGHT+IG7rjnTU1EgqlwK9adNKeontRlIOfXsSHl79G4extA/wzUM9snPQg2SrcXYgVwKmIOraELNxs0lWw8/ls0tLXg=
X-Received: by 2002:a05:651c:1592:b0:30b:9813:b002 with SMTP id
 38308e7fff4ca-30de02cef5fmr73548441fa.30.1743650387488; Wed, 02 Apr 2025
 20:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mt68AFyJGdBcPB+eqzdAdbx=0QXC_U8MY-te26Wb0ye5w@mail.gmail.com>
 <20250403021927.53033-1-kuniyu@amazon.com>
In-Reply-To: <20250403021927.53033-1-kuniyu@amazon.com>
Date: Wed, 2 Apr 2025 22:19:36 -0500
X-Gm-Features: AQ5f1Jp24pzOmXXL0bKtHYtfuJLDcOpHeDOjaRGnmENco1TJg0napsX5Suc74pI
Message-ID: <CAH2r5mu7Wf0n9ZmnhAAWetKRiUczHv+odYHj5bBg6a=G1y2kcQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] cifs: Revert bogus fix for CVE-2024-54680 and its
 followup commit.
To: Kuniyuki Iwashima <kuniyu@amazon.com>
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
Cc: pc@manguebit.com, linux-cifs@vger.kernel.org, sprasad@microsoft.com,
 ematsumiya@suse.de, samba-technical@lists.samba.org,
 LKML <linux-kernel@vger.kernel.org>, tom@talpey.com, bharathsm@microsoft.com,
 wangzhaolong1@huawei.com, linux-net@vger.kernel.org, kuni1840@gmail.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I can run some regression tests with these two patches, but it would
be very helpful if the original patch authors could comment (Wang and
Enzo), and since this apparently relies on a fix to the network stack
(the LOCKDEP fix) it would be helpful if any opinions from the network
devs.

For a complex issue like this it is important to have at least some
Tested-by or Reviewed-by for these two, because I was having trouble
reproducing the various reported problems on Ubuntu (or our Fedora
test VMs), and the refcount issues are more complicated they seem.
Let me know if anyone has reviewed these two patches or tested them.


On Wed, Apr 2, 2025 at 9:19=E2=80=AFPM Kuniyuki Iwashima <kuniyu@amazon.com=
> wrote:
>
> From: Steve French <smfrench@gmail.com>
> Date: Wed, 2 Apr 2025 20:14:03 -0500
> > might be helpful if there were eBPF tracepoints for some of this that
> > would be able to log warnings optionally if refcount issue on
> > sock_release and/or rmmod
>
> I just posted a fix and there explained that the socket and module
> refcnt discrepancy is totally fine without LOCKDEP.
>
> https://lore.kernel.org/netdev/20250403020837.51664-1-kuniyu@amazon.com/
>
> So, in this case, the helpful warning is one logged by hlock_class().
>
> As it returns NULL and triggers null-ptr-derf, it means something went
> wrong, and I guess it was acceptable because LOCKDEP is not enabled in
> production.
>
> Btw, I posted v2 with Cc: stable tags as requested by Greg, so please
> drop this v1.
>
> https://lore.kernel.org/linux-cifs/20250402202714.6799-1-kuniyu@amazon.co=
m/
>
> Thanks!
>
> >
> >
> > On Wed, Apr 2, 2025 at 3:03=E2=80=AFPM Kuniyuki Iwashima <kuniyu@amazon=
.com> wrote:
> > >
> > > Commit e9f2517a3e18 ("smb: client: fix TCP timers deadlock after
> > > rmmod") was not only a bogus fix for the LOCKDEP issue but also
> > > introduced a real TCP socket leak.
> > >
> > > I'm working on the LOCKDEP fix on the networking side, so let's
> > > revert the commit and its followup fix.
> > >
> > > For details, please see each commit.
> > >
> > >
> > > Kuniyuki Iwashima (2):
> > >   Revert "smb: client: Fix netns refcount imbalance causing leaks and
> > >     use-after-free"
> > >   Revert "smb: client: fix TCP timers deadlock after rmmod"
> > >
> > >  fs/smb/client/connect.c | 34 +++++++++-------------------------
> > >  1 file changed, 9 insertions(+), 25 deletions(-)
> > >
> > > --
> > > 2.48.1



--=20
Thanks,

Steve


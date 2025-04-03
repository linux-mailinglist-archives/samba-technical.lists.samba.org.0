Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1076FA7998E
	for <lists+samba-technical@lfdr.de>; Thu,  3 Apr 2025 03:14:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=hohzDYZ6FlI+cb3uFQ5CJ3xazJWQcQVGVVZ8oxro6eI=; b=gjZY7j4/ADHCug6VDxlEEuxbDf
	MvqNhEuoCTa82SZbXq+NA06itbjsgPc4TwVNemkIU6ql4nudci4iaoIQgtw3Z8RoS0oPP11Hv0xya
	/DzFvur/mnikULrDKGep6vRj23l6C/m6ICB9U8axRGq9UyzK66HHWQYKKPWa8gDs7WkmHTpzQUJ5l
	kHvzJoX4MQmLOAtIssWz+bMhvMzsAuXy2eES/L2BjB6jYp+ITPNl6YY+y/PnBgV2H5kk4UUOFgGC9
	DXwFlQgRq4UZU/ZQEWE93lKssHQS7h4Bzhz5cZW2rlXO/XoxatZQ7YYJepgUB1Is0T4g+r9vbT1T1
	UGhgsCMw==;
Received: from ip6-localhost ([::1]:59088 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1u09A9-001c4s-Lk; Thu, 03 Apr 2025 01:14:33 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:43128) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u09A5-001c4l-39
 for samba-technical@lists.samba.org; Thu, 03 Apr 2025 01:14:31 +0000
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-54ac9d57173so1585070e87.0
 for <samba-technical@lists.samba.org>; Wed, 02 Apr 2025 18:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743642855; x=1744247655; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hohzDYZ6FlI+cb3uFQ5CJ3xazJWQcQVGVVZ8oxro6eI=;
 b=hQg72aunCFFNkJ2QGj249kg4DY+/UMv0FdQ2xSirDiefrB++6gPdmT3IrqLefwPZRR
 wP2F7q6Y7UlD6GXLhbfY4+oFlEF1AWuTOPmmaM6J6pT0GxM8Mkmvpkp5RJ0iqh6Rie9J
 pP5KDN843R4mfuKBxCiJg/gxr/oDObv7en6ZWWNHT+ZLGVLIFNT2znBHAjbk5vGz6qjY
 cM9kTOV6VH56Ds8qII3cpXfDhK9IXu8qiJatOgTLOQd0j4PYQOHe/SHy/fW6GNInDIWM
 LopLzEpXrJvjMoKndg3YXun/DlAfkOhNENPMPzJQIY0q53Fg9Poxyl16XY1AVM5rHkEz
 L+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743642855; x=1744247655;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hohzDYZ6FlI+cb3uFQ5CJ3xazJWQcQVGVVZ8oxro6eI=;
 b=lwPv5mjdtyWipJ26QaIBJ+P/cN1EDQ8GCq/7vALMbp7hnShv7sYxg1AjS6lKnBCGHx
 +Bkr4H+Odfh7s8LwxyKDU/3yPWe0Lw/mC7RLxtshtsv/DZ91M+BZCpSgdpm3h7aQFDWr
 XOA0YD7mdjxLanQ2Uyrzs+zHHM4+anwRIES46RGWnbWzqb/mjlHGTuL0p59q8vtm38Ld
 wPdgGsxPLlBIGCiXHxBgwqWE8nDZoV8eSZo33qIsOvx6lgcfJ7d8Nb+/ldYs/iSU1WqL
 6zu5WU21pQkxzIuO32a57pZ6NB3Yh3glLnFuUbKM6rgWkitd4ocONz+jogXQC09bWR8r
 6e+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoP6UlwRfil9yFrClL/7ZtY9KxpMWMbcuSSUbEK5mGTr9RP4ZdrkF/I59rLWYdd1sgPQJACKZj3Y3NoyLp51U=@lists.samba.org
X-Gm-Message-State: AOJu0YzpYommOXX/yUwGOIvsU0g7loZKZpRvtapt9uC2VT0+R04+s/G7
 TJYay5u/+Ao++cXAeYSwu3DDV2lNbc9qbtr5oPESn0vXt98zQjzIv1DSESBGiECLKQTDQJuwyIU
 Cq4xIq4bPAmfLFOYpTheRg/o3XFc=
X-Gm-Gg: ASbGncu4kvcy8dcAg36bWr9WqzZOhJpa1IJJ3aXxDsXVPB6+5iF4dqgtbJ/Zs601j1S
 osNt0jdi3/M0QBKv0Lu01TUKp8e5zrIZ3Er+L/Mg5Q7Rv1/7i6gROKmNUgSCcV4U4kbuqrrT7f/
 rp0DzF9ZYArNynrfjdxZ6gENJKF4BtK+UtcbHt3/ta9oZSMwb4c541RA306TSGP9E1OWXLtg==
X-Google-Smtp-Source: AGHT+IGuljGeIJ8V+UnF5jeVqiCJaHoqTcV9VjMiV89lFThrlMNWp5FWVsSlRnwQFFKIgzfsXe7cWnV0yKQGQAvRCmg=
X-Received: by 2002:a05:6512:2c06:b0:549:5dcf:a5b with SMTP id
 2adb3069b0e04-54c1ca56dcamr510439e87.4.1743642855318; Wed, 02 Apr 2025
 18:14:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250402200319.2834-1-kuniyu@amazon.com>
In-Reply-To: <20250402200319.2834-1-kuniyu@amazon.com>
Date: Wed, 2 Apr 2025 20:14:03 -0500
X-Gm-Features: AQ5f1JpOfPXmxLBAK2JBQEl3k57ch86u5v63Nw177_ohPVCem745BX31RIrob7w
Message-ID: <CAH2r5mt68AFyJGdBcPB+eqzdAdbx=0QXC_U8MY-te26Wb0ye5w@mail.gmail.com>
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
Cc: Paulo Alcantara <pc@manguebit.com>, linux-cifs@vger.kernel.org,
 Shyam Prasad N <sprasad@microsoft.com>, Enzo Matsumiya <ematsumiya@suse.de>,
 samba-technical@lists.samba.org, Tom Talpey <tom@talpey.com>,
 Bharath SM <bharathsm@microsoft.com>, Wang Zhaolong <wangzhaolong1@huawei.com>,
 Kuniyuki Iwashima <kuni1840@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

might be helpful if there were eBPF tracepoints for some of this that
would be able to log warnings optionally if refcount issue on
sock_release and/or rmmod


On Wed, Apr 2, 2025 at 3:03=E2=80=AFPM Kuniyuki Iwashima <kuniyu@amazon.com=
> wrote:
>
> Commit e9f2517a3e18 ("smb: client: fix TCP timers deadlock after
> rmmod") was not only a bogus fix for the LOCKDEP issue but also
> introduced a real TCP socket leak.
>
> I'm working on the LOCKDEP fix on the networking side, so let's
> revert the commit and its followup fix.
>
> For details, please see each commit.
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


--=20
Thanks,

Steve


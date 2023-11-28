Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3F17FCAE6
	for <lists+samba-technical@lfdr.de>; Wed, 29 Nov 2023 00:33:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=EQFaJCW1VaxJ6/1dN04keGz+7ihVCneEwfQ4KYYFGmM=; b=lHuURb+cATr8y6uHG4fVk+vEaY
	LEqOXt5TO75c/UHZNfrex9zRq0iTnFqiPWr61H4ug5ho/mUswv7pJdwh5+oylLUarDew4DXoBDhVN
	avf1/mwnKzQin5qtUjpqotQ49j9ztSe/NhFlG3nYj1PUmWpr7vIGxO3QmvlNuwcpQgMCEVzwPDb2Y
	jDh4/LdkfDyJ652BYV9cS0mI2+pExdN3FpuVP8FhI0oi/NXlPL7A3RQEniq8L0tj6/y42zXmPFjhL
	bALKrEGVI2akQNb4pf5RZtMhE6cNUoJO1A0e0BltNjXP8Myj22tyY1zLXfaKr9q4OKPr0pPD9EoaH
	VRnjkPyg==;
Received: from ip6-localhost ([::1]:42364 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r87Zk-001GPM-RJ; Tue, 28 Nov 2023 23:33:08 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:54782) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r87Ze-001GPD-CW
 for samba-technical@lists.samba.org; Tue, 28 Nov 2023 23:33:06 +0000
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-507a29c7eefso8029304e87.1
 for <samba-technical@lists.samba.org>; Tue, 28 Nov 2023 15:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701214381; x=1701819181; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AE3kxZh9LV/jeGpsJMF+rMwQ3qIva2uwyuXkO04JfM8=;
 b=LuAyKMEErQBRkD1WfxKRt8Eq7rKfwmayWTsNTmf9oXfNmYF8rUXL/FYr+G98su/fJF
 0k0eejbXnzd934jYudAJK4QbJp0j28FHJk1VU+Ifk97NaRdHVS1Ke2i/gcUrqg8LuYVy
 ee5uf4xH5y1VphgKCKiB6GKJc4kTqdrJjvjcGIHUm9PX4e/EdpmDn/7jfpyVoNuj8Z4w
 wUmBS33wS07D+YHnDlZKrUiMsE/K74ZTd/m0GPo2F5e9yYjgs4+RdGxYNsiH0jLmI06Y
 O8VFTWBYgM2d2Ofee9UXcZHkjStzRWhQ4qsNYPMt3ufrXJ3H2BEss0BnTIC5GDswq2E0
 fgxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701214381; x=1701819181;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AE3kxZh9LV/jeGpsJMF+rMwQ3qIva2uwyuXkO04JfM8=;
 b=hrmppqOPHM0UhY4AXOST1Pqgxh/Eyxa1HpP84TbS81wnT+qZ4HFjlUMbYfA1LU7o44
 FjGJiVk5dStrBhQl+eIEG9ZOx6eiAdP8rIgNf8AO+6kHF+XVLX1OJfUECUOeRE4WQ+TF
 z1JXrVzC2yCzFuWbUmYiND2UxX6otCO0x+EZGfgOkjvjoI3o2aRg2Cr5DmKJKOyifGrj
 ue26T/vLfSlt9ED3ncOnE3qkJb2UDb+3U8My8sqYtM7imsYIjK4teTNMAau3Mk+efpNW
 BLawyoAl9sb6wpNymPxaM6kfv3+2wph7xwZS11EsftfWR5k3KrBvfVsZuz9p6AaBuAGO
 aw9Q==
X-Gm-Message-State: AOJu0YyzIcvob8HTssNm/l6+mFKnY8CEI3NCDhxjAha+p7D4EiF17wJX
 B/oZU8YiOQPqzwrJwsEtcWQV3wM8gEyTrpkOUvQ=
X-Google-Smtp-Source: AGHT+IHJ+jdLpW9cV6lOXwiS4cMxxhrFQz8BhUTPeuCwZwsnsmk2m2a7Xros3NTQRU8W+agtdUWT9NDpUWjux44bI9I=
X-Received: by 2002:ac2:4210:0:b0:50a:9fb9:91b with SMTP id
 y16-20020ac24210000000b0050a9fb9091bmr9269414lfh.64.1701214380740; Tue, 28
 Nov 2023 15:33:00 -0800 (PST)
MIME-Version: 1.0
References: <e916bdea-4197-4372-a15b-cea41c8ebe03@samba.org>
 <ZVJh3X9GQ5L9mLS0@jeremy-HP-Z840-Workstation>
 <e6bd562a-296c-44f2-8164-8a90d98fa6e2@samba.org>
 <CAN05THS4H1+vHuPSnRQmiRtDDpnw3j0PUUJi6FwFZf_2zrAsRQ@mail.gmail.com>
In-Reply-To: <CAN05THS4H1+vHuPSnRQmiRtDDpnw3j0PUUJi6FwFZf_2zrAsRQ@mail.gmail.com>
Date: Tue, 28 Nov 2023 17:32:48 -0600
Message-ID: <CAH2r5mspC6iufincWMtHWrY=Le6nbsDEB3kpFxUFAhKSWR-2bg@mail.gmail.com>
Subject: Re: [SMB3POSIX] File attributes
To: ronnie sahlberg <ronniesahlberg@gmail.com>
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
Cc: Tom Talpey <tom@talpey.com>, Volker Lendecke <vl@samba.org>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Nov 14, 2023 at 3:30=E2=80=AFAM ronnie sahlberg <ronniesahlberg@gma=
il.com>
wrote:

> On Tue, 14 Nov 2023 at 19:16, Ralph Boehme via samba-technical
> <samba-technical@lists.samba.org> wrote:

<>
> > > chattr - change file attributes on a Linux file system
> > > Might be done via a tunnelling ioctl ? Other thoughts ?
> >
> > well, it's a rabbit hole of its own and still seem to be rarely used on
> > Linux and the BSDs. It's not POSIX anyway so just declare it out of
> > scope for now?
>
> Not to derail, but "chattr +i" is not a rabbithole. It is very much real.
> If you are going to set up and run bind locally on a systemd-resolved
> infected system
> you literally must use chattr +i to stop it from ruining your
> /etc/resolv.conf
>
> >
> > The Linux interface is via ioctls so doing it over the wire via SMB2
> > IOCTLs looks like a good way forward allowing us to ignore this for now
> > and possibly add it later if there's demand and resources to implement
> it.
> >
> > -slow
>

Couldn't we implement "chattr +i" ("immutable") by updating the ACL? Or if
the ACL solution is not good enough (e.g. preventing links to be created to
the
file etc.) then seems like no harm in defining an ioctl as a secondary way
to set the following attrs:

#define STATX_ATTR_COMPRESSED           0x00000004 /* [I] File is
compressed by the fs */
#define STATX_ATTR_IMMUTABLE            0x00000010 /* [I] File is marked
immutable */
#define STATX_ATTR_APPEND               0x00000020 /* [I] File is
append-only */
#define STATX_ATTR_NODUMP               0x00000040 /* [I] File is not to be
dumped */
#define STATX_ATTR_ENCRYPTED            0x00000800 /* [I] File requires key
to decrypt in fs */
#define STATX_ATTR_AUTOMOUNT            0x00001000 /* Dir: Automount
trigger */
#define STATX_ATTR_MOUNT_ROOT           0x00002000 /* Root of a mount */
#define STATX_ATTR_VERITY               0x00100000 /* [I] Verity protected
file */
#define STATX_ATTR_DAX                  0x00200000 /* File is currently in
DAX state */
--=20
Thanks,

Steve

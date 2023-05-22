Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3E570B746
	for <lists+samba-technical@lfdr.de>; Mon, 22 May 2023 10:05:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=FVoPGktCVxZ7I7pWV/dKHM8hG/ValAUm7IgNP+5cCl4=; b=mAS8NEsfAGCqIlleLZcj3IjX6m
	HAgaImCaU9G/moAoeFtyKcll7aEFaSX/qbRk/zdNa8eHHdXjROJdmkG3NUGTb4ictbXllb8vo0N+D
	UvCaXTEmWKYx3somFXw+wqoPfg+UHpBTUepW/NODdOg0BW7M1uyWlsPrPsdD+SoQH0J4SJt4j06MX
	qeyYC4pX0A3augMWm5EAasz3ho4t8258wwbVRbtcrSrQKv9Mc2dDFC51U6JCfhERhKSKWbOsnCZMY
	oJjzCqorZSMYxCa8i1ULvqNE/KmyexWMnSkCs+B7kHerp2GuvgCvG9gL9nc5T49xGRdRhgJrcrYMc
	IIWxLGOA==;
Received: from ip6-localhost ([::1]:51214 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q10Ww-00B8oB-Qb; Mon, 22 May 2023 08:04:34 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:60602) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q10Wr-00B8o2-Aj
 for samba-technical@lists.samba.org; Mon, 22 May 2023 08:04:31 +0000
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-510ea8d0bb5so6333345a12.0
 for <samba-technical@lists.samba.org>; Mon, 22 May 2023 01:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684742668; x=1687334668;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FVoPGktCVxZ7I7pWV/dKHM8hG/ValAUm7IgNP+5cCl4=;
 b=Ayj/fJoXlly24dKezTqDQda1QVp3kPflNFTRBGCApXT/NioCd/3louFRldPosbteKZ
 5CZ+p0DnY3Mpn90GYb24yx8uN8WjrU8DgMNS2d8nXY/T4XBYfayfc0l5SEjXi/YAAbET
 TUBgwJNGIR1ZWeA4DUSYdEZwAk/etx7S3EwPZoPiMBBkkz7XC6UCcZy/pfbQbWyKzQDs
 Z2zSPI9vZmIPJX1/AzwoWZFXXTNxv7PupxQQvB2CmTU5QZGwM3Hnk8xwkLUldgNGjnfY
 F8oduJM0iKugUviWrcCVjQG4benTUgpgvVGdONha3oCAbuEsxRakCCBm8njghgliOQr2
 7u9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684742668; x=1687334668;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FVoPGktCVxZ7I7pWV/dKHM8hG/ValAUm7IgNP+5cCl4=;
 b=jskryMj3UHLpw2v68/1DZkCM4GFUYS+Sgi6SnglBpu+Fn3QjWAD6c1GB70LFcsBT7E
 UL7RDFZy0WpeEHfpHOKotZ3YvIPY0pfyNOkNvJtxgTgha+LdPKFuCI02f/XKW2sIosa3
 eimtkWPRZIinLwPjjPBBcazxE5LMJdCZDUI8y6HlaRBD56GaufuOKiNQkMNzkxbR6soB
 Cfc/Wgwxb8XQk5iebZoMfjrpDTngvIGVWy4zY2tyluU/0Z+93h8cu+deHj5jugdeTpoI
 2CuevponwA5yRW+utCgn8QyjC6OakI213dtVoMmKRBtL8dQdt2mwQrdAGDraaoaHb9Ck
 E1/A==
X-Gm-Message-State: AC+VfDxDhpd6fw0sxG6Gs3ELIVPRGZc0hYWgkVL1iSUWVeQ/MfMFzGPY
 paFThw3+da5m+BqADnKLYo8XuZvAuCjSMLVwxf5AO6/yel0=
X-Google-Smtp-Source: ACHHUZ6P4eYcbViBSBokKd/QDJANfsxUT4RcwcSupXg4VvwJqh0qFjOIrWXJdZ2TuBOkguzAdcs0BF+1TDVQ1+50S2k=
X-Received: by 2002:a05:6402:12cd:b0:510:ed22:db43 with SMTP id
 k13-20020a05640212cd00b00510ed22db43mr8357858edx.24.1684742668169; Mon, 22
 May 2023 01:04:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5msxkE5cPJ-nQCAibJ+x+hO7uSLpasGm81i6DknQ8M5zWg@mail.gmail.com>
 <CAHk-=wiStOAKntvgzZ79aA=Xc0Zz7byoBxBW_As5cmn5cgkuoQ@mail.gmail.com>
 <CAH2r5muxwEMA9JpE6ijSbZEByxRmtNSiwcXMbOz+Ojo8_APJUQ@mail.gmail.com>
 <CAHk-=wjeuUNo6o6k4y3nQD2mmT5T04ack7i_UOAetmga-4_SbQ@mail.gmail.com>
 <CAH2r5muRG45L3bNsNV1LJ_komzbp-js11sn+EfQ6Ys6b=X683Q@mail.gmail.com>
In-Reply-To: <CAH2r5muRG45L3bNsNV1LJ_komzbp-js11sn+EfQ6Ys6b=X683Q@mail.gmail.com>
Date: Mon, 22 May 2023 18:04:15 +1000
Message-ID: <CAN05THRhO_SUs46=x5p6FZFNUAr-fsOWpzb9pM25eC9YcmXsAA@mail.gmail.com>
Subject: Re: [GIT PULL] ksmbd server fixes
To: Steve French <smfrench@gmail.com>
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Sounds like a good plan.

On Mon, 22 May 2023 at 14:39, Steve French via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> On Sun, May 21, 2023 at 2:21=E2=80=AFPM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Sun, May 21, 2023 at 12:03=E2=80=AFPM Steve French <smfrench@gmail.c=
om> wrote:
> > >
> > > I would be happy to do the move (to fs/smb) of the directories and
> > > update the config soon (seems reasonably low risk) - let me know if y=
ou
> > > want me to send it this week or wait till 6.5-rc
> >
> > So I think the "do it now or wait until the 6.5 merge window" is
> > entirely up to you.
> >
> > We've often intentionally done big renames during the "quiet time"
> > after the merge window is oven, just because doing them during the
> > merge window can be somewhat painful with unnecessary conflicts.
> >
> > I would *not* want to do it during the last week of the release, just
> > in case there are small details that need to be fixed up, but doing it
> > now during the rc3/rc4 kind of timeframe is not only fairly quiet, but
> > also gives us time to find any surprises.
> >
> > So in that sense, doing it now is likely one of the better times, and
> > a pure rename should not be risky from a code standpoint.
> >
> > At the same time, doing it during the merge window isn't *wrong*
> > either.  Despite the somewhat painful merge with folio changes, I
> > don't think fs/cifs/ or fs/ksmbd/ normally have a lot of conflicts,
> > and git does handle rename conflicts fairly well unless there's just
> > lots of complexity.
> >
> > So it's really fine either way. The normal kind of "big changes"
> > should obviously always be merge window things, but pure renames
> > really are different and are often done outside of the merge window
> > (the same way I intentionally did the MAINTAINERS re-ordering just
> > *after* the merge window)
> >
> > But we don't do renames often enough to have any kind of strict rules
> > about things like this.
> >
> > So I think "whenever is most convenient for you" is the thing to aim
> > for here. This is *not* a "only during merge window" kind of thing.
> >
> >                  Linus
>
> Here are two patches:
> 1)  Move CIFS/SMB3 related client and server files (cifs.ko and ksmbd.ko
> and helper modules) to new fs/smb subdirectory (fs/smbfs was not used
> to avoid confusion with the directory of the same name removed in 2.6.27
> release and we also avoid using CONFIG_SMB_FS for the same reason)
>
>    fs/cifs --> fs/smb/client
>    fs/ksmbd --> fs/smb/server
>    fs/smbfs_common --> fs/smb/common
>
> 2) With the fs/cifs directory moved to fs/smb/client, correct mentions
> of this in Documentation and comments.
>
> Follow on patch can change Documentation/filesystems/cifs -->
> Documentation/filesystems/smb (since it contains both server
> and client documentation)
>
>
> --
> Thanks,
>
> Steve


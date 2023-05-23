Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4B170D12C
	for <lists+samba-technical@lfdr.de>; Tue, 23 May 2023 04:24:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=nXoS4COc3uOsHLWII8yrlNklENgmiiw8Okld7fOckYw=; b=fhYC85Lv36hK5OzSniZzCD3hAx
	mivx3ZmHjQXdN8ecSu8JVRXDrpyD9BqkXfpKuFX3Cs9QdS6qHYWsCcPPmA3P3ByL1BSUihMrBKPPj
	wb7S3JflqytT7RU9S1pF03jK5DT4nd6nwLCpY3w3k4c8PgKZKybFiWTrEb8UXc6zfdUZb/H7poMFO
	WSKa8bnYUT/PTd6izkCypl4g1fasSTeKV7h3A34IySVhJgtoq/y9mTedcXvRXACqct9USRbuwWC49
	sYmIF4WMOOcoh59oBb8DHV4dRb6gsTlZ77tF3Tsv3Uz0zQyub0p6kOTagAU/OODk3dBaSQVNu6bS+
	vejUgLiw==;
Received: from ip6-localhost ([::1]:49656 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q1Hgm-00BWGu-1e; Tue, 23 May 2023 02:23:52 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:52668) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q1Hgg-00BWGl-BR
 for samba-technical@lists.samba.org; Tue, 23 May 2023 02:23:49 +0000
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-253520adb30so4122335a91.1
 for <samba-technical@lists.samba.org>; Mon, 22 May 2023 19:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google; t=1684808624; x=1687400624;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nXoS4COc3uOsHLWII8yrlNklENgmiiw8Okld7fOckYw=;
 b=BRb0tYE94xEka2NKBLVGwLskJ5lwa5MKj/xpq08h5mCJCGB5Ff0RahYLlcjMUzZcB4
 s58v9+vOUUJbRLieTmDjd8IpVSoMk2gBu5WZXUd27yom2mHglMmmtuGJJsYCB8iTLWKj
 r+PDmZwYSoymN1pf2UbM+KMOCNjV3qvw88iMILp0+njjy9GobqdC5NoZ/vvvTSWjW8ah
 chs4veuhy8BNDleSkB9hfZb5Ws852qBGNVtXvYqY0fKznEDqZnY8cXc4Dq1281BjGMXl
 eNLevDLUmRgGCMEFA9BeyUbZJS0mJO9g63JnNDoNEA7M4eaeu2F23z1S5+bOSFGDJ1MY
 CwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684808624; x=1687400624;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nXoS4COc3uOsHLWII8yrlNklENgmiiw8Okld7fOckYw=;
 b=d0z0wvWfWeebK2TtGWkpLJG+UcIfFLgDhDJRGBjyL46hdJYhW1orgDImHtByLwRZ/d
 1dpH+mWsNl6HhX7cUrVsXYr15jiPTCwKojesLj4mXmVlgSk1i0wWtnr+EeuCWtqvA2tA
 JvCsI5DZ2i8RdgmjEE03oaO0L+uV+gvxF4h2k/NKG0wM+FeCzrJ4L+LAaoSolbcEmhbU
 lYZ/3rTf7wiC6fIouVfFzabjzatUQy8iYOOIIKfeP/AvK4By4Vm01P3oHRwjF41BuJ7L
 vNutMfawDMCtw7PXE/VAmBtuP1fDJN2CDW82oObK42gQ/0a8cSXHy2YM/NytkgRT3hyN
 sJtA==
X-Gm-Message-State: AC+VfDy/Y2iciR/fZ2QRnnMIxNzwUqPipNOobcSo8gooSfGoT5VX4X4V
 LrvV3T9bU22qzOLJVcs3D481LW0FYzwmKBCAh9a6VA==
X-Google-Smtp-Source: ACHHUZ7VywKeoJEBV52DtThs8m9BNjnWkIsfHBqS3ufWy3AIVn6sscsoMQM9O6w9qIMLacF5QPU6G+rxDhOu8jDdfrA=
X-Received: by 2002:a17:90a:6be2:b0:24e:e6c:794c with SMTP id
 w89-20020a17090a6be200b0024e0e6c794cmr12697912pjj.38.1684808623656; Mon, 22
 May 2023 19:23:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mv8nAncg-f=Z5u8LkH4o7kfJLJdtoksYQgiguF7efKZkQ@mail.gmail.com>
 <CAN05THRKq9XPD11rBWXyTL_OGSh4pP6mQyufeW+xc+J3wvkMmw@mail.gmail.com>
 <CAH2r5mtJfSiQXBRUwv6zcR5rhG2Q-pCvjH+n+_SZmVQo1pMeVg@mail.gmail.com>
 <ZGuWhzP98U9Niog+@jeremy-rocky-laptop>
 <CAN05THRnHcZtTMLxUSCYQXULVHiOXVYDU9TRy9K+_wBQQ1CFAw@mail.gmail.com>
In-Reply-To: <CAN05THRnHcZtTMLxUSCYQXULVHiOXVYDU9TRy9K+_wBQQ1CFAw@mail.gmail.com>
Date: Mon, 22 May 2023 21:23:32 -0500
Message-ID: <CAB5c7xqcwn6a_D=OwyKDMRgEiKEnGHeubwafVU09o34cQ2G30A@mail.gmail.com>
Subject: Re: Displaying streams as xattrs
To: ronnie sahlberg <ronniesahlberg@gmail.com>
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Cc: Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>, CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, May 22, 2023 at 8:00=E2=80=AFPM ronnie sahlberg via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Yeah, I don't think we should surface these as xattrs.
> Xattrs are already way too small for most of the usecases of ADS on
> windows (file metadata for explorer etc)
> and they are also just an atomic blob and not a proper filedescriptor.
> Since ADS is still just a file, any application that in the future
> will use ADS features should only do so via
> a proper filedescriptors, where it is possible to
> seek/read/write/truncate/...  so IMHO we shouldn't offer them an
> alternative but inferior API. Because they might mistakenly start to use =
it. :-(
>
> There are no real applications, yet, for linux that uses ADS but there
> are many that potentially could use ADS or
> become ADS aware. GUI Filebrowsers would be a nice usecase. As would
> making 'cp', 'mv', 'tar', 'rsync', ... ADS aware.
>
> So let's not do it with xattrs.
> No one needs/asks for this right now so it would be code we will have
> to maintain but has no users.
>
>
> What we should do though is think about and talk with the NTFS folks
> so that we make sure our aims and APIs will align with the plans they
> have.
> And once we have multiple filesystems supporting it (cifs.ko and ntfs)
> then we can start thinking about how to encourage external users and
> applications to use it.
> There are really nice use-cases for ADS where one can store additional
> metadata within the "file" itself.
>
> regards
> ronnie s
>
> On Tue, 23 May 2023 at 02:21, Jeremy Allison <jra@samba.org> wrote:
> >
> > On Mon, May 22, 2023 at 01:39:50AM -0500, Steve French wrote:
> > >On Sun, May 21, 2023 at 11:33=E2=80=AFPM ronnie sahlberg
> > ><ronniesahlberg@gmail.com> wrote:
> > >>
> > >> A problem  we have with xattrs today is that we use EAs and these ar=
e
> > >> case insensitive.
> > >> Even worse I think windows may also convert the names to uppercase :=
-(
> > >> And there is no way to change it in the registry :-(
> > >
> > >But for alternate data streams if we allowed them to be retrieved via =
xattrs,
> > >would case sensitivity matter?  Alternate data streams IIRC are alread=
y
> > >case preserving.   Presumably the more common case is for a Linux user
> > >to read (or backup) an existing alternate data stream (which are usual=
ly
> > >created by Windows so case sensitivity would not be relevant).
> >
> > Warning Will Robinson ! Mixing ADS and xattrs on the client side is a r=
eceipe for
> > confusion and disaster IMHO.
> >
> > They really are different things. No good will come of trying to mix
> > the two into one client namespace.
>

Solaris / Illumos had a neat feature where you could say openat(fd,
O_RDWR | O_XATTR) to open a stream on ZFS and then do normal file IO
to the stream (pread, pwrite, etc).


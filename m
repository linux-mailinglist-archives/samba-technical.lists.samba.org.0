Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F062670C2C4
	for <lists+samba-technical@lfdr.de>; Mon, 22 May 2023 17:54:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=qN9bq935BBiuabl74pAPcBnUEj1t78BLpAhwvMq7z9E=; b=QwjPhbfb/m5w05dP59CfRJEtAb
	zx6jFsjr/QR764fXTNPg8VL+rxwUfXY43KTZBk7zN3ZDy1Q4dZZB5dY0yf5GgOtrNKuXpw/SJEeU4
	j10nCq9HfCbEp80TQOKrMqgiNzwrJLUV8XhNsn0tFLilGoWskljfHgCXB1iPQ9qfobIwoufForNVI
	fy/qIlMx9izue6pv2B38tPMm25EbNEFiJkcRSurJ4UuvdpLNOBoL9MEvqdO46dpfRtHCyT8M70giQ
	mmvglxygH8yimFOdSPfvYPKKQrt66R2QAH2WP55gJmf2GLBTYhyN4PKjqxD1Taoweu+Olh2OEcP34
	wFKbiY3Q==;
Received: from ip6-localhost ([::1]:44602 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q17rC-00BNae-2X; Mon, 22 May 2023 15:53:58 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:47434) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q17r7-00BNaV-4K
 for samba-technical@lists.samba.org; Mon, 22 May 2023 15:53:55 +0000
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2af98eb6ef0so19501291fa.3
 for <samba-technical@lists.samba.org>; Mon, 22 May 2023 08:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684770832; x=1687362832;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jC9UN7C3+k05zdsVlQOUk9qh8io47U6hk/b32B03WqM=;
 b=gdikkQw26GyMfAtAEgTCtQXZP25/D4D98NjiRrFxqRmlaS3ofyb+oOgFHsbOAYGaas
 +aDkz8YDVmCWX1/KAdKPjTHkpMEP7JTB5rciymHr/tvld3j6/kb/jOUA6k5vXm2l04rY
 C8Pg35ZxA/r7su05/i3zJT1TSRXMoceTYkIGkg9cB8yxkqG5hlVaK1JqXzIG6uSexqLw
 RibOBnaJXOjHSuQcKOqKzrDZkd8JHaAcI429A3mnZTodrD31utxS3YqfA+TsUrJMJtQb
 Ydon49Z7JWK3KeoCV6bm2CGyFqKU0lMFWmI+WF4kY/IgoqTErVfnfac3QR6pMP/hIg0S
 qkuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684770832; x=1687362832;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jC9UN7C3+k05zdsVlQOUk9qh8io47U6hk/b32B03WqM=;
 b=DI6SJX+PS8HnScFAQyTSP8XspO0HNTUKrm+ZvJS/twqL5aK3AHSIGPREyzHbGtA/zI
 RxmsMYMVF+0Lw/h7gsacysiD/PYbNDEmqmliPJtiVO4UUJja7RyJl/OZUTl6pv79flHR
 nK740XZHUIRVXlMgcYRSESO+Bpr0+d6AN68y4PJo2WtYIMM0DlWvOsurdyepnS2Freq5
 NWA4CtsNIDFbR1/8bi50nTqkGofcnSR0rxN5NvCdQAHbv+2kobXewuTKF3w9JjG73Gmu
 pKskLnJnzVOdHXkdBVTHdxk492OL420exp/JNIqyeeNTrPJy1qi2g4xAuiEC4LUFrBV4
 N0/g==
X-Gm-Message-State: AC+VfDzl3gMhV3QMKP4CS+sWZHD/suFJjYuvnXBEcF8daW1Fcto+RNX4
 xIxXCkqQf7LiWeTMvgrpyFx4KxqU5svOggFbZkQ=
X-Google-Smtp-Source: ACHHUZ6YigGpokwZA3kYRVE09TRCKA1TKhJLvfD4Cz2j/7BnnZiQKJYTl8BLbrhF8afHRM9uZWx1/gj7CMM2iS+viWI=
X-Received: by 2002:a19:7003:0:b0:4e8:5576:98f4 with SMTP id
 h3-20020a197003000000b004e8557698f4mr3518164lfc.45.1684770831616; Mon, 22 May
 2023 08:53:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mv8nAncg-f=Z5u8LkH4o7kfJLJdtoksYQgiguF7efKZkQ@mail.gmail.com>
 <CAB5c7xq3dZ6yh6VXKGoJD--gg41rMgZ_u6RJYGMyzc6SE78UgA@mail.gmail.com>
In-Reply-To: <CAB5c7xq3dZ6yh6VXKGoJD--gg41rMgZ_u6RJYGMyzc6SE78UgA@mail.gmail.com>
Date: Mon, 22 May 2023 08:52:11 -0700
Message-ID: <CAH2r5mtwkisadEV0KVg_7NKUXyv7sNBgkErcwX1EW2aZ+UiCZw@mail.gmail.com>
Subject: Re: Displaying streams as xattrs
To: Andrew Walker <awalker@ixsystems.com>
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

We should be able to retrieve them already fortunately from linux just
thought xattrs might be more natural

On Mon, May 22, 2023, 08:36 Andrew Walker <awalker@ixsystems.com> wrote:

> On Sun, May 21, 2023 at 9:08=E2=80=AFPM Steve French <smfrench@gmail.com>=
 wrote:
> >
> > Looking through code today (in fs/cifs/xattr.c) I noticed an old
> > reference to returning alternate data streams as pseudo-xattrs.
> > Although it is possible to list streams via "smbinfo filestreaminfo"
> > presumably it is not common (opening streams on remote files from
> > Linux is probably not done as commonly as it should be as well).
> >
> > Any thoughts about returning alternate data streams via pseudo-xattrs?
> > Macs apparently allow this (see e.g.
> >
> https://www.jankyrobotsecurity.com/2018/07/24/accessing-alternate-data-st=
reams-from-a-mac/
> )
> >
> >
> >
> >
> >
> > --
> > Thanks,
> >
> > Steve
>
> Another issue with exposing ADS as xattr on Linux is that VFS caps max
> xattr size at 64 KiB. I've seen MacOS resource forks in the wild with
> sizes of up to 3 MiB. FCNTL sounds interesting.
>
> Andrew
>

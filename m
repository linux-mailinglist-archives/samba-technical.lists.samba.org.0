Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FCB7DBC3B
	for <lists+samba-technical@lfdr.de>; Mon, 30 Oct 2023 16:00:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Ei4SVboxDUAHFeS29uvc+mP3mIzSaR0zKoC0B2c1eC0=; b=skZTKMho2ZXqL4HER0EnKX7DzQ
	qlLoePy1pDqAKTM5DCvMs7k88lV6xrG4+ymQWi1krW0nRY5Ti8pFi3YwxprgW3FJv8HHeXmY7OsRs
	UWwEx25/Qt1bkis4MFKvFut4SrfA1XTO3XqiKXI0HUksEsU1kUkW3upjonwDKbIpAiSL0p0B7YQVM
	EwzWKYSK5jXFnmVPkFng6wH8lxVWBK01zQwZQRY5w84JZckejdMxpmxEjhOKhamFl2sCjnO0uHHfW
	Amx62nP3S5EMAXuRM8h20kBzbeq1Wt2Js78rREhwtQ4Y6BmeBQkK8vbt1olHNwhiIVPm7ivStU9f6
	xdiB0Xfg==;
Received: from ip6-localhost ([::1]:40172 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qxTji-003Z7m-D5; Mon, 30 Oct 2023 14:59:26 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:56645) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qxTja-003Z7d-F4
 for samba-technical@lists.samba.org; Mon, 30 Oct 2023 14:59:23 +0000
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-507c8316abcso6436223e87.1
 for <samba-technical@lists.samba.org>; Mon, 30 Oct 2023 07:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698677957; x=1699282757; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ei4SVboxDUAHFeS29uvc+mP3mIzSaR0zKoC0B2c1eC0=;
 b=hCvUSK+ErimGr+o1D9ubqg+mzJjb9mHuM81TuPVIiV5aK0wutVca3UwNdm/nA6lZPY
 vvG6YrEe6BWJwGhu/LztnlI1E6XlpoHxbbwCBTOU8UvQee5iw3kOOEFMJOEMYUAbI5U6
 Y0gjNRd7A4J6+k/nyItuonKgoDzL/zBSxCgNlyJkCEZIFRNXRThU4q6viYvg78yb+GU1
 cvJXn0vEAzLsqRPZGo4SMLODCjp2bs8LWbnOjMVzaDe8i1oSC/zRPRdrYnkUIfgY2oBu
 qZuAJAEP2iMrRVH2Kyb5LxpgCWWycfunfxZOffAHrEGGiMyv8/fNjTsyu+wTrBdJ4R4J
 NaXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698677957; x=1699282757;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ei4SVboxDUAHFeS29uvc+mP3mIzSaR0zKoC0B2c1eC0=;
 b=BqNrmcXtVrIN2ZtH2raDtwuQc6zji4I+IZIF08KWF8YaePdLizs7WwBPWG5omL8ber
 KxPPiis0m4R5cKzC26DCZ1x81ks9H9wgvOT1IoG/em6d55vpUCLgZ9trxwPgW0kXKcZ6
 wsHMkxUbGavLY9fUHB/pEbrQlMCuOGVXzO82NRwsCUVxevzkR0pzJ2QibuhJeslw1wYZ
 fs5jQVnnZB6YBK84FO4ZXUX7D+e5lyP9BFOxxxOnvegRacTXgzZ7hr9asfuDS0UoW3KA
 IL1xYg0gcyUhq+3IrvIrwEMuwOYWHxCenPvjAup8tAQZ4NEX96aVs/a4bOdVqWDoyHx1
 flWg==
X-Gm-Message-State: AOJu0YxRvw9jRlk5ZmyBQ5QXxBbc+OttoMwIL+y7w2+WJn5CTIMcBavR
 2rrikaUZHvULxw9P0uWgDnPBi684smtDWGJENa0=
X-Google-Smtp-Source: AGHT+IFnHiYYLbnLtAvtWDi5NBzQUR1pU10INVUAIRK8blhtYZ9oG0ggRFL5AwXncTWFXHF+jw0MLgYhTpd2SXUhn0w=
X-Received: by 2002:a19:8c0f:0:b0:503:1783:d5a9 with SMTP id
 o15-20020a198c0f000000b005031783d5a9mr6346912lfd.3.1698677956661; Mon, 30 Oct
 2023 07:59:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mvxf3j6aXGdzh8b7cRYJ=fHvjfkv=aHPStJRYR+x8auiA@mail.gmail.com>
 <CAGypqWydCTT5M6T_0k4y1jPVZyiOtsFGBxdQfHVDSfx_v-dX7A@mail.gmail.com>
In-Reply-To: <CAGypqWydCTT5M6T_0k4y1jPVZyiOtsFGBxdQfHVDSfx_v-dX7A@mail.gmail.com>
Date: Mon, 30 Oct 2023 09:59:01 -0500
Message-ID: <CAH2r5mtYsnsW7EEdfJZ0LXPxV=D68Na0tSOHHvYf5XKTLUxqSQ@mail.gmail.com>
Subject: Re: New SMB3.1.1 command
To: Bharath SM <bharathsm.hsk@gmail.com>
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

corrected - and updated the changeset in for-next

On Mon, Oct 30, 2023 at 7:44=E2=80=AFAM Bharath SM <bharathsm.hsk@gmail.com=
> wrote:
>
> > Also another minor patch to clarify some of the unused CreateOptions fl=
ags
> >
> >    See MS-SMB2 section 2.2.13
> +/* FILE_OPEN_REMOTE_INSTANcE cpu_to_le32(0x00000400) should be zero, ign=
ored */
> INSTANcE should be corrected to INSTANCE



--=20
Thanks,

Steve


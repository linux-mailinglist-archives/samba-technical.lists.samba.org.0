Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E89D48B5EAC
	for <lists+samba-technical@lfdr.de>; Mon, 29 Apr 2024 18:14:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=UI5KsYZRbCsJ4uc2FmD4NMY/rgsJbING+RbxgVBHGxM=; b=azOT/9E0VVR4j41zwMjZfGFSaz
	lwL38+pJA06Kq2NZV7aHw4YetHuZWoflwv7wm1ji4pYVsrqd+y91yHhhJnXPkmgYoa0aeaibjZFzS
	fMjW2QB0wnFCSbWK2J2E4rFC57FqMzcCS8dr11z9A3iQBQyXR3KcbYrR48sJ3HvJNvhiZ2GOoTtPV
	GKK+ye8X3Y+ooTzUhXswMY6B1tehYnjHTAFQSEdYN+hCmzB+jl1nuC6volzSjf9YF34ytX2Axsql5
	W4Jvj2qQmFd6EbSS/fxIq4boYR12FhM3LRcocTnc1owejg9v1VaNqgHPnTf9IyrudiXgJI9OGeyeP
	qYsf3yCw==;
Received: from ip6-localhost ([::1]:33114 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s1Tdb-00610f-7w; Mon, 29 Apr 2024 16:13:55 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:52276) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s1TdX-00610Y-I2
 for samba-technical@lists.samba.org; Mon, 29 Apr 2024 16:13:53 +0000
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5176f217b7bso8037371e87.0
 for <samba-technical@lists.samba.org>; Mon, 29 Apr 2024 09:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714407230; x=1715012030; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UI5KsYZRbCsJ4uc2FmD4NMY/rgsJbING+RbxgVBHGxM=;
 b=H7Fmprm3GwnRSIyx4KS1uiCAeBcUfIzMq/FQokW3YOCnOwUDKAvIvXqzZNyfR9HOZ5
 T86w/BH7ciiamlK7xeUNMtLLDL/xkr3gjH/NcdFeD7LihwXie773caSZj9Uem67M3m+m
 OIes+ibgH9W5Q+F24IeAECWyaLnfAkL9bHTD/+1bqskEQdlAfWuJq/CSpZo5Sorzw9PG
 pd/ssms1wuVTotPAd0mM50rvN8jWtYbd5XCqnhR8VBsoHBqB2mpXxlXeQ9DT0g3aZY/J
 QHzkXQgPpFzPDNNp+6gtPceNcrCgr1DK/E7VwOuDzeaDv0isxcOIcdDqpCiNsM6URL9e
 r+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714407230; x=1715012030;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UI5KsYZRbCsJ4uc2FmD4NMY/rgsJbING+RbxgVBHGxM=;
 b=uGmFBNvlWkLAnRHMtD25C/l5rFOnO034l1td3TaAljeHYnJI3JqW8Th95dlALEBwSg
 C+3Ska8iJWl94Gdy2dJI4ysu99LCwyj8v0qc0J0k3t3cBuJUwyq5He0UsiTCWmLojcDl
 W0YBfXhUiP34FFHGpgTW0gyTOtHeWNAnMRmpNY/3U5ScyZVEUxbKeCanUXVJBNZZN3Xn
 rKaj/hOUAJmuSocyDsEGniDiK3uXH4E2BJloxQRn4i2roEtkiiCIvWJ6MMV27VpE2qf1
 L+R4Ri1wdPQcVznDTzeLgSOZ/kjR4qALeygfZIeXCmIn14HYplOF+P6izbBzLc5RucU9
 3+Qg==
X-Gm-Message-State: AOJu0Yy+klPDcK9mLJuW6K9nCKlOqxPIWinIBFLe9WxzBkkHqT0QBmlD
 FAQfSouJfxoVFDW28EvIPLiEkFfGWeDzs3qYMDbrb1lT0PQSZiyMRp0BqUdEadsDCO5Kessu76i
 UC7MZN0rEUP8FyTvPjz6e0EpBGj4=
X-Google-Smtp-Source: AGHT+IG1+udI41KNVRYsPpO+Eu5KZBS9GII0f5Ck6zaeKvJdlvQPvhGyvXfl8pJ2L8kF9XFd/xNT+B+zz20+EAUmVB4=
X-Received: by 2002:a2e:b8d2:0:b0:2d6:f5c6:e5a1 with SMTP id
 s18-20020a2eb8d2000000b002d6f5c6e5a1mr9889978ljp.12.1714407229833; Mon, 29
 Apr 2024 09:13:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5msg91ad+K+eZmCjKCJeDgyb6xcUUhmpaXeeTFjqFZUeBA@mail.gmail.com>
 <72ec968a-ac67-415f-8478-d1b9017c0326@samba.org>
In-Reply-To: <72ec968a-ac67-415f-8478-d1b9017c0326@samba.org>
Date: Mon, 29 Apr 2024 11:13:37 -0500
Message-ID: <CAH2r5muhcnf6iYaB25k+wZC50b5pNV+enrK=Ye_-9t2NCVdCJQ@mail.gmail.com>
Subject: Re: query fs info level 0x100
To: Ralph Boehme <slow@samba.org>
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
 "Volker.Lendecke@sernet.de" <Volker.Lendecke@sernet.de>,
 samba-technical <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Apr 29, 2024 at 12:31=E2=80=AFAM Ralph Boehme <slow@samba.org> wrot=
e:
>
> On 4/29/24 1:27 AM, Steve French wrote:
> > Trying some xfstests to current Samba (master branch, Samba 4.21),
> > they fail because query fs info (level 0x100) is returning
> > STATUS_INVALID_INFO_CLASS) - this works to ksmbd and I thought it used
> > to work to Samba.   I do see the SMB3.1.1 opens with the POSIX open
> > context works - but the query fs info failing causes xfstests to fail.
> >
> > Is that missing rom current mainline Samba?
>
> have you enabled SMB3 UNIX Extensions?
>
> smb3 unix extensions =3D yes

Yes - it is set to yes in the smb.conf for both the global section and
the per share section

I also see that POSIX extensions in:
1) the server returns posix negotiation context in the SMB3.1.1
negotiate protocol response
2) the server returns the level 100 (FILE_POSIX_INFO) query info responses

But the (current Samba) server fails the level 100 (level 0x64 in hex)
FS_POSIX_INFO with "STATUS_INVALID_ERROR_CLASS"
which causes all xfstests to break since they can't verify the mount
(e.g. with "stat -f").
Nothing related to this on the client has changed, and ksmbd has
always supported this so works fine there.


--=20
Thanks,

Steve


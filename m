Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D4CB8F043
	for <lists+samba-technical@lfdr.de>; Mon, 22 Sep 2025 07:26:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=dhRlSDqisSWbH6YZD9VGJpZ0To3BuCDyuQbXvwLz+gQ=; b=wPxciUtXpo7lSpmG9kT6JNdgWB
	CHrNRJtasSfiiddCjXbczKYHzNVId1+YZ8Rx7lpj6KJVu/GuHx8MC9yvoV5DpKhgJ7yHAP+zO07qD
	imvpf85eFsBb1hkg3nKqpm6Aj0A3MfxNY2AAJLht88qaXyeZwQfwYd7BpZ17F0j6d+VM6DZILRJiL
	qgIIxA8utR3d6L8EvtRX5m3R2RficWy7MuPFERXqXSM+IClWeGuWGIbZ6wIbthQ20eInxupeF0Tld
	iMxXmEaMyypTK1Rhu4AUOVol+wXHSHS1YdHrj3Vp36jC1LXbft9kZ7xXeUbawYz+adyQ36dmp332x
	dS50ahAw==;
Received: from ip6-localhost ([::1]:41468 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v0Z3J-004Vjn-3n; Mon, 22 Sep 2025 05:25:29 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:40348) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0Z3C-004Vjg-2k
 for samba-technical@lists.samba.org; Mon, 22 Sep 2025 05:25:25 +0000
Received: by mail-qk1-x734.google.com with SMTP id
 af79cd13be357-82b19440a50so128856785a.1
 for <samba-technical@lists.samba.org>; Sun, 21 Sep 2025 22:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758518720; x=1759123520; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AKDOUTk+NEpiN40eIQwRQOTq2/RH1W0/25cwShKdcE8=;
 b=C9xD3W3engE2vH4ZaRVQ2pKx1qUyMs095TaFxa8fc8puy8PLDiVlXyg2K0so9dCWL7
 6oIXJ4pLLNLiA5Mi9SNG4MYVJ4B7HivTnsSZjciny5EptYzN5VAlEjBL6XtoTg01gSuB
 GlZ/vR0OURGcvZOLfG/o8qRdZUOPFH4DbP2/aVm5rdU+4tFQuKYO4tXDghzAPjvKQhQa
 LcB1+G0pwkUm53MPH4G9KDyiWL1tVBfUXWs61Av108kPR1mIwjVu8bwdC1Q4pyfA2Hrh
 jmqnwxHIHzoVcPEu4yX8W5ryTQwI6sLXKwrzp225ranL1Rk1FW2Fv+MCK7DY2qJwsQj7
 FLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758518720; x=1759123520;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AKDOUTk+NEpiN40eIQwRQOTq2/RH1W0/25cwShKdcE8=;
 b=e++vp9hcy47s0PGs5moh7c7sQyvndGqf+YIS3Ahw3vBnVtkzRNvsExnEKB3h8HIuER
 n8KXRZ5k2CreO3SLJQaxiPp07RpJxyKOOVm1HW2sLx1NiByvCwK1tJ5n6Lmhu8kZZZo3
 FBG/i2kRFrTrbvLdnRH1Iz8WXHMDoCEpOg/PiZGymzRQfgARRGtS5Tal3PwDZnQJSa4F
 ttnOrSk4MjE/FBoWodEwfevjOOgY8d7qCIPxC2HYmm2uwts1Wx/5JrQR+7jT10arx3lE
 xsKyE7SZrbcdRRoa8uaVitBhdcaMaMrEftoLwR7+dPgzBJ3it9H1eb52fjOJE+ddAJ0B
 G5ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+xb2rK5tZXglnDXhp4/TwXyMBIoVlfDEWRLeu3kW71IMytwYhQ0q/rvRWEMIXhImd+VplMl6tUBF5KMkt6lU=@lists.samba.org
X-Gm-Message-State: AOJu0YyeKDrRQFyMXCDRdRxuiB0nLpwq0XNx2QR0Pt6LilAu/wHWbgQ7
 usGjlTGX5mrst9sCpYlsWK0xy/WS1SbtsnlYe/hJpv3+ByI/c0aPhcUO32uvnfc4/XMa+0nSzFH
 N8OQwZ/hE9dBiCQ/TRub/gYXEHilhHvo=
X-Gm-Gg: ASbGncsh1y767zjbKyWAJjfM9VroPu4mtg9969YLLIrpYIPyikGdOk6UG8XFTmAEy3E
 YrEtftvNc+w61Y8ywqJSqIBv6GpoHMhNg7xbjtWM/5Wx12uUDtFVTD8ZxdmLdM0tRpA1JVF/lfe
 pysZWpQPVZoJVa3L/oRHDig8z6vEkQ34rqeRKFluavG5WsWQXJOtC7YwEM9CoHnvS8Z19IUK2l0
 5WY3ghY/PnGZBmp0kc=
X-Google-Smtp-Source: AGHT+IFhrMBEa5PVI6TZ4R0BR5CkYzMBu4xj4Pdefzgjs/PTtAtsy/vrOHEofWQn7SLDqlmxTHOMrnkloon5mgKPxDE=
X-Received: by 2002:ac8:5d86:0:b0:4b5:e9b6:c96 with SMTP id
 d75a77b69052e-4c06f9389fcmr77962591cf.7.1758518719521; Sun, 21 Sep 2025
 22:25:19 -0700 (PDT)
MIME-Version: 1.0
References: <CADrT-m+CZf3_pzAkKXB0UVHkd1o6NJR2bN+udTf-PCEdvSS-eQ@mail.gmail.com>
 <db1fb336-7c9b-4816-acd8-e0815a460b80@tls.msk.ru>
 <1afde102d461529cb041d96e448b9d2d3f6fe836.camel@samba.org>
In-Reply-To: <1afde102d461529cb041d96e448b9d2d3f6fe836.camel@samba.org>
Date: Mon, 22 Sep 2025 10:55:08 +0530
X-Gm-Features: AS18NWAhnHh_BsIP6B1lnCxABjVrWGfcLm8NX8FGU2Fea1LJ7obX6IBFAMF2DfQ
Message-ID: <CADrT-m+wq8m42JjDt-eAZrMFqynz5yXKHk9q5ksUxiHew75Dpg@mail.gmail.com>
Subject: Re: Proposal to change smbpasswd file format to address Y2K38
 coverity issue.
To: Andrew Bartlett <abartlet@samba.org>
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
From: Vinit Agnihotri via samba-technical <samba-technical@lists.samba.org>
Reply-To: Vinit Agnihotri <vinit.agnihotri@gmail.com>
Cc: samba-technical@lists.samba.org, Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thank you Andrew and Michael for your valuable feedback/suggestion.

@Andrew:
Although this is true, I believe if we are to change this, then we better
switch to 64-bit time_t, else someone has to revisit this after 80 years ;)

@Michael:
We are representing them as fixed length hex string and it ends with '\n'
(so we are reading 8 bytes for 32-bit time_t),
I mean yes we can definitely check length and proceed accordingly, however
keeping 2 formats for the same thing seems problematic.
Also noted your point w.r.t. rewriting. Maybe we can just re-write record
for a password change event as oppose to changing every entry.

--Vinit.


On Sat, Sep 20, 2025 at 3:19=E2=80=AFAM Andrew Bartlett <abartlet@samba.org=
> wrote:

> On Fri, 2025-09-19 at 22:39 +0300, Michael Tokarev via samba-technical
> wrote:
>
> On 19.09.2025 15:02, Vinit Agnihotri via samba-technical wrote:
>
> Hello,
>
>
> Coverity Id#1509031 and 1509040, reports Y2K38_SAFETY issue for
>
> 'pass_last_set_time' in file "source3/passdb/pdb_smbpasswd.c".
>
> https://scan5.scan.coverity.com/#/project-view/64750/10100?selectedIssue=
=3D1509031
>
> https://scan5.scan.coverity.com/#/project-view/64750/10100?selectedIssue=
=3D1509040
>
>
> Although this is defined as time_t, we are storing it in file as a hex
>
> string of 8 bytes(uint32_t)as opposed to a hex string of 16 bytes
>
> (uint64_t/intmax_t)
>
> Existing entry looks like:
>
> xyz:0:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX:8846F7EAEE8FB117AD06BDD830B7586C:[=
U]:LCT-ABCDABCD
>
>
> Main crux is to ensure conversion of existing entries so that new changes
>
> won't break older file.
>
> I'd like to propose an approach to deal with this issue.
>
>
> Proposal states that on opening this password file, we check the hex stri=
ng
>
> which represents "pass_last_set_time". If this string comes out to be 8
>
> bytes, then we flag this as old format and then we read every record one =
by
>
> one and convert it into a 16 byte hex-string and write it back to file.
>
> New entry would look like:
>
> xyz:0:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX:8846F7EAEE8FB117AD06BDD830B7586C:[=
U]:LCT-ABCDABCDABCDABCD
>
>
> There's no need to worry about this at all, I think.
>
> Just change the type of field to be the correct one (like time64_t),
>
> together with the printf/scanf format specifiers, and be done with it.
>
>
> This way, as long as the timestamp is before 2038, it will fit into
>
> the existing scheme.  And on the first password change after 2038,
>
> additional hex digit will be written in there.  And everything is
>
> compatible (besides very old - at that time - versions of samba),
>
> and there's no need to rewrite anything.
>
>
> Mind you, smbpasswd can be on a read-only media, so rewriting it without
>
> someone changing their password is not a good idea.
>
>
> /mjt
>
>
> Simplest fix could be to make a safer conversion using hex_uint32() and
> forget about this for another 80 years for the deprecated format, by
> stealing the extra bit and using unsigned 32 bit time.
>
> The write out of the record is already using a 32 bit unsigned format.
>
> Andrew Bartlett
>
> --
>
> Andrew Bartlett (he/him)        https://samba.org/~abartlet/
> Samba Team Member (since 2001)  https://samba.org
>
>

--=20
One Ring to rule them all, One Ring to find them,
One Ring to bring them all and in the darkness bind them
In the Land of Mordor where the Shadows lie.

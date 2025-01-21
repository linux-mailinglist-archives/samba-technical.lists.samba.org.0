Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2ACA1771C
	for <lists+samba-technical@lfdr.de>; Tue, 21 Jan 2025 06:46:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=1emtGIJjsXXT4jXkcQoW5DktvPVbnE323nc2yWXIp18=; b=GAyXeSwb62FD2cAgxDaIsXXQ7T
	5PeBOt7VHjCeYHnYr97lMq/7ilBnPQONmZnvwYoY9qAaOMgICdxqi/ggre++KGhoXIU/7s42bVtwI
	6P2w8dQx5j40AMknagpKTPpyI0BmfczPM98wly+UBRsEDySpVDXi7OK+LjxV/YnDwUDwrHPQ+DT5b
	HMlgQjVRK5QUz90+h4BfSu9aewPz8ZAo6AYwnRyeCwqbneDwJ5lUogEnfjnM4gqvFYE+vI9nT5Cf6
	TOjQV5d+s76IUQSZ91aihCQy7slc/MeynmoGvfhRd7SXQc+97XW8ku1ik7Y4YXC4FjMY8HxMsI/vN
	79I/YL+A==;
Received: from ip6-localhost ([::1]:51124 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ta74y-008ssZ-UP; Tue, 21 Jan 2025 05:45:36 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:56471) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ta74t-008ssS-Pq
 for samba-technical@lists.samba.org; Tue, 21 Jan 2025 05:45:34 +0000
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-53e3a227b82so4775534e87.0
 for <samba-technical@lists.samba.org>; Mon, 20 Jan 2025 21:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737438330; x=1738043130; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1emtGIJjsXXT4jXkcQoW5DktvPVbnE323nc2yWXIp18=;
 b=hyNyX+5ghR9bnCB0WYiqwmeTGAm8ATe0VBZi75jehc6P+E7HcwcfVM7tkZApUOe5sO
 V9zmaAeLQbRNdwPnUeAQDFGC88Ny0hvUMxEOOqZCmgHVE72EvtYtB48J6y74psDWd81l
 DSWQmS9SWI9AncBAuIIN27yqUaClrKGvDCGsd2+yvizh45CS5zCtbOjD8jg/aej9kwdr
 bcFBCoJYwy8YMkYOP1O/gHWIxd3MKAmDvxpsWov5PgsRCNTRNqFnywk/sSHvSy1Tqg4/
 uAaB0mLg01cjFnDImzNgffeiEP0sV7qd8EOAuzN/xvueWGl7of4ii7v1BMohe86cJLGT
 6dHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737438330; x=1738043130;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1emtGIJjsXXT4jXkcQoW5DktvPVbnE323nc2yWXIp18=;
 b=QucVj+qD/ba4o/14ksA0wvdfVyltBmfZqRvtN5TkqKfsFq0/o4INT8SGPnizWf/P4t
 nneya+qT6wywWQXayvlHSsC2z3NJgrcsqnoU32a/uTub22pvMhuyNt6y8i13/V5gkKhr
 5D8bbOhCACrfUQb03JasydWI8rsFGevD+hooXrJznbS/3TosWVLgfgIbVqX7T+7dCap8
 lsLdOXum2XJFMZcOSg8ZNiYVw6bswny+tjUu17RHjTPYdtOza+/XF0g2KHTHcQATEpQU
 duSo9lC33bSrttgGfV7z/GX4s6kj9KOShM06ZbKXOCxOi8/tIitYhZm/+RKFCFcgIWUR
 VW5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWx9sGBneklbY/9bRyl6XuIjnAe+a5gatzbC5EgutplZwUsGZCWX//R6J7DKZJJd1KylxYY57+9KrhLlvPaRkM=@lists.samba.org
X-Gm-Message-State: AOJu0YyyNzsiT5R8xYXLxyzjWbPL+pWX6NTsus3fImCbSqwbOIOs9ncP
 VJ4zTzJMaypj/ZUvMQdH3K+ugZKjVS+aT2mia+PlKxIIc9g3Yhuq0kUv72qktClhZCblbhgSKOw
 FmV58186U4Y/EDld2SCKo4iBMRss=
X-Gm-Gg: ASbGncsxEe9UdDW+yj7E++hpUrrozfTsrPykNnD1v3bj6HFfyK9GHwl0cxBAUf4C9Qx
 uX7ZN0aLf852ToT7T2hmBduDpWmOFD2/cCrb273y3ITcDCl5d2g4=
X-Google-Smtp-Source: AGHT+IHzjonUFdcFdFs7Rl8BrB9pAE24eGvGf8jYAqqe6SSNXkzwA+0MojiSNZZAsrSa2p4Whub77pw2XBn4po/0euw=
X-Received: by 2002:a05:6512:24d:b0:53e:39c2:f026 with SMTP id
 2adb3069b0e04-5439c229109mr4072679e87.14.1737438329959; Mon, 20 Jan 2025
 21:45:29 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5msUp2xqY062MRRXkNApwekZ_CJYL3q_J0boGFPzw4W1LQ@mail.gmail.com>
 <20250120175449.5i2a3bdd7xk2xjm3@pali>
In-Reply-To: <20250120175449.5i2a3bdd7xk2xjm3@pali>
Date: Mon, 20 Jan 2025 23:45:18 -0600
X-Gm-Features: AbW1kvZqljgd4pIQw24dylfsEMyMfhxrmJaTSUiETe2mIw0Wanm6vQ9uOQERsdM
Message-ID: <CAH2r5mtA4Xr-tkNgjLpGqbOn60Rms2=52AfrLG-F6RwqVJfbsg@mail.gmail.com>
Subject: Re: [PATCH] cifs: Fix printing Status code into dmesg
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
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

On Mon, Jan 20, 2025 at 11:55=E2=80=AFAM Pali Roh=C3=A1r <pali@kernel.org> =
wrote:
>
> Just to note that I have sent this patch in series with "cifs: Add
> missing NT_STATUS_* codes from nterr.h to nterr.c" patch which is adding
> also NT_STATUS_STOPPED_ON_SYMLINK (mentioned in commit message):
>
> https://lore.kernel.org/linux-cifs/20241227173709.22892-1-pali@kernel.org=
/t/#u

Both of these are in for-next

> On Sunday 19 January 2025 19:48:39 Steve French wrote:
> > Any thoughts on the attached patch (which is tentatively in
> > cifs-2.6.git for-next)?
> >
> > NT Status code is 32-bit number, so for comparing two NT Status codes i=
s
> > needed to check all 32 bits, and not just low 24 bits.
> >
> > Before this change kernel printed message:
> > "Status code returned 0x8000002d NT_STATUS_NOT_COMMITTED"
> >
> > It was incorrect as because NT_STATUS_NOT_COMMITTED is defined as
> > 0xC000002d and 0x8000002d has defined name NT_STATUS_STOPPED_ON_SYMLINK=
.
> >
> > With this change kernel prints message:
> > "Status code returned 0x8000002d NT_STATUS_STOPPED_ON_SYMLINK"
> >
> > Signed-off-by: Pali Roh=C3=A1r <pali@kernel.org>
> >
> >
> > --
> > Thanks,
> >
> > Steve



--=20
Thanks,

Steve


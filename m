Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 10522A1A7F8
	for <lists+samba-technical@lfdr.de>; Thu, 23 Jan 2025 17:39:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=1nhrsmA6C5aw+JFWKzwP0lJtMptkew+qKX8lCD94xKU=; b=sb0gGcAJXiF2ZiJfkgjbW9EXP8
	QutXyqdAWbxZGj3RU3A6rZJXBNcEFMXwiOAzfpNpToTCAXO5+hRRpkIEn8q8swwh+rqBRWx56DqPP
	idR0dsx4No4xLI7v/EZ2hykWNAdbMMmVuU5bZ6nOm0JjkyI3PPPAxHb+qlLIBnMQde8LfDTApPAgn
	eOTTryy9DbkZD0hasV8pYSODmyTqM9QzBke5O70nCQ4XX4f85+UO2OZUS5WqRaOAiIjTB/3lN9SAX
	u1kRkTjoG/ZWt6H92y/JnvksRj0Gkc6X9YuzpjTaYvGL7WmOXUOb1QT9FZp1mqROE5kaGGRZsUBr5
	9RfaSjMg==;
Received: from ip6-localhost ([::1]:31062 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tb0Dp-009M6G-8v; Thu, 23 Jan 2025 16:38:25 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:43473) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tb0Dk-009M69-Kc
 for samba-technical@lists.samba.org; Thu, 23 Jan 2025 16:38:22 +0000
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aaf6b1a5f2bso457674266b.1
 for <samba-technical@lists.samba.org>; Thu, 23 Jan 2025 08:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737650299; x=1738255099; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=h2xILTVAL1/hlXLHEyHnCI7r9g9q1k/Owo9hzgtvfSE=;
 b=XBV/Z8BmAwLSnBMOkSDyvqxsCvTDrNOn0uZqgvMcs4CA6uck3S7/wr7ZRgaCjRw71A
 xGng921lHgklY001Gh1z7zHk7xonR1OyuBh44GLfkG3gCabWYjIYbBdwoNeJclVWq6a+
 u6QT3d1U1AkPQ1emDGtFRia+Gi0Yvu2fRL9uL9Ql0GQzUUceRdf/RuoXBTg12bdXU4Eg
 vj9z5idWKEK8XDTWCsKPPD1rGNAojHLaJR0DIUIFd1BpVlryJT3tSzFXvlGFvqjDVLl4
 JI6Amjh6iBSuT+cgFZ9WWKUHyu+cgL6LXg4L1uYxBT2ZZ8ljNAli6mQdS6yH1HfvrChw
 utkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737650299; x=1738255099;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h2xILTVAL1/hlXLHEyHnCI7r9g9q1k/Owo9hzgtvfSE=;
 b=DF6AZNI/vLGasd1voI/iOrRJQe+A+gapSFqcRgQq+mJPoxaV5aSa30q5Lr8dUb0pis
 H84GJkWqXCPqgpiYbUabTWn5LwLtViVACQ1S/27DXnw5mXIkx+9CxtK2clS+34Kfxs7b
 Svj8s1urmg/5/CFHvVPUftGRi0HeRjjNfH6WstVk+NOnbrPk/n6A/vzK3YAkumk44zqU
 78MRfW1Bt2+xnxGl3vlfHjDIeA5jWGITlxP91m/hTNhNiYpfPwLoIuFyDbDgV0Tzg0+Z
 g05jyuNJDdoufqpdHI9bvXp/S0ZpjNgqagdDebGOunlZsklqntTmP6Pp4wQBv7sqQ3vz
 kSPA==
X-Gm-Message-State: AOJu0Yz/uh4VdKNcZ/W3nYr+SGN/cXj+skKMjDwuD1vLPmolYNyq3rvs
 BSXtNSRZWYWEkm5XgQkUq+22nKgOtsm9B6E8jO6Az8wYz1D9Mugk2aNyiQPPyo2pH0XSRV8CFJk
 hSipw5QMynhl1FrMLtFF8lxbCKnVZSA==
X-Gm-Gg: ASbGnctLGO5BnMaIv5NUJj1WgYnxrioYfRIJpOyPQ8bVMlOWguaycvSJ56so84D6VaC
 BO6k9nrxDwM9V51106DWGRyBmMqfcyzFecayu4x1oKMgpXKczJbpIygUy+CJB0yBgGzNsJNBpIT
 nCle2HBHffl9frlgbDrHo=
X-Google-Smtp-Source: AGHT+IFvCHlZjd8lYEX+SdkQ1ewLh3SjSCPJN2xw5k42tf7qxh4ktB/wZ4B8BEYPADZh7o9vnpy2C58x/cAjGGlKvUI=
X-Received: by 2002:a17:907:97d1:b0:aa6:7c8e:808c with SMTP id
 a640c23a62f3a-ab6629cce12mr308555866b.17.1737650298583; Thu, 23 Jan 2025
 08:38:18 -0800 (PST)
MIME-Version: 1.0
References: <CAOGdD2rEGmhH4rJRsgQbgU7Wu=kg3_poTLUUr7MMjuJkAHM8eg@mail.gmail.com>
 <db1bddd1-4a9d-4f0c-af3d-5f43332be5b0@tls.msk.ru>
In-Reply-To: <db1bddd1-4a9d-4f0c-af3d-5f43332be5b0@tls.msk.ru>
Date: Thu, 23 Jan 2025 08:38:07 -0800
X-Gm-Features: AWEUYZnFPi8Bda_E7pXNab1_furxq6nLiIxzDFEmIGRt8n-MyifuU_C0_mzOeiE
Message-ID: <CAOGdD2pZ+vPOWQ2Z3TH0R6UFB6anrrsYvQZuVkMG8Ss7v9SxKA@mail.gmail.com>
Subject: Re: PANIC Bad talloc magic value - unknown value during disconnect.
To: mjt@tls.msk.ru
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
From: Yogesh Kulkarni via samba-technical <samba-technical@lists.samba.org>
Reply-To: Yogesh Kulkarni <yoknfs@gmail.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thanks Mjt.
Unfortunately, upgrading to the latest samba is not an easy option for us.
Whenever I do get the RCA / fix I am more than happy to help you update
4.13.

Regards,
Yogesh

On Thu, Jan 23, 2025 at 12:19=E2=80=AFAM Michael Tokarev <mjt@tls.msk.ru> w=
rote:

> 23.01.2025 10:22, Yogesh Kulkarni via samba-technical wrote:
> > Hi, I am looking for help in getting RCA on this issue.
> >
> > A Panic with bad talloc magic value is seen during disconnect.
> >
> > Samba version : 4.13.13 ( Debian 11 - 4.13.13+dfsg-1~deb11u5 )
>
> Hi!
>
> You collected an excellent bug report with good data.
>
> However, version 4.13 of samba is completely end-of-line from the
> Samba Project point of view.  And on debian, we mostly rely on the
> upstream support for all this stuff.
>
> I'd suggest you to upgrade to a current version of samba, which is
> available in bookworm-backports.
>
> Note: I'm not a member of the samba project.  Maybe it will be possible
> to easily identify a change which is required to fix this particular
> issue in 4.13, - in this case I'll be glad to update 4.13 in debian.
> I keep samba current in backports.
>
> Thanks,
>
> /mjt
>

Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE903733BB
	for <lists+samba-technical@lfdr.de>; Wed,  5 May 2021 04:20:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=EXBeo2pF9hLZO77Ferk309SqLDTEklFVDz+rwWAh33g=; b=gKIxacFnsfGmLTKK/sKfiWYkJq
	1ECBwyFXKdFjCncC9HlHWpMkSKbJbt10UF7U3KdrhCIic2NbpHiGI5gwqQ88oLktaIQOSxfkqAkx9
	Ehs0rGrMG/iMDkIz/CGgJTqxekTUp8Pbj8LRJnOFGyaj/P/IqKuePdhf6SbJH6RxjXjLxYshFsGVK
	VnHxTZjU2uMaPKDF+cOpZhzSUkaAn2xfV46WX2dqV1wpKVLyct9BY+dU1/VIlgwh80qIzAnEB8MrC
	Xzct90k05z62dw6y44Gg18jYuOeJtmRtnOry0+2fbe10uSrFuMqMJW1TpRZaynOFSiLEPvCzcRP2c
	5mC2mQ3Q==;
Received: from ip6-localhost ([::1]:19952 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1le78H-00FU3G-JG; Wed, 05 May 2021 02:19:25 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:36388) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1le78C-00FU37-DD
 for samba-technical@lists.samba.org; Wed, 05 May 2021 02:19:22 +0000
Received: by mail-ed1-x530.google.com with SMTP id u13so104625edd.3
 for <samba-technical@lists.samba.org>; Tue, 04 May 2021 19:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EXBeo2pF9hLZO77Ferk309SqLDTEklFVDz+rwWAh33g=;
 b=YphN7sAWyHOEyu4uNlcWF6fi8zwibuP3UJvNIHI8QtsGskYpbfxIB/z+doDarYGoPx
 yHMSedUvr/f1w0+4U7E8CrJ0lJVMI+n8ETJY4RoyOgIdsvZ2NxGKFrh2E3JemzAC3ZqK
 +CUvgalO23TnV3QgxzOPLM3ILFwTePYZREvMNxQ7pw4CfilwUG8CC98E+EsxyJNU1Ja5
 P873K4EzviYsx0hqbDLoKfyYtodLjDeHqhZvUoZb4JkGcyLxqbCVse+JOZ7pihyE+sI3
 K1Fn/4elAHjLv3PZI/vuqWLYURjVr/aHRHCVDYY84FcOgaoRxut0LuQ2+XDggQA0SG/5
 5O6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EXBeo2pF9hLZO77Ferk309SqLDTEklFVDz+rwWAh33g=;
 b=dQqJ22e4xYBmb5vHQ3gYmfMjZJbTTzn8QHQeyYpp49SYT4jDoJZcSYSyQLGvjC/SXO
 jBd5f+hPHkNV1dHF7yovtxMQo1yRwMmuoUyT7+HmyCypvh+1ohquLrPJkZ3xwB1kmsvC
 yPG5NB7mf0fADWaiam0GGBrTpOXiP03Kn/XYuiA81pRcZP3e0mze4WIoAO7zw3ulxsKg
 TBkIP0WYxTEXtWsKvuYAil/dXTgi+CBgvFpYg6LlUuSop0Dl14JnnHaWNJ+Zgnq0+LRT
 aMTEb3F7VtxkYQxsfJ86Yzf9AQBtH4hTbmYijZ0GB8XkJotLhJcaowGW9gjiT6TmbLcn
 cm/g==
X-Gm-Message-State: AOAM531A4o04/aT5+xNx2nMLX8FFwi6+gPfBJEnmlV24rXV98ud08HbA
 TYHjGXocLhLqgEnLGSrHoXK7eu+UPf6uQJZIioU=
X-Google-Smtp-Source: ABdhPJwHNf/b/EGPIrkm0RF06680mGTBHrJnuRaZSUFuFBpAyxW+3DO0c6CqESc+v2ut1ucVIv9SkmpnHx7XvTfrAH0=
X-Received: by 2002:aa7:c7c5:: with SMTP id o5mr29260241eds.31.1620181158570; 
 Tue, 04 May 2021 19:19:18 -0700 (PDT)
MIME-Version: 1.0
References: <aaf1bedfbba1dde583281c86eaff5f73d8008318.camel@samba.org>
 <CAC6SzHKr+x2-1EZq_zXQDsrPpRaqwKmBLrsv6nMobSY2aa6kQA@mail.gmail.com>
 <975bee8d29597024b638826961aba1c1fd5a3500.camel@samba.org>
In-Reply-To: <975bee8d29597024b638826961aba1c1fd5a3500.camel@samba.org>
Date: Wed, 5 May 2021 10:19:08 +0800
Message-ID: <CAC6SzHJ9Khf3FfjazAiKmNEnLxbQcNogOAcGoXVnwkvjjHN3wQ@mail.gmail.com>
Subject: Re: domain\username requirements and 'map untrusted to domain'
To: Andrew Bartlett <abartlet@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: d tbsky via samba-technical <samba-technical@lists.samba.org>
Reply-To: d tbsky <tbskyd@gmail.com>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Andrew Bartlett <abartlet@samba.org>
> I don't think you understand the purpose of introducing a new
> developer, but regardless I would note that you are welcome to try the
> suggested change on the bug and report your success or otherwise there.

  Indeed I don't understand. hope I didn't offend anyone for replying
the message.

> The primary blocker is the cryptographic behaviour of NTLMv2, which
> means we can't change the domain on the domain member server, because
> the domain is part of the password hash calculation.

  thanks for the explanation. samba's behavior is more
solid/consistent without these old designs/features.
although it feels good when samba can do something which normal
Micorsoft would not do.


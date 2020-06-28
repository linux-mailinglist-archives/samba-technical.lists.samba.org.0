Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 685C720C961
	for <lists+samba-technical@lfdr.de>; Sun, 28 Jun 2020 19:48:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=R1uMnQr4BrOzbuylmh9e63QhJQs1GFnnmkkHGB+v91M=; b=X79rwPcsF4+36scufgWpYNdyXm
	yJhHW946nx3jX7tW9cetOMrBEKaFo/1x5jXbauxkXpWvNUvRLMoR5yjVeueky2zkkcGSaKpikS6h1
	PK/F5jkXHQmYVi6uoKwIMoySpJhXyi88cr8RJj/FPH5mXsCfmRSJTBlTqYxKff2cai5RQpAHUojhy
	UH/eWf3+X9/NM3RBqRTMiP+GHTWkdNB2U5N3q7CMm/1hmMLh+5r5P/R0QxG8zn8AhAn4BWq5wzWC6
	1UqMzU0N/m9rJs/MgCYDcUlwtaDMvY+cxHQui0cp7NrI52fZ1dhohTCJiIYTvDkei2jJxxLz5q35a
	WHi9ps9g==;
Received: from localhost ([::1]:40032 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jpbOs-002UuL-3s; Sun, 28 Jun 2020 17:47:30 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:37369) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jpbOk-002UuC-Md
 for samba-technical@lists.samba.org; Sun, 28 Jun 2020 17:47:25 +0000
Received: by mail-ej1-x636.google.com with SMTP id mb16so14361172ejb.4
 for <samba-technical@lists.samba.org>; Sun, 28 Jun 2020 10:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=plkPnB7Q+UMcEF/BnkYAzmRUwBykDHfg6brtELh3UQo=;
 b=V9tuN/c9P2NrXuZ5mRB7bxZlGzmnVFk3RaZbmcTB9UwcGTHm/rdLyFBnmM8CyJ3Yi5
 +817jlRKCMS4rG+RDvG+t7WPhvqDMpzcFfS8eyNgCaMvGCjf9petnT1LlxoGrqLO4T2B
 tQr55TS+31TCQv+xD0dO1Zl0YkD8yARbpqsOeZ9dsmLOSnanHXf++BqhbOGLsQ5tg/0y
 SdTJh234clEgp+aEZn+UJ+PQ+2IkfDQB5ym24pgJZKjJOrF6Rm0HejfgYjGkifkfGj7m
 Co57Gl+4K36LfWHSTfGTXDd3L4+OY0CtfdG0JrhRo87/pX5lFNmK2WXvOKOPWD/z5gej
 MwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=plkPnB7Q+UMcEF/BnkYAzmRUwBykDHfg6brtELh3UQo=;
 b=k8kfofTL60KNdvEYw0blRrzh2OmwbbA3uTEKUOVWr2NiCwbBaTxcFM0ARd+qSeP+PT
 rRAjrqAv9xFT63VoAeJTza8+lb4jNl8x/rNiyu0iPQjWzui5jGT53ahEcwQ6Go4snGFW
 jYx1M2IHqKqfMk5QcpoktrKXJARR7YByn2PMo2BEq3EXNwUaya3H8PJzXO2Mvd9QeEkD
 09Hf/j/Wyfqq+mY35GKHUt1iXfmJVzChhU0487V1c/gszHtS8HRmq1O3JYEPEgDbQwqd
 JIRJnQmbm/IhKzc+HoadSrtkj2HSFKucAqrkRJ8i++BMUqaV19BetnN+KlQxq9Qtvhug
 7BGg==
X-Gm-Message-State: AOAM531usX/okGe35E8vRufX+3ooaBmVCQ+rZ5JClOhiGKnrzW4vQNDm
 kdkOCImGV8UEA3slwZrpHf0YXB+6g+rvMFv2zwcj2mZoP84=
X-Google-Smtp-Source: ABdhPJwhKP0KDqaSqmiYdm92DdODPChUY6vjrcQza+Oe8qYoZxYgnX7fhvUjU0pRo8lwkVnoBdt5Il/gZo3ITf3Htdg=
X-Received: by 2002:a17:906:270d:: with SMTP id
 z13mr4177773ejc.281.1593366441866; 
 Sun, 28 Jun 2020 10:47:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAH72RCXajQj9ZgOuLphOmY8MseOZuXdUCTtNTKWWKg=XGRXAsA@mail.gmail.com>
 <20200628165252.GA25598@pinega.vda.li>
In-Reply-To: <20200628165252.GA25598@pinega.vda.li>
Date: Sun, 28 Jun 2020 20:41:58 +0300
Message-ID: <CAH72RCX8ttcU+bp6iU8CpVKNkjdnrdBdYPZ0SofEeoRXbAPFAA@mail.gmail.com>
Subject: Re: GSoC Week 4 Progress
To: Alexander Bokovoy <ab@samba.org>
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
From: hezekiah maina via samba-technical <samba-technical@lists.samba.org>
Reply-To: hezekiah maina <hezekiahmaina3@gmail.com>
Cc: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>,
 "abartlet@samba.org" <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I hadn't seen the issue. Thank you for pointing that out.
Let me try out what Martin recommended and will let you know how it goes.

Are automated package builds the same as Cockpituous Release Automation?

On Sun, Jun 28, 2020 at 7:52 PM Alexander Bokovoy <ab@samba.org> wrote:

> On su, 28 kes=C3=A4 2020, hezekiah maina wrote:
> > During the week I worked on the following:
> >    Forest Management
> >    DNS Management
> >    Group Management
> > Repo: https://gitlab.com/HezekiahM/samba-ad-dc/-/tree/develop
>
>
> Thanks, Hezekiah.
>
> Please note an issue filed by Cockpit maintainers:
> https://gitlab.com/HezekiahM/samba-ad-dc/-/issues/1
>
> Do you have any problems, questions?
>
> I think we should start to provide automated package builds so that
> people could try the package. Let's look at it next week.
>
> --
> / Alexander Bokovoy
>

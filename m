Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1172FD863
	for <lists+samba-technical@lfdr.de>; Wed, 20 Jan 2021 19:35:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=FN5VjPHEzG7utDU9+KePxp2TFFbVrdWMliKxVEmc0QY=; b=jX4+8611fmtVPBf2e237n3tr75
	G4i4kiynUqHGFPBEGM/tsitrw23UMbCEqW8KdQfZ+UX+AW8Y0Z/QYKUOeLoM7UgRYVPw8QpjFy5b8
	9dqSH632QcxlV15RI8KuX9glNpaz2kdHz5Olwprl/VDWE54JpsYbEcuUyKtsFoHWpMe2MP8MAMZTm
	263ZaFsJ2hPZNIoIqdIha7fGlIfj0iemWsuKoTCyfO7x7+v7fvM1sa8B02HBhAgPSvkn7QEb8WJSJ
	YaQ+PnaaUQkFSgx3RhQoKT9Go3bpILRUqlsF1AilKNxbvTWQo2769HOvrANCt5wlg7hXsQqp6/FvH
	Itc1Sh6g==;
Received: from ip6-localhost ([::1]:21210 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l2IJw-006Nlr-50; Wed, 20 Jan 2021 18:35:08 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:37000) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l2IJj-006Nlh-6z
 for samba-technical@lists.samba.org; Wed, 20 Jan 2021 18:35:04 +0000
Received: by mail-ej1-x629.google.com with SMTP id b5so18489590ejv.4
 for <samba-technical@lists.samba.org>; Wed, 20 Jan 2021 10:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b8aVs9bbOVlfPcm8XwrM3ROJOHGS4M4L3VX3h12SC30=;
 b=ZXQUjNeEJC0VY86rTGG3KWR5c7HzRDoGjyEzrka2BKRxAe2QDC14qV9/q+dqguDIPw
 VMzlcSe++NfrzQUycfwvo8Gx8FIXvHTh3BZzvEBJY8MElWD8TWH4k2Cu7iO/rwbyZCWN
 +wUhb/IUa7HpB7fY5+xlSodwy25THShwnZygS+jcZ4RUDC4yjQToxhiYo4/CzCZTClLN
 cQuYe0FODxWYhdfCSosVbpD6n+pHhsjCCfSDBYd26ni3bHvFgBpbO6iL+cj4TaUJp3zk
 zAJomEwyXA4KdZHV5YaL4Djhk9v0iQPxpJLQlQLDOUnuDfZrPrssAogJde+ICombaQp/
 p9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b8aVs9bbOVlfPcm8XwrM3ROJOHGS4M4L3VX3h12SC30=;
 b=qdET4qbZFO+5RTyNUHQgn9uMLdo5loBGyfEFvgcyOhoe7+KhGFvrKvh/C2syc5llE7
 pYhZNcP29/nbyy6EpZ/KR9Q2isP5Q9jAByTCbQ6s/OybhPGVma6OqlmOW7dsRCzoeRQI
 uGbfTRMEQJU9Qet/Z1RnzUf5+lfoDGA2pK31EzikQFwolMf5l6OS4mYgb0CmYMvrWTXY
 e6mKdeiQQkPX7Q322eNv/UdO12pOC2aoBzWtoTN7mZ2YqJG6ww5ZqGyCQbFTE7qiW5SU
 VFT9cVw9kl1kxJXDvuRcseLVgJ0m2HJdKTo9jw2xPx4Kc20QMMXpa1q/xwc/Q7WSZw/e
 xVMg==
X-Gm-Message-State: AOAM53121e6om4rJfnD//P1CQtNuZbwly5UyfcGGm7O4w2VLYTlGJn+b
 i68FMsN6juj5U5eM4+eiIcPl9jF1PQ6pJJYzY9dKt3+7JqM=
X-Google-Smtp-Source: ABdhPJy8XhSzaywtlEt21oiFAjAoGBtypFg9MH2D3hlGlnpV0Lc6K30kwWdrxhYOnxJiSDkNTOYD1r2xCaZR9xriTe0=
X-Received: by 2002:a17:906:144e:: with SMTP id
 q14mr6827236ejc.150.1611167690674; 
 Wed, 20 Jan 2021 10:34:50 -0800 (PST)
MIME-Version: 1.0
References: <CAGha7mH29snpcpmK14800yWynZVgJDEVTvQBTi31u5-9HBP3JA@mail.gmail.com>
 <CAGha7mEdy-B29PMUzkxtiznNZJvwdo21fiwnh2kq7hf7tYKBAg@mail.gmail.com>
 <20210120182055.GD29063@jeremy-acer>
In-Reply-To: <20210120182055.GD29063@jeremy-acer>
Date: Wed, 20 Jan 2021 13:34:39 -0500
Message-ID: <CAB5c7xpvSsM5oaPtQpJ-D92AFV6oHf-h37WAAZedsWckTtGRKg@mail.gmail.com>
Subject: Re: Fwd: Help Needed: Samba share slow to query not existing files
To: Jeremy Allison <jra@samba.org>
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Cc: samba-technical <samba-technical@lists.samba.org>,
 =?UTF-8?Q?J=C3=B4natas_Hudler?= <jonatashudler@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Jan 20, 2021 at 1:21 PM Jeremy Allison via samba-technical <
samba-technical@lists.samba.org> wrote:

> On Wed, Jan 20, 2021 at 02:37:45PM -0300, J=C3=B4natas Hudler via
> samba-technical wrote:
> >Hello everyone,
> >
> >*(First mail in this mailing list, so take it easy if I'm infringing any
> >good manners here)*
> >
> >In a samba share we have a directory with lots of files - binaries and
> >resources to run our ERP application (around 20K entries).
> >
> >The application is taking too long to load. The found reason is that the
> >application tries to load several files in a trial/error fashion, lookin=
g
> >for extensions in a particular order (e.g: file.dll, file.lbr, file.gnt,
> >file.int). Many of these files are not required and doesn't even exist.
> >
> >Every "not found" hit take ~0.2 seconds. And there are lots of these
> events.
> >
> >The thing is that apparently samba is not caching this result. My guess =
is
> >that every new not existing file open request causes a full directory's
> >entries lookup.
> >
> >If I run this code (in a Windows Command Prompt) in this samba share, it
> >takes considerable time, whereas in a native Windows share it is
> >instantaneous.
> >
> >  for /L %i in (1,1,50) do @dir \\server\share\not_existing.txt >nul
> >
> >Anything that can be done?
>
> You are running into the classic "large directory performance"
> issue, caused by Samba having to run on top of a POSIX case-sensitive
> filesystem.
>
> Here's the brute force fix:
>
>
> https://wiki.samba.org/index.php/Performance_Tuning#Directories_with_a_La=
rge_Number_of_Files
>
> NOTE!!! from the text:
>
> "All files on the share must be converted to lowercase when using the
> example.
> Files using uppercase or both uppercase and lowercase are no longer liste=
d
> on the share."
>
> Or switch to a filesystem the supports case insensitive
> lookups (I think xfs or zfs can do this).'
>

One quick note about the zfs side of this. "casesensitivity" is an
immutable dataset property, and so it _must_ be set when the zfs dataset is
first created.

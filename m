Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C7F8AB515
	for <lists+samba-technical@lfdr.de>; Fri, 19 Apr 2024 20:30:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=UKvA2hIl/lZ9LpPbX9KEFtwsYuABWxG6VOiLjWeGDEo=; b=m8CKiS3xicmkka+sGSCaxHzLlO
	DeN+DvRyIJAVBMuP/F7Cfg0m1xc/psw3ryhGP8oX+ba7QxIfqNsu08Nyuli2U7RgpIlZCD6g2nOM+
	H7n+fUTyFryO5vbbQYop2eWajQS6XFJUnw7dVQGq5KpMBLIcQgGJRXE9b6TT+gRYewY2kJwiq48Vn
	uimcl0AmAzGq1WuUyrMfB0jvcKCfXK8sRdnUIeHNeRzBsAXVyglmuDMtTDnib5+kTpw3R5Uim+VZY
	+eDBF6pqNJodZxGhCzofdL2Y3/MQbMID2HMfvqJ2pvsz+F+gS9uikfh6OumcZ/YgcmRM6uerL88sw
	uF8vElmg==;
Received: from ip6-localhost ([::1]:43052 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rxszm-005DhK-4m; Fri, 19 Apr 2024 18:29:58 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:59514) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rxszg-005DhC-BC
 for samba-technical@lists.samba.org; Fri, 19 Apr 2024 18:29:55 +0000
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-6ecee1f325bso2193571b3a.2
 for <samba-technical@lists.samba.org>; Fri, 19 Apr 2024 11:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713551390; x=1714156190; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=D6TSsr3b1eklCuU1UzWVwP69F6MjtQ94xzCS4GSy5hw=;
 b=cc4MhdX68nZ6IOBGmJZd3Jz0a8HSE6PFGx5XMf7wYoV/23i62o7jfP+mZ9Iit4TuH+
 vOABS/n+70TPz79bXDj7G6U3t/bttdwnIqQbYkCY6hIHtAQWAeKN/YomfoU+Jl29QJQb
 U75bRWRLr2HMbp0n7OQF223NeB8uF0yagqkdN9upSMLFXXCSzYbZidP+7ukbe7A1akxt
 lb3ensk1oSiQfWidtZ8D5Ok3/CzKgTU7xAwQYsPTUhL9B+Y6afyT/25IdhOyw/GKW9kj
 KxHetGmv9KBZdCmDZ2uzewwOnsW3Vw/0Mj/ptUw8u8BnFva5QqFTuOvzH8ismQ78Q5jx
 M3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713551390; x=1714156190;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D6TSsr3b1eklCuU1UzWVwP69F6MjtQ94xzCS4GSy5hw=;
 b=Y2nUQslgkfaqhaHDr/oiBLlBDj0uOmSoDp0IsY/dz0Chu/Jc6epNRCOXZO+6zn8Mhp
 FceRQ/82AXN+jyjspf2L+diq7aVwPl3j6t/0wuRNDdXpIIBq1o4uOGO15wzBLncNeieZ
 06QGbX5eeQI1is8mQ6NM4uuGlTvQ8g870UhvDceEU99nSywtEdsH+IzqyLQ3oWt2hwLc
 V399u89EVoKzZKoxnHxcwAoXls2n5tN4YnwMNzcB7yg4K/ZVvYuqfi9r2s7wGpL7iPHN
 ZbhaDal/YmQkaTf9t2nYUyBpYzR6yO0RomNRdTFGr0e5dmXXRIxY3qZYhLKzqK7IA/h4
 kUSg==
X-Gm-Message-State: AOJu0YxEvYOyGDeDRrj8W3XTEkhgNWFdfUkhOwmiHIrGUPl/rZIdOnqA
 YuHTPAmVEKt625Ck6vTwgFVY+/WF6wCjtaHuI8/fvLoFE5Zl2hdlrn22ldh3x2Kg+c0dOVhco+p
 7IY7AkpCeQySq5t+jYh2KDojzB01rtWdJ
X-Google-Smtp-Source: AGHT+IGxuKmaicI9PyqHx12u02tchu/RzbeHIbJLcvHnwszdcNWCi2SFATGL0KWa26de7CPqejNxKnGmjSt1AmjXi4A=
X-Received: by 2002:a05:6a21:328f:b0:1a7:5100:7559 with SMTP id
 yt15-20020a056a21328f00b001a751007559mr3989179pzb.32.1713551389582; Fri, 19
 Apr 2024 11:29:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAO9H7P_SpZ0fGDvTc_2XDLRiR1rSdy-2ztBv07h1ECmj_mnoHw@mail.gmail.com>
 <93429498-3f66-483e-bb4c-c051f5dcc2f0@samba.org>
In-Reply-To: <93429498-3f66-483e-bb4c-c051f5dcc2f0@samba.org>
Date: Fri, 19 Apr 2024 20:29:38 +0200
Message-ID: <CAO9H7P8i+BBLAwJqzR8dsTsV9o5ypMMcQcJUY2HvJLk3YWDYUA@mail.gmail.com>
Subject: Re: Doubts about Samba's unicode translation tables
To: Ralph Boehme <slow@samba.org>
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
From: Xavi Hernandez via samba-technical <samba-technical@lists.samba.org>
Reply-To: Xavi Hernandez <xhernandez@gmail.com>
Cc: Stefan Metzmacher <metze@samba.org>, gd@samba.org,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Ralph,

On Fri, Apr 19, 2024 at 7:16=E2=80=AFPM Ralph Boehme <slow@samba.org> wrote=
:

> On 4/19/24 11:04, Xavi Hernandez via samba-technical wrote:
> > The first question is why Samba uses two tables while Windows only
> requires
> > one ?
>
> cf 3ed9c903671e795964ce3da9d0080444ef3eb5e9 and
>
> https://bugzilla.samba.org/show_bug.cgi?id=3D13018


This seems to be related to the posix strcasecmp() function but, if I'm not
wrong, Samba shouldn't compare filenames based on the posix specification.

I've found some very old archived references coming from blog.msdn.com
where it seems to be described how filesystem names comparisons are made
(and it doesn't seem like any "standard" case-insensitive function), though
I'm not sure if they are still relevant:

https://archives.miloush.net/michkap/archive/2005/01/16/353873.html
https://archives.miloush.net/michkap/archive/2005/10/17/481600.html



>
> > For what purpose is the lowercase translation table in Samba used ?
> > Is the Samba's case-insensitive comparison method actually equal to
> Windows
> > ?
>
> Hopefully. :)
>
> > I've also extracted the $UpCase file from a Windows 11 machine and I've
> > found that the Samba's uppercase table is very similar but not identica=
l
> > (there are 339 different values). Is this expected ?
>
> I guess not. Can you share the differences?
>

Please, take a look at my previous email. I've attached a text file with
the differences.



> > I'm new to Samba, so I will be very grateful for any insights you might
> > give me about how the unicode tables work in Samba and any other
> important
> > details related to the case-insensitive accesses.
>
> The higher level processing is from get_real_filename_at() try the VFS
> via SMB_VFS_GET_REAL_FILENAME_AT() and if the VFS doesn't implement this
> (vfs_default returns NT_STATUS_NOT_SUPPORTED), go via
> get_real_filename_full_scan_at() which ends up calling
>
> fname_equal() -> strequal() -> strcasecmp_m() -> strcasecmp_m_handle()
> which contains the core logic.
>

More or less I already followed that path, but if that's all the story,
then I don't understand why tolower_m() is used. Apparently NTFS doesn't
use any lowercase conversion to compare file names, just the uppercase
table, and the uppercase table is different. So I'm not sure how the result
of the comparison could always be the same. Of course the differences will
only appear for very rare corner cases (or specially crafted names), but
I'm not sure if it's relevant or not.

Also, if I want to implement something similar on the CephFS side, is it
safe to use the NTFS table or should I use the Samba version, which seems a
bit more complex ?

Xavi


> -slow
>

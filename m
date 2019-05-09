Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7663218FDE
	for <lists+samba-technical@lfdr.de>; Thu,  9 May 2019 20:07:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=tuYDtg5gfP4XdqB7iR/ZYHJD8rfUeBaejgtcvjOh3Y4=; b=Bg6mHYNqn37N2DQ8rwNPMTl1nC
	gJ9ml8NEJnkKKE6GHg+OxkKjmwc+vljc4EaTmrTFoq4CZu9B3crpmyVnVXtboRrAPrYkUOB4Di4dD
	OYGMIn6sb74NtzeOHl5j6y4V5fd6Yv8VA7ouXc0k0CdE19VLObkvYLVw14+BVzh8Fvkbdk6SOf7EB
	Aj25vQiPFsW6R3VdXbOyCo1IO852aqM1xVCHz9FtF9knpZWa6VsywfUACt40Ixaw0ow+F+xhzJDzf
	3V01R56S3ySxJGlI9eVWJ49nUnuPdEJeK/NPXblge7JhIgysfvvzIWgXBu/rhVsRDaa6Utz0jzHUU
	7ZqXyBQQ==;
Received: from localhost ([::1]:50864 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hOnRj-0035pb-HJ; Thu, 09 May 2019 18:07:07 +0000
Received: from mail-lj1-f177.google.com ([209.85.208.177]:33553) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hOnRe-0035pT-Rr
 for samba-technical@lists.samba.org; Thu, 09 May 2019 18:07:05 +0000
Received: by mail-lj1-f177.google.com with SMTP id w1so259844ljw.0
 for <samba-technical@lists.samba.org>; Thu, 09 May 2019 11:07:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tuYDtg5gfP4XdqB7iR/ZYHJD8rfUeBaejgtcvjOh3Y4=;
 b=lrAgQddBXW4oM6GJlL2kMK+r0AQhyhN/q6N4izJ00WuWrNAbz786gxAMfpEFqQe3eh
 GTV+/sxVli9lKICvQukFh38TWc0ZJ+7TIEV0gNnfzX/06dXu/QlL4pnWMIuJJNOERVMh
 t4KnGh9y5nATW3NqqUT4mYWLBKd5TMgtaeSqV8kjXgirv8MvHQOxTs/s6l+5O03lkuN8
 z2nTz0loZ8zmRuUTVnUgaytz+pkiPJEWvghqeNEwmb6sat4xf69XF822iw60D4Miwa0a
 om+/x1FwS6h/tOU9JSzdaZay6hC77pEcwiJCb5ZNplVw/fNjKsyILIegXlBXFOSJjPNg
 Jlpg==
X-Gm-Message-State: APjAAAWrl2tNy4t7sijnDLdsMaK5ovqm0HRUUkj8UuY7jiHeYXRZ1D9O
 Xi9OXnIH/SIZWiUaLc4KKB/Gxi1E5vVo2iD5Sg==
X-Google-Smtp-Source: APXvYqzXUsLTeBhD6Ox8FoDDH08xE/wJuclG5oI7gUi/PD6EoCjv9pFquCog/7+xjZs7kNRYwMGZWDd+AZbvjvJliZU=
X-Received: by 2002:a2e:9a58:: with SMTP id k24mr3192541ljj.90.1557425220906; 
 Thu, 09 May 2019 11:07:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190509131420.17d98c62@samba.org> <20190509161329.GA205240@jra4>
In-Reply-To: <20190509161329.GA205240@jra4>
Date: Thu, 9 May 2019 11:06:49 -0700
Message-ID: <CAKywueS-HGZkeoisHvveDEE_DBwLw2zCVNw0mJvS8Nqc7bPmkw@mail.gmail.com>
Subject: Re: GSoC 2019: welcome Mairo Rufus
To: Jeremy Allison <jra@samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Pavel Shilovsky via samba-technical <samba-technical@lists.samba.org>
Reply-To: Pavel Shilovsky <pshilovsky@samba.org>
Cc: Samba Technical <samba-technical@lists.samba.org>,
 P Mairo <akoudanilo@gmail.com>, David Disseldorp <ddiss@samba.org>,
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

=D1=87=D1=82, 9 =D0=BC=D0=B0=D1=8F 2019 =D0=B3. =D0=B2 09:13, Jeremy Alliso=
n via samba-technical
<samba-technical@lists.samba.org>:
>
> On Thu, May 09, 2019 at 01:14:20PM +0200, David Disseldorp via samba-tech=
nical wrote:
> > Hi,
> >
> > I'm very pleased to introduce Mairo Rufus, who joins us as a 2019
> > Google Summer of Code student. Mairo is assigned the task of
> > improving the smbcmp network capture diff utility[1], and will be
> > mentored by Aur=C3=A9lien.
> > Please make him feel welcome.
> >
> > Cheers, David
> >
> > 1. https://wiki.samba.org/index.php/SoC/Ideas#Improve_smbcmp.2C_the_cap=
ture_diff_tool
>
> Welcome Mairo - Aur=C3=A9lien will be an awesome mentor ! Good luck.
>
> Jeremy.
>

Welcome!

Best regards,
Pavel Shilovsky


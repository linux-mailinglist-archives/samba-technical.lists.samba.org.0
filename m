Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7967239CB06
	for <lists+samba-technical@lfdr.de>; Sat,  5 Jun 2021 22:51:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=NeucVVYBqR4NtptCPVit6uqG78d6Me8sFT/5HJOioMM=; b=LY5v+HsZDukZ4WB5/4sLMQ9xIP
	T1SDxTLcO/aCmvsKIS+er6tuB6MtclAr/yhkTvxIoe37+gEzRF2rMvjtdFQetuyokdm/U4OAhpeFt
	09TX625TEQY211B91X4ee67Gs0ww30lg4dGOQU0xKIqcZVUxDb+v8UUy1ILE9FZT29Kkhz0BvCLWx
	AcebHaLetwPAdZiLtYb5ON2qDNh3qItBoqzIxPEMSPkf/fDRDUz0/+3A500zTl19XMADAnav1Ou+P
	Afx4QuODNrAytkWvYwlLuax2hsDSvyUeAfkPby5SQWBxVsIPmEFCZMJ+XgjdG3jfiyUqOPpsWXcfI
	qqP0Xolg==;
Received: from ip6-localhost ([::1]:24026 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lpdGb-003luV-5k; Sat, 05 Jun 2021 20:51:37 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:42854) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lpdGV-003luM-Kt
 for samba-technical@lists.samba.org; Sat, 05 Jun 2021 20:51:34 +0000
Received: by mail-lf1-x130.google.com with SMTP id a2so19447012lfc.9
 for <samba-technical@lists.samba.org>; Sat, 05 Jun 2021 13:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NeucVVYBqR4NtptCPVit6uqG78d6Me8sFT/5HJOioMM=;
 b=UfZ4Y7S5wJzmo3KdhQjAWo1UGVea5AGtbObSBCNksHi9GeZ4EqgAOCYZuHrxpi2ZJm
 2lLEwjhagfvssQnvzTqEW4Yl0o4LV1/919zs5jo1jviyRzGo1oyPqv/Bk7HJj6BmlMIw
 AR5LCiMhWuxQs1ePGaWgJ5cVfOBALYWL16whSOI/NAOvnYwC9ym2AAT5xIHGU8Yw5DIQ
 4neDdEWkWHEBjAoCz1i5Yu/jKicm5QYom+uIlaiodv0uRPnzUGkzmHBMwgPpHcX2QGvX
 gJGBaAaDK49yi2XUb8ZWNX3JMMqYXfyZQMYfOgR4w7HZcCcNR/jYsfb0DK5J3VU7WSJB
 3/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NeucVVYBqR4NtptCPVit6uqG78d6Me8sFT/5HJOioMM=;
 b=n5zOgQudI1+1v7h30QtVnwOTh6dtTsX/Dn/tb+rvFmPfQCZXatWABKVBNa1gb6y3G0
 fXLrChpoEEnUb8aKZxS0AqBw/AkALek0q5yB6tV9HJZ+nprlWKydWSxqzSv0KKHd0izr
 220iAJ8CSLj4dc31qXPcz1n7Na45sk3KSLfAPlh9vgMVa0f4Rtfjrak69m2BpXp4sqCB
 IjJyWGS5GEZhqYedgV+8yMgyQ0Ko1pozDX50JEK8vCxfqrTdWsomyNrrY55stY5eVWop
 6xhpAyeNTC3rn8EaXFF3tpAfD7pVCrDk8urg1rxCd9zTnItR/eYy1iKR1JzNDoD8kww2
 I83w==
X-Gm-Message-State: AOAM530/XaVtLI37jwUTpct+7CQDeioTjmnnNxMkREaMmm83quFRDDuv
 UXM7vIa5ERxvuiriYTgM7slClnCp1vU2s12tDFI=
X-Google-Smtp-Source: ABdhPJyaUmu4mJHf+r5EO7tRZFWoqjozfEnvSWdk9NCAhRrVk4dbn75NWh5kpQIuUY6no0ANnljhmpkNOeAmaKpllUg=
X-Received: by 2002:a05:6512:b17:: with SMTP id
 w23mr6565422lfu.133.1622926290273; 
 Sat, 05 Jun 2021 13:51:30 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYsnWUYuahxv3+vQx3UQ_CvJ5caiQwb7BXEuDGxPjmrM1w@mail.gmail.com>
In-Reply-To: <CA+G9fYsnWUYuahxv3+vQx3UQ_CvJ5caiQwb7BXEuDGxPjmrM1w@mail.gmail.com>
Date: Sat, 5 Jun 2021 15:51:19 -0500
Message-ID: <CAH2r5msKk8=6msSYpUHJftKuV9zq15ptME4MHBNacc4FXb9iUQ@mail.gmail.com>
Subject: Re: [next] fs: cifsglob.h:955:20: error: passing argument 2 of
 'test_bit' from incompatible pointer type
To: Naresh Kamboju <naresh.kamboju@linaro.org>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 samba-technical <samba-technical@lists.samba.org>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Steve French <sfrench@samba.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Probably was reported earlier and this code has been changed.  The
multichannel patches are also temporarily removed from for-next while
Shyam is doing some fixes to the series.

On Fri, Jun 4, 2021 at 4:23 AM Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> The following builds failed on Linux next-20210604 due to warnings / errors.
>
>   - arm (s3c2410_defconfig) with gcc- 8 / 9 / 10
>   - parisc (defconfig) with gcc-8 / 9 / 10
>   - powerpc (ppc6xx_defconfig) with gcc- 8 / 9 /10
>
> In file included from fs/cifs/transport.c:38:
> fs/cifs/transport.c: In function 'cifs_pick_channel':
> fs/cifs/cifsglob.h:955:20: error: passing argument 2 of 'test_bit'
> from incompatible pointer type [-Werror=incompatible-pointer-types]
>   955 |  test_bit((index), &(ses)->chans_need_reconnect)
>            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>            |
>            size_t * {aka unsigned int *}
> fs/cifs/transport.c:1065:7: note: in expansion of macro
> 'CIFS_CHAN_NEEDS_RECONNECT'
>  1065 |   if (CIFS_CHAN_NEEDS_RECONNECT(ses, index))
>       |       ^~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from arch/powerpc/include/asm/bitops.h:193,
>                  from include/linux/bitops.h:32,
>                  from include/linux/kernel.h:12,
>                  from include/linux/list.h:9,
>                  from include/linux/wait.h:7,
>                  from include/linux/wait_bit.h:8,
>                  from include/linux/fs.h:6,
>                  from fs/cifs/transport.c:23:
> include/asm-generic/bitops/non-atomic.h:104:66: note: expected 'const
> volatile long unsigned int *' but argument is of type 'size_t *' {aka
> 'unsigned int *'}
>   104 | static inline int test_bit(int nr, const volatile unsigned long *addr)
>                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
> cc1: some warnings being treated as errors
> make[3]: *** [scripts/Makefile.build:272: fs/cifs/transport.o] Error 1
> fs/cifs/sess.c: In function 'cifs_chan_set_need_reconnect':
> fs/cifs/sess.c:98:22: error: passing argument 2 of 'set_bit' from
> incompatible pointer type [-Werror=incompatible-pointer-types]
>    98 |  set_bit(chan_index, &ses->chans_need_reconnect);
>              ^~~~~~~~~~~~~~~~~~~~~~~~~~
>              |
>              size_t * {aka unsigned int *}
>
>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
>
> Full build log:
> https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/-/jobs/1317929765#L247
>
> Steps to reproduce:
> -----------------------------
>
> # TuxMake is a command line tool and Python library that provides
> # portable and repeatable Linux kernel builds across a variety of
> # architectures, toolchains, kernel configurations, and make targets.
> #
> # TuxMake supports the concept of runtimes.
> # See https://docs.tuxmake.org/runtimes/, for that to work it requires
> # that you install podman or docker on your system.
> #
> # To install tuxmake on your system globally:
> # sudo pip3 install -U tuxmake
> #
> # See https://docs.tuxmake.org/ for complete documentation.
>
> tuxmake --runtime podman --target-arch arm --toolchain gcc-8 --kconfig
> s3c2410_defconfig
>
>
> --
> Linaro LKFT
> https://lkft.linaro.org



-- 
Thanks,

Steve


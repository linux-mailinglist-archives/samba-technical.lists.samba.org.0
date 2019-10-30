Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E9CEA4BE
	for <lists+samba-technical@lfdr.de>; Wed, 30 Oct 2019 21:30:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=bDNkZ8pZLsA5cAjPir0cJzYAvJq8crFajTE7wpDm1/M=; b=XdfK6991N/Kjwb0YHz9h/AQm2Y
	uYkRtkJ/x5KfBn5f6//ydKQABCpLKbOTl6lNDPb3SP0WcKp08tTPv3VLaYKbdzxJAM+GOcAkRJf0b
	IWpryIrvlnoSWNsKo7zlWza1MRd5K7NexPQKzr3118RJ5MoHSk4V404K3H9EKCpr4y+5699m5uSKQ
	vMRqR3coG4m8+NAhuBFAUBoa/fua+8JMC3YfBjhdrbny/mvFi1gd+JO1g2wV/ExtjcDomwGINjRo/
	dwkKKDnxyUwfbR9uUhE0ugyUOhbyIioijE+DoIqtOhQJQoJafy4uPCWJIbXcuKDsUT9z6HSrr0U2g
	nr375FoQ==;
Received: from localhost ([::1]:41588 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iPubW-003oyu-57; Wed, 30 Oct 2019 20:30:06 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:33029) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iPubR-003oyn-7y
 for samba-technical@lists.samba.org; Wed, 30 Oct 2019 20:30:03 +0000
Received: by mail-io1-xd2b.google.com with SMTP id n17so4128936ioa.0
 for <samba-technical@lists.samba.org>; Wed, 30 Oct 2019 13:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bDNkZ8pZLsA5cAjPir0cJzYAvJq8crFajTE7wpDm1/M=;
 b=lw1apFooL2ofr1ejHvp/lH5DH9CjjntUqlKY9mFrwKYglGfcNTSH/E7CrhuNjFrcaA
 JbbUfsZAtUwsdXYMeUOAm01ufQd5xwPgyIGinyfOXZnVqyNeO5qB5laU1CdgWJkK71BJ
 CNb1txjL6mgrbphvKAMc2263rfK5Zq1nIBBnTR8I7FAGruvjSoNJX01+ZLuSxspbVYNA
 xZjKD0vTN5yHDPCsU1nJmajgyIjlathnWdDQrYdpCLXQoqPbA2F4fmS4hARkLCe6bYnW
 8rw5HWDGk/IkVrJY1r7prhLOElAjAw9QqHRE2WX63fMuez70QuVdoCHZ1jqmOzf0KgXx
 Vp0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bDNkZ8pZLsA5cAjPir0cJzYAvJq8crFajTE7wpDm1/M=;
 b=tv7tk+9ZWewJX8s9hfN2852711F+tTTSNQ+VeR2NXX//PPdisOenTQhamI6IY+IzK0
 zEcQbh63B4YRcq0fseNjgogmDcjz4HadiVbMaHM98c0G+Vydbc/i36rAJ8sa96wsWyqh
 B3CyJU+o4A3qoKDwaRNURf2pGrh0XB2UZgozp75qfoEtNNYa62xPFg0DnCn9GFOkPI/g
 P9GjecG1MW26IhCfiSRUhLDkKUO6uTLs9VjZTS10+d3aeJ7irrVHNE/O6fjsFgCGt5At
 cZIbNY9oWvf6D8y7kEfh6nzUflCYm22/n6bCCOaQVUVrjyf7jBOHFfUrF1XO3qMVtYn2
 a7HA==
X-Gm-Message-State: APjAAAXLVRvsWbyVSfN21TKolrcNPVG5SpkqCIIQwk5i2gjzN8wD4pdO
 PuTFKJCwn0blR5gguL87amfZo4NWpcdupvOYed9qnRanwQ0=
X-Google-Smtp-Source: APXvYqyEbt9nEFRW+8ZE61BTwo7rqQqBoXQfEqeRd0ItjKdZUE26C77f3iI8eQrT/dM/sAUEYp1nd++ceZarVEVZPK8=
X-Received: by 2002:a6b:fa12:: with SMTP id p18mr1570358ioh.272.1572467399356; 
 Wed, 30 Oct 2019 13:29:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5msEjOuWumbKQce6ucn6pM2K1CW7iyEwuzj_611E5R7C5w@mail.gmail.com>
 <20191030165526.GB32459@onega.vda.li>
In-Reply-To: <20191030165526.GB32459@onega.vda.li>
Date: Wed, 30 Oct 2019 15:29:48 -0500
Message-ID: <CAH2r5mu9qHKd3i6v5zLfRCxnuD=1bQUXeMEyibDWDxLNNo4Ndg@mail.gmail.com>
Subject: Re: Samba build error on Fedora 31 can't find 'nsl'
To: Alexander Bokovoy <ab@samba.org>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Oct 30, 2019 at 11:55 AM Alexander Bokovoy <ab@samba.org> wrote:
>
> On ke, 30 loka 2019, Steve French via samba-technical wrote:
> > Doing a clean build of Samba on Fedora 31 (master from jra's branch of
> > a few months ago) I get this error (worked on Ubuntu) not finding
> > 'nsl' but the package is installed
> >
> > ./configure --without-ad-dc --with-system-mitkrb5 ; make
> >
> > [144/144] Creating bin/default/lib/krb5_wrap/krb5samba.vscript
> > [145/147] Compiling lib/replace/cwrap.c
> > [146/147] Compiling lib/replace/replace.c
> > [147/147] Linking bin/default/lib/replace/libreplace-samba4.so
> > /usr/bin/ld: cannot find -lnsl
> > collect2: error: ld returned 1 exit status
> >
> >
> > # yum whatprovides '*nsl'
> > Last metadata expiration check: 0:46:54 ago on Wed 30 Oct 2019 10:30:46 AM CDT.
> > libnsl-2.30-5.fc31.i686 : Legacy support library for NIS
> > Repo        : fedora
> > Matched from:
> > Provide    : libnsl = 2.30-5.fc31
> >
> > Package libnsl-2.30-5.fc31.x86_64 is already installed.
>
> Please use libnsl2-devel.
>
> See https://bugzilla.samba.org/show_bug.cgi?id=13238

libnsl2-devel gets farther but looks like it has some header problems ....

[1414/4178] Compiling lib/util/access.c
In file included from ../../lib/util/access.c:26:
../../lib/replace/system/nis.h:37:10: fatal error: rpc/rpc.h: No such
file or directory
   37 | #include <rpc/rpc.h>
      |          ^~~~~~~~~~~
compilation terminated.




-- 
Thanks,

Steve


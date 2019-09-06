Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B75AB39E
	for <lists+samba-technical@lfdr.de>; Fri,  6 Sep 2019 10:01:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=6sCq+lplqSfz74GE8y7MgCI6dknVRPvIBgVf3VSckwc=; b=YgdFk7Fs1OJK5+AoN154XiAGJy
	5lMbfYYWKB2SUn1iuxtNrepsQT1H2NS19847jo26hiuwiFzf07PFiViq23+sjfGZu8jslMSzw9Kqo
	95kdO2J/wRtJxS6XXXATt3JjurJlYFavHLfINvn0Wzx9q5ge6eEifIUToi7NWuiSUmdqR2x6hzE6q
	BfBEMGIG1a5Maf+jQWiuDPvfbTQDUT7mj1Qhqn5zYi+VFaZ0r/rf2EDTSoqRtya5s/7Sv+rgzYh2a
	UELiBCc4y5SUmUWM0fzGiqjCzBlCAJQ01IyGZTuh2O0XRKXJjT/mXU93E1/M95lg6AHe0ty/cm3dC
	BZnq+44g==;
Received: from localhost ([::1]:51076 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i69B5-003u8I-J5; Fri, 06 Sep 2019 08:01:07 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231]:36644) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i69Az-003u8B-My
 for samba-technical@lists.samba.org; Fri, 06 Sep 2019 08:01:04 +0000
Received: by mail-lj1-x231.google.com with SMTP id l20so5145059ljj.3
 for <samba-technical@lists.samba.org>; Fri, 06 Sep 2019 01:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=79x34fIcB1aw5olGZIu08od9Uq4+evyEaTVmeavznVg=;
 b=TvAfy4yGlR6IJRjHU5oe8IOWbh3Zpib//7kk/4YFXmIap2NMAixlbxB5u1fKkmqIfg
 oxU4/IHhPYQIoiTE+96B0tdJYMRNjwb0GPiylrWJsLfVgezvCjXTXHnXwL/OYDNI3uyX
 BNteOHgAn1jgvYrnklHi3alIPIlz1X1YeOznOJzI8gGUw5fAW4ZZM0bNKL+Llsssmtpm
 hzUzyPMhUpw63rWSqxOgz1ciqfNqrvpbH2MRhw+0ZoLagiSCgEwtyG0JHfaJ97PvwXR1
 yhCaGdRcDQvqTcgzEy+Kr0gIEHB+LDz1lD0/kSvcE62z3EjhhjLEWGfpsi2HLfTcOCJ5
 za4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=79x34fIcB1aw5olGZIu08od9Uq4+evyEaTVmeavznVg=;
 b=I3QZgLgSJ5dD4zrCnGZwtRc43DmwYcX/xoYitgDo3H2lCvq29BtClXZeM7bzlkzYf2
 iyU6FuuumUKhaR2CnjK5nk+sGydodnrypP5o3O4DcisBu8LwtCpu0E1k1sDfom5nBZpi
 /3msGMctd94V1cgmdjfj6L8VCDsE2pGMU3ABATyo/CImwV6G06zCfvmS75cWVSg7V4eA
 V4xbiKMR22LA3x7GmQpngX/uxius93ImxQH2x8RIT5GhzAzjdWRdYGtJeiId74yJxpnm
 X+DOAcSem3KHOKUhswMdKAMi6LGcLi4eMwawnpjLtL4w8ZV9lhG1bEAMuk/nGz9x/iAv
 cZLA==
X-Gm-Message-State: APjAAAUnqrwGuR575Z1HKQqYQU7SioIvN0mDExKxwAIDgpRHUPMLgybo
 wJK8pA8EXtJB9UArJVu4fmE3mWnT5l9tdUGblhDCNA==
X-Google-Smtp-Source: APXvYqzK5FZ6ca2oUXbWGQ5tDkInnJnOZto8UVO19EamU2OrtPQ+l8NTDEXnapXVUVs0hg3D2o1P5vMgKY1YgnZa41I=
X-Received: by 2002:a2e:1415:: with SMTP id u21mr5057926ljd.22.1567756860535; 
 Fri, 06 Sep 2019 01:01:00 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 6 Sep 2019 09:00:48 +0100
Message-ID: <CAELK94eRurKj24RLm7Csd88ueJ5K+D8NhnZQ-j7Wt+dJhJLSVA@mail.gmail.com>
Subject: Insights for the future of smbcmp
To: P Mairo via samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: P Mairo via samba-technical <samba-technical@lists.samba.org>
Reply-To: P Mairo <akoudanilo@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello, I just added a new experimental feature to smbcmp GUI: the ability
to browse the summaries with a search bar, it's not merged yet but you can
try it on my branch[1].
I would also like to know which features interest you in order to implement
it.

cheers.

-- 
[1] https://github.com/RMPR/smbcmp/tree/smbcmp-gui

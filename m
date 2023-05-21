Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF3470AFB5
	for <lists+samba-technical@lfdr.de>; Sun, 21 May 2023 21:04:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=JROmKJWhJiJb6emtVJhY8hL33KzRuu8mE90DKJ8FcMg=; b=MK8eoqVO6kqgdlBscmZZ+KzwvQ
	B67yh0aDFKqoAg4MwZCJ35gZzs5O7vVaNGEM3FwOO1tw69RNrkKwCi88PEP2+Uaqz8ZdrzvYL3VrD
	8aJrlWVvvXMLDLatiM1so5I47XupmBAt5QfvL49gpejemAH3XATaqSwycbbeKAWQsHRNrAYr9ynLM
	qTT0nYndELMEf5zsr9CAvpRz5SHyj789+DwzL2UPpPIZnR2T/fQb+Q46DUFUxJbzd8tyxajGvtZ/i
	XA0AEYucw6xrypUgIoEDMp1GM+zchSyBfOZDpEycYDUF8CNPEmEPwJjptH4chu/9HVxwQXBiujqiQ
	KWLEpYDg==;
Received: from ip6-localhost ([::1]:63778 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q0oLE-00B4C6-7N; Sun, 21 May 2023 19:03:40 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:44175) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q0oL8-00B4Bx-Bo
 for samba-technical@lists.samba.org; Sun, 21 May 2023 19:03:37 +0000
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f3b9755961so1204352e87.0
 for <samba-technical@lists.samba.org>; Sun, 21 May 2023 12:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684695812; x=1687287812;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JROmKJWhJiJb6emtVJhY8hL33KzRuu8mE90DKJ8FcMg=;
 b=NQkzC5Fe22Mjxk3PfyPJtGwLiMirRt7YDTYXj2VZR+SEj2mb71uZxh8D3bAPwQ80A+
 x+YlP7qsIWDbjSUrWBsgGktPZWZpBhcfZRiJyXVUFtKm2OgT/K7RKgd5Wqadp8HrmSA+
 pYS0Gz1oEXa5XxLW4sZFcDJUKbgmLXc4VeoZwsG7jihJvS4Okvey3O7DXLBaEWTjE6B+
 m/FGFnswi8o027zfpFqbAZUqATZX/8yscBeRaXinEdxsmOcHJD3cvlRmDpJgpStqfM3Y
 TU7I27X2QRlHQOJwdIVswy00DCDIXFN6ITpn2RsdotC5b3APdm/q/HvH/pAVIFTJBN9K
 K6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684695812; x=1687287812;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JROmKJWhJiJb6emtVJhY8hL33KzRuu8mE90DKJ8FcMg=;
 b=cCvHLzTgM7SwjRfzqNYs9mcmH46PjB0f8CW9lQBr5kTkDE6n5UTEUObsp+4XzwqVoC
 wiUCNpIXXE5AJyM2oBW6QUCsiQ55v7BG67A09Y2UAgCDIGRuQ+ompA/Osld2mwR1xLrh
 wqd+5z3qehsR3TVpNxZl9RZCQK38/aNpvm8oIojB4m8CeoB8Ww6DkWXDxXsZdcaCqZtv
 aco82UICsQ7KdR0MSJNrkkboeiZ1JiZ2E7erKF2XVCSdchYkIT/rgcCVmR4nAHnYf2Y3
 94XOUVX1VwdUt8RhHbHsvgAKfgHjThHg9iSkK7RznB02V/QGjPRxmJ/SpHYoSIEkLg01
 xLgg==
X-Gm-Message-State: AC+VfDyPHGNGQUEJuT8oOnlWZ2iNMkzG4GUKiJceAaBzg8yBwySJCXFi
 wLhGF9e9QwPw5SSx9dyY8sCambVOFa1FQvCsnvg=
X-Google-Smtp-Source: ACHHUZ7LzhaCvPnNSJykHJdewycERVa9aEW/ZCyfUp71/cGgzTdO1ECoyOFChpkyd7mJHnoiQQ3gLFIRgX00Inp8Zss=
X-Received: by 2002:ac2:4205:0:b0:4ed:b842:3a99 with SMTP id
 y5-20020ac24205000000b004edb8423a99mr2602511lfh.59.1684695811422; Sun, 21 May
 2023 12:03:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5msxkE5cPJ-nQCAibJ+x+hO7uSLpasGm81i6DknQ8M5zWg@mail.gmail.com>
 <CAHk-=wiStOAKntvgzZ79aA=Xc0Zz7byoBxBW_As5cmn5cgkuoQ@mail.gmail.com>
In-Reply-To: <CAHk-=wiStOAKntvgzZ79aA=Xc0Zz7byoBxBW_As5cmn5cgkuoQ@mail.gmail.com>
Date: Sun, 21 May 2023 14:03:20 -0500
Message-ID: <CAH2r5muxwEMA9JpE6ijSbZEByxRmtNSiwcXMbOz+Ojo8_APJUQ@mail.gmail.com>
Subject: Re: [GIT PULL] ksmbd server fixes
To: Linus Torvalds <torvalds@linux-foundation.org>
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
 samba-technical <samba-technical@lists.samba.org>,
 Namjae Jeon <linkinjeon@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, May 21, 2023 at 1:06=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
<...>

> We talked about directory layout issues some time ago, and there's
> kind of beginnings of it, but it never happened, and the parts that
> *did* happen I'm not super-happy about. That "fs/smbfs_common/"
> subdirectory is just fairly ugly.
>
> Would you mind horribly to just bite the bullet, and rename things,
> and put it all under "smbfs". Something like
>
>     mkdir fs/smbfs
>     git mv fs/cifs fs/smbfs/client
>     git mv fs/ksmbd fs/smbfs/server
>     git mv fs/smbfs_common fs/smbfs/common
>
> plus the required Makefile editing to just make it all build right?
>
> And if you prefer just "fs/smb" over "fs/smbfs", that sounds fine to
> me too, but I guess this all really does just the filesystem part
> (rather than all the printing and whatever other stuff that smb also
> contains).

Should be easy to move and more intuitive, although I would prefer
that we use fs/smb or fs/smb3 as the directory name instead of
fs/smbfs (since that old filesystem fs/smbfs was removed in 2.6.27.
So reusing the fs/smbfs directory name could confuse people looking
at git logs).  I am fine with doing (and related Kconfig and trivial
include path changes):

     git mv fs/cifs fs/smb/client
     git mv fs/ksmbd fs/smb/server
     git mv fs/smbfs_common fs/smb/common

This also might be a good time to take another step toward
moving people away from the old, less secure, SMB1 ("cifs")
dialect by adding a second .ko file to the client (e.g. add
"smb3.ko" in fs/smb/client) which would have support for the old
SMB1/CIFS dialect removed. We would keep cifs.ko for
compatibility purposes (cifs.ko would still have its current
config options so would have SMB1/CIFS enabled by default
but smb3.ko would only support modern, more secure dialects
and also would be smaller than cifs.ko since it would build with
CIFS_ALLOW_INSECURE_LEGACY disabled). There is a
precedent for something somewhat similar to this e.g. the NFS
client has four kernel modules in the fs/nfs directory.  On a
somewhat related note - at the Storage Developer Conference
last fall there was an interesting set of discussions around splitting
out the RDMA mapping layer ("smbdirect") by removing RDMA
related code from ksmbd.ko and cifs.ko and creating an
"smbdirect.ko" module for various RDMA use cases (not just cifs.ko
and ksmbd but perhaps also could help some user space apps,
Samba etc. in the future) - this "smbdirect.ko" (RDMA mapping
layer) could also go in fs/smb/common in the future.

I would be happy to do the move (to fs/smb) of the directories and
update the config soon (seems reasonably low risk) - let me know if you
want me to send it this week or wait till 6.5-rc
--
Thanks,

Steve


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B36CA246231
	for <lists+samba-technical@lfdr.de>; Mon, 17 Aug 2020 11:12:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=GpGg50Bcz2aNxyC3wRVZByQEAHC3gU01KNSUR7h7PN8=; b=RStomtNtZmst2w43Fzru8uuSmh
	UnOS5xo2TR1sUgIOwnG0S83UYZJWYkkgtleAMUtc1ktEFcVLJNOOKCuIAwBE0vSE3uzwtILOLy2zQ
	S5fOt+/epHc85Yt2hqcbql9cpeFxF9VC+HBzzIBj9VtSg7IP9NU7TxVoWfoDLJe7RwuXsL2XHV5bJ
	1lEAEwLKbGUK4yxXcc+co4NCQLsnYWlNQz2368eLW3LL2/hvR2qJTUCRMIpoup7AqovWQyo7bX/Ie
	fWVyJqMVJOkafQk6eZJw1T6Tl1McBpV2PA/hAfvV4JgLZQ54/pE0etOSmXUlH4IrfHZbSBnITWo4s
	L2EzTPgQ==;
Received: from localhost ([::1]:22614 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k7bC8-00E0kK-OG; Mon, 17 Aug 2020 09:12:44 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:45180) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k7bC3-00E0kC-37
 for samba-technical@lists.samba.org; Mon, 17 Aug 2020 09:12:41 +0000
Received: by mail-yb1-xb32.google.com with SMTP id x2so9022771ybf.12
 for <samba-technical@lists.samba.org>; Mon, 17 Aug 2020 02:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b1rC1cy99MyGNKKwUWTTBYvLR6Z6PoQ09G+uwLKgc6U=;
 b=iYeTIh5jIOp3GC4LEnn40W559a62jTPsOw7/SRzTUySi9x2eMXxnhZYhQPP+ckbbH0
 zKNPCe/jpLKMymoUBdAIpzXifaewXrEfECbEkwXUnHzYuEexyqujYd2QckRKnpD35Tct
 yCvwaU9J/96YdXR3AQW2eWuLLATcmhYHZsjMVRZ2es1NHbmiVEJkoh8j3uBeP1JqalmE
 ScNJyxg1p3MxDLexUGfzFPwR1dxzMOTUEbjwlrMSwjiYCBF0apB9t0yP4jg/gOsKioVx
 5xuSg2291adXc5dav+FnhBoq1RhS1OaP7J0KXQQOhJi3ButHth2eTMEv7V3gkYUaIKCp
 essw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b1rC1cy99MyGNKKwUWTTBYvLR6Z6PoQ09G+uwLKgc6U=;
 b=EToq1n1CkIShziVRZdNWsr/rc0N/LylVySn6y18CaXvOzX4QGUQSD1JMVUv3uCNqIP
 hKX36UFTESugeskhjsjcf0ARV9NwnaYvqYr0S8Y8e6U1FXU8/T0q3m4LKQYuZS433/s8
 07igfNPYU0P78aCptgS+cTxD6u4OcrjryDzNW1DHyds5ZzHOMw19kTX7+FxvR9/NMNEg
 6NAh+yZWguXg0vTD2/p+vQGWUgSUfRMSOciguwRHRs7nYOGgHepakS+VPfT3/46qH9G3
 Z+uROAulGK3fGTW6f8g7kbu/75nPsSTxdB2D5PZt3XwF+CRXeOlZF984Jnron2CbpbX2
 oo7g==
X-Gm-Message-State: AOAM531t2C18OdzXZA6FfUDipf0k3SW1nwTo3xswbTSabLQxjK9h/2rD
 iZXHQPlxl+ABZ1hM/ItG1PHCt7z5qi5UknX57QU=
X-Google-Smtp-Source: ABdhPJxIu4NcIluE0pDTKNCyjF2835PpSZ22CyI6d8F7RWHG845NPGSz6FJexkmXE+r8IbLxN42slzPcEryB/VF6XOI=
X-Received: by 2002:a25:414:: with SMTP id 20mr19288770ybe.97.1597655554160;
 Mon, 17 Aug 2020 02:12:34 -0700 (PDT)
MIME-Version: 1.0
References: <CANT5p=pxPsBwAv3oJX6Ae9wjpZoEjLvyfGM1sM9DEhS11RNgog@mail.gmail.com>
 <87pn7t4kr9.fsf@suse.com>
 <CANT5p=oeY91u17DPe6WO75Eq_bjzrVC0kmAErrZ=h3S1qh-Wxw@mail.gmail.com>
 <87eeo54q0i.fsf@suse.com>
In-Reply-To: <87eeo54q0i.fsf@suse.com>
Date: Mon, 17 Aug 2020 14:42:21 +0530
Message-ID: <CANT5p=rxp3iQMgxaM_mn3RE3B+zezWr3o8zpkFyWUR27CpeVCA@mail.gmail.com>
Subject: Re: [PATCH][SMB3] mount.cifs integration with PAM
To: =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>
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
From: Shyam Prasad N via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shyam Prasad N <nspmangalore@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>, sribhat.msa@outlook.com,
 samba-technical@lists.samba.org, Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thanks Aur=C3=A9lien. Good points.
Let me take a closer look at this and see how to proceed.

Regards,
Shyam

On Mon, Aug 17, 2020, 14:18 Aur=C3=A9lien Aptel <aaptel@suse.com> wrote:

> Shyam Prasad N <nspmangalore@gmail.com> writes:
> > Agreed. But since we're not dealing with krb5cc file directly in
> > mount.cifs, I don't see it influencing this change. However, I will tes=
t
> it
> > out too.
>
> When reconnecting or accessing DFS links (cross-server symlinks) the
> client opens a new connection to the target server and has to auth
> again. Since there are no ways to ask for a password at that moment
> (we're in the middle of some syscall) cifs.ko does an upcall to
> cifs.upcall and passes the pid of the process who initiated the
> syscall. cifs.upcall then reads that proc env (via /proc/<pid>/environ)
> and looks for KRB5CCNAME, uses it and returns the required data for
> cifs.ko to proceed with the SMB Session Setup.
>
> So it is important to have this env var set if the location of the
> credential cache is not the default one. If you do PAM login from
> mount.cifs, the env var might be set for that process but it will only
> persist in children processes of mount.cifs i.e. most likely none.
>
> I still think this patch is a good idea but we should definitely print
> something to the user that things might fail later on, or give
> instructions to set the env var in the user shell or something like that.
>
> > That does make sense. I was thinking of including a mount option to
> enable
> > this path. But let me explore the retry-on-failure path as well.
>
> Mount option sounds good regardless.
>
> > Yeah. I didn't get the complete picture on session maintenance after
> > reading the pam application developer's guide.
> > Was hoping that somebody on samba-technical would have some idea about
> this.
>
> The keyring docs have some info on it too but it's still not clear to
> me.
>
> https://man7.org/linux/man-pages/man7/session-keyring.7.html
>
> Cheers,
> --
> Aur=C3=A9lien Aptel / SUSE Labs Samba Team
> GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
> SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg,=
 DE
> GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=
=BCnchen)
>

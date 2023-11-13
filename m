Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D09387EA60D
	for <lists+samba-technical@lfdr.de>; Mon, 13 Nov 2023 23:24:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=z2WWxIDUsdHp0wXasuKRqlZ64Nw6Dyphc54R0vg6D9Y=; b=2kD2HuGO7V1UYK85soxSDOYf24
	XsM06OhnBZMp/OGjg4YuR3Hj1vU18LU26GiW0Kx1DUPAXekvlJJ5urEoviyrfVY+qcDo9/xukNXBC
	Ckrc8OVds2sB1oUa3hcw8YNodY7P/sbUmrN79Ck+dsm94iWQDaJQ2A4miYMatfks+2v5TZAyApsf9
	vSeE1vU9v2Ta6josUEkLLMX4Nf6S2/4qjjMaAuhISxmg1RYf2bwCAygkz7ai8sHdH4u82qwHd84Sr
	ejgjAHhCieUrjOwMwl8DiibOzWpIGlSkULXtrKRCJ3SAgSKTvKOL7xScqdS9qkZ4/KZ2Nq8e2RYDS
	4mCzCbpg==;
Received: from ip6-localhost ([::1]:32634 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r2fLZ-0089u0-Rz; Mon, 13 Nov 2023 22:23:57 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:51585) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r2fLO-0089q0-H7
 for samba-technical@lists.samba.org; Mon, 13 Nov 2023 22:23:52 +0000
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-507bd644a96so7117082e87.3
 for <samba-technical@lists.samba.org>; Mon, 13 Nov 2023 14:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699914225; x=1700519025; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z2WWxIDUsdHp0wXasuKRqlZ64Nw6Dyphc54R0vg6D9Y=;
 b=CAH7a/WXhqmatr4rbtzErJNbOLMyfmX1zj84olUpXy5Md0y0WTJ3S7JMKJi/zrx/Hq
 EhSdzFq7Rf5Yqn+m7h23jypYKK0A5tPFJ9fEXJluePkz1ldywaHaoTGg/b1UD7Fkucsg
 Tkb6ZBBkfBbnOYKGHSOJEwM27Y4AboUzgioe/F2PWWQqJB9Dr/XwudqYHVbo5FTr1GRG
 RSBG683SzjBUyNlyH3oCxqhc+WpxA6/El4bjreqczgJS3vOiZ76opFksnpUZKT7h7eUz
 LSkZjuatSgBpvFaCoD2UDs2dQAd4RKmRAEBSkomIt4hWmRd1BaDWtM5F3QlHnKlFwRoe
 O2wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699914225; x=1700519025;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z2WWxIDUsdHp0wXasuKRqlZ64Nw6Dyphc54R0vg6D9Y=;
 b=P5CWfEdq+TsCudcmPrwjQQUO716Na1vTxYzQgXnPlNrvkRmrddKzMznmYIapI4/ApV
 nJYGc4WvfP17HgmhWRs80pfDH0Txxq+6Dzdpvm8TQuMMpELlnX6EKCPjlh+lGwJe0abK
 YZvvPmsjbtZzisk/gVb3lD6CECq0LN/J4ctYQuNlmLL3Mpm9itsFmWQEhNCeVZtnsACO
 dNot/t8s80A7bWd8UL2GxWBmSo6QcZdQG07lNRrh3B8jz/LypkynA+sAU6UlUVlYa1m0
 DYA1J9/611Unc9/4CnbFKcmhkvgsJ04RdbKjzVKCvgS633PTUGtr6b7PVO2GC4cG78sp
 Pquw==
X-Gm-Message-State: AOJu0YzSNpFsoT/q4tKFaOuWwZJCvlXI2gCV6a5upYatHIG5qdQnl3ol
 MqvXecke/lVfFK7IEjbHEXXcwhXr/TcavfbOoZ4=
X-Google-Smtp-Source: AGHT+IHcKruz1Vla5I9USOC6Qahqw9agqD2FOZVIx06sXye6LIqqJxk5vOu+344DzzDXRF93Ba1LsdoyD0BQJ/gVvWo=
X-Received: by 2002:a05:6512:238b:b0:50a:7575:1339 with SMTP id
 c11-20020a056512238b00b0050a75751339mr5952741lfv.18.1699914225580; Mon, 13
 Nov 2023 14:23:45 -0800 (PST)
MIME-Version: 1.0
References: <20231113145232.12448-1-abelova@astralinux.ru>
 <05bfafca49fbed96ea500c25a0606205.pc@manguebit.com>
In-Reply-To: <05bfafca49fbed96ea500c25a0606205.pc@manguebit.com>
Date: Mon, 13 Nov 2023 16:23:34 -0600
Message-ID: <CAH2r5mv+ntKVtzx+9ooYPJna7R0=ovsZid9EghwW3pzi5G4+Xg@mail.gmail.com>
Subject: Re: [PATCH] cifs: spnego: add ';' in HOST_KEY_LEN
To: Paulo Alcantara <pc@manguebit.com>
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
Cc: Tom Talpey <tom@talpey.com>, Shyam Prasad N <sprasad@microsoft.com>,
 lvc-project@linuxtesting.org, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>,
 Steve French <sfrench@samba.org>, Ekaterina Esina <eesina@astralinux.ru>,
 Anastasia Belova <abelova@astralinux.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Tentatively merged into cifs-2.6.git for-next pending testing

On Mon, Nov 13, 2023 at 12:11=E2=80=AFPM Paulo Alcantara <pc@manguebit.com>=
 wrote:
>
> Anastasia Belova <abelova@astralinux.ru> writes:
>
> > "host=3D" should start with ';' (as in cifs_get_spnego_key)
> > So its length should be 6.
> >
> > Found by Linux Verification Center (linuxtesting.org) with SVACE.
> >
> > Fixes: 7c9c3760b3a5 ("[CIFS] add constants for string lengths of keynam=
es in SPNEGO upcall string")
> > Signed-off-by: Anastasia Belova <abelova@astralinux.ru>
> > Co-developed-by: Ekaterina Esina <eesina@astralinux.ru>
> > Signed-off-by: Ekaterina Esina <eesina@astralinux.ru>
> > ---
> >  fs/smb/client/cifs_spnego.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>
> Reviewed-by: Paulo Alcantara (SUSE) <pc@manguebit.com>
>


--=20
Thanks,

Steve


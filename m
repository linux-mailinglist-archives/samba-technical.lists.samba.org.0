Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 563091BA2F0
	for <lists+samba-technical@lfdr.de>; Mon, 27 Apr 2020 13:50:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=xYWTfyXgGzIeJwCtTBp3Hr/Zb19gnm6w1ZZ6C+e5Tuw=; b=JSZ5h9uS1enJAV/HFJzdAr/XNu
	WQb1FrFPLK6CldgeV+7pM93Q2lEFrL4UuYOVww2ytsEmw/PgRYziEdmtWUULzsX33lpDpWV4iE1wy
	yNdPQFx0MOCUvmLxGZF3iXPV4D0sq340jiTQpvYECZVqCQjYJIsCQCYtOfqZ6HtrPo6oRSMHEENig
	ShhIzFgMNUIKYadPss7incnl/fAYdGkovw3NkZCfH49l02n0FsVvv76dfzAqm3x+zXVwrQHNUYNMp
	XpvN1op9+zq/d1eg/zvPNt5oOFMY5WZ1TttC3eg/1sirmqfO7k5/YIPiNXFcYaJ0D0BAf5cfrSgA2
	JqXkPfZA==;
Received: from localhost ([::1]:40598 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jT2H7-002Al1-1e; Mon, 27 Apr 2020 11:50:13 +0000
Received: from mx2.suse.de ([195.135.220.15]:43250) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jT2Gz-002Aku-JD
 for samba-technical@lists.samba.org; Mon, 27 Apr 2020 11:50:08 +0000
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B783FAD76;
 Mon, 27 Apr 2020 11:50:01 +0000 (UTC)
To: Shyam Prasad N <nspmangalore@gmail.com>, samba-technical@lists.samba.org
Subject: Re: Debug logs in heimdal krb5
In-Reply-To: <CANT5p=o8iFSrPscQiqpeX=Qb_JBqiAVGWHsQBh1g4kBBH_u1wA@mail.gmail.com>
References: <CANT5p=o8iFSrPscQiqpeX=Qb_JBqiAVGWHsQBh1g4kBBH_u1wA@mail.gmail.com>
Date: Mon, 27 Apr 2020 13:50:01 +0200
Message-ID: <87sggp87x2.fsf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
From: =?utf-8?q?Aur=C3=A9lien_Aptel_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?utf-8?Q?Aur=C3=A9lien?= Aptel <aaptel@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Shyam Prasad N via samba-technical <samba-technical@lists.samba.org>
writes:

> Hi,
>
> I'm currently debugging a problem I'm facing with krb5 mount in cifs, and=
 I
> want to enable logging in the heimdal krb5 library. How do I enable all t=
he
> logs which are printed using _krb5_debug in the code?

Try setting KRB5_TRACE env var.

    KRB5_TRACE=3D/dev/stderr <prog>

I have written some notes on using/debugging on the wiki. Maybe this can
help :)

https://wiki.samba.org/index.php/Cifs.ko-testing#Can_you_login_using_kerber=
os.3F

Cheers,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, DE
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D67A0246118
	for <lists+samba-technical@lfdr.de>; Mon, 17 Aug 2020 10:48:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=78EE35o7SQ50JAIJ1+t++/YLLFejxXbx6pU47UBoAps=; b=SG8i8gXy0rTXaKOIuMfZYe0xwV
	o6Gv376SJi380sNyhyiWOW0F0c589uK1zDy7pH0d1pcIoB/ZDUTSRHt7I1uVruZS2Yk8ZpSiCqvYz
	g1RcrTcWS3qoi9SpMHAf7TVCmZyDzItqbb6L5OyS44oahB5oObksHWti1mGBpaLk4QY4wT2qBi6JW
	o6XqR6q8mdBtRSzZbXUIoiCaJFzbyVrxoeZTKeJ/sYyNFbQkde+2WZ7/FlxTrcLpvq3Emyleepyon
	uCJCRk8MV2sL0WcAprpF91R2r5R0EmQyBGADGMbb68fu8zIa4F2oxsKAzXtkZqrK7nUjZzhx4HkG0
	ZJFBLw7w==;
Received: from localhost ([::1]:19514 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k7aoZ-00E0Ht-FO; Mon, 17 Aug 2020 08:48:23 +0000
Received: from mx2.suse.de ([195.135.220.15]:47158) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1k7aoU-00E0Hm-BM
 for samba-technical@lists.samba.org; Mon, 17 Aug 2020 08:48:20 +0000
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B0053AE91;
 Mon, 17 Aug 2020 08:48:40 +0000 (UTC)
To: Shyam Prasad N <nspmangalore@gmail.com>
Subject: Re: [PATCH][SMB3] mount.cifs integration with PAM
In-Reply-To: <CANT5p=oeY91u17DPe6WO75Eq_bjzrVC0kmAErrZ=h3S1qh-Wxw@mail.gmail.com>
References: <CANT5p=pxPsBwAv3oJX6Ae9wjpZoEjLvyfGM1sM9DEhS11RNgog@mail.gmail.com>
 <87pn7t4kr9.fsf@suse.com>
 <CANT5p=oeY91u17DPe6WO75Eq_bjzrVC0kmAErrZ=h3S1qh-Wxw@mail.gmail.com>
Date: Mon, 17 Aug 2020 10:48:13 +0200
Message-ID: <87eeo54q0i.fsf@suse.com>
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
Cc: CIFS <linux-cifs@vger.kernel.org>, sribhat.msa@outlook.com,
 samba-technical@lists.samba.org, Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Shyam Prasad N <nspmangalore@gmail.com> writes:
> Agreed. But since we're not dealing with krb5cc file directly in
> mount.cifs, I don't see it influencing this change. However, I will test =
it
> out too.

When reconnecting or accessing DFS links (cross-server symlinks) the
client opens a new connection to the target server and has to auth
again. Since there are no ways to ask for a password at that moment
(we're in the middle of some syscall) cifs.ko does an upcall to
cifs.upcall and passes the pid of the process who initiated the
syscall. cifs.upcall then reads that proc env (via /proc/<pid>/environ)
and looks for KRB5CCNAME, uses it and returns the required data for
cifs.ko to proceed with the SMB Session Setup.

So it is important to have this env var set if the location of the
credential cache is not the default one. If you do PAM login from
mount.cifs, the env var might be set for that process but it will only
persist in children processes of mount.cifs i.e. most likely none.

I still think this patch is a good idea but we should definitely print
something to the user that things might fail later on, or give
instructions to set the env var in the user shell or something like that.

> That does make sense. I was thinking of including a mount option to enable
> this path. But let me explore the retry-on-failure path as well.

Mount option sounds good regardless.

> Yeah. I didn't get the complete picture on session maintenance after
> reading the pam application developer's guide.
> Was hoping that somebody on samba-technical would have some idea about th=
is.

The keyring docs have some info on it too but it's still not clear to
me.

https://man7.org/linux/man-pages/man7/session-keyring.7.html

Cheers,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, DE
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)


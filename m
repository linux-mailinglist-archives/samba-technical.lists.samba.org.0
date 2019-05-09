Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 595E1186C2
	for <lists+samba-technical@lfdr.de>; Thu,  9 May 2019 10:25:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=X5aETWzmm33LeFeubZDBqch8kFzbe0EtEWHn5Udl4xA=; b=1MXLhnaRmNBgqR4COOUX2yRyGW
	Dm1m5hCl9UDdw0Q0rE7XHPtVcy2cZtpomSOrSmoksHBJ+R2YV7ETqrGUZeBho8+lF8k0CLOhg3SHn
	nVmhHlS7m19ie7xUQsvsEGb1KBmn5Bequ3KgP5Wmmy6Em7qs0/rrxP16F2C+Trjaf5FPCvYpmRLce
	QNogV8YawW5Iz4OFGMUHce6RYYl5iz4zHtAJSpMbKGxi70WMNOCN4g+hiUtXuwum5t1viJjvtnY4e
	+8BJN8YJ7YrwOBGyEOYSo0BzOmntQHfixAURIjqNutNV8RjpdMnVqM/vhd6dzU3y82OUydSjr1epy
	hWPoyX1A==;
Received: from localhost ([::1]:42996 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hOeMp-0034IN-IC; Thu, 09 May 2019 08:25:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:21680) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hOeMj-0034IG-2J
 for samba-technical@lists.samba.org; Thu, 09 May 2019 08:25:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:To:From:Date:CC;
 bh=X5aETWzmm33LeFeubZDBqch8kFzbe0EtEWHn5Udl4xA=; b=Jaqfd3YXQI5z/vm+gEqEa4utHW
 r7AsKIsNSW2nEWkGrABT04tQtWtVGaGs7V13RZ0gYWNf1w3zb64tjHaP0ODtD4Xl/cQ+UneMLG9G2
 BmI2b8nVXxG2jN9c+T2E+n6W5x4afBS3GX1V+pX2hBLpKJc4VaIC7eaEVsG/JWeDjFqM=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hOeMi-0007kF-Bt
 for samba-technical@lists.samba.org; Thu, 09 May 2019 08:25:20 +0000
Date: Thu, 9 May 2019 09:25:18 +0100
To: samba-technical@lists.samba.org
Subject: Re: debian 10: I can not integrate a linux machine into a Samba Ad
Message-ID: <20190509092518.1c8e2995@devstation.samdom.example.com>
In-Reply-To: <ed478625-1c87-295f-bff2-e579f0f919f6@univ-littoral.fr>
References: <ed478625-1c87-295f-bff2-e579f0f919f6@univ-littoral.fr>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


See inline comments:

On Thu, 9 May 2019 09:29:05 +0200
nathalie ramat via samba-technical <samba-technical@lists.samba.org>
wrote:


> I configured smb.conf at my server :

Er, no, you misconfigured your smb.conf on the DC ;-)

> # global parameters
> [global]

>       winbind enum users =3D yes
>       winbind enum groups =3D yes
>       winbind use default domain =3D yes
>       winbind separator =3D /
>       idmap config *:backend =3D tdb
>       idmap config *:range =3D 1000-19000=C3=83=C2=A9r=C3=83=C2=A9 correc=
tement semble-t-il.
>       host msdfs =3D no
>       security =3D user
>       name resolve order =3D host
> #    ntlm auth =3D yes
> #     raw NTLMV2 auth =3D yes
> #    lanman auth =3Dyes
> #    vfs objects =3D acl_xattr
>       map acl inherit =3D Yes
> #    store dos attributes =3D Yes

I would suggest you remove the above lines, they either have no place
in A Samba AD DC or slow things down.

> and my linux user :
>=20
> [global]
>       security =3D ads
>       realm =3D lenzspitze.calais.fr

Change the realm to uppercase

>       workgroup =3D LENZSPITZE
>       netbios name =3D testbugster
>       winbind separator =3D /
>       ntlm auth =3D yes
>       idmap uid =3D 0-50000
>       idmap gid =3D 0-50000

No, that's the old way of doing things

>       winbind enum users =3D yes
>       winbind enum groups =3D yes

Once everything is working, remove the two lines above, they are only
required for testing purposes.

>       idmap config LENZSPITZE : backend =3D rid
>       idmap config LENZSPITZE : base_rid =3D 0

You do not have to set the base_rid, but what you do have to do, set
the 'idmap config' lines. See here:

https://wiki.samba.org/index.php/Setting_up_Samba_as_a_Domain_Member

Finally, you really should have posted this to the samba mailing list,
not to the samba-technical list

Rowland


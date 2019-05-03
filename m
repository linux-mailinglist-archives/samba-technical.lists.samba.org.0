Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9F4131F1
	for <lists+samba-technical@lfdr.de>; Fri,  3 May 2019 18:16:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=1YGFo+HPlU6YOskEhwy1Kf43UWGgYEXtxmXd4QJBvec=; b=FtsaYhrN+eGTjXzp5KApyzB/BU
	+ykea5bkGw4HGnCzVB8BXJtvUmn1Ydzzdu5pfovrrHBn4+fMFiJhGW/18H1hbB4JisKh0egvtZljS
	5wKl92ZeFaWRBneC5ycaGUipLhEuyzmtovKS2hW0No4icbJ6bP/5m/34NyR+RRTp3oUHp3L2x0j7b
	LiZt4a/x1klM32Kr2nEMfeRyF35OGbuRhj46R4drBrn1CI+UqSrkaplb8dZMgTIygpHHIAwE8ART3
	CPSZRYEHqP/fxUZDNu/pvIaFQ5J4hyoapwFKMjwmKsv6rL0WHLoFWJPENGY9apjQVVepElS7cgnDO
	zQwhSNkA==;
Received: from localhost ([::1]:31812 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hMaqj-002JVi-B5; Fri, 03 May 2019 16:15:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:52528) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hMaqe-002JVb-N3
 for samba-technical@lists.samba.org; Fri, 03 May 2019 16:15:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:To:From:Date:CC;
 bh=1YGFo+HPlU6YOskEhwy1Kf43UWGgYEXtxmXd4QJBvec=; b=eRaS/KFLKrttrdLv+JMjG7BnLj
 Wcg0ZysdpXbmxAokmRB7h1ZBbiJ5OrWMrv1ZCzWwdKWOvKXhFhSU8gcC3DkmCo9BrHnwyrSqVEOJs
 His/pjDuPPv4bj/i7lyHLH8UfbdIHBlfiF8DzQx/qjc3YFHG16aDBw7NKfvH7Ft9J61Y=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hMaqe-0003IH-8m
 for samba-technical@lists.samba.org; Fri, 03 May 2019 16:15:44 +0000
Date: Fri, 3 May 2019 17:15:43 +0100
To: samba-technical@lists.samba.org
Subject: Re: Samba AD DC Password Expiry problem
Message-ID: <20190503171543.2e6bfbe0@devstation.samdom.example.com>
In-Reply-To: <5CCC6539.4010105@pardus.org.tr>
References: <5CCC6539.4010105@pardus.org.tr>
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

On Fri, 03 May 2019 18:58:49 +0300
Izzet Ayd=C4=B1n via samba-technical <samba-technical@lists.samba.org> wrot=
e:

> Hello everyone,
>=20
> I am trying to force a user to change his password at login screen, (=20
> test2 is the username ) with the following command
>=20
> samba-tool user setpassword test2 --must-change-at-next-login
>=20
> Client computer is configured and joined to domain. However, when i
> try to login in lightdm, i see the following line in auth.log
>=20
>   pam_winbind(lightdm:auth): request wbcLogonUser failed:=20
> WBC_ERR_AUTH_ERROR, PAM error: PAM_AUTHTOK_EXPIRED (27), NTSTATUS:=20
> NT_STATUS_PASSWORD_EXPIRED, Error message was: Password expired
>=20
> but the user is still able to login.
>=20
> If i configure another client computer with gnome interface, i get
> the same auth.log message, but in this case i see the password
> expired message in gdm. Yet no user password change interrupts
> appears.
>=20

This very probably has nothing to do with Samba, there is a grace
period that will allow the old password to work, but your login manager
should deal with this. It should prompt the user to change their
password, so I think you need to put your question to whomever
produces your login manager.
=20
>=20
> /etc/samba/smb.conf
> [global]
> realm =3D test.local
> workgroup =3D TEST
> security =3D ads
> password server =3D xxx.xx.xx.xx
> security =3D ads
> idmap uid =3D 10000-20000
> idmap gid =3D 10000-20000
> template shell =3D /bin/bash
> winbind use default domain =3D yes
> winbind offline logon =3D false

What I can point out to you is, your smb.conf is incorrect, it uses
extremely old settings (the idmap lines) and things that shouldn't be
set (password server), can I suggest you read this:

https://wiki.samba.org/index.php/Setting_up_Samba_as_a_Domain_Member

Can I also point out that you should really ask questions like this on
the samba mailing list.

Rowland



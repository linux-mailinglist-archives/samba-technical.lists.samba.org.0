Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F6BA0161A
	for <lists+samba-technical@lfdr.de>; Sat,  4 Jan 2025 18:29:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=JYW7nmp+9Y1y2JT8bjNMhHfNTnnmg6q8QfLbRMN8qGU=; b=UduAUE3c0/LJY5tmNJD4AUoHEj
	6SaLjDD6HniBVB9vr/8Vdbvgdxm93dylxioJP7RG7eRScEskyZjdrfEJkUR/szcpJk+R9mDEZDLjy
	Zxt2cU9a1RYRe0d/egL+3wQnv64Abu7e5BT6/Kx6uJuVEzd3tiVNIBDqFXtcnjcjT8Ka6uYFvS3R4
	25UIUvYcvsHYeNtY3PVWsdL97YM1E8w1kF/35rc7NoOYyAVCZ0qPYJ63SNKSORXv11E44GjeNfPDr
	ida+LDKIEgNAbYrxPV2lNllFBYnyrQzncwlsK0kdY7+wq3CZ4Iv3gobaDxzlkBIuuFpc2j4rJASwl
	9tt9fktw==;
Received: from ip6-localhost ([::1]:40222 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tU7xI-007HQH-GZ; Sat, 04 Jan 2025 17:28:56 +0000
Received: from relay4.ptmail.sapo.pt ([212.55.154.24]:45026) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tU7xE-007HQ8-Jo
 for samba-technical@lists.samba.org; Sat, 04 Jan 2025 17:28:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapo.pt;
 s=sapo20240325; t=1736011727;
 bh=JYW7nmp+9Y1y2JT8bjNMhHfNTnnmg6q8QfLbRMN8qGU=;
 h=From:To:References:In-Reply-To:Subject:Date:From;
 b=VhpsqwPeRguoBjkspYQqvXBQV929XGvbcQeCOupVkHBC2mtrp8zIRZU0sJHDPFyQo
 ZL8aEVs+T04mT4Nvm8PC6Xjee735jibXbQpj9to1Mh2a8eYXQegVgTC9VdMBs7NfKz
 KUTPpazi23ECPDP8EAPLAYG26UW7YVceaA3mCbgvY0amzoQ70cTKQNV3IjXC701uwJ
 jLBdvNlbYf9RRc1pZAD7zZixJyf2Nr5HcUSDncdGAU4rWW/ncNIqaEfgsr7p60W1Hr
 +4v3ATLmzYGEsafAKYeV3IqtANPuKxGjuvQTU6Zf5eslbuTtfVOuSIs2E4VbzPyTet
 sJmADmSrn3/4w==
Received: from sapo.pt (unknown [10.134.36.76])
 by relay4.ptmail.sapo.pt (Postfix) with ESMTPS id ADF88B54BA1
 for <samba-technical@lists.samba.org>; Sat,  4 Jan 2025 17:28:47 +0000 (WET)
Received: (qmail 20547 invoked from network); 4 Jan 2025 17:28:49 -0000
Received: from Sepher3 (unknown medalist@sapo.pt@[85.245.190.191])
 (envelope-sender <medalist@sapo.pt>)
 by ptmail-mta-auth02 (qmail-ptmail-1.0.0) with ESMTPSA;
 4 Jan 2025 17:28:49 -0000
X-PTMail-RemoteIP: 85.245.190.191
X-PTMail-AllowedSender-Action: 
X-PTMail-Service: default
To: "'Stefan Kania'" <stefan@kania-online.de>,
 <samba-technical@lists.samba.org>
References: <0a6801db5ec4$61f552b0$25dff810$@sapo.pt>
 <5ca363e0-f094-46e8-a747-beda0d05835a@kania-online.de>
In-Reply-To: <5ca363e0-f094-46e8-a747-beda0d05835a@kania-online.de>
Subject: RE: Upcoming discontinuation of Samba 4.19.x (creation of new GPOs
 impossible with versions 4.20.x and 4.21.x)
Date: Sat, 4 Jan 2025 17:28:48 -0000
Message-ID: <001401db5ece$1dc252f0$5946f8d0$@sapo.pt>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 15.0
thread-index: AQIydtSxMsvZH5p9CpyA7UX6lXPI+gGyV1Pfsksa+xA=
Content-Language: pt
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
From: miguel medalha via samba-technical <samba-technical@lists.samba.org>
Reply-To: miguel medalha <medalist@sapo.pt>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Have you read the bug report?

https://bugzilla.samba.org/show_bug.cgi?id=3D15738

Starting with Samba 4.20.0, you cannot create a GPO that applies *to =
more than one group*, at least with the RSAT application. The =
application crashes and the GPO gets corrupted. This was confirmed by =
other users, even with the Sernet commercial compilation of Samba.


-----Original Message-----
From: samba-technical [mailto:samba-technical-bounces@lists.samba.org] =
On Behalf Of Stefan Kania via samba-technical
Sent: 4 de janeiro de 2025 17:03
To: samba-technical@lists.samba.org
Subject: Re: Upcoming discontinuation of Samba 4.19.x (creation of new =
GPOs impossible with versions 4.20.x and 4.21.x)

O_O Why should it be not possible to create GPOs with Samba 4.20 and=20
4.21? At the moment I'm writing my new Samba4 book (in German), I use=20
Samba 4.21 from Debian12 Backports und I created a lot GPOs, both for=20
Windows- and Linux-clients.


Am 04.01.25 um 17:19 schrieb miguel medalha via samba-technical:
> Are Samba developers aware that the only way to create usable GPOs =
(which
> are arguably one of the most important features of an AD environment) =
is to
> use a Samba version (4.19.x) that is two versions behind the current =
one and
> that, according to "Samba Release Planning and Supported Release =
Lifetime",
> is scheduled for discontinuation in March 2025?
>=20
> https://wiki.samba.org/index.php/Samba_Release_Planning
>=20
> Please note that I am not bitching or demanding anything, I am =
grateful for
> what we have and I truly appreciate the hard work of the Samba team =
members.
> I am just calling attention to this fact. I really wish I could help, =
but
> unfortunately I am just a sysadmin, not a developer.
>=20
> https://bugzilla.samba.org/show_bug.cgi?id=3D15738
>=20
>=20
>=20




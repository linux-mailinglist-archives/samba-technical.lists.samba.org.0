Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E93A01625
	for <lists+samba-technical@lfdr.de>; Sat,  4 Jan 2025 18:45:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=jSpMQVM3W4Bf84zIyaEWHyCwUtqwKNadYHUOv+9PIcM=; b=ZHGukojoE1DuNJhkvC85z/uTxM
	MgZxb53PJr/qRrbt3LsJ8nddddUcwVHaJi3By7R4gDZ8+0JjCTlz/RvQNLN3tKjX+DIXGH/4RU4Sm
	SQiB63/mRarffff07pl2Ki8iUcuRkfJNu7iNFm9NlEo/q4AdXnBW7dn1j/V84C8M3DHrkTwjaS4Mb
	7mXTIUzusDTk7w3tehpd+p/+9L6una8LhrM7GAjyAKknX0RrsaGJIh8npIvwTJAxRlFgUWdZ31qcd
	xBCJfBXzlALjUzy4js3m707u8q2e4kanj5IUPtrjzAhTXjUSHTJqTjhqVlV6DJEYMQnVXtpFpCifV
	kxm6Wxfg==;
Received: from ip6-localhost ([::1]:25208 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tU8DC-007HWW-Kq; Sat, 04 Jan 2025 17:45:22 +0000
Received: from relay2.ptmail.sapo.pt ([212.55.154.22]:51034) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tU8D6-007HWP-TJ
 for samba-technical@lists.samba.org; Sat, 04 Jan 2025 17:45:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapo.pt;
 s=sapo20240325; t=1736012711;
 bh=jSpMQVM3W4Bf84zIyaEWHyCwUtqwKNadYHUOv+9PIcM=;
 h=From:To:References:In-Reply-To:Subject:Date:From;
 b=fmLDuLMJ24lUGxzxBJhoaNPGrRBiZa4kXvyFJLcX83ULeo9A26rYl+vQor9RzvJoq
 tDxGQYXiQtCYOJQpDGfyq4wC/3vaR6jQVv4yU7sSp6BH687zjtXmOl2ELZpGOrNin+
 4Xb5A6TDDm8+FlzJDM+RPpMQVxdxknngGdYpEmR+nGOuoErAAtTXO7CTvBZPxHKLlu
 z11nHm2KFdMCbjZ+tEdqhJgx8otPN7tPv3WrSu0qJ1Ga9bChBuKS+cZVMyLUEk2zkx
 Uk1HWervc248jNd9Lygzywt556Z3NNCU5saFD7cFYF4O/NFPsq987p5iIaqCL0z0FT
 zWI0NHmtgG8TQ==
Received: from sapo.pt (unknown [10.134.36.76])
 by relay2.ptmail.sapo.pt (Postfix) with ESMTPS id 76054B5052A
 for <samba-technical@lists.samba.org>; Sat,  4 Jan 2025 17:45:11 +0000 (WET)
Received: (qmail 26646 invoked from network); 4 Jan 2025 17:45:12 -0000
Received: from Sepher3 (unknown medalist@sapo.pt@[85.245.190.191])
 (envelope-sender <medalist@sapo.pt>)
 by ptmail-mta-auth02 (qmail-ptmail-1.0.0) with ESMTPSA;
 4 Jan 2025 17:45:12 -0000
X-PTMail-RemoteIP: 85.245.190.191
X-PTMail-AllowedSender-Action: 
X-PTMail-Service: default
To: "'Stefan Kania'" <stefan@kania-online.de>,
 <samba-technical@lists.samba.org>
References: <0a6801db5ec4$61f552b0$25dff810$@sapo.pt>
 <5ca363e0-f094-46e8-a747-beda0d05835a@kania-online.de>
 <001401db5ece$1dc252f0$5946f8d0$@sapo.pt>
In-Reply-To: <001401db5ece$1dc252f0$5946f8d0$@sapo.pt>
Subject: RE: Upcoming discontinuation of Samba 4.19.x (creation of new GPOs
 impossible with versions 4.20.x and 4.21.x)
Date: Sat, 4 Jan 2025 17:45:12 -0000
Message-ID: <001601db5ed0$680973a0$381c5ae0$@sapo.pt>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 15.0
thread-index: AQIydtSxMsvZH5p9CpyA7UX6lXPI+gGyV1PfAaYwbKSyPe4uAA==
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

If my AD has lots of groups and I want to apply a particular GPO to a =
number of those groups, it's not really practical having to create a =
separate GPO with the exact same content for each one of those groups, =
is it?


-----Original Message-----
From: samba-technical [mailto:samba-technical-bounces@lists.samba.org] =
On Behalf Of miguel medalha via samba-technical
Sent: 4 de janeiro de 2025 17:29
To: 'Stefan Kania' <stefan@kania-online.de>; =
samba-technical@lists.samba.org
Subject: RE: Upcoming discontinuation of Samba 4.19.x (creation of new =
GPOs impossible with versions 4.20.x and 4.21.x)

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






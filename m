Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 69643243445
	for <lists+samba-technical@lfdr.de>; Thu, 13 Aug 2020 08:57:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=bHdk1MJo7aiXi9TiwwO49C+g3ArcfyLNsBuLb4JYVMg=; b=SYddytj2WOu3cspfBK4Ed56247
	dSc8i3LkqOhy7M7ZChZJVg7XcjfvS7lf7mqNrQFvckCv54V5xTAfMFZX8QOutuAx1cQqzUfIYywd9
	25XY0z3zkGoKIcZMl1NYoXFbFuskZhn+9pZzQUBagpkXnnO4LDZ3wXOxbozETzsVmmHRpS6HJrF5O
	+2TAOjENVF2g6or7NN24rzXpMuuE/SchSj7r+H1PDb+GgeVMjyKC7dUZBZ90jWCrAuhvvdzCIDvfv
	6DCDbkEpms9dhJiuE22eQKuPJ+RtLLzckc9uQ17jWhmdF8/INDxSJzrNEi8w56FmGlFNAUoY0nMSF
	JccAnf+Q==;
Received: from localhost ([::1]:40212 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k67AI-00DTlJ-Jy; Thu, 13 Aug 2020 06:56:42 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16330) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k679H-00DTit-LZ; Thu, 13 Aug 2020 06:55:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=bHdk1MJo7aiXi9TiwwO49C+g3ArcfyLNsBuLb4JYVMg=; b=WY7Rf4Jx5MUwHoiRcnG/IwMt/M
 M+bP4Zhbh5yJAYBdK5VA5IPem6+sODoHJd+CWgTZICoAJ1m+IOpWQfKz0V0DnwtB5f4duGQ5B9JXA
 kfXOtZGQilkG4BG7ssfFROp3kK7DMZybCPr3kYLDpcb7btkOaHsOYFThgArQu8PhvVjc5gLDRiIY5
 Kv6aWRXTQp3+rHXNEoTdbFQlztq8phXURDcKts+11Z8L9AoqWHPBuovaFLM2yobBRRTkdm/D0RAJH
 ZL2+UvtRgEVo4SbVzZ+NYtSHcp0q7WERsi5w+Py7/qB0jcoeh7bfQhmdSu3+lQTlE6nJgNlp8i01h
 CeDsItIBUi1VNMLxBqUhjZEAvVkuKjhpVCMdp1jbVabrQm3oCBI14TSf9l8yhN5QLdDd6hd87THLU
 Ug6JOKCrIcd1nlaFxKIoD/OK38urgGVwmbpXZ7xtUqwq9zIwtXhFU6oIBPpafpbfPYSjbki2klvCk
 XGH6KsavV0ySqJ67PiKwflj8;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1k679G-0006Si-Cd; Thu, 13 Aug 2020 06:55:38 +0000
Date: Thu, 13 Aug 2020 08:55:36 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.12.6 Available for Download
Message-ID: <20200813065533.GA10644@carrie2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: kseeger@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
---------------------


This is the latest stable release of the Samba 4.12 release series.


Changes since 4.12.5
--------------------

o  Jeremy Allison <jra@samba.org>
   * BUG 14403: s3: libsmb: Fix SMB2 client rename bug to a Windows server.

o  Andrew Bartlett <abartlet@samba.org>
   * BUG 14424: dsdb: Allow "password hash userPassword schemes =3D CryptSH=
A256"
     to work on RHEL7.
   * BUG 14450: dbcheck: Allow a dangling forward link outside our known NC=
s.

o  Ralph Boehme <slow@samba.org>
   * BUG 14426: lib/debug: Set the correct default backend loglevel to
     MAX_DEBUG_LEVEL.
   * BUG 14428: PANIC: Assert failed in get_lease_type().

o  Bjoern Jacke <bjacke@samba.org>
   * BUG 14422: util: Fix build on AIX by fixing the order of replace.h inc=
lude.

o  Volker Lendecke <vl@samba.org>
   * BUG 14355: srvsvc_NetFileEnum asserts with open files.

o  Stefan Metzmacher <metze@samba.org>
   * BUG 14354: KDC breaks with DES keys still in the database and
     msDS-SupportedEncryptionTypes 31 indicating support for it.
   * BUG 14427: s3:smbd: Make sure vfs_ChDir() always sets
     conn->cwd_fsp->fh->fd =3D AT_FDCWD.
   * BUG 14428: PANIC: Assert failed in get_lease_type().

o  Andreas Schneider <asn@samba.org>
   * BUG 14358: docs: Fix documentation for require_membership_of of
     pam_winbind.conf.

o  Martin Schwenke <martin@meltin.net>
   * BUG 14444: ctdb-scripts: Use nfsconf utility for variable values in CT=
DB
     NFS scripts.

o  Andrew Walker <awalker@ixsystems.com>
   * BUG 14425: s3:winbind:idmap_ad: Make failure to get attrnames for sche=
ma
     mode fatal.


#######################################
Reporting bugs & Development Discussion
#######################################

Please discuss this release on the samba-technical mailing list or by
joining the #samba-technical IRC channel on irc.freenode.net.

If you do report problems then please try to send high quality
feedback. If you don't provide vital information to help us track down
the problem then you will probably be ignored.  All bug reports should
be filed under the Samba 4.1 and newer product in the project's Bugzilla
database (https://bugzilla.samba.org/).


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=3D=3D Our Code, Our Bugs, Our Responsibility.
=3D=3D The Samba Team
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Download Details
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The uncompressed tarballs and patch files have been signed
using GnuPG (ID 6F33915B6568B7EA).  The source code can be downloaded
=66rom:

        https://download.samba.org/pub/samba/stable/

The release notes are available online at:

        https://www.samba.org/samba/history/samba-4.12.6.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCXzTj4gAKCRAoaL1+KxeT
UYcuAKC747VO1lis5ZKb/WXZkIFQzkGdcgCdELKDqKFMSNVRwVbKF3TSGCbRH/Q=
=IClG
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--


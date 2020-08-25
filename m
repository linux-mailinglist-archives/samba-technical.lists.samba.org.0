Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C30472513C1
	for <lists+samba-technical@lfdr.de>; Tue, 25 Aug 2020 10:00:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=uISqRooz7dyjuR3Cn3cYgSIqFtWuSnX9Z+iYt/EG86Y=; b=izQcSrct5d2NmDaV7LK0nPIf31
	MV6aIfuRLqjrInCFi75bQ3o5JmDRbfbeiGjJvVD3yDbw7wXdreqj0nuL/BONOSo9+Aq3CzxJkpDnO
	f5M04BFUcsS0hu7ej8C45ODifTnvsP/VcUsoWWggLUQih1J9G96OnhVSrNz9Wl1pJo7yXPnfP4ZWr
	ZQbhxMIEDvEojurnkSzwYSkZMxC9yvLm0Mjx53cAjb/4pr4qbi9WMGE31xoAayVMg6gF2auZJTnOd
	y0p5lj2HHoY/ddUH9oVO979Cos3Q5bbnWAkscGul14XMKoc3sdCtUg9P6kOq1HWcyz6AfJFcGuCPa
	QgNT0wVQ==;
Received: from localhost ([::1]:48070 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kATsi-000OKz-PE; Tue, 25 Aug 2020 08:00:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45178) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kATsN-000OJw-O5; Tue, 25 Aug 2020 08:00:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=uISqRooz7dyjuR3Cn3cYgSIqFtWuSnX9Z+iYt/EG86Y=; b=euXqzB7afEVvbYbfUmzaMbcEeC
 HCkA15NNOEccc1vQuY8o23YzZ/l2mvJFaS/VCLdohK1cWq2ivf2hrGE7kFsXExgz3LYdk5VBTBEd3
 /Nf1I39cnPactesWKoff+p6dqnfd/5eIUnr2srCT7Uy+9MZ79B1HvB2G9WhaNxpdQ/zjmrTawrLlI
 TbBjAI2xaN5SWb0CBwra0FnGaiU7duMmYfJcvLOD2lsj/fraUV6V8qBt/oa8/vFHv+UhknR29zk74
 Hhy6YhrnoC7C26TEKrd3SBFE80Dd1KJvX5unE7S5jQEi0Z/BT4JmLugaaIcIYn7KpMAkxoqrj4H00
 sdfmeDQ07YVXNeY4a50eioGIogetdCJ+e8UuaBc6leoNOE9VlYSc8TXONk3xu8isDMljADZGVOcV9
 vMuCIROruYEIGKuECq1YCopgT9L+SWhxA24qErx+oRKVslG05jM2RenTxzDGR7Y05h7Rh9CRxYO6X
 9giIqvN2Qcb+7KRo6s+aYx8+;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1kATsM-0001T5-Vd; Tue, 25 Aug 2020 08:00:15 +0000
Date: Tue, 25 Aug 2020 10:00:13 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.11.12 Available for Download
Message-ID: <20200825080010.GA29193@carrie2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
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


--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
---------------------


This is the latest stable release of the Samba 4.11 release series.


Changes since 4.11.11
---------------------

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
   * BUG 14428: s3:smbd: PANIC: assert failed in get_lease_type().

o  G=C3=BCnther Deschner <gd@samba.org>
   * BUG 14370: lib/util: do not install "test_util_paths".

o  Amit Kumar <amitkuma@redhat.com>
   * BUG 14345: lib:util: Fix smbclient -l basename dir.

o  Stefan Metzmacher <metze@samba.org>
   * BUG 14428: s3:smbd: PANIC: assert failed in get_lease_type().

o  Christof Schmitt <cs@samba.org>
   * BUG 14166: util: Allow symlinks in directory_create_or_exist.

o  Andreas Schneider <asn@samba.org>
   * BUG 14358: docs: Fix documentation for require_membership_of of
     pam_winbind.

o  Andrew <awalker@ixsystems.com>
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
be filed under the "Samba 4.1 and newer" product in the project's Bugzilla
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

        https://www.samba.org/samba/history/samba-4.11.12.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCX0TFBwAKCRAoaL1+KxeT
UZAHAJ0aeN04sNTM5kni22xNpkntGAc/tQCfV61oDc3J2O7ecrz5K/luGqqE+/0=
=Td2w
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 880422F5CE0
	for <lists+samba-technical@lfdr.de>; Thu, 14 Jan 2021 10:08:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=F9CjM1epHCkQ7wRrMKBimzJ6ixEDVhJvD1roJn7xmOU=; b=Q8q8b3luymlj4jclslcwusq2hW
	l9kOTk5Y1h05bq6UM16xQ5tuMa7fW19S67u9c5vLq19sUQhjTA9m779sQy4PewaGOuVyuzMK0mmch
	kY9aAuAtwOq6vLEsIC5NGDsQyVnWOWph6O2Ysn4lktKToZGr2kUJxk3SH2cl0dKzwQfN2HBsp4Ssm
	ozeMkpW6NNIWBc1C/p+m43vcj1+TLZHSRmzvEa27/1Km6Vc3tBjp2STrLSe2N9Pxv1MC19WtJozty
	APdJXsfEBfKZA15wSm97NUJlCDXTcVPmAQ3bvvY0si5M+Y8Nqk3z/IibilPJgNL/w9c0LVkHYAH+s
	VTpPGS4A==;
Received: from ip6-localhost ([::1]:41960 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kzybF-005cC6-Op; Thu, 14 Jan 2021 09:07:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48860) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kzyb4-005cBJ-H4; Thu, 14 Jan 2021 09:07:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=F9CjM1epHCkQ7wRrMKBimzJ6ixEDVhJvD1roJn7xmOU=; b=exJx2d+PI38+QWbMaVfZt9pz1l
 es0JTlsm5OA3o4IUwiqUvFzpzSbxCkR8JJDvP3Ch4yRUxlclOpGrNxj94j7qODhuDH6xvW5OgXD7t
 iUZk87BcKtG1bOYOFTsDL6E65zvi/WaiPNmfRv0nyMpZAMncnTEGQ61E6Ua94CGpWW1f3uFq/kx0b
 xxOD5mdUonfxqul4Jn/S292soYMzPNdQDLNVrFjN4t3uWTR7rbUEGgm11+1d/RnaNBOOcB7N3CG7z
 mfyCmxFDCoy5y4MQ3VMDF1PTEw7WF5PAnZLWnNT8UlI6PVrP99wFkU2JY4npwEEJak8032M853LNc
 suWnLWd9EG9MsOIsNoUoVcnMqQ8diCC6IYS1hg8DwxtwAasdCZsxQ/U2UY4jmqz3EoUieGJLj5wmA
 4+xP+utuTznFZCA0oln8xl8oHub2CcQBnAqleV3yf9bBEV6UXJQHxH0XjEeT4NI5HjFulNRBkzQkV
 FqKEFdWGiDGrSiPyFAqZNcu9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1kzyau-0006LA-1A; Thu, 14 Jan 2021 09:07:04 +0000
Date: Thu, 14 Jan 2021 10:06:56 +0100
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.12.11 Available for Download
Message-ID: <20210114090655.GA12949@carrie2.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="pf9I7BMVVzbSWLtt"
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


--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
---------------------

This is the latest stable release of the Samba 4.12 release series.


Changes since 4.12.10
---------------------

o  Jeremy Allison <jra@samba.org>
   * BUG 14210: libcli: smb2: Never print length if smb2_signing_key_valid()
     fails for crypto blob.
   * BUG 14486: s3: modules: gluster. Fix the error I made in preventing ta=
lloc
     leaks from a function.
   * BUG 14515: s3: smbd: Don't overwrite contents of fsp->aio_requests[0] =
with
     NULL via TALLOC_FREE().
   * BUG 14568: s3: spoolss: Make parameters in call to user_ok_token() mat=
ch
     all other uses.
   * BUG 14590: s3: smbd: Quiet log messages from usershares for an unknown
     share.

o  Dimitry Andric <dimitry@andric.com>
   * BUG 14605: lib: Avoid declaring zero-length VLAs in various messaging
     functions.

o  Andrew Bartlett <abartlet@samba.org>
   * BUG 14579: Do not create an empty DB when accessing a sam.ldb.

o  Ralph Boehme <slow@samba.org>
   * BUG 14248: samba process does not honor "max log size".
   * BUG 14587: vfs_zfsacl: add missing inherited flag on hidden "magic"
     everyone@ ACE.
   * BUG 14596: vfs_fruit may close wrong backend fd.
   * BUG 14596: TODO

o  G=C3=BCnther Deschner <gd@samba.org>
   * BUG 14486: s3-vfs_glusterfs: always disable write-behind translator.

o  Arne Kreddig <arne@kreddig.net>
   * BUG 14606: vfs_virusfilter: Allocate separate memory for config char*.

o  Stefan Metzmacher <metze@samba.org>
   * BUG 14596: vfs_fruit may close wrong backend fd.

o  Anoop C S <anoopcs@samba.org>
   * BUG 14486: manpages/vfs_glusterfs: Mention silent skipping of write-be=
hind
     translator.
   * BUG 14573: vfs_shadow_copy2: Preserve all open flags assuming ROFS.

o  Andreas Schneider <asn@samba.org>
   * BUG 14601: s3:lib: Create the cache path of user gencache recursively.

o  Martin Schwenke <martin@meltin.net>
   * BUG 14594: Be more flexible with repository names in CentOS 8 test
     environments.

o  Jones Syue <jonessyue@qnap.com>
   * BUG 14514: interface: Fix if_index is not parsed correctly.


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

        https://www.samba.org/samba/history/samba-4.12.11.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--pf9I7BMVVzbSWLtt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCYAAJrAAKCRAoaL1+KxeT
UWmvAKDCz1z0RAcfgC+BGUjuKGqPPlqvFwCdEAqvQwTk8yryHAJtgKN1BdsVjZk=
=iErd
-----END PGP SIGNATURE-----

--pf9I7BMVVzbSWLtt--


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3E33C6F73
	for <lists+samba-technical@lfdr.de>; Tue, 13 Jul 2021 13:18:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=OCkFNsPBNb6jJkZWWZFjDqCyNTxM5xULrVi0rSJp8D4=; b=0lma4qdk0rbHF8Hoto/gCTfWcg
	5gGbLMM8RbZdeT1YgkHnXx8fAnO0HfyPibtXwxvT1+6l0+Wd8+dAy8bI+VXUIBh3F+OIRGlMrOUMr
	0fwvCnPmvYWmSpF6c1wutYsK64OfHXeyU3QHdp2/kSm4HP/BurPs8zaUIptYjthpcU+M4H7hqi1kQ
	Pf9g9QWIB8ByJm381hG4jdItjiuLnrTX6lBzFEOu5lCMyPTaIu+f+CpJF1M10YC3x4/RJwIR8nxjo
	2+0TL0XAPrtAC+pCoPMaN8tb2m0K+zl1X0ztU9VTlpiDLmLfEcllVJTuXTaJd5JNvGN0TYk9gfGal
	0DGKnmNA==;
Received: from ip6-localhost ([::1]:30970 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m3GPv-00DAw8-JO; Tue, 13 Jul 2021 11:17:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58310) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m3GPi-00DAvC-KF; Tue, 13 Jul 2021 11:17:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=OCkFNsPBNb6jJkZWWZFjDqCyNTxM5xULrVi0rSJp8D4=; b=QSywZUcA0jssJ2jLE8e9/8tsum
 DVanTLrsOW5wri3uyhXh4UJM2D+gfrdRE+6Ar35Haw11HxpEzR52r9zEw01WtVjqLiufecBPQ8DBv
 6kCuNvEnGzsA8IeX6Mwzn7FqUWvTDYCxKWOfM51Dcx6keRXmVxkWro19c3kZd1G1PVUmlUgHJ3+r1
 bLjcOoU+9zFY9mX7PxZcOwBvSaBZzdPisDNsO/k0fzrlJCG3n51aecAOk2cDXobuVG/cShmaat5AQ
 OS2t96o1MT/Io/2INuycW4Wd8/NrBKwVPH2ZAZ4FIcX22SRjYp6PyRDS6QQRqbEk/nf3E3HNqSpcm
 FbQsi1FwfVqx715fg5jPSTfgHqP7u75nKGknns5kjX99gIctE/efH+plFpxvTc4DVduqurOOe2x+F
 qswWFZ2nwBM9fxBSi/YcuYnt/z43P6kIgPRxTM4fa7oRnOZ3MoI9RTutBQPMHFJ8E82FCEtMibuBt
 1iqmORlWDIsLAd3lFCe99cyQ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1m3GPh-0002R6-Na; Tue, 13 Jul 2021 11:17:21 +0000
Date: Tue, 13 Jul 2021 13:17:19 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.14.6 Available for Download
Message-ID: <20210713111717.GA14700@carrie2.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
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


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
---------------------

This is the latest stable release of the Samba 4.14 release series.


Changes since 4.14.5
--------------------

o  Jeremy Allison <jra@samba.org>
   * BUG 14722: s3: lib: Fix talloc heirarcy error in parent_smb_fname().
   * BUG 14732: smbd: Fix pathref unlinking in create_file_unixpath().
   * BUG 14734: s3: VFS: default: Add proc_fd's fallback for vfswrap_fchown=
().
   * BUG 14736: s3: smbd: Remove erroneous TALLOC_FREE(smb_fname_parent) in
     change_file_owner_to_parent() error path.

o  Ralph Boehme <slow@samba.org>
   * BUG 14730: NT_STATUS_FILE_IS_A_DIRECTORY error messages when using
     glusterfs VFS module.
   * BUG 14734: s3/modules: fchmod: Fallback to path based chmod if pathref.
   * BUG 14740: Spotlight RPC service doesn't work with vfs_glusterfs.

o  Stefan Metzmacher <metze@samba.org>
   * BUG 14750: gensec_krb5: Restore ipv6 support for kpasswd.
   * BUG 14752: smbXsrv_{open,session,tcon}: protect
     smbXsrv_{open,session,tcon}_global_traverse_fn against invalid records.

o  Joseph Sutton <josephsutton@catalyst.net.nz>
   * BUG 14027: samba-tool domain backup offline doesn't work against bind =
DLZ
     backend.
   * BUG 14669: netcmd: Use next_free_rid() function to calculate a SID for
     restoring a backup.


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
using GnuPG (ID AA99442FB680B620).  The source code can be downloaded
=66rom:

        https://download.samba.org/pub/samba/stable/

The release notes are available online at:

        https://www.samba.org/samba/history/samba-4.14.6.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCYO12OgAKCRAoaL1+KxeT
UaZIAJ4lJX0BqUh58dHjAsof1S8vcFma0wCeNqNJzhIUHbeDAifZd393GJXDPzo=
=TZ0m
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--


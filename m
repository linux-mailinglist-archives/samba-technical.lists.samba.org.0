Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0AD36573D
	for <lists+samba-technical@lfdr.de>; Tue, 20 Apr 2021 13:12:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=AJVSSWh5ZQTptBNCiY4fUTayi+JC+A+nLWoQdXjhcPk=; b=cdMYzwOt+goniOmXiigTX/CYyo
	XwGBTTDUMOrKOBwSdvyUWePd/OgAg2KuFl7NpygPYF2wRwXESzXRGfflyXCLLMNYSO/SQAUklc0y9
	Bpo+zSwuu9354IPFjD3EwjEUTlIoMHoXMUAhlZhbLteDEooepIc3GzSPO898cAge88PkpuR6GBJ9O
	yKbQ25xXq+oiJJaIV3rJhnGecEhs3klYlNrTLaZIAqTtPGuKL1ODJ/CR3Jo9PKQkABTBCKs9sQMI8
	VNTKSFV75ItVZ5HCb8dYaINRKmwzsdZRH8PBfupG1lpuG5Zg6x4LO2VUxpJXxsAbNADwY84spnkBm
	WLHcg5rA==;
Received: from ip6-localhost ([::1]:24774 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lYoHk-00BnQA-0v; Tue, 20 Apr 2021 11:11:16 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13206) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lYoHU-00BnPS-86; Tue, 20 Apr 2021 11:11:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=AJVSSWh5ZQTptBNCiY4fUTayi+JC+A+nLWoQdXjhcPk=; b=mg9JfPtgg/KvDCEDdju6BwQwsh
 FNCOldMFmmXbBHzQZWk6Wxqxv4EM3t+03eKsaxjKDF0sZ/81WjaXHpoNfEmktVLJMJ1E3Ok19ly/B
 OlH1Eu/3PjSbgXKVzCgDFjjef5iLMuv1TnCyNa/YROPn2eA5Jy5wGnBNBhfr20a1Q8Fw/i7tbdDVK
 70hFrxZOmXUOu3O+Uzs2dnj1qWW7pKSKdOIhysIhk7xi42yb7WqXpkcUFRigiTehXb0+XlCL5V5Hp
 KUTjdvM6GT+S5+tERAheAZ7T2XdDkj/NmdpoFGNCIKC9nRqHmc20uJjnxCmtLmAy/z89f1/+8O3bl
 kozV+wSdbBRpGKt7eJPxn7SdsJU5+k3ZniuB3J1yQdp5Ot//3yzdhG8Cp4Q9VlwysddC1NadpBZGQ
 8rvS1fIdncMwhzQ8rcGz6NJYHa9AQoVBPeB2KramRopVqfGDxajTUKW9IscCqYyDR3XaT8CBmCvpW
 dpBQeVzA0mkLIifYjNyabPkD;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1lYoHT-0002qk-D2; Tue, 20 Apr 2021 11:10:59 +0000
Date: Tue, 20 Apr 2021 13:10:57 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.14.3 Available for Download
Message-ID: <20210420111055.GA21676@carrie2.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
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


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
---------------------

This is the latest stable release of the Samba 4.14 release series.


Changes since 4.14.2
--------------------

o  Trever L. Adams <trever.adams@gmail.com>
   * BUG 14671: s3:modules:vfs_virusfilter: Recent New_VFS changes break
     vfs_virusfilter_openat.

o  Andrew Bartlett <abartlet@samba.org>
   * BUG 14586: build: Notice if flex is missing at configure time.

o  Ralph Boehme <slow@samba.org>
   * BUG 14672: Fix smbd panic when two clients open same file.
   * BUG 14675: Fix memory leak in the RPC server.
   * BUG 14679: s3: smbd: fix deferred renames.

o  Samuel Cabrero <scabrero@samba.org>
   * BUG 14675: s3-iremotewinspool: Set the per-request memory context.

o  Volker Lendecke <vl@samba.org>
   * BUG 14675: Fix memory leak in the RPC server.

o  Stefan Metzmacher <metze@samba.org>
   * BUG 11899: third_party: Update socket_wrapper to version 1.3.2.
   * BUG 14640: third_party: Update socket_wrapper to version 1.3.3.

o  David Mulder <dmulder@suse.com>
   * BUG 14665: samba-gpupdate: Test that sysvol paths download in
     case-insensitive way.

o  Sachin Prabhu <sprabhu@redhat.com>
   * BUG 14662: smbd: Ensure errno is preserved across fsp destructor.

o  Christof Schmitt <cs@samba.org>
   * BUG 14663: idmap_rfc2307 and idmap_nss return wrong mapping for uid/gid
     conflict.

o  Martin Schwenke <martin@meltin.net>
   * BUG 14288: build: Only add -Wl,--as-needed when supported.


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

        https://www.samba.org/samba/history/samba-4.14.3.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCYH62ugAKCRAoaL1+KxeT
UWFEAKCuIK3OLyLxJ3xw3R3OLhZLdVMUQgCZAZC6FcxZW13hS4DgjSHyZh3btYY=
=9Xn0
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--


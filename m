Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9235C284773
	for <lists+samba-technical@lfdr.de>; Tue,  6 Oct 2020 09:37:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=PtZCWWq1BiHoDW6NVtYdWReiAuSgDmQ/rE1HNbD6MnA=; b=JCSouCQuKNV+us7Y79qj7TFLwE
	2o0U5Q/sE1y0+zm1JCKWVALdSvMqt+QVKgA2Dz+Y75SAiIjqnfrU+GLC5Bzaete1aPCuXNxBB8vSs
	qnzwh0uefVKktrDiyrm1iJCHLnScxuCdU0Nmlm+Scz6eFizf5I18r4r9Bvs1oXlcUpT3+4hyU0VS/
	2TGdt5rRJGzfnZfhjcfZ8UqcatkC6mx2La4+YThKjjZQMmfmz10Kw15gkmv6xdKNBkGdR2R5cUf2I
	qcJhPVBSWsTekMhoHouzGiA8iZkUIKdooofivUaL8zxACRfXcctZctPulUvbIFCqTxCtXaucqLhSE
	m2TGARTA==;
Received: from ip6-localhost ([::1]:40022 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kPhWX-00AvNi-CO; Tue, 06 Oct 2020 07:36:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18098) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kPhVv-00AvN2-Aa; Tue, 06 Oct 2020 07:36:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=PtZCWWq1BiHoDW6NVtYdWReiAuSgDmQ/rE1HNbD6MnA=; b=tBTqEJ0XirTzPAdnw8XE2satfO
 teeFmWuETm7aAwpE2M/C4I9bcOqjrSPoLhsrQQck3+gOFWLyEdhFAefgeP+zYgViM+IBEaOi8DLid
 69JPx6fyUAyK4XhxqjDJRvodT11JSVAkgoqpLy0YFUXmFvj+EpMU8zRgT8d+TX5jRflYdbA2470j1
 dET09yZkXmfxBh1hRGaCgcupUWR4O4JA9/S1gOj2ARj+UgMmuKN7iAp76l91PAkEI5wD+br2fEHQq
 yA4Sl3uN4m8MK3a9it8jMcOK+qsF1RZbpAgHLDJ+JDrwLK337NRpzBUHA886qHbz0t7nF2ZY5at89
 flj2WV0uWumR0HNS/j7OyXt4nlEVvJB7umE3MzEJSpU6sxNWKFLmxk5IpZoi7V7+iByC53FOLchmi
 J2Y69+zV6AZD9tkcnsKswXaOZHdr8AYmMWhB9cNgjhyIYbOD+KFVrAgcIIo+1wXdW/CY6q9B9fJyc
 CAbjzRf+gpati2Evw6daj489;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1kPhVu-0004ii-Mm; Tue, 06 Oct 2020 07:35:58 +0000
Date: Tue, 6 Oct 2020 09:35:56 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.11.14 Available for Download
Message-ID: <20201006073554.GA16692@carrie2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="LQksG6bCIzRHxTLp"
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


--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
---------------------

This is the latest stable release of the Samba 4.11 release series.
Please note that there will be *security releases only* beyond this point.


Changes since 4.11.13
---------------------

o  G=C3=BCnther Deschner <gd@samba.org>
   * BUG 14166: lib/util: Do not install /usr/bin/test_util.

o  Philipp Gesang <philipp.gesang@intra2net.com>
   * BUG 14490: smbd: don't log success as error.

o  Volker Lendecke <vl@samba.org>
   * BUG 14465: idmap_ad does not deal properly with a RFC4511 section 4.4.1
     response.

o  Laurent Menase <laurent.menase@hpe.com>
   * BUG 14388: winbind: Fix a memleak.

o  Stefan Metzmacher <metze@samba.org>
   * BUG 14465: idmap_ad: Pass tldap debug messages on to DEBUG().
   * BUG 14482: lib/replace: Move lib/replace/closefrom.c from
     ROKEN_HOSTCC_SOURCE to REPLACE_HOSTCC_SOURCE.

o  Martin Schwenke <martin@meltin.net>
   * BUG 14466: ctdb disable/enable can fail due to race condition.


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

        https://www.samba.org/samba/history/samba-4.11.14.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--LQksG6bCIzRHxTLp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCX3weWAAKCRAoaL1+KxeT
UV/qAJ0eILbTipOSZJKgeqPIuBt9bDiScQCgwybowuTEDaeoKb9uxdBC8xB8yRw=
=+vcl
-----END PGP SIGNATURE-----

--LQksG6bCIzRHxTLp--


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D78303781
	for <lists+samba-technical@lfdr.de>; Tue, 26 Jan 2021 08:52:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=jed7JKhbR82jKJn0cm5VISRB6G06vwsji2H8h/qXhWg=; b=JO0aVXUeejMBaTCLs0fi8XYUtb
	VNTezRfvR0qUswP1VGqQ+U+g2lV0Pg2zgwvn+zweKWrekVpsUPBlTYHqDY1BpzBKVDYkyJ4tP4Dlc
	eOElrejJqm4Lt/rd4zrrP/juxxbn0FAB0XZd8ZsicgM4Uw5/KPYN5aUmoULHBnlJuFweGdXZNqxgp
	XteuEzlGijuoUEpxsFAsodsqCR/leUQm6uFMi2utm4NjzDF8qv6b49ITZv61Kmw9ulTsrMpb0e9CH
	Nf111nXOwn01/8j6NwgefkqBKMtFNNAvIIfkSIenDxI7JvEJcS3n8fhQ6AOEmb21upu0YZog+OVnq
	aQudhgpQ==;
Received: from ip6-localhost ([::1]:39240 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l4J8g-0078ft-Ql; Tue, 26 Jan 2021 07:51:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33426) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l4J8J-0078fC-UC; Tue, 26 Jan 2021 07:51:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=jed7JKhbR82jKJn0cm5VISRB6G06vwsji2H8h/qXhWg=; b=BmIszR5gUXtC7QelEyFCn5G/LY
 fN4xlT9OhdZGfH5vD04/e7h0GgxKrnRc9GF2sWZFLnMoZZhotikxCec6IEXUsAFWcTK/LdBVNed6t
 8RSFpD3fj1hn9KZbj2ItB/INIMjnlUeptNi+L9aHAgwwUbfEJZvEu/rh6MWNq+AkeqSDK9CIzByeK
 7GIq5JuNlzMZgKmcHM0xPOzxDNE/v3TqHysM0twbQ0Y4QSvAtCvYv/UGfbb+/H/Nls6SpQ3W1/04J
 VZuO3ArDoeFt9Eck6n+FyorKns1JR7Vr/xwUJXxnMSxdLIlPvRY0oLr0EmmcSnBBb7KAGoWfk6PyO
 nTa+k7C/bMsednmbKPYflwGSsj6EE4+w/7VZh6wDHQ/xtAQQS3F9vxBgNrqZuL82+mfhlQB8slHrx
 enCs0P0onXsUmhkGn0ZX6soEesXgM+c5vfzes2SoBnDJh+/jkm/nQwV1MUoe2zFs6TLJ4QQZVeA0n
 Tr0L1NhS+ls26w6oeMQmRAdj;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1l4J8I-0006ZU-Sb; Tue, 26 Jan 2021 07:51:26 +0000
Date: Tue, 26 Jan 2021 08:51:24 +0100
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.13.4 Available for Download
Message-ID: <20210126075122.GA9182@carrie2.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
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


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
---------------------

This is the latest stable release of the Samba 4.13 release series.


Changes since 4.13.3
--------------------

o  Jeremy Allison <jra@samba.org>
   * BUG 14607: Work around special SMB2 IOCTL response behavior of NetApp =
Ontap
     7.3.7.
   * BUG 14612: Temporary DFS share setup doesn't set case parameters in the
     same way as a regular share definition does.

o  Dimitry Andric <dimitry@andric.com>
   * BUG 14605: lib: Avoid declaring zero-length VLAs in various messaging
     functions.

o  Andrew Bartlett <abartlet@samba.org>
   * BUG 14579: Do not create an empty DB when accessing a sam.ldb.

o  Ralph Boehme <slow@samba.org>
   * BUG 14596: vfs_fruit may close wrong backend fd.
   * BUG 14612: Temporary DFS share setup doesn't set case parameters in the
     same way as a regular share definition does.

o  Arne Kreddig <arne@kreddig.net>
   * BUG 14606: vfs_virusfilter: Allocate separate memory for config char*.

o  Stefan Metzmacher <metze@samba.org>
   * BUG 14596: vfs_fruit may close wrong backend fd.
   * BUG 14607: Work around special SMB2 IOCTL response behavior of NetApp =
Ontap
     7.3.7.

o  Andreas Schneider <asn@samba.org>
   * BUG 14601: The cache directory for the user gencache should be created
     recursively.

o  Martin Schwenke <martin@meltin.net>
   * BUG 14594: Be more flexible with repository names in CentOS 8 test
     environments.


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

        https://www.samba.org/samba/history/samba-4.13.4.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCYA/J+AAKCRAoaL1+KxeT
UQDAAKCES+zmy2cbo4JH30WWcO/N5LsX8QCfUoZ/9PipvCl30rSWJglgRoVTmew=
=N/cX
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--


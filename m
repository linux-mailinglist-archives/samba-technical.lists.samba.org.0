Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D02F3118303
	for <lists+samba-technical@lfdr.de>; Tue, 10 Dec 2019 10:07:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=o2P5VKa/5wv3zT1f/rH2gPbrbN9mTH1LO++x9huy8BI=; b=A/eeg/rDOZSfnpK/lsd6pFBv4k
	pEEaLuQOkQDX6D9seYMkxTjBS4uOd9Uxzx5TfWKliWdsGdNHBE2ajxV7JFMx9jy4naTqzDFFnUCUR
	a6zuLLqapqqtvHzNXtgFbcYhq/aMzRRpSLe3RyfgH3X8gJ0tVMaza1jNP/OhaUVc/UK/iPD4fyEAY
	EPtQ93e3lP4aGsSGM149WpAF5x/wCZcfihnhBEaKyd3Xsg8VFSDvH6IcFPZ2AEQurhptA1D7EtMDq
	2Fflq2t36NnL/Ik4AIaIt+FY36QRM949aaQxFh8b61jPZEdpUA+a4efOokkAgtc83BLfhb+e4TLwj
	xWin45oA==;
Received: from localhost ([::1]:28266 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iebTt-006eKH-K8; Tue, 10 Dec 2019 09:06:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55916) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iebTg-006eJb-SZ; Tue, 10 Dec 2019 09:06:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=o2P5VKa/5wv3zT1f/rH2gPbrbN9mTH1LO++x9huy8BI=; b=j9Qf28zObJUUMKqoaX+1UXKDPZ
 YQt9pT46el031ok3QujZ8h8JZ0hAfbWm2M1tS6xxYBTZyK9MzjvknjZ9ccNZoDRLIUM4efe9joqe2
 ZfS3dCNSic/FVUDXieIpu/h772yDSvg5Sr11K1ytgCGpavpIKtGOGrDNNho/33eNnxFxje3ne9LZ9
 o0kOmKFZ+AdJoh6a3S24dYnUIO0wNKtm2ZoLXfmZFNIY5uf+a1qdewGbTqoWD5JHt586Rlw3P4/Za
 kMnUrs6cYVSnqs8Nl+bVhMPESXAvsjY/PoXSZ+rgW2Mgv4C3h9qLkLJ6TXNoLidCK3DzAAK0pq22C
 Fzsdup59oyKNfDNm7cGjkrPc5H22fJH4ng2GDl4qAd02dMnjmGxvlLeaCBsw8Aa9R9u7KrO32X38S
 7dCqAHglgY11rrxJImvMekxd3SEjpKaBfo3bwTC+Nk3b7Dk4RvviBp9JHZ2Qq8wNbkGom3xEggBfy
 GnyNLAplULOpstHFvL6GGMTD;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iebTg-0005Fs-F6; Tue, 10 Dec 2019 09:06:44 +0000
Date: Tue, 10 Dec 2019 10:06:42 +0100
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.11.3, 4.10.11 and 4.9.17 Security Releases
 Available
Message-ID: <20191210090640.GA12719@carrie2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="CE+1k2dSO48ffgeK"
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


--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
---------------------

These are a security release in order to address the following defects:

o CVE-2019-14861: Samba AD DC zone-named record Denial of Service in DNS
		  management server (dnsserver).
o CVE-2019-14870: DelegationNotAllowed not being enforced in protocol trans=
ition
		  on Samba AD DC.


=3D=3D=3D=3D=3D=3D=3D
Details
=3D=3D=3D=3D=3D=3D=3D

o  CVE-2019-14861:
   An authenticated user can crash the DCE/RPC DNS management server by cre=
ating
   records with matching the zone name.

o  CVE-2019-14870:
   The DelegationNotAllowed Kerberos feature restriction was not being appl=
ied
   when processing protocol transition requests (S4U2Self), in the AD DC KD=
C.

For more details and workarounds, please refer to the security advisories.


Changes:
--------

o  Andrew Bartlett <abartlet@samba.org>
   * BUG 14138: CVE-2019-14861: Fix DNSServer RPC server crash.

o  Isaac Boukris <iboukris@gmail.com>
   * BUG 14187: CVE-2019-14870: DelegationNotAllowed not being enforced.


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

        https://www.samba.org/samba/history/samba-4.11.3.html
        https://www.samba.org/samba/history/samba-4.10.11.html
        https://www.samba.org/samba/history/samba-4.9.17.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--CE+1k2dSO48ffgeK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCXe9gHQAKCRAoaL1+KxeT
UZy3AJ44+8KANVh+/aIEXemWMpRjdyRZFACgkFSlN/mmf+TLSf8bPTM+/H2Z+SM=
=BMih
-----END PGP SIGNATURE-----

--CE+1k2dSO48ffgeK--


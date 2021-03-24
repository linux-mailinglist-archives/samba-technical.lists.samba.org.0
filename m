Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF1C3477D4
	for <lists+samba-technical@lfdr.de>; Wed, 24 Mar 2021 13:03:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=jI3TkPubW2eDBDBAT49w2E2Af4I4plOs9nCR0WEpuiU=; b=nIDSVxsP+oIB4Rd9c/w68FIVkY
	7MqY/F0sePQPqyjPlj8t8b9FteyLJY/RBnXbuut75wZVU7mfW52Tqcounjw1ltlNeLGG4rUIQuWO0
	MuTfjRaOtWxrgcYzkNp7cfXxot76W+n9FPKietvtaNWvszE881voOSOcccgO1ugqjsc7rPBUnWEO5
	EsAOZBtJVo2Kooum+uc0Gc+n9UDloQwKMDuGbHtHTJK4eV/Gy1Jw+yxwbBBP6L4J5amVtFEiNugPc
	IfwyzPAldUyMbwAGMtbQjnYGNCa1e4fwp59ysLoMnDsYBCqYq0c/JTIZqFW6HvlNhPyspAlhJVIhH
	YDR6px4A==;
Received: from ip6-localhost ([::1]:23006 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lP2DV-006ZqW-GA; Wed, 24 Mar 2021 12:02:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23180) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lP2DJ-006Zpp-FD; Wed, 24 Mar 2021 12:02:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=jI3TkPubW2eDBDBAT49w2E2Af4I4plOs9nCR0WEpuiU=; b=MfEpz/xOdEEjR+2ek/Seug4n36
 t+QhW+0rI78UypA3fJcpth85yiN9S1ZQ1Rnh9AaLvWQqxjd3JNPr4NKgpxhdYAqabBIp1EQfWNmBg
 kqGwHD5xrNwYsmQYLa1LnvXDq4V+3iz3fjrDgQpS8Ohz4BBAOk25ReJk5RP34zOrYGJ1x9g1g1aqg
 abtv/piNCoVxv/2QW0Fz28dzzzCbjtpNnnrzk9dROhmzPz+luvkv7Ft/yUI0PBEkAQdo4yf9dcbtY
 7rYAVVWNLpPy22kDE+owV1xpYZsAx9l8YoBVtoNKZUsaaP7nw54nWJnlI1XWKNNfezukuWVqEd9Nv
 iorpSP65Q2UwQwkZ+qtni1MZgeUZnuWykBrAx9s965XaROI6vt04rm+5PAnojjGofZ+0Nbl7TRL1J
 dK7hx7oSYPqMZaE6dbIs7u1qcr8wWRQhuFGDaHSicng5ynd63kXY3ORmg7Z4shD13R0cgLTbxfnoo
 JAugC0zUzmCs8L6TOGX3uKUM;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1lP2DI-0003GR-Tf; Wed, 24 Mar 2021 12:02:16 +0000
Date: Wed, 24 Mar 2021 13:02:14 +0100
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.14.2 (4.14.1), 4.13.7 (4.13.6) and 4.12.14
 (4.12.13) Security Releases
Message-ID: <20210324120212.GA26954@carrie2.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
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


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
---------------------

These are security releases in order to address the following defects:

o CVE-2020-27840: Heap corruption via crafted DN strings.
o CVE-2021-20277: Out of bounds read in AD DC LDAP server.


=3D=3D=3D=3D=3D=3D=3D
Details
=3D=3D=3D=3D=3D=3D=3D

o  CVE-2020-27840:
   An anonymous attacker can crash the Samba AD DC LDAP server by sending e=
asily
   crafted DNs as part of a bind request. More serious heap corruption is l=
ikely
   also possible.

o  CVE-2021-20277:
   User-controlled LDAP filter strings against the AD DC LDAP server may cr=
ash
   the LDAP server.

For more details, please refer to the security advisories.


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

        https://www.samba.org/samba/history/samba-4.14.2.html
        https://www.samba.org/samba/history/samba-4.13.7.html
        https://www.samba.org/samba/history/samba-4.12.14.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCYFsqQQAKCRAoaL1+KxeT
UVCZAJ4sisnqKCjsPqnIK+nJV+vZV02hwgCaA+fPyTaIZC5Mpyvj6LMN4J6cLF8=
=SATv
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--


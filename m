Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA45211F10
	for <lists+samba-technical@lfdr.de>; Thu,  2 Jul 2020 10:43:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=EDr6/MUc8uq8WvOaf+892N/7Yd3TSrJCHQnn/OiC6sE=; b=eOAo3FJ/QpPEKC/2OBNnOPzhug
	gikQThT/2fLGMLH4WuM6GBcN+C/3+MRj2T6NCJ2/70EsLTvwcMcE0sHr1k0wqy/+PFFC7MmVt48B8
	KWuu8aSNWYQpPOZ/HYbCnl/TrXSe5Mik1YFPH+iCXG0HIi/J7IpRAjoLCFlWE4+JbL5+l0uEy+zsb
	Uimvu+EeNljSDGuac8Iq+NKeV8SqPgdS1wuTRkArij5hCzNdLbvHdty/LeCOaknmG9smCySTM0XHA
	g3yn0+PfDV+8ADS7/QBPbUuztxgkUqun8sDMw9UxMmF7YYLzNLX2m7B58WhAy+LWJbW0Xkh3KH4XU
	jdfx9vWw==;
Received: from localhost ([::1]:63392 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jquns-00518t-Qx; Thu, 02 Jul 2020 08:42:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33822) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jqunO-0050zO-Ld; Thu, 02 Jul 2020 08:42:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=EDr6/MUc8uq8WvOaf+892N/7Yd3TSrJCHQnn/OiC6sE=; b=TzYuN+hPoC3hwp3hfN9+7Hc99/
 ZquoDgwGnv0u1fq63omDVhE5bAm6A1ER622oJeVJtn0I1od3SQJ1Wt6jt2X0xQdWsP6jNOtX0tPWt
 Q3vg+fLgadU8qdH40f/jDqTAB7/UhPDfaN+Kr/JJazhHWOtIGb3WpDZcfLZjDIjlWg11f1MHoD06Q
 jJJ7PxvE/chPa//rCriFZtLPTmXoD5u5DBXyDJRLqgng9A5njiFLSM6mgt4Q+2Sh2XGwmXpZZ/1rY
 D9jBUXIICGsIvmHRIe+PPNSpa/XYjs2CsLJbEweGfQKokvTWMm+SObOOvXmFqs7Im0ZzhFvVtXdWy
 1MUkyFgcaenZ4psj3/iMDRkH7OewLg2B0IWcK2B4lH8yWesf+NWKuocHMFK4VYQHErfJEIdHBYgkl
 Kbhco5pDFHZqUD3sncHcxc2onJeEIi9ORyAR4TBE87HA4n0nxXKXAAgBTRNKIG78h7ssKtaCJl2aM
 IDew9RZ2axcPmHp1WETH6Y6m;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jqunO-0003oO-4K; Thu, 02 Jul 2020 08:42:14 +0000
Date: Thu, 2 Jul 2020 10:42:12 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.12.4, 4.11.11 and 4.10.17 Security Releases
 Available
Message-ID: <20200702084210.GA11752@carrie2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
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


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
---------------------

These are security release in order to address the following defects:

o CVE-2020-10730: NULL pointer de-reference and use-after-free in Samba AD =
DC
		  LDAP Server with ASQ, VLV and paged_results.
o CVE-2020-10745: Parsing and packing of NBT and DNS packets can consume
		  excessive CPU
o CVE-2020-10760: LDAP Use-after-free in Samba AD DC Global Catalog with
		  paged_results and VLV.
o CVE-2020-14303: Empty UDP packet DoS in Samba AD DC nbtd.


=3D=3D=3D=3D=3D=3D=3D
Details
=3D=3D=3D=3D=3D=3D=3D

o  CVE-2020-10730:
   A client combining the 'ASQ' and 'VLV' LDAP controls can cause a NULL po=
inter
   de-reference and further combinations with the LDAP paged_results featur=
e can
   give a use-after-free in Samba's AD DC LDAP server.

o  CVE-2020-10745: Parsing and packing of NBT and DNS packets can consume
   excessive CPU.

o  CVE-2020-10760:
   The use of the paged_results or VLV controls against the Global Catalog =
LDAP
   server on the AD DC will cause a use-after-free.

o  CVE-2020-14303:
   The AD DC NBT server in Samba 4.0 will enter a CPU spin and not process
   further requests once it receives an empty (zero-length) UDP packet to
   port 137.

For more details, please refer to the security advisories.


Changes since 4.12.3
--------------------

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
   * BUG 14378: CVE-2020-10745: Invalid DNS or NBT queries containing dots =
use
     several seconds of CPU each.

o  Andrew Bartlett <abartlet@samba.org>
   * BUG 14364: CVE-2020-10730: NULL de-reference in AD DC LDAP server when=
 ASQ
     and VLV combined.
   * BUG 14402: CVE-2020-10760: Fix use-after-free in AD DC Global Catalog =
LDAP
     server with paged_result or VLV.
   * BUG 14417: CVE-2020-14303: Fix endless loop from empty UDP packet sent=
 to
     AD DC nbt_server.

o  Gary Lockyer <gary@catalyst.net.nz>
   * BUG 14364: CVE-2020-10730: NULL de-reference in AD DC LDAP server when=
 ASQ
     and VLV combined, ldb: Bump version to 2.1.4. =20
  =20

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

        https://www.samba.org/samba/history/samba-4.12.4.html
        https://www.samba.org/samba/history/samba-4.11.11.html
        https://www.samba.org/samba/history/samba-4.10.17.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCXv2d4AAKCRAoaL1+KxeT
UfwXAJwKKyEbIrT6XOmQxO5iWpIC3r2KMQCeOKkMiqA0pVSPCFAJIeiyqtweK8A=
=0OHk
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--


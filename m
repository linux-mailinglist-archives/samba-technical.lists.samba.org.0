Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E37C1BB886
	for <lists+samba-technical@lfdr.de>; Tue, 28 Apr 2020 10:11:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=bzX9+cGYpK6TKFNJJ5f359y1FbdXZoDd/iWVROlP0gY=; b=0kuEbU04ZKSytZ4VOdYICAx0B3
	WtGKzZJxGLwrT6A2B4edeXI7YjodCujPy0O8uA7w1KpaaPZi0AHUxgJQhWWRgVt+1UpDpLZRY6rjZ
	ArDsrmV7xpUJdHonzC2/y2tsAjNL3yyxq0dl11tol3VuZZACNzpA5BIXMBbS8dtl4bKWZi3aYamBl
	lY5/mbTdh2V4tua1pMrs69r+90pmkWek4f1ajMiV3dsf8QJmote2KShn3dBSzC9eI1LXuDKa+FCcA
	qhZW6VExYBljwW69ZWCCq/X+oZSJL7aoz/ODf9jz46ffrva526u4aXsFJA9Rc9mM/D0LERUYruKK2
	sJhxQN9g==;
Received: from localhost ([::1]:25602 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jTLKj-002GQo-Qc; Tue, 28 Apr 2020 08:11:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56920) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jTLKP-002GQ8-J2; Tue, 28 Apr 2020 08:10:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=bzX9+cGYpK6TKFNJJ5f359y1FbdXZoDd/iWVROlP0gY=; b=iOvRJkGWSY0D3OrT7Y0zOIAB1o
 TedIXRwn8D9UeiyD541vqfpWbHgO6Z6c4TkcWQCkHpztkPYMb7jNHJyhxtE1JFLpPVYg8LpS/upgZ
 UiLqhPUfcaOJlEzBcKCc1xmC5Wg/UtaB1AIFgfN2nUJyQ2p93QhBXaMvF1Wtt0+ue3wmtSfX+nhWN
 VmUlirT11iUd7ZUWvgw8SztzJTGVzbY0xS1ync4P75QkvVmF9/yBOxjMH/A467IS8azf9a+fEMWKV
 p1ddEIHV7TENbCyxEa6PMFyIDVdel7cVk1yZUPbR44hoCcXF9N7Vfmohmp4rVbl5GzqasU/ZMclCR
 MZoLzhNfYt+qDYiZ7dFeppH5cagJ0R/T7w2GkK3yMPpq8FV3xuudLF7dEeejbD94sRytbY3Y7QzwC
 q+1M0knTyhkBolhGLpTt/37wm2FIo1/oKd2Iz7ncklqwvYsGt3QH6YILDto3HjleSKA1jxY0ud9lm
 yRxsAfvrs2YHfIORyGBh4VLG;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jTLKP-0002pX-6X; Tue, 28 Apr 2020 08:10:53 +0000
Date: Tue, 28 Apr 2020 10:10:51 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.12.2, 4.11.8 and 4.10.15 Security Releases
 Available
Message-ID: <20200428081049.GA11078@carrie2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
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


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
---------------------

These are a security releases in order to address the following defects:

o CVE-2020-10700: Use-after-free in Samba AD DC LDAP Server with ASQ
o CVE-2020-10704: LDAP Denial of Service (stack overflow) in Samba AD DC


=3D=3D=3D=3D=3D=3D=3D
Details
=3D=3D=3D=3D=3D=3D=3D

o  CVE-2020-10700:
   A client combining the 'ASQ' and 'Paged Results' LDAP controls can cause=
 a
   use-after-free in Samba's AD DC LDAP server.
o  CVE-2020-10704:
   A deeply nested filter in an un-authenticated LDAP search can exhaust the
   LDAP server's stack memory causing a SIGSEGV.

For more details, please refer to the security advisories.


Changes:
--------

o  Andrew Bartlett <abartlet@samba.org>
   * BUG 14331: CVE-2020-10700: Fix use-after-free in AD DC LDAP server when
     ASQ and paged_results combined.

o  Gary Lockyer <gary@catalyst.net.nz>
   * BUG 20454: CVE-2020-10704: Fix LDAP Denial of Service (stack overflow)=
 in
     Samba AD DC.


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

        https://www.samba.org/samba/history/samba-4.12.2.html
        https://www.samba.org/samba/history/samba-4.11.8.html
        https://www.samba.org/samba/history/samba-4.10.15.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCXqfk/wAKCRAoaL1+KxeT
Uf1iAJ0X7WM2DanF8GpGi5TjeaVgdZgWdgCfdbCk5ZeTtA5ulK7m7U8QXDli6Hw=
=p6Ot
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--


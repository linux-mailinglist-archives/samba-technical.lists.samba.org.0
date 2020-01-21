Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEF9143A14
	for <lists+samba-technical@lfdr.de>; Tue, 21 Jan 2020 10:57:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=A1/zmSI3OtDuEQo/Qreg2J3U9lOsvTXeNNo5AOlCQH0=; b=LKvmo6uu62T4GGuHbWBm22NMhp
	lDTUoqRl7LowaeHTvQNcdZX66Q6WHYcij7Dondir0EzAVyHN22urMOeoDwA6+mM4RwzYmkMxLMTwa
	eUhzUmnrEmQSKTubSS7g2wBxsKN+grA8A/SZVrPZ0o0wgwggnZZK4tK/bSFVmPA/nWa6KiS30wv1o
	BSLlJt2H77yVdjgtc7Ia74jl0lInCektHJW0BPxmD+jqnS8ZCwgjVzp3Wd3bZ9t3woxn0IZyWHcV6
	gY6qAFPxbnfvzASBUBKoRXvdeIsoNRCo6vz4GooCflLpvH6A6034ZSVNiFJSBlEv1x4kpyaXYCuFf
	YqKX5IJw==;
Received: from localhost ([::1]:50748 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1itqHJ-003ztU-2C; Tue, 21 Jan 2020 09:56:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58806) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1itqHA-003zsm-K4; Tue, 21 Jan 2020 09:56:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=A1/zmSI3OtDuEQo/Qreg2J3U9lOsvTXeNNo5AOlCQH0=; b=XhZ8ah7Zo1vGU9pw3RFV2Vl4ZJ
 YJxs7VHCxCmBFUvYxyYkUDIJCSxxd5wIPP37BUJZQY7Imhg5A1YzABx1gd+pw8XQgJefKZQm9BP1L
 rQw+SqXnDr1SQVK7y1Z3TOg6s8feDA2TJlNK3f75Vt+/WspomcG0bZ7Z8xlGJeyfNuYC+MZz7SHlV
 eHY47VWnqUzHoECHa027N67S16TsbSySc+7vQTOL14sqdStscXWtUwN91/rFlr53hPf1FY9FGSXvV
 j0ULZv9n8aQce5mStSU9x/OabLboPN/CFONesMENdUhpitzxsVzRZ8BvbRFUvtpSx/pMAp8Im6YgI
 iNYEubH7IhbjT7DX5XIPuwFlrG2bjh3SybMNa42aLb2hHjfUtAiBbOQOKn6oiiL/GZH8yvwDkeopO
 dWrSjwcBzvphxn55nSHfgV84hNmaY83Yt0+SqBLy+Yu0hw9FfaLvFholzPzR8fh9PE58UE1Uq13nd
 nsPvpWZp7RT1MCKjj6fWGxj+;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1itqHA-00007M-3u; Tue, 21 Jan 2020 09:56:48 +0000
Date: Tue, 21 Jan 2020 10:56:45 +0100
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.11.5, 4.10.12 and 4.9.18 Security Releases
 Available
Message-ID: <20200121095643.GA8032@carrie2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
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


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
---------------------

These are security releases in order to address the following defects:

o CVE-2019-14902: Replication of ACLs set to inherit down a subtree on AD
		  Directory not automatic.       =20
o CVE-2019-14907: Crash after failed character conversion at log level 3 or
		  above.                                              =20
o CVE-2019-19344: Use after free during DNS zone scavenging in Samba AD DC.
                                                                           =
    =20
                                                                           =
    =20
=3D=3D=3D=3D=3D=3D=3D                                                      =
                  =20
Details                                                                    =
    =20
=3D=3D=3D=3D=3D=3D=3D                                                      =
                  =20
                                                                           =
    =20
o  CVE-2019-14902:                                                         =
                      =20
   The implementation of ACL inheritance in the Samba AD DC was not complet=
e,
   and so absent a 'full-sync' replication, ACLs could get out of sync betw=
een
   domain controllers.=20

o  CVE-2019-14907:
   When processing untrusted string input Samba can read past the end of the
   allocated buffer when printing a "Conversion error" message to the logs.

o  CVE-2019-19344:                                                         =
                      =20
   During DNS zone scavenging (of expired dynamic entries) there is a read =
of
   memory after it has been freed.

For more details and workarounds, please refer to the security advisories.


Changes:
--------

o  Andrew Bartlett <abartlet@samba.org>
   * BUG 12497: CVE-2019-14902: Replication of ACLs down subtree on AD Dire=
ctory
     not automatic.
   * BUG 14208: CVE-2019-14907: lib/util: Do not print the failed to convert
     string into the logs.

o  Gary Lockyer <gary@catalyst.net.nz>
   * BUG 14050: CVE-2019-19344: kcc dns scavenging: Fix use after free in
     dns_tombstone_records_zone.


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

        https://www.samba.org/samba/history/samba-4.11.5.html
        https://www.samba.org/samba/history/samba-4.10.12.html
        https://www.samba.org/samba/history/samba-4.9.18.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCXibK1wAKCRAoaL1+KxeT
UawKAJ95lnMB/g06GNXubVVS0eOKHDou2QCgiTqr5urPPLFk+P1YIjKvJcOsYzs=
=qQcb
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--


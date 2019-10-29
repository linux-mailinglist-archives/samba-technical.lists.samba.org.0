Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 86507E84AB
	for <lists+samba-technical@lfdr.de>; Tue, 29 Oct 2019 10:46:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=t5X2QULHcclP1ZE3iEn196JZxL2P5kbiOS3a+vePxf0=; b=ghFFe8PdDkCifDc9PlNrNBnQcn
	dQVYdxNAG40J6flVK5TLEQrlVPIqAPdJWqEAf3gE1oAdKTNTbfE6O5gxpkBn1HsO9PRK59ItPiQde
	79FjHuQ9i6r4WWuh0abNDSxQjZkpbdEnyUGBvUykipE9t+EAYT92oLLyhDAzjyy0KFqhTumN6CjU9
	1UOuGohSy8+p3YPlBgdS173k5SvJlkhUSmFRPi3lQzz7UjpXkfOS7/7NUljfbxVtQ5dwdM7P0qoFz
	mkDze8Z+ZArSPV3iYlhDjv+AZ21EXe8/prC/sZdSKgi4a02uNy6/K27RN7Rm0woolVK7EFIE/SLkB
	J9CpBPeQ==;
Received: from localhost ([::1]:40702 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iPO4Y-0038H0-7H; Tue, 29 Oct 2019 09:45:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11844) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iPO4Q-0038GK-IT; Tue, 29 Oct 2019 09:45:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=t5X2QULHcclP1ZE3iEn196JZxL2P5kbiOS3a+vePxf0=; b=ukTMydz9tLUtvtIxHjH9UxB99r
 sJMV+dcKbtjWyZk2zPqJ6Bn1P/LRj74bGIXQwjx8I5ED1tmhuyjLzJExILp2uCAzQTZpXXdPBmNBk
 ds/ryy1HrAeyeufLxobkgpWRKym8tQ9FMKKe4gnz20/0hzYMqh4h0zyvjgFoh3bNaoe1ycwKvnb+5
 TeqmVR4v8ePPMV1bFdGmjWyCcWCsoaYiiqDqVdIlXtoKymtJC2k1+PmPeQu3qs46gIFOKW+kcLThH
 pcUa3YGkvqfvKRJe44b1peJgi8PwtAjGHD4raVtlNHBlJPgLzcDHWtEXSBZwIH/g2qn6llALZfEMI
 0aEuzt4c0+YGb6/EwwzLuXOcCEFyHceE67PzrOZ2KPVuNAfxLZVoL35H3QqlsOA1I/2A1UW8ZAZlB
 oJSpHQgkMvj44SJ/20Q4ZgjZM1WqNH/eQkDTP6m9JcZXvvxnXEOe20b+ypamT0gLWFmhc2kMqhSvD
 N/OqopM5Y9/yWfQwO0yQVEuA;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iPO4P-0004a1-Nx; Tue, 29 Oct 2019 09:45:45 +0000
Date: Tue, 29 Oct 2019 10:45:44 +0100
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.11.2, 4.10.10 and 4.9.15 Security Releases
 Available
Message-ID: <20191029094542.GA9986@carrie2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
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


--huq684BweRXVnRxX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
---------------------

These are security releases in order to address the following defects:

o CVE-2019-10218: Client code can return filenames containing path separato=
rs.         =20
o CVE-2019-14833: Samba AD DC check password script does not receive the fu=
ll
		  password.
o CVE-2019-14847: User with "get changes" permission can crash AD DC LDAP s=
erver
		  via dirsync.

=3D=3D=3D=3D=3D=3D=3D
Details
=3D=3D=3D=3D=3D=3D=3D

o  CVE-2019-10218:
   Malicious servers can cause Samba client code to return filenames contai=
ning
   path separators to calling code.

o  CVE-2019-14833:
   When the password contains multi-byte (non-ASCII) characters, the check
   password script does not receive the full password string.

o  CVE-2019-14847:
   Users with the "get changes" extended access right can crash the AD DC L=
DAP
   server by requesting an attribute using the range=3D syntax.

For more details and workarounds, please refer to the security advisories.


Changes:
--------

o  Jeremy Allison <jra@samba.org>
   * BUG 14071: CVE-2019-10218 - s3: libsmb: Protect SMB1 and SMB2 client c=
ode
     from evil server returned names.

o  Andrew Bartlett <abartlet@samba.org>
   * BUG 12438: CVE-2019-14833: Use utf8 characters in the unacceptable
     password.
   * BUG 14040: CVE-2019-14847 dsdb: Correct behaviour of ranged_results wh=
en
     combined with dirsync.

o  Bj=C3=B6rn Baumbach <bb@sernet.de>
   * BUG 12438: CVE-2019-14833 dsdb: Send full password to check password
     script.


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

        https://www.samba.org/samba/history/samba-4.11.2.html
        https://www.samba.org/samba/history/samba-4.10.10.html
        https://www.samba.org/samba/history/samba-4.9.15.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCXbgKRAAKCRAoaL1+KxeT
UdXwAKCK2Imbm9RV5isSw+2LhnNSbzSTcgCgij3VLQrVHGEzsLnR5N9MNz37upI=
=9NGk
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8B34B2E9
	for <lists+samba-technical@lfdr.de>; Wed, 19 Jun 2019 09:14:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=E0BtctaZnFR2Ira/0PTn/vS2XGdBQ6l3e6nfqHjw0qc=; b=XGUyEirCOnfDESR+qR90n9t3xu
	sGXCfj7WSWPtAoCWQHHYjNUK+mZ3aNFHfIrd3qL2eFG3QL79zu1HL09ZoeZZGUpQdWWaWE5jL2456
	nNDqL/OrX6XfK91b7aZEpE96nW6wjWuLx8fxqsnaa90VfWcYGR9vwJVukZPNzgnZ6wDhTZGAZ9uk0
	wrA5WY+iwyf+Y2NoWbxGjE8Tdl/KpJf4QL6BtO4oJW9iw/difp2PUcP1aaBHv8Dw9XgrborzMQYLJ
	YFYFABVPQ5cAJakWLtVhZnxRz49pG7k2tfLfjK79ekTzM0ijnHHqZAKKlOW589nRGZ8Rm3FBCiB5u
	qMvpQKLg==;
Received: from localhost ([::1]:30558 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hdUnA-000I5W-Fi; Wed, 19 Jun 2019 07:14:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24596) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hdUmq-000I4q-BG; Wed, 19 Jun 2019 07:13:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:To:From:Date:CC;
 bh=E0BtctaZnFR2Ira/0PTn/vS2XGdBQ6l3e6nfqHjw0qc=; b=XBJlf9e/YY0FsZ/4YMczpX48oJ
 ct3dNCCUTef2b+vIqFvMSaEJNmB78BE/qLB+IpAW+ih8oe5Z41kjbu2VgPcWaRrVDb22cg5q9k/Wg
 po+hp1Dyc+n2sUoO/tnICD72F4k1Pc44w1lgyZiskaioRRIty1SFSlrQXU5rRTwa0GXI=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hdUmp-0005fT-Ru; Wed, 19 Jun 2019 07:13:39 +0000
Date: Wed, 19 Jun 2019 09:13:38 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.10.5 and 4.9.9 Security Releases Available
Message-ID: <20190619071336.GA6911@carrie2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
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


--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
---------------------

This is a security release in order to address the following defects:

o  CVE-2019-12435 (Samba AD DC Denial of Service in DNS management server
                  (dnsserver))
o  CVE-2019-12436 (Samba AD DC LDAP server crash (paged searches))

Please note that Samba 4.9 is affected by CVE-2019-12435 only.

=3D=3D=3D=3D=3D=3D=3D
Details
=3D=3D=3D=3D=3D=3D=3D

o  CVE-2019-12435:
   An authenticated user can crash the Samba AD DC's RPC server process via=
 a
   NULL pointer dereference.

o  CVE-2019-12436:
    An user with read access to the directory can cause a NULL pointer
    dereference using the paged search control.

For more details and workarounds, please refer to the security advisories.


Changes:
--------

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
   * BUG 13922: CVE-2019-12435 rpc/dns: Avoid NULL deference if zone not fo=
und
     in DnssrvOperation2.
   * BUG 13951: CVE-2019-12436 dsdb/paged_results: Ignore successful results
     without messages.


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

        https://www.samba.org/samba/history/samba-4.10.5.html
        https://www.samba.org/samba/history/samba-4.9.9.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCXQngnQAKCRAoaL1+KxeT
UUqlAJ9aOWqHd5Qr51dFCki+cmXwb7PF0gCdFzqozykf0c+GmdbarWVwKDqtvMo=
=0xI5
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--


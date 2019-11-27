Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 348ED10AE3D
	for <lists+samba-technical@lfdr.de>; Wed, 27 Nov 2019 11:55:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=RVEbJOlQYFXLVHPjOjqf+TCvjlzJU2hC/eXJTJryGMQ=; b=Kzrl/61gX217xHlmM8oEVLqmJS
	0YJexRRjUItqcvPE6JyPNU3oWexlUKfNNp1eW6eW4wD4PhhUW9jNRFIQVxaE+508gNLDaaH9HKU6K
	24zr2kxQdlTwI2ezHeHEMdA821I6zfl0r1ECMIf0YqMYzdynzEDmYFFrexhPDjVmV6zHJSg+k/7wV
	OkQS95YKBK1qslY57Bo+nmuWFIFwTCkM/r3Uf8B7rzel/ygSNaYOl3dZA/ZRY+XZZScUnm/EUSrBq
	cFJ7c+Yba4BukcM82KVPGVBtJM5DAawmQIaez08mXU5EfYZ0wmESvKM1jG0aStt9P1WPWVCC3ikYS
	4YhQ0JzQ==;
Received: from localhost ([::1]:36884 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iZuxq-002epr-9k; Wed, 27 Nov 2019 10:54:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:19162) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iZuxh-002epA-33; Wed, 27 Nov 2019 10:54:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=RVEbJOlQYFXLVHPjOjqf+TCvjlzJU2hC/eXJTJryGMQ=; b=NoEDTLSjH2qUxOvyEFZTnSHIrJ
 rXHHEnY21LFS6GSSWrQ5mpvTNlk+4/6xzzSFHkrohuTQ/a9RjmIGqsS47C7O+F3Uxh4BM9H2viCR7
 4rsU/kLJfCDI+rTTGpxKUcerwP3HBi6oMv6CsNhG8N7gw6xu5rykmuMirrE1nywC9+H1E5ULwCouU
 dfR/MCQL2HbgwA75ClP53ysd+7gHzoRX2Pv07kF7PQ8JU6n33DHS9Vwr7OuVu5ectjRlwaPg0lnCr
 OQICdxE1wkjodqbc5aHJ341J+GsWFdV3nBSsxbs5+cqs8YTQD1pceP0S8z6O1b5IS9pYoWiaEECIR
 P6o+ZNQMfGrLYyCQuE1b9Pd/kdPYw3JS3ImrdYZ96RAwXaZatvyaU1KpNZqWOrQI3ee4iLRzP1drr
 VoYD2dVN4aNewTaxG5NPriSKiDA2NrBrEljk+jxs0FKlB6tIBT9D+Zdzu1NsCuMcMnoe99ID6iknx
 qWQvAwc9Q7BXkJf/vvJrT3XT;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iZuxg-0000Mo-Qu; Wed, 27 Nov 2019 10:54:20 +0000
Date: Wed, 27 Nov 2019 11:54:19 +0100
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.9.16 Available for Download
Message-ID: <20191127105418.GA21783@carrie2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
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


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
			 "Success is simply a matter of
			  luck. Ask any failure."

			  Earl Wilson
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D


Release Announcements
---------------------

This is an additional bug fix release to address bug #14175 (CTDB: Incoming
queue can be orphaned causing communication breakdown). Please see
https://bugzilla.samba.org/show_bug.cgi?id=3D14175 for details.


Changes since 4.9.15:
---------------------

o  Volker Lendecke <vl@samba.org>
   * BUG 14175: ctdb: Avoid communication breakdown on node reconnect.

o  Martin Schwenke <martin@meltin.net>
   * BUG 14175: ctdb: Incoming queue can be orphaned causing communication
     breakdown.


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

        https://www.samba.org/samba/history/samba-4.9.16.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCXd5V1wAKCRAoaL1+KxeT
URWEAKCmY+vxwYpswm8f0QDDRd50OiuUpgCghq+q3ylxFgPdszfSjGEsXPnzMak=
=CQIo
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--


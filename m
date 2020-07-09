Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D0455219BD0
	for <lists+samba-technical@lfdr.de>; Thu,  9 Jul 2020 11:12:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=FW6HftAIPy9+8bOtgkobS75nyMpwFcSyTGQsqQGho6I=; b=UtxcOJgXzmhIsO3Y3763f3Gz/9
	sWoklf9qYbFqChVaPW3q3IiTDnlFkbs55UYTtciVnyH6hR8/zYw73MQKob75rRaoKUs4C82oD5pQO
	VO/XgM+TErLwR7cngmMeUB2jnKKJEGmCTWBRlPfhnp3P7maqN+3J0tDGgbU2h5PSRrsfzlIz0tO5W
	H7+6W5hytMSQUrX6d77ZLGqOwfZhIl2uz1twlShb234fEQQuwYG4aFlTy5aUCAkb/wtGT5ktqnw0L
	/zGKP97l+ADmff6cJh1MqEP6xBKTKIvjtEZTbjqJPz8PWmbcWzifVod7BEeB7i26yLTf33aWiMhzO
	r8KM/v2A==;
Received: from localhost ([::1]:28888 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jtSar-006LpH-Qi; Thu, 09 Jul 2020 09:11:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13986) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jtSaM-006Lm9-HC; Thu, 09 Jul 2020 09:11:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=FW6HftAIPy9+8bOtgkobS75nyMpwFcSyTGQsqQGho6I=; b=3hT/fFk9NjcqiYrusIv2kgZ8Pe
 ZlpDfMMywZD+1YEW1vx9U4BWH523p6apsb/At/14npD2fbmV/pcpTwd/swWeFxCg36Z/+krmtEpZz
 BhM1Mrw6+R4iXVjk3KfOLloaBt8XSVlnNUdEhoiYkYP0kJ4pzErImouFYnD5dE+yGdcvXGgHLnPun
 aYjBvXJuadUH3HJEKSqKMmRQmjjqv1dPHNQyc9dwSZqFtVEI5uRhfTMK9X89x5wx0uu1kmqbVAUD4
 KQzszJMPQidEKl4Zbl4AYjpzNhuTD3ZkMsFb0vvla9k50k6wp9p7d573dPvkBog4LlgNfCqXkIyG8
 zNc2+UrGh6LOygVExPNNupDSnx2fvGTK1DsTpxVeUILkMEE4C8gS8VOTYoFTEl4ebQ+THseVw4nn7
 5bHlKFypjakGti+ec7p/YGBeCQlD7eFF1/+hm0fakznZGBD+yN4tPouugIl8E45FzT4psG/jyL1jq
 H9ov4O24VchOXoSWNQS0w1AX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jtSaL-0007qv-JJ; Thu, 09 Jul 2020 09:11:17 +0000
Date: Thu, 9 Jul 2020 11:11:15 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.13.0rc1 Available for Download
Message-ID: <20200709091111.GA1148@carrie2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
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


--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This is the first release condidate of Samba 4.13.  This is *not*
intended for production environments and is designed for testing
purposes only.  Please report any defects via the Samba bug reporting
system at https://bugzilla.samba.org/.

Samba 4.13 will be the next version of the Samba suite.


UPGRADING
=3D=3D=3D=3D=3D=3D=3D=3D=3D


NEW FEATURES/CHANGES
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Python 3.6 Required
-------------------

Samba's minimum runtime requirement for python was raised to Python
3.5 with samba 4.12.  Samba 4.13 raises this minimum version to Python
3.6 both to access new features and because this is the oldest version
we test with in our CI infrastructure.

(Build time support for the file server with Python 2.6 has not
changed)

wide links functionality
------------------------

For this release, the code implementing the insecure "wide links =3D yes"
functionality has been moved out of the core smbd code and into a separate
VFS module, vfs_widelinks. Currently this vfs module is implicitly loaded
by smbd as the last but one module before vfs_default if "wide links =3D ye=
s"
is enabled on the share (note, the existing restrictions on enabling wide
links around the SMB1 "unix extensions" and the "allow insecure wide links"
parameters are still in force). The implicit loading was done to allow
existing users of "wide links =3D yes" to keep this functionality without
having to make a change to existing working smb.conf files.

Please note that the Samba developers recommend changing any Samba
installations that currently use "wide links =3D yes" to use bind mounts
as soon as possible, as "wide links =3D yes" is an inherently insecure
configuration which we would like to remove from Samba. Moving the
feature into a VFS module allows this to be done in a cleaner way
in future.

A future release to be determined will remove this implicit linkage,
causing administrators who need this functionality to have to explicitly
add the vfs_widelinks module into the "vfs objects =3D" parameter lists.
The release notes will be updated to note this change when it occurs.

REMOVED FEATURES
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D


smb.conf changes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  Parameter Name                     Description                Default
  --------------                     -----------                -------

  smb2 disable lock sequence checking				No


KNOWN ISSUES
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.13#Release_bl=
ocking_bugs


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

        https://download.samba.org/pub/samba/rc/

The release notes are available online at:

        https://download.samba.org/pub/samba/rc/samba-4.13.0rc1.WHATSNEW.txt

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCXwbfLAAKCRAoaL1+KxeT
UZddAJ9wUZaBuNe9XTD4imuERJ5hHCN65ACgnCsrQY9kHMeQecPrFQmNc0vb5TA=
=5zTD
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--


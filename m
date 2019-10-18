Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B756DC109
	for <lists+samba-technical@lfdr.de>; Fri, 18 Oct 2019 11:33:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=hdGwJdKbCYYmVb/C+pC1bTB9b7zI9Y/PWGTK3BA1szM=; b=U+htpicCiqL8ci6vR8VTqoyUvp
	NFCvKOpbO6O5M50RoonuURNOXy75ao0hzWSq1tdnbFXE/UNNqpg/MSc+WkC7EW/C3No9OW+gBcb2N
	SaamBEN7vxCRnjjRibaA1B9Wl9mSN1f2dWmzEtkFweFU1wOrrQK1LKojbHVXx7pY+Pr6H7o3+lpCE
	4kSQTkTdr5U/w6WjlbteqeV6QbSsrsVMUeyEjWZ7R5ySaTbCReVpGcWDfV1Kud47e8RyUX8odA7U3
	/WFBJLlJ6/jvW6ckGSFigsIM2sPQUMXRPXt6EBvfS++jrTWIGhtwvq41td5HBPAeoVrEB1x6ljb5t
	Qf6vKNkQ==;
Received: from localhost ([::1]:28694 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iLOcn-000E2H-RC; Fri, 18 Oct 2019 09:32:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47532) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iLOcf-000E1b-Ro; Fri, 18 Oct 2019 09:32:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=hdGwJdKbCYYmVb/C+pC1bTB9b7zI9Y/PWGTK3BA1szM=; b=pOEzw05+OTZhRqhD/tUC/xgglz
 tTK0rQlpx9IoikQa+NwJIZdOMvMHkB8BQ5ftic3KM0SF/t1MskI039ue99NIvCO1ZY+ijGpnRb36Z
 bIkGCLkHB1mfkpx7sdSdiUOzPKbW8GO5EC1WJHikSGTn/xHHrVAcsfi3OqvPPHphrq//3jUMmKzjc
 JtienCr+nrhwelx+pjJMekOcsj1fi7ch4y3bRS5uWLLwOD7iXfR7EFawb7Sy4+EbY0I3EvfkXY3bK
 x2vw7pSilkWM1OeULEZJUF+yMcfWnhM96rKsyYlExl2Kk5QTTSy7d8aYfFke6z+ESdYAKGkKV+Gww
 K6yqk24IDzKCw9QQqXqxiOnAY/NgG0KnDQ+QHgWEi4Un6YzD+g3fdalSt81HxWSUQNC6YRIWqRolZ
 q1i5iAm8eA1svX6uQG17qo3YqsBmIC+L1wdL6zmycyZP5G8Xozn/sBK4V+Ac7pKzI+H7oop6L9bw8
 HINshfeGLzadEyWYDeof0jaV;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iLOcf-00034z-IR; Fri, 18 Oct 2019 09:32:37 +0000
Date: Fri, 18 Oct 2019 11:32:36 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.11.1 Available for Download
Message-ID: <20191018093234.GA12820@carrie2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
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


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
			Arthur Spooner:
			"Darling, I need to borrow the
			 iron."

			Carrie Spooner Heffernan:
			"Dad, I told you. If you want a
			 grilled cheese sandwich, I will
			 make you one."

			 King of Queens
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D


Release Announcements
---------------------

This is the latest stable release of the Samba 4.11 release series.


Changes since 4.11.0:
---------------------

o  Michael Adam <obnox@samba.org>
   * BUG 14141: getpwnam and getpwuid need to return data for ID_TYPE_BOTH
     group.

o  Jeremy Allison <jra@samba.org>
   * BUG 14094: smbc_readdirplus() is incompatible with smbc_telldir() and
     smbc_lseekdir().
   * BUG 14152: s3: smbclient: Stop an SMB2-connection from blundering into
     SMB1-specific calls.

o  Ralph Boehme <slow@samba.org>
   * BUG 14137: Fix stale file handle error when using mkstemp on a share.

o  Isaac Boukris <iboukris@gmail.com>
   * BUG 14106: Fix spnego fallback from kerberos to ntlmssp in smbd server.
   * BUG 14140: Overlinking libreplace against librt and pthread against ev=
ery
     binary or library causes issues.

o  G=C3=BCnther Deschner <gd@samba.org>
   * BUG 14130: s3-winbindd: Fix forest trusts with additional trust attrib=
utes.
   * BUG 14134: auth/gensec: Fix non-AES schannel seal.

o  Amitay Isaacs <amitay@gmail.com>
   * BUG 14147: Deleted records can be resurrected during recovery.

o  Bj=C3=B6rn Jacke <bj@sernet.de>
   * BUG 14136: Fix uncaught exception in classicupgrade.
   * BUG 14139: fault.c: Improve fault_report message text pointing to our =
wiki.

o  Bryan Mason <bmason@redhat.com>
   * BUG 14128: s3:client: Use DEVICE_URI, instead of argv[0], for Device U=
RI.

o  Stefan Metzmacher <metze@samba.org>
   * BUG 14124: pam_winbind with krb5_auth or wbinfo -K doesn't work for us=
ers
     of trusted domains/forests.

o  Mathieu Parent <math.parent@gmail.com>
   * BUG 14131: Remove 'pod2man' as it is no longer needed.

o  Andreas Schneider <asn@samba.org>
   * BUG 13884: Joining Active Directory should not use SAMR to set the
     password.
   * BUG 14140: Overlinking libreplace against librt and pthread against ev=
ery
     binary or library causes issues.
   * BUG 14155: 'kpasswd' fails when built with MIT Kerberos.

o  Martin Schwenke <martin@meltin.net>
   * BUG 14129: Exit code of ctdb nodestatus should not be influenced by de=
leted
     nodes.


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

        https://www.samba.org/samba/history/samba-4.11.1.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCXamGsAAKCRAoaL1+KxeT
UcgIAJ9M1dDI4mUDU6kE88p2/WD+weXqMwCffcBuPXjOHVAzIj9qzvgp2rPOQDc=
=+Nes
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C149C1A07E3
	for <lists+samba-technical@lfdr.de>; Tue,  7 Apr 2020 09:03:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=IPlBey36iHpDNL5n8p12c1IWw7HHr5E3kfVgCX5JYqQ=; b=Nq9SLyw7rzrcMCaLw/CayHguSj
	p5e9QqYY16mNGywAJAVGcl+AeluNoTQRFyFkkrqtOlIgYqzKX2ZaLmcBrGAPqOUx3Cj6bUHCLnDaH
	GQC3myB4Mpn701zSJkxbvvaHo9Pb7SGcMmjlZjjQoqdhVZRHcbwra+XyGwtFcYGmj0ipLBBiEkHD9
	mBzpUBpsWbxy21I2FoZr6jqxYlfKOnXli+Tx08UR5z2XhawNdw4kUIzIiLbynlovR1DxPCxAiu982
	5MH+2fMlDwTDLIP9aGLc8D6H2W3w218ZSwYUyq+xF61UYxWyChoUESc88hKaA1vhKtF/vbu7cUErp
	bduqgGOQ==;
Received: from localhost ([::1]:28148 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jLiG6-003g9j-2C; Tue, 07 Apr 2020 07:02:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58958) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jLiFJ-003g8z-9T; Tue, 07 Apr 2020 07:02:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=IPlBey36iHpDNL5n8p12c1IWw7HHr5E3kfVgCX5JYqQ=; b=fUGOszZbkd/VktnrGsq8OoALJI
 LJuOSX9z98vWONPOZV5BzXDbAXHb+Qzn8fVSw5HCiqu/f2/y4htO1U2k34I3/k0cib+5CJ/AdD7az
 cxubILfOoAwPodcCPw9tTLY0arbk5CRtnChlfWqvWekKDLb+yI6amd0Nfd9FshYZfqH0ajOyLpgNb
 F7ekqTV8JgU3XYJBqieOul1uH7e8sq3CcObkm6404KsNipOiRzku8VMYCvuP3YTpcFc9T16ljCR7a
 HEJhiZM41orNsmW1c8YESxK2GeC3RuvlrTouhbUOMx4U9dFQxZmXJxChSZzKsITYEYUXuTHU4cee4
 eM3ZWyZZP7k5WcfRpq6APdVUnlAvQfBAWX15wsJJY98untyZAqTBVnVoJ9O5AETt0NEkGIKt24W6l
 O0CCHx6C/dlBHCbd6IOx1Z2rr+nWR2cTxIOOStqESNZvD5d0aljAitlvJIGMzYTfOKd2pnIPSQjUB
 Z7KTNv6jWKuLJolharEKZQ3V;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jLiFH-0001g5-4U; Tue, 07 Apr 2020 07:02:03 +0000
Date: Tue, 7 Apr 2020 09:02:01 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.12.1 Available for Download
Message-ID: <20200407070159.GA20064@carrie2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
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


--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
---------------------


This is the latest stable release of the Samba 4.12 release series.


Changes since 4.12.0
--------------------

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
   * BUG 14295: nmblib: Avoid undefined behaviour in handle_name_ptrs().

o  Bj=C3=B6rn Baumbach <bb@sernet.de>
   * BUG 14296: samba-tool group: Handle group names with special chars
     correctly.

o  Ralph Boehme <slow@samba.org>
   * BUG 14293: Add missing check for DMAPI offline status in async DOS
     attributes.
   * BUG 14295: Starting ctdb node that was powered off hard before results=
 in
     recovery loop.
   * BUG 14307: smbd: Ignore set NTACL requests which contain S-1-5-88 NFS =
ACEs.
   * BUG 14316: vfs_recycle: Prevent flooding the log if we're called on
     non-existant paths.

o  G=C3=BCnther Deschner <gd@samba.org>
   * BUG 14313: librpc: Fix IDL for svcctl_ChangeServiceConfigW.
   * BUG 14327: nsswitch: Fix use-after-free causing segfault in=20
     _pam_delete_cred.

o  Art M. Gallagher <repos@artmg.net>
   * BUG 13622: fruit:time machine max size is broken on arm.

o  Amitay Isaacs <amitay@gmail.com>
   * BUG 14294: CTDB recovery corner cases can cause record resurrection and
     node banning.

o  Noel Power <noel.power@suse.com>
   * BUG 14332: s3/utils: Fix double free error with smbtree.=20

o  Martin Schwenke <martin@meltin.net>
   * BUG 14294: CTDB recovery corner cases can cause record resurrection and
     node banning.
   * BUG 14295: Starting ctdb node that was powered off hard before results=
 in
     recovery loop.
   * BUG 14324: CTDB recovery daemon can crash due to dereference of NULL
     pointer.


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

        https://www.samba.org/samba/history/samba-4.12.1.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCXowlZAAKCRAoaL1+KxeT
UR+XAKC9B8GK7K5RcFde+fsefSOFeRmI/wCglCYbAiFUvBUJDfg4HUmWZzuk61o=
=1s7H
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--


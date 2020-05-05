Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A60061C5507
	for <lists+samba-technical@lfdr.de>; Tue,  5 May 2020 14:05:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=99ufFB9qNl2zQ+2j9hJlLMyWCEqOFExcSzmPej04KIA=; b=AFxd0x2o9VufwiCbljPBGmzkKE
	EQluVbKqb6aq2WLTXnctpfzUVARUhZRvK7OJMR5pCPOF4EO436ea5A808YtNyT8UtU5PWbHqTNw0A
	tubLt9+Ru3iqn9D/lqKAIxtctanxEo3PqgTJRWPTbue1hVCk0lF3nReExQ3UXzKlnwOQNGccbCfDH
	Y4myILtkZhPuXKd9Sx3e8uaf1ET2H/U1NC+iaScTHq3jdNlmHrWWBlS0wwFMnd0P83VVAHJPQMqxs
	jMCeiRuC/GQRg5UPIfXgnSsWZHDttQWNPn/Trawna9CHVJs9CMQeita2Z9i9dBg2Dm/yP7fqr7lDR
	9ReASqVA==;
Received: from localhost ([::1]:28248 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jVwJt-002njx-Ql; Tue, 05 May 2020 12:05:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14288) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jVwJW-002njF-Uh; Tue, 05 May 2020 12:04:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=99ufFB9qNl2zQ+2j9hJlLMyWCEqOFExcSzmPej04KIA=; b=NbD9eB2ZEPHJVYr9iUW1EGk/uE
 Tpl2krR8rLelfZ9739pZayXuFtR9WtNIRFb/EQ47r2iNyeHJ2uqqOwbHEi5cVdFwgwtWq+/h4gw6m
 kO522E01LpUQz1qe61+5YqW7cdlekeYB5kQmHA+AhOAJcGJjB53T0GVUoGEY85r8SDzFb7mPa1zHu
 WFtTvTRfqxJQHg3rr3AJaobqDmZebjFHOyOwDTKjIqRI9QU5AYQs6Y7Q2Q5YnbLWAjzSQp8UxDqeu
 vrWJgVNc19PrWO6BZjccqh/0wV5HMKqcymAVTOCqWRlawUa5M5PsgIn5nUOcgRm89Nf560x4HspP8
 Pl9f6c4RhtdR1tJnqOtcoxY//16rZucIOMTi/1HjeNwSbU5yztdlUFlGaSP5bdkFldIzLVuebZlqU
 tgizJVkdnDPkPbRQZj285ambYxmrTp63it07Z15jKtXnvwQ7bAVNE3PPOydTqJghUD9699g5WRtP8
 SgJouX39btObC+yViF2Pu3qm;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jVwJW-0002JD-H7; Tue, 05 May 2020 12:04:42 +0000
Date: Tue, 5 May 2020 14:04:41 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.11.9 Available for Download
Message-ID: <20200505120423.GA14168@carrie2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="0eh6TmSyL6TZE2Uz"
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


--0eh6TmSyL6TZE2Uz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
---------------------


This is the latest stable release of the Samba 4.11 release series.


Changes since 4.11.8
--------------------

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
   * BUG 14242: nmblib: Avoid undefined behaviour in handle_name_ptrs().

o  Bj=C3=B6rn Baumbach <bb@sernet.de>
   * BUG 14296: 'samba-tool group' commands do not handle group names with
     special chars correctly.

o  Ralph Boehme <slow@samba.org>
   * BUG 14237: smbd: avoid calling vfs_file_id_from_sbuf() if statinfo is =
not
     valid.
   * BUG 14293: Missing check for DMAPI offline status in async DOS attribu=
tes.
   * BUG 14307: smbd: Ignore set NTACL requests which contain S-1-5-88 NFS =
ACEs.
   * BUG 14316: vfs_recycle: Prevent flooding the log if we're called on
     non-existant paths.
   * BUG 14320: smbd mistakenly updates a file's write-time on close.

o  Alexander Bokovoy <ab@samba.org>
   * BUG 14359: RPC handles cannot be differentiated in source3 RPC server.

o  G=C3=BCnther Deschner <gd@samba.org>
   * BUG 14313: librpc: Fix IDL for svcctl_ChangeServiceConfigW.
   * BUG 14327: nsswitch: Fix use-after-free causing segfault in
     _pam_delete_cred.

o  Art M. Gallagher <repos@artmg.net>
   * BUG 13622: Fix fruit:time machine max size on arm.

o  Amitay Isaacs <amitay@gmail.com>
   * BUG 14294: CTDB recovery corner cases can cause record resurrection and
     node banning.

o  Volker Lendecke <vl@samba.org>
   * BUG 14348: ctdb: Fix a memleak.
   * libsmb: Don't try to find posix stat info in SMBC_getatr().

o  Noel Power <noel.power@suse.com>
   * BUG 14295: ctdb-tcp: Move free of inbound queue to TCP restart.
   * BUG 14344: s3/librpc/crypto: Fix double free with unresolved credential
     cache.

o  Andreas Schneider <asn@samba.org>
   * BUG 14336: s3:libads: Fix ads_get_upn().

o  Martin Schwenke <martin@meltin.net>
   * BUG 14294: CTDB recovery corner cases can cause record resurrection and
     node banning.
   * BUG 14295: Starting ctdb node that was powered off hard before results=
 in
     recovery loop.
   * BUG 14324: ctdb-recoverd: Avoid dereferencing NULL rec->nodemap.


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

        https://www.samba.org/samba/history/samba-4.11.9.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--0eh6TmSyL6TZE2Uz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCXrFWWAAKCRAoaL1+KxeT
UR3QAJwP6N61HQx0bw1yrz4VQ702jKzfPwCePGU8wvdjOG7+0Zpc6A0NYbYmN0E=
=BRkl
-----END PGP SIGNATURE-----

--0eh6TmSyL6TZE2Uz--


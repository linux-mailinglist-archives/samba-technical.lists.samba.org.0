Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C23E61D61
	for <lists+samba-technical@lfdr.de>; Mon,  8 Jul 2019 13:02:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=SHRc31MDWC4QpcKlJ+IpQK3zfUQTkd7UnLc3iq7iiOE=; b=Q+c9eC5nysL22IV+TZ/6DpQNE5
	zIRgTU2UVWuSIhk9c5OA/VdH1e6FASq6Fof4w++hyJVAh6D1/DFz3R0JWzKwpSnSypdpGZtmAdnNF
	Qxgnq7B1I5BIO0fkQYEHtwdBeLxNjM0jnsRMbOcXFQtgH6dBsV5j4GpKXS8FsxX36FtlVpOLlrj2t
	pfbeO7lSgvIn0+I1FOkdhf0KFYPr9LprPm2wVK8TVaHadav83ezlHJXMZ7dlFVGoABSE8KcGxcs/X
	Le4Xg4un60VkV+j8Fw3YzYmum3rpkP0tDaXOXVPkdKhGGtYiFOk7WOH96uKmp7BAAQNkROuowwTdh
	59VW/BIA==;
Received: from localhost ([::1]:49194 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hkRPD-005pom-DY; Mon, 08 Jul 2019 11:01:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43818) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hkRP5-005po6-Bv; Mon, 08 Jul 2019 11:01:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:To:From:Date:CC;
 bh=SHRc31MDWC4QpcKlJ+IpQK3zfUQTkd7UnLc3iq7iiOE=; b=tgdjsNCU1Vc9mLabcZAWWWYMEH
 6KGvYuB0JYHvlIBgJOTwFhUX05uklWzffUY/s/0Su3QKTDArUHwNjP1kkULTpH1CKPjkXu6fl8o+P
 ZOm64ImEyu2Ub0LB51pNKBmYKZYXuwssOME6j7GPkYbMgovmnZZTyFdS2ncQjUrSYa9g=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hkRP5-0006Yv-0N; Mon, 08 Jul 2019 11:01:51 +0000
Date: Mon, 8 Jul 2019 13:01:49 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.10.6 Available for Download
Message-ID: <20190708110148.GA12492@carrie2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="PNTmBPCT7hxwcZjr"
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


--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
			"Be thankful we're not getting
			 all the government we're paying
			 for."

			 Will Rogers
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D


Release Announcements
---------------------

This is the latest stable release of the Samba 4.10 release series.


Changes since 4.10.5:
---------------------

o  Jeremy Allison <jra@samba.org>
   * BUG 13956: s3: winbind: Fix crash when invoking winbind idmap scripts.
   * BUG 13964: smbd does not correctly parse arguments passed to dfree and
     quota scripts.

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
   * BUG 13965: samba-tool dns: use bytes for inet_ntop.

o  Andrew Bartlett <abartlet@samba.org>
   * BUG 13828: samba-tool domain provision: Fix --interactive module in
     python3.
   * BUG 13893: ldb_kv: Skip @ records early in a search full scan.
   * BUG 13981: docs: Improve documentation of "lanman auth" and "ntlm auth"
     connection.

o  Bj=C3=B6rn Baumbach <bb@sernet.de>
   * BUG 14002: python/ntacls: Use correct "state directory" smb.conf option
     instead of "state dir".

o  Ralph Boehme <slow@samba.org>
   * BUG 13840: registry: Add a missing include.
   * BUG 13944: Fix SMB guest authentication.
   * BUG 13958: AppleDouble conversion breaks Resourceforks.
   * BUG 13968: vfs_fruit makes direct use of syscalls like mmap() and prea=
d().
   * BUG 13987: s3:mdssvc: Fix flex compilation error.

o  G=C3=BCnther Deschner <gd@samba.org>
   * BUG 13872: s3/vfs_glusterfs[_fuse]: Avoid using NAME_MAX directly:

o  Aaron Haslett <aaronhaslett@catalyst.net.nz>
   * BUG 13799: dsdb:samdb: schemainfo update with relax control.

o  Aliaksei Karaliou <akaraliou@panasas.com>
   * BUG 13964: s3:util: Move static file_pload() function to lib/util.

o  Volker Lendecke <vl@samba.org>
   * BUG 13957: smbd: Fix a panic.

o  Gary Lockyer <gary@catalyst.net.nz>
   * BUG 12478: ldap server: Generate correct referral schemes.
   * BUG 13941: s4 dsdb/repl_meta_data: fix use after free in
     dsdb_audit_add_ldb_value.
   * BUG 13942: s4 dsdb: Fix use after free in
     samldb_rename_search_base_callback.

o  Stefan Metzmacher <metze@samba.org>
   * BUG 12204: dsdb/repl: we need to replicate the whole schema before we =
can
     apply it.
   * BUG 12478: ldb: Release ldb 1.5.5
   * BUG 13713: Schema replication fails if link crosses chunk boundary
     backwards.
   * BUG 13799: 'samba-tool domain schemaupgrade' uses relax control and sk=
ips
     the schemaInfo update provision.
   * BUG 13916: dsdb_audit: avoid printing "... remote host [Unknown]
     SID [(NULL SID)] ..."
   * BUG 13917: python/ntacls: We only need security.SEC_STD_READ_CONTROL in
     order to get the ACL.

o  Shyamsunder Rathi <shyam.rathi@nutanix.com>
   * BUG 13947: s3:loadparm: Ensure to truncate FS Volume Label at multibyte
     boundary.

o  Andreas Schneider <asn@samba.org>
   * BUG 13939: Using Kerberos credentials to print using spoolss doesn't w=
ork.

o  Lukas Slebodnik <lslebodn@fedoraproject.org>
   * BUG 13998: wafsamba: Use native waf timer.

o  Rafael David Tinoco <rafaeldtinoco@ubuntu.com>
   * BUG 13984: ctdb-scripts: Fix tcp_tw_recycle existence check.


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

        https://www.samba.org/samba/history/samba-4.10.6.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--PNTmBPCT7hxwcZjr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCXSMimQAKCRAoaL1+KxeT
UQZYAJ47FnIpLTCsySDEdqPw8F5OUgFwRgCgqC8j6dyAXpjeqB4myDqVMJX2zg8=
=kcNH
-----END PGP SIGNATURE-----

--PNTmBPCT7hxwcZjr--


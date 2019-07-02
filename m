Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D93925CD6C
	for <lists+samba-technical@lfdr.de>; Tue,  2 Jul 2019 12:21:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=r2mDWgPHvlgD0g5l9EcH/U60XSUwpBeCa02dW1yysig=; b=13bf+enEwf8rg79+9/NZfhuc4G
	FAPlq0QGt/MXdV/vw/KI4A+q+P3QPCjIuhTvJLUI06NPg8Eq5dNrvFlkOxjuN1vyoZGBUTha765US
	75Lqmw+aq/VlAVA61gxB9p+eg2bsOtd8MQNxNMjOYWhXC320mkyyUdnFCMG79YSSQjoXGn8wzd3AK
	qkUflDadtHm17IqKNUpQCwbZw2p0oRPD70r9n84/dZmMkMGqTpqWb5RGg7OkiNq5k5nZwvfnAzR6q
	8jJdHg8pDTNwR1Gjc+aKNhGDFTfoKForu5gxHj5h0OtPFAKSn5CyxPYP9BoMb+7tmwoygautvOPkf
	h3mkuVPQ==;
Received: from localhost ([::1]:29480 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hiFuY-004RmZ-LL; Tue, 02 Jul 2019 10:21:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41512) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hiFuQ-004Rlm-Fh; Tue, 02 Jul 2019 10:21:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:To:From:Date:CC;
 bh=r2mDWgPHvlgD0g5l9EcH/U60XSUwpBeCa02dW1yysig=; b=XtzR05IKJiV9XYaaiEr9E+3QEe
 0V9d+7Se/aExiSyN2LeoaKs5cxAaJY7VuU74RRi9cjA6/YN1Ne9ciAgBifO79LZivJVnXKAZSYz1h
 CM+po7LLFiTj/5+of40y+CTNjm9LFCFuQeiuqmfzzBw7gSXtcoNMK8IpkTw2zltKScE4=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hiFuQ-0005kc-4o; Tue, 02 Jul 2019 10:21:10 +0000
Date: Tue, 2 Jul 2019 12:21:08 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.9.10 Available for Download
Message-ID: <20190702102107.GA14251@carrie2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="NzB8fVQJ5HfG6fxh"
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


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
			"No one saves us but ourselves.
			 No one can and no one may.
			 We ourselves must walk the
			 path."

			 Buddha
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D


Release Announcements
---------------------

This is the latest stable release of the Samba 4.9 release series.


Changes since 4.9.9:
--------------------

o  Jeremy Allison <jra@samba.org>
   * BUG 13938: s3: SMB1: Don't allow recvfile on stream fsp's.
   * BUG 13956: s3: winbind: Fix crash when invoking winbind idmap scripts.
   * BUG 13964: smbd does not correctly parse arguments passed to dfree and
     quota scripts.

o  Andrew Bartlett <abartlet@samba.org>
   * BUG 13981: docs: Improve documentation of "lanman auth" and "ntlm auth"
     connection.

o  Bj=C3=B6rn Baumbach <bb@sernet.de>
   * BUG 14002: python/ntacls: Use correct "state directory" smb.conf option
     instead of "state dir".

o  Ralph Boehme <slow@samba.org>
   * BUG 13840: registry: Add a missing include.
   * BUG 13938: s3:smbd: Don't use recvfile on streams.
   * BUG 13944: SMB guest authentication may fail.
   * BUG 13958: AppleDouble conversion breaks Resourceforks.
   * BUG 13964: s3: lib: Rename all uses of file_pload_XXX -> file_ploadv_X=
XX.
   * BUG 13968: vfs_fruit makes direct use of syscalls like mmap() and prea=
d().
   * BUG 13987: s3:mdssvc: Fix flex compilation error.

o  G=C3=BCnther Deschner <gd@samba.org>
   * BUG 13872: s3/vfs_glusterfs[_fuse]: Avoid using NAME_MAX directly.

o  David Disseldorp <ddiss@samba.org>
   * BUG 13940: vfs_ceph: Fix cephwrap_flistxattr() debug message.

o  Aaron Haslett <aaronhaslett@catalyst.net.nz>
   * BUG 13799: dsdb:samdb: Schemainfo update with relax control.

o  Amitay Isaacs <amitay@gmail.com>
   * BUG 13943: ctdb-common: Fix memory leak in run_proc.

o  Aliaksei Karaliou <akaraliou@panasas.com>
   * BUG 13964: smbd does not correctly parse arguments passed to dfree and
     quota scripts.

o  Volker Lendecke <vl@samba.org>
   * BUG 13903: winbind: Fix overlapping id ranges.
   * BUG 13957: smbd: Fix a panic.

o  Gary Lockyer <gary@catalyst.net.nz>
   * BUG 12478: ldap server: Generate correct referral schemes.
   * BUG 13902: lib util debug: Increase format buffer to 4KiB.
   * BUG 13941: Fix use after free detected by AddressSanitizer.
   * BUG 13942: s4 dsdb: Fix use after free in
     samldb_rename_search_base_callback.

o  Stefan Metzmacher <metze@samba.org>
   * BUG 12204: Samba fails to replicate schema 69.
   * BUG 13713: Schema replication fails if link crosses chunk boundary
     backwards.
   * BUG 13799: 'samba-tool domain schemaupgrade' uses relax control and sk=
ips
     the schemaInfo update.
   * BUG 13916: dsdb:audit_log: avoid printing "... remote host [Unknown] S=
ID
     [(NULL SID)] ...".
   * BUG 13917: python/ntacls: We only need security.SEC_STD_READ_CONTROL in
     order to get the ACL.
   * BUG 13919: smbd: Implement SMB_FILE_NORMALIZED_NAME_INFORMATION handli=
ng.

o  Shyamsunder Rathi <shyam.rathi@nutanix.com>
   * BUG 13947: s3:loadparm: Ensure to truncate FS Volume Label at multibyte
     boundary.

o  Robert Sander <r.sander@heinlein-support.de>
   * BUG 13918: s3: modules: ceph: Use current working directory instead of
     share path.

o  Christof Schmitt <cs@samba.org>
   * BUG 13831: Fix inconsistent output from wbinfo --sid-to-name depending=
 on
     cache state.

o  Andreas Schneider <asn@samba.org>
   * BUG 13937: Fix several issues detected by GCC 9.
   * BUG 13939: s3:smbspool: Fix regression printing with Kerberos credenti=
als.

o  Martin Schwenke <martin@meltin.net>
   * BUG 13923: ctdb-tools: Fix ctdb dumpmemory to avoid printing trailing =
NUL.
   * BUG 13930: ctdb-daemon: Never use 0 as a client ID.
   * BUG 13943: ctdb-common: Fix memory leak.

o  Rafael David Tinoco <rafaeldtinoco@ubuntu.com>
   * BUG 13984: ctdb-scripts: Fix tcp_tw_recycle existence check.

o  Ralph Wuerthner <ralph.wuerthner@de.ibm.com>
   * BUG 13904: Log early startup failures.


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

        https://www.samba.org/samba/history/samba-4.9.10.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCXRswEAAKCRAoaL1+KxeT
UUgXAJ4vS/d3ofRMuyOJFW9ViQHOQck1FwCgxYVZy+dArHpSzyGj4cn0SdP4q+E=
=yohW
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--


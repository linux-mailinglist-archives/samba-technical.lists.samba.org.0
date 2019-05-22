Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7ED26266
	for <lists+samba-technical@lfdr.de>; Wed, 22 May 2019 12:52:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=XkJsdF+0wbtA1LEqpXO0gSb2iG+2GCOMdyWpiLIGk8M=; b=2ZTMQaIR1lWRYcdJTqK5w/5sA7
	dW33swAjSo29Cz/9hLOQNLINyd43HRZL82lCAPTC8P4HiwC9pEVZQ0qgPRBN69ojWGVmXuJTOePMd
	E2gumOyQwRJKIHQeUFauLBg0dWEmobW1bl58EfL+2Z8C5MFL2NoTULotvKJTMQ4fiVu0TrmeTa5PI
	4f+FJa0DJgJR2vFzpedT9HSzeMCJUWB2e59s3NVbvwVr9jxIibHeFM8UimveUU9z1MbT8bFKuQpZf
	eJJbdfV+b55FeM1uVLUeHjFAnjchZodcwbhvFx9a1r0in/+T8NDv+OIe4lH428irQOlxtZybA2S6f
	/10pMt4A==;
Received: from localhost ([::1]:51736 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hTOqc-001CnX-PR; Wed, 22 May 2019 10:51:50 +0000
Received: from [2a01:4f8:192:486::147:1] (port=28110 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hTOqV-001Cmq-1V; Wed, 22 May 2019 10:51:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:To:From:Date:CC;
 bh=XkJsdF+0wbtA1LEqpXO0gSb2iG+2GCOMdyWpiLIGk8M=; b=a50ycFiwaF1VSHzGYfQ39nTKte
 ubZ4mIZn3di1zGGzm+lneZuLA6djpdxZrfneV7+nur5oNU0TvpQBGz9lUO0B7XeE1tvtcVM6Fzj9+
 VxXW0ydaI9j512vBFUSHs2sz7GvDneHImp3idblLvg9FGy0Qs9Opw30hMWed9mKZWqGk=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hTOqP-00056Y-PL; Wed, 22 May 2019 10:51:37 +0000
Date: Wed, 22 May 2019 12:51:36 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.10.4 Available for Download
Message-ID: <20190522105134.GA13306@carrie2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
			"Before anything else,
			 preparation is the key to
			 success."

			 Alexander Graham Bell
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D


Release Announcements
---------------------

This is the latest stable release of the Samba 4.10 release series.


Changes since 4.10.3:
---------------------

o  Jeremy Allison <jra@samba.org>
   * BUG 13938: s3: SMB1: Don't allow recvfile on stream fsp's.

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
   * BUG 13882: py/provision: Fix for Python 2.6.

o  Tim Beale <timbeale@catalyst.net.nz>
   * BUG 13873: netcmd: Fix 'passwordsettings --max-pwd-age' command.

o  Ralph Boehme <slow@samba.org>
   * BUG 13938: s3:smbd: Don't use recvfile on streams.

o  G=C3=BCnther Deschner <gd@samba.org>
   * BUG 13861: s3-libnet_join: 'net ads join' to child domain fails when u=
sing
     "-U admin@forestroot".

o  David Disseldorp <ddiss@samba.org>
   * BUG 13896: vfs_ceph: Explicitly enable libcephfs POSIX ACL support.
   * BUG 13940: vfs_ceph: Fix cephwrap_flistxattr() debug message.

o  Amitay Isaacs <amitay@gmail.com>
   * BUG 13895: ctdb-common: Avoid race between fd and signal events.
   * BUG 13943: ctdb-common: Fix memory leak in run_proc.

o  Volker Lendecke <vl@samba.org>
   * BUG 13892: lib: Initialize getline() arguments.
   * BUG 13903: winbind: Fix overlapping id ranges.

o  Gary Lockyer <gary@catalyst.net.nz>
   * BUG 13902: lib util debug: Increase format buffer to 4KiB.
   * BUG 13927: nsswitch pam_winbind: Fix Asan use after free.
   * BUG 13929: s4 lib socket: Ensure address string owned by parent struct.
   * BUG 13936: s3 rpc_client: Fix Asan stack use after scope.

o  Stefan Metzmacher <metze@samba.org>
   * BUG 10097: s3:smbd: Handle IO_REPARSE_TAG_DFS in
     SMB_FIND_FILE_FULL_DIRECTORY_INFO.
   * BUG 10344: smb2_tcon: Avoid STATUS_PENDING completely on tdis.
   * BUG 12845: smb2_sesssetup: avoid STATUS_PENDING responses for session
     setup.
   * BUG 13698: smb2_tcon: Avoid STATUS_PENDING completely on tdis.
   * BUG 13796: smb2_sesssetup: avoid STATUS_PENDING responses for session
     setup.
   * BUG 13843: dbcheck: Fix the err_empty_attribute() check.
   * BUG 13858: vfs_snapper: Drop unneeded fstat handler.
   * BUG 13862: vfs_default: Fix vfswrap_offload_write_send()
     NT_STATUS_INVALID_VIEW_SIZE check.
   * BUG 13863: smb2_server: Grant all 8192 credits to clients.
   * BUG 13919: smbd: Implement SMB_FILE_NORMALIZED_NAME_INFORMATION handli=
ng.

o  Anoop C S <anoopcs@redhat.com>
   * BUG 13872: s3/vfs_glusterfs: Dynamically determine NAME_MAX.

o  Robert Sander <r.sander@heinlein-support.de>
   * BUG 13918: s3: modules: ceph: Use current working directory instead of
     share path.

o  Christof Schmitt <cs@samba.org>
   * BUG 13831: winbind: Use domain name from lsa query for sid_to_name cac=
he
     entry.
   * BUG 13865: memcache: Increase size of default memcache to 512k.

o  Andreas Schneider <asn@samba.org>
   * BUG 13857: docs: Update smbclient manpage for "--max-protocol".
   * BUG 13861: 'net ads join' to child domain fails when using
     "-U admin@forestroot".
   * BUG 13937: s3:utils: If share is NULL in smbcacls, don't print it.
   * BUG 13939: s3:smbspool: Fix regression printing with Kerberos credenti=
als.

o  Martin Schwenke <martin@meltin.net>
   * BUG 13860: ctdb-scripts: CTDB restarts failed NFS RPC services by hand,
     which is incompatible with systemd.
   * BUG 13888: ctdb-daemon: Revert "We can not assume that just because we
     could complete a TCP handshake".
   * BUG 13930: ctdb-daemon: Never use 0 as a client ID.
   * BUG 13943: ctdb-common: Fix memory leak.

o  Ralph Wuerthner <ralph.wuerthner@de.ibm.com>
   * BUG 13904: s3:debug: Enable logging for early startup failures.


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

        https://www.samba.org/samba/history/samba-4.10.4.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCXOUpswAKCRAoaL1+KxeT
USPgAKDGEUkqKHqcGc8GbM6qb6KK6oBUTgCfaai4MJ4BzwVceL5KwjfyL1dHRxQ=
=qiAx
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--


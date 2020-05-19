Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E085B1D9573
	for <lists+samba-technical@lfdr.de>; Tue, 19 May 2020 13:41:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=G0kvt7CfG71bBNdSajhrFZatYsBDKbs4ojV0NNqH0nQ=; b=pSmrYR2mCkhdjsWUlOtoPleQs7
	cPbTMYzEcEc/ZN/QugNLEtptt+fIhTTop2402J8qOUWum2xyk6jycvrGZImdNC4x93VoqA9pB/uNS
	lRqQyzN7EOaxIvHE4DvpJ24rYbWQBGjntoqWTxiIlHwDTmOvaMIJSB+UQDOCivS+ATM4gki0EGKLL
	5vdupZmp4Uwqa1/bUF0eD2VQWDe9t1/KFaC02gwVKcMRbXVTrjm6aQRTVd2B7sMxDAHZ41cBcxteS
	vAIiuA30AVMoJZV9HwUN3vDaMSWbhSaVFZEbcfHH+j1htxEjNpb+lAduyXYH7RF4PfADOp1FRL7KL
	ZONOBp1g==;
Received: from localhost ([::1]:60666 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jb0ch-0054N3-Ij; Tue, 19 May 2020 11:41:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14712) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jb0cW-0054MN-1e; Tue, 19 May 2020 11:41:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=G0kvt7CfG71bBNdSajhrFZatYsBDKbs4ojV0NNqH0nQ=; b=UpIqB/I35EpSnusD3rqIGwbC4N
 ydwV1Ck20F2LQ6fRe8UCH3doUv/tI/mPMeIlK9vTJtSXHZgk0Bl2QDnnltJuKJz6J4sCCvYzsrxxr
 mI6XoA6m6Gr/QMDwv7YYZ7Q+NVpEVfFfE9Tj4de/CxOy2ahQ0xDWC2AlSYVZO2eZiI218scpafV3E
 f6IbH2z3zszubF9EOkW0ObNx5nWuhqZBxfCK6lvbDMusH3L1P+mJqPWYYhVRXalWOQhvt3sjcFcPo
 cP9u7EWarL/R+Xll6U1yk8q0x3iOy2n9VthxuNHpK0UQLoeBWU1r1Iqf3kVm9Bs6ZWwDGguLLKrm4
 HO1rTkFGUM6MTCDz+5Ycjss99m2E/xubezH4nDQLs883luhXPHzCftwZ8kMM+6ijAbIZRwtrXr1r+
 r+dYzLFHJsWMJtAH/LMRcLnnCOor+PCYpCvlK82HEl8il7arASoumAUSfBxLKH48bK5u56VyjawzF
 Mjyta4kYP8cp6QyokN5wl+/q;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jb0cV-00058X-KG; Tue, 19 May 2020 11:41:15 +0000
Date: Tue, 19 May 2020 13:41:13 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.12.3 Available for Download
Message-ID: <20200519114112.GA12615@carrie2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
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


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
---------------------


This is the latest stable release of the Samba 4.12 release series.


Changes since 4.12.2
--------------------

o  Jeremy Allison <jra@samba.org>
   * BUG 14301: Fix smbd panic on force-close share during async io.
   * BUG 14343: s3: vfs_full_audit: Add missing fcntl entry in vfs_op_names=
[]
     array.
   * BUG 14361: vfs_io_uring: Fix data corruption with Windows clients.
   * BUG 14372: Fix smbd crashes when MacOS Catalina connects if iconv
     initialization fails.

o  Ralph Boehme <slow@samba.org>
   * BUG 14150: Exporting from macOS Adobe Illustrator creates multiple cop=
ies.
   * BUG 14256: smbd does a chdir() twice per request.
   * BUG 14320: smbd mistakenly updates a file's write-time on close.
   * BUG 14350: vfs_shadow_copy2: implement case canonicalisation in
     shadow_copy2_get_real_filename().
   * BUG 14375: Fix Windows 7 clients problem after upgrading samba file se=
rver.

o  Alexander Bokovoy <ab@samba.org>
   * BUG 14359: s3: Pass DCE RPC handle type to create_policy_hnd.

o  Isaac Boukris <iboukris@gmail.com>
   * BUG 14155: Fix uxsuccess test with new MIT krb5 library 1.18.
   * BUG 14342: mit-kdc: Explicitly reject S4U requests.

o  Anoop C S <anoopcs@redhat.com>
   * BUG 14352: dbwrap_watch: Set rec->value_valid while returning nested
     share_mode_do_locked().

o  Amit Kumar <amitkuma@redhat.com>
   * BUG 14345: lib:util: Fix smbclient -l basename dir.

o  Volker Lendecke <vl@samba.org>
   * BUG 14336: s3:libads: Fix ads_get_upn().
   * BUG 14348: ctdb: Fix a memleak.
   * BUG 14366: Malicous SMB1 server can crash libsmbclient.

o  Gary Lockyer <gary@catalyst.net.nz>
   * BUG 14330: ldb: Bump version to 2.1.3, LMDB databases can grow without
     bounds

o  Stefan Metzmacher <metze@samba.org>
   * BUG 14361: vfs_io_uring: Fix data corruption with Windows clients.

o  Noel Power <noel.power@suse.com>
   * BUG 14344: s3/librpc/crypto: Fix double free with unresolved credential
     cache.

o  Andreas Schneider <asn@samba.org>
   * BUG 14358: docs-xml: Fix usernames in pam_winbind manpages.


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

        https://www.samba.org/samba/history/samba-4.12.3.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCXsPF1AAKCRAoaL1+KxeT
UVQ+AJ0VpTPu7OL5Ax81kGwlnt2j0QvW2QCgujZnEVkyeTj2nmC2rdpm9946E9s=
=CLk7
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--


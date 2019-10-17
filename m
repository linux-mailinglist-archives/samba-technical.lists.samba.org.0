Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD7FDAAA5
	for <lists+samba-technical@lfdr.de>; Thu, 17 Oct 2019 12:57:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=gsK3gatLXDHl3x5VIHWmbDoFpb2+CivxVYeA5dul0Yk=; b=vCnVv4TFb99KmZzvimk+O/EyWR
	vuwfFnvwm7IJr7yq19QJ6uQsM6mT98e+xTbSykI+kOUR1rP5X4haYQxEgAFkCrJyF7rurg0myqEyX
	aRFxwVKXwMNgVWbuRiua959Yf/dwtKdiA+GLGrDpXkJfa2JU7n8UOcOzdyA2jDcYljnp0Lp7w6vNN
	CMc+FcukA20KUv2MG9YRrprKu0L9JBiRD9Yc2m8zkyBORo8ftammkcw30VWHR7EWzmD7xLdlX+2Sa
	CzaC3it9tXRsD01rnTXlGS02avUDViJBmuB7LaXvupmppzUiGj4USDMxt46JphU0MmPAKal9Yw8Kq
	Vu7AY6tA==;
Received: from localhost ([::1]:29746 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iL3Su-0000NI-4S; Thu, 17 Oct 2019 10:57:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27812) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iL3ST-0000Mc-C5; Thu, 17 Oct 2019 10:56:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=gsK3gatLXDHl3x5VIHWmbDoFpb2+CivxVYeA5dul0Yk=; b=PWzoFysrtOFlN0gYms/whLAGbD
 6hcgguQMLueTrjv38uFr1GPgqfYGb1QpE/ttnfmGK8tnH//kl2MPC2Iwr6vbWhQFgxDgseXZLEMku
 obzps/m5UW0/xPKUMRmoJ3x1FRzrLstWaXfyGAO2EjhRuoi9ZZbnkutDWxXvA5rR3tKmFkqEFK6dj
 j641hZLOBtE0ao74O41ZcEncGamkvkmMINYav/lQOtMzfiqcYn3+CcribYOB3Q0dwIvzyX8CjZVos
 hf6zI8oj8tYnh54UHXnPgoCsgQjAQ3wC/2mZXLEwoohlnVlLtr823/ie1R3GQwh3SuVxqOSPg3mL+
 bsni2RUoPUvv+DAK8SSCg5vIQOoiWebo5/c3ae3Wd7irw8Af4oz0Zd6A735Vmilzsfc2QZCjYAqXO
 MY3NKUgM5xuRMPPnVRogJkAgcsqS+M/V1k+xOnk1DWOp2fhT+64I9R4RnvaXG9fxO7i2OPXgBBvK8
 c3/21DG9NEC1LTP3ujr1c4Zl;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iL3SS-0000QK-Eo; Thu, 17 Oct 2019 10:56:40 +0000
Date: Thu, 17 Oct 2019 12:56:39 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.10.9 Available for Download
Message-ID: <20191017105637.GA12990@carrie2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
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


--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
			"What is tolerance? It is the
			 consequence of humanity. We are
			 all formed of frailty and error;
			 let us pardon reciprocally each
			 other's folly - that is the
			 first law of nature."

			 Voltaire
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D


Release Announcements
---------------------

Changes since 4.10.8:
---------------------

o  Michael Adam <obnox@samba.org>
   * BUG 13972: Different Device Id for GlusterFS FUSE mount is causing data
     loss in CTDB cluster.
   * BUG 14141: winbind: Provide passwd struct for group sid with ID_TYPE_B=
OTH
     mapping (again).

o  Jeremy Allison <jra@samba.org>
   * BUG 14094: smbc_readdirplus() is incompatible with smbc_telldir() and
     smbc_lseekdir().
   * BUG 14152: s3: smbclient: Stop an SMB2-connection from blundering into
     SMB1-specific calls.

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
   * BUG 13978: s4/scripting: MORE py3 compatible print functions.

o  Andrew Bartlett <abartlet@samba.org>
   * ldb: Release ldb 1.5.6
   * BUG 13978: undoduididx: Add "or later" to warning about using tools fr=
om
     Samba 4.8.
   * BUG 13959: ldb_tdb fails to check error return when parsing pack forma=
ts.

o  Ralph Boehme <slow@samba.org>
   * BUG 14038: ctdb: Fix compilation on systems with glibc robust mutexes.

o  Isaac Boukris <iboukris@gmail.com>
   * BUG 11362: GPO security filtering based on the groups in Kerberos PAC =
(but
     primary group is missing).
   * BUG 14106: Fix spnego fallback from kerberos to ntlmssp in smbd server.

o  G=C3=BCnther Deschner <gd@samba.org>
   * BUG 14130: s3-winbindd: fix forest trusts with additional trust attrib=
utes.

o  Poornima G <pgurusid@redhat.com>
   * BUG 14098: vfs_glusterfs: Use pthreadpool for scheduling aio operation=
s.

o  Aaron Haslett <aaronhaslett@catalyst.net.nz>
   * BUG 13977: ldb: baseinfo pack format check on init.
   * BUG 13978: ldb: ldbdump key and pack format version comments.

o  Amitay Isaacs <amitay@gmail.com>
   * BUG 14140: Overlinking libreplace against librt and pthread against ev=
ery
     binary or library causes issues.
   * BUG 14147: ctdb-vacuum: Process all records not deleted on a remote no=
de.

o  Bj=C3=B6rn Jacke <bj@sernet.de>
   * BUG 14136: classicupgrade: Fix uncaught exception.
   * BUG 14139: fault.c: Improve fault_report message text pointing to our =
wiki.

o  Bryan Mason <bmason@redhat.com>
   * BUG 14128: s3:client:Use DEVICE_URI, instead of argv[0],for Device URI.

o  Stefan Metzmacher <metze@samba.org>
   * BUG 14055: We should send SMB2_NETNAME_NEGOTIATE_CONTEXT_ID negotiation
     context.
   * BUG 14124: 'pam_winbind' with 'krb5_auth' or 'wbinfo -K' doesn't work =
for
     users of trusted domains/forests principals" logic.

o  Anoop C S <anoopcs@redhat.com>
   * BUG 14093: vfs_glusterfs: Enable profiling for file system operations.

o  Christof Schmitt <cs@samba.org>
   * BUG 14032: vfs_gpfs: Implement special case for denying owner access to
     ACL.

o  Andreas Schneider <asn@samba.org>
   * BUG 13884: Joining Active Directory should not use SAMR to set the
     password.
   * BUG 14106: s3:libsmb: Do not check the SPNEGO neg token for KRB5.
   * BUG 14140: Overlinking libreplace against librt and pthread against ev=
ery
     binary or library causes issues.
   * BUG 14155: 'kpasswd' fails when built with MIT Kerberos.

o  Martin Schwenke <martin@meltin.net>
   * BUG 14084: CTDB replies can be lost before nodes are bidirectionally
     connected.
   * BUG 14087: "ctdb stop" command completes before databases are frozen.
   * BUG 14129: ctdb-tools: Stop deleted nodes from influencing ctdb nodest=
atus
     exit code.

o  Evgeny Sinelnikov <sin@altlinux.org>
   * BUG 14007: s3:ldap: Fix join with don't exists machine account.


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

        https://www.samba.org/samba/history/samba-4.10.9.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCXahI4gAKCRAoaL1+KxeT
USNBAJ4/PM4C+HXlU75zfJO9NMJMtXyl9QCfQ2El+T+019acbuO3TmgFimxvTlw=
=Bh6O
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--


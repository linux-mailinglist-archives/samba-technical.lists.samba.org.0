Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5263323CA
	for <lists+samba-technical@lfdr.de>; Tue,  9 Mar 2021 12:18:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=Ixd/tq8kEsCPDQ5I3S8Mgb91MaTyd3LKCVRTMztByhM=; b=uhB1u+LRnNEKSHL06QeR87yrI4
	0Ee7cbyCEiv/uckiaX6rCDCGR9pPdm2oPQ1LVFg9AsiJqAeEyiRPn7SEpI5nIp/AdVe/5ar1Khl7v
	NtsHNHLp6v34kOR6eYl3lwL1l7hDzPX6GMKlF3cohuCxo6e/YmPmERaBbORI1pHwH+OEQ4BlPZH8D
	/P7tSbasNL+luI8kxEDcIzFbTKBoaW16yYMvPztInh3kKFtW3lldrMpJjaaaa7Hvl8NRgq0O9+esG
	mZLBIPMcgoi8Y87FWnxSFnr3PVjVWukk+6OpO4f7z0jCfsr64ZUhVoyUrm83+nvql4rsJSD8F4sh2
	uiVu2GTw==;
Received: from ip6-localhost ([::1]:26756 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lJaMs-004bJp-8a; Tue, 09 Mar 2021 11:17:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41470) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lJaMc-004bJ9-5s; Tue, 09 Mar 2021 11:17:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=Ixd/tq8kEsCPDQ5I3S8Mgb91MaTyd3LKCVRTMztByhM=; b=Zw0eyrGjeSOwiIIUx6yVHV2lI0
 k/AzYsDSsLNMJQmiTvCsOhlxLj75J6ZesXimAwbPa8EdtXWBsx7bZHo3M724rg7/puFM8E9WBZRx7
 ILb3rcd1JcC0aBWzglMy2NjdBfJowkctnj/oefCm1mrixF4Yg9us0L4NFFQoIdaO9r8AjBH/oescH
 gWaNtc2Ch7RYHfWTiCBFlqB1y9UyLhdF4SujBT+i0MbMpek0i/BmqGU5QwtTUetUx+rzhfKmW5ksv
 4DcKIJyaARZ0aT0jEYG2k1rVOfn3hQXPMQmuHoooAq1q8J4v5PEAYyWWJUdEBO5PInQxLDh0T65TQ
 l9mtsy0ELUuEPWorDvmQdPN7PlSfU+V50Z25XEaDSYWRi35aRcgb4cpklWbrXBj4Ellyfbat1fRYx
 SPQiXrk1/JXkUAS6Fbrc6MoohITV3fjYWV/omaJY59JKHJo4SyTq1ltyE6tJXdYpQ1NYDcJa2b0JL
 9mt1KC/CYUenxzp4Re7TpvHL;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1lJaMR-0008L2-GU; Tue, 09 Mar 2021 11:17:11 +0000
Date: Tue, 9 Mar 2021 12:17:05 +0100
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.13.5 Available for Download
Message-ID: <20210309111703.GA14773@carrie2.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
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


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
---------------------

This is the latest stable release of the Samba 4.13 release series.


Changes since 4.13.4
--------------------

o  Trever L. Adams <trever.adams@gmail.com>
   * BUG 14634: s3:modules:vfs_virusfilter: Recent talloc changes cause inf=
inite
     start-up failure.

o  Jeremy Allison <jra@samba.org>
   * BUG 13992: s3: libsmb: Add missing cli_tdis() in error path if encrypt=
ion
     setup failed on temp proxy connection.
   * BUG 14604: smbd: In conn_force_tdis_done() when forcing a connection c=
losed
     force a full reload of services.

o  Andrew Bartlett <abartlet@samba.org>
   * BUG 14593: dbcheck: Check Deleted Objects and reduce noise in reports =
about
     expired tombstones.

o  Ralph Boehme <slow@samba.org
   * BUG 14503: s3: Fix fcntl waf configure check.
   * BUG 14602: s3/auth: Implement "winbind:ignore domains".
   * BUG 14617: smbd: Use fsp->conn->session_info for the initial
     delete-on-close token.

o  Peter Eriksson <pen@lysator.liu.se>
   * BUG 14648: s3: VFS: nfs4_acls. Add missing TALLOC_FREE(frame) in error
     path.

o  Bj=C3=B6rn Jacke <bj@sernet.de>
   * BUG 14624: classicupgrade: Treat old never expires value right.

o  Volker Lendecke <vl@samba.org>
   * BUG 14636: g_lock: Fix uninitalized variable reads.

o  Stefan Metzmacher <metze@samba.org>
   * BUG 13898: s3:pysmbd: Fix fd leak in py_smbd_create_file().

o  Andreas Schneider <asn@samba.org>
   * BUG 14625: lib:util: Avoid free'ing our own pointer.

o  Paul Wise <pabs3@bonedaddy.net>
   * BUG 12505: HEIMDAL: krb5_storage_free(NULL) should work.


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
using GnuPG (ID AA99442FB680B620).  The source code can be downloaded
=66rom:

        https://download.samba.org/pub/samba/stable/

The release notes are available online at:

        https://www.samba.org/samba/history/samba-4.13.5.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCYEdZLAAKCRAoaL1+KxeT
UTElAJ9zL6irMelaHCYn4lj74LUBK5weNwCeP5yaxVW8aTearr8I3Zg3pMwRRf4=
=Rx01
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--


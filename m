Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D86CF37A49F
	for <lists+samba-technical@lfdr.de>; Tue, 11 May 2021 12:30:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=HYNTpfa3ReiVqP2yVIVdwXWMFS+NL4zjF3xYjAhotSA=; b=RhNBTZs0XMkUq/n84//hfdVsnR
	WJLBkfdOKu9vxPXZf+V/kYJ8MhdqpAdZ3zvzLPx6nEC6LhIspIr3l099c6OvGCP8sq4scUYrWuHrE
	ww+oFK86iMohLV+3qhLlaGP+ABlkIzmpKcXPSR1ldSR1Yraazg3t7ZK42vbkCKVewd3W+sIg0pvSM
	f+7ay4y+6qfdgNCtB1ybyULQAxMtP5bn45ST95kQXa5qorTKaosys5ZfZCsKMS+yLvsGrWo0UFU0d
	bSAL9BGJZEfbwB4Q4yfcaFh7hNIx0m2LMsaoF1hZfcIpEbk3ceQQypGSnPqVWRiKCn1DB3TMvE0YT
	bs061waA==;
Received: from ip6-localhost ([::1]:58168 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lgPeG-00Gu01-1L; Tue, 11 May 2021 10:29:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60830) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lgPe4-00GtxH-Kk; Tue, 11 May 2021 10:29:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=HYNTpfa3ReiVqP2yVIVdwXWMFS+NL4zjF3xYjAhotSA=; b=PoAnlRLGAh2l1jsNAO8Ey3+Ckn
 lg3kiLEHpxT90jngZpdskDc2WiCvOenedl1+QEtd1bd3arhkm5iKb8deB9SV1Ma7gc9pZikGo4khZ
 Qi5UQ9ONEJp0wjFv8/mtDp7ATRXA11djRTBofRoRMxvY9XXg0vXN3ZPKn69YAsvlxQwoDVr3qXfEE
 uXMKpv8ZuJjLlND8tpn+6m/ZNm71L51nPAWMWOdTvmX6p1Zub+gDsKKPKwtAp07HX8UrK30NvrxI5
 Jw6VIX6ggz7xRRvxe3MW5VIlgbRBvSHCiiii7UTWAAWE7Dfmv4iLdjFxhiQ4OoSjDmH9RLhh2AvoH
 gCyNXGVAXV9lyhAa2eWG5ypnDBmz2iMDrX7OZnnmoQxMMuQ84vZrfWoW22Rk5oYkULkaSZe7JwPco
 K/tRuy6iEMC7LJhuJfKHVd1abU3SlDzBPApXAaHF13zUxUNynsGJ1tjjnTusaYQZUypGGfJNt3Cyt
 kXNvqZa+sSPhoB8+c3Qoy7iS;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1lgPe4-0002Gh-C8; Tue, 11 May 2021 10:29:44 +0000
Date: Tue, 11 May 2021 12:29:42 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.13.9 Available for Download
Message-ID: <20210511102940.GA13137@carrie2.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
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


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
---------------------

This is the latest stable release of the Samba 4.13 release series.


Changes since 4.13.8
--------------------

o  Jeremy Allison <jra@samba.org>
   * BUG 14696: s3: smbd: SMB1 SMBsplwr doesn't send a reply packet on succ=
ess.

o  Andrew Bartlett <abartlet@samba.org>
   * BUG 14689: Add documentation for dsdb_group_audit and dsdb_group_json_=
audit
     to "log level", synchronise "log level" in smb.conf with the code.

o  Ralph Boehme <slow@samba.org>
   * BUG 14672: Fix smbd panic when two clients open same file.
   * BUG 14675: Fix memory leak in the RPC server.=20
   * BUG 14679: s3: smbd: Fix deferred renames.

o  Samuel Cabrero <scabrero@samba.org>
   * BUG 14675: s3-iremotewinspool: Set the per-request memory context.

o  Volker Lendecke <vl@samba.org>
   * BUG 14675: rpc_server3: Fix a memleak for internal pipes.

o  Stefan Metzmacher <metze@samba.org>
   * BUG 11899: third_party: Update socket_wrapper to version 1.3.2.
   * BUG 14640: third_party: Update socket_wrapper to version 1.3.3.


o  Christof Schmitt <cs@samba.org>
   * BUG 14663: idmap_rfc2307 and idmap_nss return wrong mapping for uid/gid
     conflict.

o  Martin Schwenke <martin@meltin.net
   * BUG 14288: Fix the build on OmniOS.


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

        https://www.samba.org/samba/history/samba-4.13.9.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCYJpckgAKCRAoaL1+KxeT
Ud2RAKCKKrA57RttQz0IymPGvlwKUZGgjQCeKiiakZitVTLKDlGR7uVUsaE1Vjk=
=ed7t
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--


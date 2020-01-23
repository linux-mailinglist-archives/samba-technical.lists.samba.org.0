Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A6A146D5E
	for <lists+samba-technical@lfdr.de>; Thu, 23 Jan 2020 16:52:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=mhygbaDtf08L+5t9jv0+kQV/bO0j51OAS4R1RXFrBjI=; b=rv6/f0IK8q/eJw1K1JuzMYpMcp
	7GLdYQb/zMND3K3a0JeyDQmhcBC3WmxQL5hzqtIpQ9e18ZFwYfFOOahHucumJyne6qO6agvFfMgH+
	9+tQbyL2zExIz3eiQ2UF9R68mtlb7FKXMU5Umx8092xn2txPDbV2gKPdEcYaaOPYKUTxkrWCEoNI+
	pWK0v0aguPmKMRok3nr0h7C5cTBERCqZv0raR4HeHTR2zyaArb8tKzcTx9WZo7aIA8srLJgX9x68P
	6ftPceByW8FQwIwhvJDibxZlqncUZAtHDnfPM8iEuKWjMwK0urAsWwZGjbJ7D1gUoT+3XHGSkno66
	mQ0+YjDQ==;
Received: from localhost ([::1]:64308 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iuelv-004PEI-89; Thu, 23 Jan 2020 15:51:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18294) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iuelm-004PDc-Cj; Thu, 23 Jan 2020 15:51:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=mhygbaDtf08L+5t9jv0+kQV/bO0j51OAS4R1RXFrBjI=; b=uoQH2+9387I85TZkeXHjlWVU46
 wpqpc7eDQe2sLv5TIypnxXYNKKQtboegZwf2DaM7ioy4GbsBMmub/MPyLuqsN7H9LhqKsO0JXEzPo
 Xi4ARF93pcZ4nDsASPaLmUnCHssKu2zJsFPiTJ5qjngFao/tKYM7JiOc2wuP+xtJjVy6+pb86ngNW
 wNLfg0BlxhXN9WiV4SzXO5eO4jZvKS55QOzge617pB7R0hWVz4fln57SO2NTfg5Erixa7RkkFnjwH
 Zukb0Qq/BNL6H76OmM/gjxLVxXZ5XQuG9aMo6jtkvdG72wEivgJO3HzKDgLqSIG888lCkretQeFXX
 d2G4EXe7HaNLbKmuC7gXJnZfiHa1x7LsX1ZjXzV2MnNZo9Y06BvuOQFuVhmo5/uWLP01HI0vErZB1
 f97udzLToetzIvPrrTz8tQYTTS8WuduqDNenzYeF/oCLCu5sF3HzaFz/LfAWPaBaUt861JeWcxlCe
 jw9x8ULnj/3Vir4ismiP0q9X;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iuell-0002A5-Vq; Thu, 23 Jan 2020 15:51:46 +0000
Date: Thu, 23 Jan 2020 16:51:44 +0100
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.10.13 Available for Download
Message-ID: <20200123155142.GA18422@carrie2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
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


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
			"It's better to be a lion for a
			 day than a sheep all your
			 life."

			 Elizabeth Kenny
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D


Release Announcements
---------------------

This is the latest stable release of the Samba 4.10 release series.


Changes since 4.10.12
----------------------

o  Jeremy Allison <jra@samba.org>
   * BUG 14161: s3: libsmb: Ensure SMB1 cli_qpathinfo2() doesn't return an
     inode number.
   * BUG 14174: s3: utils: smbtree. Ensure we don't call cli_RNetShareEnum()
     on an SMB1 connection.
   * BUG 14176: s3: libsmb: Ensure return from net_share_enum_rpc() sets
     cli->raw_status on error.
   * BUG 14189: s3: smbd: SMB2 - Ensure we use the correct session_id if
     encrypting an interim response.
   * BUG 14205: s3: smbd: Only set xconn->smb1.negprot.done =3D true after
     supported_protocols[protocol].proto_reply_fn() succeeds.

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
   * BUG 14209: pygpo: Use correct method flags.

o  Ralph Boehme <slow@samba.org>
   * BUG 13925: s3: Remove now unneeded call to cmdline_messaging_context().
   * BUG 14069: Incomplete conversion of former parametric options.
   * BUG 14070: Fix sync dosmode fallback in async dosmode codepath.
   * BUG 14171: vfs_fruit returns capped resource fork length.
   * BUG 13745: s3:printing: Fix %J substition.

o  Isaac Boukris <iboukris@gmail.com>
   * BUG 14116: libnet_join: Add SPNs for additional-dns-hostnames entries.

o  Torsten Fohrer <torsten.fohrer@sbe.de>
   * BUG 14209: Avoiding bad call flags with python 3.8, using METH_NOARGS
     instead of zero.

o  Bj=C3=B6rn Jacke <bjacke@samba.org>
   * BUG 14122: docs-xml/winbindnssinfo: Clarify interaction with idmap_ad =
etc.

o  Volker Lendecke <vl@samba.org>
   * BUG 14175: ctdb-tcp: Close inflight connecting TCP sockets after fork.

o  Stefan Metzmacher <metze@samba.org>
   * BUG 14153: s4:dirsync: Fix interaction of dirsync and extended_dn cont=
rols.

o  Gary Lockyer <gary@catalyst.net.nz>
   * BUG 14199: upgradedns: Ensure lmdb lock files linked.

o  Anoop C S <anoopcs@redhat.com>
   * BUG 14182: s3: VFS: glusterfs: Reset nlinks for symlink entries during
     readdir.

o  Christof Schmitt <cs@samba.org>
   * BUG 14140: wscript: Remove checks for shm_open and shmget.

o  Andreas Schneider <asn@samba.org>
   * BUG 14101: libsmbclient: smbc_stat() doesn't return the correct st_mode
     and also the uid/gid is not filled (SMBv1).
   * BUG 14168: replace: Only link libnsl and libsocket if required.
   * BUG 14219: librpc: Fix string length checking in
     ndr_pull_charset_to_null().

o  Uri Simchoni <uri@samba.org>
   * BUG 13856: heimdal-build: Avoid hard-coded /usr/include/heimdal in
     asn1_compile-generated code.

o  Martin Schwenke <martin@meltin.net>
   * BUG 14175: ctdb-tcp: Drop tracking of file descriptor for incoming
     connections.
   * BUG 14227: ctdb-scripts: Strip square brackets when gathering connecti=
on
     info.


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

        https://www.samba.org/samba/history/samba-4.10.13.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCXinBCwAKCRAoaL1+KxeT
UYV+AJ9G9dvUIyBBWaAcM8OGyncKsrtgegCdHgZoRSP0gqN2ZhltL35FoaYa3JY=
=UFVm
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--


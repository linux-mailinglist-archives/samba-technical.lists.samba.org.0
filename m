Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 259A82DAB97
	for <lists+samba-technical@lfdr.de>; Tue, 15 Dec 2020 12:03:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=TJX/5V6xKs0CFtcEp8SjELpy38tp2bd3r9KMjIN0tF8=; b=Pnbdy2xWn2LZJGptAtXPt6J+nO
	wCD2t42+/ZlJOZi/vHd2gHPkueEgdRDfG8QqTiQP/N9/ntTfCaznc1abVnQ6pxdfZbMiITAdCCsbG
	qXy/ta6FTxnhBJUCTyUuxOt29mj6wg//jE9aqtebqNglCn1ZsFrBtcQLmU+SflXeUvLojmdWdJoF1
	FDW+k7PYbIDMjPthY/+FrlGFiUOC1u7nxQ7MF3lJsx6yiHjpsPb5zxgeAwlVtxDBB5yqRw+hbZr4g
	IRj0ZOdG0u3jNNbtmnOGweHr6k3o2P72iW0RbeR4t+7xRlx+HdLM7FDv3PEsljH/KLjNeLZ/McbUA
	Zxh3ycrQ==;
Received: from ip6-localhost ([::1]:60704 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kp86P-001L3W-4d; Tue, 15 Dec 2020 11:02:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64162) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kp86E-001L2q-Is; Tue, 15 Dec 2020 11:02:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=TJX/5V6xKs0CFtcEp8SjELpy38tp2bd3r9KMjIN0tF8=; b=lM28x1M898vPcfONSbPhQ8rK8T
 itlH8kOnka5RApls/yiV4vYaXXZYYBUiy63HAsnepu2stHZZjqUVjsaBO5AjmjvKlC+hNXsT6R08Z
 wKhVbN3tr+N3hb6ZDNKx9I1FpjlmcfLomwIwaB6kodT1mI4jQzOsxQnYhhNuzCYu0WP+4ybVIf2kk
 PCAg54bYHBoIbIs9qpATOaThxZmww1xVJmpgd+4LL5YlAMIqOL0xynAyTqE3/IaLfC2C8jyGMGQXW
 0MgrHv0Nl4NzQjgJcRlGRLQaPUnKH+DEyqYjtFQSSuQuGHy8P2Oraxbp8AdvMPPKcKKfkVZKo5LL+
 UNqvKUT9JEZD3+i9aoQ0NT1tQHL67OhU+/3I96rsWOPrwUJBgHOE3LnkiWo4rXYr8Nx8p/QLH1u5u
 GVg9gRTRxa2lwB8g4TSvP2TzAGm3WO/Np4j32K+fsbuTkpt4xHYB9CGzn+THWptFfLudlH/g8YiTQ
 G97YbTmwj+j58972vIQ3MxqM;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1kp86D-0001AF-1v; Tue, 15 Dec 2020 11:02:33 +0000
Date: Tue, 15 Dec 2020 12:02:30 +0100
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.13.3 Available for Download
Message-ID: <20201215110228.GA17630@carrie2.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="VS++wcV0S1rZb1Fb"
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


--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
---------------------

This is the latest stable release of the Samba 4.13 release series.


Changes since 4.13.2
--------------------

o  Jeremy Allison <jra@samba.org>
   * BUG 14210: libcli: smb2: Never print length if smb2_signing_key_valid()
     fails for crypto blob.
   * BUG 14486: s3: modules: gluster. Fix the error I made in preventing ta=
lloc
     leaks from a function.=20
   * BUG 14515: s3: smbd: Don't overwrite contents of fsp->aio_requests[0] =
with
     NULL via TALLOC_FREE().
   * BUG 14568: s3: spoolss: Make parameters in call to user_ok_token() mat=
ch
     all other uses.
   * BUG 14590: s3: smbd: Quiet log messages from usershares for an unknown
     share.

o  Ralph Boehme <slow@samba.org>
   * BUG 14248: samba process does not honor max log size.
   * BUG 14587: vfs_zfsacl: Add missing inherited flag on hidden "magic"
     everyone@ ACE.

o  Isaac Boukris <iboukris@gmail.com>
   * BUG 13124: s3-libads: Pass timeout to open_socket_out in ms.

o  G=C3=BCnther Deschner <gd@samba.org>
   * BUG 14486: s3-vfs_glusterfs: Always disable write-behind translator.

o  Volker Lendecke <vl@samba.org>
   * BUG 14517: smbclient: Fix recursive mget.
   * BUG 14581: clitar: Use do_list()'s recursion in clitar.c.

o  Anoop C S <anoopcs@samba.org>
   * BUG 14486: manpages/vfs_glusterfs: Mention silent skipping of write-be=
hind
     translator.
   * BUG 14573: vfs_shadow_copy2: Preserve all open flags assuming ROFS.

o  Jones Syue <jonessyue@qnap.com>
   * BUG 14514: interface: Fix if_index is not parsed correctly.


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

        https://www.samba.org/samba/history/samba-4.13.3.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--VS++wcV0S1rZb1Fb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCX9iXwQAKCRAoaL1+KxeT
UdvxAKCf8/nCFLoQRaWaDOnXieI4OVZ/5QCfSptx7LWhUuDcq8iS+qeilqo9Qog=
=406F
-----END PGP SIGNATURE-----

--VS++wcV0S1rZb1Fb--


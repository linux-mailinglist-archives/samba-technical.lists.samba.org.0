Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A360429E720
	for <lists+samba-technical@lfdr.de>; Thu, 29 Oct 2020 10:21:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=Xp+LZb4lf+//5wlZiiND/IYr0xesPswnwG3YliigFqA=; b=RBNH09Fdf5kfVs1TQNg9HHGX2Q
	YTAUMCk6jCDxx9EnHauDDBXCXzQsepwuqHlEmjyN82w03OR1XnFgPSQrs1vmKuzgddZ0W9QyAVVAI
	TEaY53CdjatNLwvJZLVL0D6ydFiMa9bJyxRB7HrxpJngFjrjzOda9wbtoBmPCmB6TAluAJn8AfmHL
	VV/HTvrXmruEAMs/U/u/g4Ob2kmY5D+2c+g5OExHNakrHE6+qimOhy/N2zcN9ZdoCs2JgwuwmbjdB
	c+83k0lnFbKhpC3Ex4ejpFs2c7J4CfB0g3jpDZEzpw3l1vn6IbfWHVnNlicvWXtR1fdaaRp61Pb8i
	ApA1gzhg==;
Received: from ip6-localhost ([::1]:35886 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kY46l-00EGaD-5E; Thu, 29 Oct 2020 09:20:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35624) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kY46Z-00EGZW-0F; Thu, 29 Oct 2020 09:20:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=Xp+LZb4lf+//5wlZiiND/IYr0xesPswnwG3YliigFqA=; b=IKfmRUbBKkTMDZ+K0q13n456q/
 vpUYDVkggYHCeczM0g5WrjYMsS9/96im6V06NzvACmB3z1lbMK/NeUh2LGchhuOs2WJStPpF2YrWI
 Vz6GJkXid4n+9AQLyU+kcJxpGEd33GH2Bty+AlqKlf6Po8LxgjKaJVzk2kv22x64E5vJeZkNJhyqO
 4Nb50D4ycTQyaZ2fTfEyXi7oT+AhD/BTHjQC2ojtzRezzFo64dgBkZT5kKDCUP3xiaJbhJN4fmOgU
 Z5mNWbR+Ob13oJXsvpU9ZtMZhpzW/S9GaMiUGhNWuLoJY2BOqUTaQEHwI1oB2r3rpOCBSXbbYugxr
 cmCIVtv+OjsRxr9wW8Ppxx8EWoLwxVzN48sCBeIPIgUZVIpqYwdMLodl9wg6TgwjB1jR4o0bp3s6b
 zysU//EeAH0+V3MP1oK9GzIi+tqHdEOXUVcdFYRZEVYbV9qDfKwEdiPc0oJ7tmLPGcnIm/5RSt83Q
 9zyAURcuv0ZPFGbA3HUQBsa6;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1kY46X-0001Kx-Jz; Thu, 29 Oct 2020 09:20:22 +0000
Date: Thu, 29 Oct 2020 10:20:18 +0100
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.13.1, 4.12.9 and 4.11.15 Security Releases
 Available
Message-ID: <20201029092014.GA18893@carrie2.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
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


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
---------------------

These are a security releases in order to address the following defects:

o CVE-2020-14318: Missing handle permissions check in SMB1/2/3 ChangeNotify.
o CVE-2020-14323: Unprivileged user can crash winbind.
o CVE-2020-14383: An authenticated user can crash the DCE/RPC DNS with easi=
ly
		  crafted records.


=3D=3D=3D=3D=3D=3D=3D
Details
=3D=3D=3D=3D=3D=3D=3D

o  CVE-2020-14318:
   The SMB1/2/3 protocols have a concept of "ChangeNotify", where a client =
can
   request file name notification on a directory handle when a condition su=
ch as
   "new file creation" or "file size change" or "file timestamp update" occ=
urs.

   A missing permissions check on a directory handle requesting ChangeNotify
   meant that a client with a directory handle open only for
   FILE_READ_ATTRIBUTES (minimal access rights) could be used to obtain cha=
nge
   notify replies from the server. These replies contain information that s=
hould
   not be available to directory handles open for FILE_READ_ATTRIBUTE only.

o  CVE-2020-14323:
   winbind in version 3.6 and later implements a request to translate multi=
ple
   Windows SIDs into names in one request. This was done for performance
   reasons: Active Directory domain controllers can do multiple SID to name
   translations in one RPC call. It was an obvious extension to also offer =
this
   batch operation on the winbind unix domain stream socket that is availab=
le to
   local processes on the Samba server to reduce network round-trips to the
   domain controller.

   Due to improper input validation a hand-crafted packet can make winbind
   perform a NULL pointer dereference and thus crash.

o  CVE-2020-14383:
   Some DNS records (such as MX and NS records) usually contain data in the
   additional section. Samba's dnsserver RPC pipe (which is an administrati=
ve
   interface not used in the DNS server itself) made an error in handling t=
he
   case where there are no records present: instead of noticing the lack of
   records, it dereferenced uninitialised memory, causing the RPC server to
   crash. This RPC server, which also serves protocols other than dnsserver,
   will be restarted after a short delay, but it is easy for an authenticat=
ed
   non-admin attacker to crash it again as soon as it returns. The Samba DNS
   server itself will continue to operate, but many RPC services will not.

For more details, please refer to the security advisories.


Changes:
--------

o  Jeremy Allison <jra@samba.org>
   * BUG 14434: CVE-2020-14318: s3: smbd: Ensure change notifies can't get =
set
     unless the directory handle is open for SEC_DIR_LIST.

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
   * BUG 12795: CVE-2020-14383: Remote crash after adding NS or MX records =
using
     'samba-tool'.
   * BUG 14472: CVE-2020-14383: Remote crash after adding MX records.

o  Volker Lendecke <vl@samba.org>
   * BUG 14436: CVE-2020-14323: winbind: Fix invalid lookupsids DoS.


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

        https://www.samba.org/samba/history/samba-4.13.1.html
        https://www.samba.org/samba/history/samba-4.12.9.html
        https://www.samba.org/samba/history/samba-4.11.15.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iFwEABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCX5qJSwAKCRAoaL1+KxeT
UV3ZAJ9u1nyTlmTK0zb3QlfQ02temuJiFACYiV0uEvyOpqK1qIZuMlnB8c+5dw==
=YC/c
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--


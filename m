Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B93836E77E
	for <lists+samba-technical@lfdr.de>; Thu, 29 Apr 2021 11:00:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=V8V7SLf/gaw9/KeybmsGeDRosokszLSduuXt18u41iU=; b=SFXOU+CXGeh02QRvQWY/qzjCvY
	UNyJQweZaPViLBVUt0brFxasbrP05BHVEVSHK9UZUcW1ON94grYQX3UJ1EeiFJd4QLJVydwNwXijP
	+FJ/TMw1wJRZs8t3WXhuqr2svRzjYy0ddRolVoxAiAK1R+G2DxhqmVNuxI4thSoGIGPsaN833ohG0
	jaTjGjxrmWiyqVJJBOxQkWmbvl3nUiOcSMlPG/am4+sXoP/YQt29E17sM7W65yC2/7zTbd4B2/6fS
	kxGD+7Jv0SFz/UCUjvTWAuDdc56Xra32pTmL0UOLkPnt765zWxeBO4Rf72XjL4kREzfYfWeFbtD8g
	5CYRkmvg==;
Received: from ip6-localhost ([::1]:37382 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lc2Wm-00D2Ia-K7; Thu, 29 Apr 2021 09:00:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39192) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lc2Wa-00D2Hp-GH; Thu, 29 Apr 2021 08:59:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=V8V7SLf/gaw9/KeybmsGeDRosokszLSduuXt18u41iU=; b=2dvqjDPyh92HrsQORWj2o9smqY
 OhItfVn3AWAYQx6j1aNT+SUfYu5g3IyUPQtiZEw3df0f4esqIxcxHepHuEO0Yf4Il9Ot6qsm+B3MY
 dtplpR+PlEKrzktNmApRFOGcru5Gm6KzWTniRkD7erg9212puyCgrnz545btfRWR8XIy6rlKLX+a1
 XE0nElNuD9ML80a8LtoD11O/nUguU09WOX883E24GeHJGUobLhcM/OAzvaU+5wjbNFwZ/o5ZtwsdQ
 mILPrw62FNsdbrYrzGb0/J9y2CQZ/wJP6MJOITU03P4amPmepJHAmA/WCtW215yA5wh2BB5vYuBFM
 C/J/i0drlPS6yLiUCgEZBulRs0Tonq6nXc7QZrIQ7NudobS6qAYhbTdmUg+xfpANk34zNHpqkDg7J
 26Wg5blQLRCR3JzNnAGjiDIUeFqzoMyVlxA/L4jeq2rGWAvSynFdtVSIZ3ZQz7ZbL1T7lQOzh05iG
 A1e1yvCT1a8s9SU+cpeC5khX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1lc2WZ-0001td-U9; Thu, 29 Apr 2021 08:59:56 +0000
Date: Thu, 29 Apr 2021 10:59:54 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.14.4, 4.13.8 and 4.12.15 Security Releases
 Available
Message-ID: <20210429085952.GA10759@carrie2.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
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


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
---------------------

These are security releases in order to address the following defect:

o CVE-2021-20254: Negative idmap cache entries can cause incorrect group en=
tries
  in the Samba file server process token.


=3D=3D=3D=3D=3D=3D=3D
Details
=3D=3D=3D=3D=3D=3D=3D

o  CVE-2021-20254:
   The Samba smbd file server must map Windows group identities (SIDs) into=
 unix
   group ids (gids). The code that performs this had a flaw that could allo=
w it
   to read data beyond the end of the array in the case where a negative ca=
che
   entry had been added to the mapping cache. This could cause the calling =
code
   to return those values into the process token that stores the group
   membership for a user.

   Most commonly this flaw caused the calling code to crash, but an alert u=
ser
   (Peter Eriksson, IT Department, Link=C3=B6ping University) found this fl=
aw by
   noticing an unprivileged user was able to delete a file within a network
   share that they should have been disallowed access to.

   Analysis of the code paths has not allowed us to discover a way for a
   remote user to be able to trigger this flaw reproducibly or on demand,
   but this CVE has been issued out of an abundance of caution.


Changes
-------

o  Volker Lendecke <vl@samba.org>
   * BUG 14571: CVE-2021-20254: Fix buffer overrun in sids_to_unixids().


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

        https://www.samba.org/samba/history/samba-4.14.4.html
        https://www.samba.org/samba/history/samba-4.13.8.html
        https://www.samba.org/samba/history/samba-4.12.15.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCYIp1hQAKCRAoaL1+KxeT
UY+mAKCEpvl1w4erv2bLvDHJ/WT3JS+1xACgoZoby6t73ILnxFU/8czGUnATR7g=
=jVPM
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--


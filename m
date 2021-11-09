Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E521844B3CB
	for <lists+samba-technical@lfdr.de>; Tue,  9 Nov 2021 21:11:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=9uoLM4piT7r4ZEVcMks7tTCnYAIR1M0CquPJA1nYMtI=; b=aTHl5BPewlX26PY2QF2d6ZJlWM
	SNM4VGMpZ8rFMsB0/x++qWIrGJ7R5njEZZcrAFLxqxzZQ1QgWdTcU9HeZ+DZRAxTz8Ry09bUKsHIC
	NvI5pWE2hEfM6fypKu3uZR0pakF6vlBha4LtwJWhpppbai3WbqNzP6gtqracDf8pwoDNZbSR9Uo/D
	3jiscJzbf7lTN07GJ45OM5JU6wcVUbhDcSFbln/04JprppIDeOYlTuQoSpV+Bq/IOOqaHr1OI99fx
	YvZ1TiWUNHqBDbpUJYPZwjguHEwmtKXJYuR5Pj0izKJ6S6hrUyTDk5qVVygrHCqCBydzk7FMW5cuz
	g3AnthWg==;
Received: from ip6-localhost ([::1]:54276 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mkXRN-0096QG-ME; Tue, 09 Nov 2021 20:09:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57846) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mkVol-0091oh-Ku; Tue, 09 Nov 2021 18:26:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=9uoLM4piT7r4ZEVcMks7tTCnYAIR1M0CquPJA1nYMtI=; b=KnZIaNqLAjt1cnQkNJXZahFEer
 05QByenFe2O3P/GOpJtYISxMu09ZwdO8aDPb0VlbHvEJq7HTzjbiCgAv0+nGOWlKMwOzLN7y9IJpC
 dNJeL5TqjnImPXb7rGdcvTyKbkwoyljVWHVIwwDbFEjW7lGpSoOpXvgxYJboTu37M5EiH+3b4WA1s
 s/wzTTi+w6a1i+KnCf437zP1u4BMTWcm03xRBz+x8zuMqm9ZAUHEzTfwnG4mnBOqVjiI/pYW1BOJd
 MAlfxWFvhG7BCJazvh/+adeUpRSG4G6PKta+HQNK9ruw9nyyCqno0kSefxQXa9D4jCqj8VARMxPnO
 1xXKSi+RGs78n+iRtuLeNgP0gOP0E+ZM8ajZ4MysGXalx5Z1FRpXvgafL0d4s72RfAvWt5PSTggNO
 amxoikAY5I8MMqbubxug41Yo0RQnXvNTyzeYNJjKDT66kLDlTZPj9YKF8+6W+mozeuTrb1urGC9H6
 dfuB0l1jmZxcQOiqyUwmSde0;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mkVol-0063zZ-5x; Tue, 09 Nov 2021 18:25:59 +0000
Date: Tue, 9 Nov 2021 19:25:54 +0100
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.15.2, 4.14.10, 4.13.14 Security Releases are
 available for Download
Message-ID: <20211109182554.GA3180235@SERNOX19>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Content-Disposition: inline
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable



Release Announcements
---------------------

These are security releases in order to address the following defects:

o CVE-2016-2124:  SMB1 client connections can be downgraded to plaintext
                  authentication.
                  https://www.samba.org/samba/security/CVE-2016-2124.html

o CVE-2020-25717: A user on the domain can become root on domain members.
                  https://www.samba.org/samba/security/CVE-2020-25717.html
                  (PLEASE READ! There are important behaviour changes descr=
ibed)

o CVE-2020-25718: Samba AD DC did not correctly sandbox Kerberos tickets is=
sued
                  by an RODC.
                  https://www.samba.org/samba/security/CVE-2020-25718.html

o CVE-2020-25719: Samba AD DC did not always rely on the SID and PAC in Ker=
beros
                  tickets.
                  https://www.samba.org/samba/security/CVE-2020-25719.html

o CVE-2020-25721: Kerberos acceptors need easy access to stable AD identifi=
ers
                  (eg objectSid).
                  https://www.samba.org/samba/security/CVE-2020-25721.html

o CVE-2020-25722: Samba AD DC did not do suffienct access and conformance
                  checking of data stored.
                  https://www.samba.org/samba/security/CVE-2020-25722.html

o CVE-2021-3738:  Use after free in Samba AD DC RPC server.
                  https://www.samba.org/samba/security/CVE-2021-3738.html

o CVE-2021-23192: Subsequent DCE/RPC fragment injection vulnerability.
                  https://www.samba.org/samba/security/CVE-2021-23192.html

There's sadly a regression that "allow trusted domains =3D no" prevents win=
bindd
=66rom starting, we'll try to provide a follow up fix as soon as possible.

Changes:
--------------------

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
   * CVE-2020-25722

o  Andrew Bartlett <abartlet@samba.org>
   * CVE-2020-25718
   * CVE-2020-25719
   * CVE-2020-25721
   * CVE-2020-25722

o  Ralph Boehme <slow@samba.org>
   * CVE-2020-25717

o  Alexander Bokovoy <ab@samba.org>
   * CVE-2020-25717

o  Samuel Cabrero <scabrero@samba.org>
   * CVE-2020-25717

o  Nadezhda Ivanova <nivanova@symas.com>
   * CVE-2020-25722

o  Stefan Metzmacher <metze@samba.org>
   * CVE-2016-2124
   * CVE-2020-25717
   * CVE-2020-25719
   * CVE-2020-25722
   * CVE-2021-23192
   * CVE-2021-3738
   * ldb release 2.3.2 (for Samba 4.14.10)
   * ldb release 2.2.3 (for Samba 4.13.14)

o  Andreas Schneider <asn@samba.org>
   * CVE-2020-25719

o  Joseph Sutton <josephsutton@catalyst.net.nz>
   * CVE-2020-17049
   * CVE-2020-25718
   * CVE-2020-25719
   * CVE-2020-25721
   * CVE-2020-25722
   * MS CVE-2020-17049


#######################################
Reporting bugs & Development Discussion
#######################################

Please discuss this release on the samba-technical mailing list or by
joining the #samba-technical IRC channel on irc.libera.chat or the
#samba-technical:matrix.org matrix channel.

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

        https://www.samba.org/samba/history/samba-4.15.2.html
        https://www.samba.org/samba/history/samba-4.14.10.html
        https://www.samba.org/samba/history/samba-4.13.14.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT7piwqO01BwrlU3LLHuFQ7rrL7egUCYYq9KgAKCRDHuFQ7rrL7
ev6DAQCG1xYypb8BJzyMdd0Ah/iBWNpeT9MrUCh7YGfABNYusAD/UAIWnFHAheHq
BiB3Nfh+iHx85vp1odoPgTpfpbcPAQU=
=5afN
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--


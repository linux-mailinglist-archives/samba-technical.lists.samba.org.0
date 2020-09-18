Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2EA26FCBA
	for <lists+samba-technical@lfdr.de>; Fri, 18 Sep 2020 14:41:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=l2xFgIKa1YVlrGu0Ga1en4KbPJStPZd0U1mTZyXgJBA=; b=rmzj24MJsjckieNsdQBB1H1VMk
	iaGIys0XeW6kDmal2kv4mIw7pDX5VTnU5pfARp169GvF+OBF5/ks5SEFJMJRPPKnl0ktZdxpe/X5n
	EbqI38nWH3dnTnpUGqzxFul88CgBlXmbD6frPimjl0196E/QwW5m0FIw9HuPWtPn3i8hu3RDs8Yo+
	oEplm5MBcCn8E8+yXdH7Exsd6rrXCKwhXQ1GZA15j1v1D4EuWtduz10S1I5iDkVniDCHIeh/oza1n
	fM1poNY+YaUE8OxLTihg1P80fJ9kaCIyQ9qgQHfzdTXbA+7KjJsGPCX97DcrWDoqqdVeoGYYSoj6d
	0kWx3BUw==;
Received: from localhost ([::1]:19176 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kJFgp-0069PF-UH; Fri, 18 Sep 2020 12:40:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28556) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kJFge-0069OY-Kx; Fri, 18 Sep 2020 12:40:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=l2xFgIKa1YVlrGu0Ga1en4KbPJStPZd0U1mTZyXgJBA=; b=ZqJvDJy1FdDv8VPnpui4dGnxjF
 VV0SwEFGOHmcsxId5lu6kHezAT4zD7PDinermacEQmPJnHXf8+kx1B/VlQXgF3vpNpVjAqlP3zkN0
 ZZQoYZeoD+4KFF7SV6WclzFVPp2tn74ftaFOAcVH4I+7DVIV9AiwkTAFSMdUDxU3bq4pS9PV7F14D
 ya6lji9mY4mKJ7RgLhzkAqDTCqts3zGQJ9iXlk+C6e+mhmoHaUg0SGxotQpqv+23aVXAojE017rR+
 6lRGurqe4rxDmbf6ZQLfKkwAm1QAmkHQDhbSWDmze4Qz7R2+HNjFYMT8tmMhKXG4q2X5k12dp06RX
 A2/Zz9hMlD3uzaCNNrV0hHtIFBP+ZEfi2omftfro8PCIbc9DGKJ6yuOdSN2ImdH9fXCuwKdNrjvHE
 Ca/8Dbk/6v9/lMYrSbzFm/CuU8G+WGjhC9HxEFAv9QSHKMSbK+y1QgaBUHn6pvGdKNwybH4th5vnU
 N4l/ZJcJbulNpKiSmXwqdC+i;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1kJFge-0001rc-B0; Fri, 18 Sep 2020 12:40:24 +0000
Date: Fri, 18 Sep 2020 14:40:22 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.12.7, 4.11.13 and 4.10.18 Security Releases
 Available
Message-ID: <20200918124014.GA3804@carrie2.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
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


--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
---------------------

These are security releases in order to address the following defect:

o CVE-2020-1472: Unauthenticated domain takeover via netlogon ("ZeroLogon").

The following applies to Samba used as domain controller only (most
seriously the Active Directory DC, but also the classic/NT4-style DC).

Installations running Samba as a file server only are not directly
affected by this flaw, though they may need configuration changes to
continue to talk to domain controllers (see "file servers and domain
members" below).

The netlogon protocol contains a flaw that allows an authentication
bypass. This was reported and patched by Microsoft as CVE-2020-1472.
Since the bug is a protocol level flaw, and Samba implements the
protocol, Samba is also vulnerable.

However, since version 4.8 (released in March 2018), the default
behaviour of Samba has been to insist on a secure netlogon channel,
which is a sufficient fix against the known exploits. This default is
equivalent to having 'server schannel =3D yes' in the smb.conf.

Therefore versions 4.8 and above are not vulnerable unless they have
the smb.conf lines 'server schannel =3D no' or 'server schannel =3D auto'.

Samba versions 4.7 and below are vulnerable unless they have 'server
schannel =3D yes' in the smb.conf.

Note each domain controller needs the correct settings in its smb.conf.

Vendors supporting Samba 4.7 and below are advised to patch their
installations and packages to add this line to the [global] section if
their smb.conf file.

The 'server schannel =3D yes' smb.conf line is equivalent to Microsoft's
'FullSecureChannelProtection=3D1' registry key, the introduction of
which we understand forms the core of Microsoft's fix.

Some domains employ third-party software that will not work with a
'server schannel =3D yes'. For these cases patches are available that
allow specific machines to use insecure netlogon. For example, the
following smb.conf:

   server schannel =3D yes
   server require schannel:triceratops$ =3D no
   server require schannel:greywacke$ =3D no

will allow only "triceratops$" and "greywacke$" to avoid schannel.

More details can be found here:
https://www.samba.org/samba/security/CVE-2020-1472.html


Changes:
--------

o  Jeremy Allison <jra@samba.org>
   * BUG 14497: CVE-2020-1472(ZeroLogon): s3:rpc_server/netlogon: Protect
     netr_ServerPasswordSet2 against unencrypted passwords.

o  G=C3=BCnther Deschner <gd@samba.org>
   * BUG 14497: CVE-2020-1472(ZeroLogon): s3:rpc_server/netlogon: Support
     "server require schannel:WORKSTATION$ =3D no" about unsecure configura=
tions.

o  Gary Lockyer <gary@catalyst.net.nz>
   * BUG 14497: CVE-2020-1472(ZeroLogon): s4 torture rpc: repeated bytes in
     client challenge.

o  Stefan Metzmacher <metze@samba.org>
   * BUG 14497: CVE-2020-1472(ZeroLogon): libcli/auth: Reject weak client
     challenges in netlogon_creds_server_init()
     "server require schannel:WORKSTATION$ =3D no".


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

        https://www.samba.org/samba/history/samba-4.12.7.html
        https://www.samba.org/samba/history/samba-4.11.13.html
        https://www.samba.org/samba/history/samba-4.10.18.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCX2SqrAAKCRAoaL1+KxeT
UaCIAJ9An7Ua71llqDZ+z8D01PvMKL+xkQCgvPP2eaTzeOGtbjWXt/n21OWYQRg=
=UxAZ
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--


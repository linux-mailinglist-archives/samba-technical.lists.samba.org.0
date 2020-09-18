Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B768F26FE2C
	for <lists+samba-technical@lfdr.de>; Fri, 18 Sep 2020 15:23:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=pKOTcPhwXJrmyiuKYhFcSNo4YF9okqInuud4YQAJ4cc=; b=6Fpxt33XDy6qpBgJUxRZ2dzuh/
	uKbv4D+aKAIHTQVHezg+7bRETgIuS8k/7p21g8pkoaCbCFy6FjmFYzm5u5v2swsu8G9yT/UABlmLK
	gAbLFdJ6opNW6a1Jfu0folqAl1He53iVOtvoITA01bLKkWnyyA9mOCEGa3IyB/XmO4qOpnLv9VHjS
	0AXztsxdg7d/gTHedFPri4opGVjEq4vYtTfly8LvsGmnfxfbZw2PV+tEzUGpFiGobHXQJqh7oTIls
	eKXuUj3X2rF8Beelu5FKUK55I61e/nst1jjD0H3hZLuvwIMJlP2taTvMjfDC5bJk8dwPVqVBaWkip
	NDnmcSGA==;
Received: from localhost ([::1]:27948 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kJGLu-006AcX-Bt; Fri, 18 Sep 2020 13:23:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44848) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kJGLh-006Abm-E3; Fri, 18 Sep 2020 13:22:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=pKOTcPhwXJrmyiuKYhFcSNo4YF9okqInuud4YQAJ4cc=; b=0giVx9hfJTsU1m7oXAy66KgQY7
 8k+vfD/LRjmws/0JI1K0zeD61jjaqjLZ7E8njOOByA9z6BuZXrqS92dITXVedjI/jI8Y7vUPHN94H
 YB2nJvZqkrU7XR4eT9W1LxfEeiFCNPIpwDLW8f7ZG0njWLQRA/jq8jCC5HlVKBO0CguLD8rm4o990
 J1uT8NsCJj3JpEBAVnDTHeKkL6X8ZqyyJlST5xSTtP4ClpmL/Uo61W4ewXBc1he8009fQ5DU4SADK
 VzDLIm4QLKfNWJVRreL3lRdVIrLVuTd/kr3jBQxe6h2pCxymZpcCFz7H/CTGrtCCK+/XG6WA4zsH0
 7Tq9UBPMCHbT4HLpHSl7vYTUatR5FxYQp+WyR8WdkhkxjnYZxkTaXkDk4lIvviMuRuTabcdm1zMA8
 86V8WMUp6u32bwpQGZqOmAyDwEwb67mV22C85GIi+Yp5OpO3nJJ+oefU74dDAtL0MuxZC8BM+Bbfe
 6alwF/8mozW5Gq+1zdN6OVA1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1kJGLf-0002Tu-4h; Fri, 18 Sep 2020 13:22:47 +0000
Date: Fri, 18 Sep 2020 15:22:40 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.13.0rc6 Available for Download
Message-ID: <20200918132059.GA18680@SERNOX19>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="V0207lvV8h4k8FAm"
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--V0207lvV8h4k8FAm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This is the sixth release condidate of Samba 4.13.  This is *not*
intended for production environments and is designed for testing
purposes only.  Please report any defects via the Samba bug reporting
system at https://bugzilla.samba.org/.

Samba 4.13 will be the next version of the Samba suite.

SECURITY
=3D=3D=3D=3D=3D=3D=3D=3D

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


UPGRADING
=3D=3D=3D=3D=3D=3D=3D=3D=3D


NEW FEATURES/CHANGES
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Python 3.6 or later required
----------------------------

Samba's minimum runtime requirement for python was raised to Python
3.5 with samba 4.12.  Samba 4.13 raises this minimum version to Python
3.6 both to access new features and because this is the oldest version
we test with in our CI infrastructure.

This is also the last release where it will be possible to build Samba
(just the file server) with Python versions 2.6 and 2.7.

As Python 2.7 has been End Of Life upstream since April 2020, Samba
is dropping ALL Python 2.x support in the NEXT release.

Samba 4.14 to be released in March 2021 will require Python 3.6 or
later to build.

wide links functionality
------------------------

For this release, the code implementing the insecure "wide links =3D yes"
functionality has been moved out of the core smbd code and into a separate
VFS module, vfs_widelinks. Currently this vfs module is implicitly loaded
by smbd as the last but one module before vfs_default if "wide links =3D ye=
s"
is enabled on the share (note, the existing restrictions on enabling wide
links around the SMB1 "unix extensions" and the "allow insecure wide links"
parameters are still in force). The implicit loading was done to allow
existing users of "wide links =3D yes" to keep this functionality without
having to make a change to existing working smb.conf files.

Please note that the Samba developers recommend changing any Samba
installations that currently use "wide links =3D yes" to use bind mounts
as soon as possible, as "wide links =3D yes" is an inherently insecure
configuration which we would like to remove from Samba. Moving the
feature into a VFS module allows this to be done in a cleaner way
in future.

A future release to be determined will remove this implicit linkage,
causing administrators who need this functionality to have to explicitly
add the vfs_widelinks module into the "vfs objects =3D" parameter lists.
The release notes will be updated to note this change when it occurs.

NT4-like 'classic' Samba domain controllers
-------------------------------------------

Samba 4.13 deprecates Samba's original domain controller mode.

Sites using Samba as a Domain Controller should upgrade from the
NT4-like 'classic' Domain Controller to a Samba Active Directory DC
to ensure full operation with modern windows clients.

SMBv1 only protocol options deprecated
--------------------------------------

A number of smb.conf parameters for less-secure authentication methods
which are only possible over SMBv1 are deprecated in this release.

REMOVED FEATURES
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The deprecated "ldap ssl ads" smb.conf option has been removed.

The deprecated "server schannel" smb.conf option will very likely
removed in the final 4.13.0 release.


smb.conf changes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  Parameter Name                      Description                Default
  --------------                      -----------                -------
  ldap ssl ads                        Removed
  smb2 disable lock sequence checking Added                      No
  smb2 disable oplock break retry     Added                      No
  domain logons                       Deprecated                 no
  raw NTLMv2 auth                     Deprecated                 no
  client plaintext auth               Deprecated                 no
  client NTLMv2 auth                  Deprecated                 yes
  client lanman auth                  Deprecated                 no
  client use spnego                   Deprecated                 yes
  server schannel                     To be removed in 4.13.0
  server require schannel:COMPUTER    Added


CHANGES SINCE 4.13.0rc5
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

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


CHANGES SINCE 4.13.0rc4
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

o  Andreas Schneider <asn@samba.org>
   * BUG 14399: waf: Only use gnutls_aead_cipher_encryptv2() for GnuTLS >
     3.6.14.
   * BUG 14467: s3:smbd: Fix %U substitutions if it contains a domain name.
   * BUG 14479: The created krb5.conf for 'net ads join' doesn't have a dom=
ain
     entry.

o  Stefan Metzmacher <metze@samba.org>
   * BUG 14482: Fix build problem if libbsd-dev is not installed.


CHANGES SINCE 4.13.0rc3
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

o  David Disseldorp <ddiss@samba.org>
   * BUG 14437: build: Toggle vfs_snapper using "--with-shared-modules".

o  Volker Lendecke <vl@samba.org>
   * BUG 14465: idmap_ad does not deal properly with a RFC4511 section 4.4.1
     response.

o  Stefan Metzmacher <metze@samba.org>
   * BUG 14428: PANIC: Assert failed in get_lease_type().
   * BUG 14465: idmap_ad does not deal properly with a RFC4511 section 4.4.1
     response.


CHANGES SINCE 4.13.0rc2
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

o  Andrew Bartlett <abartlet@samba.org>
   * BUG 14460: Deprecate domain logons, SMBv1 things.

o  G=C3=BCnther Deschner <gd@samba.org>
   * BUG 14318: docs: Add missing winexe manpage.

o  Christof Schmitt <cs@samba.org>
   * BUG 14166: util: Allow symlinks in directory_create_or_exist.

o  Martin Schwenke <martin@meltin.net>
   * BUG 14466: ctdb disable/enable can fail due to race condition.


CHANGES SINCE 4.13.0rc1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

o  Andrew Bartlett <abartlet@samba.org>
   * BUG 14450: dbcheck: Allow a dangling forward link outside our known NC=
s.

o  Isaac Boukris <iboukris@gmail.com>
   * BUG 14462: Remove deprecated "ldap ssl ads" smb.conf option.

o  Volker Lendecke <vl@samba.org>
   * BUG 14435: winbind: Fix lookuprids cache problem.

o  Stefan Metzmacher <metze@samba.org>
   * BUG 14354: kdc:db-glue: Ignore KRB5_PROG_ETYPE_NOSUPP also for
     Primary:Kerberos.

o  Andreas Schneider <asn@samba.org>
   * BUG 14358: docs: Fix documentation for require_membership_of of
     pam_winbind.conf.

o  Martin Schwenke <martin@meltin.net>
   * BUG 14444: ctdb-scripts: Use nfsconf as a last resort get nfsd thread
     count.


KNOWN ISSUES
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.13#Release_bl=
ocking_bugs


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

        https://download.samba.org/pub/samba/rc/

The release notes are available online at:

        https://download.samba.org/pub/samba/rc/samba-4.13.0rc6.WHATSNEW.txt

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--V0207lvV8h4k8FAm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl9ktIkACgkQDbX1YShp
vVbJbxAAgII+TREbnt/AOlwgWb0ajv29X+R6aZLAAgpApjXM3eW4QUafaEskVFs7
yAp5EfZRMNIivVY09Wm+J8H/suGhN3lSVvV4jtzNfou2MjujyYqR64dVrPTNUWXL
tPHivYl+S217fmqlABN2Fgx11s1U1GsTk1fX+OKkoBoTgX1/oJKO4cd/K+5wZIDZ
+iL8lzkQVFo4DbJLsbG3vU1NHIusvmnpIURFlpXd1hc/WyNWZuN+z1p2ilk21Grq
TLIfSTc8K5LEzHBtwAXn0stEeTcosU0MyUnXQOt3L0pczXISRefku7Y9+YoYVHQt
D1Fw3TJPrjwOPEgeehEt5xuiAfeS8YwExIQvi+Kd1AofXlj97xZ9hwOH++AZzP1I
gF4kLLEtMkoIYq42+tN1gbR89P34S/NTj5szjkc9N2+z4KQm7iWQbu2yS4i70sEE
22fmHJzXM/tK0uZNXsxvWN/JHZijSt5IquNZMidcwXq+DXQikM+cM3L4/WuZp+fe
racNgVG5IKzzZLlO1SsCbvBD99UWebEI0ciY5PfFMlWjmhj6kfBfjflhrca3S0cy
n5aFrzfjWmiiiqawC3DNPO7Q0Z+CxDbhFH/r964kqXSO1C+AbsjecCiIzB8LY7Nn
RfOU2EVQCkqI3XxCa2stGl8Ofy80+cmcm8FvrDwgVbcPPjBEKwQ=
=2HUm
-----END PGP SIGNATURE-----

--V0207lvV8h4k8FAm--


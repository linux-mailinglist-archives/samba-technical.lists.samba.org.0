Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF113C9AF1
	for <lists+samba-technical@lfdr.de>; Thu, 15 Jul 2021 11:02:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=HLFp1UK0pGKNzLudsvyvePvP9Qb7II81Z8fdxeM3Z+c=; b=cvmnY50HyFOg7s/NJC16RTnqJI
	3Fz7aaE0mJUyfshVrvtgp6X+Rpod3zXDGlSiV992AIhQagp1xCnYZoWj+cu1C+goZluuewlgvxCKH
	4GGTppfZ0VdyDeMqzlVLe2TfxczPQ7kEEpmSZCiORmuk91Bl9kLsNziDY1YH5/KxRUXRGGNh96GVq
	xICR23rqGSEBPYaKUlqDSf5ZGLCaR1hYiJZ/OLgU3rrl8iYG3Zt4BLjR1kmdsrYaNItcDVjNZGEy4
	Vwqy7mEhdbKJHLSKtZWzAGep6nr//VZUqy6Yy+CbtVEAlrW4NiZD+wKQkUafRWWGmOe/SiyDptw+Q
	LsreLB6Q==;
Received: from ip6-localhost ([::1]:57578 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m3xFs-00Diyu-Fl; Thu, 15 Jul 2021 09:02:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48450) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m3xFi-00Dixv-6C; Thu, 15 Jul 2021 09:01:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=HLFp1UK0pGKNzLudsvyvePvP9Qb7II81Z8fdxeM3Z+c=; b=Hp3qRrPUJeSiV86jk+HCYDdpOs
 RCJu9hql5QZB3txmn/doIUNOhJA9IpczKRdqH/UPA5dbxfkVarqoPJa8iOEEcAg5zMGLcpNtLopyd
 0DQv+u1RguAxrK3QwlU986DVPFp9PYwstPGRi3n9vmNsacHjQxcwUQnCkzJEms3bvSUrUdQQR9vui
 Ee1PcHMPINII2zYpMW3AaMNLONr9e0yKWRAxh+Bt5mb5o3OVbqiegtrIFEv8WMfdiQdQ+jxq8wBzL
 TCoLlAj+hUDKssFVfhFkfTHAfDBVAnFO00CUOuqjQABLgd7pN9DLi71oB5MDrzfux75YWbDBkHfO7
 r8Jqow8n9EB/ewqktXv6jNy96hHgdrc2Mj+S08hc+H36xOTQI/MLGPjewVYJOkNZgwkP9zJUoN8Ru
 fKz1ADo29QbfpyozRvvtsho5k/nM5OAa5kP5Itx2iVW9qW1bGPiHU9f9seAwK3nNv9nll4Kiax7QU
 NCf62aFgb7yd5CHPITC3mikl;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1m3xFh-0005n8-Iz; Thu, 15 Jul 2021 09:01:53 +0000
Date: Thu, 15 Jul 2021 11:01:51 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.15.0rc1 Available for Download
Message-ID: <20210715090149.GA14814@carrie2.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
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


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This is the first release candidate of Samba 4.15.  This is *not*
intended for production environments and is designed for testing
purposes only.  Please report any defects via the Samba bug reporting
system at https://bugzilla.samba.org/.

Samba 4.15 will be the next version of the Samba suite.


UPGRADING
=3D=3D=3D=3D=3D=3D=3D=3D=3D

Removed SMB (development) dialects
----------------------------------

The following SMB (development) dialects are no longer
supported: SMB2_22, SMB2_24 and SMB3_10. They are were
only supported by Windows technical preview builds.
They used to be useful in order to test against the
latest Windows versions, but it's no longer useful
to have them. If you have them explicitly specified
in your smb.conf or an the command line,
you need to replace them like this:
- SMB2_22 =3D> SMB3_00
- SMB2_24 =3D> SMB3_00
- SMB3_10 =3D> SMB3_11
Note that it's typically not useful to specify
"client max protocol" or "server max protocol"
explicitly to a specific dialect, just leave
them unspecified or specify the value "default".

New GPG key
-----------

The GPG release key for Samba releases changed from:

pub   dsa1024/6F33915B6568B7EA 2007-02-04 [SC] [expires: 2021-02-05]
      Key fingerprint =3D 52FB C0B8 6D95 4B08 4332  4CDC 6F33 915B 6568 B7EA
uid                 [  full  ] Samba Distribution Verification Key <samba-b=
ugs@samba.org>
sub   elg2048/9C6ED163DA6DFB44 2007-02-04 [E] [expires: 2021-02-05]

to the following new key:

pub   rsa4096/AA99442FB680B620 2020-12-21 [SC] [expires: 2022-12-21]
      Key fingerprint =3D 81F5 E283 2BD2 545A 1897  B713 AA99 442F B680 B620
uid                 [ultimate] Samba Distribution Verification Key <samba-b=
ugs@samba.org>
sub   rsa4096/97EF9386FBFD4002 2020-12-21 [E] [expires: 2022-12-21]

Starting from Jan 21th 2021, all Samba releases will be signed with the new=
 key.

See also GPG_AA99442FB680B620_replaces_6F33915B6568B7EA.txt


NEW FEATURES/CHANGES
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- bind DLZ: Added the ability to set allow/deny lists for zone
  transfer clients.
  Up to now, any client could use a DNS zone transfer request
  to the bind server, and get an answer from Samba.
  Now the default behaviour will be to deny those request.
  Two new options have been added to manage the list of
  authorized/denied clients for zone transfer requests.
  In order to be accepted, the request must be issued by a client
  that is in the allow list and NOT in the deny list.

"server multi channel support" no longer experimental
-----------------------------------------------------

This option is enabled by default starting with to 4.15 (on Linux and FreeB=
SD).
Due to dependencies on kernel APIs of Linux or FreeBSD, it's only possible
to use this feature on Linux and FreeBSD for now.

samba-tool available without the ad-dc
--------------------------------------

The samba-tool command is now available when samba is configured
--without-ad-dc. Not all features will work, and some ad-dc specific options
have been disabled. The samba-tool domain options, for example, are limited
when no ad-dc is present. Samba must still be built with ads in order to en=
able
samba-tool.

Improved command line user experience
-------------------------------------

Samba utilities did not consistently implement their command line interface=
=2E A
number of options were requiring to specify values in one tool and not in t=
he
other, some options meant different in different tools.

These should be stories of the past now. A new command line parser has been
implemented with sanity checking. Also the command line interface has been
simplified and provides better control for encryption, singing and kerberos.

Also several command line options have a smb.conf variable to control the
default now.

All tools are logging to stderr by default. You can use --debug-stdout to
change the behavior.

### Common parser:

Options added:
--client-protection=3Doff|sign|encrypt

Options renamed:
--kerberos       ->    --use-kerberos=3Drequired|desired|off
--krb5-ccache    ->    --use-krb5-ccache=3DCCACHE
--scope          ->    --netbios-scope=3DSCOPE
--use-ccache     ->    --use-winbind-ccache

Options removed:
-e|--encrypt
-C removed from --use-winbind-ccache
-i removed from --netbios-scope
-S|--signing


### Duplicates in command line utils

ldbadd/ldbsearch/ldbdel/ldbmodify/ldbrename:
-e is not available for --editor anymore
-s is not used for --configfile anymore

ndrdump:
-l is not available for --load-dso anymore

net:
-l is not available for --long anymore

sharesec:
-V is not available for --viewsddl anymore

smbcquotas:
--user        ->    --quota-user

nmbd:
--log-stdout  ->    --debug-stdout

smbd:
--log-stdout  ->    --debug-stdout

winbindd:
--log-stdout  ->    --debug-stdout

Scanning of trusted domains and enterprise principals
-----------------------------------------------------

As an artifact from the NT4 times, we still scanned the list of trusted dom=
ains
on winbindd startup. This is wrong as we never can get a full picture in Ac=
tive
Directory. It is time to change the default value to "No". Also with this c=
hange
we always use enterprise principals for Kerberos so that the DC will be able
to redirect ticket requests to the right DC. This is e.g. needed for one way
trusts. The options `winbind use krb5 enterprise principals` and
`winbind scan trusted domains` will be deprecated in one of the next releas=
es.


REMOVED FEATURES
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Tru64 ACL support has been removed from this release. The last
supported release of Tru64 UNIX was in 2012.

NIS support has been removed from this release. This is not
available in Linux distributions anymore.

The DLZ DNS plugin is no longer built for Bind versions 9.8 and 9.9,
which have been out of support since 2018.


smb.conf changes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  Parameter Name                          Description     Default
  --------------                          -----------     -------
  client use kerberos                     New             desired
  client max protocol                     Values Removed
  client min protocol                     Values Removed
  client protection                       New             default
  client smb3 signing algorithms          New             see man smb.conf
  client smb3 encryption algorithms       New             see man smb.conf
  preopen:posix-basic-regex               New             No
  preopen:nomatch_log_level               New             5
  preopen:match_log_level                 New             5
  preopen:nodigits_log_level              New             1
  preopen:founddigits_log_level           New             3
  preopen:reset_log_level                 New             5
  preopen:push_log_level                  New             3
  preopen:queue_log_level                 New             10
  server max protocol                     Values Removed
  server min protocol                     Values Removed
  server multi channel support            Changed         Yes (on Linux and=
 FreeBSD)
  server smb3 signing algorithms          New             see man smb.conf
  server smb3 encryption algorithms       New             see man smb.conf
  winbind use krb5 enterprise principals  Changed         Yes
  winbind scan trusted domains            Changed         No


KNOWN ISSUES
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.15#Release_bl=
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
using GnuPG (ID AA99442FB680B620).  The source code can be downloaded
=66rom:

        https://download.samba.org/pub/samba/rc/

The release notes are available online at:

        https://download.samba.org/pub/samba/rc/samba-4.15.0rc1.WHATSNEW.txt

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCYO/5ewAKCRAoaL1+KxeT
URH6AKCOAGJrAwb/Hs4aS8sOhG2knPI6UACdGZ2noysIe74ITT4N9RfUGoHYeA4=
=CnXv
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--


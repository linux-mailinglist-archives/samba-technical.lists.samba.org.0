Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD263E4745
	for <lists+samba-technical@lfdr.de>; Mon,  9 Aug 2021 16:13:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=3nbDlsu4nfWqcVOQA7SPWWlVa2jebZq6PrA9V5VHeNc=; b=I3At/WbYJPymK6L7x2tJvt+ofL
	Ifvjx9OiNKCALSoiFhoKCfKYYXMzENFvzqKfg7nHs7/kbljzhBpbrjLR/ZNOzoU7B5fm2wV7Vhp7G
	WKxU5B9AX/m8oYAU7kCi7kWS3xJpV4ozlQXYhreze3We04RX+ioTaTsDw/oDzIAzIzMocNv9calR2
	MDCZKPOG3BPRTxRNeviNpxNIhQKWsva36oq2pbZZW/j/J+zMHRLEhO8sazdpHeG2A65rPNqnI9Gj5
	9G6yylONOiOlNW95CKKZtf9reUkkebIm8oN1K2Rhw+iVlorEXInebhFteJAnJZX6T8H1KT4jtwx63
	bTq2Apww==;
Received: from ip6-localhost ([::1]:41354 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mD610-005KwX-D7; Mon, 09 Aug 2021 14:12:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:19128) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mD60o-005KvZ-R1; Mon, 09 Aug 2021 14:12:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=3nbDlsu4nfWqcVOQA7SPWWlVa2jebZq6PrA9V5VHeNc=; b=zxH9V3KknZWlgEkjK8L8/V0HkX
 lKL8mcgbxndc3w0xP29Q3TnnbQacHmltp/rrmXX8DZBnQA8c2HIGg8FTxRkZ9Kno16x5UwNO3waF0
 UeC+HOwgI4wxXtv6jFPslXEu0Bi2KCZJvUWhobotufHX/uURIHLywflZwwar0vhTNm6f72MCuei9N
 zXq4EnEgPM/g0ricRUCS8I7T4JJml5lhNRXZpSUeQId7UxI1g+H0dIUGBD0KRqI/lEIi2z3JQCOM6
 xOMmE+6REKV4kAHziOytBlrHuEhddp4LhBccVJAwU7XMcLekvJ5Hy1GwS5RSNvFl17FSz0WXj5JtG
 U9IlR2WJ9M5cDOCnERpMETDV7uJkhTPmVzK32nRQCXvoUB8ks22+/mTKpObopvEfn2osUEWE4lYmm
 3Jl9KJ9yzopU+jX/93cQpUPj9MoxAqUHAeoVrrdtZaU49a96b7kBm3zoXvQuzQZ44ra+11Wsf+eY6
 PeSJdUM5r3dhGzrm7TNdHp9i;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mD60o-000NCZ-7j; Mon, 09 Aug 2021 14:12:18 +0000
Date: Mon, 9 Aug 2021 16:12:12 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.15.0rc2 Available for Download
Message-ID: <20210809141212.GA379388@SERNOX19>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
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


--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This is the second release candidate of Samba 4.15.  This is *not*
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

Support for Offline Domain Join (ODJ)
-------------------------------------

The net utility is now able to support the offline domain join feature
as known from the Windows djoin.exe command for many years. Samba's
implementation is accessible via the "net offlinejoin" subcommand. It
can provision computers and request offline joining for both Windows
and Unix machines. It is also possible to provision computers from
Windows (using djoin.exe) and use the generated data in Samba's net
utility. The existing options for the provisioning and joining steps
are documented in the net(8) manpage.


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


CHANGES SINCE 4.15.0rc1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

o  Andreas Schneider <asn@samba.org>
   * BUG 14768: smbd/winbind should load the registry if configured
   * BUG 14777: do not quote passed argument of configure script
   * BUG 14779: Winbind should not start if the socket path is too long

o  Stefan Metzmacher <metze@samba.org>
   * BUG 14607: tree connect failed: NT_STATUS_INVALID_PARAMETER
   * BUG 14764: aes-256-gcm and aes-256-ccm doesn't work in the server

o Ralph Boehme <slow@samba.org>
   * BUG 14700: file owner not available when file unredable

o Jeremy Allison <jra@samba.org>
   * BUG 14607: tree connect failed: NT_STATUS_INVALID_PARAMETER
   * BUG 14759: 4.15rc can leak meta-data about the directory containing the
     share path


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

        https://download.samba.org/pub/samba/rc/samba-4.15.0rc2.WHATSNEW.txt

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAmERN7UACgkQDbX1YShp
vVYzSA/9GdwvQcx7SDchV5RoyTyhu5XZCx6uz7ppO5QlcJ3cRrmWjN7TZTLd+L4R
cnRjWTv/3E17jpw1ZCj7tPQ78Qd/bnlOrwORpp9G8E5I8m5PHed21pRv8DLkII9V
8lvQS7rLkoLNes1OjuKwa3vfaJE2EVsnUniPesUHHlfiXuLqab+zwdbTsL+PiGwl
/EZ72XpLWXwM7rqTZ4D1TTJJO6g6NgsEWvmV3bz5Crl4qrWCZBKOMBT2JQ7SL31F
ZEtyVhNBOgzOWBe39oQ4K79Jn2OFdOmF8S1i3Xd83a2yHEG6Quvj3hf7W3Pynkg6
IEPLmJB3qitbYPVGgUzY/IWGifJ1+E1SEhZU7M95x5udXfI7aw9AKKOd3NBgDg64
ZybtpNpD2+zLQ7doUph/2HCc1zdKe9IxlIy4sj15ccE9jHxJUl2WoGZxGOMtJH35
PUlExoPYf4zZlQXHQNwQQ9Ds1GBwggSDKooxc6AaJnnB+4E66KHey+lFFczX+rwx
1Fab8TRBaU2IrVeY0rhsmOnLxDkvTagVbsZzvUgwnoABcJBPoNkFyCVsHG64sTi/
LAU0YZaoHNUSsdRDGbNM/oCajL+MUYq5rY4za2YNjL0lO81wulH/hqeIUBOQd7Hn
ADyrIypamE/YtbbAIzb4TGsYOe0rLaokMIceCVg5d0Q9yVrDhrg=
=igaf
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--


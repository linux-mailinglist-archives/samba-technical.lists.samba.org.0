Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0367C3FD706
	for <lists+samba-technical@lfdr.de>; Wed,  1 Sep 2021 11:42:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=EE8kV5u16AVmbA0jkKu64R0Z6fj5OTjysG3zNQqylEA=; b=mnh5xxUvah2T+EKVJBhFGnYrw1
	mmy0iUqPlE85Synug6WrdSwPPIgbEGw5+nY/t/ZHWPJBgP9bnkMRm3WB6jrv3KhjL3wcVofmH9Mb5
	3HF4WaCtlqVm+Lj4NcUKq5znF7nl7jqBdI2tQRlOUsC6GetvlAakHFH3U7HwjCigdKQlePJK6ZFSn
	mGYa/pRfLDOHhaNwAcO71VP5I8B/Qwi52nJ4Ol1i95Reah9OY6eX3WkroqLVqDqZWxcNoPWFKeVPX
	NXG3IlCP7hmVVU/EgnB0jlMglxSn73fHDEc3prw/JnFdZ9pKKP7SpbEXMAkaNWn7ohswGocTkJ+fh
	GhwzhdhA==;
Received: from ip6-localhost ([::1]:40020 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mLMkW-00CMDy-2e; Wed, 01 Sep 2021 09:41:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11774) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mLMkH-00CMCZ-Bz; Wed, 01 Sep 2021 09:41:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=EE8kV5u16AVmbA0jkKu64R0Z6fj5OTjysG3zNQqylEA=; b=hgUa3xdvJQ7jxuAJOpFv6JBn9N
 TvWgSA3ACKum/OaqxnwPOcVy52tZNFywfHYGdNOi/BQ2obKrXTOhhxptGp7KdrrITISGdYO5/a1TU
 vlbKniJIB28gOB2vFYZtf6cCW49j3kq7DGur+in494EjBxND87a1YsTJxOcmvxRmViJijOppczQcQ
 md0/A1ZaBDkjKWgqnpFEj/zEvZHsxBf4Sjio1U9pjaiXrgQzQGqSQYEAles26zFcFdwbI3AvpfrYX
 cHKbqdMUFkBlxv0YiDoa/TFDYeunqcMLwb3fWZMQuIiFSAqHY5Fe+klAuIYxAJLSZEKXlSALdUa/A
 VMJwTIdXF5cav8OlEZoLDXo4LDCmYzp6S47lY88mp84n9KOBWYOuft3D/BDEeOnZtM6yVJ5VaTaAk
 HX31bUob5wTDunZXoFh1piNM3wmjWcssSV0UJ1Jrtdj5PLDtXnGtyS0rcSP7ekSkdyg1qfm/0ZobC
 qUFKPin5tqLBNvjLdWGUbryV;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mLMkH-0042qR-1F; Wed, 01 Sep 2021 09:41:25 +0000
Date: Wed, 1 Sep 2021 11:41:22 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.15.0rc4 Available for Download
Message-ID: <20210901094122.GA24810@carrie>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="0F1p//8PRICkK4MW"
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: kseeger@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This is the fourth release candidate of Samba 4.15.  This is *not*
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

Bind DLZ: add the ability to set allow/deny lists for zone transfer clients
---------------------------------------------------------------------------

Up to now, any client could use a DNS zone transfer request to the
bind server, and get an answer from Samba. Now the default behaviour
will be to deny those request. Two new options have been added to
manage the list of authorized/denied clients for zone transfer
requests. In order to be accepted, the request must be issued by a
client that is in the allow list and NOT in the deny list.


"server multi channel support" no longer experimental
-----------------------------------------------------

This option is enabled by default starting with 4.15 (on Linux and FreeBSD).
Due to dependencies on kernel APIs of Linux or FreeBSD, it's only possible
to use this feature on Linux and FreeBSD for now.


samba-tool available without the ad-dc
--------------------------------------

The 'samba-tool' command is now available when samba is configured
"--without-ad-dc". Not all features will work, and some ad-dc specific opti=
ons
have been disabled. The 'samba-tool domain' options, for example, are limit=
ed
when no ad-dc is present. Samba must still be built with ads in order to en=
able
'samba-tool'.


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

All tools are logging to stderr by default. You can use "--debug-stdout" to
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
implementation is accessible via the 'net offlinejoin' subcommand. It
can provision computers and request offline joining for both Windows
and Unix machines. It is also possible to provision computers from
Windows (using djoin.exe) and use the generated data in Samba's 'net'
utility. The existing options for the provisioning and joining steps
are documented in the net(8) manpage.


'samba-tool dns zoneoptions' for aging control
----------------------------------------------

The 'samba-tool dns zoneoptions' command can be used to turn aging on
and off, alter the refresh and no-refresh periods, and manipulate the
timestamps of existing records.

To turn aging on for a zone, you can use something like this:

  samba-tool dns zoneoptions --aging=3D1 --refreshinterval=3D306600

which turns on aging and ensures no records less than five years old
are aged out and scavenged. After aging has been on for sufficient
time for records to be renewed, the command

  samba-tool dns zoneoptions --refreshinterval=3D168

will set the refresh period to the standard seven days. Using this two
step process will help prevent the temporary loss of dynamic records
if scavenging happens before their first renewal.


Marking old records as static or dynamic with 'samba-tool'
----------------------------------------------------------

A bug in Samba versions prior to 4.9 meant records that were meant to
be static were marked as dynamic and vice versa. To fix the timestamps
in these domains, it is possible to use the following options,
preferably before turning aging on.

   --mark-old-records-static
   --mark-records-dynamic-regex
   --mark-records-static-regex

The "--mark-old-records-static" option will make records older than the
specified date static (that is, with a zero timestamp). For example,
if you upgraded to Samba 4.9 in November 2018, you could use ensure no
old records will be mistakenly interpreted as dynamic using the
following option:

  samba-tool dns zoneoptions --mark-old-records-static=3D2018-11-30

Then, if you know that that will have marked some records as static
that should be dynamic, and you know which those are due to your
naming scheme, you can use commands like:

  samba-tool dns zoneoptions --mark-records-dynamic-regex=3D'\w+-desktop'

where '\w+-desktop' is a perl-compatible regular expression that will
match 'bob-desktop', 'alice-desktop', and so on.

These options are deliberately long and cumbersome to type, so people
have a chance to think before they get to the end. You can make a
mess if you get it wrong.

All 'samba-tool dns zoneoptions' modes can be given a "--dry-run/-n"
argument that allows you to inspect the likely results before going
ahead.

NOTE: for aging to work, you need to have "dns zone scavenging =3D yes"
set in the smb.conf of at least one server.


DNS tombstones are now deleted as appropriate
---------------------------------------------

When all the records for a DNS name have been deleted, the node is put
in a tombstoned state (separate from general AD object tombstoning,
which deleted nodes also go through). These tombstones should be
cleaned up periodically. Due to a conflation of scavenging and
tombstoning, we have only been deleting tombstones when aging is
enabled.

If you have a lot of tombstoned DNS nodes (that is, DNS names for
which you have removed all the records), cleaning up these DNS
tombstones may take a noticeable time.


DNS tombstones use a consistent timestamp format
------------------------------------------------

DNS records use an hours-since-1601 timestamp format except for in the
case of tombstone records where a 100-nanosecond-intervals-since-1601
format is used (this latter format being the most common in Windows).
We had mixed that up, which might have had strange effects in zones
where aging was enabled (and hence tombstone timestamps were used).


samba-tool dns update and RPC changes
-------------------------------------

The dnsserver DCERPC pipe can be used by 'samba-tool' and Windows tools
to manipulate dns records on the remote server. A bug in Samba meant
it was not possible to update an existing DNS record to change the
TTL. The general behaviour of RPC updates is now closer to that of
Windows.

'samba-tool dns update' is now a bit more careful in rejecting and
warning you about malformed IPv4 and IPv6 addresses.


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


CHANGES SINCE 4.15.0rc3
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

o  Bjoern Jacke <bj@sernet.de>
   * BUG 14800: util_sock: fix assignment of sa_socklen.


CHANGES SINCE 4.15.0rc2
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

o  Jeremy Allison <jra@samba.org>
   * BUG 14760: vfs_streams_depot directory creation permissions and store
     location problems.
   * BUG 14766: vfs_ceph openat() doesn't cope with dirfsp !=3D AT_FDCW.
   * BUG 14769: smbd panic on force-close share during offload write.
   * BUG 14805: OpenDir() loses the correct errno return.

o  Ralph Boehme <slow@samba.org>
   * BUG 14795: copy_file_range() may fail with EOPNOTSUPP.

o  Stefan Metzmacher <metze@samba.org>
   * BUG 14793: Start the SMB encryption as soon as possible.

o  Andreas Schneider <asn@samba.org>
   * BUG 14779: Winbind should not start if the socket path is too long.

o  Noel Power <noel.power@suse.com>
   * BUG 14760: vfs_streams_depot directory creation permissions and store
     location problems.


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

        https://download.samba.org/pub/samba/rc/

The release notes are available online at:

        https://download.samba.org/pub/samba/rc/samba-4.15.0rc4.WHATSNEW.txt

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--0F1p//8PRICkK4MW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCYS9KvwAKCRAoaL1+KxeT
USsTAJ9JQU2HZSVW5mdq7VB+rucs2rA8NQCgmVxpxtSeoxTUn2eaTLxciuOESfI=
=qTge
-----END PGP SIGNATURE-----

--0F1p//8PRICkK4MW--


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B28409099
	for <lists+samba-technical@lfdr.de>; Mon, 13 Sep 2021 15:52:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=LhqgTi8IfXalKOb8Ii/1gf1Na0j3r2Szu8DOcjyxjzs=; b=UC4HcE+1u0xJeVKnA5MSwLF0SN
	fobwQmqXmo/bM1S6QL3V4MvgwyWf4Eq5RGGssbBI2kf7QnxZ6WTL3HcqVUcS+YYR1P1Z4EFrKOxkb
	qW9M56QHa1GTvfrLGpFdrQXjU/BNRme7vqx0eCt3zfcPkfKlK1L2yIUWMXvZsMPc88JrHHX7jYvmH
	8ZJ1fYUH1T2u5aw174EdsdygCe7oivLibOVFJaeY6q7uvKHrSPYot7z1RJtciK/TeAd1f11DtoON7
	pfxOMTe94cyuKdQ1cZD0RjoX+iutwJw6hJ726yhuLADrPA/N3FNSG2IRSmh9Bwuq3EsNYWzCFpeir
	TONlIg1Q==;
Received: from ip6-localhost ([::1]:37232 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mPmNQ-00ErEX-JG; Mon, 13 Sep 2021 13:52:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43466) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mPmNI-00ErEE-At; Mon, 13 Sep 2021 13:52:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=LhqgTi8IfXalKOb8Ii/1gf1Na0j3r2Szu8DOcjyxjzs=; b=BYxLa7uJv82cEN3Fky9ZLC0CP4
 mfTygrEtvRh0jrhfqCQMYcLcyQTcEKkynnTHevtgEZ5s5feWv6AyNyY5BBu5/JgPhnwS7Grm1bZMK
 okzruJLYooGYBbbSAZpi8YOXQgpAZZsVdj7kKadDU8vCJA7AzfolkK7a+vWUv/5WmxH3bf5q6PvLy
 fGldA10hcv/m1bN69MK7GFXcXI5vh35RiZ2brwe3fzMIPqmWQ6xjFSCDU6OBAtBwXFtgev0116420
 BPRvONIrN0FCR5nVXYlCuPhmmwZBOe4mTSD5TAYbfypJ3v9VsNkUrCkmg+Oo1ygQ6+aoeFmoPvz2d
 uLx7G2S+270ILrVmjH/2IPxW7ZXanUOCDv+DnMMBuhB8qifBopjRTMPMkIWZCI8034fTwGLp0pE8G
 n0zDWQyUT2FUoPU4MwxSAkWkc6r4imQNxFHnn8GVL9vYTbGgYtSbZQriIBeQ+XsEqcd3KKqsaq+pP
 ryrPn+xXk3Ued+HHz+8BmJki;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mPmNH-005y00-Pc; Mon, 13 Sep 2021 13:51:55 +0000
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.15.0rc7 Available for Download
Message-ID: <0face119-0aa5-e7b8-6d0b-99387b1eca28@samba.org>
Date: Mon, 13 Sep 2021 15:51:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: de-DE
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Release Announcements
=====================

This is the seventh release candidate of Samba 4.15.  This is *not*
intended for production environments and is designed for testing
purposes only.  Please report any defects via the Samba bug reporting
system at https://bugzilla.samba.org/.

Samba 4.15 will be the next version of the Samba suite.


UPGRADING
=========

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
- SMB2_22 => SMB3_00
- SMB2_24 => SMB3_00
- SMB3_10 => SMB3_11
Note that it's typically not useful to specify
"client max protocol" or "server max protocol"
explicitly to a specific dialect, just leave
them unspecified or specify the value "default".

New GPG key
-----------

The GPG release key for Samba releases changed from:

pub   dsa1024/6F33915B6568B7EA 2007-02-04 [SC] [expires: 2021-02-05]
       Key fingerprint = 52FB C0B8 6D95 4B08 4332  4CDC 6F33 915B 6568 B7EA
uid                 [  full  ] Samba Distribution Verification Key 
<samba-bugs@samba.org>
sub   elg2048/9C6ED163DA6DFB44 2007-02-04 [E] [expires: 2021-02-05]

to the following new key:

pub   rsa4096/AA99442FB680B620 2020-12-21 [SC] [expires: 2022-12-21]
       Key fingerprint = 81F5 E283 2BD2 545A 1897  B713 AA99 442F B680 B620
uid                 [ultimate] Samba Distribution Verification Key 
<samba-bugs@samba.org>
sub   rsa4096/97EF9386FBFD4002 2020-12-21 [E] [expires: 2022-12-21]

Starting from Jan 21th 2021, all Samba releases will be signed with the 
new key.

See also GPG_AA99442FB680B620_replaces_6F33915B6568B7EA.txt

New minimum version for the experimental MIT KDC
------------------------------------------------

The build of the AD DC using the system MIT Kerberos, an
experimental feature, now requires MIT Kerberos 1.19.  An up-to-date
Fedora 34 has this version and has backported fixes for the KDC crash
bugs CVE-2021-37750 and CVE-2021-36222


NEW FEATURES/CHANGES
====================

VFS
---

The effort to modernize Samba's VFS interface is complete and Samba 
4.15.0 ships
with a modernized VFS designed for the post SMB1 world.

For details please refer to the documentation at 
source3/modules/The_New_VFS.txt
or visit the <https://wiki.samba.org/index.php/The_New_VFS>.


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
"--without-ad-dc". Not all features will work, and some ad-dc specific 
options
have been disabled. The 'samba-tool domain' options, for example, are 
limited
when no ad-dc is present. Samba must still be built with ads in order to 
enable
'samba-tool'.


Improved command line user experience
-------------------------------------

Samba utilities did not consistently implement their command line 
interface. A
number of options were requiring to specify values in one tool and not 
in the
other, some options meant different in different tools.

These should be stories of the past now. A new command line parser has been
implemented with sanity checking. Also the command line interface has been
simplified and provides better control for encryption, signing and kerberos.

Previously many tools silently ignored unknown options. To prevent 
unexpected
behaviour all tools will now consistently reject unknown options.

Also several command line options have a smb.conf variable to control the
default now.

All tools are now logging to stderr by default. You can use 
"--debug-stdout" to
change the behavior. All servers will log to stderr at early startup 
until logging
is setup to go to a file by default.

### Common parser:

Options added:
--client-protection=off|sign|encrypt

Options renamed:
--kerberos       ->    --use-kerberos=required|desired|off
--krb5-ccache    ->    --use-krb5-ccache=CCACHE
--scope          ->    --netbios-scope=SCOPE
--use-ccache     ->    --use-winbind-ccache

Options removed:
-e|--encrypt
-C removed from --use-winbind-ccache
-i removed from --netbios-scope
-S|--signing


### Duplicates in command line utils

ldbadd/ldbdel/ldbedit/ldbmodify/ldbrename/ldbsearch:
-e is still available as an alias for --editor,
    as it used to be.
-s is no longer reported as an alias for --configfile,
    it never worked that way as it was shadowed by '-s' for '--scope'.

ndrdump:
-l is not available for --load-dso anymore

net:
-l is not available for --long anymore

sharesec:
-V is not available for --viewsddl anymore

smbcquotas:
--user        ->    --quota-user

nmbd:
--log-stdout  ->    --debug-stdout

smbd:
--log-stdout  ->    --debug-stdout

winbindd:
--log-stdout  ->    --debug-stdout


Scanning of trusted domains and enterprise principals
-----------------------------------------------------

As an artifact from the NT4 times, we still scanned the list of trusted 
domains
on winbindd startup. This is wrong as we never can get a full picture in 
Active
Directory. It is time to change the default value to "No". Also with 
this change
we always use enterprise principals for Kerberos so that the DC will be able
to redirect ticket requests to the right DC. This is e.g. needed for one way
trusts. The options `winbind use krb5 enterprise principals` and
`winbind scan trusted domains` will be deprecated in one of the next 
releases.


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

   samba-tool dns zoneoptions --aging=1 --refreshinterval=306600

which turns on aging and ensures no records less than five years old
are aged out and scavenged. After aging has been on for sufficient
time for records to be renewed, the command

   samba-tool dns zoneoptions --refreshinterval=168

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

   samba-tool dns zoneoptions --mark-old-records-static=2018-11-30

Then, if you know that that will have marked some records as static
that should be dynamic, and you know which those are due to your
naming scheme, you can use commands like:

   samba-tool dns zoneoptions --mark-records-dynamic-regex='\w+-desktop'

where '\w+-desktop' is a perl-compatible regular expression that will
match 'bob-desktop', 'alice-desktop', and so on.

These options are deliberately long and cumbersome to type, so people
have a chance to think before they get to the end. You can make a
mess if you get it wrong.

All 'samba-tool dns zoneoptions' modes can be given a "--dry-run/-n"
argument that allows you to inspect the likely results before going
ahead.

NOTE: for aging to work, you need to have "dns zone scavenging = yes"
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

CVE-2021-3671: Crash in Heimdal KDC and updated security release policy
-----------------------------------------------------------------------

An unuthenticated user can crash the AD DC KDC by omitting the server
name in a TGS-REQ.  Per Samba's updated security process a specific
security release was not made for this issue as it is a recoverable
Denial Of Service.

See https://wiki.samba.org/index.php/Samba_Security_Proces

samba-tool domain backup offline with the LMDB backend
------------------------------------------------------

samba-tool domain backup offline, when operating with the LMDB backend
now correctly takes out locks against concurrent modification of the
database during the backup.  If you use this tool on a Samba AD DC
using LMDB, you should upgrade to this release for safer backups.

REMOVED FEATURES
================

Tru64 ACL support has been removed from this release. The last
supported release of Tru64 UNIX was in 2012.

NIS support has been removed from this release. This is not
available in Linux distributions anymore.

The DLZ DNS plugin is no longer built for Bind versions 9.8 and 9.9,
which have been out of support since 2018.


smb.conf changes
================

   Parameter Name                          Description     Default
   --------------                          -----------     -------
   client use kerberos                     New             desired
   client max protocol                     Values Removed
   client min protocol                     Values Removed
   client protection                       New             default
   client smb3 signing algorithms          New             see man smb.conf
   client smb3 encryption algorithms       New             see man smb.conf
   preopen:posix-basic-regex               New             No
   preopen:nomatch_log_level               New             5
   preopen:match_log_level                 New             5
   preopen:nodigits_log_level              New             1
   preopen:founddigits_log_level           New             3
   preopen:reset_log_level                 New             5
   preopen:push_log_level                  New             3
   preopen:queue_log_level                 New             10
   server max protocol                     Values Removed
   server min protocol                     Values Removed
   server multi channel support            Changed         Yes (on Linux 
and FreeBSD)
   server smb3 signing algorithms          New             see man smb.conf
   server smb3 encryption algorithms       New             see man smb.conf
   winbind use krb5 enterprise principals  Changed         Yes
   winbind scan trusted domains            Changed         No


CHANGES SINCE 4.15.0rc6
=======================

o  Andrew Bartlett <abartlet@samba.org>
    * BUG 14791: All the ways to specify a password are not documented.

o  Ralph Boehme <slow@samba.org>
    * BUG 14790: vfs_btrfs compression support broken.
    * BUG 14828: Problems with commandline parsing.
    * BUG 14829: smbd crashes when "ea support" is set to no.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 14825: "{client,server} smb3 {signing,encryption} algorithms" 
should
      use the same strings as smbstatus output.
    * BUG 14828: Problems with commandline parsing.

o  Alex Richardson <Alexander.Richardson@cl.cam.ac.uk>
    * BUG 8773: smbd fails to run as root because it belongs to more than 16
      groups on MacOS X.

o  Martin Schwenke <martin@meltin.net>
    * BUG 14784: Fix CTDB flag/status update race conditions.


CHANGES SINCE 4.15.0rc5
=======================

o  Andrew Bartlett <abartlet@samba.org>
    * BUG 14806: Address a signifcant performance regression in database 
access
      in the AD DC since Samba 4.12.
    * BUG 14807: Fix performance regression in 
lsa_LookupSids3/LookupNames4 since
      Samba 4.9 by using an explicit database handle cache.
    * BUG 14817: An unuthenticated user can crash the AD DC KDC by 
omitting the
      server name in a TGS-REQ.
    * BUG 14818: Address flapping samba_tool_drs_showrepl test.
    * BUG 14819: Address flapping dsdb_schema_attributes test.

o  Luke Howard <lukeh@padl.com>
    * BUG 14817: An unuthenticated user can crash the AD DC KDC by 
omitting the
      server name in a TGS-REQ.

o  Gary Lockyer <gary@catalyst.net.nz>
    * BUG 14817: An unuthenticated user can crash the AD DC KDC by 
omitting the
      server name in a TGS-REQ.

o  Andreas Schneider <asn@samba.org>
    * BUG 14817: An unuthenticated user can crash the AD DC KDC by 
omitting the
      server name in a TGS-REQ.

o  Joseph Sutton <josephsutton@catalyst.net.nz>
    * BUG 14817: An unuthenticated user can crash the AD DC KDC by 
omitting the
      server name in a TGS-REQ.


CHANGES SINCE 4.15.0rc4
=======================

o  Jeremy Allison <jra@samba.org>
    * BUG 14809: Shares with variable substitutions cause core dump upon
      connection from MacOS Big Sur 11.5.2.
    * BUG 14816: Fix pathref open of a filesystem fifo in the DISABLE_OPATH
      build.

o  Andrew Bartlett <abartlet@samba.org>
    * BUG 14815: A subset of tests from Samba's selftest system were not 
being
      run, while others were run twice.

o  Ralph Boehme <slow@samba.org>
    * BUG 14771: Some VFS operations on pathref (O_PATH) handles fail on 
GPFS.
    * BUG 14787: net conf list crashes when run as normal user,
    * BUG 14803: smbd/winbindd started in daemon mode generate output on
      stderr/stdout.
    * BUG 14804: winbindd can crash because idmap child state is not fully
      initialized.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 14771: Some VFS operations on pathref (O_PATH) handles fail on 
GPFS.


CHANGES SINCE 4.15.0rc3
=======================

o  Bjoern Jacke <bj@sernet.de>
    * BUG 14800: util_sock: fix assignment of sa_socklen.


CHANGES SINCE 4.15.0rc2
=======================

o  Jeremy Allison <jra@samba.org>
    * BUG 14760: vfs_streams_depot directory creation permissions and store
      location problems.
    * BUG 14766: vfs_ceph openat() doesn't cope with dirfsp != AT_FDCW.
    * BUG 14769: smbd panic on force-close share during offload write.
    * BUG 14805: OpenDir() loses the correct errno return.

o  Ralph Boehme <slow@samba.org>
    * BUG 14795: copy_file_range() may fail with EOPNOTSUPP.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 14793: Start the SMB encryption as soon as possible.

o  Andreas Schneider <asn@samba.org>
    * BUG 14779: Winbind should not start if the socket path is too long.

o  Noel Power <noel.power@suse.com>
    * BUG 14760: vfs_streams_depot directory creation permissions and store
      location problems.


CHANGES SINCE 4.15.0rc1
=======================

o  Andreas Schneider <asn@samba.org>
    * BUG 14768: smbd/winbind should load the registry if configured
    * BUG 14777: do not quote passed argument of configure script
    * BUG 14779: Winbind should not start if the socket path is too long

o  Stefan Metzmacher <metze@samba.org>
    * BUG 14607: tree connect failed: NT_STATUS_INVALID_PARAMETER
    * BUG 14764: aes-256-gcm and aes-256-ccm doesn't work in the server

o Ralph Boehme <slow@samba.org>
    * BUG 14700: file owner not available when file unredable

o Jeremy Allison <jra@samba.org>
    * BUG 14607: tree connect failed: NT_STATUS_INVALID_PARAMETER
    * BUG 14759: 4.15rc can leak meta-data about the directory 
containing the
      share path


KNOWN ISSUES
============

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.15#Release_blocking_bugs


#######################################
Reporting bugs & Development Discussion
#######################################

Please discuss this release on the samba-technical mailing list or by
joining the #samba-technical IRC channel on irc.libera.chat or the
#samba-technical:matrix.org matrix channel.

If you do report problems then please try to send high quality
feedback. If you don't provide vital information to help us track down
the problem then you will probably be ignored.  All bug reports should
be filed under the Samba 4.1 and newer product in the project's Bugzilla
database (https://bugzilla.samba.org/).


======================================================================
== Our Code, Our Bugs, Our Responsibility.
== The Samba Team
======================================================================


================
Download Details
================

The uncompressed tarballs and patch files have been signed
using GnuPG (ID AA99442FB680B620).  The source code can be downloaded
from:

         https://download.samba.org/pub/samba/rc/

The release notes are available online at:

https://download.samba.org/pub/samba/rc/samba-4.15.0rc7.WHATSNEW.txt

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team


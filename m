Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C08496B0780
	for <lists+samba-technical@lfdr.de>; Wed,  8 Mar 2023 13:57:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=7VuT/sX+mAl0nEcATzSC4bonm0NCcJwvjRuT3DTHg68=; b=YWjeXXFee6MVi6jGmQ+EE/Hx4y
	NCrGIQXxneRrPisxnX51m4NTU0h3FLpb7iL8+VyU3+0czESwos8XWHQQr6eBbTbhy4Er+ke6E8JzE
	LzjDpGvTwedMEw9UeWkFJD2E+R/UJEQM3/yLL5v6TeqDViV+w2JSQdXwovbHk45u1xZ6FnLZgquna
	kUCVxun484z6vWI60yaSdgzbsQPHOtAW9it0a7f+g1Rdhv1BuuF6Lm8dvg6Df589Rd0unp9EAOttZ
	daGxNLsw1pDFSreyWNo1OOaVr2KqFt32Nqp3rqM5V7k9cYJCRDIvANFCLGIbVyTzfsrfmgGhMqxgX
	YY7hM/iQ==;
Received: from ip6-localhost ([::1]:45042 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pZtLX-000B7e-SE; Wed, 08 Mar 2023 12:56:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13978) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pZtLM-000B6h-OI; Wed, 08 Mar 2023 12:56:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=7VuT/sX+mAl0nEcATzSC4bonm0NCcJwvjRuT3DTHg68=; b=vDwGUaYMO7rVwciFkPoAb7aH8/
 HKYHeEKqL/yj8C1DqMHgPW7JhWDJu7+QiIubdpVOdmJnyyx1bRjju/asD4nBctvA/kmdpq7sEC9xO
 iBTI1REqHvDwe+hLVjYfoh2G0xdxsv3W3SPO9yqnbBBiuIvzpBlzvCrWPKeoMwzqDe16cJewMc6hJ
 CnHmtrsizrHwFBx5yknPklj6aemSL8PQCi+NrfXB3i0bqfpfqVYeX1RDKaMgOWGXO7QzdHdpv7czK
 v+OB0oK3JBWKvR/gTYk+GSKDL0mo5Y4HXTBDms1bIzppnGqWamQjq8maeyaUSSGjzi7wcQqetYBQO
 tnWO1jug5CNQa8JwHfup1U+yfn9seatrY66Bi2SALbUE9TPw0yjU/8qCHblgfDR+aGShaybvRj75W
 O+kftnNqL3+5RsITU62mUSdNuW3jADkpvpaYpYGaqymRTmEX/Kt3XX7OA3VtzkXSdMP0q5HNBjKES
 koNobXgmf2MNvKUWVMiwpPcw;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pZtLM-001S8f-6W; Wed, 08 Mar 2023 12:56:32 +0000
Message-ID: <f36ed1ad-1d2b-a102-3910-a2185bdf5e1b@samba.org>
Date: Wed, 8 Mar 2023 13:56:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.18.0 Available for Download
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
---------------------

This is the first stable release of the Samba 4.18 release series.
Please read the release notes carefully before upgrading.

NEW FEATURES/CHANGES
====================

SMB Server performance improvements
-----------------------------------

The security improvements in recent releases
(4.13, 4.14, 4.15, 4.16), mainly as protection against symlink races,
caused performance regressions for metadata heavy workloads.

While 4.17 already improved the situation quite a lot,
with 4.18 the locking overhead for contended path based operations
is reduced by an additional factor of ~ 3 compared to 4.17.
It means the throughput of open/close
operations reached the level of 4.12 again.

More succinct samba-tool error messages
---------------------------------------

Historically samba-tool has reported user error or misconfiguration by
means of a Python traceback, showing you where in its code it noticed
something was wrong, but not always exactly what is amiss. Now it
tries harder to identify the true cause and restrict its output to
describing that. Particular cases include:

  * a username or password is incorrect
  * an ldb database filename is wrong (including in smb.conf)
  * samba-tool dns: various zones or records do not exist
  * samba-tool ntacl: certain files are missing
  * the network seems to be down
  * bad --realm or --debug arguments

Accessing the old samba-tool messages
-------------------------------------

This is not new, but users are reminded they can get the full Python
stack trace, along with other noise, by using the argument '-d3'.
This may be useful when searching the web.

The intention is that when samba-tool encounters an unrecognised
problem (especially a bug), it will still output a Python traceback.
If you encounter a problem that has been incorrectly identified by
samba-tool, please report it on https://bugzilla.samba.org.

Colour output with samba-tool --color
-------------------------------------

For some time a few samba-tool commands have had a --color=yes|no|auto
option, which determines whether the command outputs ANSI colour
codes. Now all samba-tool commands support this option, which now also
accepts 'always' and 'force' for 'yes', 'never' and 'none' for 'no',
and 'tty' and 'if-tty' for 'auto' (this more closely matches
convention). With --color=auto, or when --color is omitted, colour
codes are only used when output is directed to a terminal.

Most commands have very little colour in any case. For those that
already used it, the defaults have changed slightly.

  * samba-tool drs showrepl: default is now 'auto', not 'no'

  * samba-tool visualize: the interactions between --color-scheme,
    --color, and --output have changed slightly. When --color-scheme is
    set it overrides --color for the purpose of the output diagram, but
    not for other output like error messages.

New samba-tool dsacl subcommand for deleting ACES
-------------------------------------------------

The samba-tool dsacl tool can now delete entries in directory access
control lists. The interface for 'samba-tool dsacl delete' is similar
to that of 'samba-tool dsacl set', with the difference being that the
ACEs described by the --sddl argument are deleted rather than added.

No colour with NO_COLOR environment variable
--------------------------------------------

With both samba-tool --color=auto (see above) and some other places
where we use ANSI colour codes, the NO_COLOR environment variable will
disable colour output. See https://no-color.org/ for a description of
this variable. `samba-tool --color=always` will use colour regardless
of NO_COLOR.

New wbinfo option --change-secret-at
------------------------------------

The wbinfo command has a new option, --change-secret-at=<DOMAIN CONTROLLER>
which forces the trust account password to be changed at a specified domain
controller. If the specified domain controller cannot be contacted the
password change fails rather than trying other DCs.

New option to change the NT ACL default location
------------------------------------------------

Usually the NT ACLs are stored in the security.NTACL extended
attribute (xattr) of files and directories. The new
"acl_xattr:security_acl_name" option allows to redefine the default
location. The default "security.NTACL" is a protected location, which
means the content of the security.NTACL attribute is not accessible
from normal users outside of Samba. When this option is set to use a
user-defined value, e.g. user.NTACL then any user can potentially
access and overwrite this information. The module prevents access to
this xattr over SMB, but the xattr may still be accessed by other
means (eg local access, SSH, NFS). This option must only be used when
this consequence is clearly understood and when specific precautions
are taken to avoid compromising the ACL content.

Azure Active Directory / Office365 synchronisation improvements
--------------------------------------------------------------

Use of the Azure AD Connect cloud sync tool is now supported for
password hash synchronisation, allowing Samba AD Domains to synchronise
passwords with this popular cloud environment.

REMOVED FEATURES
================


smb.conf changes
================

   Parameter Name                          Description     Default
   --------------                          -----------     -------
   acl_xattr:security_acl_name             New security.NTACL
   server addresses                        New


CHANGES SINCE 4.18.0rc4
=======================

o  Jeremy Allison <jra@samba.org>
    * BUG 15314: streams_xattr is creating unexpected locks on folders.

o  Volker Lendecke <vl@samba.org>
    * BUG 15310: New samba-dcerpc architecture does not scale gracefully.


CHANGES SINCE 4.18.0rc3
=======================

o  Andreas Schneider <asn@samba.org>
    * BUG 15308: Avoid that tests fail because other tests didn't do 
cleanup on
      failure.

o  baixiangcpp <baixiangcpp@gmail.com>
    * BUG 15311: fd_load() function implicitly closes the fd where it 
should not.


CHANGES SINCE 4.18.0rc2
=======================

o  Jeremy Allison <jra@samba.org>
    * BUG 15301: Improve file_modtime() and issues around smb3 unix test.

o  Ralph Boehme <slow@samba.org>
    * BUG 15299: Spotlight doesn't work with latest macOS Ventura.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 15298: Build failure on solaris with tevent 0.14.0 (and ldb 
2.7.0).
      (tevent 0.14.1 and ldb 2.7.1 are already released...)

o  John Mulligan <jmulligan@redhat.com>
    * BUG 15307: vfs_ceph incorrectly uses fsp_get_io_fd() instead of
      fsp_get_pathref_fd() in close and fstat.

o  Andreas Schneider <asn@samba.org>
    * BUG 15291: test_chdir_cache.sh doesn't work with 
SMBD_DONT_LOG_STDOUT=1.
    * BUG 15301: Improve file_modtime() and issues around smb3 unix test.


CHANGES SINCE 4.18.0rc1
=======================

o  Andrew Bartlett <abartlet@samba.org>
    * BUG 10635: Office365 azure Password Sync not working.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 15286: auth3_generate_session_info_pac leaks wbcAuthUserInfo.

o  Noel Power <noel.power@suse.com>
    * BUG 15293: With clustering enabled samba-bgqd can core dump due to use
      after free.


KNOWN ISSUES
============

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.18#Release_blocking_bugs


#######################################
Reporting bugs & Development Discussion
#######################################

Please discuss this release on the samba-technical mailing list or by
joining the #samba-technical:matrix.org matrix room, or
#samba-technical IRC channel on irc.libera.chat

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

         https://download.samba.org/pub/samba/stable/

The release notes are available online at:

         https://www.samba.org/samba/history/samba-4.18.0.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team


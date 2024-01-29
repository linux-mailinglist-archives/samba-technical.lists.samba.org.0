Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 960C5840C1F
	for <lists+samba-technical@lfdr.de>; Mon, 29 Jan 2024 17:48:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=fs/Z6SefkIwAB8i9GMZV8KU62x9uCuGNput5IEJ2f8o=; b=GDbTnlMnj00KhcDzPf9txgtXmt
	6YOr0gnCp7TGs5bxoScRUPQVQkjbG+GsRUCLrloVdZ3j5alQQUV/D0SDHpV7Cp1cH8zL3MVDRRYWB
	ZoL3O4EPUEKZ2FOBbk37+T9XODbaR9AqNmgsGcHEf7s5OoEg2M//3vf70esc3auPiqGle3KrBh0WA
	fDEdKEuJCHSadyzPx0m0bqiYjdoUQbimx2yK3TMUzlX8/vhTS8cOPG1lUigf4nGE4x5CBrgmimZrM
	hrfGgI5fwo0G8TUUX6hQIcGf4q1JgjKxfx4NOqrW3P6lfhJqmyvdPZn+RY4fLJ0MExNhr7nLyui40
	5jJU94Iw==;
Received: from ip6-localhost ([::1]:63986 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rUUnX-004vte-ME; Mon, 29 Jan 2024 16:47:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14528) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rUUnN-004vsx-R4; Mon, 29 Jan 2024 16:47:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=fs/Z6SefkIwAB8i9GMZV8KU62x9uCuGNput5IEJ2f8o=; b=ZTwudO16lFVf9sRKnUZsCw8rS5
 ya0i5NSCwUSLkoBhlUSgLpTdSuSEUvT5gQbsVLdxvfloIKEmt2DxPE2ijHO/vpbTppb4o0xuftLgv
 va3fW+kvJdY2QmZqyT0PQj8H8ZQ/iDxRd2yC6j8xjwoWt2bzkTtc9NvEcExZtfVROEciAgCD9bQJY
 CJII5J1GNXHkCj07jhprzFxHKb9ERclgVuS/iAnTiWQUQN456nbl2JeA0XhwFHKjIJFtQ2xQfMhzd
 04E9U3F3VPYvT+5V+778EFPl3DcJJJsxQkD00el2+17acmK4fGQNm6VH9OadoC33UNLttjdFu+igy
 nsdbPdMc9TRabiJwX6wuGK4MdbsFKi+k/A5ynJCug5ofTRjStYvXdtRRlRtAC9iarVCJpukanDfOb
 FdlWOgBGw7QCqmwPly4z9oJkjIdvp8CJs9o02qcrVGOhA9xSNzwo8Z9XOVAsXx6XOLwfChdhDqK1h
 CkeUc0IsIaBxwhlvmfnuY76J;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rUUnN-00AOva-0l; Mon, 29 Jan 2024 16:47:41 +0000
Message-ID: <e7c468ef-5466-4ae7-97c9-39c9fe6d627e@samba.org>
Date: Mon, 29 Jan 2024 17:47:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.20.0rc1 Available for Download
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
=====================

This is the first release candidate of Samba 4.20.  This is *not*
intended for production environments and is designed for testing
purposes only.  Please report any defects via the Samba bug reporting
system at https://bugzilla.samba.org/.

Samba 4.20 will be the next version of the Samba suite.


UPGRADING
=========


NEW FEATURES/CHANGES
====================

New Minimum MIT Krb5 version for Samba AD Domain Controller
-----------------------------------------------------------

Samba now requires MIT 1.21 when built against a system MIT Krb5 and
acting as an Active Directory DC.  This addresses the issues that were
fixed in CVE-2022-37967 (KrbtgtFullPacSignature) and ensures that
Samba builds against the MIT version that allows us to avoid that
attack.

Removed dependency on Perl JSON module
--------------------------------------

Distributions are advised that the Perl JSON package is no longer
required by Samba builds that use the imported Heimdal.  The build
instead uses Perl's JSON::PP built into recent perl5 versions.

Current lists of packages required by Samba for major distributions
are found in the bootstrap/generated-dists/ directory of a Samba
source tree.  While there will be some differences - due to features
chosen by packagers - comparing these lists with the build dependencies
in a package may locate other dependencies we no longer require.

samba-tool user getpassword / syncpasswords ;rounds= change
-----------------------------------------------------------

The password access tool "samba-tool user getpassword" and the
password sync tool "samba-tool user syncpasswords" allow attributes to
be chosen for output, and accept parameters like
pwdLastSet;format=GeneralizedTime

These attributes then appear, in the same format, as the attributes in
the LDIF output.  This was not the case for the ;rounds= parameter of
virtualCryptSHA256 and virtualCryptSHA512, for example as
--attributes="virtualCryptSHA256;rounds=50000"

This release makes the behaviour consistent between these two
features.  Installations using GPG-encrypted passwords (or plaintext
storage) and the rounds= option, will find the output has changed

from:
virtualCryptSHA256: {CRYPT}$5$rounds=2561$hXem.M9onhM9Vuix$dFdSBwF

to:
virtualCryptSHA256;rounds=2561: 
{CRYPT}$5$rounds=2561$hXem.M9onhM9Vuix$dFdSBwF

Group Managed service account client-side features
--------------------------------------------------

samba-tool has been extended to provide client-side support for Group
Managed Service accounts.  These accounts have passwords that change
automatically, giving the advantages of service isolation without risk
of poor, unchanging passwords.

Where possible, Samba's existing samba-tool password handling
commands, which in the past have only operated against the local
sam.ldb have been extended to permit operation against a remote server
with authenticated access to "-H ldap://$DCNAME"

Supported operations include:
  - reading the current and previous gMSA password via
    "samba-tool user getpassword"
  - writing a Kerberos Ticket Granting Ticket (TGT) to a local
    credentials cache with a new command
    "samba-tool user get-kerberos-ticket"

New Windows Search Protocol Client
----------------------------------

Samba now by default builds new experimental Windows Search Protocol (WSP)
command line client "wspsearch"

The "wspsearch" cmd-line utility allows a WSP search request to be sent
to a server (such as a windows server) that has the (WSP)
Windows Search Protocol service configured and enabled.

For more details see the wspsearch man page.

Allow 'smbcacls' to save/restore DACLs to file
--------------------------------------------

'smbcacls' has been extended to allow DACLs to be saved and restored
to/from a file. This feature mimics the functionality that windows cmd
line tool 'icacls.exe' provides. Additionally files created either
by 'smbcalcs' or 'icacls.exe' are interchangeable and can be used by
either tool as the same file format is used.

New options added are:
  - '--save savefile'    Saves DACLs in sddl format to file
  - '--recurse'          Performs the '--save' operation above on directory
                         and all files/directories below.
  - '--restore savefile' Restores the stored DACLS to files in directory

REMOVED FEATURES
================

Get locally logged on users from utmp
-------------------------------------

The Workstation Service Remote Protocol [MS-WKST] calls NetWkstaGetInfo
level 102 and NetWkstaEnumUsers level 0 and 1 return the list of locally
logged on users. Samba was getting the list from utmp, which is not
Y2038 safe. This feature has been completely removed and Samba will
always return an empty list.


smb.conf changes
================

   Parameter Name                          Description     Default
   --------------                          -----------     -------
   smb3 unix extensions                    Per share       -


KNOWN ISSUES
============

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.20#Release_blocking_bugs


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

         https://download.samba.org/pub/samba/rc/

The release notes are available online at:

https://download.samba.org/pub/samba/rc/samba-4.20.0rc1.WHATSNEW.txt

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team



Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 204F48782D0
	for <lists+samba-technical@lfdr.de>; Mon, 11 Mar 2024 16:12:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=h1407hJf+Me3KQA/Dw2yUti06t+Kz2GNI2mudzK7xQ0=; b=Qn1oDJFFlOiKjIGpcHE6qW5+th
	5d0d3P0zk3hohRl1izzDAf0+NrRTuJ3qHh//i8kVdc/3jZY3JrcDzGfKNv7PMCvwYVaZn5yD8C1vq
	mOdxeJaNn+kIRqQKjjohGvHp+BQ+V/nuSqy7BYh0ZdhlzwQ6458R4eDvFDno/tRC3u+geddTZadGI
	btj4RvzaYDHr5YqMcue2oeFJEPSPXfIsJI9zzwj8afg4mDfesQ9ii8frhV2DhS3t/XzxykdSoXLU5
	FExSy4oo+xyjncsAAXoWUv5K+cJKQ3ETQIiMlkUEF3DM5KeDi8F/pZOdJQxRVayNGd6HaK42YHvWp
	J5irt5+w==;
Received: from ip6-localhost ([::1]:62248 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rjhJx-00099O-V2; Mon, 11 Mar 2024 15:12:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59184) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rjhJo-00098i-DW; Mon, 11 Mar 2024 15:12:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=h1407hJf+Me3KQA/Dw2yUti06t+Kz2GNI2mudzK7xQ0=; b=3MTJS3XzzPjPaY9JxRiQhH43fI
 GNKZcCL7QPAUzpA5GcMD747xL1+aTP1sHOKkI8k0+nfGCHPFaaw12UcB8uMfT8C0y2XN4xO46ln2r
 sxTw6Z6duK7Tmwi5ohHVcCEUKRAF+zxysNQ/4c60hXDlVOD1LfoDuUdnzbDS6zjBzUqzkRWHlm/9m
 mDMu1sYfqoSyVF59Ly8CjBgvYLsE2+P7em1UHt0aqWoHz8kVysWmZ9lGjlwstsr4/FzLa6tnlz2xT
 oiqTvaU70K7HmMrVO5nAghzTAMEsiXls65wd7PmvMBkdEVscduok+8jLJAl/krCmbt9y+l9CmsIye
 LXhO9MtEOtJBOptnNd2UglelKzgeneNOblghrnera4PrG5UezlFcLXjfwOai6JG56ofp4TYxJlEaj
 BRfpRKXYMMwtcyn6N9ko3xmz0O70+rT+xNOG0PwmVoJYvAqUpvL0WEUV85CRnWyq4Wie/B6towxLE
 y4Bm89PfugeWxJ4mOggwaKHV;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rjhJo-000Hhk-33; Mon, 11 Mar 2024 15:12:01 +0000
Message-ID: <fdf67aa0-0faa-46f4-8780-668c1a948518@samba.org>
Date: Mon, 11 Mar 2024 16:12:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.20.0rc4 Available for Download
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

This is the fourth release candidate of Samba 4.20.  This is *not*
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

Samba-tool extensions for AD Claims, Authentication Policies and Silos
----------------------------------------------------------------------

samba-tool now allows users to be associated with claims.  In the
Samba AD DC, claims derive from Active Directory attributes mapped
into specific names.  These claims can be used in rules, which are
conditional ACEs in a security descriptor, that decide if a user is
restricted by an authentication policy.

samba-tool also allows the creation and management of authentication
policies, which are rules about where a user may authenticate from,
if NTLM is permitted, and what services a user may authenticate to.

Finally, support is added for the creation and management of
authentication silos, which are helpful in defining network boundaries
by grouping users and the services they connect to.

Please note: The command line syntax for these tools is not final, and
may change before the next release, as we gain user feedback.  The
syntax will be locked in once Samba offers 2016 AD Functional Level as
a default.

AD DC support for Authentication Silos and Authentication Policies
------------------------------------------------------------------

The Samba AD DC now also honours any existing claims, authentication
policy and authentication silo configuration previously created (eg
from an import of a Microsoft AD), as well as new configurations
created with samba-tool.  The use of Microsoft's Powershell based
client tools is not expected to work.

To use this feature, the functional level must be set to 2012_R2 or
later with:

  ad dc functional level = 2016

in the smb.conf.

The smb.conf file on each DC must have 'ad dc functional level = 2016'
set to have the partially complete feature available.  This will also,
at first startup, update the server's own AD entry with the configured
functional level.

For new domains, add these parameters to 'samba-tool provision'

--option="ad dc functional level = 2016" --function-level=2016

The second option, setting the overall domain functional level
indicates that all DCs should be at this functional level.

To raise the domain functional level of an existing domain, after
updating the smb.conf and restarting Samba run
samba-tool domain schemaupgrade --schema=2019
samba-tool domain functionalprep --function-level=2016
samba-tool domain level raise --domain-level=2016 --forest-level=2016

This support is still new, so is not enabled by default in this
release.  The above instructions are set at 2016, which while not
complete, matches what our testing environment validates.

Conditional ACEs and Resource Attribute ACEs
--------------------------------------------

Ordinary Access Control Entries (ACEs) unconditionally allow or deny
access to a given user or group. Conditional ACEs have an additional
section that describes conditions under which the ACE applies. If the
conditional expression is true, the ACE works like an ordinary ACE,
otherwise it is ignored. The condition terms can refer to claims,
group memberships, and attributes on the object itself. These
attributes are described in Resource Attribute ACEs that occur in the
object's System Access Control List (SACL). Conditional ACEs are
described in Microsoft documentation.

Conditional ACE evaluation is controlled by the "acl claims
evaluation" smb.conf option. The default value is "AD DC only" which
enables them in AD DC settings. The other option is "never", which
disables them altogether. There is currently no option to enable them
on the file server (this is likely to change in future releases).

The Security Descriptor Definition Language has extensions for
conditional ACEs and resource attribute ACEs; these are now supported
by Samba.


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
   acl claims evaluation                   new             AD DC only


CHANGES SINCE 4.20.0rc3
=======================

o  Andreas Schneider <asn@samba.org>
    * BUG 15588: samba-gpupdate: Correctly implement site support.


CHANGES SINCE 4.20.0rc2
=======================

o  Rob van der Linde <rob@catalyst.net.nz>
    * BUG 15575: Remove unsupported "Final" keyword missing from Python 3.6.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 15577: Additional witness backports for 4.20.0.

o  Noel Power <noel.power@suse.com>
    * BUG 15579: Error output with wspsearch.

o  Martin Schwenke <mschwenke@ddn.com>
    * BUG 15580: Packet marshalling push support missing for
      CTDB_CONTROL_TCP_CLIENT_DISCONNECTED and
      CTDB_CONTROL_TCP_CLIENT_PASSED.

o  Jo Sutton <josutton@catalyst.net.nz>
    * BUG 15575: Remove unsupported "Final" keyword missing from Python 3.6.


CHANGES SINCE 4.20.0rc1
=======================

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
    * BUG 15574: Performance regression for NDR parsing of security 
descriptors.

o  Anoop C S <anoopcs@samba.org>
    * BUG 15565: Build and install man page for wspsearch client utility.

o  Andreas Schneider <asn@samba.org>
    * BUG 15558: samba-gpupdate logging doesn't work.


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

https://download.samba.org/pub/samba/rc/samba-4.20.0rc4.WHATSNEW.txt

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4628288EC8B
	for <lists+samba-technical@lfdr.de>; Wed, 27 Mar 2024 18:23:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=Z1fPNM0uK4P3oKwzq918zkgstMfG8FiPJedJ+uIR1ac=; b=IBWu6kGbAehsVW60K0NwIDrYaP
	MBftSNCjZBz4rqKSxxA5FHZ1bGp845gPDzyk+cMS0c1JD6m3eOKZyJS3yIiuS4dgs/HF/pnJVc8WU
	ppgOtQngDIlK+KLpWqzZyJUHlBMpz5vO/rNnfBVScV3KxVwl8E+Aa+MiS8OeqmQ73d5EseRCV/Thg
	D0g3bDakSnO99/ZDnzIk8tpuivpiabNOExekPSQydSEnXDoXEeK/E3y2e+b1Ask41HEA7iYXtdwqu
	oWnbIQVnCny/lb0x//HRyFxLe16Bvd3M5Ty3weX8zKT60kAUBNYnS4GT/eCizcrzq14aPmdxOLcR+
	+FFW4HDg==;
Received: from ip6-localhost ([::1]:41244 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rpWzb-001P7H-Vx; Wed, 27 Mar 2024 17:23:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42180) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rpWzQ-001P6b-DU; Wed, 27 Mar 2024 17:23:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=Z1fPNM0uK4P3oKwzq918zkgstMfG8FiPJedJ+uIR1ac=; b=KZUAHR08CsphNJc6pXqwXMSkKZ
 OQVjuTiiCET9dqcexIlzW4WiKJUHXugWnJQLFIZHNwn/TVISiSBVby4/LRDrXRq1yYae1DLdTdSyE
 NZCehxahnO6xBx0Ol794I8Ndq4VtCL06pNRxmcMw2+IDHmHSntoh/77QrkdbZJrcoG4W7/PKFN9Vr
 YBDPbHzZQJje3dwzNJANvEIhN89055wa+3elN3mVZ8/r+1L0qeSPwPF3ZY9xzhxFQUkbiepSNx/aH
 lKbBNbbvwlpUO2ycGZQhSImXGZUSZMHhIDEeuwV92/7JsZNOaut13mV7AQssVmEU/etfYi0a4cLra
 ot3HTUWsFqNjysJoQrWRWVuAFwJkDNCTVT3O2/vVkdgqz1w7SU6mUB963Y6QNyxRa+A0IOKTXHB7D
 rOuEPWemvq4cDyGt0QZQ2Upn7jqQI2sJZFj6fQf7xGCntqGIqbnMf2tLY9v+mklno3HcylrQty3tF
 9ul/NAYQLU8Beqc3HmSWJwzm;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rpWzQ-003ExB-3D; Wed, 27 Mar 2024 17:23:05 +0000
Message-ID: <03abe8fa-f55b-4b67-a4f9-a0384f203dfa@samba.org>
Date: Wed, 27 Mar 2024 18:23:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.20.0 Available for Download
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

This is the first stable release of the Samba 4.20 release series.
Please read the release notes carefully before upgrading.


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

Service Witness Protocol [MS-SWN]
---------------------------------

In a ctdb cluster it is now possible to provide
the SMB witness service that allows clients to
monitor their current smb connection to cluster
node A by asking cluster node B to notify the
client if the ip address from node A or the
whole node A becomes unavailable.

For disk shares in a ctdb cluster
SMB2_SHARE_CAP_SCALEOUT is now always returned
for SMB3 tree connect responses.

If the witness service is active
SMB2_SHARE_CAP_CLUSTER is now also returned.

In order to activate the witness service
"rpc start on demand helpers = no" needs to
be configured in the global section.
At the same time the 'samba-dcerpcd' service
needs to be started explicitly, typically
with the '--libexec-rpcds' option in order
to make all available services usable.
One important aspect is that tcp ports
135 (for the endpoint mapper) and various
ports in the 'rpc server dynamic port range'
will be used to provide the witness service
(rpcd_witness).

ctdb provides a '47.samba-dcerpcd.script' in order
to manage the samba-dcerpcd.service.
Typically as systemd service, but that's up
to the packager and/or admin.

Please note that current windows client
requires SMB2_SHARE_CAP_CONTINUOUS_AVAILABILITY
in addition to SMB2_SHARE_CAP_CLUSTER in order
to make use of the witness service.
But SMB2_SHARE_CAP_CONTINUOUS_AVAILABILITY implies
the windows clients always ask for persistent handle
(which are not implemented in samba yet), so
that every open generates a warning in the
windows smb client event log.
That's why SMB2_SHARE_CAP_CONTINUOUS_AVAILABILITY
is not returned by default.
An explicit 'smb3 share cap:CONTINUOUS AVAILABILITY = yes'
is needed.

There are also new 'net witness' commands in order
to let the admin list active client registrations
or ask specific clients to move their smb connection
to another cluster node. These are available:

  net witness list
  net witness client-move
  net witness share-move
  net witness force-unregister
  net witness force-response

Consult 'man net' or 'net witness help' for further details.


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
   acl claims evaluation                   new             AD DC only
   smb3 unix extensions                    Per share       -
   smb3 share cap:ASYMMETRIC               new             no
   smb3 share cap:CLUSTER                  new             see 'man 
smb.conf'
   smb3 share cap:CONTINUOUS AVAILABILITY  new             no
   smb3 share cap:SCALE OUT                new             see 'man 
smb.conf'


Changes since 4.20.0rc4
=======================

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
    * BUG 15606: Avoid null-dereference with bad claims.
    * BUG 15613: ndr_pull_security_ace can leave resource attribute ACE coda
      claim struct undefined.

o  Ralph Boehme <slow@samba.org>
    * BUG 15527: fd_handle_destructor() panics within an 
smbd_smb2_close() if
      vfs_stat_fsp() fails in fd_close().

o  Björn Jacke <bjacke@samba.org>
    * BUG 15583: set_nt_acl sometimes fails with 
NT_STATUS_INVALID_PARAMETER -
      openat() EACCES.

o  Noel Power <noel.power@suse.com>
    * BUG 15527: fd_handle_destructor() panics within an 
smbd_smb2_close() if
      vfs_stat_fsp() fails in fd_close().

o  Andreas Schneider <asn@samba.org>
    * BUG 15599: libgpo: Segfault in python bindings.

o  Jo Sutton <josutton@catalyst.net.nz>
    * BUG 15607: Samba AD is missing some authentication policy tests.


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

         https://download.samba.org/pub/samba/stable/

The release notes are available online at:

         https://www.samba.org/samba/history/samba-4.20.0.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team


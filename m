Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E0177389A
	for <lists+samba-technical@lfdr.de>; Tue,  8 Aug 2023 09:32:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=6m8R2n+Dw2F70taNFXI7W5Zo8nIcmUyBeZFSc/tySk4=; b=1eXuTDd0YLxYUR8QU6mQ8vRv4n
	ih2nc3Y4rnApgqvIe9JNf2ahZ5E7fqQihk7o13VEw42l7enLrpFWbeiQpl5xSluObHmDAo/nKamOl
	920kb1CDT0ZqPupISJA7tAD4/Y2O6ghKmSxKtSgRY3PyNH0a+b5Cm35gYaPm85JtVpnPhLFzjpW8a
	zw4ub5OzVdDnL8/bJO/Un3tRxJ5KqWbB7ZYF19hgFsWr70XefIP8ovt/k1vZKfPDPXUio+T2LnHMT
	vVWEHqUJzVtfh1/kNABZ00/zCGWLWU19ogeiI917b9ndvXnpuBNz7PeK+0Il6MwHrke7INa9yvxZl
	wEKobxMQ==;
Received: from ip6-localhost ([::1]:29504 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qTHBm-00AdYK-AY; Tue, 08 Aug 2023 07:31:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42682) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qTHBL-00AdXM-Qr; Tue, 08 Aug 2023 07:31:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=6m8R2n+Dw2F70taNFXI7W5Zo8nIcmUyBeZFSc/tySk4=; b=OJVrHdDNHmdF8SXn+dBd72gUFQ
 rmB8PCYRqmbQbNf3C0kkwyw8at3ahjDtByoKPbnu+EptbMzq0XPGLBAInhXfvC8rGq8FRaivYe6YH
 RcIeBZrJetkAri2eXi6bqJh1+P8hI2ASZTagql7iLdacuQLcSDOs4XRYvkwSG3rflYJUwQMdXe4Us
 Ke2DLgKyjTRCuPTaL7MCxIul3cBuYFm3O8y56gVDl1cTLiGS5PozLfTdP6kCNl2b004MCiMsR7Gph
 LxrCBk0D+L5+OqtjoHhH9ECCHnWR3s2yucSVZg7aKAkR1Gm2IEYVKs8TXwQJg2LzJnv8JTQBMo3Ay
 +0IamDfje231g8QtJInhjs0KRQ8fieW9TjTellmOaIs4QeU+3rVc8mqVeeFB2g8qrR/PAkPg/55o9
 WWG6QVzBjwweXng1Oc21UrPWWSvPwuUQP22820/J2FsU5jSUWdsEkNT6THRBt5Qui8xMARP0jJASZ
 OEceDxRkL0asx2XZTVqTeBvn;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qTHBG-006lKB-0r; Tue, 08 Aug 2023 07:31:04 +0000
Message-ID: <648b0b6e-9235-23ba-d26f-24125d17ee06@samba.org>
Date: Tue, 8 Aug 2023 09:31:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.19.0rc2 Available for Download
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

This is the second release candidate of Samba 4.19.  This is *not*
intended for production environments and is designed for testing
purposes only.  Please report any defects via the Samba bug reporting
system at https://bugzilla.samba.org/.

Samba 4.19 will be the next version of the Samba suite.


UPGRADING
=========


NEW FEATURES/CHANGES
====================

Migrated smbget to use common command line parser
-------------------------------------------------

The smbget utility implemented its own command line parsing logic. After
discovering an issue we decided to migrate it to use the common command line
parser. This has some advantages as you get all the feature it provides like
Kerberos authentication. The downside is that breaks the options interface.
The support for smbgetrc has been removed. You can use an authentication 
file
if needed, this is documented in the manpage.

Please check the smbget manpage or --help output.

gpupdate changes
----------------

The libgpo.get_gpo_list function has been deprecated in favor of
an implementation written in python. The new function can be imported via
`import samba.gp`. The python implementation connects to Active Directory
using the SamDB module, instead of ADS (which is what libgpo uses).

Improved winbind logging and a new tool for parsing the winbind logs
--------------------------------------------------------------------

Winbind logs (if smb.conf 'winbind debug traceid = yes' is set) contain new
trace header fields 'traceid' and 'depth'.  Field 'traceid' allows to 
track the
trace records belonging to the same request.  Field 'depth' allows to 
track the
request nesting level. A new tool samba-log-parser is added for better log
parsing.

AD database prepared to FL 2016 standards for new domains
---------------------------------------------------------

While Samba still provides only Functional Level 2008R2 by default,
Samba as an AD DC will now, in provision ensure that the blank
database is already prepared for Functional Level 2016, with AD Schema
2019.

This preparation is of the default objects in the database, adding
containers for Authentication Policies, Authentication Silos and AD
claims in particular.  These DB objects must be updated to allow
operation of the new features found in higher functional levels.

Kerberos Claims, Authentication Silos and NTLM authentication policies
----------------------------------------------------------------------

An initial, partial implementation of Active Directory Functional
Level 2012, 2012R2 and 2016 is available in this release.

In particular Samba will issue Active Directory "Claims" in the PAC,
for member servers that support these, and honour in-directory
configuration for Authentication Policies and Authentication Silos.

The primary limitation is that while Samba can read and write claims
in the directory, and populate the PAC, Samba does not yet use them
for access control decisions.

While we continue to develop these features, existing domains can
test the feature by selecting the functional level in provision or
raising the DC functional level by setting

  ad dc functional level = 2016

in the smb.conf

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

Improved KDC Auditing
---------------------

As part of the auditing required to allow successful deployment of
Authentication Policies and Authentication Silos, our KDC now provides
Samba-style JSON audit logging of all issued Kerberos tickets,
including if they would fail a policy that is not yet enforced.
Additionally most failures are audited, (after the initial
pre-validation of the request).

Kerberos Armoring (FAST) Support for Windows clients
----------------------------------------------------

In domains where the domain controller functional level is set, as
above, to 2012, 2012_R2 or 2016, Windows clients will, if configured
via GPO, use FAST to protect user passwords between (in particular) a
workstation and the KDC on the AD DC.  This is a significant security
improvement, as weak passwords in an AS-REQ are no longer available
for offline attack.

Claims compression in the AD PAC
--------------------------------

Samba as an AD DC will compress "AD claims" using the same compression
algorithm as Microsoft Windows.

Resource SID compression in the AD PAC
--------------------------------------

Samba as an AD DC will now correctly populate the various PAC group
membership buffers, splitting global and local groups correctly.

Additionally, Samba marshals Resource SIDs, being local groups in the
member server's own domain, to only consume a header and 4 bytes per
group in the PAC, not a full-length SID worth of space each.  This is
known as "Resource SID compression".

New samba-tool support for silos, claims, sites and subnets.
------------------------------------------------------------

samba-tool can now list, show, add and manipulate Authentication Silos
(silos) and Active Directory Authentication Claims (claims).

samba-tool can now list and show Active Directory sites and subnets.

A new Object Relational Model (ORM) based architecture, similar to
that used with Django, has been built to make adding new samba-tool
subcommands simpler and more consistent, with JSON output available
standard on these new commands.

Updated GnuTLS requirement / in-tree cryptography removal
----------------------------------------------------------

Samba requires GnuTLS 3.6.13 and prefers GnuTLS 3.6.14 or later.

This has allowed Samba to remove all of our in-tree cryptography,
except that found in our Heimdal import.  Samba's runtime cryptography
needs are now all provided by GnuTLS.

(The GnuTLS vesion requirement is raised to 3.7.2 on systems without
the Linux getrandom())

We also use Python's cryptography module for our testing.

The use of well known cryptography libraries makes Samba easier for
end-users to validate and deploy, and for distributors to ship. This
is the end of a very long journey for Samba.

Updated Heimdal import
----------------------

Samba's Heimdal branch (known as lorikeet-heimdal) has been updated to
the current pre-8.0 (master) tree from upstream Heimdal, ensuring that
this vendored copy, included in our release remains as close as
possible to the current upstream code.

Revocation support in Heimdal KDC for PKINIT certificates
---------------------------------------------------------

Samba will now correctly honour the revocation of 'smart card'
certificates used for PKINIT Kerberos authentication.

This list is reloaded each time the file changes, so no further action
other than replacing the file is required.  The additional krb5.conf
option is:

  [kdc]
     pkinit_revoke = FILE:/path/to/crl.pem

Information on the "Smart Card login" feature as a whole is at:
  https://wiki.samba.org/index.php/Samba_AD_Smart_Card_Login

Protocol level testsuite for (Smart Card Logon) PKINIT
------------------------------------------------------

Previously Samba's PKINIT support in the KDC was tested by use of
shell scripts around the client tools of MIT or Heimdal Kerberos.
Samba's independently written python testsuite has been extended to
validate KDC behaviour for PKINIT.

Require encrypted connection to modify unicodePwd on the AD DC
--------------------------------------------------------------

Setting the password on an AD account on should never be attempted
over a plaintext or signed-only LDAP connection.  If the unicodePwd
(or userPassword) attribute is modified without encryption (as seen by
Samba), the request will be rejected.  This is to encourage the
administrator to use an encrypted connection in the future.

NOTE WELL: If Samba is accessed via a TLS frontend or load balancer,
the LDAP request will be regarded as plaintext.

Samba AD TLS Certificates can be reloaded
-----------------------------------------

The TLS certificates used for Samba's AD DC LDAP server were
previously only read on startup, and this meant that when then expired
it was required to restart Samba, disrupting service to other users.

  smbcontrol ldap_server reload-certs

This will now allow these certificates to be reloaded 'on the fly'

================
REMOVED FEATURES
================


smb.conf changes
================

   Parameter Name                          Description     Default
   --------------                          -----------     -------
   winbind debug traceid                   Add traceid     No
   directory name cache size               Removed


CHANGES SINCE 4.19.0rc1
=======================

o  Andrew Bartlett <abartlet@samba.org>
    * BUG 9959: Windows client join fails if a second container 
CN=System exists
     somewhere.

o  Noel Power <noel.power@suse.com>
    * BUG 15435: regression DFS not working with widelinks = true.

o  Arvid Requate <requate@univention.de>
    * BUG 9959: Windows client join fails if a second container 
CN=System exists
     somewhere.

o  Joseph Sutton <josephsutton@catalyst.net.nz>
    * BUG 15443: Heimdal fails to build on 32-bit FreeBSD.

o  Jones Syue <jonessyue@qnap.com>
    * BUG 15441: samba-tool ntacl get segfault if aio_pthread appended.


KNOWN ISSUES
============

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.19#Release_blocking_bugs


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

https://download.samba.org/pub/samba/rc/samba-4.19.0rc2.WHATSNEW.txt

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team


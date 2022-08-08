Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B1E58CAD2
	for <lists+samba-technical@lfdr.de>; Mon,  8 Aug 2022 16:55:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=60y3XWILdzBSs+BwvKVjtW9rztOozjYOjs4rTXPsp+E=; b=z3S8KFlh1JC+Wk8TqCFz+KfqFA
	O6ikw6qkiPbHJ7ckmd9YNaLnLBWarevEqk3uH3HNXbE7lzN0c3Cxaf5sjPYmEgSE/Yx89WOeYmr0T
	5QjRPReihvRJL42FgBTZzzKkmPG0e9Ezi/CIVMIerN+pYhns0kSLyBNAcYCnyFUz3LeT7COO7GUSh
	rUyosYS8TFKJf/vsuSozF2Ye3qWgsPSsPhs4KaSJE2hi5HNakyWVB36SiitKwQhUfk/2+giDyOXbE
	EpHWm8M92lUW17KvdQo3wX3fjThY0RpfvGHYhWHeSvgJ0clemfebAuswuHzH3pzKT92xfH6wCc+Nq
	4JtPlAKw==;
Received: from ip6-localhost ([::1]:57744 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oL4AF-0068GN-JH; Mon, 08 Aug 2022 14:55:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:17942) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oL49x-0068FR-Eh; Mon, 08 Aug 2022 14:55:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=60y3XWILdzBSs+BwvKVjtW9rztOozjYOjs4rTXPsp+E=; b=2ICt4PQFQessDXAjttrnOhn5ML
 bbgJIpX32wL+9Pq19P3qb5OUSdvGIyC9Z4okK/sIcUPjhlqiGfN7IYlcMGqGUZj0o01+le6mAlzcN
 QXGnVIkefiWIB21ZSRKkTcDrUDXi03g6wFIc9/Qe6UNFp6xTGe+TjD7iSc6fK2DXCB6E7/Cu9C1Nq
 y1urNxzxt+LiYlg5TQbj/qquMvV4myflpH9hO/AvawgQML+W3yziAWAfeQsB/UehA4fNRUwNKLDTN
 P6QJhzwvPDaHgy5HoTWqhxWlYhxeJfdwmPfynyRHu/Qy6AZ2X2fCW8YBQNvcrFLvoEj6zWFcztiyX
 VQggLgKHjOm8GrexVnL1exsj+FtqblmWIvvmwgm4VsFdUSHKbPLd4UauPxtBYd4eePUqd3noROFzl
 e8b1Ejg5QjU92kDgJz9tTn/PTGzeM0N6ZVQ9SMZQmmrg1j2yjC4ls9Se9UwJE99puZTNW1VZNqPn7
 J52JRFW3Guhx5JldVTJciLMk;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oL49v-008hCy-PO; Mon, 08 Aug 2022 14:55:12 +0000
Message-ID: <06f0af2e-46bb-fb3b-b5d0-29566bac07ae@samba.org>
Date: Mon, 8 Aug 2022 16:55:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.17.0rc1 Available for Download
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

This is the first release candidate of Samba 4.17.  This is *not*
intended for production environments and is designed for testing
purposes only.  Please report any defects via the Samba bug reporting
system at https://bugzilla.samba.org/.

Samba 4.17 will be the next version of the Samba suite.


UPGRADING
=========


NEW FEATURES/CHANGES
====================

Configure without the SMB1 Server
---------------------------------

It is now possible to configure Samba without support for
the SMB1 protocol in smbd. This can be selected at configure
time with either of the options:

--with-smb1-server
--without-smb1-server

By default (without either of these options set) Samba
is configured to include SMB1 support (i.e. --with-smb1-server
is the default). When Samba is configured without SMB1 support,
none of the SMB1 code is included inside smbd except the minimal
stub code needed to allow a client to connect as SMB1 and immediately
negotiate the selected protocol into SMB2 (as a Windows server also
allows).

None of the SMB1-only smb.conf parameters are removed when
configured without SMB1, but these parameters are ignored by
the smbd server. This allows deployment without having to change
an existing smb.conf file.

This option allows sites, OEMs and integrators to configure Samba
to remove the old and insecure SMB1 protocol from their products.

Note that the Samba client libraries still support SMB1 connections
even when Samba is configured as --without-smb1-server. This is
to ensure maximum compatibility with environments containing old
SMB1 servers.

Bronze bit and S4U support with MIT Kerberos 1.20
-------------------------------------------------

In 2020 Microsoft Security Response Team received another Kerberos-related
report. Eventually, that led to a security update of the CVE-2020-17049,
Kerberos KDC Security Feature Bypass Vulnerability, also known as a ‘Bronze
Bit’. With this vulnerability, a compromised service that is configured 
to use
Kerberos constrained delegation feature could tamper with a service 
ticket that
is not valid for delegation to force the KDC to accept it.

With the release of MIT Kerberos 1.20, Samba AD DC is able able to 
mitigate the
‘Bronze Bit’ attack. MIT Kerberos KDC's KDB (Kerberos Database Driver) 
API was
changed to allow passing more details between KDC and KDB components. 
When built
against MIT Kerberos, Samba AD DC supports MIT Kerberos 1.19 and 1.20 
versions
but 'Bronze Bit' mitigation is provided only with MIT Kerberos 1.20.

In addition to fixing the ‘Bronze Bit’ issue, Samba AD DC now fully supports
S4U2Self and S4U2Proxy Kerberos extensions.

Resource Based Constrained Delegation (RBCD) support
----------------------------------------------------

Samba AD DC built with MIT Kerberos 1.20 offers RBCD support now. With MIT
Kerberos 1.20 we have complete RBCD support passing Sambas S4U testsuite.
Note that samba-tool lacks support for setting this up yet!

To complete RBCD support and make it useful to Administrators we added the
Asserted Identity [1] SID into the PAC for constrained delegation. This is
available for Samba AD compiled with MIT Kerberos 1.20.

[1] 
https://docs.microsoft.com/en-us/windows-server/security/kerberos/kerberos-constrained-delegation-overview

Customizable DNS listening port
-------------------------------

It is now possible to set a custom listening port for the builtin DNS 
service,
making easy to host another DNS on the same system that would bind to the
default port and forward the domain-specific queries to Samba using the 
custom
port. This is the opposite configuration of setting a forwarder in Samba.

It makes possible to use another DNS server as a front and forward to Samba.

Dynamic DNS updates may not be proxied by the front DNS server when 
forwarding
to Samba. Dynamic DNS update proxying depends on the features of the 
other DNS
server used as a front.

CTDB changes
------------

* When Samba is configured with both --with-cluster-support and
   --systemd-install-services then a systemd service file for CTDB will
   be installed.

* ctdbd_wrapper has been removed.  ctdbd is now started directly from
   a systemd service file or init script.

* The syntax for the ctdb.tunables configuration file has been
   relaxed.  However, trailing garbage after the value, including
   comments, is no longer permitted.  Please see ctdb-tunables(7) for
   more details.

Operation without the (unsalted) NT password hash
-------------------------------------------------

When Samba is configured with 'nt hash store = never' then Samba will
no longer store the (unsalted) NT password hash for users in Active
Directory.  (Trust accounts, like computers, domain controllers and
inter-domain trusts are not impacted).

In the next version of Samba the default for 'nt hash store' will
change from 'always' to 'auto', where it will follow (behave as 'nt
hash store = never' when 'ntlm auth = disabled' is set.

Security-focused deployments of Samba that have eliminated NTLM from
their networks will find setting 'ntlm auth = disabled' with 'nt hash
store = always' as a useful way to improve compliance with
best-practice guidance on password storage (which is to always use an
interated hash).

Note that when 'nt hash store = never' is set, then arcfour-hmac-md5
Kerberos keys will not be available for users who subsequently change
their password, as these keys derive their values from NT hashes. AES
keys are stored by default for all deployments of Samba with Domain
Functional Level 2008 or later, are supported by all modern clients,
and are much more secure.

Finally, also note that password history in Active Directory is stored
in nTPwdHistory using a series of NT hash values.  Therefore the full
password history feature is not available in this mode.

To provide some protection against password re-use previous Kerberos
hash values (the current, old and older values are already stored) are
used, providing a history length of 3.

There is one small limitation of this workaround: Changing the
sAMAccountName, userAccountControl or userPrincipalName of an account
can cause the Kerberos password salt to change.  This means that after
*both* an account rename and a password change, only the current
password will be recognised for password history purposes.


REMOVED FEATURES
================

LanMan Authentication and password storage removed from the AD DC
-----------------------------------------------------------------

The storage and authentication with LanMan passwords has been entirely
removed from the Samba AD DC, even when "lanman auth = yes" is set.

smb.conf changes
================

   Parameter Name                          Description     Default
   --------------                          -----------     -------
   dns port                                New default     53
   nt hash store                  New parameter   always


KNOWN ISSUES
============

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.17#Release_blocking_bugs


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

https://download.samba.org/pub/samba/rc/samba-4.17.0rc1.WHATSNEW.txt

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A75854A4CF7
	for <lists+samba-technical@lfdr.de>; Mon, 31 Jan 2022 18:18:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=OvgqV2H13GTHaFRWOMPK/6c26TF9cd66kcGfUgyarz0=; b=YJnBQ9//Ci/E55qAH4Cx/34bXH
	onzRFaNImgh6UbhtOJBjpwdqdmuhsYkddJLeEn53i3dnDYvxwtTMbb14LViAaDLHLD7Y0FXRHHc0t
	xp3NHvu9nHZjaR2ebpQyxSBIuVZ+czPWITf4aRk7uOvrbaxxUmNc4UymYA7I0yvtgtgSRqMKZNWeZ
	8AhjIeMBMGGbGscBaSy4NI7vTFP+qH3Ymk7ZpJDFn9WZ7It1rhGyUm9cs6a8odRPuhp4KMYE8dc8K
	x1zvziL4k9/TsGsHCZisLg3CB96NENop4KnDLnHXVGooJKkhA+Gw0HEx6y84MZWLrFtcZYbpnZLlm
	QBaK+Eww==;
Received: from ip6-localhost ([::1]:28648 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nEaJ8-002nMc-VK; Mon, 31 Jan 2022 17:17:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48596) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nEaIw-002nLf-6J; Mon, 31 Jan 2022 17:17:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=OvgqV2H13GTHaFRWOMPK/6c26TF9cd66kcGfUgyarz0=; b=pC4vyLvHVtWDdD+e12uK7yXWl/
 l9F8Og0FaFkcN8/ekEMwcHy7wehKIIYJW47LTEnKvlF4C0e0TX395KksTwjC55vFKbpV0rm/czCGS
 t4hm0PEEhfIH0p8M1nm9HZYlOR9vgC/0plvHbTTEgSgqP2pPmUFg45Eko2wwZXrgqFT20U+FI/m3W
 E3rVddbrjIqbhcbxd3xO5hqBcgEkr9nC/KaeCw8ZmACk3RPlAfKp5yQTiPiBOJ7JzG6KzJK65ARyo
 Kr7epyjcR2GC474c7t8LmFhiVuU0WFjgvOxPnQkHHXFH1UwlpNSW4xGGnly5efMuzI9ICQnbvHOwQ
 WRJIQ/MYPzM4xn1s/VgpxOoJRUv8d4eovitO4g7QCixb21WJ0/faqWKTgQcrUYExOYdqqxbNgLkWQ
 qnkCMx/oRPmO5SPUbpSciIdXCSZ2gEl9NKpHqbVTrXjvvvaLrbPYgOfruLefwc4zf1PjoS3oV4LrV
 tFtL7WxgKD9jajXxJM0Go2Dk;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nEaIv-001Y6v-DT; Mon, 31 Jan 2022 17:17:25 +0000
Message-ID: <c42904e1-f3e7-62aa-7d20-960b66f7eae5@samba.org>
Date: Mon, 31 Jan 2022 18:17:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.16.0rc2 Available for Download
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

This is the second release candidate of Samba 4.16.  This is *not*
intended for production environments and is designed for testing
purposes only.  Please report any defects via the Samba bug reporting
system at https://bugzilla.samba.org/.

Samba 4.16 will be the next version of the Samba suite.


UPGRADING
=========


NEW FEATURES/CHANGES
====================

New samba-dcerpcd binary to provide DCERPC in the member server setup
---------------------------------------------------------------------

In order to make it much easier to break out the DCERPC services
from smbd, a new samba-dcerpcd binary has been created.

samba-dcerpcd can be used in two ways. In the normal case without
startup script modification it is invoked on demand from smbd or
winbind --np-helper to serve DCERPC over named pipes. Note that
in order to run in this mode the smb.conf [global] section has
a new parameter "rpc start on demand helpers = [true|false]".
This parameter is set to "true" by default, meaning no changes to
smb.conf files are needed to run samba-dcerpcd on demand as a named
pipe helper.

It can also be used in a standalone mode where it is started
separately from smbd or winbind but this requires changes to system
startup scripts, and in addition a change to smb.conf, setting the new
[global] parameter "rpc start on demand helpers = false". If "rpc
start on demand helpers" is not set to false, samba-dcerpcd will
refuse to start in standalone mode.

Note that when Samba is run in the Active Directory Domain Controller
mode the samba binary that provides the AD code will still provide its
normal DCERPC services whilst allowing samba-dcerpcd to provide
services like SRVSVC in the same way that smbd used to in this
configuration.

The parameters that allowed some smbd-hosted services to be started
externally are now gone (detailed below) as this is now the default
setting.

samba-dcerpcd can also be useful for use outside of the Samba
framework, for example, use with the Linux kernel SMB2 server ksmbd or
possibly other SMB2 server implementations.

Certificate Auto Enrollment
---------------------------

Certificate Auto Enrollment allows devices to enroll for certificates from
Active Directory Certificate Services. It is enabled by Group Policy.
To enable Certificate Auto Enrollment, Samba's group policy will need to be
enabled by setting the smb.conf option `apply group policies` to Yes. Samba
Certificate Auto Enrollment depends on certmonger, the cepces certmonger
plugin, and sscep. Samba uses sscep to download the CA root chain, then uses
certmonger paired with cepces to monitor the host certificate templates.
Certificates are installed in /var/lib/samba/certs and private keys are
installed in /var/lib/samba/private/certs.

Ability to add ports to dns forwarder addresses in internal DNS backend
-----------------------------------------------------------------------

The internal DNS server of Samba forwards queries non-AD zones to one or 
more
configured forwarders. Up until now it has been assumed that these 
forwarders
listen on port 53. Starting with this version it is possible to 
configure the
port using host:port notation. See smb.conf for more details. Existing 
setups
are not affected, as the default port is 53.

CTDB changes
------------

* The "recovery master" role has been renamed "leader"

   Documentation and logs now refer to "leader".

   The following ctdb tool command names have changed:

     recmaster -> leader
     setrecmasterrole -> setleaderrole

   Command output has changed for the following commands:

     status
     getcapabilities

   The "[legacy] -> recmaster capability" configuration option has been
   renamed and moved to the cluster section, so this is now:

     [cluster] -> leader capability

* The "recovery lock" has been renamed "cluster lock"

   Documentation and logs now refer to "cluster lock".

   The "[cluster] -> recovery lock" configuration option has been
   deprecated and will be removed in a future version.  Please use
   "[cluster] -> cluster lock" instead.

   If the cluster lock is enabled then traditional elections are not
   done and leader elections use a race for the cluster lock.  This
   avoids various conditions where a node is elected leader but can not
   take the cluster lock.  Such conditions included:

   - At startup, a node elects itself leader of its own cluster before
     connecting to other nodes

   - Cluster filesystem failover is slow

   The abbreviation "reclock" is still used in many places, because a
   better abbreviation eludes us (i.e. "clock" is obvious bad) and
   changing all instances would require a lot of churn.  If the
   abbreviation "reclock" for "cluster lock" is confusing, please
   consider mentally prefixing it with "really excellent".

* CTDB now uses leader broadcasts and an associated timeout to
   determine if an election is required

   The leader broadcast timeout can be configured via new configuration
   option

     [cluster] -> leader timeout

   This specifies the number of seconds without leader broadcasts
   before a node calls an election.  The default is 5.


REMOVED FEATURES
================

SMB1 CORE and LANMAN1 protocol wildcard copy, unlink and rename removed
=======================================================================

In preparation for the removal of the SMB1 server, the unused
SMB1 command SMB_COM_COPY (SMB1 command number 0x29) has been
removed from the Samba smbd server. In addition, the ability
to process file name wildcards in requests using the SMB1 commands
SMB_COM_COPY (SMB1 command number 0x2A), SMB_COM_RENAME (SMB1 command
number 0x7), SMB_COM_NT_RENAME (SMB1 command number 0xA5) and
SMB_COM_DELETE (SMB1 command number 0x6) have been removed.

This only affects clients using MS-DOS based versions of
SMB1, the last release of which was Windows 98. Users requiring
support for these features will need to use older versions
of Samba.

No longer using Linux mandatory locks for sharemodes
====================================================

smbd mapped sharemodes to Linux mandatory locks. This code in the Linux 
kernel
was broken for a long time, and is planned to be removed with Linux 
5.15. This
Samba release removes the usage of mandatory locks for sharemodes and the
"kernel share modes" config parameter is changed to default to "no". The 
Samba
VFS interface is kept, so that file-system specific VFS modules can 
still use
private calls for enforcing sharemodes.


smb.conf changes
================

   Parameter Name                          Description     Default
   --------------                          -----------     -------
   kernel share modes                      New default     No
   dns forwarder                           Changed
   rpc_daemon                              Removed
   rpc_server                              Removed
   rpc start on demand helpers             Added           true


CHANGES SINCE 4.16.0rc1
=======================

o  Jeremy Allison <jra@samba.org>
    * BUG 14911: CVE-2021-44141: UNIX extensions in SMB1 disclose 
whether the
      outside target of a symlink exists.

o  Ralph Boehme <slow@samba.org>
    * BUG 14914: CVE-2021-44142: Out-of-Bound Read/Write on Samba vfs_fruit
      module.
    * BUG 14961: install elasticsearch_mappings.json

o  FeRD (Frank Dana) <ferdnyc@gmail.com>
    * BUG 14947: samba-bgqd still notifying systemd, triggering log warnings
      without NotifyAccess=all.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 14867: Printing no longer works on Windows 7 with 2021-10 monthly
      rollup patch.
    * BUG 14956: ndr_push_string() adds implicit termination for
      STR_NOTERM|REMAINING empty strings.

o  Joseph Sutton <josephsutton@catalyst.net.nz>
    * BUG 14950: CVE-2022-0336: Re-adding an SPN skips subsequent SPN 
conflict
      checks.


KNOWN ISSUES
============

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.16#Release_blocking_bugs


#######################################
Reporting bugs & Development Discussion
#######################################

Please discuss this release on the samba-technical mailing list or by
joining the #samba-technical IRC channel on irc.freenode.net.

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

https://download.samba.org/pub/samba/rc/samba-4.16.0rc2.WHATSNEW.txt

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team


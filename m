Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECD1497FFE
	for <lists+samba-technical@lfdr.de>; Mon, 24 Jan 2022 13:55:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=XWcB13w2OQNhJubhJjbGIYdWN199BsnH9AKFzadx2J0=; b=qy+AqJH/XmO0mLwupIyXURpYbz
	xnRQsc2b8PosW1cxLiQ3WOInZ4PQpNF315+spEGPX8htp3wvrXkoLlnZTej92MmYSJdh2roHXYpiQ
	g5CNgY5Sk03duCgbeoRaX4IGwa7lvDaCrNxgknOhcFjUwTev/ndYG1OJziLmhYUdQqfRYv/HV5WJA
	sRgX69SSaoWB5IcGYHpagHiwD9Vc2X54Qn2Q6182mFqv/wz9vO6WHm+NalCKdheFvNVGRgbVFEyjc
	QG+2t3DLS79Viob4teUAczIaibRIgfC7TKedheWBOq9aFi4Pf5Ui21juWt7wQ3Squyptkrv55dwQi
	7ewaDXGQ==;
Received: from ip6-localhost ([::1]:37276 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nBysF-000Dyx-UA; Mon, 24 Jan 2022 12:55:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48210) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nBys8-000Dyb-E9; Mon, 24 Jan 2022 12:55:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=XWcB13w2OQNhJubhJjbGIYdWN199BsnH9AKFzadx2J0=; b=NG+bxf/QKRsvogCkxkwgTdF06p
 SfNFAZGfWHTp5KoJr+SczSNoKg4oXEbLxD4yzoUMYgCv/J78M9LECF870ozLe0/FfOOfVpRBWR6Po
 uBNUijllEj6bZi+GNatptcfbkO856Td83fc/IERrrGBHoPdMcM5IVr8LanYYMH7d0YdjHGgKHJTe/
 mB16QzCU8rgGezE330od4MoPhq2K2fdJ+VaiHHMt3kfSuQqDMrj3h+VgYjtUIQA4MNixuLNI16aKt
 0n1t3Rd1CtCxEhEwEN8Bkeq5j8WgxXHQ9Q6jaKdrDfknEEptl1Zn/93vEtG5Wd8qsgGktIfL6ivwJ
 6yvfHfv5sBYsfmh80jKqsbcu1C73gM/EbYY6+LOeoe/H1FRSv7NkLLZEKwsalzia0UsbmxO8F7fmw
 8MtUfEb4+HsEky21l/UF7qy8dU37Q6Llx3UBtCyFHd+02wanCd81iqnIgqfA54zOi3n7+xh8S05x7
 TU5i01wXcRmikiUrNDG11M6l;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nBys7-000JZd-UX; Mon, 24 Jan 2022 12:55:00 +0000
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.16.0rc1 Available for Download
Message-ID: <657c29c8-19f5-e0ca-0ded-d88dec21fc37@samba.org>
Date: Mon, 24 Jan 2022 13:54:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
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

This is the first release candidate of Samba 4.16.  This is *not*
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

https://download.samba.org/pub/samba/rc/samba-4.16.0rc1.WHATSNEW.txt

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team


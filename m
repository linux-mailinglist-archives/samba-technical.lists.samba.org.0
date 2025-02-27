Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFBDA47EBB
	for <lists+samba-technical@lfdr.de>; Thu, 27 Feb 2025 14:16:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=o6oMtjhMbabzUYyGs0JTUPUpmxHq+G01S0IiCYUi+Hg=; b=Bij48S21vfhKSeJJeL2AZsT77R
	r7GsvoNJazHJpaSNSUShijy8ljRpgSvJVpZ0UU8rHHUPE/KHNEK//uhhJA4DW/SZXkchTOETH2M3x
	cIueWPdWvelaxfa2/mvUmTKpxjv4zhr+xq8pQQLVM+Iufsm3OsMCtJNHpc5cT43oFu/jY/PMeyXZ4
	Hu083fumdb7o8WdMvhcTZOErCta7ZSgWza0wPXkgCOlkEaM5LF5PvWrA80kvyytB5ZIH91Nxhi3+W
	Ha/3r13qJKWX5MvYIzQkenGTDjgbe2xPe+BosmG/7S+ObNK4QU34bCNg+XqlHsdZm2IbBcr8YwMV9
	75asLubw==;
Received: from ip6-localhost ([::1]:30762 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tndjn-00DNJi-R5; Thu, 27 Feb 2025 13:15:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28558) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tndjf-00DNJ2-0z; Thu, 27 Feb 2025 13:15:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=o6oMtjhMbabzUYyGs0JTUPUpmxHq+G01S0IiCYUi+Hg=; b=Bito/JkPChXTZBxJo0UHdx07+W
 DSVkHwQsIS5yN+FmXogPrdfNA95xojcxDX2Q6gNXEwVRAp5PEqLgmQBnGWQpx5M5Boa8cSnHvwFX+
 3NynBB/0YUgL91hrEkYBDJSuqkLLsaAim/CjxuP67FbHDNgBTAakg9HGvG9Rantlu0fa/ka3c8yoc
 r4/bTjcxBGgyJ4PEb2Hfo4LIrj1NjMy3QnHZnPRTzCKhKK3caYiY8fKWQky2JdD4TkxxMQr0j4JZi
 S/0hOvCI50LUMxhezqw9qiTeHp9kfOfO/++xV74Z0LYPOFxpZD/qBQ/c0s3e7u/EwRSKKh17SqjN9
 t/biI5jAzQyt3baUxDBtXTZYQYRi+o2BjfVI6k9RqES4p2R4Q7RAck4VS0zj+3KO2Xf4QDZYKDIDb
 /+e1E1PCgpktv/6IBBVSRTWrdgM5/oNwHirxY87SuRQuow+8jDBsC3IrTarpFnxqt1HISnUnnM7Hw
 ue7+LrAnJ5UlgcCdacB/R5yy;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tndje-002Tpk-1n; Thu, 27 Feb 2025 13:15:30 +0000
Message-ID: <7bb81b7e-2c2a-45a2-b49f-2cd02abeaf63@samba.org>
Date: Thu, 27 Feb 2025 14:15:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.22.0rc4 Available for Download
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

This is the fourth release candidate of Samba 4.22.  This is *not*
intended for production environments and is designed for testing
purposes only.  Please report any defects via the Samba bug reporting
system at https://bugzilla.samba.org/.

Samba 4.22 will be the next version of the Samba suite.


UPGRADING
=========


NEW FEATURES/CHANGES
====================

SMB3 Directory Leases
---------------------

Starting with Samba 4.22 SMB3 Directory Leases are supported. The new global
option "smb3 directory leases" controls whether the feature is enabled or
not. By default, SMB3 Directory Leases are enabled on non-clustered 
Samba and
disabled on clustered Samba, based on the "clustering" option. See man 
smb.conf
for more details.

SMB3 Directory Leases allow clients to cache directory listings and, 
depending
on the workload, result in a decent reduction in SMB requests from clients.

Netlogon Ping over LDAP and LDAPS
---------------------------------

Samba must query domain controller information via simple queries on
the AD rootdse's netlogon attribute. Typically this is done via
connectionless LDAP, using UDP on port 389. The same information is
also available via classic LDAP rootdse queries over TCP. Samba can
now be configured to use TCP via the new "client netlogon ping
protocol" parameter to enable running in environments where firewalls
completely block port 389 or UDP traffic to domain controllers.

Experimental Himmelblaud Authentication in Samba
------------------------------------------------

Samba now includes experimental support for Azure Entra ID 
authentication via
`himmelblaud`, located in the `rust/` directory. This implementation 
provides
basic authentication and is configured through `smb.conf`, utilizing options
such as `realm`, `winbindd_socket_directory`, and `template_homedir`. 
New global
parameters include `himmelblaud_sfa_fallback`, 
`himmelblaud_hello_enabled`, and
`himmelblaud_hsm_pin_path`.
To enable, configure Samba with `--enable-rust --with-himmelblau`.

REMOVED FEATURES
================

The "nmbd proxy logon" feature was removed. This was used before
Samba4 acquired a NBT server.

The parameter "cldap port" has been removed. CLDAP runs over UDP port
389, we don't see a reason why this should ever be changed to a
different port. Moreover, we had several places in the code where
Samba did not respect this parameter, so the behaviour was at least
inconsistent.

fruit:posix_rename
------------------

This option of the vfs_fruit VFS module that could be used to enable POSIX
directory rename behaviour for OS X clients has been removed as it could 
result
in severe problems for Windows clients.

As a possible workaround it is possible to prevent creation of .DS_Store 
files
(a Finder thingy to store directory view settings) on network mounts by 
running

   $ defaults write com.apple.desktopservices DSDontWriteNetworkStores true

on the Mac.


smb.conf changes
================

   Parameter Name                          Description     Default
   --------------                          -----------     -------
   smb3 directory leases                   New             Auto
   vfs mkdir use tmp name                  New             Auto
   client netlogon ping protocol           New             cldap
   himmelblaud hello enabled               New             no
   himmelblaud hsm pin path                New             default hsm 
pin path
   himmelblaud sfa fallback                New             no
   client use krb5 netlogon                Experimental    no
   reject aes netlogon servers             Experimental    no
   server reject aes schannel              Experimental    no
   server support krb5 netlogon            Experimental    no
   fruit:posix_rename                      Removed
   cldap port                              Removed


CHANGES SINCE 4.22.0rc3
=======================

o  Stefan Metzmacher <metze@samba.org>
    * BUG 15815: client use krb5 netlogon is experimental and should not 
be used
      in production.


CHANGES SINCE 4.22.0rc2
=======================

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
    * BUG 15738: Creation of GPOs applicable to more than one group is 
impossible
      with Samba 4.20.0 and later.

o  Björn Baumbach <bb@sernet.de>
    * BUG 15806: samba-tool acl commands broken for relative path names
    * BUG 15807: pysmbd seg faults when file is not found.

o  Ralph Boehme <slow@samba.org>
    * BUG 15796: Spotlight search results don't show file size and 
creation date.

o  Pavel Filipenský <pfilipensky@samba.org>
    * BUG 15759: net ads create/join/winbind producing unix dysfunctional
      keytabs.

o  Volker Lendecke <vl@samba.org>
    * BUG 15806: samba-tool acl commands broken for relative path names.
    * BUG 15807: pysmbd seg faults when file is not found.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 15680: Trust domains are not created.

o  Andreas Schneider <asn@samba.org>
    * BUG 15680: Trust domains are not created.

o  Shweta Sodani <ssodani@redhat.com>
    * BUG 15703: General improvements for vfs_ceph_new module.


CHANGES SINCE 4.21.0rc1
=======================

o  Björn Baumbach <bb@sernet.de>
    * BUG 15798: libnet4: seg fault after dc lookup failure


KNOWN ISSUES
============

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.22#Release_blocking_bugs


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

https://download.samba.org/pub/samba/rc/samba-4.22.0rc4.WHATSNEW.txt

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B7B7F9F8C
	for <lists+samba-technical@lfdr.de>; Mon, 27 Nov 2023 13:28:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=GegfT4xq/76eYo1xH8+90lnem5VwQUeWPNXFZGLhBQY=; b=aVw8POsjXAiaDI8+NNcQD4Bvse
	6pTCp9xwPRC2ppvqvN1HrUmoKETOoqwE6GN00yYyOfG6LoVOkZm8exXcr3yPcABAOV1+GQ21kOzWV
	GKEWV9nU2at5gDvjFIYls9x6mmti1fTvfB5ulpnkJLpbcl/KqbRjmINomMiIyIzqeuhnd2BtC3g/x
	Q3yDafbzHJgdjjCMOzwboZ4FlypY3TKJPtLXQFYPnu76ds0e0CI2icn7mJprd3P8/5RqsXgjqY7yt
	ytkcBwPPKR0RHM1JJr6YheZxoDUAEfmRbXPuqrebKo+rAwD7L4YYqSOAynR8Ei6+4+VW6H9k1C+zG
	qwxGRP5A==;
Received: from ip6-localhost ([::1]:46830 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r7aiL-000oAW-C0; Mon, 27 Nov 2023 12:27:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21362) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r7aiD-000o9a-3z; Mon, 27 Nov 2023 12:27:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=GegfT4xq/76eYo1xH8+90lnem5VwQUeWPNXFZGLhBQY=; b=xSuTanijf2pUC6Wmk27NM1Pwo4
 29XzNEUxc3vVnV893Q/YQu7tWEGj4iffBNa2im+dTSEXyhpLsMCICvqlcLTCRHtxgLptR8AFnUz0L
 RkxXEPejSocjxyeu12z1sZAt8jPycitwMnfhdq8ZrHF45JCY+EaRSA8dG51BubCSiiG63BYbXwBQr
 /X1d6KNmAGXhNinb3X6GacnvtWe/8IH3WdqTaf+IokZxk8CEwm1i0pRIJ1tGSjdw1ipV8CmjNhIUN
 SqEs+WynMQ8YyYAZnEDOb3vlirqBA3wmBew/T6iLqVoDgNHXoPqr8NmBvkaMg47gIE9t3H49MEQj9
 ne9kloKMs9fVWC7ObkTu49ZwT7APHE7m2aPtQA0lvvPQF3R3/Akt/4bo8xnHca/TLURVRzzHpgixK
 /I1VUhO28otpRECk5WcD/9LTGP58qOROy63LGo6yd/pY62WKct0drHO+imXy52ryUYxd3utGvECuQ
 Ad3Lo2tIyFgYxyRqqg9Vd8z3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r7aiC-000jIV-1u; Mon, 27 Nov 2023 12:27:40 +0000
Message-ID: <c29a1394-1118-4b3c-a05c-484ab6957c10@samba.org>
Date: Mon, 27 Nov 2023 13:27:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE, en-US
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.19.3 Available for Download
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

This is the latest stable release of the Samba 4.19 release series.
It contains the security-relevant bug CVE-2018-14628:

     Wrong ntSecurityDescriptor values for "CN=Deleted Objects"
     allow read of object tombstones over LDAP
     (Administrator action required!)
     https://www.samba.org/samba/security/CVE-2018-14628.html


Description of CVE-2018-14628
-----------------------------

All versions of Samba from 4.0.0 onwards are vulnerable to an
information leak (compared with the established behaviour of
Microsoft's Active Directory) when Samba is an Active Directory Domain
Controller.

When a domain was provisioned with an unpatched Samba version,
the ntSecurityDescriptor is simply inherited from 
Domain/Partition-HEAD-Object
instead of being very strict (as on a Windows provisioned domain).

This means also non privileged users can use the
LDAP_SERVER_SHOW_DELETED_OID control in order to view,
the names and preserved attributes of deleted objects.

No information that was hidden before the deletion is visible, but in
with the correct ntSecurityDescriptor value in place the whole object
is also not visible without administrative rights.

There is no further vulnerability associated with this error, merely an
information disclosure.

Action required in order to resolve CVE-2018-14628!
---------------------------------------------------

The patched Samba does NOT protect existing domains!

The administrator needs to run the following command
(on only one domain controller)
in order to apply the protection to an existing domain:

   samba-tool dbcheck --cross-ncs --attrs=nTSecurityDescriptor --fix

The above requires manual interaction in order to review the
changes before they are applied. Typicall question look like this:

   Reset nTSecurityDescriptor on CN=Deleted Objects,DC=samba,DC=org back 
to provision default?
         Owner mismatch: SY (in ref) DA(in current)
         Group mismatch: SY (in ref) DA(in current)
         Part dacl is different between reference and current here is 
the detail:
                 (A;;LCRPLORC;;;AU) ACE is not present in the reference
                 (A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY) ACE is not present 
in the reference
                 (A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;DA) ACE is not present 
in the reference
                 (A;;CCDCLCSWRPWPSDRCWDWO;;;SY) ACE is not present in 
the current
                 (A;;LCRP;;;BA) ACE is not present in the current
    [y/N/all/none] y
   Fixed attribute 'nTSecurityDescriptor' of 'CN=Deleted 
Objects,DC=samba,DC=org'

The change should be confirmed with 'y' for all objects starting with
'CN=Deleted Objects'.


Changes since 4.19.2
--------------------

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
    * BUG 15520: sid_strings test broken by unix epoch > 1700000000.

o  Ralph Boehme <slow@samba.org>
    * BUG 15487: smbd crashes if asked to return full information on 
close of a
      stream handle with delete on close disposition set.
    * BUG 15521: smbd: fix close order of base_fsp and stream_fsp in
      smb_fname_fsp_destructor().

o  Pavel Filipenský <pfilipensky@samba.org>
    * BUG 15499: Improve logging for failover scenarios.

o  Björn Jacke <bj@sernet.de>
    * BUG 15093: Files without "read attributes" NFS4 ACL permission are not
      listed in directories.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 13595: CVE-2018-14628 [SECURITY] Deleted Object tombstones 
visible in
      AD LDAP to normal users.
    * BUG 15492: Kerberos TGS-REQ with User2User does not work for normal
      accounts.

o  Christof Schmitt <cs@samba.org>
    * BUG 15507: vfs_gpfs stat calls fail due to file system permissions.

o  Andreas Schneider <asn@samba.org>
    * BUG 15513: Samba doesn't build with Python 3.12.


#######################################
Reporting bugs & Development Discussion
#######################################

Please discuss this release on the samba-technical mailing list or by
joining the #samba-technical:matrix.org matrix room, or
#samba-technical IRC channel on irc.libera.chat.

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

         https://www.samba.org/samba/history/samba-4.19.3.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team



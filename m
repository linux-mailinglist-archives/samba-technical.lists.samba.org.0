Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F078ACF370
	for <lists+samba-technical@lfdr.de>; Thu,  5 Jun 2025 17:52:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=7EoJ3iVjwii2uzzBoSo129UQlES173OYziLSKz3Sw5E=; b=kf5JXNzPzwNWKy0YpExMmiC/B0
	JbQ5WKNV28cH8399UcsS2XVNK8iSzSorIYB45O9MCDcOfzAuYEa4xQwWy3o1tb9W482f7HxlkGqU/
	l1azlMlZRgulqOpudQrXM8KStoGqCaUZGNZ/yMtLKRQahn7sg17kwmbdlQ73vrfV4ldZfj4cOCMXV
	n31+TKwSyIMNZ/8jjYxJRpNzS1lWKQq5Zr5T6eJBcomdaZqoNJ0PqsgWLs67BCCfbOuhGpeXpCAGE
	3p39MVkHkG3uKYQfusuW5EatMKQRG7B6BcR0xpisuVVkw49RAeoppGSM+XXkJnXWTL2LRghq0dIr3
	0fA/erTQ==;
Received: from ip6-localhost ([::1]:35854 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uNCsg-006gEX-59; Thu, 05 Jun 2025 15:51:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:52658) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uNCsX-006gDp-IG; Thu, 05 Jun 2025 15:51:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=7EoJ3iVjwii2uzzBoSo129UQlES173OYziLSKz3Sw5E=; b=mEBlFeG9Sv+yWyb5e06FXIl6Ls
 CUesWifeRluJSbNUag5tE847KukYFJ+31ENbWx4+X2HIXVC59g/aEQlVR6Y1LeWAfQJ6fJwehL6H2
 19Frb7sfBHws03Wn4GcsZYqlrmsXt+IUFVfbuXmH2gcHEkkPWeXRvysaADGbWAej6XIMVKSKtJyjT
 nV8ERJa0kHM72jEE6wqYPKtK3HgfpUmhNe3mu+ERqwImYYcJ+kbEUUmvZ53m4sY392RwGiQRSu8UY
 sPP4+fZt60EVRU1uBiVy8Wi/KhXzWh88sS9gEPAe5859z5WVZDJxtyJPBhdo2rmCc16sZNLYK+1Ho
 Tv9cVccY36tn/k+wfzQn5Hh2VMh1ys+4OxdBmOPJNwGgK0LnaRC5nsKWBlY7thNwvK5mBvzQdhJgI
 HAptBtTxtR9po1jSJf++Z39dQuR4DN5DyM5oiw1/RKuHJwo6a/iFFzk3nb8cfIuGnGE70ZZ7QRG8i
 1zP2UdDhXWseX6TvO6dFKUFP;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uNCsW-009BU8-39; Thu, 05 Jun 2025 15:51:41 +0000
Message-ID: <9aa176d3-3864-4451-952d-ab1b5ed9d2c3@samba.org>
Date: Thu, 5 Jun 2025 17:51:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.22.2 Available for Download
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

This is the latest stable release of the Samba 4.22 release series.
It contains the security-relevant bugfix CVE-2025-0620:

     smbd doesn't pick up group membership changes
     when re-authenticating an expired SMB session
     https://www.samba.org/samba/security/CVE-2025-0620.html


Description of CVE-2025-0620
-----------------------------

     With Kerberos authentication SMB sessions typically have an
     associated lifetime, requiring re-authentication by the
     client when the session expires. As part of the
     re-authentication, Samba receives the current group
     membership information and is expected to reflect this
     change in further SMB request processing.

     For historic reasons, Samba maintains a cache of
     associations between a user's impersonation information and
     connected shares. A recent change in this cache caused Samba
     to not reflect group membership changes from session
     re-authentication when processing further SMB requests.

     As a result, when an administrator removes a user from a
     particular group in Active Directory, this change will not
     become effective unless the user disconnects from the server
     and establishes a new connection.


Changes since 4.22.1
--------------------

o  Ralph Boehme <slow@samba.org>
    * BUG 15707: (CVE-2025-0620) [SECURITY] CVE-2025-0620: smbd doesn't 
pick up
      group membership changes when re-authenticating an expired SMB
      session.
    * BUG 15861: Profile sync fails due to Directory Leases.

o  Pavel Filipenský <pfilipensky@samba.org>
    * BUG 15727: net ad join fails with "Failed to join domain: failed 
to create
      kerberos keytab".

o  Stefan Metzmacher <metze@samba.org>
    * BUG 15851: dcerpcd not able to bind to listening port.

o  Anoop C S <anoopcs@samba.org>
    * BUG 15819: vfs_ceph_snapshots fails to list snapshots for entries 
at any
      level beyond share root.

o  Martin Schwenke <mschwenke@ddn.com>
    * BUG 15858: CTDB does not put nodes running NFS into grace on graceful
      shutdown.


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

         https://www.samba.org/samba/history/samba-4.22.2.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team



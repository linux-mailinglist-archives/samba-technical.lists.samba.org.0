Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0E65100EF
	for <lists+samba-technical@lfdr.de>; Tue, 26 Apr 2022 16:51:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=M9NfS3B3X6R/AmP1/G8JJpONh5vvjEoDn6rcpL1dZI0=; b=Iisbmdc3y9bYL/AJyCy/JhdP4I
	02v1mcRvC4lbsgeP4g8hbB1RVtRDC5dEhVPFCGoDHThoqxCh+YoQLwtMIPu7h3ivJwmIt7k3bdsFj
	2lKNyEKY2UDG2Uoa+gYYIU2L31QNSarfNbeEdwqCmPRNglq5OMBFv2tolzSiFzia9Vz66Zsi38icK
	qJegmUplaKVfbV9R48zI3cEUBurJ4JRujEos96cMxXrdpstSgK+6S7v6pehO43ij+NUXKgZM+Bzv2
	shz09sahkv3Aj1LOW323Rrmx4ORI2qzgcqCDZTE+XSUHBcDhQM1Fir2cO1eiAoJJXtdObbVPEwDxZ
	+V5spajQ==;
Received: from ip6-localhost ([::1]:44664 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1njMWO-002LyW-TS; Tue, 26 Apr 2022 14:50:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64024) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1njMWC-002Lxa-7h; Tue, 26 Apr 2022 14:50:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=M9NfS3B3X6R/AmP1/G8JJpONh5vvjEoDn6rcpL1dZI0=; b=ZYRecmBS/VoLDuHUq8XbZyZFWZ
 RIOngeugLMlNd10exW3rBFnzN2rp7CDOBe0C6OuaBtSow0R4I7+GXbnKUqxsL/M+bqSaAK9zWpSO0
 u61FFqEWtXbwIkcBYbatAwuoDIQOZvErgmEuxOAImaWy3y4pSHpsztuhvC1BaYq7TyaFkCOwoLCB4
 Ib/lOLmlgPG6u9klraM7JDL/AWy2OQ7tWGDH5Eg0kKqOWNPJKVck3yFat+iuaKDGEgG8E6Vlye45k
 6YK1CDhgJwE/9SwDJjw32PfOVTgyWtQo4Cn9vFHfx5X0tvYQRo3V6DrqwD5aioPWRx3L0bgTHsEOW
 O0EZvkelRfBhkKhL0J58j++9/B/C4PTUhG6R8zwDFplIFc+OlnosLxCq88SbIxmS4biGry1DlWTky
 jPBy2lYqj+zoka4dIgTkyubjcRYgRFI1aXTWn5NIOz0vn/oH7VSbdwiT1iJrbU7Z5SkxHnDx+Bc+/
 Rznfqct7AcuSYsWtH51/CdKh;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1njMWB-002Rt1-NF; Tue, 26 Apr 2022 14:50:19 +0000
Message-ID: <15e87da2-eea2-ad00-6e32-161b401c5932@samba.org>
Date: Tue, 26 Apr 2022 16:50:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.15.7 Available for Download
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

This is the latest stable release of the Samba 4.15 release series.


Changes since 4.15.6
--------------------

o  Jeremy Allison <jra@samba.org>
    * BUG 14831: Share and server swapped in smbget password prompt.
    * BUG 15022: Durable handles won't reconnect if the leased file is 
written
      to.
    * BUG 15023: rmdir silently fails if directory contains unreadable 
files and
      hide unreadable is yes.
    * BUG 15038: SMB2_CLOSE_FLAGS_FULL_INFORMATION fails to return 
information on
      renamed file handle.

o  Ralph Boehme <slow@samba.org>
    * BUG 14957: vfs_shadow_copy2 breaks "smbd async dosmode" sync fallback.
    * BUG 15035: shadow_copy2 fails listing snapshotted dirs with
      shadow:fixinodes.

o  Samuel Cabrero <scabrero@samba.org>
    * BUG 15046: PAM Kerberos authentication incorrectly fails with a 
clock skew
      error.

o  Pavel Filipenský <pfilipen@redhat.com>
    * BUG 15041: username map - samba erroneously applies unix group 
memberships
      to user account entries.

o  Elia Geretto <elia.f.geretto@gmail.com>
    * BUG 14983: NT_STATUS_ACCESS_DENIED translates into EPERM instead 
of EACCES
      in SMBC_server_internal.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 13879: Simple bind doesn't work against an RODC (with 
non-preloaded
      users).
    * BUG 14641: Crash of winbind on RODC.
    * BUG 14865: uncached logon on RODC always fails once.
    * BUG 14951: KVNO off by 100000.
    * BUG 15001: LDAP simple binds should honour "old password allowed 
period".
    * BUG 15003: wbinfo -a doesn't work reliable with upn names.

o  Garming Sam <garming@catalyst.net.nz>
    * BUG 13879: Simple bind doesn't work against an RODC (with 
non-preloaded
      users).

o  Christof Schmitt <cs@samba.org>
    * BUG 15027: Uninitialized litemask in variable in vfs_gpfs module.

o  Andreas Schneider <asn@samba.org>
    * BUG 15016: Regression: create krb5 conf = yes doesn't work with a 
single
      KDC.


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

         https://www.samba.org/samba/history/samba-4.15.7.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team


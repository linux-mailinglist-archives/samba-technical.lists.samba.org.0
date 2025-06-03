Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D17ACC0F9
	for <lists+samba-technical@lfdr.de>; Tue,  3 Jun 2025 09:12:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=9GM7QYGD4jO9pht4IYMbi0B/zqSHXgCIFbe95I/UT24=; b=eutvwygWc83MlaSYXACPRvDPC7
	VHEnH8Ia91DW9fcY86LYTsVkZryI++mPSwFHGCa7/SIQv6pGQ2oEsPIAjS5vIZXK0o0Pfl3NlrJDZ
	OKqVqBHTwAApu31fN7PwqGRFhJ0Ow0zg/nDqJcXc9VMqmduPeIx9vfIhiwqSFWu16BP/qolchjTs+
	tH7HIOaXu3b8Bp4WCOglnToeBXjl5sHfK3NQQqmmJFCZdsoRtxcXbbpCu+zeBFbddAuFnIUHQMV24
	dQ4idLWhqPWavpllHAgguA4Qvn/PTxeOkL3iuij0jN7NsLqX4qEVIxyKC1DonhDH8QjUL53/fZBil
	TciVQqVw==;
Received: from ip6-localhost ([::1]:30212 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uMLod-006V3j-Hs; Tue, 03 Jun 2025 07:12:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:52352) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uMLoS-006V33-6r; Tue, 03 Jun 2025 07:11:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=9GM7QYGD4jO9pht4IYMbi0B/zqSHXgCIFbe95I/UT24=; b=nBN24EMMKrnuRJ33mv+nHc8oOQ
 dtxpfBYxrKMXwylNWriE4fMQP+CXJbksbH6Uw6UPm4Mmca7WEmyWBF1G9YNQcQvYA2cMepfBYTM3g
 aNwaGiVITwjOLt25RMhX6cxMyOWbc5QJIVQtokX0OFEQpNJVsiNzJtlT5QWREvpY96UIT1fACV8gB
 SKwxXi3PltFTS67PNqdeyrtR+eOep9m7JX+eB6ME0ARhk8teIwgYAlIs3krxeqh1YAoH5EPbP3cF6
 z+0Lucr4mrMNE7JDS0EMSU2j9CXQ0cS9zjqSUkwV3t+qMM84FQtJd2vCoPjXySLeRdgGhCiO6XdG4
 I8gB8Fcsh7yY3tQF7RmZ6VYs5AZ/QNQWe73ylPfIYMvzDNV8U6P2CwON2Vf63PbZ/K/C1ax5B4fB7
 5orl+ogckaIvdM4IZtLwneuaApgj3ZAIj7EVkoKLsPuE7O5dCQQWdbWt/WkhBuu5nIz3s97pMAS27
 X8tCNZrCGlDH1gMJGm1FlphB;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uMLoR-008f8x-1K; Tue, 03 Jun 2025 07:11:55 +0000
Message-ID: <4ab34772-0c26-4b03-9cec-a375e36fc9ff@samba.org>
Date: Tue, 3 Jun 2025 09:11:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.21.6 Available for Download
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

This is the latest stable release of the Samba 4.21 release series.
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


Changes since 4.21.5
--------------------

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
    * BUG 15774: Running "gpo manage motd set" twice fails with backtrace.
    * BUG 15829: samba-tool gpo backup creates entity backups it can't read.
    * BUG 15839: gp_cert_auto_enroll_ext.py has problem unpacking GUIDs with
      prepended 0's.

o  Ralph Boehme <slow@samba.org>
    * BUG 15707: CVE-2025-0620 [SECURITY] smbd doesn't pick up group 
membership
      changes when re-authenticating an expired SMB session.
    * BUG 15767: Deadlock between two smbd processes.

o  Pavel Filipenský <pfilipensky@samba.org>
    * BUG 15727: net ad join fails with "Failed to join domain: failed 
to create
      kerberos keytab".

o  Andreas Hasenack <andreas.hasenack@canonical.com>
    * BUG 15774: Running "gpo manage motd set" twice fails with backtrace.

o  Volker Lendecke <vl@samba.org>
    * BUG 15841: Wide link issue in samba 4.22.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 15767: Deadlock between two smbd processes.
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

         https://www.samba.org/samba/history/samba-4.21.6.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team




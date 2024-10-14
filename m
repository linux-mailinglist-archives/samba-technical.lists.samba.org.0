Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0E399C92D
	for <lists+samba-technical@lfdr.de>; Mon, 14 Oct 2024 13:45:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=v1ke0o/0ZaIR9+T3NPHIEv3GmwMSdulvckvugtOmO4U=; b=VnHM08NQyHxy8lI4CVCNcWT4Xb
	JWeJjE7U/+kDmBFsZ+YQFeQLIAFkgnUMkpNlh/o7tJfM/saznfOyN8UPAhlOYE3h8/26dZAi0gUJu
	HHs307EAb4S1Jnd3hlIAwEHIua7f8483CZ9jzcGrQ6hhW6YJ+WGbuYwZZUQ8OtBSNZjYp4teAPxJ0
	ZG0RHZxyBXvgcWxbKxiVy5+QJJA2zRHNW6eIoFjMFu32PrqhfYEn1cE2zqX8qlWxfey6M+FIlozXJ
	KHiaDUL4GDmsuzrOXZR2J0Oh3ewiomNAzvIKTWuTJ2PmtJ50MfzB6jv+L7cw1yMSbbxYG8uRkxkZq
	ngEiLYiA==;
Received: from ip6-localhost ([::1]:56718 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t0JV0-003rDw-CS; Mon, 14 Oct 2024 11:44:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25958) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t0JUs-003rDG-D2; Mon, 14 Oct 2024 11:44:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=v1ke0o/0ZaIR9+T3NPHIEv3GmwMSdulvckvugtOmO4U=; b=OU80TyNqoSVB+Z1Vd0Dscy5lfL
 GqBXF+YwrPoMyLdobx9lpJDDUhRhTvNSOxNdkKiyyyPzmsar90w3tzq1Rd7FvvU3SmqIf5CBPnIpi
 hjQCnuJXVy3KMjKu1YYuV9fMT8R5gtrEFwl5UQjGQ2XOVHSgjob5wHzvyzWH7huEVlFyZimVBF0Hf
 7LDrct9jnROEvMAz+ovzusGr0Dt2skDIFA3D7DoPWWm81fBI9X/rXRZ64WpoQDU1t6f3hDutv9cOf
 OqTqEIVF64Lfz2JRHzdy3vZItc7fSP0AJjEpSYw3e3O3TUlGg+flpwq+VuJvLOZ4UT4weI3cxrif3
 PBxY0blivf/UHzvvAGdldZUNFyN7jEfDOD0bnigmuBCo8z7iW/1ZSUlEOS2VTVMz/uRtLn+GxbRWM
 wzNKqsCAloQATLiSSsS+pkUvyhQ2lhGVxDAFkapjl70Qss6TcElqMOK3Rvj7ZCm79xfNfsBGgQ6UE
 tJf6fGzPIrv9jG4hIleXXqIC;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t0JUr-004lBg-2l; Mon, 14 Oct 2024 11:44:21 +0000
Message-ID: <3fe05a7e-6709-405d-acc2-b2eb34594758@samba.org>
Date: Mon, 14 Oct 2024 13:44:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.21.1 Available for Download
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


Changes since 4.21.0
--------------------

o  Ralph Boehme <slow@samba.org>
    * BUG 15624: DH reconnect error handling can lead to stale sharemode 
entries.
    * BUG 15695: "inherit permissions = yes" triggers assert() in 
vfs_default
      when creating a stream.

o  Alexander Bokovoy <ab@samba.org>
    * BUG 15715: Samba 4.21.0 broke FreeIPA domain member integration.

o  Andréas Leroux <aleroux@tranquil.it>
    * BUG 15692: Missing conversion for msDS-UserTGTLifetime, msDS-
      ComputerTGTLifetime and msDS-ServiceTGTLifetime on "samba-tool
      domain auth policy modify".

o  Stefan Metzmacher <metze@samba.org>
    * BUG 15280: irpc_destructor may crash during shutdown.
    * BUG 15624: DH reconnect error handling can lead to stale sharemode 
entries.
    * BUG 15649: Durable handle is not granted when a previous OPEN 
exists with
      NoOplock.
    * BUG 15651: Durable handle is granted but reconnect fails.
    * BUG 15708: Disconnected durable handles with RH lease should not 
be purged
      by a new non conflicting open.
    * BUG 15714: net ads testjoin and other commands use the wrong 
secrets.tdb in
      a cluster.
    * BUG 15726: 4.21 using --with-system-mitkrb5 requires MIT krb5 1.16 
as rfc
      8009 etypes are used.

o  Christof Schmitt <cs@samba.org>
    * BUG 15730: VFS_OPEN_HOW_WITH_BACKUP_INTENT breaks shadow_copy2.

o  Andreas Schneider <asn@samba.org>
    * BUG 15643: Samba 4.20.0 DLZ module crashes BIND on startup.
    * BUG 15721: Cannot build libldb lmdb backend on a build without AD DC.

o  Jones Syue <jonessyue@qnap.com>
    * BUG 15706: Consistent log level for sighup handler.


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

         https://www.samba.org/samba/history/samba-4.21.1.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team


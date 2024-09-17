Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF9D97B1B3
	for <lists+samba-technical@lfdr.de>; Tue, 17 Sep 2024 17:10:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=ZL0nFJ38jO3hEws1+Bb3CooCkdj7lH6oOi4b7Q231dQ=; b=VEDrNnjaeHy0RBxolnv1s3A5EY
	WoRUW9pIGcjPhhteWVvzJTsTX/6NSAoJF+ov3A5YucwdYkodaZP98hioCKnVQx3H0B/91+Aegd47z
	0cBbT819ckQQpAiIgWRAfuPDHnPLaax719EJvmM/j0Nmip+6CzttF6z2zO356ARiuUzdCBsdLIphA
	8N9HvojRzE5YPcq0dkI8x/mD7dLWhIWASQFGbMBmhI/+fCv2cci62W4OwniHvltN3lYNry6gQ0uBj
	1Z7kFmKdpXe7RiU/Ms3RTo7KRu5S69DoT5bZ58W9wLOXqhoBnj8jKVZJYHSWwkcGxOqWS2DyoFODq
	CN0PCT6A==;
Received: from ip6-localhost ([::1]:34948 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sqZq8-000C1k-Iz; Tue, 17 Sep 2024 15:10:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12160) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sqZq0-000C13-3s; Tue, 17 Sep 2024 15:09:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=ZL0nFJ38jO3hEws1+Bb3CooCkdj7lH6oOi4b7Q231dQ=; b=3/SHatNStkP3UTqLuf3SnjRlqN
 NUP3pSNrwZ3ucKOVGPz7Sm72ahsVkKCBK0LjV+3gNUNBUsC790HVQpoZGvWgiz0rojyX1Cl3M32JM
 uN8cIOTtbuW0Veka8Oyr5teWNEXKwIarJvRq+qlCvHthsE++qo12nZCGS2nys8BfULOKbVxM295If
 Qui3QpYK2HTpq5ZLPS/4RB6YkprsBzf6nuKxqbgSeOTmClYSGJNscWHpFRbsTI8amyfrYxsuocRhQ
 t0fc3pyg7wMrqSkHdTV7no5UQGFG/Zygke0A5gp7KO5iMCj9l7dBt+7IPTXFAyeUogWbvGQMm9+Fe
 8UEf7JNvaEOfWxc722oskK+v88KKKCtlF/Dte0dfS0cTbnt2p4qjnK03vWcs/3WQD/wn9O1dy+gRs
 MdkqZUU0VqtemY8K+mxmuwad1Sj8evs4oQRW3HXRaJoeaG11BJ5fX0hYq4merQJeeXbL3OtQ//r9Z
 q4d0lFWSwmzzxQquB/x0tZmP;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sqZpy-000ZHw-1s; Tue, 17 Sep 2024 15:09:54 +0000
Message-ID: <21b1f3e6-9353-41e5-b651-c19b114596fd@samba.org>
Date: Tue, 17 Sep 2024 17:09:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE, en-US
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.20.5 Available for Download
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

This is the latest stable release of the Samba 4.20 release series.


Changes since 4.20.4
--------------------

o  Ralph Boehme <slow@samba.org>
    * BUG 15695: "inherit permissions = yes" triggers assert() in 
vfs_default
      when creating a stream.

o  David Disseldorp <ddiss@samba.org>
    * BUG 15699: Incorrect FSCTL_QUERY_ALLOCATED_RANGES response when 
truncated.

o  Pavel Filipenský <pfilipensky@samba.org>
    * BUG 15698: samba-tool can not load the default configuration file.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 15696: Compound SMB2 requests don't return
      NT_STATUS_NETWORK_SESSION_EXPIRED for all requests, confuses
      MacOSX clients.

o  Anoop C S <anoopcs@samba.org>
    * BUG 15686: Add new vfs_ceph module (based on low level API).

o  Shachar Sharon <ssharon@redhat.com>
    * BUG 15686: Add new vfs_ceph module (based on low level API).
    * BUG 15700: Crash when readlinkat fails.

o  Jones Syue <jonessyue@qnap.com>
    * BUG 15677: ntlm_auth make logs more consistent with length check.


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

         https://www.samba.org/samba/history/samba-4.20.5.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team


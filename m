Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA90493D0B
	for <lists+samba-technical@lfdr.de>; Wed, 19 Jan 2022 16:26:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=aiJrEo4gzB38pmkAyxp0VUKfDiilIHIJUpRc78UpxUQ=; b=aed/ZFe3DjXZNDfxTNv4A2QCpn
	nqGOCWtBUSzj+b1AlGPrTZ27ak6KLNe8HwRxKNMeHJ/NgxCEhFW8gt9a0tP114MwWaY44/ZRfu3FZ
	dJz6jgVW8xV19+t/em3eV6CpyiUlnr/tZU1/y7x87qNwGSZdc62wG/ufjBNxFiRTi6KYdt3Ybllpl
	Yyzyt97eecP2GpZQV1kV1l9vAr9YOwIehJx2Ba1/QRg2Zj7zAYLJfODcjwNIhXWxPKr01AoOVvovX
	7+LVE/OhPfpwHCMybnUUzMKXJLjEmPv6jh2qN0SqWehGS2+hbnf2SUKSbKmQEomQK1G55jXGEhjmm
	zEUljjog==;
Received: from ip6-localhost ([::1]:54338 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nACqJ-009u68-8E; Wed, 19 Jan 2022 15:25:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55158) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nACqE-009u5p-GS; Wed, 19 Jan 2022 15:25:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=aiJrEo4gzB38pmkAyxp0VUKfDiilIHIJUpRc78UpxUQ=; b=xBzzZihlUIRZ23BXYRtz7KD41E
 lBxaULF7OepA2i3meDY4z1B6ZXKF68Si+vnzv6RBaZm4iiKSgkUfpc+6lEI0nxgg7M8Z43vclSxdC
 UP6qZo9AUvN0T8qDYaAl1bOywZvqHxHZIFjrA5+JLlQvicqEctzFvr4iJG93alc+BR9ZY90VUlvfR
 j5o3tIIWQGj2YMpAmHiY49B4Gfrp5rYlJPrTr2bHOF4JOuRBIdPsK7uHOgXQbkIOaMj46tswxAZrA
 3jyUcK+IusaW6Bl2yBUz31kGmwm2+brrDSwqfOErW3JomrgQgWIAzdVunCeyJ+ZWG2aJ6mIseoGOG
 TlzmoSFS3I+GTM1PmuJt/ekl7EyPmTx6UdOdsm+JYyVMfW8nZdANPUsmHhUO7uUiSY2Rk0dYgupte
 1tGf3oIzzRYsQr0Wm6UQkbOQHHac1jA3wnVpr36jQtC7VtSeLvA1IjV8Hzp2atoTvZ66nxYpLUuzB
 fbBWL/2BbN3cL2OBValiP9RX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nACqD-0083fe-VD; Wed, 19 Jan 2022 15:25:42 +0000
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.15.4 Available for Download
Message-ID: <fcf094b3-2ea1-34e4-4a6b-bb4fd1039743@samba.org>
Date: Wed, 19 Jan 2022 16:25:41 +0100
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
---------------------

This is the latest stable release of the Samba 4.15 release series.


Changes since 4.15.3
--------------------

o  Jeremy Allison <jra@samba.org>
    * BUG 14928: Duplicate SMB file_ids leading to Windows client cache
      poisoning.
    * BUG 14939: smbclient -L doesn't set "client max protocol" to NT1 
before
      calling the "Reconnecting with SMB1 for workgroup listing" path.
    * BUG 14944: Missing pop_sec_ctx() in error path inside 
close_directory().

o  Pavel Filipenský <pfilipen@redhat.com>
    * BUG 14940: Cross device copy of the crossrename module always fails.
    * BUG 14941: symlinkat function from VFS cap module always fails with an
      error.
    * BUG 14942: Fix possible fsp pointer deference.

o  Volker Lendecke <vl@samba.org>
    * BUG 14934: kill_tcp_connections does not work.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 14932: Failed to parse NTLMv2_RESPONSE length 95 - Buffer Size 
Error -
      NT_STATUS_BUFFER_TOO_SMALL.
    * BUG 14935: Can't connect to Windows shares not requiring 
authentication
      using KDE/Gnome.

o  Andreas Schneider <asn@samba.org>
    * BUG 14945: "smbd --build-options" no longer works without an 
smb.conf file.

o  Jones Syue <jonessyue@qnap.com>
    * BUG 14928: Duplicate SMB file_ids leading to Windows client cache
      poisoning.


#######################################
Reporting bugs & Development Discussion
#######################################

Please discuss this release on the samba-technical mailing list or by
joining the #samba-technical IRC channel on irc.libera.chat or the
#samba-technical:matrix.org matrix channel.

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

         https://www.samba.org/samba/history/samba-4.15.4.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team


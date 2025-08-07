Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F59B1DAD9
	for <lists+samba-technical@lfdr.de>; Thu,  7 Aug 2025 17:32:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=fsHmfix4vaen0ZySeKdD35sFXoohqY3nzgSuoIVe99o=; b=d0Rabunmg8gu9IwbLVGdI/y69j
	BDYgv+2ZcsY9IVmtBi3akArlDD8yzccRXK/t+CcOVvjqeoULmQu5djUHCX+WMi5yj3FIPL6PHYizH
	/vvqjP/S/tVt8EPA8j2F2bjYtKm1/lP4o5knx/sCLkDAf8dA8qrf/4wKWvPo6YuSckeOcspjAk5uv
	1i2wbfwWWr1j1njFk2Xh7UoyZ/+MOU6ckLSATSjYnYW+5qh/uSKBxrImP6wiHCuJE4xjqqWwFQfdS
	R8F7J7w1AxrgjeZP7r/rHy9AMXrjC+hnflBlscli2h7qoV5ZU6IhrmfaK3CNnllLWsjX/zzuBF9II
	M8cdfSqw==;
Received: from ip6-localhost ([::1]:18326 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uk2b7-00EY2J-IA; Thu, 07 Aug 2025 15:32:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54182) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uk2ax-00EY0P-R6; Thu, 07 Aug 2025 15:31:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=fsHmfix4vaen0ZySeKdD35sFXoohqY3nzgSuoIVe99o=; b=d/vSlmVCOL+Q1piEOyH1WqIQ6n
 9Fwz3OQddNRlsEQfqZ+jMd/YpuXtfFHvCccG4c6wTLrujOhOdkofdx2Njx+0mHS3VDmvgmC9Y8DLU
 HlV8oDAu0Nkoc75CajEwWQJnQ7+1bHaPVhwVejjtt5gaOjMY+K32ekuiD9jvBknBn437TGcAHykzX
 aw7S3tQ/XuWdKCfcKYqeVumvCW0p08oMGtk10BQjr2YeDdwSqAXhyDjV1xqe+h6rUnjrxLh05Ytuu
 8VzhOUhJANVOlSWHAKr6vkGk8OijC/5MlVX6B8nuNpNoNQQ4Popsuc72sD8HPrJ12L4w9ngT6uK7d
 qNS6rRAYQrIkYiCzauvn1TJhjXb8MLqygdeMrcT5S+IT0NyW4zRMtyyxghZ+Up6+qcO8Ha5TfL3hq
 ilwyjfyf4y5Msnt3VVArklLi/j11qDdQ7cdN+jirOZ9crKbqTJr/iDoXAoCqfVHwdeUgPuf1L2Yw2
 yk79qv2owgBQdAUWLgDBy6b+;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uk2ax-001bz3-22; Thu, 07 Aug 2025 15:31:55 +0000
Message-ID: <4463ba86-dd59-4e9a-9a3c-b5f50eed021a@samba.org>
Date: Thu, 7 Aug 2025 17:31:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.23.0rc1 Available for Download
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

This is the first release candidate release of Samba 4.23.  This is *not*
intended for production environments and is designed for testing
purposes only.  Please report any defects via the Samba bug reporting
system at https://bugzilla.samba.org/.

Samba 4.23 will be the next version of the Samba suite.


UPGRADING
=========


NEW FEATURES/CHANGES
====================

Enable SMB3 Unix Extensions by default
--------------------------------------
todo

Add support for SMB3 over QUIC
------------------------------
todo

Modern write time update logic
------------------------------
todo

Initial version of smb_prometheus_endpoint
------------------------------------------
todo

samba-tool improvements
-----------------------
todo


REMOVED FEATURES
================


smb.conf changes
================

   Parameter Name                          Description     Default
   --------------                          -----------     -------
   smbd profiling share                    New             no
   client smb transports                   New             tcp, nbt
   server smb transports                   New             tcp, nbt
   winbind varlink service                 New             no

KNOWN ISSUES
============

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.23#Release_blocking_bugs


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

https://download.samba.org/pub/samba/rc/samba-4.23.0rc1.WHATSNEW.txt

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team


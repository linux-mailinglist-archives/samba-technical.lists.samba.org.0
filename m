Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 782E67598E0
	for <lists+samba-technical@lfdr.de>; Wed, 19 Jul 2023 16:55:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=axSjXiXW29x1CdPDNLIQkDtONZSWDM6t4yvlM92XP0M=; b=qwacO1G1D8sKGyFqIZO8Bg8Ivc
	/ERaKZ+Zq1FANT4XMbBwiE4Ua90jnE1oQLuF8fkEev7u98TYotT+dMybo8x4BlcaKtPwrxfDELqt2
	ufogVmlg7V+SR64g3Zxhp5hZyUnG4lgqv3mYxSDWIVEyRqb3IozqwVh1O5Wfm1wjWq7fKA7WtCwSL
	Sc2sj2CQmdgrtSnsSRy5lEMTalYNoYLmxfPfPVpZaJPo+EFCQkXQ0EJy32T2EG19N4C+4yfGh+jQR
	sT66Q3RJt9UDT9R/zLfLcNbhR6C/NGpHrF37TCWVazwuQRL+RpEPD88y00D+xSEMd33ilLufJ1KxG
	Bqm7+U+A==;
Received: from ip6-localhost ([::1]:64898 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qM8aH-0040tt-J8; Wed, 19 Jul 2023 14:55:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54184) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qM8a1-0040tI-SL; Wed, 19 Jul 2023 14:55:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=axSjXiXW29x1CdPDNLIQkDtONZSWDM6t4yvlM92XP0M=; b=Lb4Fzub3iPyb/d8wOgBU5JsyMu
 dyXJTUDsTkZgm76qE4XjYl/gVGsC9qSvHSubPHkRZwbaoMlZOX76Vl72Uegib+EAFTArmY1HvanIs
 by7lXl4NttmroC2DDAOuvMzJI9Zqnlb/zkEeMaXI8A3Jl9K8sPZp7bOH9zRBJaBtF0ZY6CTVVQxPV
 WzB50dq/Qw1GxbhCT16VZAqLMIQm7ltF5UDgrxxGRc7ycgu4EQfbAABeI8cX275GB0xYJSh8po8xT
 haWctDkOReY74GpXiiSQ0rFj+rLo5e8Sdz9y8KzoLDmle1SeqRVwxC3pT2nMJtThj0R5dtdeWujF+
 f4+zVGherO9QGCg4ua/3lwC/OiChzPUC+PuNo730FcbKruk7sP6WTGHRh0xworyv+oSDYPejmyPIA
 DrGCB6QeofV08wiCor7v17fyjACSWi3+SOQZ5qbXUlFziFqSfU+67dg9ZE7Sd4UQcqLiRSsTLniYm
 gMDiA6tqR8/xo9Rg3LWWj56M;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qM8a0-002u01-1A; Wed, 19 Jul 2023 14:55:04 +0000
Message-ID: <ceeac6e9-168c-d0c2-6a5b-40b211da4045@samba.org>
Date: Wed, 19 Jul 2023 16:55:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba-technical@lists.samba.org,
 samba@lists.samba.org
Subject: [Announce] Samba 4.18.5, 4.17.10., 4.16.11 Security Releases are
 available for Download
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

This are security releases in order to address the following defects:

o CVE-2022-2127:  When winbind is used for NTLM authentication, a 
maliciously
                   crafted request can trigger an out-of-bounds read in 
winbind
                   and possibly crash it.
https://www.samba.org/samba/security/CVE-2022-2127.html

o CVE-2023-3347:  SMB2 packet signing is not enforced if an admin configured
                   "server signing = required" or for SMB2 connections 
to Domain
                   Controllers where SMB2 packet signing is mandatory.
https://www.samba.org/samba/security/CVE-2023-3347.html

o CVE-2023-34966: An infinite loop bug in Samba's mdssvc RPC service for
                   Spotlight can be triggered by an unauthenticated 
attacker by
                   issuing a malformed RPC request.
https://www.samba.org/samba/security/CVE-2023-34966.html

o CVE-2023-34967: Missing type validation in Samba's mdssvc RPC service for
                   Spotlight can be used by an unauthenticated attacker to
                   trigger a process crash in a shared RPC mdssvc worker 
process.
https://www.samba.org/samba/security/CVE-2023-34967.html

o CVE-2023-34968: As part of the Spotlight protocol Samba discloses the 
server-
                   side absolute path of shares and files and directories in
                   search results.
https://www.samba.org/samba/security/CVE-2023-34968.html


Changes
-------

o  Ralph Boehme <slow@samba.org>
    * BUG 15072: CVE-2022-2127.
    * BUG 15340: CVE-2023-34966.
    * BUG 15341: CVE-2023-34967.
    * BUG 15388: CVE-2023-34968.
    * BUG 15397: CVE-2023-3347.

o  Samuel Cabrero <scabrero@samba.org>
    * BUG 15072: CVE-2022-2127.

o  Volker Lendecke <vl@samba.org>
    * BUG 15072: CVE-2022-2127.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 15418: Secure channel faulty since Windows 10/11 update 07/2023.


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

         https://www.samba.org/samba/history/samba-4.18.5.html
         https://www.samba.org/samba/history/samba-4.17.10.html
https://www.samba.org/samba/history/samba-4.16.11.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team


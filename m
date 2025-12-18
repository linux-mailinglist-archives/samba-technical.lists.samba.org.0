Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AD1CCCC13
	for <lists+samba-technical@lfdr.de>; Thu, 18 Dec 2025 17:27:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=jvJ0YVoFEwpzvP8x8T4WINhh854crv7XAssSr6Eeif4=; b=qVJxythfyxtugbd7ezVBqB2vy+
	xZZ88oZ0yvPy8iDrHVT913ctk8LwVjqXrZjSSFmLww933Do+V266RBgoKhUkbrQh7ecziVbfRKybz
	+JagRYX7biVRHMcp0CBY1/uF1Zxj/c5trGy68R9rjbENa0FncDbg4Hy3FetZfZSSZrlHalqx9dsQf
	EQuU9UBg1VW1GOdmaPmlTGy+0B7ZUSOZwUmtDUqUJUIZJUvFfM9gQh3WQFnKdRpvFyOoJrg8mlMWa
	RYfruRuKwY5ZriaF4/VN7hmciXj9vq/hgga0nz2Rz2ezVeun4VaST8MEetUfSS5GbVZxm6RXEjRvl
	63OZXhHQ==;
Received: from ip6-localhost ([::1]:18560 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vWGqG-00GSa5-P1; Thu, 18 Dec 2025 16:27:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59724) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vWGq7-00GSZc-EP; Thu, 18 Dec 2025 16:26:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=jvJ0YVoFEwpzvP8x8T4WINhh854crv7XAssSr6Eeif4=; b=HqedGSpk9TUEwq0bz6P5ZLhbNx
 HiLqHSqdxQfDPipFcZAIYVyCpdtA4U4O4ieL8VwH6jnFL+EMhDRzXdrV8JuMY7omjonCWXNt7ga75
 rUMLYlNSOBPwWyrmL1MZ7cpUDy/3LNTKbwCsk+rE77y0tczPSJkz6yyv7VrgiBFQcD0qJm9i2ySPB
 VhGHOQyGo21LrkQJZSIawb+8I8vIPyH0KRdN1xfpoeclqwB3kQHMAMkcH3SAHibUcJG7FXtzNYaRh
 sS7kkHnjIai3kDjCuFF0rldjKE8SCI6pysAG83VAnO1A63AG37ouDsURKDs3yR3l0Zq7027HuRHRL
 FbBIp0a0OAckhWA1EbgrMtKWK2tNxwlFq643Q/qUH/5Fmg76OpXTw4cH1GDqfEGZMmP0dd6D7dBeQ
 ArRn9yqzpF6lhZ9fNBpXzWV4Us/auaW969p/1XT4wAjtaFwH9UJBCRuvS2mHS47lF5i2EY5RXC0OG
 xVoMR8EXcnH41s84ggvcuhLz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vWGq6-001EKS-2q; Thu, 18 Dec 2025 16:26:55 +0000
Message-ID: <43c9f62c-cbbf-498f-b0fe-d8eaf88dd4ee@samba.org>
Date: Thu, 18 Dec 2025 17:26:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.22.7 Available for Download
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


Changes since 4.22.6
--------------------

o  Ralph Boehme <slow@samba.org>
    * BUG 15926: Samba 4.22 breaks Time Machine
    * BUG 15930: Searching for numbers doesn't work with Spotlight
    * BUG 15947: mdssvc doesn't support $time.iso dates before 1970

o  Günther Deschner <gd@samba.org>
    * BUG 15963: Fix winbind cache consistency

o  Pavel Filipenský <pfilipensky@samba.org>
    * BUG 15940: vfs_recycle does not update mtime

o  Volker Lendecke <vl@samba.org>
    * BUG 15897: Assert failed: (dirfd != -1) || 
(smb_fname->base_name[0] == '/')
      in vfswrap_openat
    * BUG 15950: ctdb can crash with inconsistent cluster lock configuration

o  Anoop C S <anoopcs@samba.org>
    * BUG 15897: Assert failed: (dirfd != -1) || 
(smb_fname->base_name[0] == '/')
      in vfswrap_openat

o  Andreas Schneider <asn@samba.org>
    * BUG 15809: samba-bgqd: rework man page
    * BUG 15936: samba-bgqd can't find [printers] share
    * BUG 15955: Winbind can hang forever in gssapi if there are network 
issues.
    * BUG 15961: libldb requires linking libreplace on Linux

o  Martin Schwenke <mschwenke@ddn.com>
    * BUG 15935: Crash in ctdbd on failed updateip


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

         https://www.samba.org/samba/history/samba-4.22.7.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team



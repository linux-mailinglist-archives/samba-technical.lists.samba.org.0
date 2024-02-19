Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD2D85A17A
	for <lists+samba-technical@lfdr.de>; Mon, 19 Feb 2024 11:58:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=rlNNdur97Yo9hlB/wou28f1SOS//cUA+UrdoN4MZ5YQ=; b=nIwoV4mW5LApbW8N8W/alypAR+
	4WBvgOmqw9OVqTkJxOyRimwuUeT21biSk4zvqGjZHPbjdt6fMfVY+2H3lpgzLrUqKdD4BdLQRUxjz
	ocIHdaqMJvWOOQp8OAIGKsLZIS6BJNKeZCeR/d28iLxQ7zyf4gqQhgL11RGMLQ2m+jPoEMJEa7wLt
	MGELp2rLWWR/2hvE5QW14YDJ7hh5alUfeeYWa95QapYV7nFnFKYwT2ETBPsKNyJmJ+08xNKyZRHcK
	4uNoWmqiEVV/wWOM27yhym3WBknOungIGslSYfaMT23OajzsD8GJTarAVak4p6l6/sxmOn9r/XsSh
	F7cEdbdg==;
Received: from ip6-localhost ([::1]:50564 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rc1LB-008sou-8g; Mon, 19 Feb 2024 10:57:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57938) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rc1L1-008soD-M1; Mon, 19 Feb 2024 10:57:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=rlNNdur97Yo9hlB/wou28f1SOS//cUA+UrdoN4MZ5YQ=; b=NpYjQlQ1ewIyOrYZibDQqjOdeh
 LRTKB24N4jCuKi4YjYKipZoJ1CaYPLekBhh6WInMno+5XV2qsP9EqFgkK7JR9WT1bDAiFmpn8tzds
 WoCC1XFjv4br2Sd4MPwzIKJo70/QddszEk1YPPefUXjHfDwiF32Wy0mvzlJww0eJb9hh+4bt3q3wQ
 n3KR0ofzgqGaiMyIX7jfEk8hAiMpuprXNVxW0fzvlfJVssYdkKZi8QIYxJi086viDtwqhOVL5g2cn
 zTjbru3hOh1gd4VglsHa4IzmJcEAxUpBJX62n8QnVEWyxI12FzyEysCsPi/JOYqxGL49UEWlnRGBK
 y5ZyKkAcFlQKtpRCEuPx7I6s3wVUipgnJWbjHC+POScaPJgEtaQ3aH9HYstWMSHkWVtiRRM2wd5Qq
 9MBqKI8c7FNm9nIhc/g03yVUAebt3uZYYKfZddVaXXzUkr8bRL1U6MlOrKDLtqE2p0XGQHSheIsi4
 l9mBuYs/S5Xi2enUBIbhsTfw;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rc1L1-00DlQc-0A; Mon, 19 Feb 2024 10:57:31 +0000
Message-ID: <c51fd7f3-10d8-4c3f-84ac-225032623f0e@samba.org>
Date: Mon, 19 Feb 2024 11:57:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.19.5 Available for Download
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


Changes since 4.19.4
--------------------

o  Ralph Boehme <slow@samba.org>
    * BUG 13688: Windows 2016 fails to restore previous version of a 
file from a
      shadow_copy2 snapshot.
    * BUG 15549: Symlinks on AIX are broken in 4.19 (and a few version 
before
      that).

o  Bjoern Jacke <bj@sernet.de>
    * BUG 12421: Fake directory create times has no effect.

o  Björn Jacke <bjacke@samba.org>
    * BUG 15550: ctime mixed up with mtime by smbd.

o  David Mulder <dmulder@samba.org>
    * BUG 15548: samba-gpupdate --rsop fails if machine is not in a site.

o  Gabriel Nagy <gabriel.nagy@canonical.com>
    * BUG 15557: gpupdate: The root cert import when NDES is not 
available is
      broken.

o  Andreas Schneider <asn@samba.org>
    * BUG 15552: samba-gpupdate should print a useful message if 
cepces-submit
      can't be found.
    * BUG 15558: samba-gpupdate logging doesn't work.

o  Jones Syue <jonessyue@qnap.com>
    * BUG 15555: smbpasswd reset permissions only if not 0600.


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

         https://www.samba.org/samba/history/samba-4.19.5.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team


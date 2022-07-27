Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AE65823EA
	for <lists+samba-technical@lfdr.de>; Wed, 27 Jul 2022 12:11:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=fz8JosNNya8HKk4OSG/HpQkoq3TMJq6cj5+bCgBb+x4=; b=M3GX3719/eD8xaYECm409F6mqC
	1aNi31yqBoL2GCiFCIqBLcYZRcFlqKXrAj9yA81Rk7hibM9OAK62Hlvx13Hrr/vS1AjDA3+Wb106y
	AzNMIM8IieRkyVG4qErU3y2+rw4n4uasgsbPjAxsPr9H7Rvu5BoiMkKsCyC49P9oBDkOyeNLGAflG
	CnkBSR8ao7WuRqS9YR2DGBu/Br65JCoOi6ibwOFd2JeaiA8RuKmPRt9ErQoVaQoaY5E07+nGAJ1XU
	Ldi5rEKG2RgqMJsy4tijqyTV4lMRLcZLUEUr5pirgIDVKsU7AexwwjITHEAiPDpSVBk938n0Ezrd7
	OeuOkVTA==;
Received: from ip6-localhost ([::1]:25410 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oGe0A-002BHk-SK; Wed, 27 Jul 2022 10:10:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39504) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oGdzz-002BGo-LE; Wed, 27 Jul 2022 10:10:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=To:From:Date:Message-ID:CC;
 bh=fz8JosNNya8HKk4OSG/HpQkoq3TMJq6cj5+bCgBb+x4=; b=mUq1LyV+pF5yXFx7TxWUG1jQam
 Q3u5gdrOgTojW3K5Q25cfQmXrdLGBUMNp9nG4/PUURexFBGfq2iKpJWa31xda2v/JiXgY7ZmZVys0
 xRE1onYtKp4JXOcRa6VmWDnkQHTfZlL+NH3yxDA8zx6Q9I2R+6/2exhwKGoirIhGXQaRZbpTdHGtQ
 Xs3tq0G4U1QuWksnwlznMNr+UrhrRaUNbY3bFYoiOHIPD1xeMaPxoD4CBXC3jonPoJFAfQc8gUMrI
 BNFhC1o/JBzP/+IPFU6LoChPgI5T9nAO42yQ6pk6dLkpHv3uumX+aaowZXb8V5SJ60khmsjnKkblz
 6YmMfTYb/kywTOsRifFQ8oJHbvTkzgEwKmB05102re4E3lRjNO//a/UOvH5SQ5Dt8K+kj+5D5EnXn
 dSFivGfeMsBXSfkMtvyE/aQhES/fviXXjVjBveCz9OhFZEydEXYZ8zHf3tXtbedQjOq3/890cAQCA
 4Uv2hbVnVt+n5TmN1uZQ4zFb;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oGdzy-006l29-SC; Wed, 27 Jul 2022 10:10:38 +0000
Message-ID: <ff4a7ffa-7e22-a642-8143-df31df4a0be2@samba.org>
Date: Wed, 27 Jul 2022 12:10:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: de-DE
Subject: [Announce] Samba 4.16.4, 4.15.9, 4.14.14 Security Releases are
 available for Download
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
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

o CVE-2022-2031:  Samba AD users can bypass certain restrictions 
associated with
                   changing passwords.
https://www.samba.org/samba/security/CVE-2022-2031.html

o CVE-2022-32744: Samba AD users can forge password change requests for 
any user.
https://www.samba.org/samba/security/CVE-2022-32744.html

o CVE-2022-32745: Samba AD users can crash the server process with an 
LDAP add
                   or modify request.
https://www.samba.org/samba/security/CVE-2022-32745.html

o CVE-2022-32746: Samba AD users can induce a use-after-free in the server
                   process with an LDAP add or modify request.
https://www.samba.org/samba/security/CVE-2022-32746.html

o CVE-2022-32742: Server memory information leak via SMB1.
https://www.samba.org/samba/security/CVE-2022-32742.html

Changes
-------

o  Jeremy Allison <jra@samba.org>
    * BUG 15085: CVE-2022-32742.

o  Andrew Bartlett <abartlet@samba.org>
    * BUG 15009: CVE-2022-32746.

o  Andreas Schneider <asn@samba.org>
    * BUG 15047: CVE-2022-2031.

o  Joseph Sutton <josephsutton@catalyst.net.nz>
    * BUG 15008: CVE-2022-32745.
    * BUG 15009: CVE-2022-32746.
    * BUG 15047: CVE-2022-2031.
    * BUG 15074: CVE-2022-32744.

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

The uncompressed Samba tarballs and patch files have been signed
using GnuPG (ID AA99442FB680B620). The Samba source code can be downloaded
from:

https://download.samba.org/pub/samba/stable/

The release notes are available online at:

         https://www.samba.org/samba/history/samba-4.16.4.html
         https://www.samba.org/samba/history/samba-4.15.9.html
         https://www.samba.org/samba/history/samba-4.14.14.html

If you are building/using ldb from a system library, you'll
also need the related updated ldb tarball, otherwise you can ignore it.
The uncompressed ldb tarballs have been signed using GnuPG (ID 
4793916113084025).
The ldb source code can be downloaded from:

samba-4.16.4:
https://download.samba.org/pub/ldb/ldb-2.5.2.tar.gz
samba-4.15.9:
https://download.samba.org/pub/ldb/ldb-2.4.4.tar.gz
samba-4.14.14:
https://download.samba.org/pub/ldb/ldb-2.3.4.tar.gz

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team


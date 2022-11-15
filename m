Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 373AE629E36
	for <lists+samba-technical@lfdr.de>; Tue, 15 Nov 2022 16:56:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=JZM3RtmGb1fjEUBUlqZd+V+pJG7cxK0iDxxTqNXcAcM=; b=unxromW2DOkW+PI7cmkg2y3SG9
	wOHhCiQAk4s2uAnNsZFuOjDBamch866wsm3WPBryH5phSDDuHJ4R8z2YVbU/VzNs92773XRC45n3k
	wPgVNymGxZWbG3dDcqmxMfmqGsqtvvQH41ZdJoBETIuu/8OvtjrYJ6SB1TadpzYtX3K6/fgCJZQ6G
	A4fik4pqbJ3L+HAKWo2FbqgQEWXJpv1/8jrW0M6NjReTd4oVRcaQ0z/3jRfyiTFTMv8kStQ1wcQES
	izbuJ17R0R4Zu0xPBFFrmD0Liczy1HEIpJUoFHTyPw+McNta5obMoRs8GRtiS1AM0JIL/IZiJxkw+
	/O5Kqqbw==;
Received: from ip6-localhost ([::1]:29860 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ouyIS-00DrzG-MT; Tue, 15 Nov 2022 15:56:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49340) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ouyII-00DryK-HG; Tue, 15 Nov 2022 15:56:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=To:From:Date:Message-ID:CC;
 bh=JZM3RtmGb1fjEUBUlqZd+V+pJG7cxK0iDxxTqNXcAcM=; b=wcEmvsfCRAzVgBliAH2K12+trL
 9JGLPA/afbsV4a0sITd4/zemHzmuTL2lwjs0iGZuWH7A58M649QvsxfdjTOMmwMtkM/DScsAZ2Rm3
 WqKW074h5u2Fu55MJ8h8q0kO+PCfXG1lD/CsfysYx64PZwTfvN0WzXsvR+44wOHFIvmltRpeeqYWl
 /LHXzYbZMArnALv/Aj37GwsHmBb7dMgf+70Ej6zPwqgOPd89C7ldI+RHaBXHfySbgxv70qVUWgcPw
 G37tbbcwvnc5wrga1jDDXLvUs5Gi+tMdmbwwC3MVqNJm+EGqKuv4gXuOIJ3TJEb7RG+jIaEUXRcCg
 QJ/eCORdfF+tGlXeWjsxlJxOjiBnwbFVz7spD/Yi40y3JGvuXi8aHIc3gFyaM+gRJY9p0rwIMvjAp
 b+LkUjSttDwGAcTSuefEE9xL2dmRnfbqLM8aIyernl8jEAb9lonhQPUrMG715q5C9EAmLtbtPv51g
 b9LY4nH33kSo2woQz0l1oWdK;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ouyIH-008jSs-Os; Tue, 15 Nov 2022 15:56:13 +0000
Message-ID: <fc875799-6d36-4b57-a23e-2c05c205df35@samba.org>
Date: Tue, 15 Nov 2022 16:56:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: de-DE
Subject: [Announce] Samba 4.17.3, 4.16.7 and 4.15.12 Security Releases are
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

o CVE-2022-42898: Samba's Kerberos libraries and AD DC failed to guard 
against
                   integer overflows when parsing a PAC on a 32-bit 
system, which
                   allowed an attacker with a forged PAC to corrupt the 
heap.
https://www.samba.org/samba/security/CVE-2022-42898.html

Changes
-------

o  Joseph Sutton <josephsutton@catalyst.net.nz>
    * BUG 15203: CVE-2022-42898

o  Nicolas Williams <nico@twosigma.com>
    * BUG 15203: CVE-2022-42898

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

         https://www.samba.org/samba/history/samba-4.17.3.html
         https://www.samba.org/samba/history/samba-4.16.7.html
         https://www.samba.org/samba/history/samba-4.15.12.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team


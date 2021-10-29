Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4128643F745
	for <lists+samba-technical@lfdr.de>; Fri, 29 Oct 2021 08:35:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=NX6seD9N+tMfHx57nnkGJyA2V5smM6+sDJ+y+B3HKfw=; b=zivUpEE9lhvkORA9TzlHz7UvL5
	xbj04t/IMvHlHjcMUC8dMhokAEjl8qabQny/3uFvd1CDPnoaBEcQqCnjCRlrXypIENp43cgyRwZv7
	hlKjJxNERnFd4Am8NluxmiqgjsOgukSxpyoWddFfEpkHZCPWeIpvWTTzip/sHU/Un1GMu2cl4oWbI
	VGglcmDUKZWdDjRQV/cmiKqZO5y/Qh87imsN059Da3kOCW7lK8ni0J4SLtWpg+HYt+ZjfZIMVFYKQ
	i2PC871cMMFx7IkBBQTP5gq50lfi5b1bCMilJqCgX6CoXpu6k3DCGA7A8e7q0+GY4qPRqO/D+LlaJ
	fJWHPuxw==;
Received: from ip6-localhost ([::1]:49746 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mgLSo-001gnX-O9; Fri, 29 Oct 2021 06:34:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56904) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mgLSD-001gnE-AY; Fri, 29 Oct 2021 06:33:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:To:From:CC;
 bh=NX6seD9N+tMfHx57nnkGJyA2V5smM6+sDJ+y+B3HKfw=; b=J+ugvUG8YPzxyHGVPkyrY85H2v
 gdx2OHcmth8ocsPPlTlANTsx3Rk0RZhWdS7FB7Z0ySvKy+wFnOnDwgb+e73UrjjkNBIkiYeYvVjPQ
 jIXRedBhloyPDt0LREPRuA42dAYYZM2OcdLrSErBvvnKMmsDKtyVkD4PFE5S6oTxUY0hRJlHyYC5J
 z96/TU+CLHWu0DA7z6oSTgzXpmGiqXpsjE/lUwdIr/Yt4A9hg3ozyKwIWsAw6w8n+4xc7NuSsJ21T
 7vuTFqY4NkZ5FuGH1VIP4aMes5cFtBR6hdrZVZqZiqVVQgo/hkmpZlr7LmOy5XpSdXRVDLvA1nTQV
 duw8JZ8mNaYlkUYGv4LOuly/ZiLXknXZSGRNSqMVe60WSowXlbLNb+K5RIuX4CTSnYxSgxx7fYFUc
 m35V6Ql7TaF0QuUImnXXgzPHqiWvKscqoLilHaeUX3ZSSxMTVcAWji3q6+Ej/E1QHyM8WaM/ZeRET
 +6zvyEj6lQSzDG3iQZgm4cLk;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mgLSB-003yUe-SH; Fri, 29 Oct 2021 06:33:28 +0000
Subject: [Announce] Samba 4.13.13 Available for Download
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Message-ID: <f2cbd655-48b0-1ebc-94ee-defa9ea8306c@samba.org>
Date: Fri, 29 Oct 2021 08:33:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
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

This is the latest stable release of the Samba 4.13 release series.


Changes since 4.13.12
---------------------

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
    * BUG 14868: rodc_rwdc test flaps.
    * BUG 14881: Backport bronze bit fixes, tests, and selftest 
improvements.

o  Andrew Bartlett <abartlet@samba.org>
    * BUG 14642: Provide a fix for MS CVE-2020-17049 in Samba [SECURITY] 
'Bronze
      bit' S4U2Proxy Constrained Delegation bypass in Samba with
      embedded Heimdal.
    * BUG 14836: Python ldb.msg_diff() memory handling failure.
    * BUG 14845: "in" operator on ldb.Message is case sensitive.
    * BUG 14848: Release LDB 2.3.1 for Samba 4.14.9.
    * BUG 14871: Fix Samba support for UF_NO_AUTH_DATA_REQUIRED.
    * BUG 14874: Allow special chars like "@" in samAccountName when 
generating
      the salt.
    * BUG 14881: Backport bronze bit fixes, tests, and selftest 
improvements.

o  Isaac Boukris <iboukris@gmail.com>
    * BUG 14642: Provide a fix for MS CVE-2020-17049 in Samba [SECURITY] 
'Bronze
      bit' S4U2Proxy Constrained Delegation bypass in Samba with
      embedded Heimdal.
    * BUG 14881: Backport bronze bit fixes, tests, and selftest 
improvements.

o  Viktor Dukhovni <viktor@twosigma.com>
    * BUG 12998: Fix transit path validation.
    * BUG 14881: Backport bronze bit fixes, tests, and selftest 
improvements.

o  Luke Howard <lukeh@padl.com>
    * BUG 14642: Provide a fix for MS CVE-2020-17049 in Samba [SECURITY] 
'Bronze
      bit' S4U2Proxy Constrained Delegation bypass in Samba with
      embedded Heimdal.
    * BUG 14881: Backport bronze bit fixes, tests, and selftest 
improvements.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 14881: Backport bronze bit fixes, tests, and selftest 
improvements.

o  David Mulder <dmulder@suse.com>
    * BUG 14881: Backport bronze bit fixes, tests, and selftest 
improvements.

o  Andreas Schneider <asn@samba.org>
    * BUG 14870: Prepare to operate with MIT krb5 >= 1.20.
    * BUG 14881: Backport bronze bit fixes, tests, and selftest 
improvements.

o  Joseph Sutton <josephsutton@catalyst.net.nz>
    * BUG 14642: Provide a fix for MS CVE-2020-17049 in Samba [SECURITY] 
'Bronze
      bit' S4U2Proxy Constrained Delegation bypass in Samba with
      embedded Heimdal.
    * BUG 14645: rpcclient NetFileEnum and net rpc file both cause lock 
order
      violation: brlock.tdb, share_entries.tdb.
    * BUG 14836: Python ldb.msg_diff() memory handling failure.
    * BUG 14845: "in" operator on ldb.Message is case sensitive.
    * BUG 14848: Release LDB 2.3.1 for Samba 4.14.9.
    * BUG 14868: rodc_rwdc test flaps.
    * BUG 14871: Fix Samba support for UF_NO_AUTH_DATA_REQUIRED.
    * BUG 14874: Allow special chars like "@" in samAccountName when 
generating
      the salt.
    * BUG 14881: Backport bronze bit fixes, tests, and selftest 
improvements.

o  Nicolas Williams <nico@twosigma.com>
    * BUG 14642: Provide a fix for MS CVE-2020-17049 in Samba [SECURITY] 
'Bronze
      bit' S4U2Proxy Constrained Delegation bypass in Samba with
      embedded Heimdal.
    * BUG 14881: Backport bronze bit fixes, tests, and selftest 
improvements.


#######################################
Reporting bugs & Development Discussion
#######################################

Please discuss this release on the samba-technical mailing list or by
joining the #samba-technical IRC channel on irc.freenode.net.

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

         https://www.samba.org/samba/history/samba-4.13.13.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team


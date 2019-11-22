Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1C9105E21
	for <lists+samba-technical@lfdr.de>; Fri, 22 Nov 2019 02:25:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=UU/sSdx7q6DcFfoR8pY7FOJ8qwhcZ9gLVXvbkTUksf8=; b=0+qQCyjOrXdNUu3Z5Gff4GhYUk
	Bb9UCLXiJBkB932W5x8THyICeNlnDgws9kvJh2ihc7eebGtNLZ8C9aEdj0hyETOPlCuw50CyKlxhn
	jSBJXVJgJ2cRweZECEaLOMaP4HNF9+ylce3AhEmDPHGucTjsS1j7sfw7d3u6f6qXdGsr9/x2OJoI+
	ymlRR1qbDnC33AOWWb0xSMYAFiWRM8MwOxbwV+INvcAVybISAxp31WA4slSZP2LO+potSBW0j8FS9
	8HYEqgNu2raef9sRGbj1QH9WSjnyb2m5a5uuCymlrLkZhjhybdMH3NL7goctRxysgB+szwMwHMFRh
	XpohFddg==;
Received: from localhost ([::1]:46694 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iXxga-001zOb-OH; Fri, 22 Nov 2019 01:24:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60414) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iXxgV-001zOU-Q4
 for samba-technical@lists.samba.org; Fri, 22 Nov 2019 01:24:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=UU/sSdx7q6DcFfoR8pY7FOJ8qwhcZ9gLVXvbkTUksf8=; b=RFF0agk/9a6iujWaIWmOwHqbgM
 pHn8slUmIYsrrUU1NihWNAJAW2oXwdnEzNn7ZvFNngydmnNL62Bamn19iZOTtxHi1z+NsApBDkHr2
 t6PWo5/htxnH2JsjFBjqmf9RcuL0V/6KsIJ+9kvPgzuj6QtFWjT27hq/lwH8QokrAvjFQJTOZl/4j
 WHOl1f5wy8TWU+g+bylCovlcUShMPgYiIWaKKsNlXroJUALqTVtXBXvB399XO9UGyhlsUOLe/BDrZ
 QMK9bf+VxO65XZcRhNTIQYyMOnJhzLY0XM7b+0xH9YHXZ4l0dh8skjIBvwoCgZEE6o5gGorRZjtW+
 3ygwCJ7CtM64brtltpHlyIiTzN8uCreGMZyqMIILZL+Vfn8xNT/Ft0XxDi9CG3rJTlA+zCFPxGqCS
 FrbbqIeBFtyjMLB8I7va4MnzOVdfE4/wd1C02xqEEsJcnXA0ZgYoMUfCLify1SmPmDemR8Ms809iF
 mtniStb7DdOt0CgsyL7Z6/Tl;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iXxgU-00083x-Ql
 for samba-technical@lists.samba.org; Fri, 22 Nov 2019 01:24:31 +0000
Message-ID: <712d8619cb2ce1dac1879ec7e7a9260bb88431ef.camel@samba.org>
Subject: Today's fun fact:  Oldest build of Samba on modern Ubuntu 18.04:
 autoconf removal!
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Fri, 22 Nov 2019 14:24:27 +1300
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Today's fun fact is that the oldest Samba version I could build (to
test an AD DC thing) with --enable-selftest on Ubuntu 18.04 was
d47c1245788505cfaca9a25c855a2503c83e4315 (I didn't finish the bisect,
but this is close enough). 

In an interesting coincidence, this is essentially the point where the
old autoconf build system was removed
(cd4b413cb0574c459c1c24cf07f8d6b44f5fc077).  That probably means that
if using autoconf you can go back earlier without breaking out the VMs
or docker containers. 

The command line (quite likely not minimal) I used was:

ADDITIONAL_CFLAGS="-Wno-error -Wno-error=format-truncation -Wno-
error=implicit-function-declaration" ./configure --enable-selftest '
--with-shared-modules=!vfs_ceph' --disable-gnutls

I removed libcephfs-dev to make it build (ceph has changed API since
then). 

Andrew Bartlett

-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT   
https://catalyst.net.nz/services/samba







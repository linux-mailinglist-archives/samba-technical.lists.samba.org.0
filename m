Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D61C58BC31C
	for <lists+samba-technical@lfdr.de>; Sun,  5 May 2024 20:50:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=5vKo9Y+4GQYhg2t0Irjec0CT1AYXooeUx65DiuCoJ0k=; b=ClODuoDdOUif9nnbcl6kWH9OLl
	Y95WDKOygJuNInnJiyFtMtQYRBOfKnpbVNZKmLZQucAJ3RI+ZxR56otCTFonuGBy/fdq7qriUS3gn
	AUizcPw6rGcvd2lW7BAEWH5x1VpIpqaAXlkhhw+mZgPqP5fBy4+SIFx2Y57eEABn76yWrNOOUKZuC
	juPdCTKhXfHArTV4kgbaYVtMAzl1v9H5Ei0kDbxsWmVxtfLx3migUVjxBqqf2YGBgJwGaTy1kLFA5
	lZya9pdeV0fAdlKxDlftlz5Wx3PfrDjuY62ecV/2StfWWyKlB0NMWlG2QHzLXxJToEARjckOtYulW
	h4cM1Tlg==;
Received: from ip6-localhost ([::1]:21324 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s3gv8-008Jc5-SC; Sun, 05 May 2024 18:49:10 +0000
Received: from w1.tutanota.de ([81.3.6.162]:59300) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s3gv2-008Jbw-Dd
 for samba-technical@lists.samba.org; Sun, 05 May 2024 18:49:08 +0000
Received: from tutadb.w10.tutanota.de (unknown [192.168.1.10])
 by w1.tutanota.de (Postfix) with ESMTP id 7C2C1FBFBD4
 for <samba-technical@lists.samba.org>; Sun,  5 May 2024 18:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1714934938; 
 s=s1; d=tutanota.com;
 h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Cc:Date:Date:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:Sender;
 bh=BNXgJmjxCfe+eiItAMxNP5YzswjzwsBUe2zYgIX5PZg=;
 b=BqAvvkM5Eynkxjdh0/UZPHSN2fYleTUJ32wynySYXgsoNm8G+1Wy2caOOo5WPf2i
 4yjxCtH6Q9LPrUA+a9O2N3TeA7vgvcdjsvB0Z7Q+XoCx7WdjDB2cjryF2gyQQI5QmmF
 d3yybLhifxdnJPWkdygiW0DNImDyfrInSwnWYqFcNaSzIo9eM9fWZFXr3gO9HnUSsk9
 4UIfHyqMP+XW3NfnReh5Pwcmtw21aa0cQd6OsofPPUYv3xwZx3hsWSzvB/oocTiVLWI
 OnEFHBCQZ2jM2Gd2uMzFOTaK+VwSkB83jDzpkDLxtxihlF7YCwuLijRHgD60G9OP1Nq
 pKdCwuoiDw==
Date: Sun, 5 May 2024 20:48:58 +0200 (CEST)
To: Samba Technical <samba-technical@lists.samba.org>
Message-ID: <Nx94bbZ--3-9@tutanota.com>
Subject: tdb 1.4.10 undefined symbol in version script
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: kocelfc--- via samba-technical <samba-technical@lists.samba.org>
Reply-To: kocelfc@tutanota.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

tdb 1.4.10 fails to build with clang/lld 17 or newer because it errors out on undefined symbols in version scripts by default due to it using LDFLAGS="-Wl,--no-undefined-version". The same issue can be reproduced by applying the same linker flag when building with GCC and the ld linker.

```
[ 52/118] Compiling test/run-rdlock-upgrade.c 
21:08:41 runner ['clang', '-O3', '-pipe', '-Werror=strict-aliasing', '-MMD', '-D_GNU_SOURCE=1', '-D_XOPEN_SOURCE_EXTENDED=1', '-fPIC', '-D__STDC_WANT_LIB_EXT1__=1', '-D_REENTRANT', '-fstack-protector-strong', '-fstack-clash-protection', 
'-DSTATIC_tdb1_run_rdlock_upgrade_MODULES=NULL', '-DSTATIC_tdb1_run_rdlock_upgrade_MODULES_PROTO=extern void __tdb1_run_rdlock_upgrade_dummy_module_proto(void)', '-I.', '-I../..', '-Iinclude', '-I../../include', '-I.', '-I../..', '-Ilib/
replace', '-I../../lib/replace', '../../test/run-rdlock-upgrade.c', '-c', '-o/mnt/portage/portage/sys-libs/tdb-1.4.10/work/tdb-1.4.10-abi_x86_64.amd64/bin/default/test/run-rdlock-upgrade.c.60.o'] 
ld.lld: error: version script assignment of 'TDB_1.2.1' to symbol 'tdb_do_delete' failed: symbol not defined 
ld.lld: error: version script assignment of 'local' to symbol '_end' failed: symbol not defined 
ld.lld: error: version script assignment of 'local' to symbol '__bss_start' failed: symbol not defined 
ld.lld: error: version script assignment of 'local' to symbol '_edata' failed: symbol not defined 
clang: error: linker command failed with exit code 1 (use -v to see invocation)```

Downstream Gentoo bug: https://bugs.gentoo.org/914857

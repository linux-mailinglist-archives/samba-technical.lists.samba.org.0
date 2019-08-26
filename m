Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FF19CE7A
	for <lists+samba-technical@lfdr.de>; Mon, 26 Aug 2019 13:48:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=VLd+cmu51Q/tmBSudC5H3gqGvPzJJtqCUbEpF07rhgc=; b=uhuo6KUy5aZhXZGLyVkNbAdX2l
	mUkKBWOgYCYpjDBr1YYOr8k23diib2XBv9NGxJyFBQR5BDB4wUVvI0m7XM3ZhIHNfCY97fUI1H3ea
	8XPdKsJIbQ78spq5/npWgSFCiYgKQsBxoC+O1qxQvFBYAuhHQNLzEgJNSPgFmrMSVrrtNDZqObIS9
	+a8uvK1aPAgK+qnSZYDWvES/kryUFIwGl+ZYIlEZSYtJ+O3nuuMQvAbiES7du6z/tBIGXR9T87fcN
	n7Cwt+J9SOI00ROyraOBnV8pbLTGXnOF4ooApclNtiWzy+mxmt9/35HjaZTorWaYSZlpczVQ07V1A
	wjr3y9vQ==;
Received: from localhost ([::1]:51114 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i2DTc-008Rct-4W; Mon, 26 Aug 2019 11:48:00 +0000
Received: from mx1.redhat.com ([209.132.183.28]:45386) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1i2DTR-008Rcm-SV
 for samba-technical@lists.samba.org; Mon, 26 Aug 2019 11:47:58 +0000
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1A27C3082126;
 Mon, 26 Aug 2019 11:29:14 +0000 (UTC)
Received: from 10.4.128.1 (unknown [10.40.3.133])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E44519C70;
 Mon, 26 Aug 2019 11:29:13 +0000 (UTC)
Date: Mon, 26 Aug 2019 13:29:11 +0200
To: samba-technical@lists.samba.org,
 Aaron Haslett <aaronhaslett@catalyst.net.nz>
Subject: ldb test test_guid_indexed_v1_db fails on ppc64le
Message-ID: <20190826112911.GA2711905@10.4.128.1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Mon, 26 Aug 2019 11:29:14 +0000 (UTC)
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
From: Lukas Slebodnik via samba-technical <samba-technical@lists.samba.org>
Reply-To: Lukas Slebodnik <lslebodn@fedoraproject.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

ehlo,

The repack unit test failed just only on ppc64le with ldb-2.0.5
Other architectures are ok
https://koji.fedoraproject.org/koji/taskinfo?taskID=37286196
https://kojipkgs.fedoraproject.org//work/tasks/6219/37286219/build.log

BTW it would be good to suppress error messages
"MDB_INVALID: File is not an LMDB file".
I could see them also on x86_64


<mock-chroot> sh-5.0# python3 tests/python/repack.py
Could not open environment for /tmp/tmp_59tdgow/guidindexpackv1.ldb: (-30793)  MDB_INVALID: File is not an LMDB file
Repacking database with format 0x26011968
Could not open environment for /tmp/tmp_59tdgow/guidindexpackv1.ldb: (-30793)  MDB_INVALID: File is not an LMDB file
Repacking database with format 0x26011967
Could not open environment for /tmp/tmp_59tdgow/guidindexpackv1.ldb: (-30793)  MDB_INVALID: File is not an LMDB file
Could not open environment for /tmp/tmp_59tdgow/guidindexpackv1.ldb: (-30793)  MDB_INVALID: File is not an LMDB file
Could not open environment for /tmp/tmp_59tdgow/guidindexpackv1.ldb: (-30793)  MDB_INVALID: File is not an LMDB file
Could not open environment for /tmp/tmp_59tdgow/guidindexpackv1.ldb: (-30793)  MDB_INVALID: File is not an LMDB file
Repacking database with format 0x26011968
ltdb: tdb(/tmp/tmp_59tdgow/guidindexpackv1.ldb): tdb_transaction_setup_recovery: transaction data over new region boundary

ltdb: tdb(/tmp/tmp_59tdgow/guidindexpackv1.ldb): tdb_transaction_prepare_commit: failed to setup recovery data

Failure during prepare_write): Corrupt database -> Operations error
ltdb: tdb(/tmp/tmp_59tdgow/guidindexpackv1.ldb): tdb_transaction_cancel: no transaction

ECould not open environment for /tmp/tmpnk8uh_ap/guidpackformattest.ldb: (-30793)  MDB_INVALID: File is not an LMDB file
Could not open environment for /tmp/tmpnk8uh_ap/guidpackformattest.ldb: (-30793)  MDB_INVALID: File is not an LMDB file
Could not open environment for /tmp/tmpnk8uh_ap/guidpackformattest.ldb: (-30793)  MDB_INVALID: File is not an LMDB file
Could not open environment for /tmp/tmpnk8uh_ap/guidpackformattest.ldb: (-30793)  MDB_INVALID: File is not an LMDB file
Repacking database with format 0x26011967
Could not open environment for /tmp/tmpnk8uh_ap/guidpackformattest.ldb: (-30793)  MDB_INVALID: File is not an LMDB file
Could not open environment for /tmp/tmpnk8uh_ap/guidpackformattest.ldb: (-30793)  MDB_INVALID: File is not an LMDB file
Could not open environment for /tmp/tmpnk8uh_ap/guidpackformattest.ldb: (-30793)  MDB_INVALID: File is not an LMDB file
Could not open environment for /tmp/tmpnk8uh_ap/guidpackformattest.ldb: (-30793)  MDB_INVALID: File is not an LMDB file
Repacking database with format 0x26011968
Could not open environment for /tmp/tmpnk8uh_ap/guidpackformattest.ldb: (-30793)  MDB_INVALID: File is not an LMDB file
Could not open environment for /tmp/tmpnk8uh_ap/guidpackformattest.ldb: (-30793)  MDB_INVALID: File is not an LMDB file
Repacking database with format 0x26011967
Could not open environment for /tmp/tmpnk8uh_ap/guidpackformattest.ldb: (-30793)  MDB_INVALID: File is not an LMDB file
Could not open environment for /tmp/tmpnk8uh_ap/guidpackformattest.ldb: (-30793)  MDB_INVALID: File is not an LMDB file
Repacking database with format 0x26011968
Could not open environment for /tmp/tmpnk8uh_ap/guidpackformattest.ldb: (-30793)  MDB_INVALID: File is not an LMDB file
Could not open environment for /tmp/tmpnk8uh_ap/guidpackformattest.ldb: (-30793)  MDB_INVALID: File is not an LMDB file
Could not open environment for /tmp/tmpnk8uh_ap/guidpackformattest.ldb: (-30793)  MDB_INVALID: File is not an LMDB file
Could not open environment for /tmp/tmpnk8uh_ap/guidpackformattest.ldb: (-30793)  MDB_INVALID: File is not an LMDB file
Repacking database with format 0x26011967
Could not open environment for /tmp/tmpnk8uh_ap/guidpackformattest.ldb: (-30793)  MDB_INVALID: File is not an LMDB file
Could not open environment for /tmp/tmpnk8uh_ap/guidpackformattest.ldb: (-30793)  MDB_INVALID: File is not an LMDB file
.
======================================================================
ERROR: test_guid_indexed_v1_db (__main__.GUIDIndexAndPackFormatTests)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "tests/python/repack.py", line 197, in test_guid_indexed_v1_db
    self.toggle_guidindex_check_pack()
  File "tests/python/repack.py", line 123, in toggle_guidindex_check_pack
    self.set_guid_indexing(enable=enable)
  File "tests/python/repack.py", line 76, in set_guid_indexing
    self.l.modify(modmsg)
_ldb.LdbError: (1, 'Failure during prepare_write): Corrupt database -> Operations error')

----------------------------------------------------------------------
Ran 2 tests in 1.814s

FAILED (errors=1)

LS


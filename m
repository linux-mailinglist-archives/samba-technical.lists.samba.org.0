Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A929E2FC
	for <lists+samba-technical@lfdr.de>; Tue, 27 Aug 2019 10:46:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=tVzpDKp/J4HhDminS4emsZGvz8r3IHir+cgkDRcI9L4=; b=bzWe64Mk082/22kBPXi1XKkhXE
	QuEUPF11GuSMB7k2NMJyxhQUfmOaYeTk5JHNHcOS7c9NR1x2PIoNV0L83A0w1KHxhuVwG94ekYMOt
	HJwGc6Lh9A8bb2elRM7Qknc+ysnha1cPn4ZrKiPR+WSuaNn6lOkoO+j0yeZNeVbBs7S3plmHP0apX
	s2bwX1rB3RpDvLrS11ueK8nz98NgCZqqg8Ml0/Hfk1VRQ/FhOmz0WX1Oux0otiEH/Gj9ziibx37TT
	9PmgSRt7hIAdfwxz16Gf/8xAkB1JWT8wvgZ+EPq+NqaV7CFIcyE6VTzlDsJYHp7O+C47lro14jOqb
	Imsh/fhA==;
Received: from localhost ([::1]:25458 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i2X6y-008eMj-Fo; Tue, 27 Aug 2019 08:45:56 +0000
Received: from mx1.redhat.com ([209.132.183.28]:46722) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1i2X6t-008eMc-LC
 for samba-technical@lists.samba.org; Tue, 27 Aug 2019 08:45:54 +0000
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 948AB5AFF8;
 Tue, 27 Aug 2019 08:45:47 +0000 (UTC)
Received: from 10.4.128.1 (unknown [10.40.3.133])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD5C560127;
 Tue, 27 Aug 2019 08:45:46 +0000 (UTC)
Date: Tue, 27 Aug 2019 10:45:44 +0200
To: Andrew Bartlett <abartlet@samba.org>,
 Aaron Haslett <aaronhaslett@catalyst.net.nz>
Subject: Re: ldb test test_guid_indexed_v1_db fails on ppc64le
Message-ID: <20190827084544.GA2735662@10.4.128.1>
References: <20190826112911.GA2711905@10.4.128.1>
 <eaf9a97bd517e0b12b871fd5175759e86aa24c53.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <eaf9a97bd517e0b12b871fd5175759e86aa24c53.camel@samba.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Tue, 27 Aug 2019 08:45:47 +0000 (UTC)
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On (27/08/19 06:27), Andrew Bartlett via samba-technical wrote:
>On Mon, 2019-08-26 at 13:29 +0200, Lukas Slebodnik via samba-technical
>wrote:
>> ehlo,
>> 
>> The repack unit test failed just only on ppc64le with ldb-2.0.5
>> Other architectures are ok
>> https://koji.fedoraproject.org/koji/taskinfo?taskID=37286196
>> 
>https://kojipkgs.fedoraproject.org//work/tasks/6219/37286219/build.log
>> 
>> BTW it would be good to suppress error messages
>> "MDB_INVALID: File is not an LMDB file".
>> I could see them also on x86_64
>> 
>
>Sadly LMDB is not portable across endian or word length boundaries. 
>
>The only way to fix this is to store a LE version of the LDB file and
>detect which to use.  We don't hit the word length issue because we
>lock this to 64 bit only so far.
>
>Do you think you could have a go at that?
>

Small update.
The issue is not related to lmbd. It fails even with pure tdb
(--without-ldb-lmdb)

sh-5.0# python3 tests/python/repack.py
Repacking database with format 0x26011968
Repacking database with format 0x26011967
Repacking database with format 0x26011968
ltdb: tdb(/tmp/tmpq1oowki8/guidindexpackv1.ldb): tdb_transaction_setup_recovery: transaction data over new region boundary

ltdb: tdb(/tmp/tmpq1oowki8/guidindexpackv1.ldb): tdb_transaction_prepare_commit: failed to setup recovery data

Failure during prepare_write): Corrupt database -> Operations error
ltdb: tdb(/tmp/tmpq1oowki8/guidindexpackv1.ldb): tdb_transaction_cancel: no transaction

ERepacking database with format 0x26011967
Repacking database with format 0x26011968
Repacking database with format 0x26011967
Repacking database with format 0x26011968
Repacking database with format 0x26011967
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
Ran 2 tests in 2.059s

FAILED (errors=1)

LS


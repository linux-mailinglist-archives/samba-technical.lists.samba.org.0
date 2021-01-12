Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0697C2F3244
	for <lists+samba-technical@lfdr.de>; Tue, 12 Jan 2021 14:55:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=BvFgFSjnHWlyCMmfjd0i1ip8+yxQIl2Fe2DMNryGfu0=; b=0OIlWkR55VONDRCggFHFfmJpNx
	9IKCF294BSVMSkAaA3UyUjJRha5P1JE/Zms/dCdaruahxjx4kPggVFeHbQdXXOY14CDoqk2I1b4Za
	uMa450BWwEZgnoW1VjY7Xv4z3SJnjb3Mz3o+jYWbBK6xnZ2nUScP4zdLSPAxIJvLt/t90Xvpauvmp
	qMzk6gJUg5oHdpNpiexYviSVIMZM2kT1JN+cosmNRcqThL1kEY72/djAyaw9T2KsplykeGTZpMzQA
	MHMUpJ+EHS9q8my90DHdcG6MOwfhS0tXo1DBfNRBLig1/8NB/ccqxpWnGoNHzBAL3uyLlnAi8PkTs
	HZliULcg==;
Received: from ip6-localhost ([::1]:22354 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kzK8j-005PlV-Pl; Tue, 12 Jan 2021 13:55:17 +0000
Received: from [50.194.72.151] (port=50106 helo=mail1.thewrittenword.com) 
 by hr1.samba.org with esmtp (Exim) id 1kzK8X-005PlL-84
 for samba-technical@lists.samba.org; Tue, 12 Jan 2021 13:55:08 +0000
Received: from mail2.il.thewrittenword.com
 (emma-internal-gw.il.thewrittenword.com [192.168.13.25])
 by mail1.thewrittenword.com (Postfix) with ESMTP id 172D55CBA
 for <samba-technical@lists.samba.org>; Tue, 12 Jan 2021 14:48:29 +0000 (UTC)
Received: from pom.il.thewrittenword.com (danger.il.thewrittenword.com
 [10.191.57.254])
 by mail2.il.thewrittenword.com (Postfix) with ESMTP id 9755614606
 for <samba-technical@lists.samba.org>; Tue, 12 Jan 2021 13:39:06 +0000 (UTC)
Received: by pom.il.thewrittenword.com (Postfix, from userid 1000)
 id 3F25B1080717; Tue, 12 Jan 2021 07:39:02 -0600 (CST)
Date: Tue, 12 Jan 2021 07:39:02 -0600
To: samba-technical <samba-technical@lists.samba.org>
Subject: SEGV in smbstatus on 4.9.18, 4.10.18, 4.11.17 on Solaris 10/SPARC,
 11/SPARC
Message-ID: <20210112133901.3kjutg6z5awvduyw@thewrittenword.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20171215
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
From: Albert Chin via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: Albert Chin <samba-technical@mlists.thewrittenword.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

We're running 4.9.18, 4.10.18, and 4.11.17 on Solaris 10/SPARC and
11/SPARC and are seeing a SEGV when running smbstatus. In
lib/tdb/common/open.c, we have:
  _PUBLIC_ int tdb_close(struct tdb_context *tdb)
  {
          ...
          tdb_mutex_munmap(tdb);

          SAFE_FREE(tdb->name);
          ...
  }

And in lib/tdb/common/mutex.c, we have:
  int tdb_mutex_munmap(struct tdb_context *tdb)
  {
          ...
          ret = munmap(tdb->mutexes, len);
          if (ret == -1) {
                  return -1;
          }
          ...
  }

Should tdb->mutexes be non-NULL? I looked at the value on both Solaris
and RHEL 6 and tdb->mutexes is NULL at this point.

Before munmap(), we have:
  (dbx) print *tdb
*tdb = { name = 0x355d8 "/var/opt/TWWfsw/samba4918/lock/locking.tdb",
  map_ptr = (nil), fd = 11, map_size = 90112U, read_only = 1,
  traverse_read = 0, traverse_write = 0, allrecord_lock = { off = 0,
  count = 0, ltype = 0 }, num_lockrecs = 0, lockrecs = (nil),
  lockrecs_array_length = 0, hdr_ofs = 245760U, mutexes = (nil),
  ecode = TDB_SUCCESS, hash_size = 10007U, feature_flags = 1U,
  flags = 2596U, travlocks = { next = (nil), off = 0, list = 0,
  lock_rw = 0 }, next = 0x47d00, device = 74776595U, inode = 5617ULL,
  log = { log_fn = 0xfd120cc0 = &`libtdb-wrap-samba4.so`tdb_wrap.c`tdb_wrap_log(TDB_CONTEXT *tdb, enum tdb_debug_level level, const char *format, void *..., ...),
  log_private = (nil) }, hash_fn = 0xfee575b8 = &tdb_jenkins_hash(),
  open_flags = 0, methods = 0xfee70fcc, transaction = (nil),
  page_size = 8192, max_dead_records = 0, interrupt_sig_ptr = (nil) }

On RHEL, I see the following:
  (gdb) print *tdb
$2 = {name = 0x55555577d600 "/var/opt/TWWfsw/samba4918/lock/locking.tdb", 
  map_ptr = 0x0, fd = 14, map_size = 86016, read_only = 1, traverse_read = 0, 
  traverse_write = 0, allrecord_lock = {off = 0, count = 0, ltype = 0}, 
  num_lockrecs = 0, lockrecs = 0x0, lockrecs_array_length = 0, 
  hdr_ofs = 401408, mutexes = 0x0, ecode = TDB_SUCCESS, hash_size = 10007, 
  feature_flags = 1, flags = 2564, travlocks = {next = 0x0, off = 0, list = 0, 
    lock_rw = 0}, next = 0x55555577d6c0, device = 64768, inode = 3153808, 
  log = {log_fn = 0x7ffff236adbc <tdb_wrap_log>, log_private = 0x0}, 
  hash_fn = 0x7ffff21603da <tdb_jenkins_hash>, open_flags = 0, 
  methods = 0x7ffff2368ae0, transaction = 0x0, page_size = 4096, 
  max_dead_records = 0, interrupt_sig_ptr = 0x0}

After munmap(), we have:
  (dbx) print *tdb
*tdb = { name = 0x355d8 "<bad address 0x000355d8>",
  map_ptr = (nil), fd = 11, map_size = 90112U, read_only = 1,
  traverse_read = 0, traverse_write = 0, allrecord_lock = { off = 0,
  count = 0, ltype = 0 }, num_lockrecs = 0, lockrecs = (nil),
  lockrecs_array_length = 0, hdr_ofs = 245760U, mutexes = (nil),
  ecode = TDB_SUCCESS, hash_size = 10007U, feature_flags = 1U,
  flags = 2596U, travlocks = { next = (nil), off = 0, list = 0,
  lock_rw = 0 }, next = 0x47d00, device = 74776595U, inode = 5617ULL,
  log = { log_fn = 0xfd120cc0 = &`libtdb-wrap-samba4.so`tdb_wrap.c`tdb_wrap_log(TDB_CONTEXT *tdb, enum tdb_debug_level level, const char *format, void *..., ...),
  log_private = (nil) }, hash_fn = 0xfee575b8 = &tdb_jenkins_hash(),
  open_flags = 0, methods = 0xfee70fcc, transaction = (nil),
  page_size = 8192, max_dead_records = 0, interrupt_sig_ptr = (nil) }

  (gdb) print *tdb
$3 = {name = 0x55555577d600 "/var/opt/TWWfsw/samba4918/lock/locking.tdb", 
  map_ptr = 0x0, fd = 14, map_size = 86016, read_only = 1, traverse_read = 0, 
  traverse_write = 0, allrecord_lock = {off = 0, count = 0, ltype = 0}, 
  num_lockrecs = 0, lockrecs = 0x0, lockrecs_array_length = 0, 
  hdr_ofs = 401408, mutexes = 0x0, ecode = TDB_SUCCESS, hash_size = 10007, 
  feature_flags = 1, flags = 2564, travlocks = {next = 0x0, off = 0, list = 0, 
    lock_rw = 0}, next = 0x55555577d6c0, device = 64768, inode = 3153808, 
  log = {log_fn = 0x7ffff236adbc <tdb_wrap_log>, log_private = 0x0}, 
  hash_fn = 0x7ffff21603da <tdb_jenkins_hash>, open_flags = 0, 
  methods = 0x7ffff2368ae0, transaction = 0x0, page_size = 4096, 
  max_dead_records = 0, interrupt_sig_ptr = 0x0}

On Solaris, the differences are:
-*tdb = { name = 0x355d8 "/var/opt/TWWfsw/samba4918/lock/locking.tdb",
+*tdb = { name = 0x355d8 "<bad address 0x000355d8>",

Anyone else running 4.9+ on Solaris? If so, does smbstatus work?

-- 
albert chin (china@thewrittenword.com)


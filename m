Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D971EC4C8
	for <lists+samba-technical@lfdr.de>; Wed,  3 Jun 2020 00:09:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=c2ZbBUdPV+w4koW52Hg2S4953wBkx7P7xq6+9WmXPfw=; b=krwuteI9VrLIQNe7F8AAt5LhQR
	do3awk1CfHKP1xsBrs5IYG7BJQKLZs0dZV5AzjyyJa4GroEjx/gOjMue9OIMaGZhlE1w5pWd1Qv/e
	yvn33XcGsOPyeL2FrhVSR+KHagOOkXwbP6RQu4aeaHv1l+sXIh5SWAKXsNN+iVe2ucb8ikTD8RiHh
	DxRjsYiRJjyF17P1kABSXdRugTCTXeURBbQbsL+NBHhDkwbTdVS+bnQQ/Rkfd4E5K6tQLtw+lw+vn
	Dafi2uDHatc13B6EXbK/sm+WvSvoLRDzQRXg4SwwbyZUXnlZYJfc4TOnU1qX2ETUhlJanvBPdXREx
	7aDtXYVA==;
Received: from localhost ([::1]:38482 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jgF4i-008XOy-GZ; Tue, 02 Jun 2020 22:08:00 +0000
Received: from youngberry.canonical.com ([91.189.89.112]:43434) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jgF4d-008XOA-8C
 for samba-technical@lists.samba.org; Tue, 02 Jun 2020 22:07:57 +0000
Received: from mail-ot1-f70.google.com ([209.85.210.70])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <andreas.hasenack@canonical.com>) id 1jgF4Z-0006D5-3W
 for samba-technical@lists.samba.org; Tue, 02 Jun 2020 22:07:51 +0000
Received: by mail-ot1-f70.google.com with SMTP id b15so146409oti.23
 for <samba-technical@lists.samba.org>; Tue, 02 Jun 2020 15:07:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=c2ZbBUdPV+w4koW52Hg2S4953wBkx7P7xq6+9WmXPfw=;
 b=Y+Rnbgp/lYG8siGHpZTdu+yElfBzx34kZGjNA36bIzMpVbFrlfZMKJe0ZPFPGpNpj1
 MOnuY95H3bvCw2XMjegmN+1cgY+dXpgR1RCWy9bItQH6WijRZbLrLQoGIGtuw540K9kd
 sONUtJIU4tTzfC5otaqIhE3khcUENQJAlc+aCP+OHaSHfPsLuzmi63CbJMjtcXdXXbG2
 TJ3/+bnZT4Yhg0yoFZoNcKBD0X/2iQ2D0nnv2lg+HdEITxBeqVuuzneehEZqlKx1gB4b
 PhujcnbgDLAKNq+Qlqf91bwvl0SY1EpG0lAIN+0zdeP/rTr6vZqjcHdnwCIZuHMRZNmV
 s4Bg==
X-Gm-Message-State: AOAM532PoPXZ3WcR//freioAsTGwofIQRBltd/8JwOErMX58IIp3Pidt
 uRQRnToCDAI7L773+m7CXo8OXCQ7DUK8moDS4tghYeXzf3x6fi1RinPDQmHGts0SAZ1MXUvwadh
 taNICuSlJpteoePWr9zqbdsRgO2icDeWBDPUkNO5sOM32AWaUD2DcInjTnqpirA==
X-Received: by 2002:a4a:a20b:: with SMTP id m11mr4835251ool.20.1591135669689; 
 Tue, 02 Jun 2020 15:07:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8heH+56tEVx2uZ+/c0b6j7AediFE8eNEBvXJoWhrClVqSoFc5bm2yzda5oc2+uhPVaHIEAuDRTZG1GQLzx60=
X-Received: by 2002:a4a:a20b:: with SMTP id m11mr4835228ool.20.1591135669154; 
 Tue, 02 Jun 2020 15:07:49 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 2 Jun 2020 19:07:38 -0300
Message-ID: <CANYNYEHAJmBDFuoZJFdWn_DBwihN_WzJp27Mr+WWmvTcquauTQ@mail.gmail.com>
Subject: ldb 2.1.3 ppc64el test failures; 2.1.2 passes
To: samba-technical@lists.samba.org
Content-Type: text/plain; charset="UTF-8"
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
From: Andreas Hasenack via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Hasenack <andreas@canonical.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

I'm trying to update ldb from 2.1.2 to 2.1.3 but am seeing these test
failures that only happen on ppc64el:

[==========] Running 3 test(s).
[ RUN      ] test_free_list_no_read_lock
Failed to connect to 'mdb://lmdb_free_list_test.ldb' with backend
'mdb': Unable to load ltdb cache records for backend 'ldb_mdb backend'
Could not run test: 0x1 != 0
[   LINE   ] --- ../../tests/ldb_lmdb_free_list_test.c:165: error:
Failure!Test setup failed
[  ERROR   ] test_free_list_no_read_lock
[ RUN      ] test_free_list_read_lock
Failed to connect to 'mdb://lmdb_free_list_test.ldb' with backend
'mdb': Unable to load ltdb cache records for backend 'ldb_mdb backend'
Could not run test: 0x1 != 0
[   LINE   ] --- ../../tests/ldb_lmdb_free_list_test.c:165: error:
Failure!Test setup failed
[  ERROR   ] test_free_list_read_lock
[ RUN      ] test_free_list_stale_reader
Failed to connect to 'mdb://lmdb_free_list_test.ldb' with backend
'mdb': Unable to load ltdb cache records for backend 'ldb_mdb backend'
Could not run test: 0x1 != 0
[   LINE   ] --- ../../tests/ldb_lmdb_free_list_test.c:165: error:
Failure!Test setup failed
[  ERROR   ] test_free_list_stale_reader
[==========] 3 test(s) run.
[  PASSED  ] 0 test(s).
testsuite returned 0
Running Python test with /usr/bin/python3: tests/python/api.py
Running Python test with /usr/bin/python3: tests/python/index.py
Running Python test with /usr/bin/python3: tests/python/repack.py
Python testsuite returned 0
make[2]: *** [Makefile:17: test] Error 3

On the same machine and environment, 2.1.2 passes. lmdb is 0.9.24-1,
talloc is 2.3.1, tevent is 0.10.2, tdb is 1.4.3

Any idea what is going on?


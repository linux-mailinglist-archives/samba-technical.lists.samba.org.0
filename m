Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD6927A9FC
	for <lists+samba-technical@lfdr.de>; Mon, 28 Sep 2020 10:53:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=XekP2b+48poC0WsRRVoYUu7nBAlea0SyB2XNdyJIgAc=; b=sm7SDIZfdn1WXbtlTjpdxRVF8e
	dS3GMwRN92cLuIYH1dEUha4832O+8dGPati8LWbFWUliJAzJkURf7EZ9p05W6fuHh/oPgKuUnASqF
	wrXCRhV2GSqtJ9F5GqfprZ+nC9nGJFhpW1GUN9//0pR/XLfuBb8hTqseJvQPw73nFyEM1Al6wPPXo
	uvGXOdkUT3unUH7Jtzx1lbKzwohlkyLXNrH+ca9kYsGXjFckDUgy/hgjDup79tRhYdATGbXqH+ZFg
	uLk4637l0SQTQe0DIxMx8eFj+5q7sX0arPUYCddBppR2ggrmP+f6F943sD1IAS4hEQWt2L+zj9Asj
	Uu8Jf1ww==;
Received: from ip6-localhost ([::1]:59992 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kMotN-007ejY-EC; Mon, 28 Sep 2020 08:52:17 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:43257) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kMotJ-007ejR-1g
 for samba-technical@lists.samba.org; Mon, 28 Sep 2020 08:52:15 +0000
Received: by mail-qk1-x735.google.com with SMTP id c2so247728qkf.10
 for <samba-technical@lists.samba.org>; Mon, 28 Sep 2020 01:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=XekP2b+48poC0WsRRVoYUu7nBAlea0SyB2XNdyJIgAc=;
 b=S19iAUc1vailmMK9XXhuyyKkIx4yfXwhxGlQubOrWjduDeg9UN9HecUnp5GuC7IGLx
 yCMUT74m0ol5HWtkhmv60iAV98BGWkj51y3cF1FFEWltUtzCcuVqNjXF1ZfvITu0JVtM
 ncAbliNdQl4Wf/TXmhmjYe8BqX+cCG1ugCrYN6P6hyZ/D5wFhyzyhgMflq79ncCqN1mq
 hVdFycXfY9zPmPcdxNXF3S7MoZHAaflp0RWMiwMZLAO6OjT8ar4rPZ/H4yi5a5WQyzrw
 q57R6msMmgsnNmAd66X6LNPdmTDMcc+FYrYttKM0g0Ib0n1A8QanC4M+x7SEUWUdxVZk
 +2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=XekP2b+48poC0WsRRVoYUu7nBAlea0SyB2XNdyJIgAc=;
 b=kY9y/BVbmKhf5dUiDKvJnXxJCjJDkqXalE0U2RGCXfn2/cE1h+yFN1ZAjIBUQdEj6O
 asv+agvqJhVieSx+17SoECd9DQnAuSiKZejF3jkz0MKbwTwczYciU9uhQsaK+uIIV3Jl
 mzEag2k8lvbtyEsqLHP7uXsju8tLXPVkKl9uD4nkjXNasPJS4CoyU39cdZeVvDCjRoI6
 4/wKR2KChuEsIwGJIO2U65jL5iuRgAzQCV99PUuMnuR/eCIMol3qHvVkSq/0tQvlIooU
 MwuiwhrWhp6znIVVsarQvwZP+mjo4TyDNNamh3q0SqI3H19q/Pvl8Gns6vQEYjapDDuN
 gUUA==
X-Gm-Message-State: AOAM5331izsCPIAMRIjA8L4GOL+wb1BWiaCBSnd2dgFkYw0AbffWQeGL
 1iGewi2O5LhEtlA1/6ZX5cfU3qBeggwB3Hjyx+d1snOQe4g=
X-Google-Smtp-Source: ABdhPJyDFoLArFexfZywXJ6VYyVS6yCmIUokO8xjvmeElYV5B9CnfQLDtYgH/1IWbArTrSLGAxWYwTZvrSLPwnGdDAQ=
X-Received: by 2002:a37:c403:: with SMTP id d3mr414029qki.196.1601283130514;
 Mon, 28 Sep 2020 01:52:10 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 28 Sep 2020 10:51:59 +0200
Message-ID: <CAC-fF8S+4hyY+dsWLFPcfxjR0thU64SrCGX8u8n_3YEi-0RwVA@mail.gmail.com>
Subject: winbindd callbacks not triggered
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

I'm looking into a customer issue which i couldn't reproduce, they are
running v4.10.4 (i didn't find any recent related fixes), and report
that when winbindd runs for a while it becomes slow to respond and
commands like 'id root' may take more than a minute.

The first thing that caught my eyes is this one time error I see in
log.winbindd, of which looks quite strange:

[2020/09/02 07:04:35.886276,  0, pid=42540, effective(0, 0), real(0,
0), class=winbind]
../../source3/winbindd/wb_lookupsids.c:663(wb_lookupsids_recv)
  res_names->count = 2, expected 3
[2020/09/02 07:04:35.886322,  5, pid=42540, effective(0, 0), real(0,
0), class=winbind]
../../source3/winbindd/wb_sids2xids.c:426(wb_sids2xids_recv)
  wb_sids_to_xids failed: NT_STATUS_INTERNAL_ERROR

But the real issue is with requests that seem to get lost and for
which the callbacks do not seem to be triggered, for example:

[2020/09/01 20:12:01.603270,  6, pid=15783, effective(0, 0), real(0,
0), class=winbind]
../../source3/winbindd/winbindd.c:920(new_connection)
  accepted socket 32
[2020/09/01 20:12:01.603329, 10, pid=15783, effective(0, 0), real(0,
0), class=winbind]
../../source3/winbindd/winbindd.c:768(process_request_send)
  process_request_send: process_request: request fn INTERFACE_VERSION
[2020/09/01 20:12:01.603346,  3, pid=15783, effective(0, 0), real(0,
0), class=winbind]
../../source3/winbindd/winbindd_misc.c:432(winbindd_interface_version)
  winbindd_interface_version: [nss_winbind (19519)]: request interface
version (version = 31)
[2020/09/01 20:12:01.603376, 10, pid=15783, effective(0, 0), real(0,
0), class=winbind]
../../source3/winbindd/winbindd.c:854(process_request_written)
  process_request_written: [nss_winbind(19519):unknown request]:
delivered response to client
[2020/09/01 20:12:01.603441, 10, pid=15783, effective(0, 0), real(0,
0), class=winbind]
../../source3/winbindd/winbindd.c:744(process_request_send)
  process_request_send: process_request: Handling async request
nss_winbind(19519):GETGROUPS
[2020/09/01 20:12:01.603460,  3, pid=15783, effective(0, 0), real(0,
0), class=winbind]
../../source3/winbindd/winbindd_getgroups.c:66(winbindd_getgroups_send)
  winbindd_getgroups_send: [nss_winbind (19519)] getgroups root
[2020/09/01 20:12:01.603723, 10, pid=15783, effective(0, 0), real(0,
0), class=winbind]
../../source3/winbindd/wb_sids2xids.c:114(wb_sids2xids_send)
  SID 0: S-1-22-1-0
[2020/09/01 20:12:01.603767, 10, pid=15783, effective(0, 0), real(0,
0), class=winbind]
../../source3/winbindd/winbindd_util.c:1462(find_lookup_domain_from_sid)
  find_lookup_domain_from_sid: SID [S-1-22-1-0]

And that's it, after that winbindd goes back to the main loop and
handles another request, notice the pid (some times after several
seconds like here, which shows that winbind is rather idle, sometimes
immediately):

[2020/09/01 20:12:13.111935,  6, pid=15783, effective(0, 0), real(0,
0), class=winbind]
../../source3/winbindd/winbindd.c:920(new_connection)
  accepted socket 29

Reviewing the code flow from wb_sids2xids_send() it is not clear why
it doesn't get it from cache, but mostly I could not make sense of
these logs (assuming level 10), that is I expect to see more printouts
before winbind goes back to the event loop...

Then after a minute we get this (lp_winbind_request_timeout):

[2020/09/01 20:13:02.700696,  5, pid=15783, effective(0, 0), real(0,
0), class=winbind]
../../source3/winbindd/winbindd.c:1212(remove_timed_out_clients)
  Client request timed out, shutting down sock 32, pid 19519

Or sometimes the client gives up first, and we see some like this:

[2020/09/01 20:13:05.144441,  6, pid=15783, effective(0, 0), real(0,
0), class=winbind]
../../source3/winbindd/winbindd.c:1019(winbind_client_activity)
  winbind_client_activity[19583:GETGROUPS]: client has closed
connection - removing client

Thoughts?

Thanks!


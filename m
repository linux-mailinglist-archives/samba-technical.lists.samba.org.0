Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D7978A78758
	for <lists+samba-technical@lfdr.de>; Wed,  2 Apr 2025 06:43:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=a8+d0Imd7Px38Ydl3zJ9B35LsuzJHhqRhlzoGepj+BU=; b=EiOk49TrOpAGq4PEpLT3o7/u+6
	3iDA7/iLGZHb+QTPG0XUtEMRUWPMzInXfFXo8FcVepZCmBKHEYY6oKSuCB9uCA0/WqOv2P6Ku34/0
	dt8BRtx2Kuoz2YYF9cBSI+qFAedAsm7s+vDxqeIoYJ2uZdN2/B01edZwoLDoCAY4rC4MonIzsVY20
	jD9WrOiDXXz5Vf7HiwmNnHo8PJV53chg6o+a30Nt1v+xiLXSew+qfh4cRYK+wRLCe/neQiYek+PSh
	0rfiAYPRARCWl04N1NgUct251mZLcl5e1WT7DD15ZX1jhiIYbr1Yg8NftMGiDm80JM6m2LKZCwaV0
	mQ5PfOyg==;
Received: from ip6-localhost ([::1]:21262 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tzpvj-001Yk5-7U; Wed, 02 Apr 2025 04:42:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37647) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tzpvd-001Yjx-Em
 for samba-technical@lists.samba.org; Wed, 02 Apr 2025 04:42:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743568921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=a8+d0Imd7Px38Ydl3zJ9B35LsuzJHhqRhlzoGepj+BU=;
 b=QXE9OEL3hVepY5X6FRJU1uWrdvGhY15xq2XRBimNnJVr9x8ChTCYQ1VHVtvO7S3BDUOGrV
 WlDmliFUGfm0IDP2efuGo35fgdH64sstctrWz6B/gwZ3Xy29hKmLu/eYPOsq+mLprpAA7O
 4qkVvCr/X0m/4JtROlhJpanFDC98AIQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743568922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=a8+d0Imd7Px38Ydl3zJ9B35LsuzJHhqRhlzoGepj+BU=;
 b=Kzq8TUyUA0XUImIsIq3F9kxqVTNBAyWN6VBgpkYtXmiA2ELy1lKgzT+zCpm9oYn9KGEwM/
 mfEwj48sgcS5ZeaYeIV9cSC1UeuB2PAncp6T3MRiOdHHjheYrvOFAWyzQ61NsdWnvNEfeb
 2mjw2qeQ/1xPxGgUsefQvdn11KK0Ym8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-ifBfh1KiMiWBhhqhV95V9g-1; Wed, 02 Apr 2025 00:25:03 -0400
X-MC-Unique: ifBfh1KiMiWBhhqhV95V9g-1
X-Mimecast-MFC-AGG-ID: ifBfh1KiMiWBhhqhV95V9g_1743567902
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7bb849aa5fbso1283983485a.0
 for <samba-technical@lists.samba.org>; Tue, 01 Apr 2025 21:25:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743567902; x=1744172702;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a8+d0Imd7Px38Ydl3zJ9B35LsuzJHhqRhlzoGepj+BU=;
 b=N7FJkFEIoXujQzZVjixMqX0uMVFfrw35COebVIGR+YN8eYhLdMPRf5VVJlgAaSBsjD
 92sulv5SYug2xke1y0XTuP/cWzfiYqYXhE/gqTxrn04Dt6AT5QeEl3U4/frhHIhF2+uL
 TDAbZ0K2vKeMnbeOatv/jlOpXCzKYsJCmCQy3wEE5WbS2qgF49QIQ7blibaTDfcArwb4
 jVRTszFBkcrZISruEjz4Y6oMGd5/FnIKN9YMNn8BixJa6kEtUDgAiyTOth0VMIK7Q1EK
 xZ1M4JqhlOWOCVIenOdIZF+bxsiZm6di7Gqa92SRXTmhII1QjRJKocmcqykSHx/OvvKi
 js0w==
X-Gm-Message-State: AOJu0Yzw0GfigBLpRt9xSETP2M/AhSBbauy0MMqZGzvZENA5uT40KUBS
 m94e7wbfbh/Tjm06slBtzv9I6g0p8H+G4+RZ2MJ0vuLTvXtMgGP/QQmzrgVsaetSi/6/YKlPxTJ
 Bm2LBJuczf8oatat0dyWi8ngwJk0hoKJNscdosyKHdIeDIE8v8HNkuPrJc0soJ4NkYqA09wHxyK
 Xz9KjO9+mGR0OvxRECQ3+5tFN3W9rjiBdlMNKr77WrrJzafZs1LUw=
X-Gm-Gg: ASbGncunWJ/Ghqc6hcGp9PfespftBuR1L7U2IgdPthrb7iiz7c6eWNp3Y8Scs1pyWBf
 bZdQLSwmKkRrWcShxQIBaBRnbWQqcyfn++ELBhpGWlQGqCvS8Nok5uUYOfLjhUZyfAkIZxtCgzW
 /iZhivtmxTGJp6u12gip+p6Htna4A=
X-Received: by 2002:a05:620a:28d2:b0:7c5:53ab:a745 with SMTP id
 af79cd13be357-7c6908754e6mr2637174585a.36.1743567902462; 
 Tue, 01 Apr 2025 21:25:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEFnE2jbGgTkTayIB06orhPF3KWxkaN5/PO9T/geu19njCWr8/A/fgaxwOWPL3+7VXDVpdU0v3d5APDvCWNa8=
X-Received: by 2002:a05:620a:28d2:b0:7c5:53ab:a745 with SMTP id
 af79cd13be357-7c6908754e6mr2637173085a.36.1743567902225; Tue, 01 Apr 2025
 21:25:02 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 2 Apr 2025 07:24:50 +0300
X-Gm-Features: AQ5f1Jp0xfFeg5BXz7DutDZz8O3R9osHKhc2OGeAiu1zzk3Zc7UfHyhdkdoc5hU
Message-ID: <CAF8sLVX=j571xk8Z10WRinb=tb4OjJNgcQ+vm-eO8SR6C0XU=A@mail.gmail.com>
Subject: I/O-stat module for Samba
To: samba-technical@lists.samba.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tD5QaA6NjkCgW2BRC8Q9nmdWYzM_9fVGe0HGYgsfPu8_1743567902
X-Mimecast-Originator: redhat.com
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
From: Shachar Sharon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shachar Sharon <ssharon@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Samba over CephFS has been under heavy development recently (here, at
RH/IBM) and we reached the point where we would also like to extend
Samba's I/O monitoring capabilities: inspect the latency and
throughput of every share from within the smbd process itself (per
node). Having such run-time metrics, when exported to the storage
administrator (via Ceph dashboard), would provide a better overview of
cluster smb I/O activity.

Samba already has profile capabilities (when enabled) but those
counters represent global state instead of (dynamic) per-share state.

We would like to propose a new solution which may be useful to other
users as well: use Samba's stackable modules capabilities and provide
new VFS module ("vfs_iostat.c") which tracks I/O counters per-share
(and per-node) using in-memory cache. Those in-memory counters will be
flushed periodically into local TDB file and may be consumed and
displayed via one of Samba's utilities (e.g. smbstatus or similar).

Advantages:
1. Tracking I/O counter per-share dynamically (only for those with
iostat in their 'vfs object' stack).
2. Low overhead when writing to TDB file, even when having hundreds of
active smb shares (each process/share has its own unique TDB entry).
3. May be extended beyond monitoring (e.g.: rate limits).

A basic POC to demonstrate the above ideas can be found at:
  https://gitlab.com/samba-team/devel/samba/-/commits/synarete/vfs_iostat_poc

Comments and ideas are most welcome.

- Shachar.



Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C0ED83D9526
	for <lists+samba-technical@lfdr.de>; Wed, 28 Jul 2021 20:19:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=tVdg9eXxyixuIbEdGa2Zbh5sBu+uWUBYTlSXykxIi3c=; b=XTD0v4RWhMqbbBBkoYISTImuuo
	t3AlaePgEX0pngM4+xr1fdcnZnenDtJoccw2BqgFOoI12s+rf2XTEGReCFNqKRK8UE1AuKt2Krupo
	NIV1DaLEsaKlLL9YgSNSOwe1CfvfEnF+6gJrrPf5k0DTn8GCS++436Mw2S4k0tHsTAQojiY47s3Mn
	0S32Z1Bgy9GBiTVAIzd0f9HjTkv58NC+pqgJaqf/3z9mfklcY4B6Lo+v00jXRfArngibdUOQkwtvy
	TUqUtHSVawzydg+moZn36JhAYlWO8YGwrvODlu+azkPXHSS7NKy+wzlvN/wywrpDynCIgYYOyjzJ8
	7AAG8M4A==;
Received: from ip6-localhost ([::1]:19532 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m8o84-001ONV-IC; Wed, 28 Jul 2021 18:18:04 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:36615) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m8o7z-001ONM-K3
 for samba-technical@lists.samba.org; Wed, 28 Jul 2021 18:18:02 +0000
Received: by mail-ed1-x536.google.com with SMTP id b7so4513916edu.3
 for <samba-technical@lists.samba.org>; Wed, 28 Jul 2021 11:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=tVdg9eXxyixuIbEdGa2Zbh5sBu+uWUBYTlSXykxIi3c=;
 b=PColkPuGeidGrtDMgqxJ7NvfPJwxcVaBvTjipr5WxRNk60v/ZA1xSXzs9C7UgDPG2K
 VOWprkTCCRkON1MZfAWQhHnuHjuDHU1dkPuxuT0WCRzYzuEZfK9SuYk2vrSadx2K/JCC
 YXY/WR4IGsG6rThbClENCdCfl4PTXjQianwFa6DKeYiybpMLBA6DtvPMZTGVRkCaFSuf
 SzI4RBZjLXQAxiexthvxEJLv8yOCtVmTiNXHFMRRm7C8OAM2OumuDb+SOAXGKtBL7wIm
 aZfoYcOtcIdsNy8yCrLGhHaCqCZFV7TSL0mYrMJx/XPDky/Gtq5ulLjBLb8wfCuQVMbL
 T4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=tVdg9eXxyixuIbEdGa2Zbh5sBu+uWUBYTlSXykxIi3c=;
 b=WPet9tMrm/k78LZvDC7AqgmntwNavMZzio3hL1J/iZpa3dl3Zm5RovAjf9NBOqgste
 BtvlLd8h53Iyl0AvWSxvPYihGi1Iy3Wen+fVhZiyjuR5UoArn2w7pnGemtZP3Ycgn72e
 DjiIZU60fKW9goAqKmK/Ky0sBbHFCwoLGgs6seq3hX5gIDw0aa1YBD+aPi6q+/6E/Zhq
 2f5oFZey8IhyHKoKIEYpNTK0kReZ8wXe0D9iKKAfDC+/V3Jsh/Sne1XvNdWjOHzIaPLY
 ixx1wuEKMF67N1i8wjtp3C27k2oepo1g1jahHetfGOC/nmuq/x5uLqQp2P9GC5R4rVDt
 G48A==
X-Gm-Message-State: AOAM5305bjIT57yPsIVyVYDbgHtQAuCuV8bAbcCA3VlkbCkfKI5/AGhQ
 UO3C8/96ueTD3y/PAfIIPXytPGjmdh4vCEzk1rpq0VCG
X-Google-Smtp-Source: ABdhPJz8ZqhQ443Y0xnafnsCOmWhXiUhHZWNgidjLdQphHJDBFbPv+nxwz8Af6u8aD+J4kro8tUAdK/XTSMw7TuOPRU=
X-Received: by 2002:a05:6402:291a:: with SMTP id
 ee26mr1387760edb.220.1627496278359; 
 Wed, 28 Jul 2021 11:17:58 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 28 Jul 2021 11:11:36 -0700
Message-ID: <CACyXjPyWrBpuLspUO4tYP_Qxf=av8Hzu5B-gdsrnQ1yn_gtrRQ@mail.gmail.com>
Subject: CTDB issues with locking.tdb with some workloads
To: samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Richard Sharpe via samba-technical <samba-technical@lists.samba.org>
Reply-To: Richard Sharpe <realrichardsharpe@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi folks,

One of the issues I have seen with CTDB relates to certain media workloads.

For this workload, the customer has several hundred Windows clients
that are processing data and writing to separate files. Each client
typically writes to a different file and rarely writes to shared
files. They sometimes do read the same files however.

Unfortunately, this creates problems with CTDB where we see lots of
logging messages saying that CTDB is having problems getting chain
locks, often taking between 5-10 seconds to get a chain lock.

As a result the workload slows down intolerably and some sites switch
off clustering altogether and run the risks of corruption.

One site I am aware of switched off clustering and joined each of
their Samba servers as separate member servers. They also had their
Windows client connect using something like DNS round robin.

In this case they were not protected against multiple clients writing
the same file but since they felt that was a rare occurrence they felt
the risk was acceptable.

The problem seems to be that there is a single locking.tcb file that
handles all files that need locking coordination. If there is a lot of
write activity there will be a lot of activity on locking.tdb and it
will move to Samba node to Samba node.

Perhaps one way to alleviate this issue would be to separate the
locking.tdb into one per file. Unfortunately, if the workload involves
millions of files there will be millions of TDB files.

Perhaps the workload is such that each client operates in a separate
directory, in which case we might have separate locking.tdb files per
directory, which should be several orders of magnitude lower than
per-file.

Has anyone thought of these issues before? Is there a sollution?

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)


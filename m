Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F411DD7E8
	for <lists+samba-technical@lfdr.de>; Thu, 21 May 2020 22:05:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=cG23ldzaRmqKd4Gzp6NjhqVQ0Pew7Z/TiZykGS4TqcY=; b=pulBcSjXqh5zqgYxMHjQBQ9xic
	DFbwVQAamRWfEwIwYlwfasFrFeL9cAtIGc/a4k4vNRIbw/wZr+2w4zuG3QCDdjyBICVl72GARhllz
	neYkCriD353xbhXR+8OCduAXDTn+ofiMYlOl47b0lJD1LG407tD1fGpTZ7x2SuciJLllDbc0HiQDf
	IxiQqiVMlTk5iwSrRdO0WDmTZr8K4rhTPUGJabgKsY9hs6vxmsQmqMhe7/uInY+XmgBHjYogOmPI0
	v7n/zn/OJRijAuhmW0xZoCyem+/mLZhfCFASoKEyp/yUCLD/NPVokRO/Y5v9V7ZgeTKswpaZhYnLV
	l7OTChYg==;
Received: from localhost ([::1]:41696 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jbrQJ-005OMC-KZ; Thu, 21 May 2020 20:04:11 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:39158) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jbrQD-005OM5-G8
 for samba-technical@lists.samba.org; Thu, 21 May 2020 20:04:07 +0000
Received: by mail-ej1-x62f.google.com with SMTP id s3so10361826eji.6
 for <samba-technical@lists.samba.org>; Thu, 21 May 2020 13:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=wcyiWleRBc3fL9yjwg/lGvnAKa32p2QmNtKTvz0HYd0=;
 b=JM8NFUga9quyK7ooMAexMXy7p6HGjRLgtdw8CF7CR3BGcRlSABUvnI84PpwGMqQymP
 VFtLdHgJaUInurwV30Xz7nA8M1FPMv6frna3TBZ3l9Dxmf3RfvDFSuEwTwVzuQhut5Uq
 9Ct26sex1e26RJL8CPNpT8ijOVOOjdk5Mmw4Dg08FdXV2g4e/o/lpud8PiB8ux1HvqTF
 ZNqvdXso2/fHYkMgnFyPLNioRuC83yZc6dc/VkMlRKY2gseSSjYCTDdYt4CacLZZ3fCG
 lonLxU/ML3PtByxE+SZhj91sXoKgBTLLgtVL37n8F0nTJJqCh0PiDS7MM6pFYKTR/CSh
 z5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=wcyiWleRBc3fL9yjwg/lGvnAKa32p2QmNtKTvz0HYd0=;
 b=rAm+nFxYttSNbMHd69/BwaO2aKoK4QKV8fU1zVBX3IfUIDLvBDomtTJd/sWfgwVKAE
 GTY+zZxzLP53MX9dhLllDhT9Yp0bALZZfg1MJEviR+YqegTbcE385fNRhwodsOWdYMmk
 ldVLqi2DHDAO32jLOAr6ru0BduO4UP51YTuglZVhIqDPpfpas8qgn3PW6Tj3SbOzQQ5y
 px7y4/QeKemPolUD2vDeatwKwhOIagCuApR9BGHW/GJ39SI17xQaTuqgWiqGESfsQZJe
 7ukwXOhqicmWE9R8+WH3nADaiKKWqAMtSdnQHJVayB+OneODj0FKF7HDRHVIwfLEEtMi
 PZcA==
X-Gm-Message-State: AOAM531uynN93nHYSoaoM3WSIf89dedCbxWgp8AAsfHqXNbW3AAYQhp/
 Tj8/pyT96hsJUcw9JPaH4QCbnKkI9JOoePlA1FoPIH8NuHs=
X-Google-Smtp-Source: ABdhPJwZBLijgyYuatk62tT1PShrlymgKkWVvgNofFW10w2Xrq7yveTFrOveR/Z4U/NrpTZ5oea7mhZ0tEP+CUXqRyA=
X-Received: by 2002:a17:906:a0c2:: with SMTP id
 bh2mr5359607ejb.458.1590091443425; 
 Thu, 21 May 2020 13:04:03 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 21 May 2020 23:03:52 +0300
Message-ID: <CAH72RCWL=4v4Ek9c-YbH0JYLX64iYK2NA83NOTYOHMN0uZ7A4A@mail.gmail.com>
Subject: GSoC: Community bonding questions
To: samba-technical@lists.samba.org, abartlet@samba.org, 
 Alexander Bokovoy <ab@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: hezekiah maina via samba-technical <samba-technical@lists.samba.org>
Reply-To: hezekiah maina <hezekiahmaina3@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

G'day everyone,

Please correct me if I am wrong. So when you provision an AD DC using the
samba-tool command line utility the following files are created or modified:
  smb.conf
  *.ldb / *.tdb
  krb5.conf
  resolv.conf
  /etc/hosts

Are there any other files that Samba creates or changes?

I have also noticed a lot of discussion on the mailing list around
Kerberos. My understanding is Samba uses Kerberos as it's authentication
protocol. Are there other authentication protocols that Samba uses apart
from Kerberos?

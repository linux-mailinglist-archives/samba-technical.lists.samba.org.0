Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2943758BE52
	for <lists+samba-technical@lfdr.de>; Mon,  8 Aug 2022 01:35:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=4bmzPllXVDDPOiTLxLJ+8Ig5bUc+01VSgBZZYUerzPE=; b=otmHhcVULlxLE8mpZUwTzT9zcm
	mZZdngTh1wS060HSE8q4MZm2dY+LlF0PK36aMv9cz7FHUJmh3e9X69tawzYkmcY8RC9f8TaPhVHEx
	h8N4llP4d8FIK/MT62kpmpibYgq0ET0rOwHsNESdrcmr6KyxG/E9/xi6rATBL6tgXcZeQNtFboSfg
	hBNAb52ltqa7dO/+PZLGLK6e4MZ2jgaMlRhiJyha+QaVWGuL9Qvky+92sCrgxKIcT3qmFl+92zd4m
	aZLW257dPLPtKm5VPQluQFn78qyAYTHZtc/xPZOoSnpk8ZjVofwC/notBkk8/Raoa7c6lQyKHQNxS
	J8typYpA==;
Received: from ip6-localhost ([::1]:41292 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oKpmI-005zSi-TZ; Sun, 07 Aug 2022 23:33:50 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:37426) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oKpmE-005zSY-1W
 for samba-technical@lists.samba.org; Sun, 07 Aug 2022 23:33:49 +0000
Received: by mail-qv1-xf34.google.com with SMTP id m10so5377085qvu.4
 for <samba-technical@lists.samba.org>; Sun, 07 Aug 2022 16:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mattgrant-net-nz.20210112.gappssmtp.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc;
 bh=ELjgJ7td3m50DVQEDz3yH/LqBCu9wk4fzztmzciFva4=;
 b=2RnpjnARQtBOPP1i+++IrwfNIsxbsz7JSImW5e9ERfOfbTgO441G7J4wqyhJQCUFJo
 9/DB+lnhARlAmCVgheqOIXbkI+KGRKVwfF+C78BhUu3ERAvSIVXtHfJ9rmTR6FuCyckK
 vNHJO9C3QPaVvPlIIlK4ngX+DA9lDPkghfVEIRFfLbmtJ3iI1uAIOGYGGG1B4aud2TkS
 z2bMBdIYo3ln9ZFQHH2qxsGwaW2Mn9c/iEsDRj1P4ntgxSJL2KBjIAYTcQDplby1T2WD
 DFznRHW4s72usGxbtN906zHkVNSXY/RdAtau8ub2jOqhule6CWSSmtuCdf6pnUwD8R0h
 IbWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=ELjgJ7td3m50DVQEDz3yH/LqBCu9wk4fzztmzciFva4=;
 b=YMPBdtH9D/b14MPMShqqnQ5LM/xNYSHpUKufCak5mqh1ZvEiIbyQWqmUdY9nxUesCZ
 ZrgCES0HHsUurVpQ8Xjjhq1AzgZRi7C6BDADF7EiPz3pxKTXCOr+xXbVLLEQArBdJc1+
 r8yDT/qiM5F3mI+kiSJaMgS+JyHOr3AjEduXLX5QJRM+8n6c8QMRSShXdBCU6iPHSuA4
 hry6Vx41/lEluJcgG0n4BO+fq3YUwsG0oiZJmAkvs96hARrTrsfkHOwgo2lLExMFRsJs
 YjbK7wJRbmZyKV/E2HBT76zTvq/esN9fam3nNsaWhWf9qWCydWl7N0QYT1t9bJJy2/xy
 aT3w==
X-Gm-Message-State: ACgBeo3un8Bzdo78B2QRT82g/lXkRpwzWvBcwwI66WB8vnQ71tDl+JfQ
 iUcPjpREXK8v0QxagungJBrqUA+0t+dDLvVH6YsoJQkDPXj3Xg==
X-Google-Smtp-Source: AA6agR5MGtHWa5Mu5zFCLch7b7KR8wEIE0vea4zZ4Ncyt+K1sebARbqRgueh1wQM+w3PzBDhe+Zvgl/Exc5Nra7EYlI=
X-Received: by 2002:a0c:b258:0:b0:47a:aa82:58b6 with SMTP id
 k24-20020a0cb258000000b0047aaa8258b6mr6537364qve.46.1659915221554; Sun, 07
 Aug 2022 16:33:41 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 8 Aug 2022 11:33:31 +1200
Message-ID: <CAHA-KoN_GK3f0RkYqGvsPGahL6tPJ=2RjqRFVsTQRB0F56-rQA@mail.gmail.com>
Subject: Review !2271 for merge please - DNS updates allow/deny for
 SAMBA_INTERAL dns server.
To: samba-technical <samba-technical@lists.samba.org>
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
From: Matt Grant via samba-technical <samba-technical@lists.samba.org>
Reply-To: Matt Grant <matt@mattgrant.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi!

Code is finally ready for review for merge, have filled out the test suite
enough and cleaned up the code.

Could someone please take this on, it will be a release feature item for
2.18 hopefully!

The patch set filters the dynamic DNS update mess from clients on a network
with an ISP PD IPv6 prefix + (IPv6 ULA or RFC1918) private network, and has
support for access by IP for dynamic DNS update purely from an enabled DHCP
server.  I wrote it for use in the SMB/SOHO set ups I maintain with Samba
on Linux.

Thanks heaps!

Best Regards,

Matt Grant

Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 906819A7DF
	for <lists+samba-technical@lfdr.de>; Fri, 23 Aug 2019 08:55:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=PwKwnTAJmltBTo8PHcxX2SxKtM8ttjbSH+Qtehfku9Q=; b=uNeTwkBirZJKRfNoqpi8Z8iXxY
	Uh0F8xYWANn4hJ5B1ew4O5d1QI5+iNDiapZYwQ6ht9Rr+ggbPEZndmnq0bIZnFcIG2q3tGOZz4kpH
	+oKspWx1G7K0HjHgvsKH0ruLJwogrSwDRpOPnb5OCG3kJ4EoTzc5jLthjGusHMTZc5YL7tD1b+irt
	XH8NoASoVCNcM1dLdBOLHkv2696rUeofZcxMA46FDXWQ3vuGNyzLJevL1joTlDXR4X6VZZOJf+mHq
	BSkh94hlsnwNM9jKC0Ow1isbAWK/+y/omrnn3jiUxK6/urwUkhTBbfWh8nYgnvORfX8me9vwHGYVO
	9iF2JeTA==;
Received: from localhost ([::1]:45378 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i13TU-007iAc-U5; Fri, 23 Aug 2019 06:55:05 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:37786) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i13TC-007i8m-7V
 for samba-technical@lists.samba.org; Fri, 23 Aug 2019 06:54:48 +0000
Received: by mail-io1-xd2a.google.com with SMTP id q22so17774911iog.4
 for <samba-technical@lists.samba.org>; Thu, 22 Aug 2019 23:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=eOCWsprZllBKK7f3gLLRSJiPrpyMZGcDh903YXQfWrE=;
 b=AJH7QCu0ytgosORoK0Xaac6AsehJLulu6SQYtdE2xjPmSsGirKGKscNTM1vNcZcVI0
 oKwR+0t4x5xCsSMBfWKNLmKBQyQgNOPFLkEG+z2MX/R87XGH9gcsIVlg1g1Q8p3FOBIm
 RjrLf6YIz97vWmX/+0Ul+rqRoBHQiXX8VB/9Z+rbH7YtN6PIjqNELmdyvdBqe2WoEa5M
 XZcIvPyOdFy/W6JRozTXJLpstys7a2IrPL91aNDzNxszN//WsJUD1dwIXLO+jnBAoqs6
 xLbSYzuGM1AisnAWyVSZqA8Y854/Ha5WLUBYbX6tONMLvgo83be7lfVAPHskOQX+zUTr
 eAzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=eOCWsprZllBKK7f3gLLRSJiPrpyMZGcDh903YXQfWrE=;
 b=tVUc5jOYTJ9752W71f8Ci4Vxi5yXUF1GLGrWUvgI1zfLD0u0XL+dvjNppNR0P2rmfu
 py6wLjyL/6lmQArorSf88DnXBGfxD4XnEE6FAhkW5lTZacStPkP4nxTbOhoXSlt6LUuM
 fPDMvsG1VqQ4KTOuffk41Y3W78UEF7d7a5RYbM58XnqUNJWW9M1pRTxPfWmYRdNSa8Ri
 V38sloG7/PhcpcJMdKI9FQiEw5h6trVGFP6GhsXUpP7cumaUbWnSEQXLzw/Ko0DgBT/h
 8OPaytAgqdYpcN93caCEid6Xtx13PuBnCv7gCo2dSpLIcaXtjBFcjeqwqkEAnYBvrBZi
 PRvw==
X-Gm-Message-State: APjAAAVPzFE7qEO8shP4M3lwmX69OkWqRgypRS+YCdRIEQzJi8DiTTue
 2GW4SPirOQIW/LY8+TzEI8MYycSCHeC1AgV2shQ1G6rb
X-Google-Smtp-Source: APXvYqy7Er1oCMVrVIHcowIvwgDtDN34rQ3R0DKX1AFwo9iBztJUN1674VinQB1LYeBUOI1ntJZVy2VdBKljoCx7ZHw=
X-Received: by 2002:a5d:9e05:: with SMTP id h5mr4724260ioh.302.1566543284244; 
 Thu, 22 Aug 2019 23:54:44 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 23 Aug 2019 12:24:34 +0530
Message-ID: <CALmqtCXzTfqrOX_rSoR5nbEqGvcO1Xeuk7a+56+uoC0nh_-Kmg@mail.gmail.com>
Subject: Query about slow read performance
To: samba-technical@lists.samba.org
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
From: Abhidnya Joshi via samba-technical <samba-technical@lists.samba.org>
Reply-To: Abhidnya Joshi <abhidnyachirmule@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi All,

Recently while doing single file read testing on SMB2 from our product to
Win2008 (as client), we saw some performance degradation.

Although we are finding out causes in our SMB server, we can somehow see
this degradation when the Win2008 got security patch applied.

*2019-03 Servicing Stack Update for Windows Server 2008 R2 for x64-based
Systems (KB4490628)*

The performance drop is not observed for write but only for reads and the
cap seen is around 260-280 Mbps. (Earlier it was around 520 Mbps). The
security patch does not have anything directly related to I/O or SMB but
this is what we are observing.

My question here is, has anyone observed any of such problem recently with
Win2k8 used as client?

Thanks
Abhidnya

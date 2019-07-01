Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 645825BC23
	for <lists+samba-technical@lfdr.de>; Mon,  1 Jul 2019 14:51:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=xC5sbs4KgReA0myo1tZton5+xGrq45R11U3l/Kqfstw=; b=U3iSyN5CfH2UK+HKwL+HAL2eha
	52TbU74KvcvG6Kg7q3IhvaLJUdTsu5sG6vGkITkMrN07eBANqkiDLGpVYtN7u6uXuKlXoWB8m5DeP
	4hN4h/J5Ivk60SCX+5z+MYdaDajwt11+ZbmjNbaRdFSAPkTTECY17UcBPbY0dqGE4+EA/oczUfZrl
	efFYOOMKcLz4O3gx2hruq2LMK53RFZi2SX1veNBO89ry+GR4FBvFKYRKaTogVAD5NcJCIfu8AwQpd
	TEaUA/JAo1gl88xoKLt8hHKgCYWGIDuBbgE5WYAj+JUSK/NQPYY4J4b3NmmffGSbfzRNrlqe7zPKQ
	PaZm/Mfw==;
Received: from localhost ([::1]:22592 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hhvlL-004IrI-My; Mon, 01 Jul 2019 12:50:27 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:33058) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hhvlH-004IrB-1x
 for samba-technical@lists.samba.org; Mon, 01 Jul 2019 12:50:25 +0000
Received: by mail-lj1-x22f.google.com with SMTP id h10so13065124ljg.0
 for <samba-technical@lists.samba.org>; Mon, 01 Jul 2019 05:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=py28gsBlSAOMJKq9Y4/hpenVg+gAlrDOunT8FgGdZok=;
 b=g9xl88XDs+oOOpOCOQvmVpBywxPfNxel8IXXT4BxfiOvJF54WXJmhzdWSRbkCidSW6
 cpVWmWOECYd+3NUR/HtL798xT5jdNUzle4c8SQdilpjVCtbRrPwCNb+NIiKju21JPZ7B
 IETy2KBkArwLGARWU3GAFLx/TQo7p18tQiGrLVDH+wWYfEjyE8no8jQfm5o0XFLo2Bzv
 TyYjNewwLJSjbISXhXS7Oapmr76MePGTV5mI3E682NjvZ+d2g/+qt3E1dZUb5KG4JPQm
 IZDzodZ3Gbd95wgOcmPzkpfmUG+mi/pysdCG4hzcauxRyQ1oHdCRyPGriV6xL7QbYG6f
 ZdAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=py28gsBlSAOMJKq9Y4/hpenVg+gAlrDOunT8FgGdZok=;
 b=oI8XeIBs7Ab5siVu3xpIVo1mqgWY4+T01JivDhln+YyG5xLaG7azm6ZbYIvsV7ACn7
 RUnRw74Y30oCPSwnc33MWZnxPyLhEzGwz2HXYrzTtfF04C2UiPuO/E0+lkjqJkFI3s9u
 50Lt2gsNg69YPRocDqlUy7bfShL244dApIaI0cuws2dmg0mrJv3OaVS5cpEv9Tbjwovm
 IPfF4hkJ2rtZYJPUwJpGK6qlXWObKgoKs8thacc585tguqej6szcPtU3D8qEsQtihFWS
 hyxytmbatXMrxKCrsLl8c6DDq5DjCmWjdhVLEG8n9jL4rf7VPhtoB54JdjkzOk7unWRk
 JdTw==
X-Gm-Message-State: APjAAAXD++cMUk+E70+sVbW+fLeZljzuzG0z2osDHcA3hFtEsWvJRm5m
 F/0bKogpJZUPmnzHEiGW/+w1GvArHySa9dG1D3PuuiwvVE0esg==
X-Google-Smtp-Source: APXvYqwc6jNSGoHyhkv3oijjbjwWdap++c1RjEDumjIypW3vAmHDjP/OF7tRH7BdFO6FfBjplMaQx2DRLrgW98h5PtQ=
X-Received: by 2002:a2e:b047:: with SMTP id d7mr14190751ljl.8.1561985421792;
 Mon, 01 Jul 2019 05:50:21 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 1 Jul 2019 13:50:49 +0100
Message-ID: <CAELK94d5V1QJvUC1M1nHpb9nrjZW_o2qjjXFR3zebhNY2tF34g@mail.gmail.com>
Subject: GSOC 2019 : Improve smbcmp - Week 3
To: P Mairo via samba-technical <samba-technical@lists.samba.org>
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
From: P Mairo via samba-technical <samba-technical@lists.samba.org>
Reply-To: P Mairo <akoudanilo@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello, a summary of my activities for the last week :
- Made the code 'debugable' : basically wrote a function which clean the
curses screen when I debug using pdb because it was impossible otherwise
- Added a color highlighting when the content of the packets are the same
in the diff view
- Started the exploration of the XML output of Tshark

-- 
https://github.com/RMPR

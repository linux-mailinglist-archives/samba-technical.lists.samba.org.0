Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 02969686B0
	for <lists+samba-technical@lfdr.de>; Mon, 15 Jul 2019 11:55:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=benBHZ3+c3kP9IgTntseYmtj/MDSYwzWU/8xdjR1ISU=; b=lHMUGamDtnf2q47DgKwOh88oim
	Bwbdr5TtYgLd5lanEXDsNdFCsoOWWciYmzWwi9kIx/B/nfHW22xRw5QDR65YAG9gPMzdPdxlOw6Ls
	IZciwP06SbsfQrFTWnwBEkw19aUnQW9o20Q8O/nQltiqffB6pl2g9BvyAqbEyXUhrYYk559a6f6ss
	j5XqieYVv87/ksi/ffvT9wDdK6/GL/QvLVhPaEiYzun3A6LpNb7LOln0Ce/jhIi8tNdcqd1wlKV3n
	HwIYpmpc/monUY0eAzWA57P6uiLddBJWE/hGgig2WD6WfQz6EGNWZvsP/5jnFeFZXPYppGmsXM1zs
	Mcm+mkyA==;
Received: from localhost ([::1]:28452 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hmxhY-006qsK-KD; Mon, 15 Jul 2019 09:55:20 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:42706) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hmxhK-006qsD-VI
 for samba-technical@lists.samba.org; Mon, 15 Jul 2019 09:55:10 +0000
Received: by mail-lj1-x229.google.com with SMTP id t28so15500307lje.9
 for <samba-technical@lists.samba.org>; Mon, 15 Jul 2019 02:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=qerQ+/zE3IYPVgaycDXl6dKtCwi5FadlCGP1dty17Tk=;
 b=beNNMB6MFIfWzbCV1hY++09/gGgVAT0nCSlJ4F5eBMez7xxEVd/cmS78/Wusv97R9E
 kouMxtk7q8Q63lYFlWt9+ds9tDkiIBbZ7AhX62Rb9lK9Dvz2B1poAaaU3jBxxxEk2PW0
 dEp1SJpq+e3hJO9YQM0QUTiFF7ZeIxV3NmKYNSEIF3OCq5F6GWtN0dPZ0rqbIl8eigq9
 2MVpQ6LGTihnN95YZeFbbBC/HENSz2a0Bd+FBWPSR1IgsSwfYruyPVVQDPnLlhBa1WS8
 xwT2EgsjTqwuxxoKGwc9sjShrP4iKWwu2P9WeHxWpQJrDdOZTE54HAptBdVpEBUMzXhp
 Kz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=qerQ+/zE3IYPVgaycDXl6dKtCwi5FadlCGP1dty17Tk=;
 b=DWMseX/AxipIHuHLaN1CmqaO49cwARRaMsWV8LOzr0st9IJzP3QF/EY8Z2Fv5+57Vv
 m15TCzSeb++ehayR166RxuX7nyTJZn4BMwDChAYHj5WmY9YQN3zFFyza8b2Ow6QAp1Kj
 9AkM3h6UIHxsjriPbx477/wzkJcwwsxt9X9/f1Uk5ywpYljNQltl81iK0e6CFkQQE/q0
 VOjKNz26s5SL3mxV2AUQdUAHuHwSHR4VxaM0676KOH2aHphWmBhQQt9w86Ihmbt4W7fI
 GDQdNSiioB2VrhHoyKLT8koMrFZWhbY/QxDEMMmE6nxFthjRTwvTL/zc3v0OSLwOsM7O
 LVMg==
X-Gm-Message-State: APjAAAVFVkweze+jOnCdHGQNuIm5T6zVz8qDpUIksIr5D0A50ICIYShm
 q3LGcNiZN9nTE1id2uzwukgPrtrl3zwuBQjC6rctVWAh
X-Google-Smtp-Source: APXvYqwoNUlsoBpPrg6LonReqFVDcBRcgsQvO4SjbmJonuUbgf6YDL7cOXIcIk7ub0xNpZ//YyR1upfSzMynK4di9lc=
X-Received: by 2002:a2e:b047:: with SMTP id d7mr13853935ljl.8.1563184505035;
 Mon, 15 Jul 2019 02:55:05 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 15 Jul 2019 10:53:53 +0100
Message-ID: <CAELK94eSQu3oE_q2FtApsEBTEdpTOhjPTb0642hMpLvmx4kJbg@mail.gmail.com>
Subject: GSOC 2019 : Improve smbcmp - Week 5
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

Hello, here is a summary of my activities for the last week :
- Implemented PDMLParser class
- Browsed samba protocols specifications
- Read a paper about xmldiff algorithm (
http://ilpubs.stanford.edu:8090/115/1/1995-46.pdf)
- Started PDML diffs (using xml diff)
- Worked on specifications about filters

-- 
https://github.com/RMPR

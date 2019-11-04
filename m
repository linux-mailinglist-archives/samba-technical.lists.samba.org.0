Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 25387ED924
	for <lists+samba-technical@lfdr.de>; Mon,  4 Nov 2019 07:51:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=Bd3TTrg9zZW4cAfn85CxBo+7eINTNAhXiK/cSyJLOes=; b=2PwUJHe+kyMQkbaP3rJtCFeV7S
	DEFjg8nF8n9BEWcjyIIVq7I9iZiv3n2edA78VjnQ2Rk+rbAeHrUHi3R16MCGdxYe+73aRZUt5regs
	u3HnHk7UgvLa7muZyNki8gGBGsiNKJy4aBU/qmnqPY951fNXFIDKlpmPPyYpFTMdQLVHrfettXJEz
	tXaFJESghs0xnCSbevRHrpXfgdh8ewREnczEOKPo/6SE53jD2LJQ+stH09rIVPB2SFn2TTYyNSlhO
	6IHH1S4U/M/bXyFu6QcSQaC8saEXqDbSYoX5Zsxlxdk90c8q9fH7wyoOn5m2SHlvd3Ens0S/0XnrD
	xyfNz6gw==;
Received: from localhost ([::1]:55880 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iRWBX-006Qu6-6u; Mon, 04 Nov 2019 06:49:55 +0000
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844]:42599) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iRWBL-006Qtz-30
 for samba-technical@lists.samba.org; Mon, 04 Nov 2019 06:49:46 +0000
Received: by mail-qt1-x844.google.com with SMTP id t20so6750342qtn.9
 for <samba-technical@lists.samba.org>; Sun, 03 Nov 2019 22:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qnap.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=z7LzGM5EKFffPJkLbt62hNBnBOzOTQgi8AJJ3SmL390=;
 b=YVilUKT7x/e+BZ5JBjHAcbGs1uAHDeyNRJpL5+ZjGU5p+N0Ctk9cvqOW32AsIxOaD7
 NTiTJxgVhQ5ETqATs8Ekp3cFel9Nf+berUT7ZoxijiKVsRT5SmZ43gQCb2i/jbQVA29B
 vs1/1wjf8x1l6kXR47H3wa99bHiB0aYpEolJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=z7LzGM5EKFffPJkLbt62hNBnBOzOTQgi8AJJ3SmL390=;
 b=eKWQ8pcCSOom5KadUQaGpsT1SzXSkSiz0lDukO5QdFPGVkI2KILHRjjW4y0YweBh3b
 Zq+P/DORFXvpVCjocaVW/Y0fxEzqWuyvefQYaX/Dx9mKrFESyCfASUyhlbTQNlJrSL2W
 YcRPuU2D7j/jkbY3kq998S/cudHaPlkxjlnLiIB9UcDR5mQYRGnATO+OLts8Qoutd+14
 +V3D4gdQVzmFzrHsSk6Jv3ksMNtISAMKKJP5Bxp5kViDwJqxYQQo4UH0IhaiFif1wVbE
 aX/BBqlffLnLYDvmYKTXF8wGhKZdFSvBN0tRe6bIxEAqA8ZRam6uZ46LUkFmE2rnuXbH
 +X8w==
X-Gm-Message-State: APjAAAVAzCWU+oOYBUFZIYCmBs2JnDx9J7pgRr/J730aZ1qRuObk9Xtg
 HbBKCDnsXzRFik3HYJ0RDSYz3Nmhk9sAqK1rExp/ucTU
X-Google-Smtp-Source: APXvYqxkgCtLgj3fRrKB4Iuuh847RiqBZuJaPjlAYzhlHOiWT1nPmAUn+cn/6Beix/Dh1ots5BBUS7Sx0TBXgPv1/wU=
X-Received: by 2002:ad4:558c:: with SMTP id e12mr14305103qvx.191.1572850180667; 
 Sun, 03 Nov 2019 22:49:40 -0800 (PST)
MIME-Version: 1.0
References: <CAEUGjKjmFJFmz+Wts1UMZaHXKEEpeuY7UmB52H_aiQU=HS11sA@mail.gmail.com>
In-Reply-To: <CAEUGjKjmFJFmz+Wts1UMZaHXKEEpeuY7UmB52H_aiQU=HS11sA@mail.gmail.com>
Date: Mon, 4 Nov 2019 14:49:23 +0800
Message-ID: <CAEUGjKhGfu1F+7bzsFNo5oq4YRg22hzK3xjuf3sv7Y-iYCzd6w@mail.gmail.com>
Subject: Re: [PATCH] s3:libads: Fix mem leak in ads_create_machine_acct
To: Samba Technical <samba-technical@lists.samba.org>,
 Jones Syue <jonessyue@qnap.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Jones Syue via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jones Syue <jonessyue@qnap.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello list,

CI pipeline running here:
https://gitlab.com/samba-team/devel/samba/pipelines/93381285
please help review and push, thank you.

--
Regards,
Jones Syue | =E8=96=9B=E6=87=B7=E5=AE=97
QNAP Systems, Inc.


On Fri, Nov 1, 2019 at 3:59 PM Jones Syue <jonessyue@qnap.com> wrote:

> Hello list,
>
> This patch fix memory leak in ads_create_machine_acct,
> samba-4.10.9 included Bug 13884 and introduce this,
> please help review and push, thank you.
>
> https://bugzilla.samba.org/show_bug.cgi?id=3D13884
>
> --
> Regards,
> Jones Syue | =E8=96=9B=E6=87=B7=E5=AE=97
> QNAP Systems, Inc.
>

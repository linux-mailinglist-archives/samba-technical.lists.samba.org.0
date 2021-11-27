Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 375F545FC69
	for <lists+samba-technical@lfdr.de>; Sat, 27 Nov 2021 04:41:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=e8AC7zw9VaWqHFh9oTXKjIKP+LfjR3ai/GUoCPaRAk0=; b=21W2SLFaUGU/2i+UgFhldP0xt9
	P5FFBJZ5SUV+VQPxgHZUuafFQIFrk/x1p93Ot4PJtCrmZnZmJeFqny9q38qsBasxFtLnPKHjvGyXx
	Taudus6SwqgXq4W65gj0ph9JeSOBe2Uo25o5zO6e+luNWcP87wl8fIFJ6T8KRz93SmgZ2jLhwrrYV
	fYE1Poqh5xwi7d3YQGfdR+wSbnU6iqlqb2nZZpopSpSx+ZbLvYEwuSmpFJ13R2hfXJYU+1rV5Grvf
	S/M0iXQwUovg2LCmA+p0z+jQbRguszRHseABNhkHJDn9h58+1FWAKTg47xz8LgVHpWHLJKDBw9Tm3
	7Zb+fhJQ==;
Received: from ip6-localhost ([::1]:28624 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mqoZx-0056eW-MT; Sat, 27 Nov 2021 03:40:45 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:35828) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mqoZq-0056eM-5M
 for samba-technical@lists.samba.org; Sat, 27 Nov 2021 03:40:42 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id g9so6818427qvd.2
 for <samba-technical@lists.samba.org>; Fri, 26 Nov 2021 19:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mattgrant-net-nz.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=g1vVUcrgNcSvw0eltU3RSYshc5ee55J3mzKo1xps9Ew=;
 b=NtzTqxl3JQpOdCE/AVRhxkmFJC5+M18T3lznyx8aLx0U9YmdElFfdDOp/cW/ASwjMD
 3rKaCbiKv6GY43C9lhLayN2iS42OKB2zHbturGcUoeLXmzKQagl0b1T/C028TLOUr5Bm
 2j4r1H6MjRsFs46HNr+iQOIPTu8stRbCBvR9c1ap5vWsblAbEvIiIieSp2Jtls7cfkfU
 EUkUuHvTvUDqsGicz82Bble+WWPOU0/ziyuaavses7k4NW55IiSF0G/y0xo1xG9YOZCv
 87JafmNYU3mlw7QGomhCUJd20JtIRscMOlGebz75tG1uZNILMSHa4HAOd3I/DyR7DDOI
 Ymxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=g1vVUcrgNcSvw0eltU3RSYshc5ee55J3mzKo1xps9Ew=;
 b=veGLlbt75Bu+hu7WxZg3uDdyLYb84JUmEXdwBXHKEP8TXvOonA0zizxhBxxGAj4gIs
 CRQwAXvybOjAQyDocCS4BUK6dujoRtZAMTJP/Sw59BMMa6VJRtIiKAUQV18L+JrPnyio
 bDBaLLieqoZ4UpBgLa1MvfIMPTDzaP3KNBK7hipiodl8EJekCQD2EH07OtFn+5/K/0cP
 2CQbtAjveU+4ALYIHhasKq0I22E/8juW8pxGhcO8MawEVTuMBuZLJPnYuiTX4rja4utB
 4FMD7/g46z3xkjDK9I0JyFyXcvPkcTyaxHwy+TF3hiWC6E3h3xBFpcUcay9b4oRH0sq1
 Jhcw==
X-Gm-Message-State: AOAM533F8GtJAjKCZzv9MEZ04869bV/CQ1shgowd6XLVHJ2CaMqSzlpW
 C/crBZeX3XuCPMj4ko3T9gI5bL4F6FwqC3lBbx8YrNOxDvA=
X-Google-Smtp-Source: ABdhPJy2Axx+CDMCcw2Xpsulm7gE92YLGS+mX1KIJzneZ2Q3hFc90wSH6niwxsPiIx/5XnksTAqLkPgMKTAwc/zrxoI=
X-Received: by 2002:ad4:5f0f:: with SMTP id
 fo15mr16803275qvb.129.1637984435542; 
 Fri, 26 Nov 2021 19:40:35 -0800 (PST)
MIME-Version: 1.0
Date: Sat, 27 Nov 2021 16:40:24 +1300
Message-ID: <CAHA-KoPW_vf-fg45gMWD4poPLYr0jap8rW+73jB5Xu80jKpsgA@mail.gmail.com>
Subject: 4.15.3 release date please
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

Could someone please tell me when this is due?

 Want to roll out a patch at work, but 4.15.2 seemed rushed, with
regressions, and don't want to break my employers mission critical Samba
servers at this point.

Thank you!

Matt Grant

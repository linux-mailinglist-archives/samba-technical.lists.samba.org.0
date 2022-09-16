Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3665BB366
	for <lists+samba-technical@lfdr.de>; Fri, 16 Sep 2022 22:21:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=/p/cBO/XssbkqvUTH9RprLOq5yAZKr5YUundr0PST84=; b=kDyzK4sKksaao66Q+dJ7iqO9iD
	lI1AbS4QW8v1JOgQ9vZb/xX3cpU6fbr5Cy8buGyv72YKY6qbVqj7EX6rIDOQdMvPB7inhNyQVz4dy
	sh+5+BUuhH14QH1pgGg2pauLbsfjGWW6Gg1RVJ2cQOn9dT+ldF2eZLmPaJxMgbSnqfq4GtJxmS9db
	YbeHH8hyyoz/MoPzyyTAau5PUQJ0VtfF2KAZsSFUZEsHGDf3G6L79jtnMp03kq9sWVSQmBOSZbFWu
	7OTrHqC8oczJSLBF1sozuve747JfCYuvV2zhmHcQxQ4nFzsNaLEjZMioFS5jTpcGGCvCcU5R2iigr
	g7PmheDQ==;
Received: from ip6-localhost ([::1]:38092 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oZHq4-001435-8C; Fri, 16 Sep 2022 20:21:28 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:38782) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oZHpy-00142u-Vx
 for samba-technical@lists.samba.org; Fri, 16 Sep 2022 20:21:25 +0000
Received: by mail-ej1-x633.google.com with SMTP id u9so52011680ejy.5
 for <samba-technical@lists.samba.org>; Fri, 16 Sep 2022 13:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date;
 bh=kqh1s4qLyf6VbWUZCrASfIx3UkjRFHI0SieYF+jFAG0=;
 b=XkUjjtoe9clbWn3wuDK7baLg6/+7jxpM2Y/Mh55rdBFDwDOOCmk5ApCmqNEbGGGeKQ
 sXV1vh/spOSWrBwuRXexx8d6rR+ft4fWTizh0/eQW7qokL8GwmnMJvUZF44Kj/kYTtwT
 3lVE0VDC5N8PTp+49+n0AwaPzl75v1uD5fUH0njTxiaGjZBDtKA5/eXA/UbkZ4CVZCgb
 YYH1/sJZq0HzQWlcplCP28MAHRpaFEa5MhcQ/8mKmhVgwj9N2HWFYsNSp31cFf9Ey5da
 7BV5WGS9gSFYBY0L+/sTH92IwoGvTB3AAsovZDscVq9yGod1vEvpG2D0+XTwz3N05o8i
 qZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date;
 bh=kqh1s4qLyf6VbWUZCrASfIx3UkjRFHI0SieYF+jFAG0=;
 b=WCsv1vnbZZ4IucmpJHbCx0KhRkW295//ORFPjvEMHe0gJ+WUIrvbjiAnGja1pjlkC1
 LXc2tPEmcTEUu0xg3ffYCf/1LfIRmeDjVLrjNM8nxjmSiLKYVxslHuLDDcf8eqW47QzM
 WCYW9/fepQRmNJy49BCSHPzmwOS336xgVHORM4Egkk21JmW7ACcnmVT83Ucmk4gXhhCz
 tbQoHNUpCFG30yFcoJTaygKRdcJ57qkiiyUPu8F5ZsQvzwE4skHLPalICRdG5l3j9V6B
 dYMseQAkA39/hMUTN5r6uinxNz9Js8L+mv9PV+GqGZr2TUQiNhXaWq4rPRnbzrxPnL+f
 AJdA==
X-Gm-Message-State: ACrzQf0DVLNlYkKq7SlkYdndNt5yJOMXYWFnoESbjgJOGdf4Ky4HFoMJ
 2LJOaiwz0l8pm4tdq7lQzygbRY1PmrlzpwyI29UXK3B6kx4Y/w==
X-Google-Smtp-Source: AMsMyM72cDeb8f82Hl+eXEFZCH0nWUKzn4h8xxKBIzj7fVa9FVd646Re6eVGNgT+ySrcHTT8EVuGNXem6zfs9u2PNVM=
X-Received: by 2002:a17:906:cc58:b0:76f:c119:acb5 with SMTP id
 mm24-20020a170906cc5800b0076fc119acb5mr4476652ejb.651.1663359677714; Fri, 16
 Sep 2022 13:21:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAPw4iV4nxm2F9TeVvaA=M1Ony92eONtu981WzwUADVBdFET0XQ@mail.gmail.com>
In-Reply-To: <CAPw4iV4nxm2F9TeVvaA=M1Ony92eONtu981WzwUADVBdFET0XQ@mail.gmail.com>
Date: Fri, 16 Sep 2022 16:21:06 -0400
Message-ID: <CAPw4iV7KThffTERmpsWQMv-gJfBRSi_+g+i3xMZBEU-YrXFfOg@mail.gmail.com>
Subject: Re: IPv6 and commit d882add695bbd5ea03961c08ac2c0380fbf2947b
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
From: "Nathaniel W. Turner via samba-technical"
 <samba-technical@lists.samba.org>
Reply-To: "Nathaniel W. Turner" <nathanielwyliet@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Sep 16, 2022 at 4:17 PM Nathaniel W. Turner <
nathanielwyliet@gmail.com> wrote:

> Hi folks,
>
> I'm investigating an apparent regression in IPv6 support in the "net"
> command, and I have some questions about commit
> d882add695bbd5ea03961c08ac2c0380fbf2947b.
>
> It looks like it was intended to improve and simplify DNS lookups, but
> unless I'm reading it wrong, it seems to have introduced the assumption
> that if a DC has IPv4 addresses, all clients will too.
>
> If a DC is configured to support both IPv4 and IPv6, and a client in that
> environment is configured IPv6-only (e.g. as part of a transition to
> all-IPv6), it looks like the logic will pick one of the DC's IPv4 addresses
> and ignore it's IPv6 addresses.
>
> Am I missing something?
>

Here's the commit message for context (sorry, meant to include this):

commit d882add695bbd5ea03961c08ac2c0380fbf2947b
Author: Jeremy Allison <jra@samba.org>
Date:   Tue Jul 21 22:09:27 2020 -0700

    s3: libsmb: Make discover_dc_dns() use async DNS.

    Change to call dns_lookup_list_async(). This is
    doing the samba SRV lookup followed by A and AAAA
    record host lookup as resolve_ads() does and so
    benefits from the same changes to make it async.

    Signed-off-by: Jeremy Allison <jra@samba.org>
    Reviewed-by: Andreas Schneider <asn@samba.org>

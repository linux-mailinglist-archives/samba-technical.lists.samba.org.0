Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5197315842F
	for <lists+samba-technical@lfdr.de>; Mon, 10 Feb 2020 21:17:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=xwdiqmJSYEWJaaEb/gdOx/MD1m+OfSjJKcHqC9Rw2KU=; b=ZYxRFE2WtHVI0SwwIqvErsghQk
	D3ywTXKp5wnq5Vp12oDXD+bG//Rr9vRIx/6s5BJiyb4DFfcD6a42fN4v6CzB+bGuR9z+0leSKcMSe
	QQByNmZ1P+0AjpL0VpHHqRqGe98LOkk9qpXtzfK7Vw1Ax8yFB7O0XYvfP4wbu3QSi0Frckv+bSkpy
	FPfTuqVOmHH0JvyKSmsfIQBDAgBc5UdHEe4vznPx8GATmd5Blq4k+acprI5uzcZ11cJhz93CJsziS
	/9OENmL+Ry61crCpsnGc3wRqQQ2mbn3rsOk6uwUcRmX+/TtSLS8SmLXeH6D/YhO6QzDZUN/oy/gIy
	ybOSR/Fg==;
Received: from localhost ([::1]:22916 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j1FU8-009G8K-EC; Mon, 10 Feb 2020 20:16:48 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:34948) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j1FU3-009G8D-Bx
 for samba-technical@lists.samba.org; Mon, 10 Feb 2020 20:16:46 +0000
Received: by mail-ot1-x32d.google.com with SMTP id r16so7755402otd.2
 for <samba-technical@lists.samba.org>; Mon, 10 Feb 2020 12:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+KO4kRPN/vb4Os+HpkQjJH7/VAXhw0T891EA1PrhN4U=;
 b=DPPA2A3YiMGSNz9eKKG1ZzJPfvywO88C1MOSKDmCSQH4rUjgNscq2efOI8kz+l5yzz
 qTXDWSGKxmhLXbrwIhgZSJm+DqSHT0OxQQmutkK5Sa5oQDPbl4mGOZYV0CjuGvsNaUUq
 /zrd++JXsn2NJ09QcTJeIzKHLBR7Daf34o9CkZ/XgP4pQCcrY4gVPGKF2avWKlzdjAWb
 ljIZO41Xl2F5lLVw99PRQ5rDOQwOtLVtewnv1AwVTGHwpmnZWWN3965bnYrk06U80k1S
 ID21bbDOgVddYl2rkDNI/FYeO8hu4vtihnwmMQpbeXvwMc15s5EGpiBEyfaK6KO4Qpj2
 s7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+KO4kRPN/vb4Os+HpkQjJH7/VAXhw0T891EA1PrhN4U=;
 b=VE/bunab9eNS5LeRMPiLClf+7XxK/mejjwrhA4+stOgmUEyrNAXA+nIadngF8b3VbD
 Wd10gCbv+nuwykbQjxwN7bMTU+67eUMguMCWbKjENU5Hyl92lw6CPl1rtK7/zXDTWUig
 fWtbBgyWe6GK4vpaK5GYxSE8dm3jqLF1u69MrGyD9+1DuVbHhLRSnwzgLLZUVSoJDFj6
 HYxI67AFABEljUpNvKsDLJ3YWA2a+ZklrmerxDyjwuCPXW31wnI4AAudA6SrWtJL7Kew
 WeQ7fxU5sJusGKNmOt+w8msbbnLHJCmipe4QThQtYEJH4KEsWWJK7uTe9/8HBp/8FAY0
 XusA==
X-Gm-Message-State: APjAAAXgGzr9mnf6hICXaWi3zpiDp6cAtkJY8TLJtugyahIIOrrxlyNc
 LRIrsB0csu49mGAly5hW0KFI3EiDVeGHrudjGETqPxcE
X-Google-Smtp-Source: APXvYqydgCfkJ5guStyOf5f6FmiP3NsdDCPp1guyToKtzm0gUT6H3Dsm1MxLbIhGA059mc1ENoJDEUMa/WTZxWDYB8Y=
X-Received: by 2002:a9d:6c06:: with SMTP id f6mr2482767otq.318.1581365798768; 
 Mon, 10 Feb 2020 12:16:38 -0800 (PST)
MIME-Version: 1.0
References: <B14B9A04-A84E-4DCB-95BE-E029378E49C6@gmail.com>
 <20171105085753.axk2m5lsdjns6u37@kazak>
 <CALdFvJGSw9WSm9UtAB32Nqgt=4qA_whai15Fo9C6ypspdKQt5A@mail.gmail.com>
 <20171106094708.ku75kutkm3s6i23c@kazak>
 <441FAF42-21F1-444D-BECB-843F2CF4A73A@gmail.com>
 <509e99ca-dfed-e09a-1da5-f1b0c1238d5a@sernet.de>
In-Reply-To: <509e99ca-dfed-e09a-1da5-f1b0c1238d5a@sernet.de>
Date: Mon, 10 Feb 2020 15:16:28 -0500
Message-ID: <CAB5c7xokf5Fs-hcx=uREuiOb2LO1D3AbDAg+kyGzy+Yvpn_4ww@mail.gmail.com>
Subject: Re: [Proposal] Remove dns_sd API
To: samba-technical <samba-technical@lists.samba.org>
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is used in the FreeBSD port for samba, and is currently used in
FreeNAS 11.2 (though future versions are moving away from). We can work on
upstreaming the fixes and time machine support if there is interest.

Andrew

On Mon, Feb 10, 2020 at 2:58 PM Bj=C3=B6rn Baumbach via samba-technical <
samba-technical@lists.samba.org> wrote:

> Hi!
>
> now, some years later, nobody requested the dns-sd functionality.
>
> I've created a merge request which removes the code, which is not used
> since a lot of years:
>
> https://gitlab.com/samba-team/samba/-/merge_requests/1134
>
> Best regards,
> Bj=C3=B6rn
>
> --
> SerNet GmbH, Bahnhofsallee 1b, 37081 G=C3=B6ttingen
> phone: 0551-370000-0, mailto:kontakt@sernet.de
> Gesch.F.: Dr. Johannes Loxen und Reinhild Jung
> AG G=C3=B6ttingen: HR-B 2816 - http://www.sernet.de
>
> SerNet Hausmesse - am 12. Februar 2020
> im G=C3=B6ttinger "COWORKING" (Pro-Office)
> Anmeldung: http://sernet.de/hausmesse
>
> Besuchen Sie die verinice.XP 2020 in Berlin!
> Anwenderkonferenz f=C3=BCr Informationssicherheit
> 25.-27. Februar 2020 - im Hotel Radisson Blu
> Info & Anmeldung hier: http://veriniceXP.org
>
>

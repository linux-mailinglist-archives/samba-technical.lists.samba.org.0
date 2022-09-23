Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E21A5E859D
	for <lists+samba-technical@lfdr.de>; Sat, 24 Sep 2022 00:11:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=suMXJTpINctzyWslFqJCiIGgHWTTMl99OdtcN1GyRXQ=; b=r90iaBSyg5CANdAc2TkZMMRrCC
	KYSoEs6FUFosNbyLjbmE16TBOrFFmsxa92/y8ZpPqC3zuGce74ISN9V3FHBEb6c7NTt2o492F7BDH
	FZjROZXYjrYsCPzJw5dD/JnHcWp3xOfSTbuhSTm19mvmrgaFzii8e7CsTngbAUfqKT31hd/GduLL1
	tS6s07qQ3izOUYfktMbAJnB/GWnuQRYG0cW+d+vaLK+Z6UE9Y/lvgaeI7aJh7OtjGe8Rl8FcnEUCO
	LcJ/7lILWwhnitlTP67AJ77e5BSGUaQg4pQzZpiz7cJFa53IdmUraCJJI7kzMjc+fZcfdhIczzgmE
	s4QXh1/A==;
Received: from ip6-localhost ([::1]:30664 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1obqtB-003kvi-IB; Fri, 23 Sep 2022 22:11:17 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:36847) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1obqt6-003kvZ-Hy
 for samba-technical@lists.samba.org; Fri, 23 Sep 2022 22:11:14 +0000
Received: by mail-ej1-x633.google.com with SMTP id 13so3390781ejn.3
 for <samba-technical@lists.samba.org>; Fri, 23 Sep 2022 15:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=w6c6KqrLtpbT4s0rXYbVW+ryNj+xPHOALgkOFEoj3SQ=;
 b=ZXlVCqSdP+3jVgisczv7zgNwaXlPiKq+ezAQE8doYjuDSJWauvHXmEul0NqD+WbH4u
 2+Gwj3EuzMskfkEbRRMfEHkMVUhsyyrporLm7Iw0Ra2B7d8X9kChBrQ7KSb5L4r7XMWt
 yepEFqY0CU6Be0fZF7Sdsh5bUuq0SAwAoa82D43WBxrVxQfrTP35ZeeSvnABUdOjw/Un
 0g4cy6yAqiNoMUp9jNdatQEQjIWJXOCp8BHVmnuL3vL3N7KlMNRQXZQCPYZPrhnzwUuO
 ombq8Gmllay8TMskJ+IqO6L/mCNWRZiQihoiTZOY3CsfPREC1v+4M5yrZhBmRl/CUZWr
 HQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=w6c6KqrLtpbT4s0rXYbVW+ryNj+xPHOALgkOFEoj3SQ=;
 b=JrsRoIqdUN447UlkpXnYoWFhLcUsyo3jLcwtwqmmC4y+dpcNxMKuzPShx37GWwWytF
 44xEWTiHrmeoBebL88lJXJ4Unxh7Q5mhz6iGhhfiCsstHsi34gBxB/++9fOK/ChvXCTG
 HOb/zO8oVUCYYhWwECcl4JnMyM/B4Bm6yabc+VEJDsX4DVeas4nMlMpXt94xkrlrzifP
 b18IqdBYruuX7mE+sS5neOqIYF4Xmyb2fJ1dECqmoNeLFdLvWILSVC0huWaX7+9znr+P
 EaeNx8lm1KpAfAPEBW9crKWwlGhw0aJlGM8+9Rxv6wm+lXDFD0UtAhZo4zZPEAVpPNRW
 GipQ==
X-Gm-Message-State: ACrzQf1zfsxyFxZANcUlqlGz1uzj3+R1Bjj302bunDelvg8X70VH3678
 xZdgI4Y1Np0cxlFnZOPSaFLdQjCfoz6VpV5IPVu5KjWISro=
X-Google-Smtp-Source: AMsMyM69E4OaP/ZbT8KWs7WinfQzR2oH7BZPgcL7OYCGmwVEHjuT8R2csKLReHvbM472xrlxUBaOEU6cYySer01ARqQ=
X-Received: by 2002:a17:907:272a:b0:77c:d7df:c9da with SMTP id
 d10-20020a170907272a00b0077cd7dfc9damr9236549ejl.332.1663971071637; Fri, 23
 Sep 2022 15:11:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAPw4iV4nxm2F9TeVvaA=M1Ony92eONtu981WzwUADVBdFET0XQ@mail.gmail.com>
 <YyTdlsd2ExgX8U9r@jeremy-acer> <YyToAYaXsfopiTdh@jeremy-acer>
 <CAPw4iV5LFvdoici7f5opBUA5bz86QG2cX9muzQ8GDsMU3RcW3Q@mail.gmail.com>
 <YyqQ9HtsTM2lmkQF@jeremy-acer> <Yys3/WVPd/gjBbEi@jeremy-acer>
 <CAPw4iV4AH7e4odCQ=xjzG-bAcr=5mGVPFA8qf18WBz8wun_SLQ@mail.gmail.com>
 <Yy4uev/AGxGDAJB4@jeremy-acer>
In-Reply-To: <Yy4uev/AGxGDAJB4@jeremy-acer>
Date: Fri, 23 Sep 2022 18:11:00 -0400
Message-ID: <CAPw4iV4xM0FEvPhbY-7S-uSdF9StW1ZeSniA1qoxzdNh9MdNDA@mail.gmail.com>
Subject: Re: IPv6 and commit d882add695bbd5ea03961c08ac2c0380fbf2947b
To: Jeremy Allison <jra@samba.org>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Sep 23, 2022 at 6:09 PM Jeremy Allison <jra@samba.org> wrote:

> I'm getting 404's on those links, sorry.
>

Sorry, I had inadvertently made my fork private. Fixed now.

Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FCD53A2BA
	for <lists+samba-technical@lfdr.de>; Wed,  1 Jun 2022 12:37:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=AQi44B2cyvAljx6y7ZAphCWeYnUhXYdoIfWPJtl4tR0=; b=ZOZusW3uwIqG8pWtY2JrDAEKXw
	SZwAvlD3/dG1XeS+Z2n+gGTFt68vznXvwnZbU+tOW2c85OzyA3DhiL/zQoNgxvG7Qxr91wI674j/5
	Wi/I2Zf2QSMvPLaX2TM1nHmtAvtHwxeN3G897AJEJRMDb7/+90kUN4ROWqCbWzbKZWz0LbaF/uRnH
	FVNsJMEJUVfPk1AQn3nODAgQt2jH9vvoQ9uVBp41g7RcJeGHwm1ShKYAUaObLuhyGPrfazJ/f/jTd
	Aw26iF97ulXQ0KQNIo04AeUFww3qdIVsahI1wP0WXyojBbUP3HCh3qYMNx/ctO9Mwc1261gqrGEgQ
	ITBI+GMw==;
Received: from ip6-localhost ([::1]:23450 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nwLj0-006IZT-NC; Wed, 01 Jun 2022 10:37:14 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:36658) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nwLiv-006IZK-ON
 for samba-technical@lists.samba.org; Wed, 01 Jun 2022 10:37:12 +0000
Received: by mail-oi1-x22a.google.com with SMTP id u140so2098802oie.3
 for <samba-technical@lists.samba.org>; Wed, 01 Jun 2022 03:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=SYb0sstOCC6Vzkbd1SvI/w2/NzzzcI2sNcBMSQMhYLo=;
 b=LiW7wRLzvv6HT9Vcy9bRA7BLYuzDOsNaRIl6dXVkCN8GAC8CVibPF16SMUhXY0ZHzX
 smRgM8uxrHOeMOxH+A5nEGZyXSOhAGrvwnpfNWxykvgPPDR2+hqwHWa3TKbQAvGoB8+w
 p9LcBu98JorZEjfcTWehyzXMLCXWrHvnmG4xQ8xrt/vt6ObBQfJK6xf2YTwbCD5j3etH
 0ssKyudfDRH3RLzuXt2hhZrqh9Wsayt7nAw93YZM8x8icZBqQYJ6uRaQYSPdmUnPRt3P
 h6u2Tnut96xyFVW24Mb/BeCyEVmnZjIEnsMW3qtUI8WvLyiQwvpFCePeb7CqkXjGlNEy
 3ctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=SYb0sstOCC6Vzkbd1SvI/w2/NzzzcI2sNcBMSQMhYLo=;
 b=LGBs0gLL3iKppd+au8uT72wd8g77QBo+zncD1s+r6TS8DNG5W5ZWQOLBnjWBevjZUx
 +TnFm+I9cogUQK10PT9EnPK/sG3amOYcrjHxnVPnTRB5XABxFiEq35HUO1d+Va3j/COv
 5UO+HC1KZKVI7SegbjnILXEsMfwOqHH+XF+hA1u70Yf7A65Syg0pU9R8TMd4L0CXOoDF
 Vgfnf4uIiKNJ1FIAy6BQdi3gr/KP1uIATQj75076rBCW0D64MbXiOHosvIZSa7N7j016
 +5Zct1NLBDhklKHByee+CdLzkCbOZ5MVQoxBRYl+8v/Ky7GfuzCDev/gbGNqX2ZTKhby
 +1+w==
X-Gm-Message-State: AOAM531KhUywwrTjlkxk2Sg3XtvKuylRWYQ0BWd0+V0ryKfpstZsJ9jh
 ehDVen/4Vf7NTXKfMzto8M+yKBhpv/vyzdngUmKj/N16OzPd+MU2
X-Google-Smtp-Source: ABdhPJwpWzrmX97khJyTzCpG6BLDPyZfl1SYgj//dTGztHfv6wPqx6wuz61P4hEUm2e44CI2X9fPOYCgk5ZGkyjce4Q=
X-Received: by 2002:a05:6808:309c:b0:32b:32e0:661 with SMTP id
 bl28-20020a056808309c00b0032b32e00661mr14780557oib.113.1654079823818; Wed, 01
 Jun 2022 03:37:03 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 1 Jun 2022 18:36:52 +0800
Message-ID: <CAOTDyrA-iLyf6+mNbRztaLY_8qza-Lbc4dB0ZHUh=aP_iGhJng@mail.gmail.com>
Subject: Get local administrator info when samba-tool domain provision.
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
From: oscar qqq via samba-technical <samba-technical@lists.samba.org>
Reply-To: oscar qqq <smbhywu@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This question is about program flow.

I check the debug log when I run samba-tool domain provision.
Before domain provision, there is a local "administrator" account in my
system.
when I run "samba-tool domain provision" , create_token_from_sid()
(source3/auth/token_util.c) inputs domain administrator name
"administrator" to
Get_Pwnam_alloc(). If local administrator account exists, Get_Pwnam_alloc()
will get local administrator account info but domain administrator info.

Is this a correct flow? or for certain purpose?

HY Wu

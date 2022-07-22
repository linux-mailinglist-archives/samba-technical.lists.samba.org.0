Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3065E57DA91
	for <lists+samba-technical@lfdr.de>; Fri, 22 Jul 2022 09:03:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=EpcYbDE7/2KU27KxwJieyazUqKaCxCPio2AYQ9S6IuE=; b=Ej3dzo4B6GDXLvAPbAmJC94R53
	FzofUaacBLbxgR9NA123Wpl2cX1nUnoTvhIEbtSt1Uf1eN8+nxZmUzcfsaq3QQcxlICezJeBaKT6W
	PSD35wtuxKbCoAkXYgagBzgR5wYjce3MVIxQrK2w5BHd5E4IM1nKOKU2ovEQ3Y8m+sjMpXMSjC+KE
	3CeoPTCuW+chIATV4bJW5Qt9kGl23cs9/NdNYiP/+aGeTLMHN1Vns14oir+iv50sFf6yo9ZV/ucRD
	X28s6WxvlRjkjJZYmL0fylLamlgdNZ6/0fRtDHrQWdka2CwqOd3Ih6pHyOYRTCC7e4Q7upCyqLZN/
	tzNheLDQ==;
Received: from ip6-localhost ([::1]:59126 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oEmgR-001dJn-TG; Fri, 22 Jul 2022 07:02:48 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:43680) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oEmg5-001dJd-UR
 for samba-technical@lists.samba.org; Fri, 22 Jul 2022 07:02:29 +0000
Received: by mail-qk1-x731.google.com with SMTP id o21so3006151qkm.10
 for <samba-technical@lists.samba.org>; Fri, 22 Jul 2022 00:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mattgrant-net-nz.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=sxWHuai0MKjCHbIAbiIZikFGf1kwWGJe1AT2tp+QOos=;
 b=mHtlwAHTbZXnUcnMvIQxUb4VSibSx+YUGmX9Mt5sbURylcVRxQrQuTepN5rWQwo/oq
 PviwD/btMhT3VzCJGuiIfCMSTMdKObkECDf0/a+533o0ae9YLFovWzoayWnFOwQlMYHy
 KYaaQdlt1ansYlbAuta1ftgMvwQ7d8hPda77auwnWuJRUMxKCxIxSFg09naodMEKO46O
 Z+xIEGtJ9Lb6JAv2eAWcQ5i5yRmD6XNVL71JAzXcvf4B8/LJ18LJSpz15wsSFI5lxeAT
 iAnv2QcXaq5a7I7sMXXZcILklrwbdRVPtZ2hF+9CkzScVlyO7p7FIOu8YQFU9MuD5j4B
 KRmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=sxWHuai0MKjCHbIAbiIZikFGf1kwWGJe1AT2tp+QOos=;
 b=g28cpcx0h4A32xjHWBe7yu9cdDMfEV2ZPvASOC8uFKga/wducfs/LWw29OnGoczoTi
 NDIM71bN6vfixbrLfVhQ0/8ZW+xT7m5IvooE3PV7YXWbZL3zj5kWWUpb73gJkx5BwDOR
 15ERQkHRIxjyBuXyE95IeC3bhSr3ldHgF8Qmujw1pmtjoe7WuG4q/HqAEg7gGrqSKczU
 oBBe2VOzgCGT7ilEt9C7ZgU0gdrF3X2gasF9fyilOu85iT9LEtT4i3FSK5nM6FC3QMgb
 Ftbs76cRvLCLXM5Q94tdDLdWVKsCol7RK8KaUp4fQWu80Kh/HN69M9+4xKgmzuOcWIGX
 X1Mw==
X-Gm-Message-State: AJIora/B3w0Tx2OzaOpAyAvDtDu682mzf4NglZmMP2mTF3s2ZNjva4/m
 1Esvud5GxlRG8XOgDn0uHDjD4uaLC1bK90fvBIFHCdyW4+RJGA==
X-Google-Smtp-Source: AGRyM1vxV4ufardKeCHgU/09Cr1wR1jDdetmiNaNs2D/3j9b5FZQbpEDCf6u4nGK5HILz7yndgPABBTHK6QblFZKk8c=
X-Received: by 2002:a37:8903:0:b0:6b5:5a5e:69b5 with SMTP id
 l3-20020a378903000000b006b55a5e69b5mr1504706qkd.406.1658473331776; Fri, 22
 Jul 2022 00:02:11 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 22 Jul 2022 19:02:01 +1200
Message-ID: <CAHA-KoMxMB60rhaU9YPBPTvG0HE0A_4G2L1-MvZ1rOnrHJf65A@mail.gmail.com>
Subject: Merge Request - DNS updates allow/deny for SAMBA_INTERAL dns server.
 Help PLEASE!
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
Cc: Uri Simchoni <uri@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi All!

Want comments on code changes, and what further tests are required for
Samba test suite. Its been some time since my first MR, and this one is a
major
for the required test complexity?

Uri, would you be able to help me out again please to help get this
finished?
Thank you!

Mechanism for DNS update host/rrnet allow/deny lists. Three functions
dns_update_check_access(), dns_update_get_caddr() (gets subject address
for check from A, AAAA, and PTR records), and
dns_update_ipaddr_check_access() are backended by allow_access_flag_lo()
from lib/util/access.c using the already existing host allow/deny access
mechanism.

The motivation for this is to control what DNS dynamic updates get added
to the SAMBA_INTERNAL DNS in SOHO setups. With out this IPv6 dynamic
addresses from your ISP IPv6 delegated prefix end up in the AD DNS,
even when you have specified an fd00::/16 ULA prefix or RFC 1918 IPv4....
The dns update rrnet allow/deny lists are used for this, in combination
with an interfaces = lo fd14:beee:baaa::DEAD::BEEF/64 statement. Forward
and reverse DNS zones are supported.

Support for clients NOT updating the DNS, but a router running a DHCP
server with a dynamic DNS update client was added via the
dns updates ip auth allow/deny and dns updates allow/deny parameters.

Thus this patch gives SAMBA_INTERNAL dns server the best of both the above
set ups, making it as flexible as using Samba with Bind9 DLZ.

How would I test access lists for update source, and
auth by IP number?  Can't see how in test suite to bind update request
to a source IP address.

Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 342104EA4B8
	for <lists+samba-technical@lfdr.de>; Tue, 29 Mar 2022 03:41:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=BAWUDnOdTOAh1waQmXoH3Z7hfr4U4IwrkU9iI2X+FJw=; b=pzmRBXGJH38Jm6qeY8RsMr19oR
	gSrioBqVrk67ezf7JT2p4l1rj94+bmDYfMkVV1iSsr80e9qs9TkYnKqKQhiGvH4oerKr9SRgC8p12
	uK1ffKwwHe9fU8r9iHQOVWYzSWdQd+RFai8koxMdYxo+innD6UojNWi771KtsM5z5uTZ5Ii7UabEp
	MIqWgFs4knWJVvFQGTC12Op0dple9XMPZtkcgzPyjIbBRaJQ009Eq3eCG6dlDWxJXRgGCSMbl7Iuk
	sPLvDepmYqt4Pq7IkVZc+duUj78X4bu5kudc3IbN/1uIq8ijSQ2p7vSrpTdGu4xJkg1I+Tx3DD3t7
	erDMulnA==;
Received: from ip6-localhost ([::1]:22578 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nZ0qO-006AZi-IX; Tue, 29 Mar 2022 01:40:24 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:35565) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nZ0qE-006AZX-0M
 for samba-technical@lists.samba.org; Tue, 29 Mar 2022 01:40:18 +0000
Received: by mail-qk1-x733.google.com with SMTP id g8so13002525qke.2
 for <samba-technical@lists.samba.org>; Mon, 28 Mar 2022 18:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mattgrant-net-nz.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=8eeAVEQUG9ffjdiCCqxuKoBI5VLcQSjthXJrwz9H3wo=;
 b=KmX30ON6ks/Oqg4eLGeUEjxALT0/sIwCbuSREGwUiAANG3SL5BfiFf8GBLaRIxhMiz
 K1f4l8o8tGbu8BnirqkcivCPKsn/DfF+yc+0vAXaG3nuPtxo5hcYaiO7whJ2lhHweKcQ
 MSurTLmsGtfZ+LkHLwiON4DxgmOfBxJCx+nfLs0mrMGgWmTUWc3xpqiuPIctB5M+xoRQ
 7W1Y38Lu1bbCfInS7BsIQZiaMfujiaggs3tlya3rgsC4VODfgViQQQGbplQOfoJ9P8HI
 0sZL0zJcw3gcU+EAc0fyCbzxJHjwE/esOHma0JoAQ9mWWI/fIYyNUq49GumHT7RTZWrk
 kSWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=8eeAVEQUG9ffjdiCCqxuKoBI5VLcQSjthXJrwz9H3wo=;
 b=TGr3ntcIOiVr95UTcNwMYAOPOSVHgRQEK9F06cAH1W4IfaK9B5CsLjSCK0/xbfpNMb
 kTs1Gv/mmxSHQwpv4kIQHEPekIZesUX5Zk33TpyAj6AL65t9qgE2CndIFWVpKOWUHcRZ
 F662QE9g3epWPn12TQcNhc0Kef6Uu+dvLnz79qYRx/O1cbMUAVeIwO71x/DAKHIfj/WM
 fZBwrIXRNfle+OGjLVympZfribdVDIYTUWNYHXATR8gYZCbk/8E5bJENkc/G0WXTn9IN
 ZhHPGLy5cjXNbCGJPAjUihHw+THzqjZZlMyhgov3kaIvO/Kqea9BvoXiUs74kEYUW8Mj
 Co6A==
X-Gm-Message-State: AOAM532o7yZ6T8k+DQvmIKdyIlxlKkGESD7BJ2hB6y+EZr3ecz8IPHbr
 s7EfAYCqpisFJGGKXVFHkqBK2nVWjowbZEHnxnisgzKsCEpO9w==
X-Google-Smtp-Source: ABdhPJxjqN1T2q8xDuNjmHNnovG5CAGdna3vJ1v2ainIF4CD1HE5AaciQQteIOtNvwyub4jo8lbUQpSOPx0pjfW9Uuo=
X-Received: by 2002:a37:b5c6:0:b0:67e:6516:f456 with SMTP id
 e189-20020a37b5c6000000b0067e6516f456mr18224294qkf.555.1648518011059; Mon, 28
 Mar 2022 18:40:11 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 29 Mar 2022 14:41:26 +1300
Message-ID: <CAHA-KoOSMkK=CsqE5Z8uaTYpK0tDNPAmXyLiF6yoh7r0hFkiEg@mail.gmail.com>
Subject: Samba 4.16 build failures
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

Just trying to compile 4.16.0 for my debian servers as a Debian package,
from debian/rules based on actual Debian packaging.

Keep getting lots of errors about GSSAPI_LIB_FUNCTION not being defined....
4.15.x compiles.

Noticed that heimdal has shifted from source4/heimdal to third_party/heimdal

Could some one please enlighten me about how to get
third_party/heimdal_build/include/gssapi.h to be used for package builds,
with unbundled and bundled libraries?

Thank you!

Matt Grant

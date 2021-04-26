Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D5136BA89
	for <lists+samba-technical@lfdr.de>; Mon, 26 Apr 2021 22:06:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=2P9GTIbxUSS8XdidfH/uq3wmjbM+rfQZN+IxB0busXg=; b=vASFT1RK5Vz7e9U1xNIYo5WUzw
	DvyPtjwHHmQulbia3BYPNeXazYXpVWsc0nLbo1dWdZxMraJCNu0ttbY/ElR+Hs1OOtuczYYnrY1JE
	z/L3Poi/KWpOk5Z4O0eabeTmmdLo/AMN8IRW/Sv2TgMQETxB06QoNxDPHYh2Cba4zG0S+cs+S1xb6
	r/7t0zE9RX738cRwIhlXufs+tte6qOWDH2/7ThbSW+qXYVffAHg8lXheFW8keyjZZs4+DZ35sYe8+
	JnOB5LsyKUQ5w7wiOD89p/Ml1nlNxC7yzCxM/7ox1V4mU/udP5pKifjnwWqfTBPafFtsOdo/gGQ6n
	/f5U8UCg==;
Received: from ip6-localhost ([::1]:34112 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lb7Tv-00CYWt-DE; Mon, 26 Apr 2021 20:05:23 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:46831) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lb7Tq-00CYWe-J0
 for samba-technical@lists.samba.org; Mon, 26 Apr 2021 20:05:21 +0000
Received: by mail-il1-x130.google.com with SMTP id l19so7096395ilk.13
 for <samba-technical@lists.samba.org>; Mon, 26 Apr 2021 13:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=u9USpSUqPpw8dJYQbLUwogJ3mxg+/cxkIditxdw0yCA=;
 b=fHxFiCrJt2/Lywdm1psU2b7yV19VpUkAcXYQiRhIPxxCa4J2qD3j3xZ7M441FxXfbn
 ajXdBhrBWdgb1s+qFkW9aSLBpahzqZkgd6oXZXHxsdE0DQdyFODq15ALtLtudNZdNUbT
 vbI4gnMU63rCJtPaWMLevccRgpfzt64bc2lQv1sLzXivyMhPdWvPHj9uU+kmltGh6kDg
 ptHFJiCn1U9UJHMGiukAbLEJAhf4lSIyix0hbJnGZBbcyG3EY/M+iXNUD4LNPGgy8n6Q
 ihhVWKLpzYmYJTJTXK4LMSfz8sWj0DKmMJoYRDoqn1cUsBpKySK9kzprMf5Tq9MHZKE8
 VkIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=u9USpSUqPpw8dJYQbLUwogJ3mxg+/cxkIditxdw0yCA=;
 b=TuSFTs+9CVaPPK8sVmFB9byI8TcPrUCBixeY62+Z7fJTx+sP7eexX8jUdA7pdqY4pI
 7YBP6KhBiBpgwsRiexlyLVcex1e/5wJDYxzdpyKFtkeLXihXuOrEDDNFenI9kjDvXHDX
 Ho3nT2RPu8WXWJw59UM6v+kvaZ9TYUT1BthKSTJCgNpeVVctqe5Xc66X+0INpRBfViKQ
 kjZF1fFZEdt9t7bq16EVlbb8IsoMjm8oSz7AQ7AEJzveeDzXa7vdpGFx6kz0/1CJ7BM5
 h17mRehh5SwTHmN78JcC6CNte+hp2u/2XK1vioMjFSmvo4iMbpV+lP5tnMgbOsDdXDO2
 UutA==
X-Gm-Message-State: AOAM532mIRF8fZ9MKPKy/5pjWlKm6+XgxRGLswN87xI1d7VbbrP0Yup/
 r9Fiu0rexzu6eUG1eh8I1BNpJ46YpTMAYauC3flGqNfNlg4=
X-Google-Smtp-Source: ABdhPJwUd6Gty5n7IJvGjY5YkUgHGEPZ+xr7ZF1+HmXIjPdqaSF9KcPdZGnpPYSOODoiv8YvSrJ9o0dI8HbXtNv/wD0=
X-Received: by 2002:a92:d650:: with SMTP id x16mr15228283ilp.223.1619467504925; 
 Mon, 26 Apr 2021 13:05:04 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 26 Apr 2021 23:04:54 +0300
Message-ID: <CAG9bPH2WFAD8UWkF0YzjgjO3xhbQH57MWFxmSwkLxQ+kSM0vpA@mail.gmail.com>
Subject: SMB Multichannel for linux clients
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
From: Dmitry Martyanov via samba-technical <samba-technical@lists.samba.org>
Reply-To: Dmitry Martyanov <dmitry.martyanov008@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,

Tell me please, how to enable smb multichannel on linux client?
I use Synology NAS which already has smb multichannel support and its
enabled. For windows clients it works perfect without any additional
settings.
But for linux clients smb multichannel doesn't work at all, the traffic
goes through only one NIC...

ps. sorry for my bad english )

Best regards!
Dmitry

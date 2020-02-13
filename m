Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B20E315C84C
	for <lists+samba-technical@lfdr.de>; Thu, 13 Feb 2020 17:34:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=TnR330W/oFzUVsVI9Q26VPsSEdvufVwqCuEGf4fNz1w=; b=hgmmZSKxHmMBxAsFDFvlHW0OI4
	i4+VRkksCNYsN6h6ykoYUzyLvvl8DmZowtlrpzH+i1t7+mj0nVTTfst+X+u3pLIvd6ZHXnKz/xdd0
	VsxT7UEmDRXhRj7Zt/0+emkJp0aBsF/WUHnj6Fys/f+RQtNRb9aCf7/H+YKPIjrVgy3OKNeBRHNJR
	OhRtlRj43DFsW+v5mtAr6HbBJTA2TB+TRkeBXeURy2egIsJyBNu+/juYO88XrQcZrfNIRQrV2TR/e
	EZWFr99VIzD1t/k0GkfWMbok8ENkCEDFLxEhZ4APMPt4mNYa/Rop5V+IjtXyzalrad8iXGwGuSxY7
	kCJ5qylg==;
Received: from localhost ([::1]:62860 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j2HQN-009kUg-Uv; Thu, 13 Feb 2020 16:33:12 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:39531) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j2HQJ-009kUZ-4C
 for samba-technical@lists.samba.org; Thu, 13 Feb 2020 16:33:09 +0000
Received: by mail-lf1-x132.google.com with SMTP id t23so4711262lfk.6
 for <samba-technical@lists.samba.org>; Thu, 13 Feb 2020 08:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=keepertech-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=NqIAi63jiy/uAgn1sI8Ta7Yd83hshXT4UfTWTMqD86k=;
 b=Augq6oLHDvd2zXvxN6xEsNJILdsXXsmqtpyGJQIPjOh2OhbAtQa2Y2V3ae8npY3aie
 CDfpR3fBsLyHOZnCRt7ojZ42faZQFkOQKIk/RNtwd4eibnsTVM3sSpWfJ8NEpgKMNC6q
 3C3bWnQ7MZ54c/7mdQNRsUfO1G6P52yLyfSteSOGw0WePiG1S25zw2kkiqvPle6KE4s4
 r2lneM/N6pBvg/d+wnu1LGhKVgo0PU7+NKeQuCqn2GMNPn/ylx46WyK/InVUKV+3F3tg
 TbRLIFTMbHevatpyVisUpdlmLNdy0ro4XSz0+wHuUsweFgFfF4C+O83ucVAG6TQ8M/Qn
 XyyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=NqIAi63jiy/uAgn1sI8Ta7Yd83hshXT4UfTWTMqD86k=;
 b=YF14pDtde8WpV+j8k9hbDppEw/IfMBj6HHSDmwFoK9iclordFLNpG1re0HLVZuOO0m
 lFJf4KLfyBs5kZKoYjtAtV4bbzxVIN3FCbjZr3D5q/Ew3Gqa7pdfGGbFwFPPOBtZcbcr
 jnl3vdKoFelyiucXlmgWMZdl837Hv5A6+jqpjlhMXMvwSRbVuJLuJupScQbS8oqP4APu
 gbA99g78wcPy2sS6/wDI1F567AzfkOzn3jFXZ89BZYXtM5vOXqdw0ZLWLXlmo0FvMfqr
 uWKR5igOu3MQlTUlBDyMg0cr6sGMy6MTT4UoAuuYKEiqkBCrkRy7pJFcVZbWc663WDba
 wuOQ==
X-Gm-Message-State: APjAAAVA2Ly4tSLNNwiOMryxZkzaSGzQHMEkNebKtZHz7BzgI9/+QEke
 F7w2qiRD1flBGUQhu6ccTCSLUm7uBglcNVbtpu/uT45B
X-Google-Smtp-Source: APXvYqx/8O2mrmyyuNrU4+UtpvmYzjF6mX3HQ+gAeZsuKCpahc+inAKZkqevsHH2PSjk6rrNALUyNM11Xs0wfU4tXuI=
X-Received: by 2002:a19:5e41:: with SMTP id z1mr9972385lfi.101.1581611585795; 
 Thu, 13 Feb 2020 08:33:05 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 13 Feb 2020 11:32:55 -0500
Message-ID: <CAGbviv+X9gYosw0QmeMSqBmbwkfc4WtBVQ9h3X0+meBEmXQ7PA@mail.gmail.com>
Subject: ctdb failover problem
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
From: Wyllys Ingersoll via samba-technical <samba-technical@lists.samba.org>
Reply-To: Wyllys Ingersoll <wyllys.ingersoll@keepertech.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Running 4.10.13 with ctdb and 2 nodes behind haproxy.

The ctdb configuration does NOT use public addresses (since these are
managed by haproxy).

Both nodes come up and join together successfully, and one of them is
joined to the AD domain. The problem is that if the node that is joined to
AD fails, the 2nd node doesn't rejoin the domain and so even though new
requests are routed to it (via haproxy), since it is not explicitly joined
to the domain, clients fail to authenticate and cannot access the shares or
services.

What is the trick to make ctdb automatically join the domain when a
secondary node becomes the primary?

thanks,
  Wyllys Ingersoll

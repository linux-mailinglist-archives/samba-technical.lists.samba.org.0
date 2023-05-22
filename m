Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B4970B30D
	for <lists+samba-technical@lfdr.de>; Mon, 22 May 2023 04:09:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=dn6BkggV7S8KDOFMBJJveOt00Wl3O8QSoJ0+P9Ia9Kk=; b=RFfmOpMt7SrkFlQIrNIuBz1Xxs
	EABs9CNAgEmmDGqM60bGrJUir5XOtdNJR8Cqf9lGNQVeIf6FIReFNi5rU+6s/RB/7J6x4C6d9Yx/N
	s2NCI+qSzyMMDTJjwkw2FMm7ifBwks350X1si04UpsYs9Jr1GBd15Za2DZ0VpXu6BPmpjgFAEjdzU
	VtG9I/A2L54jep8a/nTFFa7PQpXv1ekEsX7OQ5F6zdWMx3I7/S//6Davlu6A0NExiaIJ0aYK59N6J
	HO1gyEDAX9y/E/l/FGlQ1hsQgj2ZhyM5CJIe91J64TQ3f2QaovZb98O2LrAk3bnjkgDOPV5Oew2Y9
	cIgYJngQ==;
Received: from ip6-localhost ([::1]:31886 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q0uyb-00B6Ej-69; Mon, 22 May 2023 02:08:45 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:59716) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q0uyW-00B6Ea-1U
 for samba-technical@lists.samba.org; Mon, 22 May 2023 02:08:42 +0000
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2af2c35fb85so22073691fa.3
 for <samba-technical@lists.samba.org>; Sun, 21 May 2023 19:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684721318; x=1687313318;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=dn6BkggV7S8KDOFMBJJveOt00Wl3O8QSoJ0+P9Ia9Kk=;
 b=IYOJmPu2xocwkze2g5QBahnyXgRKtkG639wq3gEHBJaYw2cvEiLMBn6KqrwuICadAH
 XkMPWdMZ2j5S9ZtKapNon6rPFG6KRJfV2rrADdfv5QN3+B5TJr5Hjg/rce5Ou2zOO4+0
 KhYB8GbPiVkv2RNRHnciJwWMAVCwQ89Ge/WrQt1aomeDnEzda8RX8WyXSAtzIlZD7GIn
 gGUe0vy17PpYGCoNTjEHFjRbmMjBAZENGmNdwskkEdyknPQGT/tpgkQn4rikEy9jPjTv
 E54KKCslVXWwQ2etQndLH4gx/h9XnpxT0a9TtI3g/FF22V/aiWbCzxw4DzmtJHkqGVVa
 L32A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684721318; x=1687313318;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dn6BkggV7S8KDOFMBJJveOt00Wl3O8QSoJ0+P9Ia9Kk=;
 b=ZD4xGKljRdjbd3AvLF7trSHr7jbXTq2imi93sgqfwcIylEIHrwV6noSUbDIhrhas+g
 xV7iGfc0jykFJ0YRMPF0xy6xz+xL0cmmfQCGtpPgCwKRkiZudco0DBuPdV/GD8ShVrVG
 IVnFTN70GP8WYVfvX3raBMy9XFbNbxy2M30nWJbf4a6W1GZMR79pVdLL57ZiJwyjl6uV
 +rw0wHbuNYv8G1bPe0LIRwI8FpH6oP/Kf9cxIGuFnIq9OSv5zHZg/VSGw0al9jOLqGYd
 X/he54jiEqplKhKOq0EbUBJfHMdjwMjuWKllG52vNfbxpFqdH+txtZZ4QFekAKBjmVI7
 04nQ==
X-Gm-Message-State: AC+VfDwbTx+J7mf60pfn1AnZ02aUgzjuvymUzXkZehl+D7unkBg0iuVT
 qZXBXSJ5hSZBKK+OkK/EbghEBA18cQgZHLZvRPOMQv4+i8E6cJSm
X-Google-Smtp-Source: ACHHUZ4Mm2m5miUdWH7RvdE6gHaRxyMnYVbENQ6K6QrU9IWF4Lu11SIC3nk94k6UtJAKIbEqsODXpdB20nlLWN0dQko=
X-Received: by 2002:ac2:59d1:0:b0:4f3:822e:f025 with SMTP id
 x17-20020ac259d1000000b004f3822ef025mr2968146lfn.49.1684721317352; Sun, 21
 May 2023 19:08:37 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 21 May 2023 21:08:26 -0500
Message-ID: <CAH2r5mv8nAncg-f=Z5u8LkH4o7kfJLJdtoksYQgiguF7efKZkQ@mail.gmail.com>
Subject: Displaying streams as xattrs
To: samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Looking through code today (in fs/cifs/xattr.c) I noticed an old
reference to returning alternate data streams as pseudo-xattrs.
Although it is possible to list streams via "smbinfo filestreaminfo"
presumably it is not common (opening streams on remote files from
Linux is probably not done as commonly as it should be as well).

Any thoughts about returning alternate data streams via pseudo-xattrs?
Macs apparently allow this (see e.g.
https://www.jankyrobotsecurity.com/2018/07/24/accessing-alternate-data-streams-from-a-mac/)





--
Thanks,

Steve


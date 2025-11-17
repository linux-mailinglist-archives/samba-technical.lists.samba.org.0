Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A13AC668B0
	for <lists+samba-technical@lfdr.de>; Tue, 18 Nov 2025 00:23:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=/jLT6Heq/6v8chNsRp3hf5tHNTPsmeZ6moEBtPpIEXM=; b=Qmy5U+fZJWmoxMZ354YPzIDdWp
	byJsdCkW6KUh8zfV/WaR2kxmU5P5U4QAQttJX7Iw3QRKRXRJa8/YBmOT9xpKsmB/Cm3BR2xnsPAhF
	4LDfwHCI5XJv29TX+TqPtDuHe32OJFmNV1NJqkgWvAoEPWkprr1Yn9Mtxq3k0yNkOhuItLAgGHvRI
	awjztGptLMyIs6SBxPAozxI7D5jeANtNMybKl/PzowvUzHDRWnIcmiNZFRq4bKUs7BaSmE68XB0KF
	FRMGBI1/9t3NzeXPWmT+Dh8Oyrbl575ACN+Pjr9OUqNYlmyzgj7qiEHuLuExroEaQ9c5BIdDlbwZ5
	JM7Gsq4A==;
Received: from ip6-localhost ([::1]:64972 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vL8YS-00CTnh-4V; Mon, 17 Nov 2025 23:22:40 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:52622) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vL8YN-00CTna-Te
 for samba-technical@lists.samba.org; Mon, 17 Nov 2025 23:22:38 +0000
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-37ba5af5951so40724951fa.1
 for <samba-technical@lists.samba.org>; Mon, 17 Nov 2025 15:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kacper.se; s=google; t=1763421754; x=1764026554; darn=lists.samba.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=WzNTqzL8iKeChBubpTlTVI5fWkmdvLieTxBksmdMfKU=;
 b=ObppB3bcwCIjr9Q/bDdDo/czxrIOCR88Fyj47vsAOC9GXpawAta6C28+B630Ik6XAj
 HYaGDlUvOWkVZUB5wK0LyZIFOQhQk4CKSnYqLoJRDCnHc751HjsuowqC088AHUUNS5pZ
 nMleZ1O2rHX93HRKiXG18aykVe7TxR5aC6f0+NJRYaCPtkwoy/dlm2DNFBHB+zd8S9Il
 iZM6PO+tYCs667Xz5v5BRqlhLxfA5YT1JDkWhiXmdeWnRCcLqoyDdMwL9Ha5TN75iaWT
 kkBFK3WH+aCM1E1GvN/hyEa4zmYZxaEjbuAN2xy1Oo69Ufx2RsEz+aKdQyv7+kiFFdpx
 bbIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763421754; x=1764026554;
 h=to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WzNTqzL8iKeChBubpTlTVI5fWkmdvLieTxBksmdMfKU=;
 b=PM5rR43hU8zP5YaCz9fSD9xG7O1VeBz/72nj+XW6GfIHhmCACUVeZCzyleLAJjqqX5
 fScnZGoRdMIHKHZrj4zPXsFsDJ+/Hnl8B2x7gAxAYUdDxiw2rl1F8jROrY0O7Xohl8NE
 Xlqiooe7dv5oftOG8Q2Ivw0NgVzwbMFESOByC+XAdXY66E3YT2MpL3IxoLlshub3denL
 VXHtXzOrX3fm4+PC4yt+NnHiuvIAp40ICH3y7reqXKCcPKYipFGeL19pxXWxgkVh9v0+
 dGNTX4JqZ0oyt5Y8GKxl/y96chaVTS1cmwIyf8clGgus8wkSw0fhG6/pcT6u/3e9CURJ
 ZXjw==
X-Gm-Message-State: AOJu0YzHVgOs9K8Ny4UClrMafK14rdc+Aj+5l6FTit7ig/5KjksW83s1
 4dgHTdCJX4CWJbzEnJJDXvL9phpF/jvxECy0R1PEwARnLySebcBRkdRtxGFOmUtlxFDwzH6cC0f
 cRWrWfIxK3WKI6zmNVGvBqFGzs67emp3hwt+zGF8VZaj5THB61UqP5Q==
X-Gm-Gg: ASbGncvmNu2lh1SHEnpbLvtuncmP1wXixRex54cgD1LJWUUTJaMGpIO/bukALVUzabS
 ErbQ0Rav7ThG0YK09+fRXesEMBaXz9Y96UhSQrQHlC70EyZeVaniBqqnxH42fAl3skK/jO9xpAr
 TLRRYhKvVzZBbcxDZ8Fa2I46htopYsHHcNwPYIwaQepuJEJypIb/AH/XGB6uUCvdwjlW7qXD0y4
 n/IQOCut1LbFOBHOOgtZAGDfpMRIsI4rwTU05I8iLqz3J4v3Opu/G+Iwyuuwt3cBvpjtBRYZJ7+
 HXc=
X-Google-Smtp-Source: AGHT+IH4aO18weh28BD13B3Cfpt+RklniaJ4sc0BwmIzxQthKthktIP6NXF9eBn2dAX8TMN/2KBEAfV5NGERyvvLj2o=
X-Received: by 2002:a05:6512:3e0a:b0:594:2db8:312b with SMTP id
 2adb3069b0e04-5958419f5fbmr4703320e87.7.1763421753999; Mon, 17 Nov 2025
 15:22:33 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 18 Nov 2025 00:22:22 +0100
X-Gm-Features: AWmQ_blCfC6O_PVjo62GMKhC-XeuMwSIOyjTdKo5ZpfuoTX76jhMAKqioxdmbEU
Message-ID: <CALZ=Sy_Lt3ykMLorz7Hx0=M0bBgbb-am=Cs=Ff+dnHK-BMz+iA@mail.gmail.com>
Subject: How to submit patches against lorikeet-heimdal
To: samba-technical@lists.samba.org
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
From: Kacper via samba-technical <samba-technical@lists.samba.org>
Reply-To: Kacper <kacper@kacper.se>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,

I=E2=80=99m wondering how to submit patches for lorikeet-heimdal using GitL=
ab.
Normally, I would submit patches upstream, but I=E2=80=99d like to submit t=
his one
to lorikeet for visibility to the Samba AD developers.

I noticed there are only two merge requests for lorikeet. One mentions
pushing a new branch named like lorikeet-heimdal-$(date --utc +%Y%m%d%H%M)
to the shared repository, but I believe only Samba members have permission
to create new branches.

Could you clarify the proper way for external contributors to submit
patches for visibility in lorikeet?

Regards,
Kacper

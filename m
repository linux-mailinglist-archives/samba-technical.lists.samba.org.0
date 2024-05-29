Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 297028D2BB4
	for <lists+samba-technical@lfdr.de>; Wed, 29 May 2024 06:18:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=FRDJoOM1hOAoBkAqN0BWwBP0h8aMZDQpzsARbUtbeZo=; b=gFrJskNg2Wm9Gv4sk0IAcbVEDc
	Sg7bjLdyH3CNbUpq9zNyTaJgCN7/jzgK0zBYzMZsYbX75azbUFBKZtaN2O1jRXCGtoKSfkcN3yY+8
	ZHWbDGRNmmn9hS5gip1IogWKJ2TeEEDW2UTcC39cVh0b7fet5xg+N7Xkehejmb++UbT+0lohtUk+z
	4xItfDQnn5P87NE2/2h5oXWkWNEe8iLS1S38He42QoYHjzVVUCocyV+hrGQinbUNa20+09j247zkQ
	QlGUU5+r5zZDmGBEkIeCOtMpAS/pLODoR+KRfep5oFcUHVXaYZqia77T5AqCcbdmhx85yrVZEB48V
	CLRLmAyg==;
Received: from ip6-localhost ([::1]:28638 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sCAlN-00ACUG-FS; Wed, 29 May 2024 04:18:09 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:53663) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sCAlI-00ACU9-9A
 for samba-technical@lists.samba.org; Wed, 29 May 2024 04:18:06 +0000
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-52b0d25b54eso145493e87.3
 for <samba-technical@lists.samba.org>; Tue, 28 May 2024 21:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716956283; x=1717561083; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=FRDJoOM1hOAoBkAqN0BWwBP0h8aMZDQpzsARbUtbeZo=;
 b=a7zsCiqlTg0ZmFDXv50TXYla2whyGTUaFxTF+ftqX/7UKJU5r1lqdihzIKliJvqMDW
 QbvLWcQnKnFs6szZHVGE/hf4wQ2F/fd/hgpU14kItm1k0AVZwKcDNgqGIx6P8+9kcyP8
 JVYmFJ6uwcLkXq8XE20ZKZ16wnL32mhSSEhVcfOttj6EEXihVHPX4UUBLleImbwJTwgt
 Gn+q7YJy6D965zCf9L3xRAr03BdslUJW1O90hJDh8GWf1yA4Cx1q2orGwj0lrm6BNwgu
 MkAjiUfVuZn7//fneWjO/JtmDMv6vGgBUVqJIFgoAyfNVTBsCPMYF/ll/OquSbW+hyz1
 z1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716956283; x=1717561083;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FRDJoOM1hOAoBkAqN0BWwBP0h8aMZDQpzsARbUtbeZo=;
 b=fsk0/irnBRgZZYNYvR7wPmt32ciwaENEhPBN4eL6Gj3trLuf8GRoJrEqy04SDVYQwP
 m9q1JmtxzbFZckfQpMnexYKsiZY2pkOdNwp5a3Y2evgICU3wrf4YXULKjCDjU6rV/I+z
 zmh+K1Upv1tZNs2ag1Yp1HJ1oj9wraH64mM6CRF+kxiF+Rfvt1DhIchhkGPV0IzBCK+q
 5Xw2C3Thvr3SpiX6SQm3c1/2tjgE/VG54Q5qkYtUa0I1ME0dUojpeC/PfdcvoaEJV/rD
 8py6sWFc+QFVeKl1/WSUbsU/hNXzZR6p8bOQ2tEK9cOKX2fMP7vcedXB5jbQEVDQKnnC
 p50g==
X-Gm-Message-State: AOJu0YyDOaWcWXfuzuqS3lOy7PNNqHT9K6jNgw3a0I8pyRvS3Q2Hazmv
 +z7vPDUKt0iIkABSOmukh18nihj7iuUm9cm9ImyiAjopvSFj/kgP6NIlhpuLRtlIcOuw4ZNpKjB
 A6JOruGypz/tN7wczDnn39tzXXd8=
X-Google-Smtp-Source: AGHT+IEGKwAZiOngGR91G05JTmhnzi8gsdagPXKdgXXFWPJHsEoOvBE6/pGbS6achva3E5Iyc0fNhtyKre+SNQjuBgk=
X-Received: by 2002:a05:6512:4c1:b0:523:54a2:3836 with SMTP id
 2adb3069b0e04-52965f10e3dmr10141713e87.33.1716956282630; Tue, 28 May 2024
 21:18:02 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 28 May 2024 23:17:51 -0500
Message-ID: <CAH2r5msbOL10R65Wsa75yUox1ncHQW_fmnD+iPg2x3pZQmOGBA@mail.gmail.com>
Subject: creating sockets with SFU xattrs
To: CIFS <linux-cifs@vger.kernel.org>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I noticed xfstest generic/423 failing to Samba with "sfu" mount option
(with "cifs does not support mknod/mkfifo") which turned out to be due
to cifs.ko not supporting creating sockets with the "sfu" mount option
(it works for fifos, block and char devices but not sockets - unlike
with e.g. WSL reparse points)

Block devices are mapped using the string "IntxBLK" to identify them,
char devices with "IntxCHR" symlinks with "IntxLNK" and FIFOs with
"LnxFIFO" but there isn't a mapping for sockets.   Any thoughts on
adding "LnxSocket" for this special case (creating a unix socket when
"sfu" is enabled)?

-- 
Thanks,

Steve


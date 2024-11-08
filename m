Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DCE9C1DCC
	for <lists+samba-technical@lfdr.de>; Fri,  8 Nov 2024 14:24:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=6JnQulGVHQVUM9oNoiqG+sX6UU1uZQZakEjePNwhAfM=; b=dhobuCTexPRNFQHq3dMo+9O+Nl
	uD/s7Pg0YUKG7SRtzeb/TixY3IepONrtvbvpStLtm81LQwPYX10QgExTehWH5Ou+JMoCWEwI2zrdz
	LXPxlhppYg7B7vU3VSEztpx3KjCgVYjh+BznVsWWNPapaty67FYNSXDJiOeerDqQNNCmzgSGl/+EG
	Q0DRXyzzWg5TVHpasZVaU4g/e8OrGTGF5bnPkVHrLNbhfv+/jrvFvqo8IfMZq3w/Tf/tjwPEY2ba2
	lKkXOnZrE0DlScTiRmfDkeoWQZ7xp/wqJsg2yh0Tp1nHhtUC62/DD0xaKJDuCIjaZ6sB0Z4wc+m/A
	RouJqUTQ==;
Received: from ip6-localhost ([::1]:37268 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t9Oy2-0087oJ-Ho; Fri, 08 Nov 2024 13:24:02 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:59676) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t9Oxy-0087oC-VS
 for samba-technical@lists.samba.org; Fri, 08 Nov 2024 13:24:01 +0000
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a9a68480164so302105866b.3
 for <samba-technical@lists.samba.org>; Fri, 08 Nov 2024 05:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731072236; x=1731677036; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=k/eoRTwZVu+zux/H8BcMiK5z2DRQFSb799JXqIxcG7A=;
 b=BgrwTovEQgZD7lHPq/JKTj6NfCn58bMpICoyJReq4CjzABcN7qghBBvbf+llbSRd7o
 HWXaNVJBJoyTxhqhAHjvFWnPIhP8aZg18GpVXrx6CvIhAH9uR/hUkOOzTShV6TmtNy6r
 12AP47GGu8mJnx9MkoUTFEZDq3l56oYOM9kNzVDbTFFV6jL9QhS+sI+r0hkyPPhmt76s
 wxkoAJgfeVJagUPVL6zJMZEu5CFJsEbrF2tm5uUtxSAgxKYviFhp5t+2vD+dolfsYMsa
 zRO/+ByzoHGNTaWYWthvdiA9FunbzhArjz/JG+5TQW+dbIQiAVjivLjQatRssDtrnLTN
 fJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731072236; x=1731677036;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k/eoRTwZVu+zux/H8BcMiK5z2DRQFSb799JXqIxcG7A=;
 b=D4o8ZLs+d3PtyLWMgKYhyfI3k4tOCelhZUaMWpxKyZxLXImZyTFsOGRU6Uypg4ztUP
 pl/FTYkGi6DxjN8xhWvwj7IjBGCSYmJ9ao2NpgXPMaFsuitcZjozWNOlWoSXSyxl/t0w
 Ow+N1pCilOUCTTZpeRIByUVDu4t0pEBhxg/440BgEv05FhFDOFtIRhuQNowtDSjUHmPb
 rpuLrjnJ0BM3RECsgw05utYmMl8oOnNpjlMSnAxVWn/p7mGWN6jJuppAUqGVkuYmCTpa
 I8lUS3mcP8Aj9CcXLiKJAhleda+PoxtCesvol7zjZzG2JvNqHR2rm5Xl9ptjMODTr665
 VlJA==
X-Gm-Message-State: AOJu0Yw7g92bzhcyhQquUIMySL6/JtVlBV7VPc90Hsq4vkBbibpdjfRC
 x5JhTusJ1/pm0Z3bf1TNSdCn57YWS/CWQEePFRbdclwEiZ8ptjswo8VvyDYhPgU2JN8ceuVfrh4
 1mzUeuQ0+NDulXR1vFN6uPP3ECCIOU2p0
X-Google-Smtp-Source: AGHT+IHoPYsRYP8Kh0vEl6INCoqD7ycEr/apPVidU3Jm1ZA1hXNIRcMm30TLmxoNYrOARD+LVvuhoYuj03b7g+bZp0U=
X-Received: by 2002:a17:906:da85:b0:a99:f56e:ce40 with SMTP id
 a640c23a62f3a-a9ef0021723mr247403266b.47.1731072236219; Fri, 08 Nov 2024
 05:23:56 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 8 Nov 2024 18:53:44 +0530
Message-ID: <CAP4uAdpmq+vUOGJfJEMWh2dpQUYqOrQj14f_qvMehoUCebT7sA@mail.gmail.com>
Subject: Latest samba4.21 configure cannot find ldap.h, lber.h files and
 libraries on freebsd
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
From: sandeep nag via samba-technical <samba-technical@lists.samba.org>
Reply-To: sandeep nag <sandeepnagamalli@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi All,

Seeing following error on freebsd with samba 4.21  ./configure

> [1/1] Compiling
^[[32mbin/.conf_check_cb0399a8760ccc5bafb05dce08fe487f/test.c^[[0m

['/usr/bin/clang', '-D_SAMBA_BUILD_=4', '-DHAVE_CONFIG_H=1', '-MMD',
'-D_GNU_SOURCE=1', '-D_XOPEN_SOURCE_EXTENDED=1', '../../test.c', '-c',
'-o/root/src/samba
/bin/.conf_check_cb0399a8760ccc5bafb05dce08fe487f/testbuild/default/test.c.1.o']
err: ../../test.c:455:10: fatal error: 'ldap.h' file not found
  455 | #include <ldap.h>
      |          ^~~~~~~~
1 error generated.

I see the 3 patches mentioned here, are already in the code.
https://bugzilla.samba.org/show_bug.cgi?id=15623


Thanks,
Sandeep

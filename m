Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E61FA1CB6AB
	for <lists+samba-technical@lfdr.de>; Fri,  8 May 2020 20:06:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=aOsBv47I7uvrVcAZM3oQCa2p2MeZfrcFzJ+Ek1X0FLw=; b=e7oMPZgZ9Lm6mPhiWcuQhRSSdH
	gL9ajWo/Nk/DZ11F7Ffp9DWkyHGB4ILuVWdGS2ukev9A2OcXOwWgaohEDflxUzSfCu6Bs3oEf4pYj
	+79DVXqdBOk0g3EBu8Oyza2mUArobH0MY7KVGBgt9aIGW6TOJIM003lGSRwamBkQIC/XEdMcSk6ee
	KIGh+esOIXXbv4mu/o31IdI8s+o286K1vKp5Tqqd/UEAmxN22kYpUhBNkhKKfGO1iRpMn2x5aQZbX
	xLglXB5P8f1/lRHiK3w3dNy4NZ6FAG/r2fblh2mI1tvPHOuCD1JmRbDG3+q2dwUuO2pZtFnesoraz
	x6J2eNNQ==;
Received: from localhost ([::1]:20664 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jX7NO-003GCc-Uq; Fri, 08 May 2020 18:05:35 +0000
Received: from mail-ed1-f54.google.com ([209.85.208.54]:35483) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jX7NJ-003GCU-0T
 for samba-technical@lists.samba.org; Fri, 08 May 2020 18:05:31 +0000
Received: by mail-ed1-f54.google.com with SMTP id a8so1979834edv.2
 for <samba-technical@lists.samba.org>; Fri, 08 May 2020 11:05:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=aOsBv47I7uvrVcAZM3oQCa2p2MeZfrcFzJ+Ek1X0FLw=;
 b=qWlu3nyCnu+F3xJpaOqoqvqA8aWOk6vN/dDgBmoD/PqnohDvrwP2C/y8gj9FaiVkHA
 flCzwMEV6RPzUFrUo/RygSMwqh8JOPYQN7M+rN1/MDlJunSAjPEB8ikV7Xw1w6x4W78q
 L12QoNri9beHTtcSllI0e+HzkbLUDRTR6nm32r3XTX+wjt2DZi3BmGcD5Ydv3cPKg82+
 bbYTXz7YO8Lv5WVf66Szebn+Y4wr7Kg4r2NCRc1pWQ/VeIAxI047N/atemmonirykN5h
 osKgOyN8RiBuldWAyl6eBM4ciJ+wlsdXUduBZ3wsbxmydDfpDFtf/saPFhaU4YaO1s6/
 SCIA==
X-Gm-Message-State: AGi0Pub7/tWj+9wiMJ54S/cbZUVEkWgfG1th7y/HewRHvTCp3ggP6ltk
 qyn8u6KShvZ8R34eeVqKSJsbNTD2DZyn8+Ip2n4v2zyY
X-Google-Smtp-Source: APiQypLq+EksqYbGQYr6GtPPkuQsuVgO+y2vzo6P+Gq/56tIvBcRyP95rOO4/3V1w2vDgj8vHiQ5NVorCI6pPOex4Wo=
X-Received: by 2002:a05:6402:1f6:: with SMTP id
 i22mr3381032edy.271.1588961127331; 
 Fri, 08 May 2020 11:05:27 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 8 May 2020 14:05:16 -0400
Message-ID: <CALSyjX5G7ps8Pafurh5L+6U_JYBA9uTRxJaEhwKL5jTvU=2ZOQ@mail.gmail.com>
Subject: [PATCH] snapper: add configure option to control build (default: auto)
To: samba-technical@lists.samba.org
Content-Type: multipart/mixed; boundary="0000000000008ec07705a526d767"
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
From: Matt Taylor via samba-technical <samba-technical@lists.samba.org>
Reply-To: Matt Taylor <liverbugg@rinux.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--0000000000008ec07705a526d767
Content-Type: text/plain; charset="UTF-8"

Recently the samba packages on Gentoo Linux had a hard dependency on
dbus added.  This is because the vfs_snapper module is enabled
automagically on the existence of dbus headers with no option to
disable it.  See: https://bugs.gentoo.org/721320 for the Gentoo bug
where it was suggested this be reported upstream.

This patch adds a configure option to control the build of snapper
similar to other vfs modules.

Signed-off-by: Matt Taylor <liverbugg@rinux.org>

--0000000000008ec07705a526d767
Content-Type: text/plain; charset="US-ASCII"; name="samba-snapper_option.patch.txt"
Content-Disposition: attachment; filename="samba-snapper_option.patch.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_k9yieyii0>
X-Attachment-Id: f_k9yieyii0

ZGlmZiAtcnUgc2FtYmEtbWFzdGVyL3NvdXJjZTMvd3NjcmlwdCBzYW1iYS1tYXN0ZXItcGF0Y2gv
c291cmNlMy93c2NyaXB0Ci0tLSBzYW1iYS1tYXN0ZXIvc291cmNlMy93c2NyaXB0CTIwMjAtMDUt
MDggMDc6MTY6MTguMDAwMDAwMDAwIC0wNDAwCisrKyBzYW1iYS1tYXN0ZXItcGF0Y2gvc291cmNl
My93c2NyaXB0CTIwMjAtMDUtMDggMTM6MjE6NTguMDAwMDAwMDAwIC0wNDAwCkBAIC03NSw2ICs3
NSw4IEBACiAgICAgb3B0LnNhbWJhX2FkZF9vbm9mZl9vcHRpb24oJ2dsdXN0ZXJmcycsIHdpdGhf
bmFtZT0iZW5hYmxlIiwgd2l0aG91dF9uYW1lPSJkaXNhYmxlIiwgZGVmYXVsdD1UcnVlKQogICAg
IG9wdC5zYW1iYV9hZGRfb25vZmZfb3B0aW9uKCdjZXBoZnMnLCB3aXRoX25hbWU9ImVuYWJsZSIs
IHdpdGhvdXRfbmFtZT0iZGlzYWJsZSIsIGRlZmF1bHQ9VHJ1ZSkKIAorICAgIG9wdC5zYW1iYV9h
ZGRfb25vZmZfb3B0aW9uKCdzbmFwcGVyJywgd2l0aF9uYW1lPSJlbmFibGUiLCB3aXRob3V0X25h
bWU9ImRpc2FibGUiLCBkZWZhdWx0PU5vbmUpCisgICAgCiAgICAgb3B0LmFkZF9vcHRpb24oJy0t
ZW5hYmxlLXZ4ZnMnLAogICAgICAgICAgICAgICAgICAgaGVscD0oImVuYWJsZSBzdXBwb3J0IGZv
ciBWeEZTIChkZWZhdWx0PW5vKSIpLAogICAgICAgICAgICAgICAgICAgYWN0aW9uPSJzdG9yZV90
cnVlIiwgZGVzdD0nZW5hYmxlX3Z4ZnMnLCBkZWZhdWx0PUZhbHNlKQpAQCAtMTc1MiwxMSArMTc1
NCwxMiBAQAogICAgIGlmIE9wdGlvbnMub3B0aW9ucy5lbmFibGVfdnhmczoKICAgICAgICAgY29u
Zi5ERUZJTkUoJ0hBVkVfVlhGUycsICcxJykKIAotICAgIGlmIGNvbmYuQ0hFQ0tfQ0ZHKHBhY2th
Z2U9J2RidXMtMScsIGFyZ3M9Jy0tY2ZsYWdzIC0tbGlicycsCisgICAgaWYgT3B0aW9ucy5vcHRp
b25zLndpdGhfc25hcHBlcjoKKyAgICAgICAgaWYgY29uZi5DSEVDS19DRkcocGFja2FnZT0nZGJ1
cy0xJywgYXJncz0nLS1jZmxhZ3MgLS1saWJzJywKICAgICAgICAgICAgICAgICAgICAgICBtc2c9
J0NoZWNraW5nIGZvciBkYnVzJywgdXNlbGliX3N0b3JlPSJEQlVTLTEiKToKLSAgICAgICAgaWYg
KGNvbmYuQ0hFQ0tfSEVBREVSUygnZGJ1cy9kYnVzLmgnLCBsaWI9J2RidXMtMScpCisgICAgICAg
ICAgICBpZiAoY29uZi5DSEVDS19IRUFERVJTKCdkYnVzL2RidXMuaCcsIGxpYj0nZGJ1cy0xJykK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYW5kIGNvbmYuQ0hFQ0tfTElC
KCdkYnVzLTEnLCBzaGxpYj1UcnVlKSk6Ci0gICAgICAgICAgICBjb25mLkRFRklORSgnSEFWRV9E
QlVTJywgJzEnKQorICAgICAgICAgICAgICAgIGNvbmYuREVGSU5FKCdIQVZFX0RCVVMnLCAnMScp
CiAKICAgICBpZiBjb25mLkNIRUNLX0NGRyhwYWNrYWdlPSdsaWJ1cmluZycsIGFyZ3M9Jy0tY2Zs
YWdzIC0tbGlicycsCiAgICAgICAgICAgICAgICAgICAgICAgbXNnPSdDaGVja2luZyBmb3IgbGli
dXJpbmcgcGFja2FnZScsIHVzZWxpYl9zdG9yZT0iVVJJTkciKToK
--0000000000008ec07705a526d767--


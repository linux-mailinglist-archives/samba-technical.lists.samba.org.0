Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 51902EBED3
	for <lists+samba-technical@lfdr.de>; Fri,  1 Nov 2019 09:01:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=ilUGGWQ1pumuupzeoNLn0xy6ay4zLh/8XVrkoOIxJD0=; b=U8W3rqAalm4XTDGJWMD6H163FZ
	T0mpUPwCXAAtz6FupKVuZyaCKpBZwsvqEAonYyinLa4gEEF1fLVwk1x7V42OCHhN2NthPH9RrP/BA
	X3m1olSP9hnHtCYH1jO2aNIZeR1bjeNfdjKSwk7T2bFSW7CBc423G58Y7z0GVsYJ1uz4RNHpj93ua
	yO5RrA1gr+130ZXwdLCdggkgXmhLoPfyrhKagVJlX/MXHZ6ugtAa14MpYaujnqhSpc7+POxlGOXYS
	ET3Aoj02aSQUaH0AbSRWG/GyKlnyoQ5Xm10FZX8wHyABAiNHrrvFBd5OaPw6hdMD3zdXVvCpGe5aI
	7iNXTlEQ==;
Received: from localhost ([::1]:61906 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iQRr8-005qCe-1d; Fri, 01 Nov 2019 08:00:26 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:38656) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iQRqt-005qCV-N9
 for samba-technical@lists.samba.org; Fri, 01 Nov 2019 08:00:15 +0000
Received: by mail-qk1-x730.google.com with SMTP id e2so9855259qkn.5
 for <samba-technical@lists.samba.org>; Fri, 01 Nov 2019 01:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qnap.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=V+/hXbLc2vlipYxG3+AL40zY9ALUEZ+BpV6sou+aol0=;
 b=FpkEBby/2aNGTiR9KcM+UDDXkI3l3ztpa8Hw3RRp+uwtrS+BROue92cAkjwGhblizq
 BsuDukdxIpv5CmGupy28TILLKhf/8OyBlVZ8uh4Rl31HW3hktRpRYgEOjMK1z1l3T1vX
 wO72AzIRdf4uwCcNnECCRCk6AgG9LZTk4erbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=V+/hXbLc2vlipYxG3+AL40zY9ALUEZ+BpV6sou+aol0=;
 b=LbkIYrd4lyJdqQYRdKdmADOL+TAW3ECGTTw2P6nchf8fHnDo4h51OAFFAjSVYelWV1
 Dkpn8RYmRSFO3itnT+fsUV2koIKD9/1cE6HQRpwXpGySwL9FeAsq27ej1xaLbI6G08ri
 5TBT/NW/m4gwzn+2p6sB/8tfNsBo1QC5MpHSRJX+jYccT7bqk5TSofPQj9IJ1e9uIfuo
 kcV5HT/bFp0szpF/hCP0UuhkGnpMbvEcaRgQlDcth53uXmBq1ZZCrcsB0tkNIhDp/G1S
 c6yo6kHmHWPbrButDrgC/VysTvt0U/WM4Ga5oKOf4133gdmihqVQBQmF5zyHxG7cy0Ib
 kPMQ==
X-Gm-Message-State: APjAAAUWziywfBbNRPxRHSHc6PjRikRDKIfuq7+KjnuRrTBk9g7RA4RK
 NGfte70tnuA4e0x/EPZpuoB5sjnAr7xvFSeFgTfasZBq9QU=
X-Google-Smtp-Source: APXvYqwAD8i3vmZA+TBOXhFh6m/Sg81P5V/HGd22m9aWG+4R4J+RV+TRiq3biGKhWWVHQY6nMV69T2zYFNqx7HVpeeY=
X-Received: by 2002:a37:4e03:: with SMTP id c3mr629783qkb.222.1572595209000;
 Fri, 01 Nov 2019 01:00:09 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 1 Nov 2019 15:59:54 +0800
Message-ID: <CAEUGjKjmFJFmz+Wts1UMZaHXKEEpeuY7UmB52H_aiQU=HS11sA@mail.gmail.com>
Subject: [PATCH] s3:libads: Fix mem leak in ads_create_machine_acct
To: Samba Technical <samba-technical@lists.samba.org>,
 Jones Syue <jonessyue@qnap.com>
Content-Type: multipart/mixed; boundary="000000000000d097500596445ab6"
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
From: Jones Syue via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jones Syue <jonessyue@qnap.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--000000000000d097500596445ab6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello list,

This patch fix memory leak in ads_create_machine_acct,
samba-4.10.9 included Bug 13884 and introduce this,
please help review and push, thank you.

https://bugzilla.samba.org/show_bug.cgi?id=3D13884

--
Regards,
Jones Syue | =E8=96=9B=E6=87=B7=E5=AE=97
QNAP Systems, Inc.

--000000000000d097500596445ab6
Content-Type: application/octet-stream; 
	name="0001-s3-libads-Fix-mem-leak-in-ads_create_machine_acct.patch"
Content-Disposition: attachment; 
	filename="0001-s3-libads-Fix-mem-leak-in-ads_create_machine_acct.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k2fuifno0>
X-Attachment-Id: f_k2fuifno0

RnJvbSBjYmQ4MDgyN2M1YzZlYzg3MWI5ZDhiZjJkOTI3YTJmNzIzYTI2OTIyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKb25lcyBTeXVlIDxqb25lc3N5dWVAcW5hcC5jb20+CkRhdGU6
IEZyaSwgMSBOb3YgMjAxOSAxNTo1MDoyOSArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIHMzOmxpYmFk
czogRml4IG1lbSBsZWFrIGluIGFkc19jcmVhdGVfbWFjaGluZV9hY2N0CgpVc2UgJ2dvdG8gZG9u
ZScgaW5zdGVhZCBvZiAncmV0dXJuJyB0byBmaXggbWFjaGluZV9lc2NhcGVkIGxlYWsuCgpTaWdu
ZWQtb2ZmLWJ5OiBKb25lcyBTeXVlIDxqb25lc3N5dWVAcW5hcC5jb20+Ci0tLQogc291cmNlMy9s
aWJhZHMvbGRhcC5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKIG1vZGUgY2hhbmdlIDEwMDY0NCA9PiAxMDA3NTUgc291cmNlMy9saWJhZHMv
bGRhcC5jCgpkaWZmIC0tZ2l0IGEvc291cmNlMy9saWJhZHMvbGRhcC5jIGIvc291cmNlMy9saWJh
ZHMvbGRhcC5jCm9sZCBtb2RlIDEwMDY0NApuZXcgbW9kZSAxMDA3NTUKaW5kZXggOTBkNDAyYS4u
YTYzMGM1YQotLS0gYS9zb3VyY2UzL2xpYmFkcy9sZGFwLmMKKysrIGIvc291cmNlMy9saWJhZHMv
bGRhcC5jCkBAIC0yMzcwLDcgKzIzNzAsOCBAQCBBRFNfU1RBVFVTIGFkc19jcmVhdGVfbWFjaGlu
ZV9hY2N0KEFEU19TVFJVQ1QgKmFkcywKIAkvKiBNYWtlIHN1cmUgdG8gTlVMTCB0ZXJtaW5hdGUg
dGhlIGFycmF5ICovCiAJc3BuX2FycmF5ID0gdGFsbG9jX3JlYWxsb2MoY3R4LCBzcG5fYXJyYXks
IGNvbnN0IGNoYXIgKiwgbnVtX3NwbnMgKyAxKTsKIAlpZiAoc3BuX2FycmF5ID09IE5VTEwpIHsK
LQkJcmV0dXJuIEFEU19FUlJPUl9MREFQKExEQVBfTk9fTUVNT1JZKTsKKwkJcmV0ID0gQURTX0VS
Uk9SKExEQVBfTk9fTUVNT1JZKTsKKwkJZ290byBkb25lOwogCX0KIAlzcG5fYXJyYXlbbnVtX3Nw
bnNdID0gTlVMTDsKIAotLSAKMi4xLjQKCg==
--000000000000d097500596445ab6--


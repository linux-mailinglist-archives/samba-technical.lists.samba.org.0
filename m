Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F19C7989DAA
	for <lists+samba-technical@lfdr.de>; Mon, 30 Sep 2024 11:07:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=PK/xW6fq4dtHIsOIXSnBxxRRv88yGmr6CDk2pZl2Wok=; b=SXDIxubUoJRr6QeHGR2V4BoaVt
	jtG3It7AWvaqMEgMVw9PswWAwi9bn34PuZfFaGk39Cxdf06C49Ui4tTcEaKcgSzQRsMPxUjfKPGRv
	B/rfauYWz/9j5ZdhBWsYXBRSpBDcQLpIKEmAMG8F0g3R+Lm3XBMbvJhZBA28JMulcDOtZzp+Gy+Sb
	b2rT2o/k2octlX97mEwir+4CpC75YaUCJ/ojvjRjcnuYjRQcZbHLA6eRZ7m63R5EYX1Q1TaNNO1Tt
	wKbH2thb2FmDyyKV5OhsybBT9lD9UKdU6qBAcdCibc/4RCeo8Efc97qiR2tfFunxHT+uteAp0cfdB
	4oxg19SA==;
Received: from ip6-localhost ([::1]:33444 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1svCNM-000t1g-J7; Mon, 30 Sep 2024 09:07:28 +0000
Received: from n169-114.mail.139.com ([120.232.169.114]:64096) 
 by hr1.samba.org with smtps
 (TLS1.2:ECDHE_SECP256R1__RSA_SHA512__AES_256_GCM:256) (Exim)
 id 1svCNH-000t1Z-Az
 for samba-technical@lists.samba.org; Mon, 30 Sep 2024 09:07:26 +0000
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM: 
X-RM-SPAM-FLAG: 00000000
Received: from DESKTOP-GS7IF7U (unknown[112.1.48.21])
 by rmsmtp-lg-appmail-41-12055 (RichMail) with SMTP id 2f1766fa6a42efa-6b66c;
 Mon, 30 Sep 2024 17:07:15 +0800 (CST)
X-RM-TRANSID: 2f1766fa6a42efa-6b66c
Date: Mon, 30 Sep 2024 17:07:16 +0800
To: samba-technical <samba-technical@lists.samba.org>
Subject: Consultation on password synchronization between ubuntu 22.04 system
 user password and samba user
References: <202409300141333173631@139.com>
X-Priority: 3
X-GUID: 702103A3-FD3A-48F1-A0B0-FB571038EBC9
X-Has-Attach: no
X-Mailer: Foxmail 7.2.25.306[cn]
Mime-Version: 1.0
Message-ID: <202409301707160229725@139.com>
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64
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
From: 15051810258--- via samba-technical <samba-technical@lists.samba.org>
Reply-To: "15051810258@139.com" <15051810258@139.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

SGVsbG8sIGV2ZXJ5b25lDQoNCkhvdyB0byBhdXRvbWF0aWNhbGx5IHVwZGF0ZSB0aGUgcGFzc3dv
cmQgb2YgYSBzYW1iYSB1c2VyIGFmdGVyIGNoYW5naW5nIHRoZSBwYXNzd29yZCBvZiBhIGNvbW1v
biB1c2VyIGluIHRoZSB1YnVudHUgc3lzdGVt77yfDQpJIHVzZSBvcGVubGRhcCBhcyB0aGUgYmFj
a2VuZCBkYXRhYmFzZS4NClRoZSBwYXNzd29yZCBvZiB0aGUgc2FtYmEgdXNlciBpcyBhdXRvbWF0
aWNhbGx5IHVwZGF0ZWQgYWZ0ZXIgdGhlIHBhc3N3b3JkIGlzIGNoYW5nZWQgYnkgcnVubmluZyB0
aGUgcGFzc3dkIGNvbW1hbmQNCg0KQ2FuIHlvdSBndWlkZSBtZT8gVGhhbmsgeW91DQoNCk9wZXJh
dGluZyBzeXN0ZW06IHVidW50dSAyMi4wNA0Kc2FtYmEncyB2ZXJzaW9uOiA0LjE1DQpvcGVubGRh
cDogMi42LjE4DQoNCg0KDQoxNTA1MTgxMDI1OEAxMzkuY29tDQogDQpGcm9tOiAxNTA1MTgxMDI1
OEAxMzkuY29tDQpEYXRlOiAyMDI0LTA5LTMwIDAxOjQxDQpUbzogc2FtYmEtdGVjaG5pY2FsQGxp
c3RzLnNhbWJhLm9yZw0KU3ViamVjdDogaGVscA0KDQoNCg0KDQoxNTA1MTgxMDI1OEAxMzkuY29t
DQo=

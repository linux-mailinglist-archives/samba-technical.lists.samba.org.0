Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC32989D8C
	for <lists+samba-technical@lfdr.de>; Mon, 30 Sep 2024 11:02:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=RoNODEQt9zZ6x5krmKp2BQ6JT0CWKscNo2ujKhLWKcU=; b=gXL3NIjGmWw/D6SMNSJZqc67dC
	CsdWbVYU2Ow18iwnO5c0hsp5X5cBwZV2thcKvP/3MWRnp9i2IP4bnfYSDOicE5IWD+yqnSlB3wz1Q
	8KYG3/RVrjLYswe3WH13WgN9uicMWsFYznC8QcdsHfUgiSPlfAM0v9Y+ArskzmX0h+iQdA3PjKlq4
	zH9nWgZwM4LYWahviC/FojYkq7ub7ml1K7A20xgfILiMwHHH0rPspXWdZAUnwS29RYerB49heZVJH
	BPVARQB7sAffsI+kJ0OyylArZW/kxELW4SXScfxMs5gOtbiqgMvvDlQ0L/hgSG+mcdDW+L3tgpmBq
	9j39ZMyA==;
Received: from ip6-localhost ([::1]:27726 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1svCIE-000swP-CQ; Mon, 30 Sep 2024 09:02:10 +0000
Received: from n169-113.mail.139.com ([120.232.169.113]:18152) 
 by hr1.samba.org with smtps
 (TLS1.2:ECDHE_SECP256R1__RSA_SHA512__AES_256_GCM:256) (Exim)
 id 1svCI8-000swI-L0
 for samba-technical@lists.samba.org; Mon, 30 Sep 2024 09:02:08 +0000
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM: 
X-RM-SPAM-FLAG: 00000000
Received: from DESKTOP-GS7IF7U (unknown[112.1.48.21])
 by rmsmtp-lg-appmail-31-12045 (RichMail) with SMTP id 2f0d66fa6901e9a-6b59f;
 Mon, 30 Sep 2024 17:01:54 +0800 (CST)
X-RM-TRANSID: 2f0d66fa6901e9a-6b59f
Date: Mon, 30 Sep 2024 17:01:55 +0800
To: samba-technical <samba-technical@lists.samba.org>
Subject: Consultation on password synchronization between ubuntu 22.04 system
 user password and samba user
References: <202409300141333173631@139.com>
X-Priority: 3
X-GUID: 40FE1C0E-9404-49CF-B144-572787CCF319
X-Has-Attach: no
X-Mailer: Foxmail 7.2.25.306[cn]
Mime-Version: 1.0
Message-ID: <202409301701543934081@139.com>
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
aGUgcGFzc3dkIGNvbW1hbmQNCg0KQ2FuIHlvdSBndWlkZSBtZT8gVGhhbmsgeW91DQoNCg0KDQox
NTA1MTgxMDI1OEAxMzkuY29tDQogDQpGcm9tOiAxNTA1MTgxMDI1OEAxMzkuY29tDQpEYXRlOiAy
MDI0LTA5LTMwIDAxOjQxDQpUbzogc2FtYmEtdGVjaG5pY2FsQGxpc3RzLnNhbWJhLm9yZw0KU3Vi
amVjdDogaGVscA0KDQoNCg0KDQoxNTA1MTgxMDI1OEAxMzkuY29tDQo=

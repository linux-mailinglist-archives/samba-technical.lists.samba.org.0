Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C37A1B2544
	for <lists+samba-technical@lfdr.de>; Tue, 21 Apr 2020 13:41:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=2y4tYgrXxB0QvmcIhoBOzmgUQT87eRbFwi/i9OegMWQ=; b=sjtPjggMTIw/r7Fw7cuLwMXcjk
	t7dXtuxrGfDwzq9S6CbbX6GuDu4crLG7AP8LnttJTnKMsSxSO7LnUVwiJeCO5l5pAF6Q89ETT+dWV
	g/22lFp7T5F//SZYrkPGQllzSeBmRE79F7Dge/7bwNfrbk6ni4TLPdmLpcClcU9lj5FrwULO1gR4m
	p5vSWt9gZdVp+BLe6TdLerUcAFn54Sm7eYjCBypDpFpDOOQ/Y7iyFXWUTVltCTSkI/x5NJCQOuufn
	5I8stVONTnCF/L1ZUzmaShNLTlF43m121c6RS14RUB5KC5BjavaXjXLkSejTxQvWL9SbbdBeoi0/e
	VoA090Tw==;
Received: from localhost ([::1]:23558 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jQrHN-001NOs-IX; Tue, 21 Apr 2020 11:41:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23918) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jQrHF-001NOl-KR
 for samba-technical@lists.samba.org; Tue, 21 Apr 2020 11:41:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=2y4tYgrXxB0QvmcIhoBOzmgUQT87eRbFwi/i9OegMWQ=; b=WbOHgQaXRgs8KnrbTqP8tfYfnd
 tjNSQJtb+epCWkdTRcILiPe5c179U1kaqDEdczx6pgTCpO/qZlNe7pjGkzXvV9QBmMdRtDRH1yz3q
 oZXSWF6kraZZEW9SfHQBljD+hEtM7rnH2OtnGgy1BttfJ+2x1ZN9/O13JeCnezsTKIoDtjgD9jO3g
 710HEybE2tAOY/Gc369sg+lznBzAu6IF9g2nFolweImmU1RWdPfLnIwVJZ4ivRpWYkWPNKYvmGbh3
 oHD7QHoZLSIP/nfrtc+x0pnMZKcV62o+fORzuEWomw1bxp1OJA4GU0/4P8TqJFg6sSR/EB1y1r5G5
 tWd/JXGBjCLhJQKlFqM2ZKJAiz2GczeXFX4zv+d++MDbGYzRsFXP5jXUpj1CsPlaeoTIidcXszTNS
 IW7fdYAsnpaPXF5d80zbUeUYkTxfHKIhoodhkVV2QtWpHPbNJJlfL5a9L3mJNzZKJDu3CJjnQjlhN
 7AWHEusqtmDZ2eHo6wqo3n+a;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jQrHF-0000qT-3P
 for samba-technical@lists.samba.org; Tue, 21 Apr 2020 11:41:21 +0000
Received: from localhost ([::1] helo=hr3.samba.org)
 by hr3.samba.org with esmtp (Exim 4.92)
 (envelope-from <github@samba.org>) id 1jQrHE-000Rxd-Rt
 for samba-technical@lists.samba.org; Tue, 21 Apr 2020 11:41:20 +0000
Content-Type: multipart/mixed; boundary="===============2099173529600656321=="
MIME-Version: 1.0
Subject: [PR PATCH] Update nfs-ganesha-callout
To: samba-technical@lists.samba.org
Message-ID: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-218@samba.org>
Date: Tue, 21 Apr 2020 11:41:20 +0000
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
From: Github bot account via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: github@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

GitHub notification mails are now in MIME to allow UTF8.

--===============2099173529600656321==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlcmUgaXMgYSBuZXcgcHVsbCByZXF1ZXN0IGJ5IHJ5bm84MyBhZ2FpbnN0IG1hc3RlciBvbiB0
aGUgU2FtYmEgU2FtYmEgR2l0aHViIHJlcG9zaXRvcnkKCmh0dHBzOi8vZ2l0aHViLmNvbS9yeW5v
ODMvc2FtYmEgcGF0Y2gtMQpodHRwczovL2dpdGh1Yi5jb20vc2FtYmEtdGVhbS9zYW1iYS9wdWxs
LzIxOAoKVXBkYXRlIG5mcy1nYW5lc2hhLWNhbGxvdXQKT24gZGViaWFuIGJ1c3RlciwgdGhpcyB2
YXJpYWJsZSBkb2Vzbid0IGV4aXN0IGFueW1vcmUuIExvb2sgYXQgdGhpcyBQUiBhcyBhIHJlZmVy
ZW5jZToNCmh0dHBzOi8vZ2l0aHViLmNvbS9nbHVzdGVyL3N0b3JoYXVnL3B1bGwvMzANCg0KIyMg
U2FtYmEgaXMgbW92aW5nIHRvIEdpdExhYg0KVGhlIHNhbWJhIHByb2plY3QgaXMgbW92aW5nIHRv
IEdpdExhYiwgcGxlYXNlIGNvbnNpZGVyIG9wZW5pbmcgYSBtZXJnZSByZXF1ZXN0IHRoZXJlIGlu
c3RlYWQuDQpJbnN0cnVjdGlvbnMgZm9yIHNldHRpbmcgdXAgY2FuIGJlIGZvdW5kIGF0OiBodHRw
czovL3dpa2kuc2FtYmEub3JnL2luZGV4LnBocC9TYW1iYV9DSV9vbl9naXRsYWINClRoZSBHaXRM
YWIgcmVwb3NpdG9yeSBjYW4gYmUgZm91bmQgaGVyZTogaHR0cHM6Ly9naXRsYWIuY29tL3NhbWJh
LXRlYW0vc2FtYmENCgoKQSBwYXRjaCBmaWxlIGZyb20gaHR0cHM6Ly9naXRodWIuY29tL3NhbWJh
LXRlYW0vc2FtYmEvcHVsbC8yMTgucGF0Y2ggaXMgYXR0YWNoZWQ=

--===============2099173529600656321==
Content-Type: application/text/x-diff
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="github-pr-patch-1-218.patch"

RnJvbSAyMzY4MzQ1NzAxNTgyZjc2NTg3MWNmZmEwZjg1N2VjZTllMzI3MDVkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBSZW5hdWQgRm9ydGllciA8cmVuYXVkLmZvcnRpZXJAZnNhYS51
bGF2YWwuY2E+CkRhdGU6IFR1ZSwgMjEgQXByIDIwMjAgMDc6Mzk6NTMgLTA0MDAKU3ViamVjdDog
W1BBVENIXSBVcGRhdGUgbmZzLWdhbmVzaGEtY2FsbG91dAoKT24gZGViaWFuIGJ1c3RlciwgdGhp
cyB2YXJpYWJsZSBkb2Vzbid0IGV4aXN0IGFueW1vcmUuIExvb2sgYXQgdGhpcyBQUiBhcyBhIHJl
ZmVyZW5jZToKaHR0cHM6Ly9naXRodWIuY29tL2dsdXN0ZXIvc3RvcmhhdWcvcHVsbC8zMAotLS0K
IGN0ZGIvZG9jL2V4YW1wbGVzL25mcy1nYW5lc2hhLWNhbGxvdXQgfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9jdGRiL2Rv
Yy9leGFtcGxlcy9uZnMtZ2FuZXNoYS1jYWxsb3V0IGIvY3RkYi9kb2MvZXhhbXBsZXMvbmZzLWdh
bmVzaGEtY2FsbG91dAppbmRleCBmMDZiMzAwYzViNy4uN2M3YjA3NDEzYWIgMTAwNzU1Ci0tLSBh
L2N0ZGIvZG9jL2V4YW1wbGVzL25mcy1nYW5lc2hhLWNhbGxvdXQKKysrIGIvY3RkYi9kb2MvZXhh
bXBsZXMvbmZzLWdhbmVzaGEtY2FsbG91dApAQCAtMjk3LDcgKzI5Nyw3IEBAIG5mc19zdGFydHVw
ICgpCiAKIAliYXNpY19zdGFydCAibmZzIgogCV9mPSIke3Byb2Nmc30vc3lzL25ldC9pcHY0L3Rj
cF90d19yZWN5Y2xlIgotCWlmIFsgIiRfZiIgXSA7IHRoZW4KKwlpZiBbIC1mICIkX2YiIF0gOyB0
aGVuCiAJCWVjaG8gMSA+IiRfZiIKIAlmaQogfQo=

--===============2099173529600656321==--


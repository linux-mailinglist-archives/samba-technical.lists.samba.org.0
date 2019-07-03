Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2C55E7F4
	for <lists+samba-technical@lfdr.de>; Wed,  3 Jul 2019 17:38:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=M0U2JT2GsI9mQMiPyM4omGRqXFybLklbeDfJUP5qZ2c=; b=5JvOjEFPtjsfmmkVALdzS/0VAG
	Nba02Oqd42L1fCWiatbCV6ZodckptHwbE0e78SU+MDSycvQ7l0yD84q2vc/BUSy4yAXXi9iJQd0Lx
	uckNddPhhZWS6T+o5AqFnL6arzILcqXzaU0e8ayI7UFTVHEXQ/Yb1Q/v9Sv4eYTFBJ20moesgutlD
	ciHrPNxY2IHFbZ1nhbQNpAkfpxkIfyLecwm88w752nqnmgIov316tSqfZraM9VAiU68D2Y7jvXjDu
	2RZKrBvGlNCcSYO6/snlu0Tld44yvhebynGmlCkO5KGHtzpL7u6uCjDLDBlbk80R2GIQXRQP0Mw9w
	dLm2ML4w==;
Received: from localhost ([::1]:46696 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hihJc-004x64-Jq; Wed, 03 Jul 2019 15:37:00 +0000
Received: from smtp72.ord1c.emailsrvr.com ([108.166.43.72]:46405) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hihJV-004x5x-AT
 for samba-technical@lists.samba.org; Wed, 03 Jul 2019 15:36:56 +0000
Received: from smtp18.relay.ord1c.emailsrvr.com (localhost [127.0.0.1])
 by smtp18.relay.ord1c.emailsrvr.com (SMTP Server) with ESMTP id 37CF1E0145
 for <samba-technical@lists.samba.org>; Wed,  3 Jul 2019 11:17:05 -0400 (EDT)
X-SMTPDoctor-Processed: csmtpprox beta
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=knightpoint.com;
 s=20180102-a7bm16vc; t=1562167025;
 bh=PHm+sBG6rKhDoYJlLUdeGPSNrDs7fvRRA/innZyaBtE=;
 h=From:To:Subject:Date:From;
 b=paYOkcgIuca+SUFRJeJvFkHDneT7v9feC04rzTHMkhSpSMnSKx2BpTRhUrOgQ+sf0
 9viWeIwwQ7wOevEmu1cqI3w1vqhHN1Hg5xXdrNDc5xqAvFJk+EWqVIE2WUw9hXRJFV
 n9uz1FG5UKBMumXNuIUpfonzPbzclrsqXsTuhlpA=
Received: from smtp192.mex05.mlsrvr.com (unknown [184.106.31.85])
 by smtp18.relay.ord1c.emailsrvr.com (SMTP Server) with ESMTPS id 0994DE02CC
 for <samba-technical@lists.samba.org>; Wed,  3 Jul 2019 11:17:05 -0400 (EDT)
X-Sender-Id: kvanalstyne@knightpoint.com
Received: from smtp192.mex05.mlsrvr.com ([UNAVAILABLE]. [184.106.31.85])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA)
 by 0.0.0.0:25 (trex/5.7.12); Wed, 03 Jul 2019 11:17:05 -0400
Received: from ORD2MBX03E.mex05.mlsrvr.com ([fe80::92e2:baff:fe20:c3a8]) by
 ORD2HUB39.mex05.mlsrvr.com ([fe80::862b:2bff:fe65:9848%15]) with mapi id
 14.03.0439.000; Wed, 3 Jul 2019 10:17:04 -0500
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: [PATCH] vfs_fruit: Fix potential devide by zero to resolve Time
 Machine backup max size issue
Thread-Topic: [PATCH] vfs_fruit: Fix potential devide by zero to resolve
 Time Machine backup max size issue
Thread-Index: AQHVMbJeJq0rGar/a0CaAtu9r8bddw==
Date: Wed, 3 Jul 2019 15:17:03 +0000
Message-ID: <8AFA9C1E-B871-47A4-AACB-960066E2B875@knightpoint.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [73.40.66.214]
Content-Type: multipart/mixed;
 boundary="_002_8AFA9C1EB87147A4AACB960066E2B875knightpointcom_"
MIME-Version: 1.0
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
From: Kenneth Van Alstyne via samba-technical <samba-technical@lists.samba.org>
Reply-To: Kenneth Van Alstyne <kvanalstyne@knightpoint.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--_002_8AFA9C1EB87147A4AACB960066E2B875knightpointcom_
Content-Type: text/plain; charset="utf-8"
Content-ID: <BA2237431096D547801DDEB32CC4F598@mex05.mlsrvr.com>
Content-Transfer-Encoding: base64

SGVsbG8gYWxsOg0KCUkgcmVjZW50bHkgcmFuIGludG8gYW4gaXNzdWUgd2l0aCBTYW1iYSA0LjEw
LjUgdGhhdCBjYXVzZWQgc21iZCB0byBjcmFzaCB3aGVuIHRoZSAiZnJ1aXQ6dGltZSBtYWNoaW5l
IG1heCBzaXpl4oCdIG9wdGlvbiB3YXMgc2V0LCBidXQgYmVmb3JlIGFuIGluaXRpYWwgYmFja3Vw
IHdhcyBkb25lIGluIHRoZSBzaGFyZSwgcmVzdWx0aW5nIGluIGEgZGl2aWRlIGJ5IHplcm8gZXJy
b3IuICBUaGlzIGhhcyBiZWVuIGRpc2N1c3NlZCBpbiBkZXRhaWwgaW4gdGhlICJodHRwczovL2J1
Z3ppbGxhLnNhbWJhLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTM2MjLigJ0gYnVnemlsbGEgYW5kIGlt
cGFjdGVkIG1lIG9uIHg4Nl82NCwgc28gbm90IG9ubHkgYXJtdjdsLiAgVGhlIGF0dGFjaGVkIHBh
dGNoIHJlc29sdmVkIHRoZSBpc3N1ZSBmb3IgbWUsIHNvIGNhbiB0aGlzIGJlIHJldmlld2VkIGFu
ZCBpZiBkZWVtZWQgYXBwcm9wcmlhdGUgcHVzaGVkIHRvIG1hc3RlciBhbmQgYmFja3BvcnRlZCB0
byB0aGUgNC4xMCBicmFuY2g/DQoNClRoYW5rcywNCg0KLS0NCktlbm5ldGggVmFuIEFsc3R5bmUN
ClN5c3RlbXMgQXJjaGl0ZWN0DQpLbmlnaHQgUG9pbnQgU3lzdGVtcywgTExDDQpTZXJ2aWNlLURp
c2FibGVkIFZldGVyYW4tT3duZWQgQnVzaW5lc3MNCjE3NzUgV2llaGxlIEF2ZW51ZSBTdWl0ZSAx
MDEgfCBSZXN0b24sIFZBIDIwMTkwDQpjOiAyMjgtNTQ3LTgwNDUgZjogNTcxLTI2Ni0zMTA2DQp3
d3cua25pZ2h0cG9pbnQuY29tIA0KREhTIEVBR0xFIElJIFByaW1lIENvbnRyYWN0b3I6IEZDMSBT
RFZPU0IgVHJhY2sNCkdTQSBTY2hlZHVsZSA3MCBTRFZPU0I6IEdTLTM1Ri0wNjQ2Uw0KR1NBIE1P
QklTIFNjaGVkdWxlOiBHUy0xMEYtMDQwNFkNCklTTyA5MDAxIC8gSVNPIDIwMDAwIC8gSVNPIDI3
MDAxIC8gQ01NSSBMZXZlbCAzDQoNCk5vdGljZTogVGhpcyBlLW1haWwgbWVzc2FnZSwgaW5jbHVk
aW5nIGFueSBhdHRhY2htZW50cywgaXMgZm9yIHRoZSBzb2xlIHVzZSBvZiB0aGUgaW50ZW5kZWQg
cmVjaXBpZW50KHMpIGFuZCBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgYW5kIHByaXZpbGVnZWQg
aW5mb3JtYXRpb24uIEFueSB1bmF1dGhvcml6ZWQgcmV2aWV3LCBjb3B5LCB1c2UsIGRpc2Nsb3N1
cmUsIG9yIGRpc3RyaWJ1dGlvbiBpcyBTVFJJQ1RMWSBwcm9oaWJpdGVkLiBJZiB5b3UgYXJlIG5v
dCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2UgY29udGFjdCB0aGUgc2VuZGVyIGJ5IHJl
cGx5IGUtbWFpbCBhbmQgZGVzdHJveSBhbGwgY29waWVzIG9mIHRoZSBvcmlnaW5hbCBtZXNzYWdl
Lg0KDQo=

--_002_8AFA9C1EB87147A4AACB960066E2B875knightpointcom_
Content-Type: application/octet-stream;
	name="vfs-fruit-fix-tm-max-size.patch"
Content-Description: vfs-fruit-fix-tm-max-size.patch
Content-Disposition: attachment; filename="vfs-fruit-fix-tm-max-size.patch";
	size=1386; creation-date="Wed, 03 Jul 2019 15:17:03 GMT";
	modification-date="Wed, 03 Jul 2019 15:17:03 GMT"
Content-ID: <5366808F39D77D469380F5FAF8E7CA10@mex05.mlsrvr.com>
Content-Transfer-Encoding: base64

RnJvbSA2NGViMGU0NGE5YmFmYzAwNThhMGRjNTlmZDZmZDkyM2Q5M2EzNjAxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLZW5uZXRoIFZhbiBBbHN0eW5lIDxrdmFuYWxzZUBrdmFuYWxz
Lm9yZz4KRGF0ZTogV2VkLCAzIEp1bCAyMDE5IDEwOjU2OjI0IC0wNDAwClN1YmplY3Q6IFtQQVRD
SF0gdmZzX2ZydWl0OiBGaXggcG90ZW50aWFsIGRldmlkZSBieSB6ZXJvIHRvIHJlc29sdmUgVGlt
ZQogTWFjaGluZSBiYWNrdXAgbWF4IHNpemUgaXNzdWUKClRoZSBzbWJkIGRhZW1vbiBjcmFzaGVz
IHdpdGggYSAidHJhcCBkaXZpZGUgZXJyb3IiIHdoZW4gdGhlCiJmcnVpdDp0aW1lIG1hY2hpbmUg
bWF4IHNpemUiIG9wdGlvbiBpcyBzZXQgYW5kIHRoZSBpbml0aWFsCmhhcyBuZXZlciBiZWVuIGNv
bXBsZXRlZC4gIFRoaXMgcGF0Y2ggcmVzb2x2ZXMgdGhpcyBpc3N1ZS4KCkJVRzogIGh0dHBzOi8v
YnVnemlsbGEuc2FtYmEub3JnL3Nob3dfYnVnLmNnaT9pZD0xMzYyMgoKU2lnbmVkLW9mZi1ieTog
S2VubmV0aCBWYW4gQWxzdHluZSA8a3ZhbmFsc0BrdmFuYWxzLm9yZz4KLS0tCiBzb3VyY2UzL21v
ZHVsZXMvdmZzX2ZydWl0LmMgfCAxMyArLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3NvdXJjZTMvbW9kdWxl
cy92ZnNfZnJ1aXQuYyBiL3NvdXJjZTMvbW9kdWxlcy92ZnNfZnJ1aXQuYwppbmRleCA3OGVhNTE0
MDQ2NC4uMjI1MWIwZGEwYjcgMTAwNjQ0Ci0tLSBhL3NvdXJjZTMvbW9kdWxlcy92ZnNfZnJ1aXQu
YworKysgYi9zb3VyY2UzL21vZHVsZXMvdmZzX2ZydWl0LmMKQEAgLTcwMTEsMTggKzcwMTEsNyBA
QCBzdGF0aWMgYm9vbCBmcnVpdF90bXNpemVfZG9fZGlyZW50KHZmc19oYW5kbGVfc3RydWN0ICpo
YW5kbGUsCiAJCXJldHVybiB0cnVlOwogCX0KIAotCWlmIChiYW5kc2l6ZSA+IFNJWkVfTUFYL25i
YW5kcykgewotCQlEQkdfRVJSKCJ0bXNpemUgb3ZlcmZsb3c6IGJhbmRzaXplIFslenVdIG5iYW5k
cyBbJXp1XVxuIiwKLQkJCWJhbmRzaXplLCBuYmFuZHMpOwotCQlyZXR1cm4gZmFsc2U7Ci0JfQot
CXRtX3NpemUgPSBiYW5kc2l6ZSAqIG5iYW5kczsKLQotCWlmIChzdGF0ZS0+dG90YWxfc2l6ZSAr
IHRtX3NpemUgPCBzdGF0ZS0+dG90YWxfc2l6ZSkgewotCQlEQkdfRVJSKCJ0bXNpemUgb3ZlcmZs
b3c6IGJhbmRzaXplIFslenVdIG5iYW5kcyBbJXp1XVxuIiwKLQkJCWJhbmRzaXplLCBuYmFuZHMp
OwotCQlyZXR1cm4gZmFsc2U7Ci0JfQorCXRtX3NpemUgPSAob2ZmX3QpYmFuZHNpemUgKiAob2Zm
X3QpbmJhbmRzOwogCiAJc3RhdGUtPnRvdGFsX3NpemUgKz0gdG1fc2l6ZTsKIAotLSAKMi4yMC4x
IChBcHBsZSBHaXQtMTE3KQoK

--_002_8AFA9C1EB87147A4AACB960066E2B875knightpointcom_--


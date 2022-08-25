Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A645A086C
	for <lists+samba-technical@lfdr.de>; Thu, 25 Aug 2022 07:23:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=H69lMk7CSq2G9PbBTczWuJYxxQnmoCogl6a13wsQTn8=; b=u91PlAsiLR9bkwMbdpFW9sxgRe
	6zMmYJ753HcnRMjUJZ/CI4Ljum2bfgsseWc2m5V3LwCsefV5L3OMQUSvwjvnjlg63pRaP4gqcWuUc
	4onpKeu8F1g5JncB3HGU+cYdd7JwzTO6cUP9RlIIemJa7wkqYh/gQ5gaYvgG0Xier+sSyM1VmJuB7
	lVba+YSBdxhdQZXkPoXMaw3fwYub9UuyYxVwW+jYLN0aiAwjEDHFiVjZ7cZ+zZe0LB4WTr2UJPZyc
	YrtCYsQT88GBTDVmwHkNpIq6+YWU59EOcClGZE1soAklBmLo4GTgH8Gi97vm/HX2tohuRZexPD+Mz
	cFeVZOGQ==;
Received: from ip6-localhost ([::1]:46114 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oR5Jp-002P2H-Mr; Thu, 25 Aug 2022 05:22:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55474) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oR5Jl-002P28-Fl
 for samba-technical@lists.samba.org; Thu, 25 Aug 2022 05:22:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=To:From:Date:Message-ID:CC;
 bh=H69lMk7CSq2G9PbBTczWuJYxxQnmoCogl6a13wsQTn8=; b=oTdgy8CSjqNb72sHaOZewFMobI
 S9iW2IKIg25DYYO/cKahCBrLHAWswTMxUJ7ls8+PvsnLTEzOJ+ehmS+uHm1y3FSGXbjl/uHXx1L1N
 fdxeUwimJ3Wzkla0MRh8tzobe0MifYVbSLIax7gbqmLwTWbAaVCn97gGZ6W5irrX5JIVDAHqfujFi
 Mj8otXf31fde+60vcq8f3J2tIzPfPE5eEfqDz02d+i+sk84y5Oru8e7qC/7RgHTOPRgfcNr0RG8PV
 QjFMf5XbuiDHD3WMUORf6vnkqV9q/GLch9UTzjt/6DDLbm+BaNvP/7FfxObnTWfqZb1nWiXtE/u+2
 MNCvZDa3//g5BlM9T9FXBQsLHq19lKQPNuZGc3ss8kOh24Rx0rOBvBcHoIznj82HSl8ve0CClajRw
 ZywoCQnMezuJA0QwUKsQ2CvzMQAOU1Qz4YGWXXhSkN4PapjUQgkM6WH5Bbd/XOCpUvvWUGmmsIYyZ
 M+lysDm0VIRjyFTRjI9GXFLm;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oR5Jk-001dsp-Ow
 for samba-technical@lists.samba.org; Thu, 25 Aug 2022 05:22:13 +0000
Content-Type: multipart/mixed; boundary="------------bOCsScPzVIK609nv75a0H7a1"
Message-ID: <5a1451ef-654d-f5f9-5785-9ff1cf422687@samba.org>
Date: Thu, 25 Aug 2022 17:22:05 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: [PATCH] WHATSNEW: Document new Protected Users group
To: samba-technical@lists.samba.org
Content-Language: en-US
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
From: Joseph Sutton via samba-technical <samba-technical@lists.samba.org>
Reply-To: Joseph Sutton <jsutton@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.
--------------bOCsScPzVIK609nv75a0H7a1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Sorry, I have another late WHATSNEW update for 4.17. We were missing
documentation on the Protected Users group, particularly on the
samba-tool command that creates it.

Regards,
Joseph
--------------bOCsScPzVIK609nv75a0H7a1
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-WHATSNEW-Document-new-Protected-Users-group.patch"
Content-Disposition: attachment;
 filename="0001-WHATSNEW-Document-new-Protected-Users-group.patch"
Content-Transfer-Encoding: base64

RnJvbSAwZWU5MGJhYzJhOGYyYWM0YTBlNGFjOTMxMTI2ODcyN2VjZWNkMTc1IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKb3NlcGggU3V0dG9uIDxqb3NlcGhzdXR0b25AY2F0
YWx5c3QubmV0Lm56PgpEYXRlOiBUaHUsIDI1IEF1ZyAyMDIyIDE2OjU4OjA2ICsxMjAwClN1
YmplY3Q6IFtQQVRDSF0gV0hBVFNORVc6IERvY3VtZW50IG5ldyBQcm90ZWN0ZWQgVXNlcnMg
Z3JvdXAKClNpZ25lZC1vZmYtYnk6IEpvc2VwaCBTdXR0b24gPGpvc2VwaHN1dHRvbkBjYXRh
bHlzdC5uZXQubno+Ci0tLQogV0hBVFNORVcudHh0IHwgMzUgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvV0hBVFNORVcudHh0IGIvV0hBVFNORVcudHh0CmluZGV4IDYzYzVmZTA5
YTkwLi5iMDQyNWEwNTA3NCAxMDA2NDQKLS0tIGEvV0hBVFNORVcudHh0CisrKyBiL1dIQVRT
TkVXLnR4dApAQCAtMTg3LDYgKzE4Nyw0MSBAQCBjb3ZlcnMgYWxsIHRoZSBleGlzdGluZyB0
ZXh0IG91dHB1dCBpbmNsdWRpbmcgc2Vzc2lvbnMsIGNvbm5lY3Rpb25zLAogb3BlbiBmaWxl
cywgYnl0ZS1yYW5nZSBsb2Nrcywgbm90aWZpZXMgYW5kIHByb2ZpbGUgZGF0YSB3aXRoIGFs
bAogbG93LWxldmVsIGluZm9ybWF0aW9uIG1haW50YWluZWQgYnkgU2FtYmEgaW4gdGhlIHJl
c3BlY3RpdmUgZGF0YWJhc2VzLgogCitQcm90ZWN0ZWQgVXNlcnMgc2VjdXJpdHkgZ3JvdXAK
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorCitTYW1iYSBBRCBEQyBub3cgaW5j
bHVkZXMgc3VwcG9ydCBmb3IgdGhlIFByb3RlY3RlZCBVc2VycyBzZWN1cml0eQorZ3JvdXAg
aW50cm9kdWNlZCBpbiBXaW5kb3dzIFNlcnZlciAyMDEyIFIyLiBUaGUgZmVhdHVyZSByZWR1
Y2VzIHRoZQorYXR0YWNrIHN1cmZhY2Ugb2YgdXNlciBhY2NvdW50cyBieSBwcmV2ZW50aW5n
IHRoZSB1c2Ugb2Ygd2VhaworZW5jcnlwdGlvbiB0eXBlcy4gSXQgYWxzbyBtaXRpZ2F0ZXMg
dGhlIGVmZmVjdHMgb2YgY3JlZGVudGlhbCB0aGVmdCBieQorbGltaXRpbmcgY3JlZGVudGlh
bCBsaWZldGltZSBhbmQgc2NvcGUuCisKK1RoZSBwcm90ZWN0aW9ucyBhcmUgaW50ZW5kZWQg
Zm9yIHVzZXIgYWNjb3VudHMgb25seSwgYW5kIHNlcnZpY2Ugb3IKK2NvbXB1dGVyIGFjY291
bnRzIHNob3VsZCBub3QgYmUgYWRkZWQgdG8gdGhlIFByb3RlY3RlZCBVc2VycworZ3JvdXAu
IFVzZXIgYWNjb3VudHMgYWRkZWQgdG8gdGhlIGdyb3VwIGFyZSBncmFudGVkIHRoZSBmb2xs
b3dpbmcKK3NlY3VyaXR5IHByb3RlY3Rpb25zOgorCisgICAqIE5UTE0gYXV0aGVudGljYXRp
b24gaXMgZGlzYWJsZWQuCisgICAqIEtlcmJlcm9zIHRpY2tldC1ncmFudGluZyB0aWNrZXRz
IChUR1RzKSBlbmNyeXB0ZWQgd2l0aCBSQzQgYXJlCisgICAgIG5vdCBpc3N1ZWQgdG8gb3Ig
YWNjZXB0ZWQgZnJvbSBhZmZlY3RlZCBwcmluY2lwYWxzLiBUaWNrZXRzCisgICAgIGVuY3J5
cHRlZCB3aXRoIEFFUywgYW5kIHNlcnZpY2UgdGlja2V0cyBlbmNyeXB0ZWQgd2l0aCBSQzQs
IGFyZQorICAgICBub3QgYWZmZWN0ZWQgYnkgdGhpcyByZXN0cmljdGlvbi4KKyAgICogVGhl
IGxpZmV0aW1lIG9mIEtlcmJlcm9zIFRHVHMgaXMgcmVzdHJpY3RlZCB0byBhIG1heGltdW0g
b2YgZm91cgorICAgICBob3Vycy4KKyAgICogS2VyYmVyb3MgY29uc3RyYWluZWQgYW5kIHVu
Y29uc3RyYWluZWQgZGVsZWdhdGlvbiBpcyBkaXNhYmxlZC4KKworSWYgdGhlIFByb3RlY3Rl
ZCBVc2VycyBncm91cCBpcyBub3QgYWxyZWFkeSBwcmVzZW50IGluIHRoZSBkb21haW4sIGl0
CitjYW4gYmUgY3JlYXRlZCB3aXRoICdzYW1iYS10b29sIGdyb3VwIGFkZCcuIFRoZSBuZXcg
Jy0tc3BlY2lhbCcKK3BhcmFtZXRlciBtdXN0IGJlIHNwZWNpZmllZCwgd2l0aCAnUHJvdGVj
dGVkIFVzZXJzJyBhcyB0aGUgbmFtZSBvZiB0aGUKK2dyb3VwLiBBbiBleGFtcGxlIGNvbW1h
bmQgaW52b2NhdGlvbiBpczoKKworc2FtYmEtdG9vbCBncm91cCBhZGQgJ1Byb3RlY3RlZCBV
c2VycycgLS1zcGVjaWFsIC1IIC91c3IvbG9jYWwvc2FtYmEvcHJpdmF0ZS9zYW0ubGRiIC1V
IEFkbWluaXN0cmF0b3IKKworVGhlIFByb3RlY3RlZCBVc2VycyBncm91cCBpcyBpZGVudGlm
aWVkIGluIHRoZSBkb21haW4gYnkgaXRzIGhhdmluZyBhCitSSUQgb2YgNTI1LiBUaHVzLCBp
dCBzaG91bGQgb25seSBiZSBjcmVhdGVkIHdpdGggc2FtYmEtdG9vbCBhbmQgdGhlCisnLS1z
cGVjaWFsJyBwYXJhbWV0ZXIsIGFzIGFib3ZlLCBzbyB0aGF0IGl0IGhhcyB0aGUgdGhlIHJl
cXVpcmVkIFJJRAordG8gZnVuY3Rpb24gY29ycmVjdGx5LgorCiAKIFJFTU9WRUQgRkVBVFVS
RVMKID09PT09PT09PT09PT09PT0KLS0gCjIuMzUuMAoK

--------------bOCsScPzVIK609nv75a0H7a1--


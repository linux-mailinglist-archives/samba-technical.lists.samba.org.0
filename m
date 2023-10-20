Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC127D0A93
	for <lists+samba-technical@lfdr.de>; Fri, 20 Oct 2023 10:34:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=ztvlThuvMYp2cNgfYMgOr2nV2ZLLu67NCjCtd8E0Pso=; b=c7d0+rVZyMq9lZDHve0dPAV+TC
	+XYkE3A8GsDadmxeG5vvaayWw5OK4ze0Ap9ytVxuyV1MFBeYlQoJsF9arW5F5kl4n5dkxxGdG84DJ
	tFhkmDWDI/VKc0knXcaYfqIFpr6mHGEJWgWlJ/wSxrJR9G1g9PzjweOuLS3saFDHDurepy/1xtp7V
	r7f1tNSQCcVyE+kxt6B6IgX3rixubEJEfdBkqTydLRMjneJvMSs5A6xctYq6TjiJe2eVF1vePXJTG
	tEivQu7qANOHtAC+TQB5K7Jf9wCuqBKB+XHsCIETS5jmRbMeIemN25DsAK635qU16qIFxMGtKtcXo
	oe/tp+Qg==;
Received: from ip6-localhost ([::1]:34858 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qtkwc-001TqC-Di; Fri, 20 Oct 2023 08:33:22 +0000
Received: from mx.inno.tech ([185.228.49.205]:2908) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1qtkwY-001Tq2-4G
 for samba-technical@lists.samba.org; Fri, 20 Oct 2023 08:33:20 +0000
Received: from ksmg3 (localhost [127.0.0.1])
 by mx.inno.tech (Postfix) with ESMTP id C33B580002
 for <samba-technical@lists.samba.org>; Fri, 20 Oct 2023 11:33:14 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx.inno.tech C33B580002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inno.tech; s=s1;
 t=1697790794; bh=ztvlThuvMYp2cNgfYMgOr2nV2ZLLu67NCjCtd8E0Pso=;
 h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
 b=Ew65mOWWSCqQR45JTRSPlqVtec5u9jVBsqKrx79KRqNPGAhvOds64TADv8Gzq/Jy9
 SXubaCeWFC6uLvsMPy4zzTGZqL40pD+GN404IgxRgEvAm7ytedyDqqFQo0tzubGuaM
 SHamZAzkWRo81bEuxJZQEixAKlFFcmJTNNfeUjM8s7i97c1lgs7GVIcwNeMs+f+HpI
 WY0K/L11qFQgjk2eG/UaRYpivVVF2GEQF1/Agiy25fgMk/AFk99Jgmgw/PkJPUYVPb
 HV/8kKrfAMXXAgxf5gzDB3fBIEqQWMtGqMFj5tv9htl47OGFoFcZzcSKSyS6vyKrN7
 uB+hQSyC40ukQ==
Received: from SEC-DLP-QRNT (unknown [10.0.0.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx.inno.tech (Postfix) with ESMTPS
 for <samba-technical@lists.samba.org>; Fri, 20 Oct 2023 11:33:14 +0300 (MSK)
X-CHECKED: 1
X-CHECKED-RELAY-ID: 3c279d7389fa9528e53a55e18b8e1fb6328980c7
X-Cache: 20231020_113313695_00011736
X-MS-Exchange-Organization-AuthAs: Partner
Received: from MAIL-DC1.inno.local (10.0.115.2) by MAIL-DC1.inno.local
 (10.0.115.2) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Fri, 20 Oct
 2023 11:33:13 +0300
Received: from MAIL-DC1.inno.local ([10.0.115.10]) by MAIL-DC1.inno.local
 ([10.0.115.10]) with mapi id 15.02.1118.037; Fri, 20 Oct 2023 11:33:13 +0300
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: Custom Naming Context support for Samba
Thread-Topic: Custom Naming Context support for Samba
Thread-Index: AdoDLDAwvhFyqauHSr6C4aUyBFEPGA==
Date: Fri, 20 Oct 2023 08:33:13 +0000
Message-ID: <6db90da81dd64371adfb0feb97472394@inno.tech>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.225.16]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSMG-Rule-ID: 5
X-KSMG-Message-Action: skipped
X-KSMG-AntiSpam-Status: not scanned, allowlist
X-KSMG-AntiPhishing: not scanned, allowlist
X-KSMG-LinksScanning: not scanned, allowlist
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 not scanned, allowlist
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
From: =?utf-8?b?0KfRg9C00L7QsiDQmNCz0L7RgNGMINCY0LPQvtGA0LXQstC40YcgdmlhIHNh?=
 =?utf-8?q?mba-technical?= <samba-technical@lists.samba.org>
Reply-To: =?utf-8?B?0KfRg9C00L7QsiDQmNCz0L7RgNGMINCY0LPQvtGA0LXQstC40Yc=?=
 <ICHudov@inno.tech>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

SGkgYWxsIQ0KDQpJJ20gd29ya2luZyBvbiBjdXN0b20gRE5TIE5DIHN1cHBvcnQgZm9yIFNhbWJh
IChwYXJ0aWFsbHkgZGVzY3JpYmVkIGluIE1TLUROU1AgYW5kIE1TLUFEVFMpIGFuZCBJIG5lZWQg
Y29kZSByZXZpZXcNCmFuZCBndWlkYW5jZS4gTXkgY29kZSBpcyByZWxhdGVkIHdpdGggdGhlIGZv
bGxvd2luZyBTYW1iYSBwYXJ0czoNCg0KKiAuL3NvdXJjZTQvcnBjX3NlcnZlci9kbnNzZXJ2ZXIN
CiogLi9zb3VyY2U0L3JwY19zZXJ2ZXIvZHJzdWFwaQ0KKiAuL3NvdXJjZTQvZHNkYg0KKiAuL2xp
YnJwYy9pZGwNCg0KVGhlIGNvZGUgaXMgZGlydHkgYnV0IHRoZSBsb2dpYyBpcyB2aXNpYmxlLiBJ
J20gd2lsbGluZyB0byBjb21tdW5pY2F0ZSBpbiBhbnkgcG9zc2libGUgd2F5IGluIGNhc2Ugb2Yg
cXVlc3Rpb25zLg0KDQpUaGUgY29kZSBpcyBoZXJlOg0KDQpodHRwczovL2dpdGxhYi5jb20vZ2Zk
ay9zYW1iYS8tL21lcmdlX3JlcXVlc3RzLzENCg0KVGhlcmUgYXJlIHNvbWUgcHJvYmxlbXMgbGlr
ZSBEc0FkZEVudHJ5IGNyZWRlbnRpYWxzIGZvciBxdWVyeSBmb3J3YXJkaW5nIHRvIEROUyBOYW1p
bmcgTWFzdGVyIHdoaWNoIEkNCk5lZWQgYXNzaXN0YW5jZSB3aXRoLiBBbnkgaGVscCB3aXRoIHVu
ZGVyc3RhbmRpbmcgRHNBZGRFbnRyeSBhbmQgRHNSZXBsaWNhU3luYyBpbnRlcm5hbHMgYXJlIGFw
cHJlY2lhdGVkLg0KDQpJIGFsc28gY29uc2lkZXJpbmcgZXhwYW5kaW5nIHN1cHBvcnQgZm9yIERz
QWRkRW50cnkgcXVlcnkgdmVyc2lvbiBzdXBwb3J0IChCSU5EX0lORk8pIGJ1dCBJJ20gbm90IHN1
cmUgaWYgaXQgaXMgbmVlZGVkLg0KDQotLQ0KV2l0aCBiZXN0IHJlZ2FyZHMsIElnb3IgQ2h1ZG92
Lg0KDQo=


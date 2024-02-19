Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2674E85A87C
	for <lists+samba-technical@lfdr.de>; Mon, 19 Feb 2024 17:15:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=5O17NG6i23pr/6s1RzkiQcgl+ha+BuZ0QTPbB6xmFPI=; b=R0mOnkQo33EsswedTsrU0iRBv5
	sHZ1DlQU22QKylfgynajPSAkZ2ysQe5Hs2WK6HXYre5tHMnOvj4LDfFr2mW3VE6+BllOvtN8R9VHG
	SbWVazhLaqo756lNOTrn7xYy/MGHD7u5asTgCu026C3YaI0GuzTaULqsmzFSqw6cnR4/coxJZShLj
	j54uSIU0zFOFdxiIGX3jRuPofvpVuqoiCGsoTCXXJlz+UaKnN6gipNAiN9mPOgKGFQ4LhPj1ZdkjH
	SsQZzHTcPdPMjtVH2Pu4T4LEbfKinEgYn4d01dpOqhobxTSCk6gHf0/M+x1gEQLzPKqhtjqXGJxhc
	dye5XD/w==;
Received: from ip6-localhost ([::1]:45900 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rc6Ht-008uyZ-1E; Mon, 19 Feb 2024 16:14:37 +0000
Received: from mx.inno.tech ([185.228.49.205]:12158) 
 by hr1.samba.org with esmtps
 (TLS1.2:ECDHE_SECP256R1__RSA_SHA512__AES_256_GCM:256) (Exim)
 id 1rc6Hp-008uyR-2G
 for samba-technical@lists.samba.org; Mon, 19 Feb 2024 16:14:35 +0000
Received: from ksmg2.inno.local (localhost [127.0.0.1])
 by mx.inno.tech (Postfix) with ESMTP id 6F24540030;
 Mon, 19 Feb 2024 19:14:29 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx.inno.tech 6F24540030
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inno.tech; s=s1;
 t=1708359269; bh=5O17NG6i23pr/6s1RzkiQcgl+ha+BuZ0QTPbB6xmFPI=;
 h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
 b=upU0QsM+hgE0QB37SU63uuf4nGYyHjaRJ2R9ui2+bVXOtDFqHHK1h1UKXLO80V0fs
 1Z5BGymG3UylRGMfdCBBRna2jb/TZq0H6Irct2lhZWl67KGThxFbVKzXQueYYszLqX
 VP6P6xFWL/Rhc8kcBa3sqGZRk+m697944aA+o4QOONswyNUIAqNaGE6Mlj9gmlCaYf
 tgOf7FDUf5LQk0i/Ik7fAD9XEzQthHXxSA8VVdmEutVd+hsAt9VYR1j9drXCwOUrnO
 GDzyo6IR4pPNferSYVIjEHSb3fF3OtTtaVdNiYOU9EsxvKvtaTuLMJ7L0/F8ua2uD2
 kVk5INWmdpwiw==
Received: from SEC-DLP-QRNT (unknown [10.0.0.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx.inno.tech (Postfix) with ESMTPS;
 Mon, 19 Feb 2024 19:14:29 +0300 (MSK)
X-CHECKED: 1
X-CHECKED-RELAY-ID: 3c279d7389fa9528e53a55e18b8e1fb6328980c7
X-Cache: 20240219_191428486_00028500
X-MS-Exchange-Organization-AuthAs: Partner
Received: from MAIL-DC1.inno.local (10.0.115.2) by MAIL-DC1.inno.local
 (10.0.115.2) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 19 Feb
 2024 19:14:28 +0300
Received: from MAIL-DC1.inno.local ([10.0.115.10]) by MAIL-DC1.inno.local
 ([10.0.115.10]) with mapi id 15.02.1118.040; Mon, 19 Feb 2024 19:14:28 +0300
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: RE: smbd: Broken access to share
Thread-Topic: smbd: Broken access to share
Thread-Index: AdpgH1hPuaFKQ4ZdTjar1D/HlL9lOwADG/oAACLyytD///hqAP/6zFMA
Date: Mon, 19 Feb 2024 16:14:27 +0000
Message-ID: <1e58ff293a634a2594f9ac6a7fdbb470@inno.tech>
References: <c4ef9c77c4784a1898abdd266e5dccb5@inno.tech><ec8cb899-c1e7-45bd-97c9-a8d57f2c2fa9@sernet.de><4b79869d3da4448096bc54491dcb4bec@inno.tech>
 <e75610fe-7479-4057-b48f-f207711f6c0a@sernet.de>
In-Reply-To: <e75610fe-7479-4057-b48f-f207711f6c0a@sernet.de>
Accept-Language: en-GB, en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.0.114]
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
From: =?utf-8?b?0JrRg9C/0YfRg9C6INCc0LjRhdCw0LjQuyDQk9C10L7RgNCz0LjQtdCy0Lg=?=
 =?utf-8?q?=D1=87_via_samba-technical?= <samba-technical@lists.samba.org>
Reply-To: =?utf-8?B?0JrRg9C/0YfRg9C6INCc0LjRhdCw0LjQuyDQk9C10L7RgNCz0LjQtdCy0Lg=?=
 =?utf-8?B?0Yc=?= <MKupchuk@inno.tech>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

SGVsbG8gQmrDtnJuLA0KDQo+IFNlZW1zIHRoYXQgdGhlcmUgYXJlIHNldmVyYWwgcmVsYXRlZCBp
c3N1ZXMuIFllc3RlcmRheSBJJ3ZlIGZpbGVkIHRoaXMgYnVnLCB3aGljaCBpcyBhbHNvIHJlbGF0
ZWQ6DQo+IGh0dHBzOi8vYnVnemlsbGEuc2FtYmEub3JnL3Nob3dfYnVnLmNnaT9pZD0xNTU4Mw0K
DQpTZWxlY3RpdmVseSByZXZlcnRpbmcgY29tbWl0cywgZm91bmQgb3V0IHRoYXQgdG8gc29sdmUg
b3VyIHByb2JsZW0sIGluIGFkZGl0aW9uIHRvIHJldmVydGluZyBjb21taXQgeW91IHByb3Bvc2Vk
IGluIG1lbnRpb25lZCBidWcsIHdlIGFsc28gbmVlZCB0byByZXZlcnQgdGhpcyBvbmUgaHR0cHM6
Ly9naXRsYWIuaW5uby50ZWNoL2RzL3NjL3NhbWJhLy0vY29tbWl0L2VjZmNkY2UwMmM1M2U3MWJi
Njk4MzBmNzRiMDQwZWY5MjU1MDZiNmENCkkgd2lsbCBjcmVhdGUgYnVnIHdoZW4vaWYgSSBnZXQg
YWNjZXNzIHRvIEJ1Z3ppbGxhIChzZW50IHJlcXVlc3QgYnV0IGRpZG4ndCBnZXQgcmVzcG9uc2Ug
eWV0KS4NCg0KQmVzdCB3aXNoZXMsDQpNaWNoYWVsDQo=


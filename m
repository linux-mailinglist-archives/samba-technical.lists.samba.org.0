Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BF685A8DE
	for <lists+samba-technical@lfdr.de>; Mon, 19 Feb 2024 17:25:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=fw4Ue4rjf7dgcaYAwCgIZc+exAM/hYChzmdLII/W9Fk=; b=McBxqjYXqp6jR67Z2nQihSGV3b
	boR+UViARSZSE1D1SytnxbzaCfUCxRW07+oEeI5Ukedp5QhPOGa12oHyyZVCAL78QCDTGSnSdihrC
	2VCpABDiS542qW0cnGc/BnZXKoG74/39OrH21ugh2Q1V2UzcJ6scM+5YGP7+stKaUWo9S+KWY1seR
	b+OqbSCQ6dgCkasKEtW5UEO5lQGnyTIkJEx6JSTIsDoMPwRSy/MqSqJM5eqKzVN6njkMVjjQcLN/a
	7aZoP7PSm3xs2LTNo1lMzbTLeuKuf0/zSBFv0JdwElpikAFm/A4qBsfycc+f0NAaEew03DwTHiITO
	8V9NRT9w==;
Received: from ip6-localhost ([::1]:26980 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rc6SI-008vA9-BI; Mon, 19 Feb 2024 16:25:22 +0000
Received: from mx.inno.tech ([185.228.49.205]:15854) 
 by hr1.samba.org with esmtps
 (TLS1.2:ECDHE_SECP256R1__RSA_SHA512__AES_256_GCM:256) (Exim)
 id 1rc6S7-008vA2-4H
 for samba-technical@lists.samba.org; Mon, 19 Feb 2024 16:25:14 +0000
Received: from ksmg3 (localhost [127.0.0.1])
 by mx.inno.tech (Postfix) with ESMTP id 095D480015;
 Mon, 19 Feb 2024 19:25:08 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx.inno.tech 095D480015
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inno.tech; s=s1;
 t=1708359908; bh=fw4Ue4rjf7dgcaYAwCgIZc+exAM/hYChzmdLII/W9Fk=;
 h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
 b=m1TrrlQh2FYeVkjh21lcEnLhAHp7TU8hQ8G8dtyZAsUOfQK+FweVNWAQu7j0l0N9J
 E54rUHX/UWzjrZzo1TGRx/kLFES+rr2bYh0u/k5OqhVEzh0vV6eorYITkuwIF1ZH+q
 UjjEVF5WnUvVylXEnMW74AT3Fzb72TqcNA9frtbo8SRNENvCpOkscXj/wvRtPnZRMs
 rvZNLTTcztlu8DlUodFJRJnALD8Nmb9pYokJbJD72haz8U0tgughF5+T3eljtzNXV8
 GVNG5QQxALhPcC98s5CXYPwieD26zxdQGGSjkW622O6FBBrIJOKKATuQ6QiktWLAvY
 lUnv2ZC22k8xQ==
Received: from SEC-DLP-QRNT (unknown [10.0.0.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx.inno.tech (Postfix) with ESMTPS;
 Mon, 19 Feb 2024 19:25:08 +0300 (MSK)
X-CHECKED: 1
X-CHECKED-RELAY-ID: 3c279d7389fa9528e53a55e18b8e1fb6328980c7
X-Cache: 20240219_192506241_00028671
X-MS-Exchange-Organization-AuthAs: Partner
Received: from MAIL-DC1.inno.local (10.0.115.2) by MAIL-DC2.inno.local
 (10.12.115.2) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 19 Feb
 2024 19:25:05 +0300
Received: from MAIL-DC1.inno.local ([10.0.115.10]) by MAIL-DC1.inno.local
 ([10.0.115.10]) with mapi id 15.02.1118.040; Mon, 19 Feb 2024 19:25:05 +0300
To: Michael Tokarev <mjt@tls.msk.ru>, "samba-technical@lists.samba.org"
 <samba-technical@lists.samba.org>
Subject: RE: smbd: Broken access to share
Thread-Topic: smbd: Broken access to share
Thread-Index: AdpgH1hPuaFKQ4ZdTjar1D/HlL9lOwADG/oAACLyytD///hqAP/6zFMAgAo4+4D//81MQA==
Date: Mon, 19 Feb 2024 16:25:05 +0000
Message-ID: <721498a94efc48bba3e4d17bdc6eda30@inno.tech>
References: <c4ef9c77c4784a1898abdd266e5dccb5@inno.tech><ec8cb899-c1e7-45bd-97c9-a8d57f2c2fa9@sernet.de><4b79869d3da4448096bc54491dcb4bec@inno.tech><e75610fe-7479-4057-b48f-f207711f6c0a@sernet.de><1e58ff293a634a2594f9ac6a7fdbb470@inno.tech>
 <00cb5b3d-572a-4ebd-9c1c-50df9fafc129@tls.msk.ru>
In-Reply-To: <00cb5b3d-572a-4ebd-9c1c-50df9fafc129@tls.msk.ru>
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

SGVsbG8sIE1pY2hhZWwhDQoNCj5naXRsYWIuaW5uby50ZWNoOiBkb21haW4gbmFtZSBkb2VzIG5v
dCBleGlzdCBhbmQgdGhlcmUncyBubyBzdWNoIGNvbW1pdCBpbiB0aGUgb2ZmaWNpYWwgc2FtYmEg
Z2l0IHJlcG9zaXRvcnksIGVpdGhlci4NCg0KSSdtIHZlcnkgc29ycnkuIENvcGllZCBsaW5rIGZy
b20gd3JvbmcgYnJvd3NlciB0YWIgKGFub3RoZXIgdGVzdCBjb21taXQgaW4gb3VyIG1pcnJvciBv
ZiBTYW1iYSByZXBvKS4NCkNvcnJlY3QgbGluayB0byBjb21taXQgYXQgZ2l0bGFiLmNvbToNCmh0
dHBzOi8vZ2l0bGFiLmNvbS9zYW1iYS10ZWFtL3NhbWJhLy0vY29tbWl0LzVlOTI1Zjk3NTVmYWQx
ODA4NjM4NjExNTdhYTc1NDhkODNkZDNmZGUNCg0KQmVzdCB3aXNoZXMsDQpNaWNoYWVsLg0K


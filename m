Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE862753B3
	for <lists+samba-technical@lfdr.de>; Wed, 23 Sep 2020 10:53:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=NEU9c80VrUcZmHxMDwTKlRk+AprMkcz/2SuCnnaNJ9g=; b=1HtN8WU+Ej0zvZI7ihUTTQ2J1N
	UXQLStWi1EavS+ytnr+1YT8VlUaiGtlfREwhPUUrohTNOAZ3jADc/dhXI5N61APEfDnOaw65GnBoY
	gv/GTNKvSUWP5hvomn00NE2fnMFgvxqPdhbfThP65FF3dDHWEmInNk7JVI/3GiolgtzLD3zpWJh6V
	Ot3xGQh+mk3rnjlZvH9XzHSuRsJsSSsaVydYOauvQYZZnNV+Ldl+w1JYPizjRxZub6aKxA0eojsd3
	M0EoA5RvCHNyUDWi77E+CUOydQAfrPLXcYWUr/pFRgKttzkztdjR7Ikj9cy2AvVPeMBWQBvBuoNYt
	BRb23TpQ==;
Received: from localhost ([::1]:53906 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kL0W8-006qTw-JB; Wed, 23 Sep 2020 08:52:48 +0000
Received: from mail-bn8nam11on2063.outbound.protection.outlook.com
 ([40.107.236.63]:24449 helo=NAM11-BN8-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kL0W2-006qTp-Hl
 for samba-technical@lists.samba.org; Wed, 23 Sep 2020 08:52:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3vqcKgQO3oi2BQbpyJ24FbnTCMk4pLlh7px+IHbeIOOwA4fzmRdTxX7Rm4jev/XepeeW1FgNcXyMu/L9m2mo44stO/nvB3dySoRxWl0x02wFx008xP0hMJrxjG66cqtYajSZY2H5ousT4RVE+bvoKzmqeuY9hfJ9kwvkGfNuiRbvnWzWWPQPS1AFU4AN+O5JvyUiFMYmpwCNWWTxrTezaHivVEOTiaj1HHUWrXdZiU6gETWhA9v9HL1/tFkQvh5QL9DU78avHfvyUvfovZLPU7311mtcVcKYLrzRIlyRXcOColM1UTixEaANgXPUjn08EX/Vj+W4iQJ/vqMIH2Ccw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m3warWJNuRqWKGD8lpoMX862ZnWBdA4ae0oxza5dqZ4=;
 b=PhSqS9tQ3ymg7vM4GaFZkPi8RCnFqsgFaLv8as+nMGtgFztmHU89hp93QWzf7vejOlbYRPDtXyru+uCwvaoHkBU6igmpKa3oRGBYqVpq2YwfVhwKsMZ69m2nFy7dhX/GqHuttoC9uxpuUF/EOk0eSF5f4brQhDEO6yxlLhrTzS8c/XzfCtV/XCfS7qWJR0bLq3gvwq6xbyyJh+1uHqRbnHZUNpAv6xDvP223QWp2eyxKwhm4hRuJ80f1hfVmHvrngFpD8mrXhzBJecVXJmFvtyCmfERHGqKFZRBGDpQTmHNdytGVk/SOBkeMua9FE9SmuWnO73cq/GT4MT0CztgbLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m3warWJNuRqWKGD8lpoMX862ZnWBdA4ae0oxza5dqZ4=;
 b=LUAgU0PJSzLQfGwu9RSwLCSxjwRAe8AxoMhz5wZuztlnT8RYnzryWFdmDxqYF7nw59nzd4h2vSWagM78nJxhZTB1M1hFupEAyJxnbJun7C5YiG87CUvPQST7HDjdKKDOcctFxs3BP+5iiyBSo9Oo3zPLSPcyC+KcuU6vfP82Tlc=
Received: from BYAPR05MB4629.namprd05.prod.outlook.com (2603:10b6:a03:50::14)
 by SJ0PR05MB7503.namprd05.prod.outlook.com (2603:10b6:a03:28b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.5; Wed, 23 Sep
 2020 08:52:25 +0000
Received: from BYAPR05MB4629.namprd05.prod.outlook.com
 ([fe80::d13f:b837:ebe9:cb14]) by BYAPR05MB4629.namprd05.prod.outlook.com
 ([fe80::d13f:b837:ebe9:cb14%7]) with mapi id 15.20.3412.021; Wed, 23 Sep 2020
 08:52:25 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: Regd. per-share stats/profile support
Thread-Topic: Regd. per-share stats/profile support
Thread-Index: AQHWkXp71t3ZWYAHdEGe3m9CV4dPQal2RvQA
Date: Wed, 23 Sep 2020 08:52:25 +0000
Message-ID: <ABE15E44-4F57-46AB-AC86-039B605145C3@vmware.com>
References: <F750455B-1BA5-4E6F-86C2-C282A3A4FC1C@vmware.com>
In-Reply-To: <F750455B-1BA5-4E6F-86C2-C282A3A4FC1C@vmware.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.samba.org; dkim=none (message not signed)
 header.d=none; lists.samba.org; dmarc=none action=none header.from=vmware.com; 
x-originating-ip: [106.51.116.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e81565b-8cf9-41bd-a46a-08d85f9dfe55
x-ms-traffictypediagnostic: SJ0PR05MB7503:
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Hl1w7DyElDUl6j9sL6rlA61twAk2PVyxpwR3S3CfFP5ml9tTLfVBLtHoUCjQKDvJYkXUclc1ppc610vSmDYtjGUQBuzqo/XSwNA6md8z+yJtOyn1QeiqhPCmp4HMl0c6EqO/6gAhM43QTGAF2SiZHDHoNtNr6i3Ks5+qQZKSe5c1fxpRUkF+QRIVOjo3LvxueSBsUVsv/8YMaeCJFKC64BMqnSTvr7mPOzf9Cbv7Btd2mevu35nLpRW2pWzKI4LPm9caB1cYSrwj+0wyYLT9f8dZE4ixfPeWbswU7xJ/Yp9tk7jUTQduUtKr1erZRHmwWDnI4tG19+7BLwZntD4O2w==
x-ms-exchange-antispam-messagedata: EBaAnDNl0HjjO++u+4xAuDAbFfKpYuh/ggVitFOT2vgepPOSn5zVAcZLBAljZ1IwHf9pKd8zz+vOKBJ2c40qu789lSNCe5u8Mvkv/cb2LEdezPEDYaJ6juycdREl+m9+bEeaZTphe5J9ZIWTcptkXa/zMJs7B6OiOOXSrx1PuC3snHUmy3NY7vVMeXPgj5x7V7+jzgf+tZzcTezNU+0bChEJfBCyyZf9YS2VheE2Y7GByIzwVecE+X8aq7GoOe9iv6q8I2eITMCuOh0u9KmkPiTGr6bgFMTw9c54nttgR8DlEnDhrjTfXc/LZS1ngNrVnYyomNf54msmWPX3Et16BL9qAeKo5rAemToQ8xhz1XUAhFKcYH1DVjeN67TmoKYIi007+z/f8Hwi4hSs8l56DjiCk9T6B1HN0zk4qHHc89riicZfwg2jT9LSlWqqE6g9GvuMt5Jp0k4Hj52YRTrnciFHEDyPS6YGnlcq9K1cOsPsb0VwSXqFgMblh6nB0edijnoNT3gnm77ZZK//a0VbRcv/356Xe1WM6wFKq5vR3tTMvdgdeaQaMI/remyCbpje74oiexwi/m4znOBSPK4fgJcOii89oEjiFo6jDcT2gtuD5deCbSbt8uGbSkuk8P7F3/TwyKPm1XBY/Yx4oZyNtw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR05MB4629.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e81565b-8cf9-41bd-a46a-08d85f9dfe55
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5usAdb0AeG5G9V01nrdUEB2NPu02xOOqrKyd0fgc78SjUGuQHUGajtymRjd4/Bb5iE+hfrvon6URvunVgEVSYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR05MB7503
X-Warn: EHLO/HELO not verified: Remote host 40.107.236.63
 (mail-bn8nam11on2063.outbound.protection.outlook.com) incorrectly presented
 itself as NAM11-BN8-obe.outbound.protection.outlook.com
Content-Type: text/plain; charset="utf-8"
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
From: Sudip Panda via samba-technical <samba-technical@lists.samba.org>
Reply-To: Sudip Panda <psudip@vmware.com>
Cc: "Christopher R. Hertel" <crh@samba.org>, Michael Adam <obnox@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

SGVsbG8gRXZlcnlvbmUsDQoNCkkgYW0gbmV3IHRvIFNBTUJBIGNvZGViYXNlIGFuZCBnb2luZyB0
aHJvdWdoIHRoZSBidWlsZGluZyBibG9ja3MgKHRldmVudCwgdGFsbG9jcywgVERCcyBldGMuKSB0
byBhZGRyZXNzIGEgZmVhdHVyZSByZXF1ZXN0IHRvIHByb3ZpZGUgcGVyLXNoYXJlIHN0YXRpc3Rp
Y3MvcHJvZmlsZS4gQXMgb2Ygbm93LCBJIHNlZSB3aXRoIHNtYnN0YXR1cyBjb21tYW5kICh3aXRo
IC1QIGFuZCBwcm9maWxlIG9wdGlvbiBzZXQpLCBTQU1CQSBwcm92aWRlIGdsb2JhbCBzdGF0aXN0
aWNzLiBBbHNvLCB3aGlsZSBJIGFtIGxlYXJuaW5nIFNBTUJBLCBJIGNhbWUgYWNyb3NzIFNBTUJB
IFRBLiBXb3VsZCBsaWtlIHRvIHVuZGVyc3RhbmQgd2hldGhlciBzaW1pbGFyIHJlcXVlc3QgKHN1
cHBvcnRpbmcgcGVyLXNoYXJlIHN0YXRpc3RpY3MpIGNhbWUgaW4gdGhlIHBhc3QgYW5kIGFueSBh
bmFseXNpcyB3YXMgZG9uZSBmb3Igc3VwcG9ydGluZyBpdCB1c2luZyBUREJzLiBJZiBhbnkgYW5h
bHlzaXMgd2FzIGRvbmUgaW4gdGhlIHBhc3QsIHdvdWxkIGxpa2UgdG8gdW5kZXJzdGFuZCB0aGUg
b3V0Y29tZSBvZiB0aGF0IGZyb20geW91IGZvbGtzLiBJIHVuZGVyc3RhbmQgdGhhdCBtdWx0aXBs
ZSBjb25uZWN0aW9uIGNhbiBhY2Nlc3MgYW5kIG1vZGlmeSB0aGUgcGVyLXNoYXJlIHN0YXRzIHdo
aWNoIGFjdHVhbGx5IGlzIGEgY2FzZSBmb3IgZ2xvYmFsIHN0YXRzIGFzIHdlbGwuDQoNCkNoZWVy
cywNClN1ZGlwLg0KDQpQUyA6IFdoaWxlIEkgYW0gZ29pbmcgdGhyb3VnaCBTQU1CQSBjb2RlLCB0
aGUgdmlkZW8gZnJvbSBSYWxwaCAoRGV2ZWxvcGVy4oCZcyBndWlkZSB0byBzbWJkKSB3YXMgdmVy
eSBoZWxwZnVsLiBUaGFua3MgYSBsb3QgUmFscGggZm9yIHN1Y2ggYW4gYW1hemluZyBkZXNjcmlw
dGlvbiBvZiB0aGUgY29kZSBmbG93ISBJIGZvdW5kIGl0IHZlcnkgdXNlZnVsLiBBcG9sb2dpZXMg
Zm9yIHJlc2VuZGluZyB0aGUgbWFpbCBhcyB0aGUgZmlyc3QgbWFpbCBkaWRu4oCZdCBnZXQgZGVs
aXZlcmVkIHRvIHRoZSBncm91cCBiZWNhdXNlIG9mIGluY29tcGxldGUgc3Vic2NyaXB0aW9uIHBy
b2Nlc3MuDQoNCg==

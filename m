Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB4C187376
	for <lists+samba-technical@lfdr.de>; Mon, 16 Mar 2020 20:35:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=6IhxHhIVXyZcafIRX0O2/EM02I2FdsbcquhlvZ5/euY=; b=klEYx7sRMER1XLp7Ismy1F3Ih2
	58lHOar2zIE8vwbZX9OoWrvmf3YxYqldSNQaO8tpuawDXg3oOfKrHfJCjr9mkcQsXQQUdmhBK4nF1
	CoBwKjNkbc6uckMnyFucizv3QVVAm0fh3BvBqpn7ZtlMHo5875X/ggGxTZk2sljRpJnfGPssRCBbC
	6498wXt7IB6vGrmBagfe5YsbNPJxbn9mnnmPXcUQxRj+RjZC1LWOothfnekUqqvwU37Fzk/djGCxR
	7fakLOKwwohu12YwMDTXZpCp7kbwSoSOB1omyM4K9cyuOEK5zRuK3vcWP1KqbT0Fxh5ShFpK5hT2B
	7D1ZI6bw==;
Received: from localhost ([::1]:53166 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jDvVX-000CGS-UD; Mon, 16 Mar 2020 19:34:39 +0000
Received: from mail-eopbgr640125.outbound.protection.outlook.com
 ([40.107.64.125]:38241 helo=NAM06-DM3-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jDvVS-000CGK-W7
 for samba-technical@lists.samba.org; Mon, 16 Mar 2020 19:34:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OdTk6nxE8FqsAv4yVNrAyIlkg3cRJ+xR4Nl4EJ6BE3LrVLm5DxlM2ZcZ34QqKwmCq/x2K+5A7QGPARlTyBLO7C33qe1lNJfgv/bjxNBz26GeyVDQj9SlqHuf5JITqbUUollLnQzzpT11va/+jtPkQzVwOhXgJrT9QTrex20CNaRZ+iNjI+RNr8p4FTJI57g0vrPq1xdesK4m6fJvU3hHM4hFHRWP324tL3MJzapu8Lo/TOQdWliJkfBndj8E308c7aGykqNsZMTIeEaKr+1aqVKz5mKWIk3mRsznAImuiFiCG6cpYVUQsQ92nXHUN5CeSnwOl0i5OMRYCPSmj9uxtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6IhxHhIVXyZcafIRX0O2/EM02I2FdsbcquhlvZ5/euY=;
 b=bC/A2o0XuMZ4KzqfkKU5U9kpr9NgMslpSTgcmoRKBYwYKr6TZA80sJ2ZSW/EltC+6aZcFB6hrR7NCkxZTzRMT717kXEHiuRCMti20z6zpUt0mH6QuHpHZXMhKaTQRgEhFxIfHHslG4I2m+qehIgbeQ7vxHjGMVKdA5JSP+Saf1xgkxBg+NleWzdwdIpvvDKbGAOtDopBLKwLGxBvaxRIa05wfRDwqw38mEXGxjgcxua3eljjXujihDJgD1s3dB+8YmB5CFIuhzPwXyxts/xjtkOBDB8M+Er5qTWw+iKbKEum9XkSaqmC3mPLFr8344r/9xRsLc++HRobyKRxdWxNOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6IhxHhIVXyZcafIRX0O2/EM02I2FdsbcquhlvZ5/euY=;
 b=TnWuvaRIZt+lUnDZ8uZqHSqDmjfBPgqHPEvMkF2LnexQHugH2+OgpHK7vHGj8ADvlFMIBhcwpluKLg/ZcsnfE4kHVUW9fW+wSjm5kA3L0yYSif8l2Zh8Dt9+tzHP3+sb/nZ3opbS8U7s5Nw8qB8chj4ZnWfWftr4ypqmWheFlzI=
Received: from MN2PR00MB0655.namprd00.prod.outlook.com (2603:10b6:208:c8::28)
 by BL0PR00MB0804.namprd00.prod.outlook.com (2603:10b6:208:17c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2870.0; Mon, 16 Mar
 2020 19:01:12 +0000
Received: from MN2PR00MB0655.namprd00.prod.outlook.com
 ([fe80::5cce:b968:d788:e953]) by MN2PR00MB0655.namprd00.prod.outlook.com
 ([fe80::5cce:b968:d788:e953%3]) with mapi id 15.20.2870.000; Mon, 16 Mar 2020
 19:01:11 +0000
To: Steve French <smfrench@gmail.com>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Subject: RE: [EXTERNAL] [SMB3] New compression flags
Thread-Topic: [EXTERNAL] [SMB3] New compression flags
Thread-Index: AQHV+xwlnZm8mvBcE06Iqps/jdfcOahLk0dA
Date: Mon, 16 Mar 2020 19:01:11 +0000
Message-ID: <MN2PR00MB0655F5240B306E7B1963CDD3A0F90@MN2PR00MB0655.namprd00.prod.outlook.com>
References: <CAH2r5ms_oxqwHm56nzabM-x2XMR1Ni-WD1_LEYYxOW_NkswsOQ@mail.gmail.com>
In-Reply-To: <CAH2r5ms_oxqwHm56nzabM-x2XMR1Ni-WD1_LEYYxOW_NkswsOQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=b63f7026-43ed-446f-824b-0000b6f9602d;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2020-03-16T18:57:33Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ttalpey@microsoft.com; 
x-originating-ip: [96.237.161.112]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4081fffb-f151-4bb9-0c2e-08d7c9dc6492
x-ms-traffictypediagnostic: BL0PR00MB0804:
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: O+odcRgz1SV0veA3u9KslfYtmq5wmF70lSqs/J/CIeuD/z9zp2hYkK7f4Xq/16y1McvSKCkD9lYchGTD4EZT+FpdSg9X7x8jJlkozOutIFRq1enxyexfU4hpt/xhlu5lP6BrJsL4C6VFt3PAoRbN7xkoy7bWBKp8wxYy7KLN/ScBnZAXuqPGz6QkurH/UkWr0Y8ifud1/mA6EGVw9rcK7UupryQVp5ivU+Hwm6t3T5JuC2T64BIlMz+S3bNSu3TgB+uRp7wlTH8DKsfB7DbpMmbom3tks5OC3I/eWaw2Tb2WvrNA7t9LYf/F25pQ+WIy9nRg4lHY7EPuebFl7WaqrLg/e3aMcbBJDFoCOszzGDOiIupbilXLIjP9ulHdKfqkdomT0QbGcAXIKUSY0ynStVTe477HTMR+/2ZjwzHr8ne8bLn6WHX68S+C6o/52IXbi4tQr/hzdtxLnIWzyzT2Ct/NPiXqTQCCM092rrqEQGwDxs1UQV/A/HRNkxty/BbGY2Xa5jNYkHYpMVFekekZmA==
x-ms-exchange-antispam-messagedata: kEq6NmfQryDpk8pLemvbFqft5teGYbxHHtcJHuNvF5EiBqY1fGaL9/4t+xRtt5MXvdvNwRehCaLTvDLgSLy2CLfFpmW8kbyREA0baEzGLIWdf+Jg8eEJ5hEFV9kVIRUPKCZJnOM74elTUcvMPpJhWQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4081fffb-f151-4bb9-0c2e-08d7c9dc6492
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FbRjK29saZNkW/1i8s3kBTUskqhAQvgTI7faEnf4kXJ8zJnexrCnd28jrFnX7+v0HPgDpMirDhGwWAUGSIHBXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR00MB0804
X-Warn: EHLO/HELO not verified: Remote host 40.107.64.125
 (mail-eopbgr640125.outbound.protection.outlook.com) incorrectly presented
 itself as NAM06-DM3-obe.outbound.protection.outlook.com
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
From: Tom Talpey via samba-technical <samba-technical@lists.samba.org>
Reply-To: Tom Talpey <ttalpey@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Tm90ZSB0aGF0IHRoaXMgbmV3IGRvY3VtZW50IGlzIHB1Ymxpc2hlZCwgYXMgYWx3YXlzLCBpbiBh
ZHZhbmNlIG9mIHRoZSB1cGNvbWluZyByZWxlYXNlLiBUaGUgbmV3IHByb3RvY29sIGJpdHMgd29u
4oCZdCBiZSB2aXNpYmxlIHVudGlsICIyMEgxIiBzaGlwcy4NCg0KaHR0cHM6Ly9kb2NzLm1pY3Jv
c29mdC5jb20vZW4tdXMvb3BlbnNwZWNzL3dpbmRvd3NfcHJvdG9jb2xzL21zLXNtYjIvNTYwNmFk
NDctNWVlMC00MzdhLTgxN2UtNzBjMzY2MDUyOTYyDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQpGcm9tOiBsaW51eC1jaWZzLW93bmVyQHZnZXIua2VybmVsLm9yZyA8bGludXgtY2lmcy1v
d25lckB2Z2VyLmtlcm5lbC5vcmc+IE9uIEJlaGFsZiBPZiBTdGV2ZSBGcmVuY2gNClNlbnQ6IFN1
bmRheSwgTWFyY2ggMTUsIDIwMjAgNjo1MCBQTQ0KVG86IENJRlMgPGxpbnV4LWNpZnNAdmdlci5r
ZXJuZWwub3JnPjsgc2FtYmEtdGVjaG5pY2FsIDxzYW1iYS10ZWNobmljYWxAbGlzdHMuc2FtYmEu
b3JnPg0KU3ViamVjdDogW0VYVEVSTkFMXSBbU01CM10gTmV3IGNvbXByZXNzaW9uIGZsYWdzDQoN
ClNvbWUgY29tcHJlc3Npb24gcmVsYXRlZCBmbGFncyBJIG5vdGljZWQgd2VyZSBhZGRlZCBpbiB0
aGUgbGF0ZXN0IE1TLVNNQjINCg0KDQoNCi0tIA0KVGhhbmtzLA0KDQpTdGV2ZQ0K


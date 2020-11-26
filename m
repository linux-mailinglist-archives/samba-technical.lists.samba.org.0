Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D57122C51AA
	for <lists+samba-technical@lfdr.de>; Thu, 26 Nov 2020 10:59:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=oaeTfjoPJcewptMsLZ9qnwqZwI5tnmD3M/pQMLB8raI=; b=RxuqJRzW3t0oRODYL2eymU6y8m
	qswOv9f98SYlZaC2UPW1xlVG0Pd1aYMOMHrMLOl2UJNp98dQ/zowaxPvtE/3E92z6gJDsBURF/g2g
	K8Svc2znzGFamIi8z+L2FrBkPLMoE5t7lbwOYoZnF67+YJLSODc0ILfjMounTYa+ST/8nAXUsyu/L
	Q8dlN0Sjbh+d3i4oJ6W9WDzoV/vx+wrqDVRQBTseJLSht5H94zu7DYnZ6ZA6kpwnjZ9V1RwFgkY5k
	vC0ONXiVQlAZSKFhRJYLog0VGpAbPZIXCEiGmsbkdP1JUkERJi0PWPOfv8qo1Yx6nH4BS8+cQGqxC
	GspierCw==;
Received: from ip6-localhost ([::1]:54336 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kiE2s-002k4X-IQ; Thu, 26 Nov 2020 09:58:34 +0000
Received: from mail-co1nam11on2066.outbound.protection.outlook.com
 ([40.107.220.66]:58720 helo=NAM11-CO1-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kiE2l-002k4P-56
 for samba-technical@lists.samba.org; Thu, 26 Nov 2020 09:58:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SP98hn1bX3j3mLiwVmXHh9QINdv5bhuGoUP6zgoZxAHeso54FTJkSW+SYCfUlK0qBIZsX0W/3Dtn63WcT7Ro5a/SdXH4Njnb6eKAozNlJVuDY9S0n2BnfkNZkGYC1y3/+tU79TGPQ0wpJmjbYhD+wHvlQAqM0FgsmeJLu3ygUYoE7Kt4t7IkxX+Vqy85zUYeKOdkIN0MKmYy6i2vOqf83g1wliU1x1IR8B6LczSOES8ZSliUHRONeZ6kC5Z3Wj3vKCtEJnD2Z+O6p692qdAWsa3DEAS30HXf6pTJPnWaZyYz1SFb7B2GxTJhGAdR8g65y2olOomq1lDNjYZCt0JVwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXAeNNaV3iloabgyrKuEV+VvJhEG/IX82pNdXw6XR8o=;
 b=XArwuLxekTq2VKwdfjPk7sCVES8LpYg9VI8WjwNExSKEV3rVbPj88ZnztU95DYBkJwl9xNaGMC9tkefVDDkYJUmga84tce7h6zAPRsmtnKzTsxy3MciXbAdIbjyPVxfWr8nicYI7jPuQ43y4tddDQmtTtfHAmlg5n9JAWzjTrCEb3PjXGd5avpumP5XTVsunp77tzE6cNK7MH0RE9KMi3JMmyuxwIFciC1kmWKzFeKWzrv+4LuNgBB0SIwktJOPjZOtIgTuo2FsFLIiETu2HQgAcC4F5Zu3xRLALeadsS1D5TYN4HreTAkaR6xZZMqDaqtrhNdI2mw1o5+6OD59x+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXAeNNaV3iloabgyrKuEV+VvJhEG/IX82pNdXw6XR8o=;
 b=C3Z67PrdVj9KLx8qW0kf+x88EoNg3B0WaXJPXDGAaSXIpuQ6XRQTOSwGTLDe2ISQrAslUnx4+qroyzumcTwVYsiCk+SXfM5rWA0nb4D3MZwU26AYMKpOuoesI+fFGDcb9cpslPNJhdrgLXFOIu8t0FH1HVySG9IkxEKd3HAha1c=
Received: from SN4PR0501MB3854.namprd05.prod.outlook.com
 (2603:10b6:803:4e::30) by SN6PR05MB5533.namprd05.prod.outlook.com
 (2603:10b6:805:c1::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.18; Thu, 26 Nov
 2020 09:57:59 +0000
Received: from SN4PR0501MB3854.namprd05.prod.outlook.com
 ([fe80::a08f:a4ba:455e:fc91]) by SN4PR0501MB3854.namprd05.prod.outlook.com
 ([fe80::a08f:a4ba:455e:fc91%6]) with mapi id 15.20.3632.009; Thu, 26 Nov 2020
 09:57:59 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: about "ea support" parameter
Thread-Topic: about "ea support" parameter
Thread-Index: AQHWw6zWZtIuZKIKjkWykUOFACJ9vqnas/8A
Date: Thu, 26 Nov 2020 09:57:59 +0000
Message-ID: <01389598-12D7-4F10-9490-99441D905D34@vmware.com>
References: <5C9D413C-7EF4-47EF-975B-ACE19B40B2AB@vmware.com>
In-Reply-To: <5C9D413C-7EF4-47EF-975B-ACE19B40B2AB@vmware.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.samba.org; dkim=none (message not signed)
 header.d=none; lists.samba.org; dmarc=none action=none header.from=vmware.com; 
x-originating-ip: [101.87.214.48]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 64ae7918-f0d8-43fb-f807-08d891f1c1e4
x-ms-traffictypediagnostic: SN6PR05MB5533:
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EKT+6B2rTV+JNCOrKojBJyj/2sU1FC2bU4SQyD+gvgTdTPxWQfizEP4gIEdTdLPeYBm44hhhxWPEFgr59VIaA/knGJBNds+T3OoN/0h3cNTiZlf7SMzrAk8yibO4nM4iRwliuXO+fy9DLm3GBRAKWHcea0qHsxTSYd/8r9oatgKPN+8ypAvi5VhXPsBB0eYyC+VR/O6LKwxPblDCIKsVUBrsYIWv3AZyjPCiAiyAmqg/vh9eBvC/ijdzvlSD1bQ7fhw+TJPy/75rRD4QaVh7m0R3R4xVhNfmJhl+xDTRVaYZ//xHZWol/acTHfnFjE4/+IQbHl23TZ2GrU7vI/DxCg==
x-ms-exchange-antispam-messagedata: =?utf-8?B?aTA5UW02SFdIUFFpWDY0ZWF6OU04YVh0OG9nMG9CbHZwUTlzaExLK3M0TXRk?=
 =?utf-8?B?Q1hOai9zSlVGbGhWMDFaY1RZVmJJWTg0WWw0dGZHcEp2cUtVVnFUTFN3Mjhl?=
 =?utf-8?B?UlV2Vm1uSWhSOFVicE9sYWVUbFRBNzJFUk10RXExRm9XU0NzMFhkaDhGNjhi?=
 =?utf-8?B?d0EzcW9PeXdzWEFoclg4ZjB4cjA4WjIyQmpTalV4ZlluRHZneTFBNG1TU1N2?=
 =?utf-8?B?M1JpdGV3UFVKS1ZVV2Q5cUNpSjRoYUVtMG83VmdVS1FXaitpejVqVEpwK0Yx?=
 =?utf-8?B?UXl0cUF4QkMwVzF5TE4xbldncXkyd1FIZndzZzFsVFl0a2pWWERWZkcxTFVa?=
 =?utf-8?B?YlNvVE9JVjBFRmFqUWd0RkhVVkNxK2NJcnl2Z3RTcTQ1dnZmMGxYWk0zV3pt?=
 =?utf-8?B?MXBlZmtpajVQVlprUGU0dnhqZkJhNnhWSnpORytKZlpySVV3eFdvaEtrUDRK?=
 =?utf-8?B?RVc0QnRtTEplMk5yTnVHcXFQbEIzY1U1dkdoS3RHMXYvc091ZGpvdUdONHJr?=
 =?utf-8?B?Z3N6SkFmWE1GYUtHa2RNZnZtSllyY3U4bTdtOXlhYWw4aXNudFNjN3d4bEVY?=
 =?utf-8?B?REk3ai9RWW9FOFY1SVJ5aTJHUzh0cXJZSFJCeFl4NlE1b2czM20wdmdEajNv?=
 =?utf-8?B?bzZ3R1h0UXBNVk9Kbng0OTJYMEU3M0JTRExXZWNsNUNTRlQvRExTdmoxd1Fv?=
 =?utf-8?B?NTNuL2toTUxiQ3NKOUROZ2pMVnpGZ2NOcHBKenBHVWkrd3Y4V1doSVFjVzJx?=
 =?utf-8?B?ZzdQS0tXdE5WUHlQRXdBK0x4UzNaK0w1SFRaQzZabS9sN2U3KzRaaVJnVjRW?=
 =?utf-8?B?TGRVKzV1Ykx2ZXFvZGxYaEhPbUFqOC9Rd095U2dZL3JkbThkZGVCT3EzTEhX?=
 =?utf-8?B?NkwxaUlpdE1vYlljeDc5RXg5WG4wZDgwVjVYc294NlEwSkxXd0hiK1FaU21y?=
 =?utf-8?B?SExkaFlIY2JsUVFuNE9LSllLS1UyUURGSWRNam9jT0oyZkh0R0xBSjJJbWs5?=
 =?utf-8?B?Y3hZbWpNd0hNaGJnTy9YaktkWFdnUzI5Z25JdHVBY3RUaHhJZmtRQjBqTUNQ?=
 =?utf-8?B?Z2xOcnJUWlJvdGRacG9jR2FZZnlFSUdvZ3dpODJtVVpjUUt3RHZJRnQ4c0lC?=
 =?utf-8?B?cVc1Y0g3U3I4STl1SzdzVzlCREUxZ3hnU29LUW9KdXNmWVpZT2ZXYlFPR2hn?=
 =?utf-8?B?RUF5TTRycm0wbU5oaTlUZjA3OFFoSFRQTEVoUWkwREhtNEF5dXRaMjhpUExN?=
 =?utf-8?B?OS8yOUJTMkplcmRBSjdESGs4aUVzZlhnUytTbWdPbWozWEltbjRVczNzY3I2?=
 =?utf-8?Q?3bPAgGno5S2mBBdmMzIyuel8QtRusLlMXy?=
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0501MB3854.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64ae7918-f0d8-43fb-f807-08d891f1c1e4
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iqurfmjpbLpLvyfVBD1L8O3Wbgwm/ZSuL1MU6Psf0Wa9dy1K8kcE2hgHFu2R9a8X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR05MB5533
X-Warn: EHLO/HELO not verified: Remote host 40.107.220.66
 (mail-co1nam11on2066.outbound.protection.outlook.com) incorrectly presented
 itself as NAM11-CO1-obe.outbound.protection.outlook.com
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
From: Leo Fan via samba-technical <samba-technical@lists.samba.org>
Reply-To: Leo Fan <xfan@vmware.com>
Cc: Albert Guo <aguo@vmware.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

SGkgc2FtYmEgZXhwZXJ0cywNCg0KSSBuZWVkIHlvdXIgaGVscCB0byB1bmRlcnN0YW5kIHRoZSBz
bWIuY29uZiBwYXJhbWV0ZXIg4oCYZWEgc3VwcG9ydOKAmS4NCldlIGFyZSBkZXZlbG9waW5nIGEg
Y3VzdG9taXplZCBzYW1iYSBzZXJ2aWNlIHRvIHNlcnZlIFdpbmRvd3MgMTAgY2xpZW50cyBhbmQg
TUFDIE9TIGNsaWVudHMuIEFuZCwgd2Ugd291bGQgbGlrZSB0byBzZXQg4oCYRUEgc3VwcG9ydCA9
IG5v4oCZIHRvIGdhaW4gbW9yZSBwZXJmb3JtYW5jZSBvZiDigJhkaXLigJkgY29tbWFuZCBlc3Bl
Y2lhbGx5IG9uIHRoZSBsYXJnZSBkaXJlY3RvcnksIGJ1dCBhcyBzbWIuY29uZiBkb2Mgc2F5cywg
RUEgc3VwcG9ydCBkaXNhYmxlbWVudCB3aWxsIGltcGFjdCBXaW5kb3dzIGZpbGUgc2VydmljZSBj
b21wYXRpYmlsaXR5Lg0KDQogICAgVGhlIGRlZmF1bHQgaGFzIGNoYW5nZWQgdG8geWVzIGluIFNh
bWJhIHJlbGVhc2UgNC45LjAgYW5kIGFib3ZlIHRvIGFsbG93IGJldHRlciBXaW5kb3dzDQogICAg
ZmlsZXNlcnZlciBjb21wYXRpYmlsaXR5IGluIGEgZGVmYXVsdCBpbnN0YWxsLg0KDQpJIGFtIG5v
dCBxdWl0ZSBjbGVhciBhYm91dCBjb21wYXRpYmlsaXR5IHByb2JsZW0gd2l0aCBFQSBzdXBwb3J0
IGRpc2FibGVtZW50LCBhbmQgaGF2ZSBzb21lIHF1ZXN0aW9uczoNCg0KDQogIDEuICBJbiB3aGlj
aCBzY2VuYXJpb3Mgd2lsbCB0aGVyZSBiZSB3aW5kb3dzIGZpbGUgc2VydmljZSBjb21wYXRpYmls
aXR5Pw0KICAyLiAgSG93IGRvIHdlIGNyZWF0ZSBhbmQgdXNlIEVBPw0KICAzLiAgRG9lcyBhbnkg
d2VsbC1rbm93biBXaW5kb3dzL01BQyBhcHBsaWNhdGlvbiB1c2UgRUE/DQoNCkkgd2lsbCBhcHBy
ZWNpYXRlIGl0IGlmIHlvdSB3aWxsIGhlbHAgbWUgb3V0Lg0KDQpUaGFua3MsDQpMZW8gRmFuDQo=

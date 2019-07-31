Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F227CA91
	for <lists+samba-technical@lfdr.de>; Wed, 31 Jul 2019 19:35:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=LXbHhEMuimShUgrP2dItuGfIgtSFjs3e3QZ+piiypRk=; b=nK/EJl1VfkP47Aacb55IPbJFex
	EghbLc4E0fRabXUKwoilpzc1oSucAtj9nNqwBbrn7PyQ29aIdHLPv014oo1LOCrl0AHp/B2d9Hc2c
	BdTZa1v08iuevY1meuoS78EIT6RrMeozPozwBt+msCjO7/aWiVpM7MSHNfuHxMyEfb5wSXOBvoBr2
	GhASCdx1jRLSKtjsPwMPD8Hcm98kDzjKm2NcBs8QpSSeykxpHbaZqycqh/ciyq7+RvqpQdJZHa5Cf
	FiCJyIJi3d6MpdwsYlpPl6/+5UO2mMKUaqqfV/RPEfImSg6VDRhBgbMa+U6MXrJL6xhJRoIHUbf74
	/UHEYQaA==;
Received: from localhost ([::1]:24892 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hssUy-001ZiA-3o; Wed, 31 Jul 2019 17:34:48 +0000
Received: from m9a0003g.houston.softwaregrp.com ([15.124.64.68]:47376) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hssUs-001Zi3-Rj
 for samba-technical@lists.samba.org; Wed, 31 Jul 2019 17:34:45 +0000
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP
 FOR samba-technical@lists.samba.org; Wed, 31 Jul 2019 17:34:41 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 31 Jul 2019 17:26:51 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 31 Jul 2019 17:26:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bZJGcLnVgcFHh+idJ3NMa86TuVPKMi5l1L4BvObkFfnWjhc11PVhAgZd041Tvvf3RALCwRomWpNJSUtEe/l//lttO/C5rCF8TLFeIGWQmiDtqD7TBWCnvJifd+xVL3fmcXWyJl5oDuzCg237yXNyCQVtRcHFx++wB8BoXVLZcBmVEcAYbnE7prU7ronTV9IqNBYJFYDf3zp5Z4lHhgf1c7DNfxEWkRzqw0WW0aCVzurmXXnRgyTHrifjT31UwiI8ACLRFcZhr0a6VWy/p7i9UIj0UpAP+6YzHhIgHNt1naY0cFyPhEP0wNDvUz1SsThX4f9H+ACJGnResgbN/n2Pkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ng1XQ328be8YJGMvROiq4UeLsgDKOUqW1gWTvMeLpq0=;
 b=H1uiGPbLZFk8y8prPRWUZwB/fgGtptToGd05H2cMyRnXrJyC5oC0ZIJz3sfsdpoFO1KtgMW3R/MU5BeHTnewXH/gulrpgZg7VHHZ2UWoNYamqMDGq/3oLzclTzbxT6mbLqFe8gk5v9lzCWH65tu4HEQmTxFz2pMbUXS9O5Hs+VPVeD7CYA4tsAlci6d06O1VWYMNFxunRvSUV1e+DMSK6K0ZQeJOW7VGxQ4JDgKjexr0JqgolphyxgGVj4nM4r44VS25q31BaTtVQMOB8Zua/cj2FCKYkS8/Cbx/qjgwImTHgjQf6EfKdXPTxb+OSEQYJtl+oxVLHzhNwJurL7YvsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BN6PR18MB1249.namprd18.prod.outlook.com (10.172.208.9) by
 BN6PR18MB1236.namprd18.prod.outlook.com (10.172.209.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Wed, 31 Jul 2019 17:26:51 +0000
Received: from BN6PR18MB1249.namprd18.prod.outlook.com
 ([fe80::c8bc:2c1b:f172:7834]) by BN6PR18MB1249.namprd18.prod.outlook.com
 ([fe80::c8bc:2c1b:f172:7834%8]) with mapi id 15.20.2115.005; Wed, 31 Jul 2019
 17:26:51 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: Samba.org GUI page
Thread-Topic: Samba.org GUI page
Thread-Index: AQHVR8Uj96xoz9icX0iti/A/k+ZtxA==
Date: Wed, 31 Jul 2019 17:26:50 +0000
Message-ID: <2691e0ab-7c21-c9c2-be47-58e8a869b6c8@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=david.mulder@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [74.122.77.94]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a987beb8-80ea-4c3c-bc94-08d715dc45fb
x-ms-traffictypediagnostic: BN6PR18MB1236:
x-ms-exchange-purlcount: 3
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XnivwHW2BQfCJZ0t5mXXnTuka86TUIK2NdvJY8cFEJ83yilKCclMqLYZZb789NfAXKE6XgRvY/ivJ3b8gSqGBsNltIV2FiXkKrubg7AmsuThB9VvDAapHSMpB369S0b6/ub0RAwIAGvvHmLLTaT0s2flKT3arqdACfGAP4Bdi/yhJy3M13UbCABIQQZi9wete+5Kb0IlBcPBaekEqfGJvhrZBNLRnTnwxYOYljQ2wxJogVAfn4bJw29/cp8xD0ZBEZB4oOxmpCStCnh9cBM9GKhXevF+qA0/wjhWADRqLuIscDDlTmWsNrdkuC+CSTaYCRZBtjv4vOQS8L/F+4hRuo5XLUu0bbzfH+0Xys8hqEkQrdBKPKIdrrVJiJT6Mc69fvdxG+laE9vCZcbZkSKFGYpQXBgGaUibdpJE7gBPWb8=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a987beb8-80ea-4c3c-bc94-08d715dc45fb
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: david.mulder@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR18MB1236
X-OriginatorOrg: suse.com
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
From: David Mulder via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Mulder <dmulder@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Q291bGQgc29tZWJvZHkgYWRkIG15IGFkbWluLXRvb2xzIHBhY2thZ2UgdG8gaHR0cHM6Ly93d3cu
c2FtYmEub3JnL3NhbWJhL0dVSSA/IEknbSBub3Qgc3VyZSB3aG8gbWFuYWdlcyB0aGUgc2l0ZS4N
Cg0KRG93bmxvYWQgVVJMIGlzIGh0dHBzOi8vZG93bmxvYWQub3BlbnN1c2Uub3JnL3JlcG9zaXRv
cmllcy9ob21lOi9kbXVsZGVyOi9ZYVNUOi9BcHBJbWFnZS9BcHBJbWFnZS9hZG1pbi10b29scy1s
YXRlc3QteDg2XzY0LkFwcEltYWdlDQoNCi0tDQoNCkRhdmlkIE11bGRlcg0KTGFicyBTb2Z0d2Fy
ZSBFbmdpbmVlciwgU2FtYmENClNVU0UNCjE4MDAgTm92ZWxsIFBsYWNlDQpQcm92bywgVVQgODQ2
MDYNCihQKSsxIDgwMS44NjEuNjU3MQ0KZG11bGRlckBzdXNlLmNvbTxtYWlsdG86ZG11bGRlckBz
dXNlLmNvbT4NCltodHRwczovL3d3dy5zdXNlLmNvbS9lbWFpbC9pbWcvMjAxNi9lbWFpbF9zaWdu
YXR1cmVfc3VzZS5wbmddPGh0dHA6Ly93d3cuc3VzZS5jb20vPg0K

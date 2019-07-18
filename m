Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1A76D56B
	for <lists+samba-technical@lfdr.de>; Thu, 18 Jul 2019 21:49:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=nF2Hp6Ex4401698PrdJnt6OOc71NBM6igyJoAErTSE4=; b=az24K9/qHB3Ec9D6ewGhRE9ny0
	UrgyldK5tSSqmjtK88jQNYCGJ1ZJ/Ml+qHLqjqizwc1Lx+pkPQMNl52wADYO/6QKOM+KrR8kyuYaY
	98LJDd8lahtvS4qoEAzrhUBJmez9gUwWoNhW3GhSqzRjZkLs67BZpBwwiQrrnBjlzpM1mKuuyXkVA
	Za6bff3ZyPlFJKXf/B46PiTP8hZnKa2vCsSqgEE98qmIA8l2e0Mhnqpzmfvtbl7RxBaPwqcR03OFv
	hakZBhH/OAWrFNwmrH8i1b4wCEKYEuU5DfzXKDTPxB5dAIKn4w8J1716V0xxmwVU0Glp29O6CR/Xe
	SLzdH8+g==;
Received: from localhost ([::1]:20526 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hoCOc-0011K0-7F; Thu, 18 Jul 2019 19:48:54 +0000
Received: from m9a0001g.houston.softwaregrp.com ([15.124.64.66]:54221) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hoCOW-0011Jt-VZ
 for samba-technical@lists.samba.org; Thu, 18 Jul 2019 19:48:52 +0000
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP
 FOR samba-technical@lists.samba.org; Thu, 18 Jul 2019 19:48:44 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 18 Jul 2019 19:46:00 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 18 Jul 2019 19:46:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bnm5bOPGUPIz+9jrP/Bw5XWKOgbtNEzk5srDYkkJVaXgsp4N5XSg/8eGXS4NmGRKSXYAznca9HykuHOGh0dQJJnSVmvGGS5N4sn01qHFhwbFUs6GhZJNGQIbIXZjRchros6ZVecJJI10dUTOkryiYiZO2gnpRUhEVWKHQdiwtWtY7YOzP16FmVksYoGvmecXFIjMWFdBBCW69cLg0otOMfqWCc5WYXyFnSF2AjbL2rMoly5nPubcDMtj0CZo2b9S/Pz0jOVDILaZ0JZW7YwBRQaA4HNTVo/xOzg8Oq52aVgbQcnt2J8+Ir+4Ol0tSUs3uX7AOXPBa8aZFNMxyMgZaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=70aGyKjGpz3W+DCczPX3+YGeMHxuO/U+C0dzAYet/ew=;
 b=UtDUAVjEfT6kuSmmmZOysNHbNpQEAhU2u7Soydo5maD/MDyapVb4SQpvXOZsK+CRMeCaiZZGBfLjZ12rrUyX1CfDflK2fgase0SZ1jmX31PAbSZQiZMnFxAcmtP2lghGlOuCB+BEm9eaDpb/Z0AshRZuET1T6toVTAPShrRu/wbDmHBguYwi03aLcSPCMsoS9sQG2UY0FspNAkbsgLdrgPl1SfOtYfEGYsF5swC5rwJVvgGGAoZRW4d2W5Ttvz+DiSuARmA9db/WbWNTIKnvjgM5cGQ1+62eQmpw2jsjx5Zy3oCuuBrkqGj3OjMnyKciwd2/i97PgqhP+Cmy0xZEQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM5PR18MB1260.namprd18.prod.outlook.com (10.173.213.11) by
 DM5PR18MB2341.namprd18.prod.outlook.com (52.132.208.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Thu, 18 Jul 2019 19:45:58 +0000
Received: from DM5PR18MB1260.namprd18.prod.outlook.com
 ([fe80::4837:2953:bddb:f48e]) by DM5PR18MB1260.namprd18.prod.outlook.com
 ([fe80::4837:2953:bddb:f48e%5]) with mapi id 15.20.2073.015; Thu, 18 Jul 2019
 19:45:58 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: Re: WIP: ncurses ADUC and ADSI AppImages
Thread-Topic: WIP: ncurses ADUC and ADSI AppImages
Thread-Index: AQHVPB5Q5wsZUwN4JEe+1AWqod2hgabQypaA
Date: Thu, 18 Jul 2019 19:45:58 +0000
Message-ID: <344fa01c-996d-7e10-f26a-3727019d7a6a@suse.com>
References: <f615b9db-5119-94b6-49cc-10f1fc3d856f@suse.com>
In-Reply-To: <f615b9db-5119-94b6-49cc-10f1fc3d856f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=david.mulder@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [74.122.77.94]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b2461637-ac15-4e3d-6586-08d70bb88de8
x-ms-traffictypediagnostic: DM5PR18MB2341:
x-ms-exchange-purlcount: 5
x-ms-oob-tlc-oobclassifiers: OLM:1284;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HKwE6HgWC3tuVQZwMP2GIwefqtempM1U2Jj8gTC1HbC6ejguN0dtuoDVYcuqUGcDjz4e74sxnCDP86tSgbHCR4gxUkm7KWarFjV65Zny/NrlhmLwq0qj/X8HdG92RwT2Yi5zKpHyfsCLNdGLzzUoMqZJriEF1wSllFlzJqbS83wbLeLF6FvodT/N+FqgUXnjzs+bpWZ4ndV2YJ66CEM+tM/iixPYr90LNSmoGvoZDIjCPrgtkiaxg8YejKfYfVbniinb6lBNkGp4nX5uuLkml5BmfxuB0Rl2uEGrJI9VN2wg/uOmOqRcil0brbrpzj/8JTJlG43Mmh52/wnvZ7E7pOLJTuHod2thqZMDb9obbDCxmHWZgiK9m4v2sqBIPGj/OMYHdCoiSg0qWatOS92CksaJfHevwkvU57u+gC0fLQw=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b2461637-ac15-4e3d-6586-08d70bb88de8
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: david.mulder@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB2341
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

U2VtaS1wZXJtYW5lbnQgaG9tZSBmb3IgdGhpcyBzdHVmZiBpcyBub3cgaGVyZTogaHR0cHM6Ly9k
b3dubG9hZC5vcGVuc3VzZS5vcmcvcmVwb3NpdG9yaWVzL2hvbWU6L2RtdWxkZXI6L1lhU1Q6L0Fw
cEltYWdlL0FwcEltYWdlL2FkbWluLXRvb2xzLWxhdGVzdC14ODZfNjQuQXBwSW1hZ2UNCg0KT24g
Ny8xNi8xOSAzOjM0IFBNLCBEYXZpZCBNdWxkZXIgdmlhIHNhbWJhLXRlY2huaWNhbCB3cm90ZToN
Cg0KSSdtIHdvcmtpbmcgb24gQXBwSW1hZ2VzIG9mIG15IGFkdWMgYW5kIGFkc2kgdG9vbHMgKHRo
YXQgSSBwcmVzZW50ZWQgYXQgc2FtYmF4cCkuIFlvdSBjYW4gZG93bmxvYWQgdGhlbSBoZXJlOg0K
aHR0cHM6Ly9kb3dubG9hZC5vcGVuc3VzZS5vcmcvcmVwb3NpdG9yaWVzL2hvbWU6L2RtdWxkZXI6
L1lhU1Q6L0FwcEltYWdlL0FwcEltYWdlL3lhc3QyLWFkc2ktbGF0ZXN0LXg4Nl82NC5BcHBJbWFn
ZQ0KaHR0cHM6Ly9kb3dubG9hZC5vcGVuc3VzZS5vcmcvcmVwb3NpdG9yaWVzL2hvbWU6L2RtdWxk
ZXI6L1lhU1Q6L0FwcEltYWdlL0FwcEltYWdlL3lhc3QyLWFkdWMtbGF0ZXN0LXg4Nl82NC5BcHBJ
bWFnZQ0KDQpZb3Ugb25seSBoYXZlIHRvIGRvd25sb2FkIGFuZCBtYWtlIHRoZW0gZXhlY3V0YWJs
ZSwgdGhlbiBydW4gdGhlbS4gSSdtIHRlc3RpbmcgdGhlbSBvdXQgb24gVWJ1bnR1LiBJJ2QgYXBw
cmVjaWF0ZSBmZWVkYmFjay90ZXN0aW5nL2V0Yy4NCg0KLS0NCg0KRGF2aWQgTXVsZGVyDQpMYWJz
IFNvZnR3YXJlIEVuZ2luZWVyLCBTYW1iYQ0KU1VTRQ0KMTgwMCBOb3ZlbGwgUGxhY2UNClByb3Zv
LCBVVCA4NDYwNg0KKFApKzEgODAxLjg2MS42NTcxDQpkbXVsZGVyQHN1c2UuY29tPG1haWx0bzpk
bXVsZGVyQHN1c2UuY29tPjxtYWlsdG86ZG11bGRlckBzdXNlLmNvbT48bWFpbHRvOmRtdWxkZXJA
c3VzZS5jb20+DQpbaHR0cHM6Ly93d3cuc3VzZS5jb20vZW1haWwvaW1nLzIwMTYvZW1haWxfc2ln
bmF0dXJlX3N1c2UucG5nXTxodHRwOi8vd3d3LnN1c2UuY29tLz48aHR0cDovL3d3dy5zdXNlLmNv
bS8+DQoNCg0KLS0NCg0KRGF2aWQgTXVsZGVyDQpMYWJzIFNvZnR3YXJlIEVuZ2luZWVyLCBTYW1i
YQ0KU1VTRQ0KMTgwMCBOb3ZlbGwgUGxhY2UNClByb3ZvLCBVVCA4NDYwNg0KKFApKzEgODAxLjg2
MS42NTcxDQpkbXVsZGVyQHN1c2UuY29tPG1haWx0bzpkbXVsZGVyQHN1c2UuY29tPg0KW2h0dHBz
Oi8vd3d3LnN1c2UuY29tL2VtYWlsL2ltZy8yMDE2L2VtYWlsX3NpZ25hdHVyZV9zdXNlLnBuZ108
aHR0cDovL3d3dy5zdXNlLmNvbS8+DQo=

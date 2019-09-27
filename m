Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2142EC0886
	for <lists+samba-technical@lfdr.de>; Fri, 27 Sep 2019 17:26:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=DYN0FHUmzqWWX3m55aiNP87WMIWnQQCrdmJ2oUWFzW8=; b=htnPx44DPhwf/KRrCPBFdHTXAb
	LXMHpLJQ3kbzGwSBX212rMsFZT6z37tQfAyWXloGn7oExVnmR1vuA1Trt2zOh7faRD3t1N8UDyzhm
	s9rXryQQ4OGVNUhWwUwchFGwpyszNEwSJ98SAQY6qdlqXrzwKH6/Whlqg9G+llZxqFvTL856GqnFy
	gJO9u5J1lMVviu4tS7VPp1SV6sVQNCKsrnQxdfIwVUgeijxMXbCIKRKfkK/kv9WxRavZjbZSq+lFo
	YmZYqYg5aYrl+yaJvTGK+xfp780Cf8Jhoh+ueov6JLgFpht8C63S0AW//A+WbTh7xA75GubHZQGFW
	Ru009Qsg==;
Received: from localhost ([::1]:51898 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iDs8T-0099Pd-Iz; Fri, 27 Sep 2019 15:26:21 +0000
Received: from m4a0040g.houston.softwaregrp.com ([15.124.2.86]:58033) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iDs8O-0099PW-JP
 for samba-technical@lists.samba.org; Fri, 27 Sep 2019 15:26:19 +0000
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP
 FOR samba-technical@lists.samba.org; Fri, 27 Sep 2019 15:25:16 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 27 Sep 2019 14:54:14 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 27 Sep 2019 14:54:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iMc4jwQYLUh9hnfXGrUsxizN1gGHxgubkZfZ/nxJDxhs/KdTskf9qDNANOngbPMtOk07WBuWNYY58uDlc/k6icuH+O1Kj2OckTA60fVdKGvigOK/+QATvFuOddofAXqsYARIYnp0hAugIytkJhZuQ+LFachFgzoAO2wsokF9aHN5c/eQRGKWycQ2AUOF0FdmuMHE1tPkzq/087bslqd8er2Cao0P+j0JJEyX1O6D8UBC9u1gxD9KN3WMoWgUxncENgidjW6ot/hc6Knq/zfqujtEtZKKVR4+d/6KgO+nKDQisnWNrekZIPQ3SLcAoFRpUn4oHNC0TQDdeiWibhUx/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OpzYV9C2ED+0Tu4v33Lc9MM0W/PEcsUI3z8pkG5mFB4=;
 b=ex/mzieE5elnkKYL40FhV6NYrtNNLsgJGC517jk828R9wHVCrrkhL6BXzvrclxUarC9Hx7/+hAfegGHNhcGyniqmwFLnu3l8rcoqUZ1m7bWUmELWi62RDSNW708d0vP2BK2SHc36KQT4sJUlF/dT3DS7hohsS5hjTBD26jeZdknyok4yzbQopruJESCSmu2Etp9RSSojM9rT9Yk2H3AP1ZailWUnvmEwiEOYd1htqz357RNydBDKyyB/73EN32MjVR2VbKkOFa+5WvVrTfb8uOz2ImAbSRzQP5Cuh882aoGOTXJJsknlwIMxSswnXUe5Gfj/uAB9XwctYZVEWgoJBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from SN1PR18MB2271.namprd18.prod.outlook.com (52.132.199.145) by
 SN1PR18MB2189.namprd18.prod.outlook.com (52.132.197.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Fri, 27 Sep 2019 14:54:08 +0000
Received: from SN1PR18MB2271.namprd18.prod.outlook.com
 ([fe80::c5c0:249a:b800:8751]) by SN1PR18MB2271.namprd18.prod.outlook.com
 ([fe80::c5c0:249a:b800:8751%7]) with mapi id 15.20.2284.028; Fri, 27 Sep 2019
 14:54:08 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: Converting SMB1 tests to SMB2
Thread-Topic: Converting SMB1 tests to SMB2
Thread-Index: AQHVdUNqiOZWCa16a0elHejFomZ1kQ==
Date: Fri, 27 Sep 2019 14:54:08 +0000
Message-ID: <f0f71737-cd07-b361-1c26-58116e6e8ed8@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=david.mulder@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [74.122.77.94]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2ef36597-982e-4ff9-e778-08d7435a8c78
x-ms-traffictypediagnostic: SN1PR18MB2189:
x-ms-exchange-purlcount: 1
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OmkPR+ZYCvJbDVKC/i2dwi/nXIOYjnYBI6zpjs1moREXe+jM9v3jJvUITXriEOyW6KYfHTRZkI43hvt8sqdPZKKYBJfMz1ahG1pPcZFgOdoWD+aXAUJr2a2TfddzS4zwsrSGDeGfqyNeL5FuiwfwJ5wBv2Hq2AdKKTpdrz8NDpFK+OOAqtAsn7UIIHAVACIOc4uqbwe6AfkKTdEw+Dp2W6CkOCrxgo2E7fkqhy/ucf30Z+KxEfO8aqUf4WOarrvpo+o1WGOWg9I+2fGb04T7G2ApJjYwz/bI1M6qlui8WbDTUtIUDFwNY4uaMqLtilanMeyWZKOv+RuVCSnfynORw8Ikj53c3zc3ItGXoOBrKTO2oU7CJD6eYT/brqrFs3QBKyd0vu7AjY2LDJgz6zNMtWpaJl7X/GVhM/SOoz9f4VOJTiuSlPCsRSiY7L0rFhjceYbx0oN3RjEdm5xZDQfRQQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ef36597-982e-4ff9-e778-08d7435a8c78
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ef5R/vjoqcDYE5sVlK1FkxjyGzMpih/pm8ZAFGv9Lizs/16/Xh4+1luDTncc2fZ+guwdRM41qwsz3k6SANhjPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR18MB2189
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

Tm9lbCBhbmQgSSBhcmUgbG9va2luZyBhdCBjb252ZXJ0aW5nIGFueSBvbGQgU01CIHRlc3RzIHRo
YXQgdGFyZ2V0IHRoZSBTTUIxIHByb3RvY29scyB0byBTTUIyKy4gSXMgYW55b25lIGVsc2UgYWxy
ZWFkeSB3b3JraW5nIG9uIHRoaXM/IERvZXMgYW55b25lIGhhdmUgc29tZSBwb2ludGVycz8NCg0K
LS0NCg0KRGF2aWQgTXVsZGVyDQpMYWJzIFNvZnR3YXJlIEVuZ2luZWVyLCBTYW1iYQ0KU1VTRQ0K
MTgwMCBOb3ZlbGwgUGxhY2UNClByb3ZvLCBVVCA4NDYwNg0KKFApKzEgODAxLjg2MS42NTcxDQpk
bXVsZGVyQHN1c2UuY29tPG1haWx0bzpkbXVsZGVyQHN1c2UuY29tPg0KW2h0dHBzOi8vd3d3LnN1
c2UuY29tL2VtYWlsL2ltZy8yMDE2L2VtYWlsX3NpZ25hdHVyZV9zdXNlLnBuZ108aHR0cDovL3d3
dy5zdXNlLmNvbS8+DQo=

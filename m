Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 025AF6B165
	for <lists+samba-technical@lfdr.de>; Tue, 16 Jul 2019 23:53:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=HPDf69RDSpUvP29Zkbc1THMDyZAfYI5pkgsp+VwZMX4=; b=SarHVOV2g8rlEmed/wD+rcB2qy
	Iw92qLmfXIgixzhkQw4+2J15Uzig1tt64MJsjIlZ0Hd0Ki4ZcQta8qXMW4vk+uJSGMlDa+tT2VC3E
	qIgo4dYYEBr217yDazcr8waPLuL7pdje3z0buODomqBQuRKHYsm6okMQXtHsAtEtaHD7AU77mY4Vj
	A3D7YHQkX0XFKKQOfsbRVW7oEgsk041leavckg3rjKFsZJLoG9LQl1OqFWvYq2xASoC6eUvaOGPbq
	y+y+KPPWBDeqiszZtbhadFWegbv4ofj0gDL4I3N94iS9gdEAZ6JUBXXf0avVuCg8d7ujW8WztpVHN
	jtboTMmQ==;
Received: from localhost ([::1]:54802 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hnVNb-000LtX-Ot; Tue, 16 Jul 2019 21:52:59 +0000
Received: from m9a0001g.houston.softwaregrp.com ([15.124.64.66]:47235) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hnVNV-000LtQ-Lz
 for samba-technical@lists.samba.org; Tue, 16 Jul 2019 21:52:56 +0000
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP
 FOR samba-technical@lists.samba.org; Tue, 16 Jul 2019 21:52:51 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 16 Jul 2019 21:34:59 +0000
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 16 Jul 2019 21:34:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ywq43O+B1nqgLozCAwEPveGo2pZutPxsj5du8BQtJzPq3LKvuxP0Nz7f+uVtG9iYBo0WbDbdBT0bdBamKIl+Qm70haQ+cTQMxAPl5RQa3uKEWtScJnxCxd5HvAHCb3DpkrrdF0zQZxfV+QHI5pDd2AMefY9pZVJTBd8awQNtL1rnCnkfxt96WNHChU/jzgtrTXYBLa+9i2Bi55LzzRcagPYCYu1hlkS8xRiQF4fK8hzeT7ujFwZCN/NezfvT783SE+Y9hbNv9zOxUsu0ZSeqvTLKk6t2zfbgt+wJqwohmSzFQ7pTzR9AuqXVwd0BVwedKEUzXyp9NgD7Gb01ExP1dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pW7qBzP1AjAPw/ys5KyN/TvXIZZ6PbIRM0SkByp8wXI=;
 b=QYOh5JPPnuPlyNeGAtTOQdOxwFhkGCmK1rfxjcjgsJTtEqaXGDgk6Z/dUnRMjtN1Lu6ADJk5AlVBDax85kF+tb9JfdA5fmrxJwhk8Cpuey2Xj8vOUFOxYGXpEW0/qY0Kg+4Y1gDOs+Pv0HiF6w5Od4kKN5A00OBlVisTACVv3OyhjWxXMomN9+7Wv+kT9hqt8evN6S+9ilFiyvecOTvckx5H6ZJ/PJwJM8ZdVB3csc+1KUJOWqRp5QzfCQsWenxLc5qvBx6pBiqMkCBjN1wdpD1YS8n03AYLqyoK55Kb6r0P9hl7/UO2RmmmSrZcTU1vEv+s5SvgBEeUvr575cjeRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM5PR18MB1260.namprd18.prod.outlook.com (10.173.213.11) by
 DM5PR18MB1404.namprd18.prod.outlook.com (10.173.214.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 21:34:57 +0000
Received: from DM5PR18MB1260.namprd18.prod.outlook.com
 ([fe80::4837:2953:bddb:f48e]) by DM5PR18MB1260.namprd18.prod.outlook.com
 ([fe80::4837:2953:bddb:f48e%5]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 21:34:57 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: WIP: ncurses ADUC and ADSI AppImages
Thread-Topic: WIP: ncurses ADUC and ADSI AppImages
Thread-Index: AQHVPB5Q5wsZUwN4JEe+1AWqod2hgQ==
Date: Tue, 16 Jul 2019 21:34:57 +0000
Message-ID: <f615b9db-5119-94b6-49cc-10f1fc3d856f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=david.mulder@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [74.122.77.94]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 283c7a59-85e3-449e-bd89-08d70a357303
x-ms-traffictypediagnostic: DM5PR18MB1404:
x-ms-exchange-purlcount: 3
x-ms-oob-tlc-oobclassifiers: OLM:586;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: A54qO2X8zvdN/qiH0qsRwm1OgI3d2eLM7QIRmPoJtqovh6dCEx9otxOz7zZ4Qmz4Tvfha6fJO4rGBzOCYtRkLKbmRuQ0jclQSrna4XgL7p+/WK8Rny6ofGczJEzD8tyRbOMNvjcekoD+Mr0YpYFg+Q7n6MvDYUIK2k8N0Tw4WZduvMZUhOa0kIsWKKoGAGoz91jHXQeAcDZW6xcj0RWcIcQjyvPC4I1QXU6r5Lp9SVhUJrtIM76wVibhqBmPXcodKXZcwnXRfN8+XgS3Dg7Jx0y+D5UMt3igfWlPcft5x9T/3huRpx2x+GK00M7m6I9mTObq/wXPQYb39DR5mStE7DK7cex3VRc4jzzHEBu7hOABBpYgoKcimqmMxzxSYZKi5amo4L3dYMq/5JZtFqmej1tWJgQ4VAK4B8O3M1LVWRI=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 283c7a59-85e3-449e-bd89-08d70a357303
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: david.mulder@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB1404
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

SSdtIHdvcmtpbmcgb24gQXBwSW1hZ2VzIG9mIG15IGFkdWMgYW5kIGFkc2kgdG9vbHMgKHRoYXQg
SSBwcmVzZW50ZWQgYXQgc2FtYmF4cCkuIFlvdSBjYW4gZG93bmxvYWQgdGhlbSBoZXJlOg0KaHR0
cHM6Ly9kb3dubG9hZC5vcGVuc3VzZS5vcmcvcmVwb3NpdG9yaWVzL2hvbWU6L2RtdWxkZXI6L1lh
U1Q6L0FwcEltYWdlL0FwcEltYWdlL3lhc3QyLWFkc2ktbGF0ZXN0LXg4Nl82NC5BcHBJbWFnZQ0K
aHR0cHM6Ly9kb3dubG9hZC5vcGVuc3VzZS5vcmcvcmVwb3NpdG9yaWVzL2hvbWU6L2RtdWxkZXI6
L1lhU1Q6L0FwcEltYWdlL0FwcEltYWdlL3lhc3QyLWFkdWMtbGF0ZXN0LXg4Nl82NC5BcHBJbWFn
ZQ0KDQpZb3Ugb25seSBoYXZlIHRvIGRvd25sb2FkIGFuZCBtYWtlIHRoZW0gZXhlY3V0YWJsZSwg
dGhlbiBydW4gdGhlbS4gSSdtIHRlc3RpbmcgdGhlbSBvdXQgb24gVWJ1bnR1LiBJJ2QgYXBwcmVj
aWF0ZSBmZWVkYmFjay90ZXN0aW5nL2V0Yy4NCg0KLS0NCg0KRGF2aWQgTXVsZGVyDQpMYWJzIFNv
ZnR3YXJlIEVuZ2luZWVyLCBTYW1iYQ0KU1VTRQ0KMTgwMCBOb3ZlbGwgUGxhY2UNClByb3ZvLCBV
VCA4NDYwNg0KKFApKzEgODAxLjg2MS42NTcxDQpkbXVsZGVyQHN1c2UuY29tPG1haWx0bzpkbXVs
ZGVyQHN1c2UuY29tPg0KW2h0dHBzOi8vd3d3LnN1c2UuY29tL2VtYWlsL2ltZy8yMDE2L2VtYWls
X3NpZ25hdHVyZV9zdXNlLnBuZ108aHR0cDovL3d3dy5zdXNlLmNvbS8+DQo=

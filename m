Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAA9C92BC
	for <lists+samba-technical@lfdr.de>; Wed,  2 Oct 2019 22:05:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=KER0yGzr47zGXtJ3AJ7P5RnYncszW5Fid9RUStiqr2U=; b=1ngQEz528Ynwv22i9W0a1lKQv1
	2nDQIPf3tkR6RRCfluuSjpRerIH5BB51RaqKM2SuX3HLpd3Ud5rMBIbRLN1zPRWxaarKSuiXy8r6L
	VdAimVi041KsvDd2siZJQmKCAuoDyJGwXDODlKT75yRdyfKEZnnwOZADiOBB9usVOGDHmVn4w9dPl
	lCT/vU8S0Dfx5sC0ks7RpDFKzJmGNH8+ro+8QC8NgkWk/99I2F5Xty4ZxInNxPbjYb48/TjiJVmU+
	4wjDTqkSYKChhW96OiDTOLXxuLNzauPu/zyIftpunddb9wM92crZs2K4L45ExO4i7QsqrQh5pbrXi
	eLI7RTFw==;
Received: from localhost ([::1]:36338 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iFkqr-000XiU-4s; Wed, 02 Oct 2019 20:03:57 +0000
Received: from m4a0041g.houston.softwaregrp.com ([15.124.2.87]:36403) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iFkql-000Xi7-Ms
 for samba-technical@lists.samba.org; Wed, 02 Oct 2019 20:03:54 +0000
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Wed,  2 Oct 2019 20:01:44 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 2 Oct 2019 20:02:29 +0000
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 2 Oct 2019 20:02:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mqASXaYIR8yrMtWQQWJQigyFVzdsilgx8ZGshBPJruH5rTgDzpvmDNfQBZu2mg7M6mu7gTHWo1Aegbz4uxpyYVtk049cuLSN7G2QBRQM0JhgIhEM4/JFdJuVOKq7RTBqR7+oUY0A2I0TDWSDnp9+nrn2k9UnvrNL+ufsMou/3OFUN2XJhjvwd9NLKRVJNTxXruNGDTGQO+A3IDZbQ8amFnjQt9CmQLq1VQpED7QinM6TWqi+mseMZVoBtmSnl7YMsCMNy/id+slZ/waZyHndYKQ8ysZ1S7ePRLx3k7aCTgKUgI4OptFKmYFsqEAKcKwc5IWpYl25dx+b9qmQnijLSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jMhV3NNGtKZEQOfhwc+0eYI9CgnZjvKNLCKjVMS7OVA=;
 b=SGOpW4q/yEruo8kDUD4IOy9Qq/zEy/EEv00Y37X0I9bGzq+XDt8wt/yh68ZnMdDznUdmry6HbutWLvuNf2TIiEJhGCJSGvR+d+4CHyifrercGZCrBrmMq21cxCotDDREQ/ilBVNyGmamGffD6oT8R9+2IUjfH6eWJLKcihauGCCFWEknmnf3i+t7Teykwfhbq0YmGz4Ip6/kaju1SWdS+gOsJzAtQL51IrHeknKFxIv4E+yW5XzWUlKdxx5Ph3WbOV4Ye+gMWuYqC3E5r0Wvcn7K2KVX9qlQ5YBGqWBhQXxSvH+9oAa7ibS7uLNcdg9mufrAT8DTMZtVo7eO9ExQvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from SN1PR18MB2271.namprd18.prod.outlook.com (52.132.199.145) by
 SN1PR18MB2302.namprd18.prod.outlook.com (52.132.199.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 20:02:27 +0000
Received: from SN1PR18MB2271.namprd18.prod.outlook.com
 ([fe80::8d9f:e289:3b9a:d22a]) by SN1PR18MB2271.namprd18.prod.outlook.com
 ([fe80::8d9f:e289:3b9a:d22a%5]) with mapi id 15.20.2305.023; Wed, 2 Oct 2019
 20:02:27 +0000
To: " Paulo Alcantara (SUSE) " <pc@cjr.nz>
Subject: Re: [PATCH] mount.cifs: Fix invalid free
Thread-Topic: [PATCH] mount.cifs: Fix invalid free
Thread-Index: AQHVbuTU8zGbZAZIrE2GRviElFHgDadH2tMA
Date: Wed, 2 Oct 2019 20:02:27 +0000
Message-ID: <4451b38f-abb2-8437-62f6-e499a3497737@suse.com>
References: <20190919121226.8756-1-pc@cjr.nz>
In-Reply-To: <20190919121226.8756-1-pc@cjr.nz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=david.mulder@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [74.122.77.94]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dce280ac-591c-4418-4a63-08d7477372e7
x-ms-traffictypediagnostic: SN1PR18MB2302:
x-ms-exchange-purlcount: 1
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: g2oNfMoWDkiQIoUYZajcXodwubBQTanT6ukC8uH4XKgMxATKrDMQnbGy4kJAyC+IBmySdW6oLtVW8BCVmh+Lj9oQQj4iEgmlZW4EjBfRf2s0MhF6nSCyi2WmoerpraGO9vPGNX7tu+SpOZOliMOM8uDGROd+GH79U62YVOvzOiE5/LNvm2o/WmfSpk+FaRaNw6rbRuAc+mzgKtTtQhZLsYSgdqSgsUyGH+q0j4mc85MvmtlabIsShq2WU1pjJ3q8VQfDQYV9Xg0pr1KNm9Ym1aoFxFwimSEezeYutgNBvKUdkG6Wo78yHP7mX1iRsNohgE8xHWk7F4hkfkYLtASXF0skfKEkShpbHnu8Xia6Qllyc4O/nJ0fU9RJn/tFdXUpK/D0EC00rhU/lIoSYScr3o4UyQNyHxYsZ8w85mQ9darifD7uEEuJR8ItAEwQU/SWQyHqGYvYm3HOxmUb/IdNHQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: dce280ac-591c-4418-4a63-08d7477372e7
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k6uc293+teicuDsJtX7xwUM/9yC7W077MOo88wso3BMmcniY9pXHIah38n3FKEzB/Uh4HQq+VQAQ7R2Qk/HOeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR18MB2302
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
Cc: "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

UmV2aWV3ZWQtYnk6IERhdmlkIE11bGRlciA8ZG11bGRlckBzdXNlLmNvbT48bWFpbHRvOmRtdWxk
ZXJAc3VzZS5jb20+DQoNCk9uIDkvMTkvMTkgNjoxMiBBTSwgUGF1bG8gQWxjYW50YXJhIChTVVNF
KSB3cm90ZToNCg0KV2hlbiBhdHRlbXBpbmcgdG8gY2hkaXIgaW50byBub24tZXhpc3RpbmcgZGly
ZWN0b3JpZXMsIG1vdW50LmNpZnMNCmNyYXNoZXMuDQoNClRoaXMgcGF0Y2ggZml4ZXMgdGhlIGZv
bGxvd2luZyBBU0FOIHJlcG9ydDoNCg0KJCAuL21vdW50LmNpZnMgLy9sb2NhbGhvc3QvZm9vIC9t
bnQvaW52YWxpZC1kaXIgLW8gLi4uDQovbW50L2JhciAtbyB1c2VybmFtZT1mb28scGFzc3dvcmQ9
Zm9vLHZlcnM9MS4wDQpDb3VsZG4ndCBjaGRpciB0byAvbW50L2JhcjogTm8gc3VjaCBmaWxlIG9y
IGRpcmVjdG9yeQ0KPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT0NCj09MTE4NDY9PUVSUk9SOiBBZGRyZXNzU2FuaXRpemVyOiBh
dHRlbXB0aW5nIGZyZWUgb24gYWRkcmVzcyB3aGljaCB3YXMNCm5vdCBtYWxsb2MoKS1lZDogMHg3
ZmZkODYzMzJlOTcgaW4gdGhyZWFkIFQwDQogICAgIzAgMHg3ZjA4NjBjYTAxZTcgaW4NCiAgICBf
X2ludGVyY2VwdG9yX2ZyZWUgKC91c3IvbGliNjQvbGliYXNhbi5zby41KzB4MTBhMWU3KQ0KICAg
ICMxIDB4NTU3ZWRlY2U5Y2NiIGluDQogICAgYWNxdWlyZV9tb3VudHBvaW50ICgvaG9tZS9wYXVs
by9zcmMvY2lmcy11dGlscy9tb3VudC5jaWZzKzB4ZWNjYikNCiAgICAjMiAweDU1N2VkZWNlYTYz
ZCBpbg0KICAgIG1haW4gKC9ob21lL3BhdWxvL3NyYy9jaWZzLXV0aWxzL21vdW50LmNpZnMrMHhm
NjNkKQ0KICAgICMzIDB4N2YwODYwOWYwYmNhIGluIF9fbGliY19zdGFydF9tYWluICgvbGliNjQv
bGliYy5zby42KzB4MjZiY2EpDQogICAgIzQgMHg1NTdlZGVjZTI3ZDkgaW4NCiAgICBfc3RhcnQg
KC9ob21lL3BhdWxvL3NyYy9jaWZzLXV0aWxzL21vdW50LmNpZnMrMHg3N2Q5KQ0KDQpBZGRyZXNz
IDB4N2ZmZDg2MzMyZTk3IGlzIGxvY2F0ZWQgaW4gc3RhY2sgb2YgdGhyZWFkIFQwIGF0IG9mZnNl
dCA4OTUxDQppbiBmcmFtZQ0KICAgICMwIDB4NTU3ZWRlY2U5Y2UwIGluDQogICAgbWFpbiAoL2hv
bWUvcGF1bG8vc3JjL2NpZnMtdXRpbHMvbW91bnQuY2lmcysweGVjZTApDQoNCiAgVGhpcyBmcmFt
ZSBoYXMgMiBvYmplY3Qocyk6DQogICAgWzQ4LCA1MikgJ3JjJyAobGluZSAxOTU5KQ0KICAgIFs2
NCwgNzIpICdtb3VudHBvaW50JyAobGluZSAxOTU1KSA8PT0gTWVtb3J5IGFjY2VzcyBhdCBvZmZz
ZXQgODk1MQ0KICAgIG92ZXJmbG93cyB0aGlzIHZhcmlhYmxlDQpISU5UOiB0aGlzIG1heSBiZSBh
IGZhbHNlIHBvc2l0aXZlIGlmIHlvdXIgcHJvZ3JhbSB1c2VzIHNvbWUgY3VzdG9tDQpzdGFjayB1
bndpbmQgbWVjaGFuaXNtLCBzd2FwY29udGV4dCBvciB2Zm9yaw0KICAgICAgKGxvbmdqbXAgYW5k
IEMrKyBleGNlcHRpb25zICphcmUqIHN1cHBvcnRlZCkNClNVTU1BUlk6IEFkZHJlc3NTYW5pdGl6
ZXI6IGJhZC1mcmVlICgvdXNyL2xpYjY0L2xpYmFzYW4uc28uNSsweDEwYTFlNykNCmluIF9faW50
ZXJjZXB0b3JfZnJlZQ0KPT0xMTg0Nj09QUJPUlRJTkcNCg0KRml4ZXM6IGJmN2Y0OGY0YzdkYyAo
Im1vdW50LmNpZnMuYzogZml4IG1lbW9yeSBsZWFrcyBpbiBtYWluIGZ1bmMiKQ0KU2lnbmVkLW9m
Zi1ieTogUGF1bG8gQWxjYW50YXJhIChTVVNFKSA8cGNAY2pyLm56PjxtYWlsdG86cGNAY2pyLm56
Pg0KLS0tDQogbW91bnQuY2lmcy5jIHwgOCArKysrLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9tb3VudC5jaWZzLmMg
Yi9tb3VudC5jaWZzLmMNCmluZGV4IDc3NDhkNTRhYTgxNC4uMGMzOGFkY2Q5OWIxIDEwMDY0NA0K
LS0tIGEvbW91bnQuY2lmcy5jDQorKysgYi9tb3VudC5jaWZzLmMNCkBAIC0xODkzLDcgKzE4OTMs
NyBAQCBhY3F1aXJlX21vdW50cG9pbnQoY2hhciAqKm1vdW50cG9pbnRwKQ0KICAgICAgICBpbnQg
cmMsIGRhY3JjOw0KICAgICAgICB1aWRfdCByZWFsdWlkLCBvbGRmc3VpZDsNCiAgICAgICAgZ2lk
X3Qgb2xkZnNnaWQ7DQotICAgICAgIGNoYXIgKm1vdW50cG9pbnQ7DQorICAgICAgIGNoYXIgKm1v
dW50cG9pbnQgPSBOVUxMOw0KDQogICAgICAgIC8qDQogICAgICAgICAqIEFjcXVpcmUgdGhlIG5l
Y2Vzc2FyeSBwcml2aWxlZ2VzIHRvIGNoZGlyIHRvIHRoZSBtb3VudHBvaW50LiBJZg0KQEAgLTE5
NDIsOSArMTk0Miw5IEBAIHJlc3RvcmVfcHJpdnM6DQogICAgICAgICAgICAgICAgZ2lkX3QgX19h
dHRyaWJ1dGVfXygodW51c2VkKSkgZ2lnbm9yZSA9IHNldGZzZ2lkKG9sZGZzZ2lkKTsNCiAgICAg
ICAgfQ0KDQotICAgICAgIGlmIChyYykgew0KLSAgICAgICAgICAgICAgIGZyZWUoKm1vdW50cG9p
bnRwKTsNCi0gICAgICAgfQ0KKyAgICAgICBpZiAocmMpDQorICAgICAgICAgICAgICAgZnJlZSht
b3VudHBvaW50KTsNCisNCiAgICAgICAgcmV0dXJuIHJjOw0KIH0NCg0KDQoNCi0tDQoNCkRhdmlk
IE11bGRlcg0KTGFicyBTb2Z0d2FyZSBFbmdpbmVlciwgU2FtYmENClNVU0UNCjE4MDAgTm92ZWxs
IFBsYWNlDQpQcm92bywgVVQgODQ2MDYNCihQKSsxIDgwMS44NjEuNjU3MQ0KZG11bGRlckBzdXNl
LmNvbTxtYWlsdG86ZG11bGRlckBzdXNlLmNvbT4NCltodHRwczovL3d3dy5zdXNlLmNvbS9lbWFp
bC9pbWcvMjAxNi9lbWFpbF9zaWduYXR1cmVfc3VzZS5wbmddPGh0dHA6Ly93d3cuc3VzZS5jb20v
Pg0K

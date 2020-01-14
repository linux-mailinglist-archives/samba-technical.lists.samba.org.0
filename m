Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D84B13B153
	for <lists+samba-technical@lfdr.de>; Tue, 14 Jan 2020 18:48:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=r2T9mFMQCy4By693mj6PRlu7LU8EPzh4e8rD7A7RjH0=; b=xB9Gtf55R1Gimto9wHqwo9UAGx
	ehK9mh6ZKrvynCLPZ7Vng95/mLfvLuuAZkyLgwBn4CO0DaCmjBPVWE3bRwpA8tChZubHtYGhxh+nG
	aWB2zDY8OrDoY1ldfdrLwOAizsQR7OimPBz72zEUHht9QapRNn/hyU7P8+vVe+dIpzrxkWFJWKGfd
	pVAThdHArl1YENGcFtqz+29Yqmk04tjbcRwuWukyx289HgjJtBzKbvkKH2NQaFzxSzfHty43jN5dx
	jBofEcqKQhv7IESdTVjk4OWYXIus4UrpOnb9WagdXoVJqhwNl/th/bzda4Vewnna7b8cP+8xrRVcm
	Osn754jQ==;
Received: from localhost ([::1]:52496 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1irQIo-003PhK-5z; Tue, 14 Jan 2020 17:48:30 +0000
Received: from m9a0014g.houston.softwaregrp.com ([15.124.64.90]:54397) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1irQIi-003PhD-Qq
 for samba-technical@lists.samba.org; Tue, 14 Jan 2020 17:48:27 +0000
Received: FROM m9a0014g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0014g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 14 Jan 2020 17:47:36 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 14 Jan 2020 17:40:23 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 14 Jan 2020 17:40:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=na/wpBGnjUsi+Mxcq2uIq6oBiLu0oZvzFmULklgIlcuwW0eb3rihWNNvjNSP3HAkN1vJuIRzXLzUTdRb68W6sLqP7UeZ5YXFnu6/a8cpQT+lqPd/8/4qNmQvr6EUhzcnQ62dtVSANfPP6VS8ESJXgniLeEscVlDW/yYZ78T6GfLD1tzx1pHi8sjHH1oZQquZmVVSAiBLLWMLxW1LI9/jXMGBF6xzaouNpSCui0hsxUR8qDg8AJG+2hXWBrmzhKqSeNcm0kZZr9hihPj8GRt3jF1NzgsmV/8z2vNwD0uH0XJETxKnyjgpgcHyU3b7g1rEZVJXcHcRnjPavYN/C9npxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=koD1lC7wUItm1egg/yQtoCJfUhu1NN2Ux3Epk2p+Ehs=;
 b=Q1mUpc7uiMrwW9JVHPTps18Vf1treq0nJ9MyFK9T71RtDpPnMi5kl5J7Pqks4tbTUJm2fGrzoMzjxqAKTHpKuWTVh06K7mY/sB/2lfqc7sEgeomZtlvuLcHb5lP/BkjOJ+OAjpwAIjwGg1l84x1HcRtC59ngZy+Wuz053KYXcZ09bGAO7JBIey9gtNWeon1+10LKYuVdeiMBLiXJRLc5LgatuM1yyq1Wu5YTsbJbEVoo3jfj/I4SKXaolia/mZwKksPRKO3ylO9lUhu6BI0Yk9NU7i9AGmO0CRn2znlP9fW9UScEL1NKYtvhKzvltuQYaQeutXXxV5Jm/zFrTjbWMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from DM6PR18MB3161.namprd18.prod.outlook.com (10.255.172.90) by
 DM6PR18MB3082.namprd18.prod.outlook.com (20.179.49.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.13; Tue, 14 Jan 2020 17:40:22 +0000
Received: from DM6PR18MB3161.namprd18.prod.outlook.com
 ([fe80::7db1:9ede:a62a:c7a9]) by DM6PR18MB3161.namprd18.prod.outlook.com
 ([fe80::7db1:9ede:a62a:c7a9%6]) with mapi id 15.20.2623.017; Tue, 14 Jan 2020
 17:40:22 +0000
Received: from [192.168.1.10] (74.122.77.94) by
 LNXP265CA0037.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5c::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.18 via Frontend Transport; Tue, 14 Jan 2020 17:40:20 +0000
To: Stefan Metzmacher <metze@samba.org>
Subject: Re: SMB2 Write truncate
Thread-Topic: SMB2 Write truncate
Thread-Index: AQHVymNtgk8KnRXXf02IdER3VeVXKafpSMEAgAD7qwCAACIxAIAAB/WA
Date: Tue, 14 Jan 2020 17:40:21 +0000
Message-ID: <1ef3ebbc-fae0-e3bf-2809-b8e600ff15fa@suse.com>
References: <fa364f9a-b16e-9142-177e-a98b6bf8ce0d@suse.com>
 <20200114000836.GA157517@jra4>
 <b9d6fbba-dea4-e88f-3d80-c784e073e844@suse.com>
 <400304d3-3294-a7cb-3414-303da382bf2e@samba.org>
In-Reply-To: <400304d3-3294-a7cb-3414-303da382bf2e@samba.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=david.mulder@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [74.122.77.94]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8474c92a-3319-4dae-756f-08d79918d455
x-ms-traffictypediagnostic: DM6PR18MB3082:
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /YkZhraICJ7lmQIaxU5YpM06XFY0sUVMrzsw3uonwzHxAxqbctJFRnoUvtflYVwUeYbcjX5Pib0yt0uJbs13kl/7iBsTxBseg2lqzdxI3RNje4o15Db1FLUxm4t4B8NfphGYIJiML/3Yxq/BU1W2/LJj+OIijnYniglr5bVOnmPArJCKP8N/MZYbFbEpcAgjb7veKz0NH0rzaVuNxVdG9rp7eFkLyyHgsSomLo1nBK4qvr3eX0NuloLALV/pEFRCJtPKSjEOxINWGeDMMcuUFw9eaDTMhCvGmtZqis1ZVaTYOzBOAf5i3aLBNMae+zSTMQ3AQRLWkMp6/MymoB/H61ge2kyVnNS/wlVFYiU/xBUOy4vgDsNTXatSe9W1xAYlwOEGbvkxMrUYpVsbfSIgsgLFp27jmM/6w1luJzretl2wriMzQrilokjC6kVxZCAx5sWZP6tIf2hw0A1vgJPoHYkXvABt267af5NBVVp2KnQ=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8474c92a-3319-4dae-756f-08d79918d455
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HZtsM9uiJQYOR5PjUvn12KUYDEngiCnbjz6/XDfPE3+OJ6amjNoMrCQCJ7RGih+ytO7ztn1jVR7q3Uf4xGfSRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3082
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
Cc: samba-technical <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

SSBzZWUgdGhhdCB0aGlzIGlzIHZlcnkgbWVzc3kuIEknbGwgbW92ZSBvbiBmb3Igbm93LiBMb29r
cyB0byBtZSBsaWtlIHRoZXNlIHRlc3RzIHdpbGwgbmVlZCB0byBiZSBjb21wbGV0ZWx5IHJlLXdy
aXR0ZW4sIHNpbmNlIHRoZSBiZWhhdmlvciBoYXMgY2hhbmdlZC4NCg0KT24gMS8xNC8yMCAxMDox
MSBBTSwgU3RlZmFuIE1ldHptYWNoZXIgd3JvdGU6DQoNCkhpIERhdmlkLA0KDQppdCdzIGdvb2Qg
dGhhdCB5b3Ugd29yayBvbiB0aGUgc21iMiB0ZXN0cywgdGhhbmtzIQ0KDQpCdXQgd2F0Y2ggb3V0
IGZvciBzb3VyY2U0L3RvcnR1cmUvYmFzaWMvZGVsYXl3cml0ZS5jLCB0aGUgd3JpdGUgdGltZQ0K
dXBkYXRlIGhhbmRsaW5nIGlzIG9uZSBvZiB0aGUgbW9zdCBjb21wbGV4IHRvcGljLg0KV2luZG93
cyBiZWhhdmVzIGRpZmZlcmVudGx5IGRlcGVuZGluZyBvbiB0aGUgT1MgdmVyc2lvbiBhbmQNCnBy
b3RvY29sIGFuZCBhbHNvIHRoZSBjcm9zcyBwcm90b2NvbCBiZWhhdmlvciBicmluZ3MgYSBsb3Qg
b2Ygc3RyYW5nZQ0KdGhpbmdzLg0KDQpTZWUgaHR0cHM6Ly9idWd6aWxsYS5zYW1iYS5vcmcvc2hv
d19idWcuY2dpP2lkPTEzNTQxIGFuZA0KaHR0cHM6Ly9idWd6aWxsYS5zYW1iYS5vcmcvc2hvd19i
dWcuY2dpP2lkPTEzNTk0IGZvciBhIGxvdCBvZiB3b3JrDQppbiBwcm9ncmVzcyBwYXRjaGVzIGFu
ZCBvcGVuIHF1ZXN0aW9ucy4NCg0KTWF5YmUgeW91IHdhbnQgdG8gc2tpcCBzb3VyY2U0L3RvcnR1
cmUvYmFzaWMvZGVsYXl3cml0ZS5jIGZvciBub3cNCmFuZCBkbyB0aGUgZWFzeSBzdHVmZiBmaXJz
dC4uLg0KDQptZXR6ZQ0KDQpBbSAxNC4wMS4yMCB1bSAxNjowOSBzY2hyaWViIERhdmlkIE11bGRl
ciB2aWEgc2FtYmEtdGVjaG5pY2FsOg0KDQoNClRvIHRydW5jYXRlIGluIFNNQjIgeW91IGNhbiBj
YWxsIHNldGluZm8gb24gYSBoYW5kbGUNCndpdGggU01CX0ZJTEVfRU5EX09GX0ZJTEVfSU5GT1JN
QVRJT04uDQoNCkFoLCBJIG1pc3NlZCB0aGF0IFNFVF9JTkZPIGNhbGwuIFRoYW5rcyBKZXJlbXkg
YW5kIFJvbm5pZS4NCg0KLS0NCg0KRGF2aWQgTXVsZGVyDQpMYWJzIFNvZnR3YXJlIEVuZ2luZWVy
LCBTYW1iYQ0KU1VTRQ0KMTgwMCBOb3ZlbGwgUGxhY2UNClByb3ZvLCBVVCA4NDYwNg0KKFApKzEg
ODAxLjg2MS42NTcxDQpkbXVsZGVyQHN1c2UuY29tPG1haWx0bzpkbXVsZGVyQHN1c2UuY29tPjxt
YWlsdG86ZG11bGRlckBzdXNlLmNvbT48bWFpbHRvOmRtdWxkZXJAc3VzZS5jb20+DQpbaHR0cHM6
Ly93d3cuc3VzZS5jb20vZW1haWwvaW1nLzIwMTYvZW1haWxfc2lnbmF0dXJlX3N1c2UucG5nXTxo
dHRwOi8vd3d3LnN1c2UuY29tLz48aHR0cDovL3d3dy5zdXNlLmNvbS8+DQoNCg0KDQoNCg0KDQoN
Ci0tDQoNCkRhdmlkIE11bGRlcg0KTGFicyBTb2Z0d2FyZSBFbmdpbmVlciwgU2FtYmENClNVU0UN
CjE4MDAgTm92ZWxsIFBsYWNlDQpQcm92bywgVVQgODQ2MDYNCihQKSsxIDgwMS44NjEuNjU3MQ0K
ZG11bGRlckBzdXNlLmNvbTxtYWlsdG86ZG11bGRlckBzdXNlLmNvbT4NCltodHRwczovL3d3dy5z
dXNlLmNvbS9lbWFpbC9pbWcvMjAxNi9lbWFpbF9zaWduYXR1cmVfc3VzZS5wbmddPGh0dHA6Ly93
d3cuc3VzZS5jb20vPg0K

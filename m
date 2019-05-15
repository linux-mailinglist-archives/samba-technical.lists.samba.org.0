Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id C80961FC0A
	for <lists+samba-technical@lfdr.de>; Wed, 15 May 2019 23:03:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=2muHTEZwD6Jk7tpKeKKQ96ZNPutU3848vu1Ad5royIo=; b=fwiYNc04oll2Q47UMNzYDBuHTa
	5bCrBt/6xJMYvdAvbX5AhFmDa8L2ckQvnSBsDtyhUysEp8ky0Z9YX4Qn+U2Q1lbZMDt5Gky1l3Ivq
	BQ8Uiss+u9rZr+8mtkqdMhyDFRq1suswjteSm1rosWPYLyQChlqttSzCq1lDF26tjBR5QLJ39slh9
	nRyvDHGORKr9UftwJWzMREo+4PTO5/cJpyul5sfR4YnzdUl86JgXsqAHTl+yMMQosqJyEt1uXJxed
	8pBA9TQAb9nDYXcSxo+dkVuB+NEG/xUk1ZEH9v8v6avZNeo4FiY0r/kquqSL2kBPxIF9Rn4k0z/79
	8egLWACw==;
Received: from localhost ([::1]:35900 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hR13u-003s8G-Nv; Wed, 15 May 2019 21:03:42 +0000
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:34114) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hR13p-003s89-87
 for samba-technical@lists.samba.org; Wed, 15 May 2019 21:03:40 +0000
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4FKteKV007699; Wed, 15 May 2019 14:03:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=proofpoint20171006;
 bh=h4bHsPdy6ehCAcYEJPqtk1lQCVxLSeYnftUy7pgkdX8=;
 b=ZXwENWG4VNgDeUoiXQn+noyKcWMjKPUKSXkm6iVfKDDzgnqzbjVaySxeHyvB/2CtCy3s
 S6REN9RpbB5zr4GF4FH2AGelgDmLzSjnhq+w88tBsMkTbu4cW+/4D78Xy6iZGc3ZmTlQ
 i3uJ1V0/xYwg0px8MUQ5ns2v2yOFNJjAY2MgDZ1Xz6Qgujva8hfMOr3SlChHSY0ZlMfw
 2iEPRDFXP6WwYCSqEkxjcyyBltxDcEb/qt8jtNQK/qhabA8Lkf20K29E0xfJWGSElCpQ
 SoU9/8IoWP9O775TXdbYENuhLIo6Gs1a7nih7fzE3axDe2tPCJxqDdNorxFyO2W25JJ8 mQ== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2052.outbound.protection.outlook.com [104.47.36.52])
 by mx0a-002c1b01.pphosted.com with ESMTP id 2sg3j9a7um-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 15 May 2019 14:03:32 -0700
Received: from SN1PR02MB3727.namprd02.prod.outlook.com (52.132.198.161) by
 SN1PR02MB3758.namprd02.prod.outlook.com (52.132.200.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Wed, 15 May 2019 21:03:30 +0000
Received: from SN1PR02MB3727.namprd02.prod.outlook.com
 ([fe80::412c:7301:d5cc:83b3]) by SN1PR02MB3727.namprd02.prod.outlook.com
 ([fe80::412c:7301:d5cc:83b3%2]) with mapi id 15.20.1878.024; Wed, 15 May 2019
 21:03:30 +0000
To: Jeremy Allison <jra@samba.org>
Subject: Re: [PATCH] s3:loadparm: Ensure to truncate FS Volume Label at
 multibyte boundary
Thread-Topic: [PATCH] s3:loadparm: Ensure to truncate FS Volume Label at
 multibyte boundary
Thread-Index: AQHVCn3JZC4KMmd11U+fGF37tnpepKZqeqgAgAIyT4D//4v/gA==
Date: Wed, 15 May 2019 21:03:30 +0000
Message-ID: <6A78E0E4-038B-42B9-8858-2A8E39F79584@nutanix.com>
References: <B15C9E07-0E0B-49CD-BDD8-0CD236C4F777@nutanix.com>
 <C15B0D71-E5FD-4071-8FCC-E63EBFC3003E@nutanix.com>
 <20190515205841.GD253468@jra4>
In-Reply-To: <20190515205841.GD253468@jra4>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.2.180910
x-originating-ip: [192.146.154.3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 282e2fbc-60f8-47ee-22b0-08d6d978c8de
x-ms-traffictypediagnostic: SN1PR02MB3758:
x-ms-exchange-purlcount: 3
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zvWVD02EQSlJhIEyLpV4iEhOArErqZn3ozpwt7amk4OYpRGFFEXqOK7OmdnWSpvmp0XwPtDWH4FyqFWKAhn3smHA69Zbo0fF+m+WxJYJdz5zugfSPTSVTE8LAqdv1he/7lkRWStsLQCsXuHgci3gCSkBELlKvJv0ebXAig2DZfwyRd2r3U6UnHtg0M8xpGmOXgVpdzzeBs6msawpTsHSkeU6gQeo3T4F0Ao/SOv0wdlvH6D2DY8ATJc4B6MinCsCp9EUIHfPSOlL+trJrvffFKpnGPfKV8+I2Wltz1T7H01YnOiemA1bZHNcb/4GM3rFZ5+bvyDH77S6HWeyfVPWoDULb4w3tCxoZwrf/X+4JJM6FK0HRW7phdibSq/N1wWRciRKCevqYuHjCdqhllEyKUH+372vf4hpHRkYaSJcPV4=
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 282e2fbc-60f8-47ee-22b0-08d6d978c8de
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB3758
X-Proofpoint-Spam-Reason: safe
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Shyam Rathi via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shyam Rathi <shyam.rathi@nutanix.com>
Cc: "asn@samba.org" <asn@samba.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 "ddiss@samba.org" <ddiss@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

VGhhbmtzIGZvciB0aGUgY2hhbmdlcyBKZXJlbXkuIExvb2tzIEdvb2QgVG8gTWUhDQoNCg0KUmVn
YXJkcywNCi1TaHlhbQ0KDQpGcm9tOiBKZXJlbXkgQWxsaXNvbiA8anJhQHNhbWJhLm9yZz4NClJl
cGx5LVRvOiBKZXJlbXkgQWxsaXNvbiA8anJhQHNhbWJhLm9yZz4NCkRhdGU6IFdlZG5lc2RheSwg
TWF5IDE1LCAyMDE5IGF0IDE6NTggUE0NClRvOiBTaHlhbSBSYXRoaSA8c2h5YW0ucmF0aGlAbnV0
YW5peC5jb20+DQpDYzogInNhbWJhLXRlY2huaWNhbEBsaXN0cy5zYW1iYS5vcmciIDxzYW1iYS10
ZWNobmljYWxAbGlzdHMuc2FtYmEub3JnPiwgInNsb3dAc2FtYmEub3JnIiA8c2xvd0BzYW1iYS5v
cmc+LCAiYXNuQHNhbWJhLm9yZyIgPGFzbkBzYW1iYS5vcmc+LCAiZGRpc3NAc2FtYmEub3JnIiA8
ZGRpc3NAc2FtYmEub3JnPg0KU3ViamVjdDogUmU6IFtQQVRDSF0gczM6bG9hZHBhcm06IEVuc3Vy
ZSB0byB0cnVuY2F0ZSBGUyBWb2x1bWUgTGFiZWwgYXQgbXVsdGlieXRlIGJvdW5kYXJ5DQoNCk9u
IFR1ZSwgTWF5IDE0LCAyMDE5IGF0IDA2OjI2OjA3UE0gKzAwMDAsIFNoeWFtIFJhdGhpIHZpYSBz
YW1iYS10ZWNobmljYWwgd3JvdGU6DQpodHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20v
djIvdXJsP3U9aHR0cHMtM0FfX2J1Z3ppbGxhLnNhbWJhLm9yZ19zaG93LTVGYnVnLmNnaS0zRmlk
LTNEMTM5NDcmZD1Ed0lEYVEmYz1zODgzR3BVQ09DaEtPSGlvY1l0R2NnJnI9MDF4Y05pWVFKelJz
UXBvVFJ1eGpHS2JIejg5Y2ZycmNVNzlxb3hkb2cyayZtPVNlSzdmNHl4NFJrM3FYOUtuc2dWeVRM
cElqSGhNeVVXNzBqTWZLYTNiSHMmcz1Na2NZUmpLZFNSaG9BcjB1bG5DcUZUT1ViN0Y0OTg2MVRn
QlprTm9kdDMwJmU9DQpUbyByZXByb2R1Y2UsIGNyZWF0ZSBhIHNoYXJlIHdpdGggYSBuYW1lIHdo
ZXJlIDMybmQgYnl0ZSBpcyBub3QgdGhlIGZpcnN0IGJ5dGUgb2YgYSBtdXRsaWJ5dGUgY2hhcmFj
dGVyLiBVc2luZyBDSksgY2hhcmFjdGVycyAoMyBieXRlcyBlYWNoKSBpcyBhIHBvc3NpYmxlIGFw
cHJvYWNoLiBGb3IgZXhhbXBsZSwgY3JlYXRpbmcgYSBzaGFyZSB3aXRoIG5hbWUg7JeQ7J207JeQ
7ZSE7JeQ7Iqk7IK87KCQ7Jik7IOd7ISxIGFuZCB0cnlpbmcgdG8gb3BlbiBhIHR4dCBmaWxlIGlu
IE5vdGVwYWQgZ2l2ZXMgdGhlIGZvbGxvd2luZyBlcnJvcjoNCiAgIEludmFsaWQgY2hhcmFjdGVy
LiBGb3IgbXVsdGlieXRlIGNoYXJhY3RlciBzZXRzLCBvbmx5IHRoZSBsZWFkaW5nIGJ5dGUgaXMN
CiAgIGluY2x1ZGVkIHdpdGhvdXQgdGhlIHRyYWlsaW5nIGJ5dGUuIEZvciBVbmljb2RlIGNoYXJh
Y3RlciBzZXRzLCBpbmNsdWRlDQogICB0aGUgY2hhcmFjdGVycyAweEZGRkYgYW5kIDB4RkZGRS4N
Ckxvb2tpbmcgYXQgd2lyZXNoYXJrIGNhcHR1cmUsIHRoZSBmb2xsb3dpbmcgaXMgc2VlbiBhcyBz
b3VyY2Ugb2YgdGhpcyBpc3N1ZToNCiAgIEdldEluZm8gUmVxdWVzdCBGU19JTkZPL0ZpbGVGc1Zv
bHVtZUluZm9ybWF0aW9uIEZpbGU6IFJhdGhpOVw/Pz8/Pz8/Pz8/Pw0KICAgR2V0SW5mbyBSZXNw
b25zZSwgRXJyb3I6IFNUQVRVU19JTExFR0FMX0NIQVJBQ1RFUg0KUHJvcG9zZWQgc29sdXRpb24g
aXMgdG8gdHJ1bmNhdGUgdGhlIGxhYmVsIG5hbWUgYXQgdGhlIGVuZCBvZiBhIG11bHRpYnl0ZSBj
aGFyYWN0ZXIgYmVmb3JlIHRoZSAzMm5kIGJ5dGUuDQpQbGVhc2UgcmV2aWV3IGFuZCBzdWdnZXN0
IGNoYW5nZXMsIGltcHJvdmVtZW50cyBhbmQgb3RoZXIgYXBwcm9hY2hlcy4NClJlZ2FyZHMsDQot
U2h5YW1zdW5kZXIgUmF0aGkgKG1haWx0bzpzaHlhbS5yYXRoaUBudXRhbml4LmNvbSkNCg0KQSBm
ZXcgc2xpZ2h0IGNoYW5nZXMgdG8gbWFrZSB0aGluZ3MgY2xlYXJlciAodG8gbWUgYXQgbGVhc3Qg
Oi0pLg0KQ2hhbmdlcyBhdHRhY2hlZCBhbmQgYnVnIElEIGFkZGVkIHRvIHRoZSBjb21taXQgbWVz
c2FnZS4gTGV0IG1lDQprbm93IGlmIHlvdSdyZSBPSyB3aXRoIGl0Lg0KDQpSQisuIENhbiBJIGdl
dCBhIHNlY29uZCBUZWFtIHJldmlld2VyID8NCg0KSmVyZW15Lg0KDQo=

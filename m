Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 371425728E
	for <lists+samba-technical@lfdr.de>; Wed, 26 Jun 2019 22:25:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=aHOrOWV9whmSAqOyin9TwX5Y5NFmNJS30VDsDMNXLIk=; b=1yBZlAumZT0vvCLkGWmeuFxGe0
	FPzrvZX2GU7CQwjoRbDy6b7ni0kevAZZtDoR2A4r0Girj9AzTIHxOBG0kNpbiFD5MzPhmBwubYR7c
	WV5YWRK355hYUojmqsOU8wuyo1T9MbsOYzPTyE4xnQJmIsATlToI0g4qvTLtiqJWIxweJV3BBsqTR
	d1wFtng8zHXkBx0S6VAu8Y59vzK7CKplZfAjzW07BQCpB/rlpE1G1mPbu1Tb6J34cUEB/d+zctOwf
	jpEsz/FuNkpry+bOMJtbvBbj0VtUekng7P3i1y5Vo/2H1fWCX5bJPstCcN9TjBqF+hvOGQXYtB5jL
	wL+0c4yw==;
Received: from localhost ([::1]:26702 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hgEUI-0021CN-8T; Wed, 26 Jun 2019 20:25:50 +0000
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:40742) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hgEUD-0021CG-3h
 for samba-technical@lists.samba.org; Wed, 26 Jun 2019 20:25:47 +0000
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5QKPKj1011460; Wed, 26 Jun 2019 13:25:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=aHOrOWV9whmSAqOyin9TwX5Y5NFmNJS30VDsDMNXLIk=;
 b=bp8HTxNgcc4yLFVMKMCIL7QX1qUz9BmfqCc5iqqus4Vq7eoaQ7epZqCmaXilw6QC6FcJ
 YMyHvLJ+8SHlLi09uoANEgDLc2xsOr2eNxGbQtqMstuN1X/oeTUbR18zZ0TTHPzFZr3N
 wYeA9pPmhmesUfg0qSB7U7ErFYpZC+U3J/vNg7An/jkEhQFzufgenwSQA+ZVtMETM5Gk
 brA6Xv5wwC+9Sa/KzrvCEz58H9sKO/LlsQoQ+uuCKyYdWoHNfJqYv30hR2jzAvkfyOwh
 +uVTTrSChNsjh73D+LDv3Lin3XASgMMPFEp88hqz+zpvX5xhyuH0e1aPLEUthMzOloFr QA== 
Received: from nam02-bl2-obe.outbound.protection.outlook.com
 (mail-bl2nam02lp2054.outbound.protection.outlook.com [104.47.38.54])
 by mx0b-002c1b01.pphosted.com with ESMTP id 2tc6rgs002-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 26 Jun 2019 13:25:41 -0700
Received: from MW2PR02MB3722.namprd02.prod.outlook.com (52.132.177.31) by
 MW2PR02MB3707.namprd02.prod.outlook.com (52.132.177.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Wed, 26 Jun 2019 20:25:39 +0000
Received: from MW2PR02MB3722.namprd02.prod.outlook.com
 ([fe80::e038:6048:16a2:cc6b]) by MW2PR02MB3722.namprd02.prod.outlook.com
 ([fe80::e038:6048:16a2:cc6b%3]) with mapi id 15.20.2008.018; Wed, 26 Jun 2019
 20:25:39 +0000
To: Jeremy Allison <jra@samba.org>
Subject: Re: [PATCH] s3:notifyd: Handle sigup in notifyd to reparse smb.conf
Thread-Topic: [PATCH] s3:notifyd: Handle sigup in notifyd to reparse smb.conf
Thread-Index: AQHVDe0Ppb3GodJEUkiYbq337KQOmKZ5bIyA//+OswCAAJ2SAIAAvqcAgDREjgD//41ngA==
Date: Wed, 26 Jun 2019 20:25:39 +0000
Message-ID: <F7CF28D7-2446-470A-8694-1E1E3FBF03B4@nutanix.com>
References: <E869C7C5-1589-4AA2-BFF2-BD27F1C52D8C@nutanix.com>
 <20190524000405.GJ244578@jra4>
 <38917416-A93A-4B3B-9F44-B1B2D4087C03@nutanix.com>
 <20190524024232.GA14980@jeremy-acer>
 <969492C8-F2E7-4814-AC58-9595F66A0330@nutanix.com>
 <20190626201546.GA3263@jeremy-ThinkPad-X1>
In-Reply-To: <20190626201546.GA3263@jeremy-ThinkPad-X1>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.19.0.190512
x-originating-ip: [192.146.154.3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 79af569c-4f88-4fa9-04e0-08d6fa74748c
x-ms-traffictypediagnostic: MW2PR02MB3707:
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1A5u3QPoDMy8BCQuPO7y1DX1Cc3ZnC//O4WvitOSVdmmJ5a2bS62n6ec2wSJdvFHYG5Olb0WoWQ1391GaWkjAQHO0GsBFeZkic43iIsYfXNNy3ySZizTWc9iD+YWP2sRbGT9C7Js6MBIPz4IbzHQvZO7P47LsGIXDyJWXyIT0smqxqKQ0QPi4abR51f+oKDnwhAWbXEtf5Cy6rC8Bt2lFg+izC+dfmoBbanvM4odxL9h3vRH3o5zzpxoaWI+vs5dp3q1iUE/Ikfusqd76UP+hwwqdv+u/FJEQ+yzAOR+xMJhfXVfQHjtpS8cmX3UnXux4d4ZdZW4/tburRNN5LayadK69f5HuwuDtgMkhT7ha9+lgVTH8scE5eSEqHeutsWTqcOJ0fbJQcptP51Cx8YAwcLjFiNnN97Snt63p1Ri6FM=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D4FFCB0CCC1E084680358D67F905DF5A@namprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79af569c-4f88-4fa9-04e0-08d6fa74748c
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: shyam.rathi@nutanix.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR02MB3707
X-Proofpoint-Spam-Reason: safe
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
From: Shyam Rathi via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shyam Rathi <shyam.rathi@nutanix.com>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

VGhhbmsgeW91IEplcmVteS4NCg0KDQpSZWdhcmRzLA0KLVNoeWFtDQoNCkZyb206IEplcmVteSBB
bGxpc29uIDxqcmFAc2FtYmEub3JnPg0KUmVwbHktVG86IEplcmVteSBBbGxpc29uIDxqcmFAc2Ft
YmEub3JnPg0KRGF0ZTogV2VkbmVzZGF5LCBKdW5lIDI2LCAyMDE5IGF0IDE6MTUgUE0NClRvOiBT
aHlhbSBSYXRoaSA8c2h5YW0ucmF0aGlAbnV0YW5peC5jb20+DQpDYzogInNhbWJhLXRlY2huaWNh
bEBsaXN0cy5zYW1iYS5vcmciIDxzYW1iYS10ZWNobmljYWxAbGlzdHMuc2FtYmEub3JnPg0KU3Vi
amVjdDogUmU6IFtQQVRDSF0gczM6bm90aWZ5ZDogSGFuZGxlIHNpZ3VwIGluIG5vdGlmeWQgdG8g
cmVwYXJzZSBzbWIuY29uZg0KDQpPbiBGcmksIE1heSAyNCwgMjAxOSBhdCAwOTowNDo1NlBNICsw
MDAwLCBTaHlhbSBSYXRoaSB3cm90ZToNCkhpIEplcmVteSwNClBsZWFzZSBmaW5kIHRoZSBhdHRh
Y2hlZCB1cGRhdGUgcGF0Y2guIEnigJl2ZSBhZGRyZXNzZWQgYm90aCByZXZpZXcgY29tbWVudHMu
DQoNClRoYW5rcyBTaHlhbSwgdGhhdCBsb29rcyBnb29kIHRvIG1lLiBJJ2xsIHB1c2gNCml0IGlu
dG8gZ2l0bGFiLWNpIGFuZCBpZiBpdCBwYXNzZXMgY3JlYXRlIGEgbWVyZ2UNCnJlcXVlc3QuDQoN
CkplcmVteS4NCg0KUmVnYXJkcywNCi1TaHlhbQ0KRnJvbTogSmVyZW15IEFsbGlzb24gPG1haWx0
bzpqcmFAc2FtYmEub3JnPg0KUmVwbHktVG86IEplcmVteSBBbGxpc29uIDxtYWlsdG86anJhQHNh
bWJhLm9yZz4NCkRhdGU6IFRodXJzZGF5LCBNYXkgMjMsIDIwMTkgYXQgNzo0MiBQTQ0KVG86IFNo
eWFtIFJhdGhpIDxtYWlsdG86c2h5YW0ucmF0aGlAbnV0YW5peC5jb20+DQpDYzogIm1haWx0bzpz
YW1iYS10ZWNobmljYWxAbGlzdHMuc2FtYmEub3JnIiA8bWFpbHRvOnNhbWJhLXRlY2huaWNhbEBs
aXN0cy5zYW1iYS5vcmc+DQpTdWJqZWN0OiBSZTogW1BBVENIXSBzMzpub3RpZnlkOiBIYW5kbGUg
c2lndXAgaW4gbm90aWZ5ZCB0byByZXBhcnNlIHNtYi5jb25mDQpPbiBGcmksIE1heSAyNCwgMjAx
OSBhdCAxMjoxODozNkFNICswMDAwLCBTaHlhbSBSYXRoaSB2aWEgc2FtYmEtdGVjaG5pY2FsIHdy
b3RlOg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3IEplcmVteS4gUmVzcG9uc2VzIGlubGluZSBiZWxv
dy4NCivCoMKgwqDCoMKgwqAgREVCVUcoMiwoIm5vdGlmeWQ6IFJlbG9hZGluZyBzZXJ2aWNlcyBh
ZnRlciBTSUdIVVBcbiIpKTsNCgleXl5eDQoJUGxlYXNlIHVzZSBlaXRoZXIgdGhlIERCR19XQVJO
SU5HIG9yIERCR19OT1RJQ0UgbWFjcm9zDQoJdG8gZW5zdXJlIGNvbnNpc3RlbmN5IGluIG5ldyBk
ZWJ1ZyBpbmZvIGxldmVscy4NCgkJLS0tLSBJJ2xsIG1ha2UgdGhlIGNoYW5nZS4NClRoYW5rcyAh
DQorwqDCoMKgwqDCoMKgIGJlY29tZV9yb290KCk7DQorwqDCoMKgwqDCoMKgIHJlbG9hZF9zZXJ2
aWNlcyhOVUxMLCBOVUxMLCBmYWxzZSk7DQorwqDCoMKgwqDCoMKgIHVuYmVjb21lX3Jvb3QoKTsN
CgleXl5eXl5eDQpEb2VzIG5vdGlmeWQgbmVlZCBiZWNvbWVfcm9vdCgpL3VuYmVjb21lX3Jvb3Qo
KQ0KcGFpcnMgPyBJc24ndCBpdCBhbHdheXMgaW52b2tlZCB3aGVuIHNtYmQgaXMgcm9vdA0KYW5k
IHN0YXlzIGFzIHN1Y2ggPw0KCQktLS0tIFRoZSBzaWdodXAgaGFuZGxlciBmb3IgcGFyZW50IHNt
YmQgY2FsbHMNCgkJCSJjaGFuZ2VfdG9fcm9vdF91c2VyKCkiIGJlZm9yZSBjYWxsaW5nDQoJCQly
ZWxvYWRfc2VydmljZXMoKS4gRm9yIG1hbnkgb3RoZXIgYmluYXJpZXMsDQoJCQllaXRoZXIgcmVs
b2FkX3NlcnZpY2VzKCkgb3IgKHVuKWJlY29tZV9yb290DQoJCQlpcyBjYWxsZWQgZmlyc3QuIEkg
bWFpbmx5IGtlcHQgdGhlIHNhbWUNCgkJCWJlaGF2aW9yLiBJJ20gbm90IGZ1bGx5IHN1cmUgYWJv
dXQgaXRzIHB1cnBvc2UNCgkJCWF0IHRoaXMgcGxhY2UuDQpOb25lIG9mIHRoZSBub3RpZnlkIGNv
ZGUgZXZlciBjaGFuZ2VzIGNyZWRlbnRpYWxzLA0Kc28gd2hlbiBpdCBydW5zIGFzIHJvb3QgaXQn
bGwgc3RheSB0aGF0IHdheS4NCnNtYmQgaGFzIHRvIGNoYW5nZV90b19yb290X3VzZXIoKSBpbnNp
ZGUgdGhlIHNpZ25hbA0KaGFuZGxlciBhcyBpdCBvZnRlbiBjaGFuZ2VzIGNyZWRlbnRpYWxzIHRv
IHRoZSBjdXJyZW50DQphdHRhY2hlZCB1c2VyLCBzbyBtaWdodCBub3QgYmUgY3VycmVudGx5IHJ1
bm5pbmcgYXMNCnJvb3QuDQpJIGRvbid0IHRoaW5rIHlvdSBoYXZlIHRoZSBzYW1lIHByb2JsZW0g
aW5zaWRlIG5vdGlmeWQNCnNvIHlvdSBjYW4gZHJvcCB0aGUgYmVjb21lX3Jvb3QoKS91bmJlY29t
ZV9yb290KCkgSQ0KdGhpbmsuDQpUZXN0IGl0IG9uY2UgeW91J3ZlIG1hZGUgdGhlIGNoYW5nZSB0
byBtYWtlIHN1cmUgOi0pLg0KSmVyZW15Lg0KDQoNCg0KDQo=


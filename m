Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F89225B9
	for <lists+samba-technical@lfdr.de>; Sun, 19 May 2019 04:47:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=hQcoSne4EINNPTM37wZRohNIBHNU0VTBbcWRYF8D6Bg=; b=5Ql2670XyvKieiHQxnctTmFoyz
	OYjJAvtYoQhcgTzA1p3jRa2QmD+vCQxGjj8AgufV93/m03Bvn2g7NCBgzI71FyuVZs+QqIrRe1HIV
	m1ph4y4ucndZpPwVhKoW7Wbkym9CInGFdoEr2SpvNkk1cjZuTRdLAdPUFQSp8CLGh1eBmmAjE4eEu
	hA8qvo/3ppelCDWR4S2RN1b+hzhw/nVkbN8V5A81sOnU7mZjX/BXzz8KVuHo9m5OzTavp/wiWvBW8
	GSTGBn7ZM7IkLtMI8B9SSr42bAozdyW3Mr5t7n2jH3OHApx4YNvKmwtpX3OquMHlSTPUG1udgOG3y
	epBkXd8g==;
Received: from localhost ([::1]:36492 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hSBqe-000Tk0-Cw; Sun, 19 May 2019 02:46:52 +0000
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:51052) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hSBqT-000Tjt-Er
 for samba-technical@lists.samba.org; Sun, 19 May 2019 02:46:50 +0000
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4J2iwTY002679
 for <samba-technical@lists.samba.org>; Sat, 18 May 2019 19:46:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : subject
 : date : message-id : content-type : mime-version; s=proofpoint20171006;
 bh=OwIp8+frpN2CZlmEAhCE9BMJbLHg7XWan6T4shA4VfM=;
 b=bbXN1mDOcY8x3W/GljHTNRvml5wEGgl/ogouPcqiNyDQqFIffSAg9foOPb/oR+9mmZhm
 Yrx/FRWrgSRkJDsXlOKCxi8SIaMRlipX0kRfnEUEDx8rOPSsf+npdnVluACmkG+uQasG
 9kJ9f0RX9ai2gQNvhKYd1A2H1rcWf1dthLxp0NBOA2A2ClyOVpNmZiLcHPozcfEIfIXV
 +yVw0wqE7ByHp2KepzErdbfvy2aeFW2m32Sw1PGYcc4wTYqXq5fs+zKVNahgP+6ix0Yi
 MydXnY5snAAz5dlt83MZmGQCSM9FJnRG+ATFXrY0BBeTkDe495gFlwjf49ZRhG/IeaGH PQ== 
Received: from nam01-by2-obe.outbound.protection.outlook.com
 (mail-by2nam01lp2055.outbound.protection.outlook.com [104.47.34.55])
 by mx0a-002c1b01.pphosted.com with ESMTP id 2sjdy70xg8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <samba-technical@lists.samba.org>; Sat, 18 May 2019 19:46:33 -0700
Received: from MW2PR02MB3722.namprd02.prod.outlook.com (52.132.177.31) by
 MW2PR02MB3788.namprd02.prod.outlook.com (52.132.177.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Sun, 19 May 2019 02:46:30 +0000
Received: from MW2PR02MB3722.namprd02.prod.outlook.com
 ([fe80::ace0:1248:36bb:44b1]) by MW2PR02MB3722.namprd02.prod.outlook.com
 ([fe80::ace0:1248:36bb:44b1%5]) with mapi id 15.20.1900.010; Sun, 19 May 2019
 02:46:30 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: [PATCH] s3:notifyd: Handle sigup in notifyd to reparse smb.conf
Thread-Topic: [PATCH] s3:notifyd: Handle sigup in notifyd to reparse smb.conf
Thread-Index: AQHVDe0Ppb3GodJEUkiYbq337KQOmA==
Date: Sun, 19 May 2019 02:46:29 +0000
Message-ID: <E869C7C5-1589-4AA2-BFF2-BD27F1C52D8C@nutanix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.19.0.190512
x-originating-ip: [192.146.154.3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bc996534-41e6-41d9-7473-08d6dc043256
x-ms-traffictypediagnostic: MW2PR02MB3788:
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xg5XLavZGhHQQWbZWEFdqHxFWHlYcc2SfBWU1LNQEFoU+tcNpuV8YlgCb1AgsDjFdgnYW8oJMa5RhMGFFGU7f+p8SWXB99A+tVIn0r8kLDiYqhiIbzbiI+Hac3Ij8WAm8mxRTgLZtGkMhZpBd1ydnHgz7myLYDiG6YUXKzMHdsuQTJjq/cZOdUorlIjSmrIDAqr6Afm+quvnDxMAsO19S9hDjUYKMYMZRtDxf3oYeYecDwV+AtKtPNIXBDZt9zk3reFbzhqxZKCsveWxRy9W94dEFeYscDGjJVO8u1nu6nxK7P3LFuWWEee4nP4bVAhVrpRXi/guFcocQWWM6rzQ3gjTHCHJPTXJ6uQxaW5uWp6hQhuzM23LRmrrZwM/1otuOHTtoro1ck+iUZbh+4M6OOq8DHs51ddnWoavXqJi1oc=
Content-Type: multipart/mixed;
 boundary="_002_E869C7C515894AA2BFF2BD27F1C52D8Cnutanixcom_"
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc996534-41e6-41d9-7473-08d6dc043256
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR02MB3788
X-Proofpoint-Spam-Reason: safe
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--_002_E869C7C515894AA2BFF2BD27F1C52D8Cnutanixcom_
Content-Type: text/plain; charset="utf-8"
Content-ID: <BEE414DECBDDF7478C70778E1DFB7071@namprd02.prod.outlook.com>
Content-Transfer-Encoding: base64

SGVsbG8sDQoNCkF0IHByZXNlbnQsIFNJR0hVUCBpcyBibG9ja2VkIG9uIG5vdGlmeWQuIFNvLCBp
ZiBwYXJlbnQgc21iZA0KaXMgc3RhcnRlZCB3aXRoICJsb2cgbGV2ZWwiIDEwIGluIHNtYi5jb25m
LCBhbmQgbGF0ZXIgY2hhbmdlZA0KdG8gMCwgdGhlIFNJR0hVUCB3aWxsIG5vdCBjaGFuZ2UgdGhl
IGxvZyBsZXZlbCB0byAwIGluIG5vdGlmeQ0Kc21iZCBwcm9jZXNzIGFuZCBpdCB3aWxsIGtlZXAg
cHJpbnRpbmcgdmVyYm9zZSBsb2dzIGluIHRoZQ0KY29ycmVzcG9uZGluZyBsb2cgZmlsZXMuDQoN
ClByb3Bvc2VkIGZpeCBpcyB0byB3cml0ZSBhIFNJR0hVUCBoYW5kbGVyIGZvciBub3RpZnlkIGFu
ZCBzZXQNCml0IHRvIHJlbG9hZCBzZXJ2aWNlcy4NCg0KDQpQbGVhc2UgcmV2aWV3IHRoZSBhdHRh
Y2hlZCBwYXRjaCBmb3Igc3VnZ2VzdGlvbnMgYW5kIGNvbW1lbnRzLg0KDQpSZWdhcmRzLA0KU2h5
YW1zdW5kZXIgUmF0aGkNCg0K

--_002_E869C7C515894AA2BFF2BD27F1C52D8Cnutanixcom_
Content-Type: application/octet-stream;
	name="0001-s3-notifyd-Handle-sigup-in-notifyd-to-reparse-smb.co.patch"
Content-Description:  0001-s3-notifyd-Handle-sigup-in-notifyd-to-reparse-smb.co.patch
Content-Disposition: attachment;
	filename="0001-s3-notifyd-Handle-sigup-in-notifyd-to-reparse-smb.co.patch";
	size=2548; creation-date="Sun, 19 May 2019 02:46:29 GMT";
	modification-date="Sun, 19 May 2019 02:46:29 GMT"
Content-ID: <2D7ED34E7D18A44FBF2066175D15A04F@namprd02.prod.outlook.com>
Content-Transfer-Encoding: base64

RnJvbSBkNDcwZDVkMDJmZDM0NzQ1Nzk3OWZlZjlhYjMwNGViMjQ1YWUyYzUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTaHlhbXN1bmRlciBSYXRoaSA8c2h5YW0ucmF0aGlAbnV0YW5p
eC5jb20+CkRhdGU6IEZyaSwgMTcgTWF5IDIwMTkgMTg6MzQ6MDQgLTA3MDAKU3ViamVjdDogW1BB
VENIXSBzMzpub3RpZnlkOiBIYW5kbGUgc2lndXAgaW4gbm90aWZ5ZCB0byByZXBhcnNlIHNtYi5j
b25mCgpBdCBwcmVzZW50LCBTSUdIVVAgaXMgYmxvY2tlZCBvbiBub3RpZnlkLiBTbywgaWYgcGFy
ZW50IHNtYmQKaXMgc3RhcnRlZCB3aXRoICJsb2cgbGV2ZWwiIDEwIGluIHNtYi5jb25mLCBhbmQg
bGF0ZXIgY2hhbmdlZAp0byAwLCB0aGUgU0lHSFVQIHdpbGwgbm90IGNoYW5nZSB0aGUgbG9nIGxl
dmVsIHRvIDAgaW4gbm90aWZ5CnNtYmQgcHJvY2VzcyBhbmQgaXQgd2lsbCBrZWVwIHByaW50aW5n
IHZlcmJvc2UgbG9ncyBpbiB0aGUKY29ycmVzcG9uZGluZyBsb2cgZmlsZXMuCgpQcm9wb3NlZCBm
aXggaXMgdG8gd3JpdGUgYSBTSUdIVVAgaGFuZGxlciBmb3Igbm90aWZ5ZCBhbmQgc2V0Cml0IHRv
IHJlbG9hZCBzZXJ2aWNlcy4KClJldmlld2VkLWJ5OiBIZW1hbnRoIFRodW1tYWxhIDxoZW1hbnRo
LnRodW1tYWxhQG51dGFuaXguY29tPgpTaWduZWQtb2ZmLWJ5OiBTaHlhbXN1bmRlciBSYXRoaSA8
c2h5YW0ucmF0aGlAbnV0YW5peC5jb20+Ci0tLQogc291cmNlMy9zbWJkL3NlcnZlci5jIHwgMjYg
KysrKysrKysrKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvc291cmNlMy9zbWJkL3NlcnZlci5jIGIv
c291cmNlMy9zbWJkL3NlcnZlci5jCmluZGV4IDNhYzliZTkuLjBiM2U1MjIgMTAwNjQ0Ci0tLSBh
L3NvdXJjZTMvc21iZC9zZXJ2ZXIuYworKysgYi9zb3VyY2UzL3NtYmQvc2VydmVyLmMKQEAgLTQw
NCw2ICs0MDQsMTkgQEAgc3RhdGljIHZvaWQgbm90aWZ5ZF9zdG9wcGVkKHN0cnVjdCB0ZXZlbnRf
cmVxICpyZXEpCiAJREVCVUcoMSwgKCJub3RpZnlkIHN0b3BwZWQ6ICVzXG4iLCBzdHJlcnJvcihy
ZXQpKSk7CiB9CiAKK3N0YXRpYyB2b2lkIG5vdGlmeWRfc2lnX2h1cF9oYW5kbGVyKHN0cnVjdCB0
ZXZlbnRfY29udGV4dCAqZXYsCisJCQkJICAgIHN0cnVjdCB0ZXZlbnRfc2lnbmFsICpzZSwKKwkJ
CQkgICAgaW50IHNpZ251bSwKKwkJCQkgICAgaW50IGNvdW50LAorCQkJCSAgICB2b2lkICpzaWdp
bmZvLAorCQkJCSAgICB2b2lkICpwdnQpCit7CisJREVCVUcoMiwoIm5vdGlmeWQ6IFJlbG9hZGlu
ZyBzZXJ2aWNlcyBhZnRlciBTSUdIVVBcbiIpKTsKKwliZWNvbWVfcm9vdCgpOworCXJlbG9hZF9z
ZXJ2aWNlcyhOVUxMLCBOVUxMLCBmYWxzZSk7CisJdW5iZWNvbWVfcm9vdCgpOworfQorCiBzdGF0
aWMgYm9vbCBzbWJkX25vdGlmeWRfaW5pdChzdHJ1Y3QgbWVzc2FnaW5nX2NvbnRleHQgKm1zZywg
Ym9vbCBpbnRlcmFjdGl2ZSwKIAkJCSAgICAgIHN0cnVjdCBzZXJ2ZXJfaWQgKnBwaWQpCiB7CkBA
IC00MTIsNiArNDI1LDcgQEAgc3RhdGljIGJvb2wgc21iZF9ub3RpZnlkX2luaXQoc3RydWN0IG1l
c3NhZ2luZ19jb250ZXh0ICptc2csIGJvb2wgaW50ZXJhY3RpdmUsCiAJcGlkX3QgcGlkOwogCU5U
U1RBVFVTIHN0YXR1czsKIAlib29sIG9rOworCXN0cnVjdCB0ZXZlbnRfc2lnbmFsICpzZTsKIAog
CWlmIChpbnRlcmFjdGl2ZSkgewogCQlyZXEgPSBub3RpZnlkX3JlcShtc2csIGV2KTsKQEAgLTQ0
MCw2ICs0NTQsMTcgQEAgc3RhdGljIGJvb2wgc21iZF9ub3RpZnlkX2luaXQoc3RydWN0IG1lc3Nh
Z2luZ19jb250ZXh0ICptc2csIGJvb2wgaW50ZXJhY3RpdmUsCiAJCWV4aXQoMSk7CiAJfQogCisJ
LyogU2V0IHVwIHNpZ2h1cCBoYW5kbGVyIGZvciBub3RpZnlkICovCisJc2UgPSB0ZXZlbnRfYWRk
X3NpZ25hbChldiwKKwkJCSAgICAgICBldiwKKwkJCSAgICAgICBTSUdIVVAsIDAsCisJCQkgICAg
ICAgbm90aWZ5ZF9zaWdfaHVwX2hhbmRsZXIsCisJCQkgICAgICAgTlVMTCk7CisJaWYgKCFzZSkg
eworCQlERUJVRygwLCAoImZhaWxlZCB0byBzZXR1cCBub3RpZnlkIFNJR0hVUCBoYW5kbGVyXG4i
KSk7CisJCWV4aXQoMSk7CisJfQorCiAJcmVxID0gbm90aWZ5ZF9yZXEobXNnLCBldik7CiAJaWYg
KHJlcSA9PSBOVUxMKSB7CiAJCWV4aXQoMSk7CkBAIC00NDcsNyArNDcyLDYgQEAgc3RhdGljIGJv
b2wgc21iZF9ub3RpZnlkX2luaXQoc3RydWN0IG1lc3NhZ2luZ19jb250ZXh0ICptc2csIGJvb2wg
aW50ZXJhY3RpdmUsCiAJdGV2ZW50X3JlcV9zZXRfY2FsbGJhY2socmVxLCBub3RpZnlkX3N0b3Bw
ZWQsIG1zZyk7CiAKIAkvKiBCbG9jayB0aG9zZSBzaWduYWxzIHRoYXQgd2UgYXJlIG5vdCBoYW5k
bGluZyAqLwotCUJsb2NrU2lnbmFscyhUcnVlLCBTSUdIVVApOwogCUJsb2NrU2lnbmFscyhUcnVl
LCBTSUdVU1IxKTsKIAogCW1lc3NhZ2luZ19zZW5kKG1zZywgcGlkX3RvX3Byb2NpZChnZXRwcGlk
KCkpLCBNU0dfU01CX05PVElGWV9TVEFSVEVELAotLSAKMS45LjQKCg==

--_002_E869C7C515894AA2BFF2BD27F1C52D8Cnutanixcom_--


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5751CF09
	for <lists+samba-technical@lfdr.de>; Tue, 14 May 2019 20:26:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=I0tAhqW6yUMPOm/LIzASliGwpq26e/Se1d4Qb/MDfZc=; b=vGorOWm2+9NtSmjBPkpJRA/Tpe
	ajPizfkFSb7OxbYY2ewJDNrwY+tEgQMTjk3ZP+EC31Xri+qHVSkqWgO2vqEmo0UF53ym+2pdTdGOj
	7HKouwdHfygALpVRjk9nCcWzqSBmTxK9i679EyrAp4vAHHfA+/Jh5mcq8xzjxUvdFVrCpqa7Ub2NC
	jIfjmfkEEXqoTGtFowSe9uR2aOqZsLS4uJOVAnhA6gBs9UtNOqa7PF7ZkwuQTmKvk4ZBcYkC3DV1g
	ovjI+EZfjGH3bMYssIqFs7SLwnM43Tm5FM8aC/Tr1ZyV6CXDDvtRLp1vdRbYpi7W9cBiwE0hZzjjv
	F06zbYJA==;
Received: from localhost ([::1]:39740 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hQc7P-003clf-Mc; Tue, 14 May 2019 18:25:39 +0000
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:40918) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hQc7K-003clY-Jx
 for samba-technical@lists.samba.org; Tue, 14 May 2019 18:25:37 +0000
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4EHeHHh013741
 for <samba-technical@lists.samba.org>; Tue, 14 May 2019 10:52:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : subject
 : date : message-id : content-type : mime-version; s=proofpoint20171006;
 bh=He8y4l4sboxF146YJs1ECC32zO/ifWnJ/GT+RwXwNqs=;
 b=ceaMk29/nl/huJNHkzy8g0XN7tWCYmV7nG5AnkCyWXi8h9vIY/sWRmRV2+ABBpYHO5C/
 uJl3T4TCPRWdgVH/HP6ZS50DVIspzp7Qqgz+3i9AiaWQwTRwjIn8OhcqJpPB7MAcepnz
 msmuoA0nKaF8vcAwvG9gx8O+C1IbKGVaNGwGIUIocGdrdPoiadWDQgi69EJ4Iil5H+no
 d8/8Y++wvprA/1G2su6AglwguyYMFReInjPZNtFCpU27twwmjfWUlPnEgMtXLKqdPxuY
 OagYV8Yw3zaXiuSmntzUmoTurKXW2jftFNEQvQBCXQswaM9a+a8mBoVquNLfVNE0MD+1 iw== 
Received: from nam03-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam03lp2058.outbound.protection.outlook.com [104.47.41.58])
 by mx0b-002c1b01.pphosted.com with ESMTP id 2sdwqe51h6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <samba-technical@lists.samba.org>; Tue, 14 May 2019 10:52:27 -0700
Received: from MW2PR02MB3722.namprd02.prod.outlook.com (52.132.177.31) by
 MW2PR02MB3852.namprd02.prod.outlook.com (52.132.178.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Tue, 14 May 2019 17:52:25 +0000
Received: from MW2PR02MB3722.namprd02.prod.outlook.com
 ([fe80::ed70:69b9:b696:9bf4]) by MW2PR02MB3722.namprd02.prod.outlook.com
 ([fe80::ed70:69b9:b696:9bf4%3]) with mapi id 15.20.1878.024; Tue, 14 May 2019
 17:52:25 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: [PATCH] s3:loadparm: Ensure to truncate FS Volume Label at multibyte
 boundary
Thread-Topic: [PATCH] s3:loadparm: Ensure to truncate FS Volume Label at
 multibyte boundary
Thread-Index: AQHVCn3JZC4KMmd11U+fGF37tnpepA==
Date: Tue, 14 May 2019 17:52:25 +0000
Message-ID: <B15C9E07-0E0B-49CD-BDD8-0CD236C4F777@nutanix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.2.180910
x-originating-ip: [192.146.154.3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a09b943c-1b41-4318-82fe-08d6d894ec87
x-ms-traffictypediagnostic: MW2PR02MB3852:
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7kBlp9uD4HMEUiqp48ndoItJGTPLsVQbntZpuwbbbmQlGg0lDrUS36p5gt6N9nUmqnOy6IFpnJ9TxUjHr71JFXTPnWOaYqlMK9sCKX7SW5g0QDsU4L/vPoNExmRX1wCwygCjLdWafU2SujFSpDNqR6FYyWSatKqQYF58JL496vc442D30mQn7p/6TCK+Q2+REUw0d6lje0BJpmpkUkczaB1BGmejNZio+K2rEApCiQven/gGfLkEE4bc+s2WHFj9NAITIzUDGrzfJl7hb4ACs9h1CUXG/4xkucsV87THfWomiul3Tow2DhzY5HJxJFvAwKCsg3h/DLOkr26y2kque+7ULZ5gTvodHt1EPrFcx/YU8qn9MDCzKPX1c4p68F7d0lytjsRPWYXqhDulDuz1yIko3Awwyrg9Mo+4QAQL2Q8=
Content-Type: multipart/mixed;
 boundary="_002_B15C9E070E0B49CDBDD80CD236C4F777nutanixcom_"
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a09b943c-1b41-4318-82fe-08d6d894ec87
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR02MB3852
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

--_002_B15C9E070E0B49CDBDD80CD236C4F777nutanixcom_
Content-Type: text/plain; charset="utf-8"
Content-ID: <1518BF087CA85F42957DBEDE37A5A355@namprd02.prod.outlook.com>
Content-Transfer-Encoding: base64

Rm9yIEZTX1ZPTFVNRV9JTkZPL0ZTX0lORk8gb3BlcmF0aW9uLCBhIG1heGltdW0gb2YgMzIgY2hh
cmFjdGVycyBhcmUNCnNlbnQgYmFjay4gSG93ZXZlciwgc2luY2UgU2FtYmEgY2hvcHMgb2ZmIGFu
eSBzaGFyZSBuYW1lIHdpdGggPjMyDQpieXRlcyBhdCAzMiwgaXQgaXMgcG9zc2libGUgdGhhdCBh
IG11bHRpLWJ5dGUgc2hhcmUgbmFtZSBjYW4gZ2V0IGNob3BwZWQNCm9mZiBiZXR3ZWVuIGEgZnVs
bCBjaGFyYWN0ZXIuIFRoaXMgY2F1c2VzIHRoZSBzdHJpbmcgZGVjb2RpbmcgZm9yIHVuaWNvZGUN
CmZhaWx1cmUgd2hpY2ggc2VuZHMgYmFjayBOVF9TVEFUVVNfSUxMRUdBTF9DSEFSQUNURVIgKEVJ
TFNFUSkgdG8gdGhlIGNsaWVudA0KYXBwbGljYXRpb25zLg0KDQpPbiBXaW5kb3dzLCBOb3RlcGFk
IGRvZXNuJ3QgbGlrZSBpdCwgYW5kIHJlZnVzZXMgdG8gb3BlbiBhIGZpbGUgaW4gdGhpcw0KY2Fz
ZSBhbmQgZmFpbHMgd2l0aCB0aGUgZm9sbG93aW5nIGVycm9yOg0KDQogIEludmFsaWQgY2hhcmFj
dGVyLiBGb3IgbXVsdGlieXRlIGNoYXJhY3RlciBzZXRzLCBvbmx5IHRoZSBsZWFkaW5nIGJ5dGUg
aXMNCiAgaW5jbHVkZWQgd2l0aG91dCB0aGUgdHJhaWxpbmcgYnl0ZS4gRm9yIFVuaWNvZGUgY2hh
cmFjdGVyIHNldHMsIGluY2x1ZGUNCiAgdGhlIGNoYXJhY3RlcnMgMHhGRkZGIGFuZCAweEZGRkUu
DQoNClByb3Bvc2VkIGZpeDoNCi0gRmluZCB0aGUgbGFzdCBzdGFydGluZyBwb2ludCBvZiBhIG11
bHRpYnl0ZSBjb2RlcG9pbnQgaWYgdGhlIGNoYXJhY3Rlcg0KICBhdCAzMm5kIGJ5dGUgaXMgYSBz
dWJzZXF1ZW50IGJ5dGUgb2YgYSBNQiBjb2RlcG9pbnQuDQoNClJldmlld2VkLWJ5OiBIZW1hbnRo
IFRodW1tYWxhIDxoZW1hbnRoLnRodW1tYWxhQG51dGFuaXguY29tPg0KU2lnbmVkLW9mZi1ieTog
U2h5YW1zdW5kZXIgUmF0aGkgPHNoeWFtLnJhdGhpQG51dGFuaXguY29tPg0KDQoNClJlZ2FyZHMs
DQoNCi1TaHlhbXN1bmRlciBSYXRoaSAoc2h5YW0ucmF0aGlAbnV0YW5peC5jb20pDQoNCg==

--_002_B15C9E070E0B49CDBDD80CD236C4F777nutanixcom_
Content-Type: application/octet-stream;
	name="0001-s3-loadparm-Ensure-to-truncate-FS-Volume-Label-at-mu.patch"
Content-Description:  0001-s3-loadparm-Ensure-to-truncate-FS-Volume-Label-at-mu.patch
Content-Disposition: attachment;
	filename="0001-s3-loadparm-Ensure-to-truncate-FS-Volume-Label-at-mu.patch";
	size=2636; creation-date="Tue, 14 May 2019 17:52:24 GMT";
	modification-date="Tue, 14 May 2019 17:52:24 GMT"
Content-ID: <A20E373319BBE145AA56DC0F722C95BA@namprd02.prod.outlook.com>
Content-Transfer-Encoding: base64

RnJvbSA4NWRkM2E0MWE4YmQyNDljNmI1NmI1MGM0ZDVhY2ZjMDkwZmExODQyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTaHlhbXN1bmRlciBSYXRoaSA8c2h5YW0ucmF0aGlAbnV0YW5p
eC5jb20+CkRhdGU6IFN1biwgMTIgTWF5IDIwMTkgMjM6MDY6MTcgLTA3MDAKU3ViamVjdDogW1BB
VENIXSBzMzpsb2FkcGFybTogRW5zdXJlIHRvIHRydW5jYXRlIEZTIFZvbHVtZSBMYWJlbCBhdCBt
dWx0aWJ5dGUKIGJvdW5kYXJ5CgpGb3IgRlNfVk9MVU1FX0lORk8vRlNfSU5GTyBvcGVyYXRpb24s
IGEgbWF4aW11bSBvZiAzMiBjaGFyYWN0ZXJzIGFyZQpzZW50IGJhY2suIEhvd2V2ZXIsIHNpbmNl
IFNhbWJhIGNob3BzIG9mZiBhbnkgc2hhcmUgbmFtZSB3aXRoID4zMgpieXRlcyBhdCAzMiwgaXQg
aXMgcG9zc2libGUgdGhhdCBhIG11bHRpLWJ5dGUgc2hhcmUgbmFtZSBjYW4gZ2V0IGNob3BwZWQK
b2ZmIGJldHdlZW4gYSBmdWxsIGNoYXJhY3Rlci4gVGhpcyBjYXVzZXMgdGhlIHN0cmluZyBkZWNv
ZGluZyBmb3IgdW5pY29kZQpmYWlsdXJlIHdoaWNoIHNlbmRzIGJhY2sgTlRfU1RBVFVTX0lMTEVH
QUxfQ0hBUkFDVEVSIChFSUxTRVEpIHRvIHRoZSBjbGllbnQKYXBwbGljYXRpb25zLgoKT24gV2lu
ZG93cywgTm90ZXBhZCBkb2Vzbid0IGxpa2UgaXQsIGFuZCByZWZ1c2VzIHRvIG9wZW4gYSBmaWxl
IGluIHRoaXMKY2FzZSBhbmQgZmFpbHMgd2l0aCB0aGUgZm9sbG93aW5nIGVycm9yOgoKICBJbnZh
bGlkIGNoYXJhY3Rlci4gRm9yIG11bHRpYnl0ZSBjaGFyYWN0ZXIgc2V0cywgb25seSB0aGUgbGVh
ZGluZyBieXRlIGlzCiAgaW5jbHVkZWQgd2l0aG91dCB0aGUgdHJhaWxpbmcgYnl0ZS4gRm9yIFVu
aWNvZGUgY2hhcmFjdGVyIHNldHMsIGluY2x1ZGUKICB0aGUgY2hhcmFjdGVycyAweEZGRkYgYW5k
IDB4RkZGRS4KClByb3Bvc2VkIGZpeDoKLSBGaW5kIHRoZSBsYXN0IHN0YXJ0aW5nIHBvaW50IG9m
IGEgbXVsdGlieXRlIGNvZGVwb2ludCBpZiB0aGUgY2hhcmFjdGVyCiAgYXQgMzJuZCBieXRlIGlz
IGEgc3Vic2VxdWVudCBieXRlIG9mIGEgTUIgY29kZXBvaW50LgoKUmV2aWV3ZWQtYnk6IEhlbWFu
dGggVGh1bW1hbGEgPGhlbWFudGgudGh1bW1hbGFAbnV0YW5peC5jb20+ClNpZ25lZC1vZmYtYnk6
IFNoeWFtc3VuZGVyIFJhdGhpIDxzaHlhbS5yYXRoaUBudXRhbml4LmNvbT4KLS0tCiBzb3VyY2Uz
L3BhcmFtL2xvYWRwYXJtLmMgfCAyNyArKysrKysrKysrKysrKysrKysrKysrKysrLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L3NvdXJjZTMvcGFyYW0vbG9hZHBhcm0uYyBiL3NvdXJjZTMvcGFyYW0vbG9hZHBhcm0uYwppbmRl
eCA1YWYxNjIxLi5mODU5NmRlIDEwMDY0NAotLS0gYS9zb3VyY2UzL3BhcmFtL2xvYWRwYXJtLmMK
KysrIGIvc291cmNlMy9wYXJhbS9sb2FkcGFybS5jCkBAIC00MjQ0LDEyICs0MjQ0LDM1IEBAIGNv
bnN0IGNoYXIgKnZvbHVtZV9sYWJlbChUQUxMT0NfQ1RYICpjdHgsIGludCBzbnVtKQogewogCWNo
YXIgKnJldDsKIAljb25zdCBjaGFyICpsYWJlbCA9IGxwX3ZvbHVtZShjdHgsIHNudW0pOworCWlu
dCBlbmQgPSAwLCBtYXhsZW4gPSAzMjsKKwogCWlmICghKmxhYmVsKSB7CiAJCWxhYmVsID0gbHBf
c2VydmljZW5hbWUoY3R4LCBzbnVtKTsKIAl9CiAKLQkvKiBUaGlzIHJldHVybnMgYSAzMyBieXRl
IGd1YXJlbnRlZWQgbnVsbCB0ZXJtaW5hdGVkIHN0cmluZy4gKi8KLQlyZXQgPSB0YWxsb2Nfc3Ry
bmR1cChjdHgsIGxhYmVsLCAzMik7CisJLyogVm9sdW1lIGxhYmVsIGNhbiBiZSBhIG1heCBvZiAz
MiBieXRlcy4gTWFrZSBzdXJlIHRvIHRydW5jYXRlIGl0IGF0CisJICAgYSBjb2RlcG9pbnQgYm91
bmRhcnkgaWYgdGhlIHN0cmluZyBjb250YWlucyBtdWx0aWJ5dGUgY2hhcmFjdGVycy4gKi8KKwll
bmQgPSBtYXhsZW47CisJaWYgKHN0cmxlbihsYWJlbCkgPiBlbmQpIHsKKwkJLyogQW4gTUIgY2hh
ciBjYW4gYmUgYSBtYXggb2YgNSBieXRlcyAqLworCQl3aGlsZSAoZW5kID49IG1heGxlbi01KSB7
CisJCQkvKiBDaGVjayBpZiBhIGNvZGVwb2ludCBzdGFydGluZyBmcm9tIG5leHQgYnl0ZSBpcyB2
YWxpZC4gSWYgeWVzLCB0aGVuCisJCQkgICB0aGUgY3VycmVudCBieXRlIGlzIHRoZSBlbmQgb2Yg
YSBNQiBzZXF1ZW5jZSBhbmQgdGhlIGxhYmVsIGNhbiBiZSBzYWZlbHkKKwkJCSAgIHRydW5jYXRl
ZCBoZXJlLiBJZiBub3QsIGtlZXAgZ29pbmcgYmFja3dhcmRzIHRpbGwgYSB2YWxpZCBjb2RlcG9p
bnQgaXMKKwkJCSAgIGZvdW5kLiAqLworCQkJc2l6ZV90IGxlbiA9IDA7CisJCQljb25zdCBjaGFy
ICpzID0gJmxhYmVsW2VuZF07CisJCQljb2RlcG9pbnRfdCBjID0gbmV4dF9jb2RlcG9pbnQocywg
Jmxlbik7CisJCQlpZiAoYyAhPSBJTlZBTElEX0NPREVQT0lOVCkgeworCQkJCWJyZWFrOworCQkJ
fQorCisJCQllbmQtLTsKKwkJfQorCX0KKworCS8qIFRoaXMgcmV0dXJucyBhIG1heCBvZiAzMyBi
eXRlIGd1YXJlbnRlZWQgbnVsbCB0ZXJtaW5hdGVkIHN0cmluZy4gKi8KKwlyZXQgPSB0YWxsb2Nf
c3RybmR1cChjdHgsIGxhYmVsLCBlbmQpOwogCWlmICghcmV0KSB7CiAJCXJldHVybiAiIjsKIAl9
CQkKLS0gCjEuOS40Cgo=

--_002_B15C9E070E0B49CDBDD80CD236C4F777nutanixcom_--


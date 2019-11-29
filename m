Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0508D10D1C9
	for <lists+samba-technical@lfdr.de>; Fri, 29 Nov 2019 08:22:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=PPN9Pv+a8TpOJ0HTN+ujm50elGcbwdou1hVxETiqot4=; b=LhATCFvs5qWxDzqWIMBgNtpZsn
	t5ZSCf2MKoX8WG3xYQOmhRxvGwV9X3txYQiO2NQ0rTSgkHFHaDqWpiXlMGq0nGdnOmhMHy9zBduSF
	lb0UXAYI0jjSEUYA7DWNsHLlKKl/b7i6tTHE2RTxFgj9I84TZOXkb7Yx+FQGn991IBvAWbqFeFSUt
	RITkcj57IuDkvYFgV+cPaGUEzO8s8AT0xzt8Oz1pa/WL/4LGJ4Fm4EdW3yjKnoxZpHzwkZkcNOutw
	RkYGOZE5YA2IHg5TyFxkgjly8xgBSj3mq5W00lUpMjmlTEyUWVjz8WD7k307pZiJWTUDRj2RdRyqP
	n2ZGuXqw==;
Received: from localhost ([::1]:61088 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iaaan-003CQo-D7; Fri, 29 Nov 2019 07:21:29 +0000
Received: from smtp3.jd.com ([59.151.64.88]:2050) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_CBC_SHA1:128)
 (Exim) id 1iaaaW-003CQX-SG
 for samba-technical@lists.samba.org; Fri, 29 Nov 2019 07:21:20 +0000
Received: from BJMAILD1MBX18.360buyAD.local (172.31.0.18) by
 BJMAILD1MBX42.360buyAD.local (172.31.0.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1415.2; Fri, 29 Nov 2019 15:20:59 +0800
Received: from BJMAILD1MBX23.360buyAD.local (172.31.0.23) by
 BJMAILD1MBX18.360buyAD.local (172.31.0.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1415.2; Fri, 29 Nov 2019 15:20:59 +0800
Received: from BJMAILD1MBX23.360buyAD.local ([fe80::28e4:e9be:9dfd:bf5]) by
 BJMAILD1MBX23.360buyAD.local ([fe80::28e4:e9be:9dfd:bf5%17]) with mapi id
 15.01.1415.002; Fri, 29 Nov 2019 15:20:59 +0800
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: ctdb 4.11.2 version failed to recover
Thread-Topic: ctdb 4.11.2 version failed to recover
Thread-Index: AdWmfHNSooFM126fQ8yTFgxj1mNy/wACQcCQ
Date: Fri, 29 Nov 2019 07:20:59 +0000
Message-ID: <07289a1fd0a740db8e1f0abad2b7a49c@jd.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.31.14.18]
Content-Type: multipart/mixed;
 boundary="_004_07289a1fd0a740db8e1f0abad2b7a49cjdcom_"
MIME-Version: 1.0
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
From: =?utf-8?b?6IC/57qq6LaFIHZpYSBzYW1iYS10ZWNobmljYWw=?=
 <samba-technical@lists.samba.org>
Reply-To: =?gb2312?B?uaK8zbOs?= <gengjichao@jd.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--_004_07289a1fd0a740db8e1f0abad2b7a49cjdcom_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGmjrA0KICAgICAgIEkgdXNlIHRoZSBjdGRiIG9mIDQuMTEuMiB2ZXJzaW9uLCBpbmNsdWRlIHRo
ZSBuZXdlc3QgcGF0Y2goaHR0cHM6Ly9idWd6aWxsYS5zYW1iYS5vcmcvc2hvd19idWcuY2dpP2lk
PTE0MTc1KS4gQnV0LHdoZW4gSSB0ZXN0IHRoZSBOSUMgZXhjZXB0aW9uLCBJIGVuY291bnRlciBh
IHByb2JsZW0sIHRoZSBjdGRiIGNsdXN0ZXIgY2FuIG5vdA0KUmVjb3ZlciBOb3JtYWwuDQogICAg
ICAgVGhlIHRlc3Qgc3RlcHMgYXJlIGFzIGZvbGxvd3M6DQoNCjGhoiBjdGRiIGNsdXN0ZXIgaGF2
ZSB0d28gbmRvZXMsIG5vZGVBIGFuZCBub2RlQqOsdGhlIGNsdXN0ZXIgc3RhdHVzIGlzIE9LoaMN
Cg0KMqGiIElmZG93biB0aGUgbm9kZUEgYW5kIG5vZGVCoa9zIE5JQywgd2hpY2ggY29uZmlnIHBy
aXZhdGUgSVAuDQoNCjOhoiBBZnRlciAyNSBzZWNvbmRzLCBub2RlQSBhbmQgbm9kZUIgZGV0ZWNo
IGVhY2ggb3RoZXIgZGVhZKOsdGhlbiBjYWxsIHRoZSBmdW5jdGlvbnM6IGN0ZGJfdGNwX3Jlc3Rh
cnQtPmN0ZGJfdGNwX25vZGVfY29ubmVjdCwNCmJ1dCBiaW5kIGZhaWxlZCwgcHJpbnQgdGhlIGxv
ZzoNCg0Kbm9kZSAxMC4yNDAuMjI2LjIxMTo0Mzc5IGlzIGRlYWQ6IDAgY29ubmVjdGVkDQoNClRl
YXJpbmcgZG93biBjb25uZWN0aW9uIHRvIGRlYWQgbm9kZSA6MQ0KDQpGYWlsZWQgdG8gYmluZCBz
b2NrZXQgKENhbm5vdCBhc3NpZ24gcmVxdWVzdGVkIGFkZHJlc3MpDQoNCmN0ZGJfY29udHJvbCBl
cnJvcjogJ25vZGUgaXMgZGlzY29ubmVjdGVkJw0KDQpjdGRiLXJlY292ZXJkWzE3OTI2XTogLi4v
Li4vc2VydmVyL2N0ZGJfY2xpZW50LmM6MTA3MSBjdGRiX2NvbnRyb2wgZm9yIGdldG5vZGVzIGZh
aWxlZCByZXQ6LTEgcmVzOi0xDQoNCjShoiBUaGUgbGFzdCwgaWZ1cCBub2RlQSBhbmQgbm9kZUKh
rnMgTklDo6xJIHdhaXQgYSBsb25nIHRpbWUsdGhlIGN0ZGIgY2x1c3RlciBkbyBub3QgcmVjb3Zl
ciBvay4gSSB1c2UgdGhlIG5ldHN0YXQgqENhbnAgfCBncmVwIGN0ZGIgY29tbWFuZCwgZG8gbm90
IGhhdmUgdGhlIGNvbm5lY3Rpb24gd2l0aCBlYWNoIG90aGVyLg0Kd2hlbiBOSUMgaXMgdXAsIHRo
ZSBwcmludCBsb2cgaXM6DQpjdGRiLXJlY292ZXJkWzE3OTI2XTogSW50ZXJmYWNlIGJvbmQwLjEy
MDoyIGNoYW5nZWQgc3RhdGU6IDAgPT4gMQ0KVHJpZ2dlciB0YWtlb3ZlcnJ1bg0KVGFrZW92ZXIg
cnVuIHN0YXJ0aW5nDQpObyBub2RlcyBhdmFpbGFibGUgdG8gaG9zdCBwdWJsaWMgSVBzIHlldA0K
TW9uaXRvcmluZyBldmVudCB3YXMgY2FuY2VsbGVkDQpUYWtlb3ZlciBydW4gY29tcGxldGVkIHN1
Y2Nlc3NmdWxseQ0KTG9jayBjb250ZW50aW9uIGR1cmluZyByZW5ldzogLTE2DQovdXNyL2xpYmV4
ZWMvY3RkYi9jdGRiX211dGV4X2NlcGhfcmFkb3NfaGVscGVyOiBGYWlsZWQgdG8gZHJvcCBsb2Nr
IG9uIFJBRE9TIG9iamVjdCAnbG9ja2N0ZGInIC0gKE5vIHN1Y2ggZmlsZSBvciBkaXJlY3Rvcnkp
DQpSZWNvdmVyeSBsb2NrIGhlbHBlciB0ZXJtaW5hdGVkLCB0cmlnZ2VyaW5nIGFuIGVsZWN0aW9u
DQpSZWNvdmVyeSBtb2RlIHNldCB0byBBQ1RJVkUNCmN0ZGItcmVjb3ZlcmRbMTc5MjZdOiBFbGVj
dGlvbiBwZXJpb2QgZW5kZWQNCk5vZGU6MCB3YXMgaW4gcmVjb3ZlcnkgbW9kZS4gU3RhcnQgcmVj
b3ZlcnkgcHJvY2Vzcw0KY3RkYi1yZWNvdmVyZFsxNzkyNl06IC4uLy4uL3NlcnZlci9jdGRiX3Jl
Y292ZXJkLmM6MTM0NyBTdGFydGluZyBkb19yZWNvdmVyeQ0KICAgICAgICAgICAgICAgICAgICAg
QXR0ZW1wdGluZyB0byB0YWtlIHJlY292ZXJ5IGxvY2sgKCEvdXNyL2xpYmV4ZWMvY3RkYi9jdGRi
X211dGV4X2NlcGhfcmFkb3NfaGVscGVyIGNlcGggY2xpZW50LmFkbWluIGNlcGhmc19kYXRhIGxv
Y2tjdGRiKQ0KY3RkYi1yZWNvdmVyZFsxNzkyNl06IFVuYWJsZSB0byB0YWtlIHJlY292ZXJ5IGxv
Y2sgLSBjb250ZW50aW9uDQpjdGRiLXJlY292ZXJkWzE3OTI2XTogVW5hYmxlIHRvIHRha2UgcmVj
b3ZlcnkgbG9jaw0KY3RkYi1yZWNvdmVyZFsxNzkyNl06IEFib3J0IHJlY292ZXJ5LCBiYW4gdGhp
cyBub2RlIGZvciAzMDAgc2Vjb25kcw0KY3RkYi1yZWNvdmVyZFsxNzkyNl06IEJhbm5pbmcgbm9k
ZSAwIGZvciAzMDAgc2Vjb25kcw0KDQpzb2x1dGlvbjoNCiAgICAgICB3aGVuIGJpbmQgZmFpbGVk
LCBubyBvbmUgd2lsbCByZWVzdGFibGlzaCBjb25uZWN0aW9ucywgZXZlbiB0aGUgTklDIGlzIHVw
LiBJIHRoaW5rIHdoZW4gYmluZCBmYWlsZWQsIHdlIHNob3VsZCB1c2UgdGhlIHRpbWUgdG8gcmV0
cnkuIFRoZSBwYXRjaCBpcyBmb2xsb3csIEkgdGVzdCBpdCB3b3JrIHdlbGyhow0KLS0tIGEvY3Rk
Yi90Y3AvdGNwX2Nvbm5lY3QuYw0KKysrIGIvY3RkYi90Y3AvdGNwX2Nvbm5lY3QuYw0KQEAgLTIz
Niw2ICsyMzYsMTEgQEAgdm9pZCBjdGRiX3RjcF9ub2RlX2Nvbm5lY3Qoc3RydWN0IHRldmVudF9j
b250ZXh0ICpldiwgc3RydWN0IHRldmVudF90aW1lciAqdGUsDQogICAgICAgICAgICAgICAgREJH
X0VSUigiRmFpbGVkIHRvIGJpbmQgc29ja2V0ICglcylcbiIsIHN0cmVycm9yKGVycm5vKSk7DQog
ICAgICAgICAgICAgICAgY2xvc2UodG5vZGUtPm91dF9mZCk7DQogICAgICAgICAgICAgICAgdG5v
ZGUtPm91dF9mZCA9IC0xOw0KKyAgICAgICAgICAgICAgIHRub2RlLT5jb25uZWN0X3RlID0gdGV2
ZW50X2FkZF90aW1lcihjdGRiLT5ldiwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdG5vZGUsDQorICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRpbWV2YWxfY3VycmVudF9vZnMoNSwgMCks
DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGN0ZGJfdGNwX25vZGVfY29ubmVjdCwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgbm9kZSk7DQogICAgICAgICAgICAgICAgcmV0dXJuOw0K
ICAgICAgICB9DQoNCg==

--_004_07289a1fd0a740db8e1f0abad2b7a49cjdcom_
Content-Type: application/octet-stream; name="ctdb.4.11.2.patch"
Content-Description: ctdb.4.11.2.patch
Content-Disposition: attachment; filename="ctdb.4.11.2.patch"; size=521;
	creation-date="Fri, 29 Nov 2019 06:13:22 GMT";
	modification-date="Fri, 29 Nov 2019 06:13:22 GMT"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2N0ZGIvdGNwL3RjcF9jb25uZWN0LmMgYi9jdGRiL3RjcC90Y3BfY29ubmVj
dC5jCmluZGV4IDNlZTc0YjEuLjA1NjBkMDUgMTAwNjQ0Ci0tLSBhL2N0ZGIvdGNwL3RjcF9jb25u
ZWN0LmMKKysrIGIvY3RkYi90Y3AvdGNwX2Nvbm5lY3QuYwpAQCAtMjM2LDYgKzIzNiwxMSBAQCB2
b2lkIGN0ZGJfdGNwX25vZGVfY29ubmVjdChzdHJ1Y3QgdGV2ZW50X2NvbnRleHQgKmV2LCBzdHJ1
Y3QgdGV2ZW50X3RpbWVyICp0ZSwKIAkJREJHX0VSUigiRmFpbGVkIHRvIGJpbmQgc29ja2V0ICgl
cylcbiIsIHN0cmVycm9yKGVycm5vKSk7CiAJCWNsb3NlKHRub2RlLT5vdXRfZmQpOwogCQl0bm9k
ZS0+b3V0X2ZkID0gLTE7CisJCXRub2RlLT5jb25uZWN0X3RlID0gdGV2ZW50X2FkZF90aW1lcihj
dGRiLT5ldiwKKwkJCQkJCQl0bm9kZSwKKwkJCQkJCQl0aW1ldmFsX2N1cnJlbnRfb2ZzKDUsIDAp
LAorCQkJCQkJCWN0ZGJfdGNwX25vZGVfY29ubmVjdCwKKwkJCQkJCQlub2RlKTsKIAkJcmV0dXJu
OwogCX0KIAo=

--_004_07289a1fd0a740db8e1f0abad2b7a49cjdcom_--


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF862A036
	for <lists+samba-technical@lfdr.de>; Fri, 24 May 2019 23:05:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=vpJ0QhTsJHCaEjKBjpue2EdfNdzY+1B1LtBzv/wBAkc=; b=CVqQcMraLnBnHJLaNxZobwct7D
	2YEcJmQXtRBHeFTp6VykoXf0x1ddgZ8QBphHdlhnaAi9Hupt1zaQWb4Z2G5Im2/9DTPKbXLmqUERi
	iPamd1Up0PmgO3Zrh7uQVb7zzVhflZRdn9Oms/2U0pus8K+98q6WMfV0CrfEmTJ7Hd5AwGx1kbGoa
	FZ2R1Mdhu23CZ8umvyQj+MmG92RALl7DzZyiRuHg4wkads5wLLaaFPdjZ+Gv+otqm0V4phOXxS95V
	sjeyY1BglaBu+af/98dzZopRRG8khl0pzMEooBNDQT0qAqnwEHjhvL1rz9Ek/1fI+fQuPf5Yr+xDE
	UCX3TtKQ==;
Received: from localhost ([::1]:42800 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hUHNF-001fga-8S; Fri, 24 May 2019 21:05:09 +0000
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:36290) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hUHN9-001fgQ-O8
 for samba-technical@lists.samba.org; Fri, 24 May 2019 21:05:07 +0000
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4OL0RlD015052; Fri, 24 May 2019 14:04:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=proofpoint20171006;
 bh=LbGroFsJpH6RQvpdc+CyWwpb7lZwSKvpNdEWWBS0NWo=;
 b=ujAUe9BS0O6XfFPIRPxmehWGtu4sucddibrgcB1QMIqhwPHFTVMD/AM080hss+TC8IC9
 9bS25O/ipxt5SlW1aKgQdsODBEgfwwKprCg+9d3u2KJBwyWV3HALyEf1SjCiHEOa2JjX
 +hbB4qtD27MKNGrRxTqofsXmEJeMYoDpqH2Xu9YIReYLmRSF0r+zik1Mx86rDkRLFVUj
 /jU10U2PLfXdV8eLwdFKLAcK3MnsIgc7vy5CVZMXYeEzjASnXgITNw9aRRRZOFHYw1bu
 3OjqhMkhPd6g1alT5l3H7HaNIcy8zGbdfPtFFI37Ifk8wvYT2Ts9BewxEYJNddyvVFWO 3g== 
Received: from nam03-co1-obe.outbound.protection.outlook.com
 (mail-co1nam03lp2059.outbound.protection.outlook.com [104.47.40.59])
 by mx0a-002c1b01.pphosted.com with ESMTP id 2sp4c7a0kn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 24 May 2019 14:04:58 -0700
Received: from MW2PR02MB3722.namprd02.prod.outlook.com (52.132.177.31) by
 MW2PR02MB3657.namprd02.prod.outlook.com (52.132.177.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.16; Fri, 24 May 2019 21:04:56 +0000
Received: from MW2PR02MB3722.namprd02.prod.outlook.com
 ([fe80::ace0:1248:36bb:44b1]) by MW2PR02MB3722.namprd02.prod.outlook.com
 ([fe80::ace0:1248:36bb:44b1%5]) with mapi id 15.20.1922.019; Fri, 24 May 2019
 21:04:56 +0000
To: Jeremy Allison <jra@samba.org>
Subject: Re: [PATCH] s3:notifyd: Handle sigup in notifyd to reparse smb.conf
Thread-Topic: [PATCH] s3:notifyd: Handle sigup in notifyd to reparse smb.conf
Thread-Index: AQHVDe0Ppb3GodJEUkiYbq337KQOmKZ5bIyA//+OswCAAJ2SAIAAvqcA
Date: Fri, 24 May 2019 21:04:56 +0000
Message-ID: <969492C8-F2E7-4814-AC58-9595F66A0330@nutanix.com>
References: <E869C7C5-1589-4AA2-BFF2-BD27F1C52D8C@nutanix.com>
 <20190524000405.GJ244578@jra4>
 <38917416-A93A-4B3B-9F44-B1B2D4087C03@nutanix.com>
 <20190524024232.GA14980@jeremy-acer>
In-Reply-To: <20190524024232.GA14980@jeremy-acer>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.19.0.190512
x-originating-ip: [192.146.154.3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 905f240f-9345-4776-7e1d-08d6e08b799c
x-ms-traffictypediagnostic: MW2PR02MB3657:
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Jq5ETSAk6G5EbuBivuX9ibytmf6taojBfJXbiVCn6/YVV4CNnS5nNupoF6LbUcr2BhjvxI1191G4p4LjWcxYABSF+jR+fpZ2CmljOH7GI+UhVFe75M+HV+6bgIFUR9jQbS8yfE3zmd+ITa6DdoRhiUkAZvD0QS+KwjLVqf4mXIbtgfD9PiU9uPQHZYmnAjrILcHDZf31uy5fX/rp8Zf5jPb4uAcox6BSkSW4YPgi40+imL7YlS7vOGX58YAOR4b0Yrpz1m/vBjAlmk0H/RC3HbAj2Lx20CfzdREE2qO/ntkUz/yubeXnLgkbOlC8h2vpRvIfpNlTGST1zxrd5JV/Q4LAlpcfDtuKKmfkvgi+hkYiZCUC1C1vZJxFHaTl52JsQkHuwYMmIgXjJydIiDH+FIHHB5+5sDY4gW2GEBMMwn0=
Content-Type: multipart/mixed;
 boundary="_002_969492C8F2E74814AC589595F66A0330nutanixcom_"
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 905f240f-9345-4776-7e1d-08d6e08b799c
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: shyam.rathi@nutanix.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR02MB3657
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
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--_002_969492C8F2E74814AC589595F66A0330nutanixcom_
Content-Type: text/plain; charset="utf-8"
Content-ID: <221585313D9E8C4EA6100C18F504596D@namprd02.prod.outlook.com>
Content-Transfer-Encoding: base64

SGkgSmVyZW15LA0KUGxlYXNlIGZpbmQgdGhlIGF0dGFjaGVkIHVwZGF0ZSBwYXRjaC4gSeKAmXZl
IGFkZHJlc3NlZCBib3RoIHJldmlldyBjb21tZW50cy4NCg0KDQpSZWdhcmRzLA0KLVNoeWFtDQoN
CkZyb206IEplcmVteSBBbGxpc29uIDxqcmFAc2FtYmEub3JnPg0KUmVwbHktVG86IEplcmVteSBB
bGxpc29uIDxqcmFAc2FtYmEub3JnPg0KRGF0ZTogVGh1cnNkYXksIE1heSAyMywgMjAxOSBhdCA3
OjQyIFBNDQpUbzogU2h5YW0gUmF0aGkgPHNoeWFtLnJhdGhpQG51dGFuaXguY29tPg0KQ2M6ICJz
YW1iYS10ZWNobmljYWxAbGlzdHMuc2FtYmEub3JnIiA8c2FtYmEtdGVjaG5pY2FsQGxpc3RzLnNh
bWJhLm9yZz4NClN1YmplY3Q6IFJlOiBbUEFUQ0hdIHMzOm5vdGlmeWQ6IEhhbmRsZSBzaWd1cCBp
biBub3RpZnlkIHRvIHJlcGFyc2Ugc21iLmNvbmYNCg0KT24gRnJpLCBNYXkgMjQsIDIwMTkgYXQg
MTI6MTg6MzZBTSArMDAwMCwgU2h5YW0gUmF0aGkgdmlhIHNhbWJhLXRlY2huaWNhbCB3cm90ZToN
ClRoYW5rcyBmb3IgdGhlIHJldmlldyBKZXJlbXkuIFJlc3BvbnNlcyBpbmxpbmUgYmVsb3cuDQor
wqDCoMKgwqDCoMKgIERFQlVHKDIsKCJub3RpZnlkOiBSZWxvYWRpbmcgc2VydmljZXMgYWZ0ZXIg
U0lHSFVQXG4iKSk7DQoJXl5eXg0KCVBsZWFzZSB1c2UgZWl0aGVyIHRoZSBEQkdfV0FSTklORyBv
ciBEQkdfTk9USUNFIG1hY3Jvcw0KCXRvIGVuc3VyZSBjb25zaXN0ZW5jeSBpbiBuZXcgZGVidWcg
aW5mbyBsZXZlbHMuDQoJCS0tLS0gSSdsbCBtYWtlIHRoZSBjaGFuZ2UuDQoNClRoYW5rcyAhDQoN
CivCoMKgwqDCoMKgwqAgYmVjb21lX3Jvb3QoKTsNCivCoMKgwqDCoMKgwqAgcmVsb2FkX3NlcnZp
Y2VzKE5VTEwsIE5VTEwsIGZhbHNlKTsNCivCoMKgwqDCoMKgwqAgdW5iZWNvbWVfcm9vdCgpOw0K
CV5eXl5eXl4NCkRvZXMgbm90aWZ5ZCBuZWVkIGJlY29tZV9yb290KCkvdW5iZWNvbWVfcm9vdCgp
DQpwYWlycyA/IElzbid0IGl0IGFsd2F5cyBpbnZva2VkIHdoZW4gc21iZCBpcyByb290DQphbmQg
c3RheXMgYXMgc3VjaCA/DQoJCS0tLS0gVGhlIHNpZ2h1cCBoYW5kbGVyIGZvciBwYXJlbnQgc21i
ZCBjYWxscw0KCQkJImNoYW5nZV90b19yb290X3VzZXIoKSIgYmVmb3JlIGNhbGxpbmcNCgkJCXJl
bG9hZF9zZXJ2aWNlcygpLiBGb3IgbWFueSBvdGhlciBiaW5hcmllcywNCgkJCWVpdGhlciByZWxv
YWRfc2VydmljZXMoKSBvciAodW4pYmVjb21lX3Jvb3QNCgkJCWlzIGNhbGxlZCBmaXJzdC4gSSBt
YWlubHkga2VwdCB0aGUgc2FtZQ0KCQkJYmVoYXZpb3IuIEknbSBub3QgZnVsbHkgc3VyZSBhYm91
dCBpdHMgcHVycG9zZQ0KCQkJYXQgdGhpcyBwbGFjZS4NCg0KTm9uZSBvZiB0aGUgbm90aWZ5ZCBj
b2RlIGV2ZXIgY2hhbmdlcyBjcmVkZW50aWFscywNCnNvIHdoZW4gaXQgcnVucyBhcyByb290IGl0
J2xsIHN0YXkgdGhhdCB3YXkuDQoNCnNtYmQgaGFzIHRvIGNoYW5nZV90b19yb290X3VzZXIoKSBp
bnNpZGUgdGhlIHNpZ25hbA0KaGFuZGxlciBhcyBpdCBvZnRlbiBjaGFuZ2VzIGNyZWRlbnRpYWxz
IHRvIHRoZSBjdXJyZW50DQphdHRhY2hlZCB1c2VyLCBzbyBtaWdodCBub3QgYmUgY3VycmVudGx5
IHJ1bm5pbmcgYXMNCnJvb3QuDQoNCkkgZG9uJ3QgdGhpbmsgeW91IGhhdmUgdGhlIHNhbWUgcHJv
YmxlbSBpbnNpZGUgbm90aWZ5ZA0Kc28geW91IGNhbiBkcm9wIHRoZSBiZWNvbWVfcm9vdCgpL3Vu
YmVjb21lX3Jvb3QoKSBJDQp0aGluay4NCg0KVGVzdCBpdCBvbmNlIHlvdSd2ZSBtYWRlIHRoZSBj
aGFuZ2UgdG8gbWFrZSBzdXJlIDotKS4NCg0KSmVyZW15Lg0KDQoNCg==

--_002_969492C8F2E74814AC589595F66A0330nutanixcom_
Content-Type: application/octet-stream;
	name="0001-s3-notifyd-Handle-sigup-in-notifyd-to-reparse-smb.co.patch"
Content-Description:  0001-s3-notifyd-Handle-sigup-in-notifyd-to-reparse-smb.co.patch
Content-Disposition: attachment;
	filename="0001-s3-notifyd-Handle-sigup-in-notifyd-to-reparse-smb.co.patch";
	size=2511; creation-date="Fri, 24 May 2019 21:04:55 GMT";
	modification-date="Fri, 24 May 2019 21:04:55 GMT"
Content-ID: <C79DD80A49A88541AF61FB0733E0214E@namprd02.prod.outlook.com>
Content-Transfer-Encoding: base64

RnJvbSA2ODlhNGM0ZjM4YmQzNmQyMDA0NjFkZDgxODk1NzI1ZGM1ODkwMjdkIE1vbiBTZXAgMTcg
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
c2h5YW0ucmF0aGlAbnV0YW5peC5jb20+Ci0tLQogc291cmNlMy9zbWJkL3NlcnZlci5jIHwgMjQg
KysrKysrKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3NvdXJjZTMvc21iZC9zZXJ2ZXIuYyBiL3Nv
dXJjZTMvc21iZC9zZXJ2ZXIuYwppbmRleCAzYWM5YmU5Li5mNmI1MWQyIDEwMDY0NAotLS0gYS9z
b3VyY2UzL3NtYmQvc2VydmVyLmMKKysrIGIvc291cmNlMy9zbWJkL3NlcnZlci5jCkBAIC00MDQs
NiArNDA0LDE3IEBAIHN0YXRpYyB2b2lkIG5vdGlmeWRfc3RvcHBlZChzdHJ1Y3QgdGV2ZW50X3Jl
cSAqcmVxKQogCURFQlVHKDEsICgibm90aWZ5ZCBzdG9wcGVkOiAlc1xuIiwgc3RyZXJyb3IocmV0
KSkpOwogfQogCitzdGF0aWMgdm9pZCBub3RpZnlkX3NpZ19odXBfaGFuZGxlcihzdHJ1Y3QgdGV2
ZW50X2NvbnRleHQgKmV2LAorCQkJCSAgICBzdHJ1Y3QgdGV2ZW50X3NpZ25hbCAqc2UsCisJCQkJ
ICAgIGludCBzaWdudW0sCisJCQkJICAgIGludCBjb3VudCwKKwkJCQkgICAgdm9pZCAqc2lnaW5m
bywKKwkJCQkgICAgdm9pZCAqcHZ0KQoreworCURCR19OT1RJQ0UoIm5vdGlmeWQ6IFJlbG9hZGlu
ZyBzZXJ2aWNlcyBhZnRlciBTSUdIVVBcbiIpOworCXJlbG9hZF9zZXJ2aWNlcyhOVUxMLCBOVUxM
LCBmYWxzZSk7Cit9CisKIHN0YXRpYyBib29sIHNtYmRfbm90aWZ5ZF9pbml0KHN0cnVjdCBtZXNz
YWdpbmdfY29udGV4dCAqbXNnLCBib29sIGludGVyYWN0aXZlLAogCQkJICAgICAgc3RydWN0IHNl
cnZlcl9pZCAqcHBpZCkKIHsKQEAgLTQxMiw2ICs0MjMsNyBAQCBzdGF0aWMgYm9vbCBzbWJkX25v
dGlmeWRfaW5pdChzdHJ1Y3QgbWVzc2FnaW5nX2NvbnRleHQgKm1zZywgYm9vbCBpbnRlcmFjdGl2
ZSwKIAlwaWRfdCBwaWQ7CiAJTlRTVEFUVVMgc3RhdHVzOwogCWJvb2wgb2s7CisJc3RydWN0IHRl
dmVudF9zaWduYWwgKnNlOwogCiAJaWYgKGludGVyYWN0aXZlKSB7CiAJCXJlcSA9IG5vdGlmeWRf
cmVxKG1zZywgZXYpOwpAQCAtNDQwLDYgKzQ1MiwxNyBAQCBzdGF0aWMgYm9vbCBzbWJkX25vdGlm
eWRfaW5pdChzdHJ1Y3QgbWVzc2FnaW5nX2NvbnRleHQgKm1zZywgYm9vbCBpbnRlcmFjdGl2ZSwK
IAkJZXhpdCgxKTsKIAl9CiAKKwkvKiBTZXQgdXAgc2lnaHVwIGhhbmRsZXIgZm9yIG5vdGlmeWQg
Ki8KKwlzZSA9IHRldmVudF9hZGRfc2lnbmFsKGV2LAorCQkJICAgICAgIGV2LAorCQkJICAgICAg
IFNJR0hVUCwgMCwKKwkJCSAgICAgICBub3RpZnlkX3NpZ19odXBfaGFuZGxlciwKKwkJCSAgICAg
ICBOVUxMKTsKKwlpZiAoIXNlKSB7CisJCURFQlVHKDAsICgiZmFpbGVkIHRvIHNldHVwIG5vdGlm
eWQgU0lHSFVQIGhhbmRsZXJcbiIpKTsKKwkJZXhpdCgxKTsKKwl9CisKIAlyZXEgPSBub3RpZnlk
X3JlcShtc2csIGV2KTsKIAlpZiAocmVxID09IE5VTEwpIHsKIAkJZXhpdCgxKTsKQEAgLTQ0Nyw3
ICs0NzAsNiBAQCBzdGF0aWMgYm9vbCBzbWJkX25vdGlmeWRfaW5pdChzdHJ1Y3QgbWVzc2FnaW5n
X2NvbnRleHQgKm1zZywgYm9vbCBpbnRlcmFjdGl2ZSwKIAl0ZXZlbnRfcmVxX3NldF9jYWxsYmFj
ayhyZXEsIG5vdGlmeWRfc3RvcHBlZCwgbXNnKTsKIAogCS8qIEJsb2NrIHRob3NlIHNpZ25hbHMg
dGhhdCB3ZSBhcmUgbm90IGhhbmRsaW5nICovCi0JQmxvY2tTaWduYWxzKFRydWUsIFNJR0hVUCk7
CiAJQmxvY2tTaWduYWxzKFRydWUsIFNJR1VTUjEpOwogCiAJbWVzc2FnaW5nX3NlbmQobXNnLCBw
aWRfdG9fcHJvY2lkKGdldHBwaWQoKSksIE1TR19TTUJfTk9USUZZX1NUQVJURUQsCi0tIAoxLjku
NAoK

--_002_969492C8F2E74814AC589595F66A0330nutanixcom_--


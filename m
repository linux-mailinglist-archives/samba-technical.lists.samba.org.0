Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E63DB139ACF
	for <lists+samba-technical@lfdr.de>; Mon, 13 Jan 2020 21:37:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:Date:To;
	bh=l4q6BZShb4hcaBq9XufQPy+Ft1aWM8DLMVcK2k4hz7k=; b=4urkFBS/UWlIVtknh7OShwAgrP
	e0reeXYREGnjfXh+QRoppl+ie8L1FK5/k0P4NGMYp4NgT26bZNLW/xdo4+8j6w0kE4c9ytztZosMv
	yW+lKyCGujGCVnwtVWH8MO3KH0BjFpPbAFcBpychjMZ3RYQ3oZCDsYmTnT2ElPdH+ZKwaRo1YbfNz
	4m0hPCzSumKwmOwPq/1nVNi3rqk+7N70rtEfLJgZuDkdWG3RNZfKa7pgrHu6ccYlGSXKiV+m8XAbf
	vWloYa4oGh11Qt3cumLRIZQLSvDKRcchtl4T8cepPiwIXQIXsQQYiSzSQEOG8x3b/rMztkfmhkfVL
	x6h8ZlAw==;
Received: from localhost ([::1]:57126 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ir6T0-003I8a-99; Mon, 13 Jan 2020 20:37:42 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:24716) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1ir6Sw-003I8T-5W
 for samba-technical@lists.samba.org; Mon, 13 Jan 2020 20:37:40 +0000
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00DKVdEu146094; Mon, 13 Jan 2020 15:37:33 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xfvqmjne5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2020 15:37:33 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00DKUreh025153;
 Mon, 13 Jan 2020 20:37:32 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03wdc.us.ibm.com with ESMTP id 2xf756w6jb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2020 20:37:32 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00DKbVe861604276
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jan 2020 20:37:31 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98FBF136053;
 Mon, 13 Jan 2020 20:37:31 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 737A713604F;
 Mon, 13 Jan 2020 20:37:31 +0000 (GMT)
Received: from mail.gmx.ibm.com (unknown [9.209.242.119])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Mon, 13 Jan 2020 20:37:31 +0000 (GMT)
Received: from m01ex005.gmx.ibm.com (10.148.53.45) by m01ex004.gmx.ibm.com
 (10.148.53.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Mon, 13 Jan
 2020 14:37:12 -0600
Received: from m01ex005.gmx.ibm.com ([fe80::7d2d:476:2d5a:cb2f]) by
 m01ex005.gmx.ibm.com ([fe80::7d2d:476:2d5a:cb2f%9]) with mapi id
 15.01.1779.002; Mon, 13 Jan 2020 14:37:12 -0600
To: Jeremy Allison <jra@samba.org>
Thread-Topic: [EXTERNAL] Re: Still some loose ends after commit ba53e284e68
Thread-Index: AQHVyAfbhHascdEUkUqmCLuPEKgdC6fk8XAAgAAEvQCABBw5gA==
Date: Mon, 13 Jan 2020 20:37:11 +0000
Message-ID: <DA7434C5-4905-4328-8F5E-403D52E0F592@ibm.com>
References: <41568b840d704235b639b4c6044fc3fb@ibm.com>
 <20200110233410.GA5904@jra4> <20200110235108.GB5904@jra4>
In-Reply-To: <20200110235108.GB5904@jra4>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [9.16.14.35]
Content-Type: text/plain; charset="utf-8"
Content-ID: <BE40DF1130B92941B4F2A6B1BEC78547@gmx.ibm.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re:  Re: Still some loose ends after commit ba53e284e68
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
From: "Christopher O Cowan - Christopher.O.Cowan--- via samba-technical"
 <samba-technical@lists.samba.org>
Reply-To: "Christopher O Cowan - Christopher.O.Cowan@ibm.com"
 <Christopher.O.Cowan@ibm.com>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

VGhhbmtzLiAgIFRoYXQgd29ya2VkLg0KDQpOb3cgc21iZCBpcyBmYWlsaW5nIGxhdGVyIGluIHRo
ZSBzdGFydHVwLiAgICBJJ2xsIHBvc3QgZGV0YWlscywgaWYgSSBjYW4ndCBmaWd1cmUgaXQgb3V0
Lg0KDQoNCu+7v09uIDEvMTAvMjAsIDU6NTEgUE0sICJKZXJlbXkgQWxsaXNvbiIgPGpyYUBzYW1i
YS5vcmc+IHdyb3RlOg0KDQogICAgT24gRnJpLCBKYW4gMTAsIDIwMjAgYXQgMDM6MzQ6MTBQTSAt
MDgwMCwgSmVyZW15IEFsbGlzb24gd3JvdGU6DQogICAgPiBPbiBGcmksIEphbiAxMCwgMjAyMCBh
dCAxMDo0Njo1NFBNICswMDAwLCBDaHJpc3RvcGhlciBPIENvd2FuIC0gQ2hyaXN0b3BoZXIuTy5D
b3dhbi0tLSB2aWEgc2FtYmEtdGVjaG5pY2FsIHdyb3RlOg0KICAgID4gPiBJIHN0aWxsIGdldHRp
bmcgc29tZSBhc3NlcnRpb25zIHBvaW50aW5nIHRvIHJlYy0+dmFsdWVfdmFsaWQgYWZ0ZXIgY29t
cGlsaW5nIHdpdGggdGhlIHBhdGNoLiAgIFNlZW1zIHRvIGJlIHdoZW4gSSdtIGF0dGVtcHRpbmcg
dG8gc3RhcnQgc21iZC4NCiAgICA+ID4gDQogICAgPiA+IEkndmUgYXR0YWNoZWQgdGhlIGxvZyBm
cm9tIHJ1bm5pbmcgc21iZCAtaSAtZDEwLCBhbmQgYSBkYnggc3RhY2sgdHJhY2UuDQogICAgPiA+
IEl0IGFwcGVhcnMgdGhhdCB0aGVyZSBhZGRpdGlvbmFsIGNhbGxiYWNrcyB0aGF0IG5lZWQgdG8g
YmUgY2xlYW5lZCB1cC4NCiAgICA+IC4uDQogICAgPiA+IFR5cGUgJ2hlbHAnIGZvciBoZWxwLg0K
ICAgID4gPiBbdXNpbmcgbWVtb3J5IGltYWdlIGluIC90bXAvY29yZS42NDg4MzM0LjEwMjIzMzUy
XQ0KICAgID4gPiByZWFkaW5nIHN5bWJvbGljIGluZm9ybWF0aW9uIC4uLg0KICAgID4gPiANCiAg
ICA+ID4gSU9UL0Fib3J0IHRyYXAgaW4gcHRocmVhZF9raWxsIGF0IDB4ZDA1NGJiOTQgKCR0MSkN
CiAgICA+ID4gMHhkMDU0YmI5NCAocHRocmVhZF9raWxsKzB4YjQpIDgwNDEwMDE0ICAgICAgICAg
ICAgbHd6ICAgcjIsMHgxNChyMSkNCiAgICA+ID4gcHRocmVhZF9raWxsKD8/LCA/PykgYXQgMHhk
MDU0YmI5NA0KICAgID4gPiBfcF9yYWlzZSg/PykgYXQgMHhkMDU0YWZlNA0KICAgID4gPiByYWlz
ZS5yYWlzZSg/PykgYXQgMHhkMDEyMTAyMA0KICAgID4gPiBhYm9ydCgpIGF0IDB4ZDAxN2NhZTQN
CiAgICA+ID4gZHVtcF9jb3JlKCksIGxpbmUgMzM4IGluICJkdW1wY29yZS5jIg0KICAgID4gPiBz
bWJfcGFuaWNfczMod2h5ID0gImFzc2VydCBmYWlsZWQ6IHJlYy0+dmFsdWVfdmFsaWQiKSwgbGlu
ZSA4NTMgaW4gInV0aWwuYyINCiAgICA+ID4gc21iX3BhbmljKHdoeSA9ICJhc3NlcnQgZmFpbGVk
OiByZWMtPnZhbHVlX3ZhbGlkIiksIGxpbmUgMTc0IGluICJmYXVsdC5jIg0KICAgID4gPiBkYndy
YXBfcmVjb3JkX2dldF92YWx1ZShyZWMgPSAweDIwMTZlNWY4KSwgbGluZSA4MiBpbiAiZGJ3cmFw
LmMiDQogICAgPiA+IHJlZ2RiX3VwZ3JhZGVfdjJfdG9fdjNfZm4ocmVjID0gMHgyMDE2ZTVmOCwg
cHJpdmF0ZV9kYXRhID0gMHgyMDE2ZGUyOCksIGxpbmUgNjE3IGluICJyZWdfYmFja2VuZF9kYi5j
Ig0KICAgID4gPiB0cmF2ZXJzZV9wZXJzaXN0ZW50X2NhbGxiYWNrKHRkYiA9IDB4MjAxNmUxZjgs
IGtidWYgPSAoLi4uKSwgZGJ1ZiA9ICguLi4pLCBwcml2YXRlX2RhdGEgPSAweDJmZjIxZmQ4KSwg
bGluZSAxNTgxIGluICJkYndyYXBfY3RkYi5jIg0KICAgID4gPiB1bm5hbWVkIGJsb2NrIGluIHRk
Yl90cmF2ZXJzZV9pbnRlcm5hbCh0ZGIgPSAweDIwMTZlMWY4LCBmbiA9IDB4ZjA1NzAwNDQsIHBy
aXZhdGVfZGF0YSA9IDB4MmZmMjFmZDgsIHRsID0gMHgyZmYyMWY3MCksIGxpbmUgMjIyIGluICJ0
cmF2ZXJzZS5jIg0KICAgID4gPiB0ZGJfdHJhdmVyc2VfaW50ZXJuYWwodGRiID0gMHgyMDE2ZTFm
OCwgZm4gPSAweGYwNTcwMDQ0LCBwcml2YXRlX2RhdGEgPSAweDJmZjIxZmQ4LCB0bCA9IDB4MmZm
MjFmNzApLCBsaW5lIDIyMiBpbiAidHJhdmVyc2UuYyINCiAgICA+ID4gdGRiX3RyYXZlcnNlKHRk
YiA9IDB4MjAxNmUxZjgsIGZuID0gMHhmMDU3MDA0NCwgcHJpdmF0ZV9kYXRhID0gMHgyZmYyMWZk
OCksIGxpbmUgMjk1IGluICJ0cmF2ZXJzZS5jIg0KICAgID4gPiB1bm5hbWVkIGJsb2NrIGluIGRi
X2N0ZGJfdHJhdmVyc2UoZGIgPSAweDIwMTZkZTI4LCBmbiA9IDB4MjAwNGQxZjgsIHByaXZhdGVf
ZGF0YSA9IDB4MjAxNmRlMjgpLCBsaW5lIDE2NDcgaW4gImRid3JhcF9jdGRiLmMiDQogICAgPiA+
IGRiX2N0ZGJfdHJhdmVyc2UoZGIgPSAweDIwMTZkZTI4LCBmbiA9IDB4MjAwNGQxZjgsIHByaXZh
dGVfZGF0YSA9IDB4MjAxNmRlMjgpLCBsaW5lIDE2NDcgaW4gImRid3JhcF9jdGRiLmMiDQogICAg
PiA+IGRid3JhcF90cmF2ZXJzZShkYiA9IDB4MjAxNmRlMjgsIGYgPSAweDIwMDRkMWY4LCBwcml2
YXRlX2RhdGEgPSAweDIwMTZkZTI4LCBjb3VudCA9IChuaWwpKSwgbGluZSAzNzcgaW4gImRid3Jh
cC5jIg0KICAgID4gPiByZWdkYl91cGdyYWRlX3YyX3RvX3YzKGRiID0gMHgyMDE2ZGUyOCksIGxp
bmUgNzA2IGluICJyZWdfYmFja2VuZF9kYi5jIg0KICAgID4gPiByZWdkYl9pbml0KCksIGxpbmUg
ODI5IGluICJyZWdfYmFja2VuZF9kYi5jIg0KICAgID4gPiByZWdpc3RyeV9pbml0X2NvbW1vbigp
LCBsaW5lIDMzIGluICJyZWdfaW5pdF9iYXNpYy5jIg0KICAgID4gPiByZWdpc3RyeV9pbml0X2Z1
bGwoKSwgbGluZSA4MSBpbiAicmVnX2luaXRfZnVsbC5jIg0KICAgID4gPiBtYWluKGFyZ2MgPSAz
LCBhcmd2ID0gMHgyZmYyMjU1YyksIGxpbmUgMjAyMCBpbiAic2VydmVyLmMiDQogICAgPiANCiAg
ICA+IFRoaXMgYmFja3RyYWNlIGlzIGFuIGludGVyZXN0aW5nIG9uZS4NCiAgICANCiAgICBOZXZl
ciBtaW5kIC0gZm91bmQgaXQgOi0pLg0KICAgIA0KICAgIGRiX2N0ZGJfZmV0Y2hfbG9ja2VkX3Ry
YW5zYWN0aW9uKCkgaGFzIGFuIGVhcmx5IHJldHVybiBpZg0KICAgIHB1bGxfbmV3ZXN0X2Zyb21f
bWFyc2hhbGxfYnVmZmVyKCkgcmV0dXJucyB0cnVlLCBhbmQgd2UNCiAgICB3ZXJlbid0IHNldHRp
bmcgcmVzdWx0LT52YWx1ZV92YWxpZCA9IHRydWUgdGhlcmUuDQogICAgDQogICAgQ2FuIHlvdSB0
cnkgdGhpcyBwYXRjaCA/IEkgdGhpbmsgaXQnbGwgZml4IGl0Lg0KICAgIA0KICAgIENoZWVycywN
CiAgICANCiAgICAJSmVyZW15Lg0KICAgIA0KDQo=


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8C213D080
	for <lists+samba-technical@lfdr.de>; Thu, 16 Jan 2020 00:05:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:Date:To;
	bh=vtwnU8wykrhvyAhrjPgiPxhYcTfLSBpcxZhNKewlgFM=; b=exXMln3bpWukwnIwfCJ+xmERNh
	DPkmFHqtMhinGJoAnI7d8wLRsoU+U2gr+djUGaujlBxltBHOFqiBmqwJwdO2yvUbbnAfnEqPVg93B
	2AoZtc6FNrxrlFWa74qX6IR+bcrxHtWAhpqXYAVV59SZSC9jHQ/3B9lVDsTzPdFDgijlI0BiXOkXi
	Z2i5yBhTgcRvUbYk2B5Nb+M80olLDmhl23Vq/GM/LDOpEjTOgO1uxK1sq3d5L4L84kSQEhxibyQAH
	1VWRUihmIdoAOe7tiQ4N+562LxRZu75Usn3NCBk2onOpPBq5ksXV0yrWoGgHBfrt6+g1pPvZDfqq3
	EP6Vi8Rw==;
Received: from localhost ([::1]:63972 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1irriT-003aH1-IY; Wed, 15 Jan 2020 23:04:49 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:63446
 helo=mx0a-001b2d01.pphosted.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1irriP-003aGu-4B
 for samba-technical@lists.samba.org; Wed, 15 Jan 2020 23:04:47 +0000
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00FMvWcW193619; Wed, 15 Jan 2020 18:04:36 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xhgv65exa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jan 2020 18:04:35 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00FN2EEH012858;
 Wed, 15 Jan 2020 23:04:35 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01dal.us.ibm.com with ESMTP id 2xf758batc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jan 2020 23:04:35 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00FN4XUT39453140
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jan 2020 23:04:33 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 975A278063;
 Wed, 15 Jan 2020 23:04:33 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 728637805E;
 Wed, 15 Jan 2020 23:04:33 +0000 (GMT)
Received: from mail.gmx.ibm.com (unknown [9.209.242.120])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 15 Jan 2020 23:04:33 +0000 (GMT)
Received: from m01ex005.gmx.ibm.com (10.148.53.45) by m01ex005.gmx.ibm.com
 (10.148.53.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Wed, 15 Jan
 2020 17:04:25 -0600
Received: from m01ex005.gmx.ibm.com ([fe80::7d2d:476:2d5a:cb2f]) by
 m01ex005.gmx.ibm.com ([fe80::7d2d:476:2d5a:cb2f%9]) with mapi id
 15.01.1779.002; Wed, 15 Jan 2020 17:04:25 -0600
To: Jeremy Allison <jra@samba.org>
Thread-Topic: [EXTERNAL] Re: Re: Port knock of 445 prevents smbd from starting
Thread-Index: AQHVyyu63J+UIaWGpkSOcdYB6nlpl6fsWeoA
Date: Wed, 15 Jan 2020 23:04:25 +0000
Message-ID: <C67A52B7-5F24-49E1-B4E6-F38A25D8DF2D@ibm.com>
References: <041d851df04040098cd3576cb2b91118@ibm.com>
 <20200114215623.GE217935@jra4> <cb951458c2004bf7a39ab19f0f49916b@ibm.com>
 <20200114224050.GA28030@jra4>
In-Reply-To: <20200114224050.GA28030@jra4>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [9.16.14.32]
Content-Type: text/plain; charset="utf-8"
Content-ID: <E41345FF3C6D8E4683FF8A33C641CCD3@gmx.ibm.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re:  Re: Re: Port knock of 445 prevents smbd from starting
X-Warn: EHLO/HELO not verified: Remote host 148.163.158.5
 (mx0b-001b2d01.pphosted.com) incorrectly presented itself as
 mx0a-001b2d01.pphosted.com
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

U28sIHRoZSBpbmJvdW5kIHBhY2tldCBpcyBhIGNvbm5lY3Rpb24gYXR0ZW1wdCBieSB0aGUgTEIs
IG5vIGRhdGEgaXMgYmVpbmcgc2V0LiAgSXQgbG9va3MgbGlrZSBpdCBpcyBvbmx5IHZlcmlmeWlu
ZyB0aGF0IGl0IGNvbXBsZXRlcyB0aGUgMyB3YXkgaGFuZHNoYWtlLiAgICBGcm9tIG15IHRjcGR1
bXAgdHJhY2VzLCBJIHNlZSB0aGUgU1lOIC0+IEZJTiBhbmQgdGhlbiBpdCBlbmRzLg0KDQpJdCBy
ZXBvcnRzIGEgc3RhdHVzIG9mIE5UX1NUQVRVU19FTkRfT0ZfRklMRS4gICAgVGhlIHNtYl9sZW4g
aXMgNTQ1NiwgYXMgaXQgcmV0dXJucyBmcm9tIHJlYWRfc21iX2xlbmd0aF9yZXR1cm5fa2VlcGFs
aXZlLiAgU2VlbXMgdG8gbWUgdGhpcyBzaG91bGQgYmUgMC4gDQoNCk5vdCBzZWVpbmcgaXQgZ28g
dGhyb3VnaCByZWNlaXZlX3NtYl9yYXdfdGFsbG9jX3BhcnRpYWxfcmVhZCgpIG9yIHJlYWRfcGFj
a2V0X3JlbWFpbmRlcigpLiAgIFdvbmRlcmluZyB3aGV0aGVyIHRoaXMgaXMgYW5vdGhlciBpbnN0
YW5jZSBvZiBpdCByZWVudHJhbnQgY2FsbCBsb3NpbmcgdHJhY2sgb2YgdGhlIG1lc3NhZ2VzLCAg
aW4gdGhlIHF1ZXVlPyAgQUlYIHVzZXMgYSBsb3QgbW9yZSB0aGluZ3MgZnJvbSB0aGUgcmVwbGFj
ZSBsaWJyYXJpZXMgdGhhbiBMaW51eC4NCg0KSSBjYW4gcmVjcmVhdGUgdGhpcyBlYXNpbHkgZG9p
bmcgYSAic21iZCAtZDEwIC1JIi4gICAgQnV0LCBub3Qgc2VlaW5nIHRoZSBzYW1lIHRoaW5nIGlu
IGxvZy5zbWJkIGlmIEkgcnVuIGl0ICJzbWJkIC1EIiB0b2RheS4gICAgQ291bGQgaGF2ZSBzd29y
biBib3RoIGludm9jYXRpb25zIHdlcmUgZmFpbGluZyB0aGUgc2FtZSB3YXksIHllc3RlcmRheS4N
Cg0KSSdsbCBiZSBsb29raW5nIGF0IGl0IHNvbWUgbW9yZSBsYXRlciB0b25pZ2h0LiAgDQpBcmUg
cGVvcGxlIHN0aWxsIHVzaW5nIHRoZSBJUkMgY2hhbm5lbD8NCg0KLS0NCkNocmlzDQoNCg0KDQrv
u79PbiAxLzE0LzIwLCA0OjQxIFBNLCAiSmVyZW15IEFsbGlzb24iIDxqcmFAc2FtYmEub3JnPiB3
cm90ZToNCg0KICAgIE9uIFR1ZSwgSmFuIDE0LCAyMDIwIGF0IDEwOjEzOjI4UE0gKzAwMDAsIENo
cmlzdG9waGVyIE8gQ293YW4gLSBDaHJpc3RvcGhlci5PLkNvd2FuQGlibS5jb20gd3JvdGU6DQog
ICAgPiBTb3JyeSwgdGhhdCdzIG15IGNvbW1pdCBvZiBBbWl0YXkncyBwYXRjaC4NCiAgICA+IA0K
ICAgID4gSGVyZSdzIHRoZSBjb21waWxlIEkgZGlkOg0KICAgID4gU28gaXQgc2hvdWxkIHNheSBk
ZTc2ODcxMGUxNg0KICAgIA0KICAgIFllYWgsIEkgdGhpbmsgeW91IG5lZWQgdG8gYWRkIG1vcmUg
ZGVidWdzIHRvIGZpbmQgb3V0IHRoZQ0KICAgIGV4YWN0IGxlbmd0aCBiZWluZyByZXR1cm5lZCBi
eSByZWFkX3NtYl9sZW5ndGhfcmV0dXJuX2tlZXBhbGl2ZSgpDQogICAgYW5kIHdoYXQgdGltZW91
dCBpcyBiZWluZyB1c2VkIGluIHJlY2VpdmVfc21iX3Jhd190YWxsb2NfcGFydGlhbF9yZWFkKCkN
CiAgICBvciByZWFkX3BhY2tldF9yZW1haW5kZXIoKSB0byBkZWJ1ZyB0aGlzIHByb3Blcmx5Lg0K
ICAgIA0KDQo=


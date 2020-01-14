Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 712E013B519
	for <lists+samba-technical@lfdr.de>; Tue, 14 Jan 2020 23:09:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:Date:To;
	bh=vHtKVXyRtaN+98G3nJNN1VkCyqyRVM9tDyfNAqyXIrI=; b=RwUuZRSvL7LuoH1UVDXqpOkimP
	75iCiKNr8NIb5D0VDMbQuB/M2K/BadstnzfHlX6q20FDiVFujn29ncn/6DGr79y1BFdBpAzk98bOJ
	orr0uBDyaNVu83wrEFLW54QASPJw6Jr0QgqYK4NZotKoeh57STjs7MhkW5ZhGgdRkrTgZ2ii419Y4
	ND/nLSxeAgFfSm3frKLbvSL6Po7ifdd/nUD648NVE94z7k2mH+anOS2h6RNtk2GEk4mH1IPxz5AOu
	injmPfYk9kw/hoWJb/crY6X9bU9QXPvanp60x7XZWGw5zCdKKJ/HU9GD8qgjNedkMrKIrK/2W7iCv
	d7rMYv6A==;
Received: from localhost ([::1]:21770 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1irUMj-003SHc-Ll; Tue, 14 Jan 2020 22:08:49 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:4654
 helo=mx0a-001b2d01.pphosted.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1irUMe-003SHV-Nf
 for samba-technical@lists.samba.org; Tue, 14 Jan 2020 22:08:47 +0000
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00EM8CD2152757; Tue, 14 Jan 2020 17:08:36 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xhgv4u9pp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jan 2020 17:08:35 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00EM5HGl013768;
 Tue, 14 Jan 2020 22:08:35 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02wdc.us.ibm.com with ESMTP id 2xf750gbvm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jan 2020 22:08:35 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00EM8Yv354788488
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jan 2020 22:08:35 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E47B7AC084;
 Tue, 14 Jan 2020 22:08:34 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D4380AC082;
 Tue, 14 Jan 2020 22:08:34 +0000 (GMT)
Received: from mail.gmx.ibm.com (unknown [9.209.242.114])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 14 Jan 2020 22:08:34 +0000 (GMT)
Received: from m01ex005.gmx.ibm.com (10.148.53.45) by m01ex002.gmx.ibm.com
 (10.148.53.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Tue, 14 Jan
 2020 17:08:27 -0500
Received: from m01ex005.gmx.ibm.com ([fe80::7d2d:476:2d5a:cb2f]) by
 m01ex005.gmx.ibm.com ([fe80::7d2d:476:2d5a:cb2f%9]) with mapi id
 15.01.1779.002; Tue, 14 Jan 2020 16:08:27 -0600
To: Jeremy Allison <jra@samba.org>
Thread-Topic: [EXTERNAL] Re: Port knock of 445 prevents smbd from starting
Thread-Index: AQHVyx9AitqUBvVdV0i8bf/gHBfTHafrGUKA//+eyQA=
Date: Tue, 14 Jan 2020 22:08:27 +0000
Message-ID: <4BB9B865-B819-418C-B3AB-1F7EDEB7CF49@ibm.com>
References: <041d851df04040098cd3576cb2b91118@ibm.com>
 <20200114215623.GE217935@jra4>
In-Reply-To: <20200114215623.GE217935@jra4>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [9.16.14.36]
Content-Type: text/plain; charset="utf-8"
Content-ID: <6FF1599CCA5A3043891346ADFBC4A0A3@gmx.ibm.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re:  Re: Port knock of 445 prevents smbd from starting
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

U21iZCAtViBzYXlzDQpWZXJzaW9uIDQuMTIuMHByZTEtR0lULTM3NWVlMmQ4ZmVlDQoNCkkgZGlk
IGEgZmV0Y2ggdGhpcyBtb3JuaW5nLiAgICAgSSBoYXZlIG9uZSBwYXRjaCBmcm9tIEFtaXRheSBi
dXQgdGhhdCdzIGZvciBjdGRiX3JlY292ZXJ5X2hlbHBlci4NCldoaWNoIG1lc3NhZ2VzPw0KDQoN
Cu+7v09uIDEvMTQvMjAsIDM6NTYgUE0sICJKZXJlbXkgQWxsaXNvbiIgPGpyYUBzYW1iYS5vcmc+
IHdyb3RlOg0KDQogICAgT24gVHVlLCBKYW4gMTQsIDIwMjAgYXQgMDk6MjY6MjRQTSArMDAwMCwg
Q2hyaXN0b3BoZXIgTyBDb3dhbiAtIENocmlzdG9waGVyLk8uQ293YW4tLS0gdmlhIHNhbWJhLXRl
Y2huaWNhbCB3cm90ZToNCiAgICA+IEluIG91ciBjbHVzdGVyIHNldHVwIGhlcmUsIHdlIHVzZSBh
IGxvYWQtYmFsYW5jZXIgaW4gZnJvbnQgb2Ygb3VyIGN0ZGIgY2x1c3RlciB0byBzdGVlciB0aGUg
U01CIHRyYWZmaWMuDQogICAgPiBXZSd2ZSBiZWVuIGRvaW5nIHRoaXMgZm9yIHllYXJzLiAgICBJ
dCBkb2VzIGEgc2ltcGxlIFRDUCBjb25uZWN0IG9uIDQ0NSB0byB2ZXJpZnkgdGhhdCBlYWNoIG5v
ZGUncyBzbWJkIGlzIHN0aWxsIGFsaXZlLg0KICAgID4gDQogICAgPiBUaGlzIGlzIGFsbCBvbiBB
SVgsIGFuZCBzb21lIHRpbWUsIGluIHRoZSBwYXN0IGZldyB3ZWVrcyB0aGVzZSBrbm9ja3Mgc3Rh
cnRlZCBjYXVzaW5nIHNtYmQgdG8gZXhpdC4gICBIZXJlJ3MgdGhlIG91dHB1dCBmcm9tIGFuIHNt
YmQgLWkgLWQxMC4NCiAgICA+IA0KICAgID4gRmlyc3QgSSBzZWUgdGhpcyAoeC55LnouMjE5IGlz
IHRoZSBhZGRyZXNzIG9mIHRoZSBMQi4gIDIwMiBpcyB0aGUgc2VydmVyKS4gICAgSSBjaGFuZ2Vk
IHRoZSBhZGRyZXNzZXMNCiAgICA+IA0KICAgID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCiAg
ICA+IA0KICAgID4gQWxsb3dlZCBjb25uZWN0aW9uIGZyb20geC55LnouMjE5ICh4Lnkuei4yMTkp
DQogICAgPiBDb25uZWN0aW9uIGFsbG93ZWQgZnJvbSBpcHY0OngueS56LjIxOTo0OTQ2MyB0byBp
cHY0OngueS56LjIwMjo0NDUNCiAgICA+IGN0ZGJkX2NvbnRyb2w6IFNlbmRpbmcgY3RkYiBwYWNr
ZXQgcmVxaWQ9Nywgdm5uPTQwMjY1MzE4NDEsIG9wY29kZT0yMywgc3J2aWQ9MTc1MDk5OTUzNTEy
MTY0ODg0NDgNCiAgICA+IGN0ZGJkX2NvbnRyb2w6IFNlbmRpbmcgY3RkYiBwYWNrZXQgcmVxaWQ9
OCwgdm5uPTQwMjY1MzE4NDEsIG9wY29kZT00NCwgc3J2aWQ9MA0KICAgID4gSU5GTzogQ3VycmVu
dCBkZWJ1ZyBsZXZlbHM6DQogICAgPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KICAgID4gVGhl
biBhZnRlciB0aGUgZGVidWcgc2V0dGluZ3MsIEkgc2VlOg0KICAgID4gLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0NCiAgICA+IGluaXRfb3Bsb2NrczogaW5pdGlhbGl6aW5nIG1lc3NhZ2VzLg0KICAg
ID4gUmVnaXN0ZXJpbmcgbWVzc2FnaW5nIHBvaW50ZXIgZm9yIHR5cGUgNzc0IC0gcHJpdmF0ZV9k
YXRhPTIwMTQxYzQ4DQogICAgPiBSZWdpc3RlcmluZyBtZXNzYWdpbmcgcG9pbnRlciBmb3IgdHlw
ZSA3NzggLSBwcml2YXRlX2RhdGE9MjAxNDFjNDgNCiAgICA+IFJlZ2lzdGVyaW5nIG1lc3NhZ2lu
ZyBwb2ludGVyIGZvciB0eXBlIDc3MCAtIHByaXZhdGVfZGF0YT0yMDE0MWM0OA0KICAgID4gUmVn
aXN0ZXJpbmcgbWVzc2FnaW5nIHBvaW50ZXIgZm9yIHR5cGUgNzg3IC0gcHJpdmF0ZV9kYXRhPTIw
MTQxYzQ4DQogICAgPiBSZWdpc3RlcmluZyBtZXNzYWdpbmcgcG9pbnRlciBmb3IgdHlwZSA3Nzkg
LSBwcml2YXRlX2RhdGE9MjAxNDFjNDgNCiAgICA+IFJlZ2lzdGVyaW5nIG1lc3NhZ2luZyBwb2lu
dGVyIGZvciB0eXBlIDE1IC0gcHJpdmF0ZV9kYXRhPTANCiAgICA+IE92ZXJyaWRpbmcgbWVzc2Fn
aW5nIHBvaW50ZXIgZm9yIHR5cGUgMTUgLSBwcml2YXRlX2RhdGE9MA0KICAgID4gRGVyZWdpc3Rl
cmluZyBtZXNzYWdpbmcgcG9pbnRlciBmb3IgdHlwZSAxNiAtIHByaXZhdGVfZGF0YT0wDQogICAg
PiBSZWdpc3RlcmluZyBtZXNzYWdpbmcgcG9pbnRlciBmb3IgdHlwZSAxNiAtIHByaXZhdGVfZGF0
YT0yMDE0MWM0OA0KICAgID4gRGVyZWdpc3RlcmluZyBtZXNzYWdpbmcgcG9pbnRlciBmb3IgdHlw
ZSAzMyAtIHByaXZhdGVfZGF0YT0yMDExY2YxOA0KICAgID4gUmVnaXN0ZXJpbmcgbWVzc2FnaW5n
IHBvaW50ZXIgZm9yIHR5cGUgMzMgLSBwcml2YXRlX2RhdGE9MjAxNDFjNDgNCiAgICA+IERlcmVn
aXN0ZXJpbmcgbWVzc2FnaW5nIHBvaW50ZXIgZm9yIHR5cGUgNzkwIC0gcHJpdmF0ZV9kYXRhPTAN
CiAgICA+IFJlZ2lzdGVyaW5nIG1lc3NhZ2luZyBwb2ludGVyIGZvciB0eXBlIDc5MCAtIHByaXZh
dGVfZGF0YT0yMDE0MWM0OA0KICAgID4gRGVyZWdpc3RlcmluZyBtZXNzYWdpbmcgcG9pbnRlciBm
b3IgdHlwZSA3OTEgLSBwcml2YXRlX2RhdGE9MA0KICAgID4gRGVyZWdpc3RlcmluZyBtZXNzYWdp
bmcgcG9pbnRlciBmb3IgdHlwZSAxIC0gcHJpdmF0ZV9kYXRhPTANCiAgICA+IFJlZ2lzdGVyaW5n
IG1lc3NhZ2luZyBwb2ludGVyIGZvciB0eXBlIDEgLSBwcml2YXRlX2RhdGE9MA0KICAgID4gZXZl
bnRfYWRkX2lkbGU6IGlkbGVfZXZ0KGtlZXBhbGl2ZSkgMjAyMDM1MzgNCiAgICA+IGV2ZW50X2Fk
ZF9pZGxlOiBpZGxlX2V2dChkZWFkdGltZSkgMjAyMDQwYjgNCiAgICA+IGV2ZW50X2FkZF9pZGxl
OiBpZGxlX2V2dChob3VzZWtlZXBpbmcpIDIwMjA0MWM4DQogICAgPiByZWFkX2ZkX3dpdGhfdGlt
ZW91dDogYmxvY2tpbmcgcmVhZC4gRU9GIGZyb20gY2xpZW50Lg0KICAgID4gcmVjZWl2ZV9zbWJf
cmF3X3RhbGxvYyBmYWlsZWQgZm9yIGNsaWVudCBpcHY0OngueS56LjIxOTo0OTQ2MyByZWFkIGVy
cm9yID0gTlRfU1RBVFVTX0VORF9PRl9GSUxFLg0KICAgIA0KICAgIFdoYXQgdmVyc2lvbiBvZiBT
YW1iYS4gVGhlc2UgZGVidWcgbWVzc2FnZXMgZG9uJ3QNCiAgICBxdWl0ZSBtYXRjaCBjdXJyZW50
IG1hc3RlciBjb2RlLg0KICAgIA0KDQo=


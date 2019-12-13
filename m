Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 985DD11E690
	for <lists+samba-technical@lfdr.de>; Fri, 13 Dec 2019 16:30:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:Date:To;
	bh=Gl48CT1bWTg0veer/enzprpihWRutMvOc9/+EUpRxcA=; b=a4vUH2xuzyjp0jJpeQBUvd+lVy
	MHDCllP0pdeD8/PPy2ac50e92foCS7lYxQUv26djR8R5NUD+lUn8ELayxE8CArhFwYuOjCdkRxF3F
	txBjCMf8l53ZZUqf85h6uF+v5vV80QFgHrqloGcKTgzbmT9fxO1o0DHHJ2J6HQRr2bMxd6TAOgpVn
	d5TXElM3ioVQg+SGBd+wx9WANmzrpSbLhZ6hWipGK6qGNQ3qEHwi9hPXugFxlUtTunhVnfvaYyg1N
	ysf+drSunIJuxskXZIxfoxfJ7OPmqbd00qEPIINWmL/ONpXJfjl3JCUR8ZzVr0WUxZEs0C4aX7dBk
	0waG4+VA==;
Received: from localhost ([::1]:26860 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ifmsP-007DSX-Qk; Fri, 13 Dec 2019 15:29:09 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:33636) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1ifmsK-007DSQ-3Q
 for samba-technical@lists.samba.org; Fri, 13 Dec 2019 15:29:07 +0000
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBDFSroD085786; Fri, 13 Dec 2019 10:28:59 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wuhsduy4m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2019 10:28:55 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBDFRWUm010907;
 Fri, 13 Dec 2019 15:27:53 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04wdc.us.ibm.com with ESMTP id 2wuqrbs9ve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2019 15:27:53 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBDFRrtR37814758
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Dec 2019 15:27:53 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 539D6B206A;
 Fri, 13 Dec 2019 15:27:53 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D26CB2068;
 Fri, 13 Dec 2019 15:27:53 +0000 (GMT)
Received: from mail.gmx.ibm.com (unknown [9.209.242.120])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 13 Dec 2019 15:27:53 +0000 (GMT)
Received: from m01ex005.gmx.ibm.com (10.148.53.45) by m01ex005.gmx.ibm.com
 (10.148.53.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Fri, 13 Dec
 2019 09:27:52 -0600
Received: from m01ex005.gmx.ibm.com ([fe80::7d2d:476:2d5a:cb2f]) by
 m01ex005.gmx.ibm.com ([fe80::7d2d:476:2d5a:cb2f%9]) with mapi id
 15.01.1779.002; Fri, 13 Dec 2019 09:27:52 -0600
To: Andrew Bartlett <abartlet@samba.org>, Jeremy Allison <jra@samba.org>
Thread-Topic: [EXTERNAL] Re: Parse::Yapp::Driver on platforms other than Linux
Thread-Index: AQHVsQ4oNxMvyZtrCEO1mpNIpdPbYKe3bSUAgAAeQACAAKZCgA==
Date: Fri, 13 Dec 2019 15:27:52 +0000
Message-ID: <0265138D-48A2-4188-8B02-7D90551219B5@ibm.com>
References: <9ff45788c1634239b78dea68d22e4fad@ibm.com>
 <20191212214432.GC228793@jra4>
 <7b03dac06c57cb6c0954861964c9d98a014888ac.camel@samba.org>
In-Reply-To: <7b03dac06c57cb6c0954861964c9d98a014888ac.camel@samba.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [9.16.14.36]
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C84B128FC63A34BB32A9CE799FF102D@gmx.ibm.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re:  Re: Parse::Yapp::Driver on platforms other than Linux
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

SSBzaG91bGQgcHJvYmFibHkgbWVudGlvbiB0aGF0IEkgbmVlZGVkIHRvIHBvcnQgamFuc3NvbiBh
bmQgY21vY2thIHRvIEFJWC4gICAoQWxzbyBuZWVkZWQgIGEgY3VycmVudCBjbWFrZSBpbiBvcmRl
ciB0byBidWlsZCBjbW9ja2EpLiAgICBJIGJlbGlldmUgeW91IGNhbiBkaXNhYmxlIHRoZSBmb3Jt
ZXIgdXNpbmcgLS13aXRob3V0LWpzb24sIGJ1dCBJIHNlZSBubyBtZW50aW9uIG9mIGNtb2NrYSBp
biB5b3VyIGRlcGVuZGVuY3kgbGlzdC4gICAgSSBoYXZlbid0IGNoZWNrIGxhdGVseSB0byBzZWUg
d2hlbiBhbmQgd2hlcmUgaXQncyByZXF1aXJlZC4gICBJcyBpdCBvbmx5IGRldmVsb3BlciBtb2Rl
PyAgIA0KDQrvu79PbiAxMi8xMi8xOSwgNTozMyBQTSwgIkFuZHJldyBCYXJ0bGV0dCIgPGFiYXJ0
bGV0QHNhbWJhLm9yZz4gd3JvdGU6DQoNCiAgICBPbiBUaHUsIDIwMTktMTItMTIgYXQgMTM6NDQg
LTA4MDAsIEplcmVteSBBbGxpc29uIHZpYSBzYW1iYS10ZWNobmljYWwNCiAgICB3cm90ZToNCiAg
ICA+IE9uIFRodSwgRGVjIDEyLCAyMDE5IGF0IDA2OjQzOjI0UE0gKzAwMDAsIENocmlzdG9waGVy
IE8gQ293YW4gLQ0KICAgID4gQ2hyaXN0b3BoZXIuTy5Db3dhbi0tLSB2aWEgc2FtYmEtdGVjaG5p
Y2FsIHdyb3RlOg0KICAgID4gPiANCiAgICA+ID4gRWFzeSBlbm91Z2ggdG8gZml4IHdpdGggYSBj
cGFuIGluc3RhbGwuICAgT24gQUlYIHRoaXMgaXMgbm90IGENCiAgICA+ID4gZGVmYXVsdCB3aXRo
IHRoZSBmcmVld2FyZSBwZXJsIG9mZmVyaW5nLiAgSSBkbyBoYXZlIHRvIHdvbmRlcg0KICAgID4g
PiB3aGV0aGVyIHRoaXMgbW9kdWxlIGlzIGluIHRoZSBiYXNlIHBhY2thZ2VzIG9mIG90aGVyIExp
bnV4DQogICAgPiA+IGRpc3Ryb3M/ICAgSSB1c2UgUkhFTCBhdCB3b3JrLCBidXQgSSdtIG5vdCBn
b2luZyB0byBjaGVjayBvdGhlcg0KICAgID4gPiBkaXN0cm9zLCBvYnZpb3VzbHkuDQogICAgPiAN
CiAgICA+IE9uIHVidW50dSBpdCdzIGluIGxpYnBhcnNlLXlhcHAtcGVybC4gSSBoYWQNCiAgICA+
IHRvIHNjcmFtYmxlIHRvIGZpbmQgaXQgYWxzbyBhZnRlciB0aGlzIGNvbW1pdCA6LSkuDQogICAg
DQogICAgV2Uga25vdyBpdCBjYW4gYmUgZm91bmQgb24gbWFqb3IgTGludXggZGlzdHJpYnV0aW9u
cyBiZWNhdXNlIHdlIHRlc3QNCiAgICB3aXRoIHRoZSBiaWcgNCBkdXJpbmcgZXZlcnkgQ0kgcnVu
LiAgVGhhdCBpcyB3ZXJlIHdlIGdlbmVyYXRlIHRoZXNlDQogICAgcGFja2FnZSBsaXN0cyBmcm9t
Og0KICAgIA0KICAgIGh0dHBzOi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91cmw/dT1o
dHRwcy0zQV9fd2lraS5zYW1iYS5vcmdfaW5kZXgucGhwX1BhY2thZ2UtNUZEZXBlbmRlbmNpZXMt
NUZSZXF1aXJlZC01RnRvLTVGQnVpbGQtNUZTYW1iYS0yM1ZlcmlmaWVkLTVGUGFja2FnZS01RkRl
cGVuZGVuY2llcyZkPUR3SUNhUSZjPWpmX2lhU0h2Sk9iVGJ4LXNpQTFaT2cmcj1uNjVJQkhzYmUy
R2NpZHAyaUpFY1JJT3hsUHkwYmxaNDQ4X3pNLVBnb2tzJm09M2dMZkh1bjh0T0U3UEFVQWFXT3ll
dFpSdHByRldsM21oRi0yM2ltcWFnNCZzPVlJWkpvR21xZ2ZnQzljYVZOU3B3NWV6NjJWa1pHYkdz
a0t5Q2wwZTQwR28mZT0NCiAgICANCiAgICBBbmRyZXcgQmFydGxldHQNCiAgICANCiAgICANCg0K


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CF04F15F1
	for <lists+samba-technical@lfdr.de>; Mon,  4 Apr 2022 15:31:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=uO4RiepsigxpwRwu8Im/XFHDQOTaEZeLON+GhqQvcts=; b=NW9U9doehtjl8NQqAByJ2O8Ol3
	lhQ0tiWt+82pUZ8/V/iub0L6BpE3lP0GiAANjTe+CdhlgjyTZHyib+CyFkTbt5mpoQYmIrExb0AVc
	moKkF6j4EH5/Dyr9opvVdURI3IO0bYHpnLCpCpzdbCRuFrZ1VM4H8qJAIRtgmN40ienBvWU3Ermm0
	g7HE7TJd9IK2Y9FN3Z0nGrABo8OBsAicuzhrs6Fmc1xjoYaS8DM5+z3gwvvjxmmzAKXRhdKtkajlB
	0PYZ3RP677z1EfPRI+ycpce1X6w7aNHDLTfvu9VfFn7D1FOCyV1TeKfaltIctUqp7pkKCPn5MfiHX
	8QEOENeg==;
Received: from ip6-localhost ([::1]:41010 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nbMnu-009puQ-Hr; Mon, 04 Apr 2022 13:31:34 +0000
Received: from goe4.ct.mbox.net ([165.212.182.33]:44840) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1nbMno-009pu7-OT
 for samba-technical@lists.samba.org; Mon, 04 Apr 2022 13:31:32 +0000
Received: from goe4.ct.mbox.net (localhost [127.0.0.1])
 by goe4.ct.mbox.net (Postfix) with ESMTP id 4KXBGR00qvzflMHw
 for <samba-technical@lists.samba.org>; Mon,  4 Apr 2022 13:20:15 +0000 (UTC)
X-USANET-Received: from goe4.ct.mbox.net [127.0.0.1] by goe4.ct.mbox.net via
 mtad (C8.MAIN.4.26U) 
 with ESMTP id 048ADDNuk0752Me4; Mon, 04 Apr 2022 13:20:10 -0000
X-USANET-Routed: 5 gwsout-gwsd Q:gwsd
X-USANET-Routed: 3 gwsout-vs Q:cmvirus
X-USANET-GWS2-Service: gwsdout-encrypt True
X-USANET-GWS2-Service: gwsdout-soceng True
X-USANET-GWS2-Service: gwsdout-soceng-activated True
X-USANET-GWS2-Service: gwsdout-soceng-thresholds 33:67
X-USANET-GWS2-Tenant: snia.org
X-USANET-GWS2-Tagid: Q4WF
X-USANET-GWS2-Security: TLSv1.2;ECDHE-RSA-AES256-SHA384
Received: from S1P7MBX1G.EXCHPROD.USA.NET [165.212.81.254] by goe4.ct.mbox.net
 via smtad (C8.MAIN.4.30X) 
 with ESMTPS id XID757ADDNuk4906Xe4 (using TLSv1.2 with cipher
 ECDHE-RSA-AES256-SHA384); Mon, 04 Apr 2022 13:20:10 -0000
X-USANET-Source: 165.212.81.254 OUT arnold.jones@snia.org
 S1P7MBX1G.EXCHPROD.USA.NET TLS
X-USANET-MsgId: XID757ADDNuk4906Xe4
Received: from S1P7MBX1A.EXCHPROD.USA.NET (10.7.221.11) by
 S1P7MBX1G.EXCHPROD.USA.NET (10.7.221.17) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Mon, 4 Apr 2022 13:20:09 +0000
Received: from S1P7MBX1A.EXCHPROD.USA.NET ([10.7.221.11]) by
 S1P7MBX1A.EXCHPROD.USA.NET ([10.7.221.11]) with mapi id 15.00.1497.033; Mon,
 4 Apr 2022 13:20:09 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: UPDATE: SMB3 IO Lab June 14-16 - Virtual Event
Thread-Topic: SMB3 IO Lab June 14-16 - Virtual Event
Thread-Index: AQHYSCa1ZNO/qtfaw0C3MhJi8EaSYA==
Date: Mon, 4 Apr 2022 13:20:09 +0000
Message-ID: <39F25B6A-3BB0-4925-8181-4D0DF3A1544D@snia.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.59.22031300
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [67.8.68.194]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
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
From: "Jones, Arnold via samba-technical" <samba-technical@lists.samba.org>
Reply-To: "Jones, Arnold" <arnold.jones@snia.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

SGkgU2FtYmEgRGV2ZWxvcGVycywNCg0KUHJlc2VudGF0aW9ucyBhcmUgb25seSBwYXJ0IG9mIHdo
YXQgaXMgZ29pbmcgb24gYXQgdGhlIDIwMjIgU0RDIEVNRUEgU3RvcmFnZSBEZXZlbG9wZXIgQ29u
ZmVyZW5jZTxodHRwczovL3d3dy5zbmlhLm9yZy9ldmVudHMvc2RjZW1lYT4gdmlydHVhbCBldmVu
dCwgSnVuZTE0dGgsIG1vdmVkIGZyb20gaXRzIG9yaWdpbmFsIGRhdGUgaW4gQXByaWwuIFRoZSBT
TklBIFNNQjMgSW50ZXJvcGVyYWJpbGl0eSAoSU8pIExhYiBpcyBhbHNvIGFuIGludGVncmFsIHBh
cnQgb2YgdGhlIHByb2dyYW0uIFRoZSAyMDIyIFNOSUEgU0RDIEVNRUEgU01CMyBJTyBMYWI8aHR0
cHM6Ly93d3cuc25pYS5vcmcvZXZlbnRzL3NkYy1lbWVhL3NtYjMtaW50ZXJvcGVyYWJpbGl0eS1s
YWI+IHdpbGwgYmUgaGVsZCBvbmxpbmUgdXNpbmcgYSB2aXJ0dWFsIHByaXZhdGUgbmV0d29yaywg
Y3JlYXRpbmcgYSBjb2xsYWJvcmF0aXZlIGZyYW1ld29yayBmb3IgdGVzdGluZy4gIFRoZSBsYWIg
d2lsbCB0YWtlIHBsYWNlIEp1bmUgMTR0aC0xNnRoLHdpdGggYW4gYWRkaXRpb25hbCB3ZWVrIG9m
IGV4dGVuZGVkIGFjY2VzcyB0aW1lIHRvIHRoZSB2aXJ0dWFsIHRlc3RpbmcgZnJhbWV3b3JrIHRo
cm91Z2ggSnVuZSAyMm5kLiBUaGUgb25saW5lIGxhYiBlbnZpcm9ubWVudCB3aWxsIGJlIGF2YWls
YWJsZSAyNCBob3VycyBlYWNoIGRheSwgbWFraW5nIGl0IGVhc3kgZm9yIGV2ZXJ5b25lIHRvIGFj
Y2Vzcy4NCg0KVGhlIHB1cnBvc2Ugb2YgdGhpcyBJTyBMYWIgaXMgZm9yIHZlbmRvcnMgdG8gYnJp
bmcgdGhlaXIgaW1wbGVtZW50YXRpb25zIG9mIFNNQjMgdG8gdGVzdCwgaWRlbnRpZnksIGFuZCBm
aXggYnVncyBpbiBhIGNvbGxhYm9yYXRpdmUgc2V0dGluZyB3aXRoIHRoZSBnb2FsIG9mIHByb3Zp
ZGluZyBhIGZvcnVtIGluIHdoaWNoIGNvbXBhbmllcyBjYW4gZGV2ZWxvcCBpbnRlcm9wZXJhYmxl
IHByb2R1Y3RzLiBUaGVyZSBhcmUgc2V2ZXJhbCBuZXcgZmVhdHVyZXMgdGhhdCBoYXZlIHJlY2Vu
dGx5IGJlZW4gYWRkZWQgdG8gdGhlIFNNQjMgcHJvdG9jb2w6DQoNCiAgKiAgIFNNQjMgbm93IGNh
biBjb21tdW5pY2F0ZSBvdmVyIFFVSUMsIGEgbmV3IGludGVybmV0IHN0YW5kYXJkIHRyYW5zcG9y
dCB3aGljaCBpcyBiZWluZyBicm9hZGx5IGFkb3B0ZWQgZm9yIHdlYiBhbmQgb3RoZXIgYXBwbGlj
YXRpb24gYWNjZXNzLg0KICAqICAgU3VwcG9ydCBmb3IgQUVTLUdNQUMgYXV0aGVudGljYXRpb24N
CiAgKiAgIFN1cHBvcnQgZm9yIHNoYXJlIGNvbXByZXNzaW9uDQogICogICBTdXBwb3J0IGZvciBl
bmNyeXB0aW9uIG92ZXIgUkRNQQ0KICAqICAgUm9hZG1hcCBmb3Igc2VjdXJpdHktcmVsYXRlZCBT
TUIgY2hhbmdlcyBmb3IgV2luZG93cw0KDQpUaGUgSU8gTGFiIGlzIGFuIG9wcG9ydHVuaXR5IHRv
IGxlYXJuIGFib3V0IHRoZXNlIG5ldyBmZWF0dXJlcyBhbmQgdGVzdCB5b3VyIGltcGxlbWVudGF0
aW9uIHdpdGggTWljcm9zb2Z0IFdpbmRvd3MgcHJvdG9jb2wgdGVzdCBzdWl0ZXMuICBEdXJpbmcg
dGhlIElPIExhYiB5b3UgaGF2ZSB0aGUgb3Bwb3J0dW5pdHkgdG8gZGlyZWN0bHkgZW5nYWdlIHdp
dGggV2luZG93cyBQcm90b2NvbCBTdXBwb3J0LCBUZXN0IFN1aXRlIERldmVsb3BtZW50LCBhbmQg
bWVtYmVycyBvZiB0aGUgV2luZG93cyBkZXZlbG9wbWVudCB0ZWFtIGFzIHdlbGwgYXMgbmV0d29y
ayB3aXRoIG90aGVyIHByb2Zlc3Npb25hbHMgZnJvbSBhbGwgb3ZlciB0aGUgd29ybGQuDQoNCklm
IHlvdSBhcmUgcmVsdWN0YW50IHRvIHBhcnRpY2lwYXRlIGJlY2F1c2UgeW91IGZlZWwgdGhhdCB5
b3VyIFNNQjMgaW1wbGVtZW50YXRpb24gaXMgIm5vdCByZWFkeSIsIHlvdSBzaG91bGQgc3RpbGwg
cGFydGljaXBhdGUhIFRoZSBTTUIzIElPIExhYiBpcyBhbHNvIGEgZGV2ZWxvcG1lbnQgb3Bwb3J0
dW5pdHksIG5vdCBqdXN0IGEgdGVzdGluZyBvcHBvcnR1bml0eS4gSW1wbGVtZW50YXRpb25zIHN0
aWxsIGluIGRldmVsb3BtZW50IGFyZSBlbmNvdXJhZ2VkIHRvIHBhcnRpY2lwYXRlLiAgSXQncyBh
IGdyZWF0IG9wcG9ydHVuaXR5IHRvIGdldCBoZWxwIGFuZCBsZWFybiBmcm9tIHRoZSBleHBlcnRz
IQ0KDQpUaGlzIHllYXIgd2UgYXJlIHBsZWFzZWQgdG8gYW5ub3VuY2UgdGhlIGZ1bGwgcGFydGlj
aXBhdGlvbiBhbmQgY29udGludWVkIHN1cHBvcnQgb2YgTWljcm9zb2Z0LCBvdXIgMjAyMiBTTklB
IFNEQyBFTUVBIFNNQjMgSU8gTGFiIHVuZGVyd3JpdGVyLg0KDQpGb3IgY29tcGxldGUgZGV0YWls
cyBvbiBob3cgdG8gcGFydGljaXBhdGUgcGxlYXNlIHNlZToNCmh0dHA6Ly93d3cuc25pYS5vcmcv
U0RDRU1FQWxhYnMNCg0KSWYgeW91IGhhdmUgYW55IGFkZGl0aW9uYWwgcXVlc3Rpb25zLCBwbGVh
c2UgY29udGFjdCBtZSBhdCA0MDctNTc0LTcyNzMgb3IgYXJub2xkQHNuaWEub3JnLjxtYWlsdG86
YXJub2xkQHNuaWEub3JnP3N1YmplY3Q9UVVFU1RJT046JTIwU0RDJTIwRU1FQSUyMElPJTIwTGFi
Pg0KSSBsb29rIGZvcndhcmQgdG8geW91ciBwYXJ0aWNpcGF0aW9uIGluIHRoZSBWaXJ0dWFsIFNE
QyBFTUVBIFNNQjMgSU8gTGFiIHRoaXMgeWVhciENCi0tICBBcm5vbGQNCg0KQXJub2xkIEpvbmVz
DQpUZWNobmljYWwgQ291bmNpbCBNYW5hZ2luZyBEaXJlY3Rvcg0KU3RvcmFnZSBOZXR3b3JraW5n
IEluZHVzdHJ5IEFzc29jaWF0aW9uDQpQaG9uZTogNDA3LjU3NC43MjczICBNb2JpbGU6IDQwNy40
MzUuMTA2Nw0KYXJub2xkLmpvbmVzQHNuaWEub3JnPG1haWx0bzphcm5vbGQuam9uZXNAc25pYS5v
cmc+DQoNCg0K

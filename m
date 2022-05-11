Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DEB523A7E
	for <lists+samba-technical@lfdr.de>; Wed, 11 May 2022 18:41:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=Gxu07R3HdeoC6aTOZv5xKpNB+iJCRNTDpBwhBbHk04c=; b=3p8pgTdxLzR+75+5Nc0mNGgcSH
	6SHGRWj03bJKJqGdQznLD9aX132cd7pZx36UI11XF+kbaQxyviT07dc3enJES15kScd7ZdUlDttWU
	J0tMua2O5UheJ5Pe0Ka16tqRowmERiatMBL1nVdhQBdIQOQnR1onSX4uG57utVbIlIV9SVgecjS+t
	vWrkFXw0yTvZ+dj0sWld5tGRsnPlRN8TN8quKKCfXKWYvo2JVIKLFw0sLRehej9X183IQLY7ij4ES
	Qiyif2Cd4hRMnCx8wDPISvR++r/NYGw3gnI26WcD8NJrv4hk8jcXj75seLOKy9R8IVFDNM0Vtdwx9
	aPnLZOBw==;
Received: from ip6-localhost ([::1]:52152 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nopNs-000jYo-At; Wed, 11 May 2022 16:40:20 +0000
Received: from goe3.ct.mbox.net ([165.212.182.32]:41456) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1nopNf-000jYf-Oo
 for samba-technical@lists.samba.org; Wed, 11 May 2022 16:40:13 +0000
Received: from goe3.ct.mbox.net (localhost [127.0.0.1])
 by goe3.ct.mbox.net (Postfix) with ESMTP id 4Kz0xw4sDlzfjTFV
 for <samba-technical@lists.samba.org>; Wed, 11 May 2022 16:40:04 +0000 (UTC)
X-USANET-Received: from goe3.ct.mbox.net [127.0.0.1] by goe3.ct.mbox.net via
 mtad (C8.MAIN.4.26U) 
 with ESMTP id 641AekqOB7040Me3; Wed, 11 May 2022 16:40:00 -0000
X-USANET-Routed: 5 gwsout-gwsd Q:gwsd
X-USANET-Routed: 3 gwsout-vs Q:cmvirus
X-USANET-GWS2-Service: gwsdout-encrypt True
X-USANET-GWS2-Service: gwsdout-soceng True
X-USANET-GWS2-Service: gwsdout-soceng-activated True
X-USANET-GWS2-Service: gwsdout-soceng-thresholds 33:67
X-USANET-GWS2-Tenant: snia.org
X-USANET-GWS2-Tagid: Q4WF
X-USANET-GWS2-Security: TLSv1.2;ECDHE-RSA-AES256-SHA384
Received: from S1P7MBX1H.EXCHPROD.USA.NET [165.212.81.254] by goe3.ct.mbox.net
 via smtad (C8.MAIN.4.30X) 
 with ESMTPS id XID129AekqOB4823Xe3 (using TLSv1.2 with cipher
 ECDHE-RSA-AES256-SHA384); Wed, 11 May 2022 16:40:00 -0000
X-USANET-Source: 165.212.81.254 OUT arnold.jones@snia.org
 S1P7MBX1H.EXCHPROD.USA.NET TLS
X-USANET-MsgId: XID129AekqOB4823Xe3
Received: from S1P7MBX1A.EXCHPROD.USA.NET (10.7.221.11) by
 S1P7MBX1H.EXCHPROD.USA.NET (10.7.221.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Wed, 11 May 2022 16:39:59 +0000
Received: from S1P7MBX1A.EXCHPROD.USA.NET ([10.7.221.11]) by
 S1P7MBX1A.EXCHPROD.USA.NET ([10.7.221.11]) with mapi id 15.00.1497.033; Wed,
 11 May 2022 16:39:59 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: REMINDER: SMB3 IO Lab June 14-16 - Virtual Event
Thread-Topic: REMINDER: SMB3 IO Lab June 14-16 - Virtual Event
Thread-Index: AQHYZVXBGrjs7+qUz0uBgiYCiVQIyQ==
Date: Wed, 11 May 2022 16:39:59 +0000
Message-ID: <70D62BD8-05FF-4422-90FD-1E9B9B15CF4A@snia.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.61.22050700
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

UkVNSU5ERVIg4oCTIFNNQjMgSU8gTGFiIG5leHQgbW9udGgsIGRldGFpbHMgYmVsb3cuDQoNCkZy
b206IEFybm9sZCBKb25lcyA8YXJub2xkLmpvbmVzQHNuaWEub3JnPg0KRGF0ZTogTW9uZGF5LCBB
cHJpbCA0LCAyMDIyIGF0IDk6MjAgQU0NClRvOiAic2FtYmEtdGVjaG5pY2FsQGxpc3RzLnNhbWJh
Lm9yZyIgPHNhbWJhLXRlY2huaWNhbEBsaXN0cy5zYW1iYS5vcmc+DQpTdWJqZWN0OiBVUERBVEU6
IFNNQjMgSU8gTGFiIEp1bmUgMTQtMTYgLSBWaXJ0dWFsIEV2ZW50DQoNCkhpIFNhbWJhIERldmVs
b3BlcnMsDQoNClByZXNlbnRhdGlvbnMgYXJlIG9ubHkgcGFydCBvZiB3aGF0IGlzIGdvaW5nIG9u
IGF0IHRoZSAyMDIyIFNEQyBFTUVBIFN0b3JhZ2UgRGV2ZWxvcGVyIENvbmZlcmVuY2U8aHR0cHM6
Ly93d3cuc25pYS5vcmcvZXZlbnRzL3NkY2VtZWE+IHZpcnR1YWwgZXZlbnQsIEp1bmUxNHRoLCBt
b3ZlZCBmcm9tIGl0cyBvcmlnaW5hbCBkYXRlIGluIEFwcmlsLiBUaGUgU05JQSBTTUIzIEludGVy
b3BlcmFiaWxpdHkgKElPKSBMYWIgaXMgYWxzbyBhbiBpbnRlZ3JhbCBwYXJ0IG9mIHRoZSBwcm9n
cmFtLiBUaGUgMjAyMiBTTklBIFNEQyBFTUVBIFNNQjMgSU8gTGFiPGh0dHBzOi8vd3d3LnNuaWEu
b3JnL2V2ZW50cy9zZGMtZW1lYS9zbWIzLWludGVyb3BlcmFiaWxpdHktbGFiPiB3aWxsIGJlIGhl
bGQgb25saW5lIHVzaW5nIGEgdmlydHVhbCBwcml2YXRlIG5ldHdvcmssIGNyZWF0aW5nIGEgY29s
bGFib3JhdGl2ZSBmcmFtZXdvcmsgZm9yIHRlc3RpbmcuICBUaGUgbGFiIHdpbGwgdGFrZSBwbGFj
ZSBKdW5lIDE0dGgtMTZ0aCx3aXRoIGFuIGFkZGl0aW9uYWwgd2VlayBvZiBleHRlbmRlZCBhY2Nl
c3MgdGltZSB0byB0aGUgdmlydHVhbCB0ZXN0aW5nIGZyYW1ld29yayB0aHJvdWdoIEp1bmUgMjJu
ZC4gVGhlIG9ubGluZSBsYWIgZW52aXJvbm1lbnQgd2lsbCBiZSBhdmFpbGFibGUgMjQgaG91cnMg
ZWFjaCBkYXksIG1ha2luZyBpdCBlYXN5IGZvciBldmVyeW9uZSB0byBhY2Nlc3MuDQoNClRoZSBw
dXJwb3NlIG9mIHRoaXMgSU8gTGFiIGlzIGZvciB2ZW5kb3JzIHRvIGJyaW5nIHRoZWlyIGltcGxl
bWVudGF0aW9ucyBvZiBTTUIzIHRvIHRlc3QsIGlkZW50aWZ5LCBhbmQgZml4IGJ1Z3MgaW4gYSBj
b2xsYWJvcmF0aXZlIHNldHRpbmcgd2l0aCB0aGUgZ29hbCBvZiBwcm92aWRpbmcgYSBmb3J1bSBp
biB3aGljaCBjb21wYW5pZXMgY2FuIGRldmVsb3AgaW50ZXJvcGVyYWJsZSBwcm9kdWN0cy4gVGhl
cmUgYXJlIHNldmVyYWwgbmV3IGZlYXR1cmVzIHRoYXQgaGF2ZSByZWNlbnRseSBiZWVuIGFkZGVk
IHRvIHRoZSBTTUIzIHByb3RvY29sOg0KDQogICogICBTTUIzIG5vdyBjYW4gY29tbXVuaWNhdGUg
b3ZlciBRVUlDLCBhIG5ldyBpbnRlcm5ldCBzdGFuZGFyZCB0cmFuc3BvcnQgd2hpY2ggaXMgYmVp
bmcgYnJvYWRseSBhZG9wdGVkIGZvciB3ZWIgYW5kIG90aGVyIGFwcGxpY2F0aW9uIGFjY2Vzcy4N
CiAgKiAgIFN1cHBvcnQgZm9yIEFFUy1HTUFDIGF1dGhlbnRpY2F0aW9uDQogICogICBTdXBwb3J0
IGZvciBzaGFyZSBjb21wcmVzc2lvbg0KICAqICAgU3VwcG9ydCBmb3IgZW5jcnlwdGlvbiBvdmVy
IFJETUENCiAgKiAgIFJvYWRtYXAgZm9yIHNlY3VyaXR5LXJlbGF0ZWQgU01CIGNoYW5nZXMgZm9y
IFdpbmRvd3MNCg0KVGhlIElPIExhYiBpcyBhbiBvcHBvcnR1bml0eSB0byBsZWFybiBhYm91dCB0
aGVzZSBuZXcgZmVhdHVyZXMgYW5kIHRlc3QgeW91ciBpbXBsZW1lbnRhdGlvbiB3aXRoIE1pY3Jv
c29mdCBXaW5kb3dzIHByb3RvY29sIHRlc3Qgc3VpdGVzLiAgRHVyaW5nIHRoZSBJTyBMYWIgeW91
IGhhdmUgdGhlIG9wcG9ydHVuaXR5IHRvIGRpcmVjdGx5IGVuZ2FnZSB3aXRoIFdpbmRvd3MgUHJv
dG9jb2wgU3VwcG9ydCwgVGVzdCBTdWl0ZSBEZXZlbG9wbWVudCwgYW5kIG1lbWJlcnMgb2YgdGhl
IFdpbmRvd3MgZGV2ZWxvcG1lbnQgdGVhbSBhcyB3ZWxsIGFzIG5ldHdvcmsgd2l0aCBvdGhlciBw
cm9mZXNzaW9uYWxzIGZyb20gYWxsIG92ZXIgdGhlIHdvcmxkLg0KDQpJZiB5b3UgYXJlIHJlbHVj
dGFudCB0byBwYXJ0aWNpcGF0ZSBiZWNhdXNlIHlvdSBmZWVsIHRoYXQgeW91ciBTTUIzIGltcGxl
bWVudGF0aW9uIGlzICJub3QgcmVhZHkiLCB5b3Ugc2hvdWxkIHN0aWxsIHBhcnRpY2lwYXRlISBU
aGUgU01CMyBJTyBMYWIgaXMgYWxzbyBhIGRldmVsb3BtZW50IG9wcG9ydHVuaXR5LCBub3QganVz
dCBhIHRlc3Rpbmcgb3Bwb3J0dW5pdHkuIEltcGxlbWVudGF0aW9ucyBzdGlsbCBpbiBkZXZlbG9w
bWVudCBhcmUgZW5jb3VyYWdlZCB0byBwYXJ0aWNpcGF0ZS4gIEl0J3MgYSBncmVhdCBvcHBvcnR1
bml0eSB0byBnZXQgaGVscCBhbmQgbGVhcm4gZnJvbSB0aGUgZXhwZXJ0cyENCg0KVGhpcyB5ZWFy
IHdlIGFyZSBwbGVhc2VkIHRvIGFubm91bmNlIHRoZSBmdWxsIHBhcnRpY2lwYXRpb24gYW5kIGNv
bnRpbnVlZCBzdXBwb3J0IG9mIE1pY3Jvc29mdCwgb3VyIDIwMjIgU05JQSBTREMgRU1FQSBTTUIz
IElPIExhYiB1bmRlcndyaXRlci4NCg0KRm9yIGNvbXBsZXRlIGRldGFpbHMgb24gaG93IHRvIHBh
cnRpY2lwYXRlIHBsZWFzZSBzZWU6DQpodHRwOi8vd3d3LnNuaWEub3JnL1NEQ0VNRUFsYWJzDQoN
CklmIHlvdSBoYXZlIGFueSBhZGRpdGlvbmFsIHF1ZXN0aW9ucywgcGxlYXNlIGNvbnRhY3QgbWUg
YXQgNDA3LTU3NC03MjczIG9yIGFybm9sZEBzbmlhLm9yZy48bWFpbHRvOmFybm9sZEBzbmlhLm9y
Zz9zdWJqZWN0PVFVRVNUSU9OOiUyMFNEQyUyMEVNRUElMjBJTyUyMExhYj4NCkkgbG9vayBmb3J3
YXJkIHRvIHlvdXIgcGFydGljaXBhdGlvbiBpbiB0aGUgVmlydHVhbCBTREMgRU1FQSBTTUIzIElP
IExhYiB0aGlzIHllYXIhDQotLSAgQXJub2xkDQoNCkFybm9sZCBKb25lcw0KVGVjaG5pY2FsIENv
dW5jaWwgTWFuYWdpbmcgRGlyZWN0b3INClN0b3JhZ2UgTmV0d29ya2luZyBJbmR1c3RyeSBBc3Nv
Y2lhdGlvbg0KUGhvbmU6IDQwNy41NzQuNzI3MyAgTW9iaWxlOiA0MDcuNDM1LjEwNjcNCmFybm9s
ZC5qb25lc0BzbmlhLm9yZzxtYWlsdG86YXJub2xkLmpvbmVzQHNuaWEub3JnPg0KDQoNCg==

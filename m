Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C60D4D1D3D
	for <lists+samba-technical@lfdr.de>; Tue,  8 Mar 2022 17:32:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=4Xr/Sz6sd8he7H4splLm+2Hy960HqoRHwhHyCYwlIDk=; b=zLid642IvDaCgA9iWo5pPzcIQ2
	Sf1wyRPxDKcEWt9n8Mg0Gh7grotjN+Nk6JmguSycAY75cvYUoO715GVF2CF+QIKqYRLa5L950LzQU
	UArhcmoft+w79kkz9cteURYTrkCihguZJdWacuzyrDPm2EAc121oPzshK+nKk26APo3LIfvyrLXbr
	U88f3NW3jkDU4gXUcvzs+7GfbMmOGnwxvOya6eIm+LfvOUrxUTfdbrpfwjAwIqRnZCiYKspX6zYG6
	kgh27NtU3XUBP3wf5+6Khl64Rxgw4GOVB5wN7QPNPU6w+d6V0Xsf78I8t3OMVSQuIyWTDRYsrnitB
	9mLpBqOA==;
Received: from ip6-localhost ([::1]:60404 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nRcks-000Vzs-DQ; Tue, 08 Mar 2022 16:32:10 +0000
Received: from us-smtp-delivery-147.mimecast.com ([170.10.129.147]:33352) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1nRckn-000Vzj-7o
 for samba-technical@lists.samba.org; Tue, 08 Mar 2022 16:32:07 +0000
Received: from PHOTON.sldomain.com (192.30.190.15 [192.30.190.15]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 us-mta-658-Hvfdk8WdOSa8e3D66TD3wA-1; Tue, 08 Mar 2022 11:16:16 -0500
X-MC-Unique: Hvfdk8WdOSa8e3D66TD3wA-1
Received: from isotope.sldomain.com (192.168.200.20) by PHOTON.sldomain.com
 (192.168.200.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 8 Mar
 2022 09:16:24 -0700
Received: from isotope.sldomain.com ([fe80::5567:5b08:1164:d2ee]) by
 isotope.sldomain.com ([fe80::5567:5b08:1164:d2ee%6]) with mapi id
 15.01.2375.018; Tue, 8 Mar 2022 09:16:24 -0700
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: check_reduced_name() with vfs_streams_depot fails if :STREAM/ not in
 root of samba share
Thread-Topic: check_reduced_name() with vfs_streams_depot fails if :STREAM/
 not in root of samba share
Thread-Index: AQHYMwfbvvEq/4uD90CKwRlwM004Ig==
Date: Tue, 8 Mar 2022 16:16:24 +0000
Message-ID: <ffce2444-308a-333e-6a23-2a17106e40f5@spectralogic.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA47A211 smtp.mailfrom=daveb@spectralogic.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: spectralogic.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
From: Dave Baukus via samba-technical <samba-technical@lists.samba.org>
Reply-To: Dave Baukus <daveb@spectralogic.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

U2FtYmEgNC4xMy43IG9uIEZyZWVCU0Qtc3RhYmxlMTMgSSBhbSBnZXR0aW5nIHRoZSBmb2xsb3dp
bmcgZXJyb3JzOg0KDQogIGNoZWNrX3JlZHVjZWRfbmFtZTogQmFkIGFjY2VzcyBhdHRlbXB0OiAu
IGlzIGEgc3ltbGluayBvdXRzaWRlIHRoZSBzaGFyZSBwYXRoDQogIGNvbm5fcm9vdGRpciA9L2V4
cG9ydC94eHhWb2wvc2hhcmVzDQogIHJlc29sdmVkX25hbWU9L2V4cG9ydC94eHhWb2wvOlNUUkVB
TS9BOS9DRS85RTE0MjQxMkRFQTFFMDMyMDYwMDAwMDAwMDAwMDAwMA0KDQpOb3RlLCB0aGVyZSBh
cmUgbm8gc3ltbGlua3MgaW52b2x2ZWQuDQoNClRoZSBhYm92ZSBlcnJvciBjYXVzZXMgbW9zdC9h
bGwgYXR0ZW1wdHMgdG8gc2F2ZSBhIGZpbGUgdG8gdGhlIHNoYXJlIGZyb20gTWFjT1MgSGlnaCBT
aWVycmEgdG8gZmFpbC4NCldlIGFyZSB1c2luZyB2ZnNfc3RyZWFtc19kZXBvdDsgdGhlIGVycm9y
IG9ubHkgb2NjdXJzIHdoZW4gY29ubl9yb290ZGlyIGlzIG5vdCB0aGUgcm9vdCBvZiB0aGUgc2Vy
dmVyJ3MgbmF0aXZlIGZpbGVzeXN0ZW0gKC9leHBvcnQveHh4Vm9sLyBpbiB0aGlzIGNhc2UpDQpJ
biBvdGhlciB3b3JkcywgaWYgdGhlIHNoYXJlIGlzIG1vdW50ZWQgYXQgL2V4cG9ydC94eHhWb2wg
dGhlbiB0aGUgZXJyb3IgZG9lcyBub3Qgb2NjdXIuDQoNCk9uZSBjb3VsZCBhcmd1ZSB0aGF0IHRo
ZSA6U1RSRUFNUyBpcyAib3V0IHNpZGUgb2YgdGhlIHNoYXJlIiwgYnV0IHRoZXJlIGFyZSBsZWdp
dGltYXRlIHJlYXNvbnMgZm9yIG5vdCBtb3VudGluZyB0aGUgYXQgdGhlIHJvb3Qgb2YgYSBmaWxl
c3lzdGVtLg0KDQpJcyB0aGVyZSBhIGtub3duIHdvcmthcm91bmQgZm9yIHRoaXMgPw0KSXMgdGhp
cyBhIGRlZmljaWVuY3kgaW4gbW9kdWxlL3Zmc19zdHJlYW1zX2RlcG90LmMgPw0KQSBjYXNlIG9m
ICJkb24ndCBkbyB0aGF0IiBhbmQvb3IgbWlzY29uZmlndXJhdGlvbiBvbiBteSBwYXJ0ID8NCg0K
T3IgZG8gSSBuZWVkIHRvIGhhY2sgdGhpcyBjaHVuayBvZiBzbWJkL3Zmcy5jOg0KICAgICAgICAv
Kg0KICAgICAgICAgKiBJbiB0aGUgY2FzZSBvZiByb290ZGlyX2xlbiA9PSAxLCB3ZSBrbm93IHRo
YXQNCiAgICAgICAgICogY29ubl9yb290ZGlyIGlzICIvIiwgYW5kIHdlIGFsc28ga25vdyB0aGF0
DQogICAgICAgICAqIHJlc29sdmVkX25hbWUgc3RhcnRzIHdpdGggYSBzbGFzaC4gIFNvLCBpbiB0
aGlzDQogICAgICAgICAqIGNvcm5lciBjYXNlLCByZXNvbHZlZF9uYW1lIGlzIGF1dG9tYXRpY2Fs
bHkgYQ0KICAgICAgICAgKiBzdWItZGlyZWN0b3J5IG9mIHRoZSBjb25uX3Jvb3RkaXIuIFRodXMg
d2UgY2FuIHNraXANCiAgICAgICAgICogdGhlIHN0cmluZyBjb21wYXJpc29uIGFuZCB0aGUgbmV4
dCBjaGFyYWN0ZXIgY2hlY2tzDQogICAgICAgICAqICh3aGljaCBhcmUgZXZlbiB3cm9uZyBpbiB0
aGlzIGNhc2UpLg0KICAgICAgICAgKi8NCiAgICAgICAgaWYgKHJvb3RkaXJfbGVuICE9IDEpIHsN
CiAgICAgICAgICAgICAgICBib29sIG1hdGNoZWQ7DQoNCiAgICAgICAgICAgICAgICBtYXRjaGVk
ID0gKHN0cm5jbXAoY29ubl9yb290ZGlyLCByZXNvbHZlZF9uYW1lLA0KICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICByb290ZGlyX2xlbikgPT0gMCk7DQogICAgICAgICAgICAgICAgaWYg
KCFtYXRjaGVkIHx8IChyZXNvbHZlZF9uYW1lW3Jvb3RkaXJfbGVuXSAhPSAnLycgJiYNCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlc29sdmVkX25hbWVbcm9vdGRpcl9sZW5dICE9
ICdcMCcpKSB7DQogICAgICAgICAgICAgICAgICAgICAgICBEQkdfTk9USUNFKCJCYWQgYWNjZXNz
IGF0dGVtcHQ6ICVzIGlzIGEgc3ltbGluayAiDQogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICJvdXRzaWRlIHRoZSAiDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJzaGFy
ZSBwYXRoXG4iDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJjb25uX3Jvb3RkaXIg
PSVzXG4iDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJyZXNvbHZlZF9uYW1lPSVz
XG4iLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmbmFtZSwNCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgY29ubl9yb290ZGlyLA0KICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICByZXNvbHZlZF9uYW1lKTsNCiAgICAgICAgICAgICAgICAgICAgICAgIFRBTExP
Q19GUkVFKHJlc29sdmVkX2ZuYW1lKTsNCiAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBO
VF9TVEFUVVNfQUNDRVNTX0RFTklFRDsNCiAgICAgICAgICAgICAgICB9DQogICAgICAgIH0NCg0K
LS0NCkRhdmUgQmF1a3VzDQoNCg==

Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8557EC2D
	for <lists+samba-technical@lfdr.de>; Fri,  2 Aug 2019 07:41:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=HqSuuo3RPXLMvlxbxTjIOnZQ9IGhUxoWtjNRAOLRLM8=; b=K0eWHlNkJOlkgc3ExjfN1wp0vd
	NcvVt7QW7tQxqbfb2nfCKf6dcQnAZlcFm6oJJEx74XAj+2nWtoqGnRwKEDxuPsOb5M1Hm9yPKtRmD
	9Aa7st3cd5bmv6080RJRf0g+IvKtqn+Y2zb423b+vtJMqMqkGiPApAql9B98LdGBih1/9ka2bdLZR
	SDxc8B38HzTQKDtZV4wDLUQfBBJoAhn3GFK5T64EwUn3wTaqzxHQzsE3DkwmoxI+67guBD+mPUVUI
	2Gmh4VlrLkoc6sEDOH8s5kXVv98OGI37qCGGcc+F6aYtzNw+5bTp6j6wRon4ybzX0lD2RCKrpLX5m
	tcpwlgoQ==;
Received: from localhost ([::1]:49494 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1htQIO-003TsM-06; Fri, 02 Aug 2019 05:40:04 +0000
Received: from mail1.bemta24.messagelabs.com ([67.219.250.212]:46176) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1htQII-003TsF-8i
 for samba-technical@lists.samba.org; Fri, 02 Aug 2019 05:40:01 +0000
Received: from [67.219.250.101] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-a.us-west-2.aws.symcld.net id A9/B4-10939-8ACC34D5;
 Fri, 02 Aug 2019 05:39:52 +0000
X-Env-Sender: Abhishek.Anand@veritas.com
X-Msg-Ref: server-25.tower-325.messagelabs.com!1564724390!83839!1
X-Originating-IP: [18.237.140.177]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17467 invoked from network); 2 Aug 2019 05:39:51 -0000
Received: from p01b.mail.dlp.protect.symantec.com (HELO
 mail.ds.dlp.protect.symantec.com) (18.237.140.177)
 by server-25.tower-325.messagelabs.com with ECDHE-RSA-AES256-SHA384 encrypted
 SMTP; 2 Aug 2019 05:39:51 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iYODs5Fr10wh/GrVwzn1LuHoTQ+fmkdI8KPDHNSKXw5vHT1TvMHM19VAmIGOKdooR/WBC3sw9fGfZmZ1znqBt/DbBOtld8JZh/eL75nASxi784Vhm+Kx9ouIJ6yezKj4IdxiuAU8w0gwWPgeQmIDYcL5wIBD/lzZUehDaPFWrNQeTt8GbxqtCKHZVeZ+XNFVT+fhUhrLB0Gm3w+hkLj1LOyYpO4Fl+mmsRtmNqnNOFuSxk+ET6HLkA4AUWu694PdcdilJbtyoIlEWRESraIM54EmM+6Eun7uHglIC4FHQYaNzTmOYDwdbqXUQLWEqli0/2pVbbHObVwTQLqqyLcWwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Xql1gxRrd9YNKiTRzIG8WvtxVyo8IrIuXrpI5csF8U=;
 b=E9CJhbBXsaGW4gwV8DQPkTmY1TOE1Alu15ZJm5IhaQa0F5L5AGdXCO4QqzzkrS9/pptXKuMl6Df61xZVwLH4fws4Y8iYzdqlaxLYDTZ6ZMi2zk5e34zd/g1ljBsT5h53rIMQP65QDLovf5HXVr7Tr9IR1+O8yjDht/JdZGcqj6WduMIrmTNpM0BZWdKld2ho6PKLOv1wFfA3R3Tj/uRLbqAJltUeDomnFMyOLFiFMieDyXYYr+l8coslzP2FaTVQz9OyMFrCB8ydU3G/KH/cnXYO7TBPl+uAzTF58aEdWV6JHN2IxMfzJpda6xQfJ0vdWVmCvkvxkPS7MtESDpra/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=veritas.com;dmarc=pass action=none
 header.from=veritas.com;dkim=pass header.d=veritas.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=veritastech.onmicrosoft.com; s=selector2-veritastech-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Xql1gxRrd9YNKiTRzIG8WvtxVyo8IrIuXrpI5csF8U=;
 b=vu01ZkIh+mwrcbPxPngH2ThVfD0pSZqsuyq66JJjPUPEGXK1UhFO6fwP+mtmjyQaJKvAcybuNUTC/RvRGTeTggOS8CPMw1OENGXJVhtVbb1auLxNR11/1mdP3m6TO+7GcEp6CUZazjD2MxDUV9NbuUXEq4FaeMh38gcPZ83XfgI=
Received: from CH2PR20MB2949.namprd20.prod.outlook.com (52.132.228.22) by
 CH2PR20MB2919.namprd20.prod.outlook.com (52.132.231.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.12; Fri, 2 Aug 2019 05:39:48 +0000
Received: from CH2PR20MB2949.namprd20.prod.outlook.com
 ([fe80::c4b2:6f62:2341:fe83]) by CH2PR20MB2949.namprd20.prod.outlook.com
 ([fe80::c4b2:6f62:2341:fe83%7]) with mapi id 15.20.2136.010; Fri, 2 Aug 2019
 05:39:48 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Subject: Subfoders in VxFS not inheriting correct ACLs from parent directory
Thread-Topic: Subfoders in VxFS not inheriting correct ACLs from parent
 directory
Thread-Index: AdVI9I+RGACnPjivTG+rQ5nrOLWnjw==
Date: Fri, 2 Aug 2019 05:39:48 +0000
Message-ID: <CH2PR20MB2949F99CEFF9F84FDFBA25B886D90@CH2PR20MB2949.namprd20.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [165.225.106.80]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ec06956-0cd2-481d-afc4-08d7170bd565
x-ms-traffictypediagnostic: CH2PR20MB2919:
x-ms-exchange-purlcount: 2
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eSxyJa8zLw7cCHvq6WEFKSSvFCk0uCY3uvrv2gbV0E3LKCMIo44kaYzkcQZpyzXXAeJeDfg9xR/kXwp5h2jXLAH7ToP4xjQ+15oKzjNrVLW8ThA/M+KGGA+5219Us/i8Vmth/FZVRqba2QWssfVJbaSSM2txbHto/vwygHiTJLNICo0cdGyJsaQeqMtaxtk/UFjICpk9S1N/AyTf6GUY0ESHWItkHUEg78eh0wFtniiRaV8wtQ9Ao85b0317y030PEPd++RllVP2D3EIjW6U5qShopg6NkxH/2evpblqF0NExCclz5d0YZGnR9eQTS/Qx0dCTJqeewTHy6+UFbmUO2/nNI6seUw1LK/ECnmOYqs/nY/3ru49OeYZsKngyAHqcOxY/P/0r9tduCduLsMvAPMJ1YC2JcrIwAL8wOwY+X8=
Content-Type: multipart/mixed;
 boundary="_004_CH2PR20MB2949F99CEFF9F84FDFBA25B886D90CH2PR20MB2949namp_"
MIME-Version: 1.0
X-OriginatorOrg: veritas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ec06956-0cd2-481d-afc4-08d7170bd565
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fc8e13c0-422c-4c55-b3ea-ca318e6cac32
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Abhishek.Anand@veritas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR20MB2919
X-CFilter-Loop: Reflected
X-DetectorID-Processed: 8cd23f87-5a55-4de7-9b51-dd0f7d1caaf5
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
From: Abhishek Anand via samba-technical <samba-technical@lists.samba.org>
Reply-To: Abhishek Anand <Abhishek.Anand@veritas.com>
Cc: Deepti Shenai1 <Deepti.Shenai1@veritas.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--_004_CH2PR20MB2949F99CEFF9F84FDFBA25B886D90CH2PR20MB2949namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi List,

As part of our NAS product, we are using Samba on top of Veritas File Syste=
m (VxFS).

This Fix solves the issue of no retention of windows ACLs set onto a file/d=
irectory created on a samba share.

Previously, VxFS did not support the security namespace for extended attrib=
utes. Thus, we stored the security.NTACL as user.NTACL. VxFS now supports s=
toring the extended attributes in security.NTACL namespace. Hence, the old =
styled extended attributes user.NTACL should be removed whenever a new set =
of request comes.

Please find attached patch which fixes for the above issue.
This patch applies to Samba master. Please let me know reviews/comments.

Thanks and Regards,
Abhishek Anand


--_004_CH2PR20MB2949F99CEFF9F84FDFBA25B886D90CH2PR20MB2949namp_
Content-Type: application/octet-stream;
	name="0001-This-Fix-solves-the-issue-of-no-retention-of-windows.patch"
Content-Description:  0001-This-Fix-solves-the-issue-of-no-retention-of-windows.patch
Content-Disposition: attachment;
	filename="0001-This-Fix-solves-the-issue-of-no-retention-of-windows.patch";
	size=2151; creation-date="Fri, 02 Aug 2019 05:39:39 GMT";
	modification-date="Fri, 02 Aug 2019 04:47:19 GMT"
Content-Transfer-Encoding: base64

RnJvbSBiN2MxNWY1NzI0MWUyYTU1YTllZjQyMWUwZjgyYzY1MDhlZGU5ZTE5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBYmhpc2hlayBBbmFuZCA8YWJoaXNoZWsuYW5hbmRAdmVyaXRh
cy5jb20+CkRhdGU6IFdlZCwgMjQgSnVsIDIwMTkgMTI6Mjk6MTkgKzA1MzAKU3ViamVjdDogW1BB
VENIXSBUaGlzIEZpeCBzb2x2ZXMgdGhlIGlzc3VlIG9mIG5vIHJldGVudGlvbiBvZiB3aW5kb3dz
IEFDTHMgc2V0CiBvbnRvIGEgZmlsZS9kaXJlY3RvcnkgY3JlYXRlZCBvbiBhIHNhbWJhIHNoYXJl
LgoKUHJldmlvdXNseSwgVnhGUyBkaWQgbm90IHN1cHBvcnQgdGhlIHNlY3VyaXR5IG5hbWVzcGFj
ZSBmb3IgZXh0ZW5kZWQgYXR0cmlidXRlcy4gVGh1cywgd2Ugc3RvcmVkIHRoZSBzZWN1cml0eS5O
VEFDTCBhcyB1c2VyLk5UQUNMLiBWeEZTIG5vdyBzdXBwb3J0cyBzdG9yaW5nIHRoZSBleHRlbmRl
ZCBhdHRyaWJ1dGVzIGluIHNlY3VyaXR5Lk5UQUNMIG5hbWVzcGFjZS4gSGVuY2UsIHRoZSBvbGQg
c3R5bGVkIGV4dGVuZGVkIGF0dHJpYnV0ZXMgdXNlci5OVEFDTCBzaG91bGQgYmUgcmVtb3ZlZCB3
aGVuZXZlciBhIG5ldyBzZXQgb2YgcmVxdWVzdCBjb21lcy4KClNpZ25lZC1vZmYtYnk6IEFiaGlz
aGVrIEFuYW5kIDxhYmhpc2hlay5hbmFuZEB2ZXJpdGFzLmNvbT4KLS0tCiBzb3VyY2UzL21vZHVs
ZXMvdmZzX3Z4ZnMuYyB8IDE1ICsrKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDE0IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9zb3VyY2UzL21vZHVsZXMv
dmZzX3Z4ZnMuYyBiL3NvdXJjZTMvbW9kdWxlcy92ZnNfdnhmcy5jCmluZGV4IDViYWEzODUuLjA1
MDJlMmUgMTAwNjQ0Ci0tLSBhL3NvdXJjZTMvbW9kdWxlcy92ZnNfdnhmcy5jCisrKyBiL3NvdXJj
ZTMvbW9kdWxlcy92ZnNfdnhmcy5jCkBAIC02Miw2ICs2Miw3IEBAIGFsb25nIHdpdGggdGhpcyBw
cm9ncmFtLiAgSWYgbm90LCBzZWUgPGh0dHA6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+LgogCiAj
aWZuZGVmIFhBVFRSX1VTRVJfTlRBQ0wKICNkZWZpbmUgWEFUVFJfVVNFUl9OVEFDTCAic3lzdGVt
Lk5UQUNMIgorI2RlZmluZSBYQVRUUl9VU0VSX05UQUNMX1YwICJ1c2VyLk5UQUNMIgogI2VuZGlm
CiAKIC8qIHR5cGUgdmFsdWVzICovCkBAIC01OTUsMTMgKzU5NiwyNSBAQCBzdGF0aWMgaW50IHZ4
ZnNfZnNldF94YXR0cihzdHJ1Y3QgdmZzX2hhbmRsZV9zdHJ1Y3QgKmhhbmRsZSwKIAkJCSAgIHN0
cnVjdCBmaWxlc19zdHJ1Y3QgKmZzcCwgY29uc3QgY2hhciAqbmFtZSwKIAkJCSAgIGNvbnN0IHZv
aWQgKnZhbHVlLCBzaXplX3Qgc2l6ZSwgIGludCBmbGFncyl7CiAJaW50IHJldCA9IDA7CisJaW50
IHRtcF9yZXQgPSAwOwogCiAJREVCVUcoMTAsICgiSW4gdnhmc19mc2V0X3hhdHRyXG4iKSk7CiAK
IAlyZXQgPSB2eGZzX3NldHhhdHRyX2ZkKGZzcC0+ZmgtPmZkLCBuYW1lLCB2YWx1ZSwgc2l6ZSwg
ZmxhZ3MpOwogCWlmICgocmV0ID09IDApIHx8CiAJICAgICgocmV0ID09IC0xKSAmJiAoZXJybm8g
IT0gRU5PVFNVUCkgJiYgKGVycm5vICE9IEVOT1NZUykpKSB7Ci0JCVNNQl9WRlNfTkVYVF9GUkVN
T1ZFWEFUVFIoaGFuZGxlLCBmc3AsIG5hbWUpOworCisJCS8qCisJCSAqIHZlcnNpb24gMTogdXNl
ci5OVEFDTCB4YXR0ciB3aXRob3V0IGluaGVyaXRhbmNlIHN1cHBvcnRlZAorCQkgKiB2ZXJzaW9u
IDI6IHVzZXIuTlRBQ0wgeGF0dHIgd2l0aCBpbmhlcml0YW5jZSBzdXBwb3J0ZWQKKwkJICogdmVy
c2lvbiAzOiBuZXcgc3R5bGVkIHhhdHRyIHNlY3VyaXR5Lk5UQUNMIHdpdGggaW5oZXJpdGFuY2Ug
c3VwcG9ydGVkCisJCSAqIEhlbmNlLCB0aGUgb2xkIHN0eWxlZCB4YXR0ciB1c2VyLk5UQUNMIHNo
b3VsZCBiZSByZW1vdmVkCisJCSAqLworCQl0bXBfcmV0ID0gc3RyY2FzZWNtcChuYW1lLCBYQVRU
Ul9OVEFDTF9OQU1FKTsKKwkJaWYgKHRtcF9yZXQgPT0gMCkgeworCQkJU01CX1ZGU19ORVhUX0ZS
RU1PVkVYQVRUUihoYW5kbGUsIGZzcCwgWEFUVFJfVVNFUl9OVEFDTF9WMCk7CisJCQlERUJVRygx
MCwgKCJPbGQgc3R5bGUgeGF0dHIgJXMgcmVtb3ZlZC4uLlxuIiwgWEFUVFJfVVNFUl9OVEFDTF9W
MCkpOworCQl9CiAJCXJldHVybiByZXQ7CiAJfQogCi0tIAoyLjUuMQoK

--_004_CH2PR20MB2949F99CEFF9F84FDFBA25B886D90CH2PR20MB2949namp_--


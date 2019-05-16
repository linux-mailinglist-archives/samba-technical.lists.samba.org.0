Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6E620E55
	for <lists+samba-technical@lfdr.de>; Thu, 16 May 2019 20:02:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=2973pGpQjp43hBoj7VxPFVNGW18BOgpZJUMgZecwrjw=; b=WMCso3JJ3v1LWzCSCi3KX7Ac86
	WMIlRN+3UPToNEP6v1T6SBFDj8SQRwKnsJhTOHnS00yTPAQzcotxF2NZGwzVDX4UODqDyl1GpcTJW
	p6GKt4bXVHa6CsXU4J3lRG/gVT12MoMBN3+sMKOgE+ZEhkrEiZW37TuSvW0KyVByOOz70t+7aEjHP
	Ubk0jNSFRgeS/heknFwvfHgUW9W6WpiDTIiBA/NNZQH2jSsjGhEZWn8COhK+KUWme2YqQaOfA9hbb
	dO0If4dV7oKS7bpAJyDTAPxRx4D9Jt2ioSRkMT1q8pqrLRbkkIhYIsiEfvyzRxv7vNA+UEbtYPe1z
	41O2Hy6w==;
Received: from localhost ([::1]:52622 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hRKh2-000AaF-1A; Thu, 16 May 2019 18:01:24 +0000
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:52556) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hRKgv-000Aa7-MI
 for samba-technical@lists.samba.org; Thu, 16 May 2019 18:01:21 +0000
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4GHoJsv026444; Thu, 16 May 2019 11:01:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=proofpoint20171006;
 bh=9zq1Xol2EZEFukLgzN2NeNtPMcmUA6oBtKF3tuHkpEE=;
 b=brXTShHyNGi0r/gDHpiS5rgMx2aTeqM3GAdDG1+a+wkXX6/ioVU67Z0RKSqvGiUt775o
 ZRFBePJc1YVvBeii9dCiNkNYtue1zQzoHsx4u6rfWKxVZu903on5LTbNrBMD9W4HzVOg
 7mqmAACWePmWyvtSItMBYMblxI65t4e2MiJT+l98t2QGQncoMAdZxrorTt1wNL39KNkw
 PDSVPVYwEUk6S5eYJePJbbYAYTghlDO5EoI+8kqGc9zgJopYkxO5FFujo9Wh0XIh2Ppb
 fnsr1RcdsKR5HbuK55ptEm6jhjYHLbtljd7Ykf0QCsVD9uwV+TOBYKAPEi8K5z70DSDa HQ== 
Received: from nam04-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam04lp2055.outbound.protection.outlook.com [104.47.44.55])
 by mx0a-002c1b01.pphosted.com with ESMTP id 2sfhwswua7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 16 May 2019 11:01:10 -0700
Received: from MW2PR02MB3722.namprd02.prod.outlook.com (52.132.177.31) by
 MW2PR02MB3868.namprd02.prod.outlook.com (52.132.178.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Thu, 16 May 2019 18:01:07 +0000
Received: from MW2PR02MB3722.namprd02.prod.outlook.com
 ([fe80::ace0:1248:36bb:44b1]) by MW2PR02MB3722.namprd02.prod.outlook.com
 ([fe80::ace0:1248:36bb:44b1%5]) with mapi id 15.20.1900.010; Thu, 16 May 2019
 18:01:07 +0000
To: Andreas Schneider <asn@samba.org>, Jeremy Allison <jra@samba.org>
Subject: Re: [PATCH] s3:loadparm: Ensure to truncate FS Volume Label at
 multibyte boundary
Thread-Topic: [PATCH] s3:loadparm: Ensure to truncate FS Volume Label at
 multibyte boundary
Thread-Index: AQHVCn3JZC4KMmd11U+fGF37tnpepKZqeqgAgAIyT4CAAMiegIAAIsEA
Date: Thu, 16 May 2019 18:01:07 +0000
Message-ID: <320167CA-9449-42EC-9B40-1371164C1208@nutanix.com>
References: <B15C9E07-0E0B-49CD-BDD8-0CD236C4F777@nutanix.com>
 <C15B0D71-E5FD-4071-8FCC-E63EBFC3003E@nutanix.com>
 <20190515205841.GD253468@jra4> <1685286.56Q1xU0MPY@magrathea.fritz.box>
In-Reply-To: <1685286.56Q1xU0MPY@magrathea.fritz.box>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.19.0.190512
x-originating-ip: [192.146.154.3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aeab1646-3c95-4d64-cf0d-08d6da28786c
x-ms-traffictypediagnostic: MW2PR02MB3868:
x-ms-exchange-purlcount: 4
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:1332;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QM7GcQXJTImTAg4MABMX5mOxej9xcvPMCDjIVglWRdANsO4OlPMlSquRuoz2J6jJ+3JjJz7armTYgf+G/wS1HnMDNAzrFejpvzaJdwYUGBFnVgA482NOvDkgkk8RxlonvP+FpgpX2h5h3H8fqq+Zgh3DGj6JZcaJ24vyNM2k29kejFRghj9Q7fVZ2BJEv1nmkj7RxuzVYbOc7ogl5WtB9KQ8xNVZL1ucP7kXiaxUg03k1p/MsXa5eC4LJFaNXS8i6R0J1CT1CvfrbkWniCjB2VUPCy6uzj/qmfDm3HPmn0OwnOcS/QWod/jrGYr2F9ll5jXyCIyYFOtyXLyZM5BZqFhd2pNxR3/wdu3R09AQUKKANUGP0zc+7KTzbgC8tM/G83el2ZZ+m0HH2M/fMZmMl3+NI6ciwiYf9FlnM4CcY98=
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeab1646-3c95-4d64-cf0d-08d6da28786c
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR02MB3868
X-Proofpoint-Spam-Reason: safe
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
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
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 "ddiss@samba.org" <ddiss@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

VGhhbmsgeW91IEplcmVteSBhbmQgQW5kcmVhcyBmb3IgdGhlIHF1aWNrIHJldmlldy4NCg0KDQpS
ZWdhcmRzLA0KLVNoeWFtDQoNCkZyb206IEFuZHJlYXMgU2NobmVpZGVyIDxhc25Ac2FtYmEub3Jn
Pg0KRGF0ZTogVGh1cnNkYXksIE1heSAxNiwgMjAxOSBhdCAxOjU2IEFNDQpUbzogSmVyZW15IEFs
bGlzb24gPGpyYUBzYW1iYS5vcmc+DQpDYzogU2h5YW0gUmF0aGkgPHNoeWFtLnJhdGhpQG51dGFu
aXguY29tPiwgInNhbWJhLXRlY2huaWNhbEBsaXN0cy5zYW1iYS5vcmciIDxzYW1iYS10ZWNobmlj
YWxAbGlzdHMuc2FtYmEub3JnPiwgInNsb3dAc2FtYmEub3JnIiA8c2xvd0BzYW1iYS5vcmc+LCAi
ZGRpc3NAc2FtYmEub3JnIiA8ZGRpc3NAc2FtYmEub3JnPg0KU3ViamVjdDogUmU6IFtQQVRDSF0g
czM6bG9hZHBhcm06IEVuc3VyZSB0byB0cnVuY2F0ZSBGUyBWb2x1bWUgTGFiZWwgYXQgbXVsdGli
eXRlIGJvdW5kYXJ5DQoNCk9uIFdlZG5lc2RheSwgTWF5IDE1LCAyMDE5IDEwOjU4OjQxIFBNIENF
U1QgSmVyZW15IEFsbGlzb24gd3JvdGU6DQpPbiBUdWUsIE1heSAxNCwgMjAxOSBhdCAwNjoyNjow
N1BNICswMDAwLCBTaHlhbSBSYXRoaSB2aWEgc2FtYmEtdGVjaG5pY2FsDQp3cm90ZToNCj4gaHR0
cHM6Ly91cmxkZWZlbnNlLnByb29mcG9pbnQuY29tL3YyL3VybD91PWh0dHBzLTNBX19idWd6aWxs
YS5zYW1iYS5vcmdfc2hvdy01RmJ1Zy5jZ2ktM0ZpZC0zRDEzOTQ3JmQ9RHdJRmFRJmM9czg4M0dw
VUNPQ2hLT0hpb2NZdEdjZyZyPTAxeGNOaVlRSnpSc1Fwb1RSdXhqR0tiSHo4OWNmcnJjVTc5cW94
ZG9nMmsmbT0tUjk3SF8wSzg5Z1VFLU9XY3VuYU5IYldvMXVoT1RsdlBIRDNFMU1KS1VjJnM9WlND
T1VRT3RHVFN5RjRRRGFYMnpOd0dDOHphcWw1QkpYbWZKUUx3ZnNHbyZlPQ0KPg0KPiBUbyByZXBy
b2R1Y2UsIGNyZWF0ZSBhIHNoYXJlIHdpdGggYSBuYW1lIHdoZXJlIDMybmQgYnl0ZSBpcyBub3Qg
dGhlIGZpcnN0DQpieXRlIG9mIGEgbXV0bGlieXRlIGNoYXJhY3Rlci4gVXNpbmcgQ0pLIGNoYXJh
Y3RlcnMgKDMgYnl0ZXMgZWFjaCkgaXMgYQ0KcG9zc2libGUgYXBwcm9hY2guIEZvciBleGFtcGxl
LCBjcmVhdGluZyBhIHNoYXJlIHdpdGggbmFtZSDsl5DsnbTsl5DtlITsl5DsiqTsgrzsoJDsmKTs
g53shLEgYW5kDQp0cnlpbmcgdG8gb3BlbiBhIHR4dCBmaWxlIGluIE5vdGVwYWQgZ2l2ZXMgdGhl
IGZvbGxvd2luZyBlcnJvcjoNCj4gICBJbnZhbGlkIGNoYXJhY3Rlci4gRm9yIG11bHRpYnl0ZSBj
aGFyYWN0ZXIgc2V0cywgb25seSB0aGUgbGVhZGluZyBieXRlDQo+ICAgaXMNCj4gICBpbmNsdWRl
ZCB3aXRob3V0IHRoZSB0cmFpbGluZyBieXRlLiBGb3IgVW5pY29kZSBjaGFyYWN0ZXIgc2V0cywg
aW5jbHVkZQ0KPiAgIHRoZSBjaGFyYWN0ZXJzIDB4RkZGRiBhbmQgMHhGRkZFLg0KPg0KPiBMb29r
aW5nIGF0IHdpcmVzaGFyayBjYXB0dXJlLCB0aGUgZm9sbG93aW5nIGlzIHNlZW4gYXMgc291cmNl
IG9mIHRoaXMNCmlzc3VlOg0KPiAgIEdldEluZm8gUmVxdWVzdCBGU19JTkZPL0ZpbGVGc1ZvbHVt
ZUluZm9ybWF0aW9uIEZpbGU6IFJhdGhpOVw/Pz8/Pz8/Pz8/Pw0KPiAgIEdldEluZm8gUmVzcG9u
c2UsIEVycm9yOiBTVEFUVVNfSUxMRUdBTF9DSEFSQUNURVINCj4NCj4gUHJvcG9zZWQgc29sdXRp
b24gaXMgdG8gdHJ1bmNhdGUgdGhlIGxhYmVsIG5hbWUgYXQgdGhlIGVuZCBvZiBhIG11bHRpYnl0
ZQ0KPiBjaGFyYWN0ZXIgYmVmb3JlIHRoZSAzMm5kIGJ5dGUuDQo+DQo+IFBsZWFzZSByZXZpZXcg
YW5kIHN1Z2dlc3QgY2hhbmdlcywgaW1wcm92ZW1lbnRzIGFuZCBvdGhlciBhcHByb2FjaGVzLg0K
Pg0KPiBSZWdhcmRzLA0KPiAtU2h5YW1zdW5kZXIgUmF0aGkgKG1haWx0bzpzaHlhbS5yYXRoaUBu
dXRhbml4LmNvbSkNCkEgZmV3IHNsaWdodCBjaGFuZ2VzIHRvIG1ha2UgdGhpbmdzIGNsZWFyZXIg
KHRvIG1lIGF0IGxlYXN0IDotKS4NCkNoYW5nZXMgYXR0YWNoZWQgYW5kIGJ1ZyBJRCBhZGRlZCB0
byB0aGUgY29tbWl0IG1lc3NhZ2UuIExldCBtZQ0Ka25vdyBpZiB5b3UncmUgT0sgd2l0aCBpdC4N
ClJCKy4gQ2FuIEkgZ2V0IGEgc2Vjb25kIFRlYW0gcmV2aWV3ZXIgPw0KDQpSQisgYW5kIHB1c2hl
ZCB0byBhdXRvYnVpbGQuDQoNCi0tDQpBbmRyZWFzIFNjaG5laWRlciAgICAgICAgICAgICAgICAg
ICAgICBhc25Ac2FtYmEub3JnPG1haWx0bzphc25Ac2FtYmEub3JnPg0KU2FtYmEgVGVhbSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgd3d3LnNhbWJhLm9yZw0KR1BHLUlEOiAgICAgOERGRjUz
RTE4RjJBQkM4RDhGM0M5MjIzN0VFMEZDNERDQzAxNEUzRA0KDQoNCg0K

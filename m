Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B6971F4E2C
	for <lists+samba-technical@lfdr.de>; Fri,  8 Nov 2019 15:33:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Shm3DBtJ+prh+0sQd0mNdOQGkfVpHtxHC/8MX+5P7wI=; b=kPDEr9JjxTiLNg1f5vTNX/scnb
	MG9FhmI8fvS5q9tcYkNepDHS/T7XfNCJ0WU80NbRQVC6E5zpkVIkMoKJU44b4YP1K0ghqKAIkh8Do
	Lblw5NyZ2an4TU4VCSAEM0N0WRoG3StkaLn/7T4X2TUPYtc2u33dIdQ274SBBoSozFFvjoIR2zBEP
	2VC5/GQ9N9jtsGD3uRW8cwojlhGEek68kn1UlbhciwLR2zgRW01DKgA7kenUqJitVDVwIc4wbmJWO
	t6hdNtsMsW2D9gB5gXVOS63FX9bPpBVOOOvW9WmQxlO691RWIR5QtUAgm2StFIiP+XDknH09SAFdP
	61SYq8bA==;
Received: from localhost ([::1]:57272 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iT5KC-007dW7-NE; Fri, 08 Nov 2019 14:33:20 +0000
Received: from m9a0003g.houston.softwaregrp.com ([15.124.64.68]:46135) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iT5K7-007dVp-13
 for samba-technical@lists.samba.org; Fri, 08 Nov 2019 14:33:17 +0000
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Fri,  8 Nov 2019 14:32:28 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 8 Nov 2019 14:03:03 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 8 Nov 2019 14:03:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RHismQUAjquQlqhNsJfKH7Qx5/Z27NPccU+00aJMD+t3VMZffi4A4o9W6eabyACmdSSG9BfJZ3D0XU3F17GDvLPVE9CjKEl56krdyNQJdRi8jFUpDykcgZqw8aqQ5EivInqqok64OV+wGuFhnxaUqzQqRsXEPPZattP6I6w1+zRW+aLh/+rcVkAgWrdnj1DUMuJ/iPA9AFL60ylQpfW1uw98ZcSN8zbe3jrGwIFwLpeopP0CsruZz2oymhMB5TWlLHj6l54wNK4Jd/v8CzQ1OtbpKjspBJ9opP4G4vSeWEf/oIscs/enUk8F/VCwWVX7LTiCGQ0r9oP1Fq0WD60UNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Shm3DBtJ+prh+0sQd0mNdOQGkfVpHtxHC/8MX+5P7wI=;
 b=jDvoSFETLO96CKk3+L4GKqlk+3KO3I7aUT1id7IMb/kqLEP7b4CCPUrFg9kwggpoqKquub7/JkXRkNLQ9Grw1KWEf9ome1Ydo/G3WUvHlRwVxmNMOProjugwhdMuWNNDPZa38S6zZmnasBRYgC9UydZZtPg+91wMXUhb9+m3m6gDBJ9l2YTWv+elVOgDHH4Sgw9BRZl2+sTykqjKuahqDe17Sg+K0vCv/7YIk52+cIMFVMq82j7nEaPpm/uhLiRlzwwl8nVS4ExJ+wiskzElqUBDPEzczAAst9qQL/D9UAmbKE4ig2LtoNUQ9kT8+HpI3BmueBM0sKhP0/WwKdhbyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from DM6PR18MB2507.namprd18.prod.outlook.com (20.179.105.79) by
 DM6PR18MB2730.namprd18.prod.outlook.com (20.179.52.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.24; Fri, 8 Nov 2019 14:03:01 +0000
Received: from DM6PR18MB2507.namprd18.prod.outlook.com
 ([fe80::31ca:a807:241:adf6]) by DM6PR18MB2507.namprd18.prod.outlook.com
 ([fe80::31ca:a807:241:adf6%5]) with mapi id 15.20.2408.024; Fri, 8 Nov 2019
 14:03:01 +0000
To: Andrew Bartlett <abartlet@samba.org>, Noel Power <NoPower@suse.com>,
 "Ralph Boehme" <slow@samba.org>, npower <npower@samba.org>
Subject: Re: Converting SMB1 tests to SMB2
Thread-Topic: Converting SMB1 tests to SMB2
Thread-Index: AQHVdUNqiOZWCa16a0elHejFomZ1kadQugh0gA6wbN+AAQJmgIAARkCAgAAQXgCAB2I8AIAAAnuAgAAJSYCAAAhSAIAADaSAgAAIYx6ADoq/AIAHznWAgALm3IA=
Date: Fri, 8 Nov 2019 14:03:00 +0000
Message-ID: <f3fcbb1f-a25c-f7cb-4023-fdef68e208a8@suse.com>
References: <f0f71737-cd07-b361-1c26-58116e6e8ed8@suse.com>
 <be6770e5-5bf0-4665-4a88-3e4182e4c82e@samba.org>
 <0981db46-93bf-f153-c98f-15d5cf404353@suse.com>
 <ed7eb92f-46a7-758e-f3b5-185d71b8b98a@samba.org>
 <002434db-63ef-edad-d091-76e3efe783d1@samba.org>
 <15dfbaf6-c774-debe-b61e-c3ef4e7f9727@samba.org>
 <d9625941-c85a-a686-2162-30c80a2e84b3@samba.org>
 <fa464ebe-cfe7-1d6e-7435-c896e2cc188e@samba.org>
 <f479113c-7a74-8259-823e-4ae1c4a713c6@samba.org>
 <47fef5d6-7fb6-b054-a8c5-7a28b63e97c8@samba.org>
 <9cc9d402-57fb-3568-29e6-12284d6ccd98@samba.org>
 <f5970612-2998-cef1-dcca-40188c7a176f@suse.de>
 <361f5a38-66fb-e18c-7858-c5db6e93424e@samba.org>
 <dc95f81c-90ba-a368-9b3e-ccdcf067edaa@suse.com>
 <c25ed441eedb2a864429c0154859f2afe95f38cb.camel@samba.org>
In-Reply-To: <c25ed441eedb2a864429c0154859f2afe95f38cb.camel@samba.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=NoPower@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [109.76.44.167]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 27e7bba5-a553-438c-8ecc-08d764545d29
x-ms-traffictypediagnostic: DM6PR18MB2730:
x-ms-exchange-purlcount: 2
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zMedGwbJfWm67d/UgXoohBm61XTopoKABRR6Prs6FPnLWuk3Q7kD9ID8k/HDEofAYl+iFm/nP7yE1/l2x2zdJo0booFQDCWNw86NDWdRy17A4LVFfu9gRsG4z5Z2boZHu0cG9m2ltp87EPntW9ND1765WEhBfnHHeMn/oDTo4f40VxVfMXACmNrY1GY2dTRE2taCcMn/MSEhbnrZbbfE4BHKkEepRpuAlypYwRwbShDxADpQDzVcOI85LDnoVm/y9j5C+4PTXzKZ5+HGcafhB4lCmNJgoL0DLNg/TcEIPTdONNipo3cAjsPvrtREKgRP+iFm64CTYxMoLuGFqW4KUj/edptiODD4CfMzjLj5ictLQuFy4CO4x4mOsKJTa98YG/HTv5Ih8FWnkDPckGB/aOWyuLGLMXCeQ54ManuZymgkBZNcfdOmsT576fkdmKbTF0qYcGuXfu2pRD9t+3gdVnT5mK2EjmEnwVff9e9pK4A=
Content-Type: text/plain; charset="utf-8"
Content-ID: <81D7FDD68F9CC14C9579751246B80EB7@namprd18.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 27e7bba5-a553-438c-8ecc-08d764545d29
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MQF1jAXqFgE4B6NpQhUtKJyQNgOJ4Z0B/Loo4RV550opAaRNjimMiYKy7bZwQZB7uPGW+Gw8qgpLRHU7fgsSGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2730
X-OriginatorOrg: suse.com
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
From: Noel Power via samba-technical <samba-technical@lists.samba.org>
Reply-To: Noel Power <NoPower@suse.com>
Cc: David Mulder <david.mulder@suse.com>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

SGkgQWxsLA0KDQpPbiAwNi8xMS8yMDE5IDE3OjQ0LCBBbmRyZXcgQmFydGxldHQgdmlhIHNhbWJh
LXRlY2huaWNhbCB3cm90ZToNCj4gT24gRnJpLCAyMDE5LTExLTAxIGF0IDE4OjMxICswMDAwLCBO
b2VsIFBvd2VyIHZpYSBzYW1iYS10ZWNobmljYWwNCj4gd3JvdGU6DQo+PiBIaSBBbGwNCj4+DQo+
PiBKdXN0IHRob3VnaHQgSSBzdW1tYXJpemUgd2hhdCB3ZSAobXlzZWxmICYgUmFscGgpIGRpc2N1
c3NlZCwgZm9yIG15IG93bg0KPj4gYmVuZWZpdCBhbmQgdGhlIGJlbmVmaXQgb2Ygb3RoZXJzLg0K
PiBUaGFua3MgZm9yIHdyaXRpbmcgdGhpcyBvdXQuICBJIHNlZSBpbiB0aGUgcmVzdCBvZiB0aGUg
dGhyZWFkIHRoYXQgeW91DQo+IGhhdmUgbWFkZSBzb21lIHByb2dyZXNzLA0KDQp3ZWxsIHllcyBh
bmQgbm8gOi0pDQoNCnNvLCBJIGRpZCB0cnkgYW5kIGZpeCB0aGUgaXAgdW5pcXVlbmVzcyB0aGlu
ZyBidXQuLi4NCg0KdW5pcXVlIGlwcyBtYWRlIHNvbWUgZGlmZmVyZW5jZSBob3dldmVyIHRoZXJl
IHdlcmUgbW9yZSB0aGluZ3MsIG1vcmUNCmNoYW5nZXMgbmVlZGVkDQoNCmEpIG5lZWQgdG8gcGFz
cyBkb3duIGEgdW5pcXVlIHNlcnZlciBuYW1lIGluIG9yZGVyIHRoYXQgdGhlIHVuaXF1ZSBpcA0K
Y2FuIGJlIGNyZWF0ZWQgKHRoZXJlIGlzIGEgbmFtZSAtPiBpbnRlcmZhY2VfbnVtIGhhc2gpDQpi
KSBidXQuLi4gd2UgaGF2ZSBhbG90IG9mIGZha2UgX3NtYjEgZW52cyBhbmQgdGhlIG51bWJlciBv
ZiBpbnRlcmZhY2VzDQp3ZSBoYXZlwqAgYnJlYWtzIHRoZSBjdXJyZW50IE1BWF9XUkFQUEVEX0lO
VEVSRkFDRVMgbGltaXQsIG5lZWQgdG8gbW9kaWZ5DQp0aGlzIGluIHRoaXJkX3BhcnR5L3NvY2tl
dF93cmFwcGVyL3NvY2tldF93cmFwcGVyLmMNCmMpIG1pc3NpbmcgY2VydHMgZm9yIHZhcmlvdXMg
dGVzdHMgd2hpY2ggbmVlZGVkIHNvbWUgbmV3IGRpcmVjdG9yaWVzDQooYW5kIGNvbnRlbnQpIHNl
dHRpbmcgdXAgaW4gdmFyaW91cyBkaXJzIHVuZGVyDQpzZWxmdGVzdC9tYW5hZ2UtY2EvQ0Etc2Ft
YmEuZXhhbXBsZS5jb20vRENzLw0KZSkgdGhlcmUgaXMgYW5vdGhlciBwcm9ibGVtLCB0aGVyZSBp
cyBzdGlsbCBpbnRlcmZlcmVuY2UgYmV0d2VlbiB0aGUNCmVudmlyb25tZW50cyBiZWNhdXNlIGFu
IGFkZGl0aW9uYWwgcmVhbG1fdG9faXBfbWFwcGluZ3Mgd2hlcmUgdGhlIHJlYWxtDQphc3NvY2lh
dGVkIHdpdGggdGhlIHNlcnZlcm5hbWUgKGFuZCB3aGVyZSB0aGUgc2VydmVybmFtZSBpbiB0dXJu
IGlzIHVzZWQNCnRvIGdldCB0aGUgaXAgYWRkcmVzcykNCmYpIEkgdGhlbiB0cmllZCB0byB1c2Ug
ZGlmZmVyZW50IHJlYWxtcyB3aXRoIHRoZSBzbWIxIGVudmlyb25tZW50cyB3aG8NCnNob3VsZCBo
YXZlIGVudHJpZXMgaW4gdGhlIHRhYmxlIGJ1dCB0aGlzIGFsc28gd2FzIG5vdCBlbm91Z2gsIHN0
aWxsDQp0ZXN0cyBmYWlsIChJIHByZXN1bWUgYmVjYXVzZSBsb3RzIG9mIHRlc3QgZGF0YSwgZGF0
YWJhc2UgZW50cmllcyBldGMuDQpkZXBlbmQgb24gdGhlIGV4aXN0aW5nICdyZWFsbXMnIHVzZWQg
KHRoaXMgaXMgc3BlY3VsYXRpb24pDQoNClNvwqAgQ0kgc3RpbGwgZG9lc24ndCBwYXNzLCBhdCB0
aGlzIHBvaW50IEkganVzdCBnb3QgdG9vIGRpc2hlYXJ0ZW5lZCwNCmJlZW4gZ29pbmcgYXJvdW5k
IGluIGNpcmNsZXMsIGRvbid0IGtub3cgZW5vdWdoIGFib3V0IHRoZSB0ZXN0IHNldHVwIChvcg0K
c2FtYmEgYWQpIHRvIGZpZ3VyZSBvdXQgKGF0IGxlYXN0IGVhc2lseSkuIEkgZ2V0IHRoZSBpbXBy
ZXNzaW9uIHRoaXMgaXMNCmEgcGllY2Ugb2Ygc3RyaW5nIEkgY291bGQgcHVsbCBmb3IgYSBsb25n
IHRpbWUgOi0pIGFuZCB0aGUgb25seSB0aGluZw0KdGhhdCB3aWxsIGJlIHVucmF2ZWxsZWQgaXMg
bXkgc2FuaXR5DQoNClRoZSBjdXJyZW50IGVycm9ycyB3aXRoIHRoaXMgYXBwcm9hY2ggY2FuIGJl
IHNlZW4gaGVyZQ0KaHR0cHM6Ly9naXRsYWIuY29tL3NhbWJhLXRlYW0vZGV2ZWwvc2FtYmEvcGlw
ZWxpbmVzLzk0MDY0ODU4DQoNCj4gIGJ1dCB3YW50ZWQgdG8gc2F5IHRoYXQgaWYgeW91IGdldCBy
ZWFsbHkgc3R1Y2sNCj4gYWdhaW4gdGhlbiBJIGNhbiBjZXJ0YWlubHkgYmUgb2YgYXNzaXN0YW5j
ZS4gDQoNCnRoYW5rcywgYXBwcmVjaWF0ZWQhISwgSSB3b25kZXIgd291bGQgeW91IHRoaW5rIG9y
IGFncmVlIHRoYXQgcmF0aGVyDQp0aGFuIGdvIGRvd24gdGhlIHJhdGhvbGUgYWJvdmUgdGhhdCBy
ZXZlcnRpbmcgdG8gbXkgYmFja3VwIHBsYW4gd2hpY2gNCmp1c3QgYWRkZWQgMiBuZXcgc21iMSBq
b2JzIGlzIGEgZmFyIGVhc2llciByb3V0ZSwgd2UgZG9uJ3QgbmVlZCB0aGUNCnJ1bmF3YXkgY2hh
bmdlcyB0byB0aGUgJ19zbWIxJyBlbnZpcm9ubWVudHMgYXMgYWJvdmUuIGlwIHVuaXF1ZW5lc3Mg
Zm9yDQpleGFtcGxlIHNob3VsZCBub3QgYmUgYW4gaXNzdWUgYXMgd2UgcnVuIHRob3NlIHRlc3Rz
IGluIGlzb2xhdGlvbiBpbg0KdGhlaXIgb3duIENJIGpvYi9jb250YWluZXIsIHRoZXNlIGpvYnMv
ZW52aXJvbm1lbnRzIHdpbGwgZ28gYXdheSB3aGVuDQpTTUIxIGRpc2FwcGVhcnMgYW55d2F5LiBI
b3BlZnVsbHkgdXNpbmcgc3VjaCAnc2hhbGxvdycgY29weSB2ZXJzaW9ucyBvZg0KdGhlIGVudmly
b25tZW50cyBpc24ndCBhbiBpc3N1ZSBvciBhIHN0dW1ibGluZyBibG9jayA/IFsxXQ0KDQpCdXQu
Li4gdGhlcmUgc3RpbGwgcmVtYWlucyB0aGUgcHJvYmxlbSB0aGF0IGluIHRoZSBsYXN0IGF0dGVt
cHQgYSBudW1iZXINCm9mIHRlc3RzIHdlcmUgZmFpbGluZyBteXN0ZXJpb3VzbHkgaW4gdGhlIG5l
dyBzZXBhcmF0ZSBzbWIxIENJIGpvYnMuIEkNCnNjcmF0Y2hlZCBteSBoZWFkIG9uIHRoaXMsIGFn
YWluIEkgdHJpZWQgdG8gcmVwcm9kdWNlIHRoZSBwcm9ibGVtcw0KbG9jYWxseSwgaW4gZG9ja2Vy
IGFuZCBvbiBzbi1kZXZlbCB3aXRob3V0IHN1Y2Nlc3MgKGV2ZXJ5dGhpbmcgcGFzc2VzDQpvdXRz
aWRlIG9mIENJKS4gU28sIEkgcmV0dXJuZWQgdG8gcnVubmluZyBqdXN0IGEgc2luZ2xlIGZhaWxp
bmcgdGVzdCBvbg0KQ0kgKG5vdyB3aXRoIGxvdHMgb2YgREVCVUcpIGFuZCBmb3VuZCBmb3IgZXhh
bXBsZSB0aGF0IHdpdGggdGhlDQpzYW1iYTMudW5peC5pbmZvMiB0ZXN0IHRoYXQgaW1tZWRpYXRl
bHkgYWZ0ZXIgY3JlYXRpbmcgYSBmaWxlIHdpdGggKDANCmJ5dGVzIGFsbG9jYXRlZCkgdGhhdCBT
VEFUIHJldHVybnMgc3RfZXhfYmxvY2tzIHdpdGggYSBwb3NpdGl2ZSB2YWx1ZS4NCkNsZWFybHkg
dGhpcyBpcyBzb21ldGhpbmcgaGFwcGVuaW5nIGF0IHRoZSBob3N0IG9zIG9yIGZpbGVzeXN0ZW0g
bGV2ZWwuDQpDb21wYXJpbmcgd2l0aCBwYXNzaW5nIHRlc3RzIGluIG1hc3RlciB0aGUgb25seSBk
aWZmZXJlbmNlIGlzIHRoZQ0KcGFzc2luZyB0ZXN0cyBydW4gb24gcmFja3NwYWNlIHJ1bm5lcnMg
YW5kIHdpdGggdGhlIGZhaWxpbmcgY2FzZSwgdGhlDQp0ZXN0cyBydW4gb24gc2hhcmVkIHJ1bm5l
cnMuIENoYW5naW5nIHRoZSBuZXcgc21iMSBqb2JzIHRvIHJ1biBvbg0KcmFja3NwYWNlIHNvbHZl
cyB0aGUgcHJvYmxlbQ0KDQpzZWUgaHR0cHM6Ly9naXRsYWIuY29tL3NhbWJhLXRlYW0vZGV2ZWwv
c2FtYmEvcGlwZWxpbmVzLzk0NjA0NzkyDQoNCnNvLi4uDQoNCjFzdCBjYW4gYW55b25lIGVubGln
aHRlbiBtZSBhcyB0byB3aGF0IGlzIGRpZmZlcmVudCB3aXRoIHRoZSByYWNrc3BhY2UNCnJ1bm5l
cnM/DQoybmQgY2FuIHdlIGFncmVlIHRoYXQgYWRkaW5nIHRoZSAyIG5ldyBqb2JzIGlzIHRoZSBz
aW1wbGVzdCBhbmQgZWFzaWVzdA0Kd2F5IGZvcndhcmQsIG9uY2UgdXBzdHJlYW0gdGhpcyB3aWxs
IGFsbG93IHVzIHRvIGl0ZXJhdGl2ZWx5IHRhY2tsZSB0aGUNClNNQjEgZmFpbGluZyB0ZXN0cw0K
DQp0aGFua3MsDQoNCk5vZWwNCg0KDQpbMV0gT25lIHBvdGVudGlhbCBwcm9ibGVtIGlzIHRoYXQg
dGhlIGRlZmF1bHQgJ21ha2UgdGVzdCcgZnJvbSBzb3VyY2UNCndpbGwgZmFpbCBiZWNhdXNlIG9m
IHRoZSBtaXggb3IgeHl6ICYgeHl6X3NtYjEgZW52aXJvbm1lbnRzLiBIb3dldmVyDQrCoCArIHBl
cnNvbmFsbHkgSSBkb3VidCB0aGF0ICdtYWtlIHRlc3QnIHJlbGlhYmx5IHdpbGwgc3VjY2VlZCBh
bnl3YXkNCnRoZXNlIGRheXMsIHdlIGNlcnRhaW5seSBkb24ndCB0ZXN0IGEgZnVsbCBtYWtlIHRl
c3QgYW55d2hlcmUgYW55bW9yZSwNCmltbyB0aGUgb25seSByZWxpYWJsZSB3YXkgdG8gcnVuIHRl
c3RzIGlzIHZpYSBnaXRsYWIgQ0kgKG9yIGF1dG9idWlsZCkNCsKgICsgd2l0aCB0aGUgcHl0aG9u
MyBwb3J0IHRoZXJlIHdlcmUgam9icyB0aGF0IHdlcmUgY29tcGxldGVseQ0KdW5yZWxpYWJsZSB1
bnRpbCB0aGV5IHdlcmUgc2VwYXJhdGVkIGludG8gcHl0aG9uL3B5dGhvbi0zIGpvYnMuIFRoZXJl
DQp3ZXJlIGNlcnRhaW5seSBhIG51bWJlciBvZiB0ZXN0cyB0aGF0IGNvdWxkbid0IGJlIHJ1biBt
dWx0aXBsZSB0aW1lIGluDQp0aGUgc2FtZSBlbnYgKGR1ZSB0byBkZXN0cnVjdGl2ZSBuYXR1cmUg
b2YgdGhlIHRlc3RzKSBzbyBJIHRoaW5rIHdlIGhhdmUNCmFscmVhZHkgZG9uZSB0aGlzIGJlZm9y
ZQ0KDQoNCg==


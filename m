Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D7189857B48
	for <lists+samba-technical@lfdr.de>; Fri, 16 Feb 2024 12:15:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=Mz3Np6MukIBDbnIdmdE/FeDYnZRpZjL3aVYk9DoBchA=; b=BVonkGBHHwixGDa2vqHiBxnEYl
	F+k3f9dqGbJpDaZ6QGqIuuw7EGLSlolgjYb/DB11QJPDjptWhH+/R1IImW8T1s6+zUeLMpXk0hT2i
	d5QUpiQdeyIIhXLICHkUJCfIgKBtJo0HXp3NudMN1GMnnXddW+J61G/SJOdz0ehguXDez8FK/Hn0E
	kUn3wp/R0ErIl+SxGvoez0bKdLAN6RvwW6/aJmUHLBBcH7u2TPsELOHgXH3+cacuQnqjIFTexKcKJ
	/eOz8EzReeKefL+7InB75VTnxx4pOUHoWUwSEQmv+6znUved/fG5b/SiDvLB+IoVbCEXAM2LzRtbT
	m3UH7vag==;
Received: from ip6-localhost ([::1]:21450 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rawAp-008gbJ-Ln; Fri, 16 Feb 2024 11:14:31 +0000
Received: from mx.inno.tech ([185.228.49.205]:25530) 
 by hr1.samba.org with esmtps
 (TLS1.2:ECDHE_SECP256R1__RSA_SHA512__AES_256_GCM:256) (Exim)
 id 1rawAl-008gb0-8G
 for samba-technical@lists.samba.org; Fri, 16 Feb 2024 11:14:29 +0000
Received: from ksmg3 (localhost [127.0.0.1])
 by mx.inno.tech (Postfix) with ESMTP id 75E4F80005;
 Fri, 16 Feb 2024 14:14:22 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx.inno.tech 75E4F80005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inno.tech; s=s1;
 t=1708082062; bh=Mz3Np6MukIBDbnIdmdE/FeDYnZRpZjL3aVYk9DoBchA=;
 h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
 b=LFu22Egk7IUFRRGFniXDOpvT0iMIYorp6Z2wQV0QMblwftl+awRhz64aROT5uFwI9
 pramWOpdOodhF/dLpM07DTwKINCEDd4Q8Ui5He8YQQPYqEJPiphHxi38lW7VAzDxqZ
 jHPJOe87+gl3zEnEqIE0VT7bXP8qHF323lAgWJoYW4Yxz+Nfl79r7tOClLx6jmodJ6
 /coiEQGHFl8/du7c8nD207whp6BYSeA1FgSo86wRWO4jmPn4ILDe01EnMSHVLgYpyv
 3zQofkNE8fBXPtSaBYR/4anyDYMCwkJUq8KSzmwhpWy3cu5ErZq1YMivYXNtR/Dw+R
 ERzf0PLs2KLSQ==
Received: from SEC-DLP-QRNT (unknown [10.0.0.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx.inno.tech (Postfix) with ESMTPS;
 Fri, 16 Feb 2024 14:14:22 +0300 (MSK)
X-CHECKED: 1
X-CHECKED-RELAY-ID: 3c279d7389fa9528e53a55e18b8e1fb6328980c7
X-Cache: 20240216_141422062_00015290
X-MS-Exchange-Organization-AuthAs: Partner
Received: from MAIL-DC1.inno.local (10.0.115.2) by MAIL-DC1.inno.local
 (10.0.115.2) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 16 Feb
 2024 14:14:21 +0300
Received: from MAIL-DC1.inno.local ([10.0.115.10]) by MAIL-DC1.inno.local
 ([10.0.115.10]) with mapi id 15.02.1118.040; Fri, 16 Feb 2024 14:14:21 +0300
To: =?utf-8?B?QmrDtnJuIEJhdW1iYWNo?= <bb@sernet.de>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: RE: smbd: Broken access to share
Thread-Topic: smbd: Broken access to share
Thread-Index: AdpgH1hPuaFKQ4ZdTjar1D/HlL9lOwADG/oAACLyytA=
Date: Fri, 16 Feb 2024 11:14:21 +0000
Message-ID: <4b79869d3da4448096bc54491dcb4bec@inno.tech>
References: <c4ef9c77c4784a1898abdd266e5dccb5@inno.tech>
 <ec8cb899-c1e7-45bd-97c9-a8d57f2c2fa9@sernet.de>
In-Reply-To: <ec8cb899-c1e7-45bd-97c9-a8d57f2c2fa9@sernet.de>
Accept-Language: en-GB, en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.0.117]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSMG-Rule-ID: 5
X-KSMG-Message-Action: skipped
X-KSMG-AntiSpam-Status: not scanned, allowlist
X-KSMG-AntiPhishing: not scanned, allowlist
X-KSMG-LinksScanning: not scanned, allowlist
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 not scanned, allowlist
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
From: =?utf-8?b?0JrRg9C/0YfRg9C6INCc0LjRhdCw0LjQuyDQk9C10L7RgNCz0LjQtdCy0Lg=?=
 =?utf-8?q?=D1=87_via_samba-technical?= <samba-technical@lists.samba.org>
Reply-To: =?utf-8?B?0JrRg9C/0YfRg9C6INCc0LjRhdCw0LjQuyDQk9C10L7RgNCz0LjQtdCy0Lg=?=
 =?utf-8?B?0Yc=?= <MKupchuk@inno.tech>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

SGVsbG8gQmrDtnJuLA0KDQpUaGFuayB5b3UgZm9yIHBvaW50aW5nIHRoYXQgb3V0LiBCdXQgb3Vy
IHByb2JsZW0gc3RpbGwgZXhpc3RzIHdpdGggbGF0ZXN0IHNvdXJjZXMgZnJvbSBtYXN0ZXIuDQpX
aGlsZSBpbnZlc3RpZ2F0aW5nIHRoZSBwcm9ibGVtLCBJIGRpZCBub3Qgcm9sbGJhY2sgZXhhY3Rs
eSB0aGF0IGNvbW1pdCwgYnV0IEkgZGlkIGNoZWNrb3V0IDEyNzM0ODQ4ZGM5OTAxYjkzMjY0NDEz
OWFhYTdlM2Y3OGU1NWM4ZGMgKGNvbW1pdCBwcmlvciB0byAwZTM4MzZlMzk2MWYyYjdjMzkxNzNj
ZTEwMjNkM2M5MmFkZGVmNjMwKSBhbmQgcHJvYmxlbSBkaXNhcHBlYXJlZC4NClNvLCBJIGRlY2lk
ZWQgdGhhdCB0aGUgcHJvYmxlbSBpcyBvbmx5IGluIDBlMzgzNmUzOTYxZjJiN2MzOTE3M2NlMTAy
M2QzYzkyYWRkZWY2MzAuDQpCdXQgYXMgYXBwZWFycywgdGhlIHByb2JsZW0gaXMgbm90IG9ubHkg
aW4gdGhhdCBvbmUgY29tbWl0LCBidXQgaW4gc2V2ZXJhbCBjb21taXRzIGluICJwcmVmZXIgY2Fw
YWJpbGl0aWVzIG92ZXIgYmVjb21lX3Jvb3QiIHNldC4NCldoZW4gSSBhcHBseSBhIHBhdGNoIGxp
a2UgdGhpcyB0byBsYXRlc3Qgc291cmNlczoNCg0KZGlmZiAtLWdpdCBhL3NvdXJjZTMvbGliL3N5
c3RlbS5jIGIvc291cmNlMy9saWIvc3lzdGVtLmMNCmluZGV4IGJkYWE3MjNmZDMuLjRhZDI2NTI0
ZGUgMTAwNjQ0DQotLS0gYS9zb3VyY2UzL2xpYi9zeXN0ZW0uYw0KKysrIGIvc291cmNlMy9saWIv
c3lzdGVtLmMNCkBAIC02NDMsNyArNjQzLDcgQEAgc3RhdGljIGJvb2wgc2V0X3Byb2Nlc3NfY2Fw
YWJpbGl0eShlbnVtIHNtYmRfY2FwYWJpbGl0eSBjYXBhYmlsaXR5LA0KICBHYWluIHRoZSBvcGxv
Y2sgY2FwYWJpbGl0eSBmcm9tIHRoZSBrZXJuZWwgaWYgcG9zc2libGUuDQogKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKi8NCg0KLSNpZiBkZWZpbmVkKEhBVkVfUE9TSVhfQ0FQQUJJTElUSUVTKSAmJiBkZWZp
bmVkKENBUF9EQUNfT1ZFUlJJREUpDQorI2lmIGRlZmluZWQoSEFWRV9QT1NJWF9DQVBBQklMSVRJ
RVMpICYmIGRlZmluZWQoQ0FQX0RBQ19PVkVSUklERSkgJiYgZGVmaW5lZChDQVBfREFDX09WRVJS
SURFX0ZJWEVEKQ0KIHN0YXRpYyBib29sIGhhdmVfY2FwX2RhY19vdmVycmlkZSA9IHRydWU7DQog
I2Vsc2UNCiBzdGF0aWMgYm9vbCBoYXZlX2NhcF9kYWNfb3ZlcnJpZGUgPSBmYWxzZTsNCg0Kd2hp
Y2ggaW4gZmFjdCBkaXNhYmxlcyBhbGwgdGhhdCAicHJlZmVyIGNhcGFiaWxpdGllcyBvdmVyIGJl
Y29tZV9yb290IiBjb21taXRzIHNldCwNCk91ciBwcm9ibGVtIGdvZXMgYXdheSBhbmQgZXZlcnl0
aGluZyB3b3JrcyBhZ2Fpbi4NCg0KDQpCZXN0IHdpc2hlcywNCk1pY2hhZWwNCg0KLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEJqw7ZybiBCYXVtYmFjaCA8YmJAc2VybmV0LmRlPiAN
ClNlbnQ6IFRodXJzZGF5LCBGZWJydWFyeSAxNSwgMjAyNCAxMDoyNyBQTQ0KVG86INCa0YPQv9GH
0YPQuiDQnNC40YXQsNC40Lsg0JPQtdC+0YDQs9C40LXQstC40YcgPE1LdXBjaHVrQGlubm8udGVj
aD47IHNhbWJhLXRlY2huaWNhbEBsaXN0cy5zYW1iYS5vcmcNClN1YmplY3Q6IFJlOiBzbWJkOiBC
cm9rZW4gYWNjZXNzIHRvIHNoYXJlDQoNCg0KDQpIaSBNaWNoYWVsLA0KDQpPbiAyLzE1LzI0IDE3
OjI2LCDQmtGD0L/Rh9GD0Log0JzQuNGF0LDQuNC7INCT0LXQvtGA0LPQuNC10LLQuNGHIHZpYSBz
YW1iYS10ZWNobmljYWwgd3JvdGU6DQo+IEZvdW5kIG91dCB0aGF0IHRoaXMgcGF0Y2ggaHR0cHM6
Ly9naXRsYWIuY29tL3NhbWJhLXRlYW0vc2FtYmEvLS9jb21taXQvMGUzODM2ZTM5NjFmMmI3YzM5
MTczY2UxMDIzZDNjOTJhZGRlZjYzMCBicm9rZSBhY2Nlc3MgdG8gc3lzdm9sIGZvciAiRG9tYWlu
IEFkbWlucyIgZ3JvdXAgbWVtYmVycy4NCg0KdGhpcyBwYXRjaCBoYXMgYmVlbiByZXZlcnRlZCwg
YWxyZWFkeToNCmh0dHBzOi8vZ2l0bGFiLmNvbS9zYW1iYS10ZWFtL3NhbWJhLy0vY29tbWl0LzY5
N2Q0MTQyMGI0ZjQ4MzAzOTZhY2ZiYzk2YmQxZjFjMWYwNTMxZjQNCg0KQmVzdCByZWdhcmRzLA0K
QmrDtnJuDQoNCi0tDQpTZXJOZXQgR21iSCwgQmFobmhvZnNhbGxlZSAxYiwgMzcwODEgR8O2dHRp
bmdlbg0KcGhvbmU6IDA1NTEtMzcwMDAwLTAsIG1haWx0bzprb250YWt0QHNlcm5ldC5kZQ0KR2Vz
Y2guRi46IERyLiBKb2hhbm5lcyBMb3hlbiB1bmQgUmVpbmhpbGQgSnVuZyBBRyBHw7Z0dGluZ2Vu
OiBIUi1CIDI4MTYgLSBodHRwOi8vd3d3LnNlcm5ldC5kZQ0KRGF0ZW5zY2h1dHo6IGh0dHBzOi8v
d3d3LnNlcm5ldC5kZS9kYXRlbnNjaHV0eg0K


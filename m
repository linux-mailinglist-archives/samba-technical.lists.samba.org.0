Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF16D71F6
	for <lists+samba-technical@lfdr.de>; Tue, 15 Oct 2019 11:18:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=Ettg+9hGQ4RaYyg6AZJrL/a4boToMn15EHEewZsrIZM=; b=cOHn/qIpLFt9l2ujadIcFDzGAd
	k3rnGLrYWoq0AZHWElz6ZCklkVPAyq4Z0piyWxL8JwgZ3q3g4g2vo1h695nQ7SybqkKw/fpm5+WGa
	9dzJqkbmLBrfGc8iPv2LKU1ohgyCEuG0mpjuknkIZzrHjEzCtwQBkrnU1ZG1J4o3f9Sd00Gu5MQVi
	wEUO025Rg7te565yaBHgHPsOXQsMY7vavnBVLGBuis1oqHfZigwtd5dEsnsjSv3VdmkzA1YzpwHqZ
	nJzkavCml5seCutubGIa3XQyUgVQ0vKuAn8g0P9RwHfn9IGIAP0VloOMPHXq4Uz2rH8xVWtjyVMU2
	ghur/26w==;
Received: from localhost ([::1]:40282 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iKIxN-003q0F-0a; Tue, 15 Oct 2019 09:17:29 +0000
Received: from mail-eopbgr110067.outbound.protection.outlook.com
 ([40.107.11.67]:6592 helo=GBR01-CWL-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim) id 1iKIxH-003q08-OU
 for samba-technical@lists.samba.org; Tue, 15 Oct 2019 09:17:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hpLDTm48P0MUtORXW4c4oyqGUsUcQJMuud12cs2Gud7/pj8GVCygtUd5hRx38TG/UK0YOseUP50mhtyViaJzcDsq9+rF/839GQBAz0hR4zxDXhgpv1yKdl7O12VOpmPs3rqMls3AQ7Snusfa22EuH3w1JQkrq2Etf9W2x/KPCh8oYGCVhuZyEzxXFFIg/LeQzX3t91CVbfxKh9wA5Ew/yAwj2ddxING3VOb6HJZSXHbJvzifyTVb4H2oFOvSJPf3p/hI+j6S4MHosUJhTKP3pY2zNfgM+OcjdIvoxnutbK3Q8cR9FYldEUFbjzxrQ+gxoh2Rgaruu+2Tg4rLoZiIvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ettg+9hGQ4RaYyg6AZJrL/a4boToMn15EHEewZsrIZM=;
 b=QuF8dT+2WbPnnwjHqEd8HUsiQ08ArIHylgjeAYjywM01SIdl5mp4kvfH0T90l9T7LfbwqMzGdNyA03wR+WP/NlKP4zNqyszJIuhk4M2J1ITWC7T2Pz4XrA4BDHYEf5K/fWhajS8+6+qADuBRCK2ThlQ/Rk0mDiorrqjPcXPvLRVWXCL11NHEgJTiEQ9imJjPQS5yquNS8FgzvxcJM1LiE9duS6ZJ+u+4o4Ct1sHBgDei8Ft8Nf2l+xQFtBdVjeIa5YmAqF38y+6WfDwTF1+gLmXOOIXxLk7XxkaCpXLbK0dHZiZ/DReXPHqJgOn8zU9EPcVCHq9MXq+4K4lOCbK06Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aber.ac.uk; dmarc=pass action=none header.from=aber.ac.uk;
 dkim=pass header.d=aber.ac.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aber.ac.uk;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ettg+9hGQ4RaYyg6AZJrL/a4boToMn15EHEewZsrIZM=;
 b=gfMFXBmOs2d/bpkZal354TDjiw3OH/dzhfqEqGf8tpKQx1I3otkdKeHLRqvjYVkfHCDljJRhZ4ks7KkRZp4Znqp2HzAV73XMxzGdrCyYCUaSW7t8a2VOiHhGnVuA2LhJWoOGlcgTtkp57W74SExYTgFgXes4JefO6gK0gAKzkYk=
Received: from LNXP265MB0154.GBRP265.PROD.OUTLOOK.COM (10.166.181.11) by
 LNXP265MB0922.GBRP265.PROD.OUTLOOK.COM (20.176.129.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Tue, 15 Oct 2019 09:17:08 +0000
Received: from LNXP265MB0154.GBRP265.PROD.OUTLOOK.COM
 ([fe80::98a0:157c:ea52:a33]) by LNXP265MB0154.GBRP265.PROD.OUTLOOK.COM
 ([fe80::98a0:157c:ea52:a33%7]) with mapi id 15.20.2347.023; Tue, 15 Oct 2019
 09:17:08 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: VFS Module - "Hide Dot At Top"
Thread-Topic: VFS Module - "Hide Dot At Top"
Thread-Index: AQHVgzlR6fuNhhCYr0m4Wy7lzm/ZiA==
Date: Tue, 15 Oct 2019 09:17:07 +0000
Message-ID: <20191015101707.29c9441a@aber.ac.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [2001:ba8:1f1:280::1]
authentication-results: spf=none (sender IP is ) smtp.mailfrom=auj@aber.ac.uk; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
x-clacks-overhead: GNU Terry Pratchett
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1fcd73d5-2c47-45de-359f-08d7515073c6
x-ms-traffictypediagnostic: LNXP265MB0922:
x-ms-exchange-purlcount: 1
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ysh3tdmMmhzPO5f7FUvvdgiTBg3wXjLwcNvhrz/C94VW1195lmnXWED2BzwyCCBRgxnctAbVHE7MEA7YCOJU/CM8BsEYe6rm14B8N3SLhzaHLVCLmP7jmaX9q/v2POFoqdbLr02j7PkmhdpfsdaJGSrtMy91IwViXBLZ3dtzFJc2re1xaTwZIxmYbS1XOBmmageoqwqHsd0DIwNfimSlmn7jUb7NSjP3UQZslJvelh4GUdnKnGQXpIoAtakcHEiVMckMD1iM9fCz12JCY0Darqaa9Pgjavkh3HtqqwDA3gWFXLWoB5+aAOfkinfFH7KHU95KxJXuUdSkP+SB/8KPRfEb16fhRrqqvNueEeSR7/FTiwrfEwavvNp6NQiVI5NVSPB2b+I8nrsi4pPKsNx0rkbV+SBw/tWJaESkRUeXIDKIQFh+yuGN4r22HU7VDSD9PAUTsxiufRGatKOdOsDHzQ==
x-ms-exchange-transport-forked: True
Content-Type: multipart/mixed; boundary="_002_2019101510170729c9441aaberacuk_"
MIME-Version: 1.0
X-OriginatorOrg: aber.ac.uk
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fcd73d5-2c47-45de-359f-08d7515073c6
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d47b090e-3f5a-4ca0-84d0-9f89d269f175
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kuABOpQjOV1Ab1Y+YiAHC15QxaBNB/P6J3DkteHXNzGmuEFX3tvvcDn+/iIIkzov
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LNXP265MB0922
X-Warn: EHLO/HELO not verified: Remote host 40.107.11.67
 (mail-eopbgr110067.outbound.protection.outlook.com) incorrectly presented
 itself as GBR01-CWL-obe.outbound.protection.outlook.com
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
From: "Alun Jones \[auj\] via samba-technical"
 <samba-technical@lists.samba.org>
Reply-To: "Alun Jones \[auj\]" <auj@aber.ac.uk>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--_002_2019101510170729c9441aaberacuk_
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D2ABD7CF13C5914783829C34ABC7BB63@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable

Hi all,

I thought I'd submit this one as it might help someone else. If it ended up
in the distribution sources, I'd be delighted!

Background
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Back in January I encountered an interesting problem with Samba's
magic hiding of dot files. A piece of software was creating a lock
file, deep within a share, starting with a ".", then trying to delete it
moments later. With "hide dot files" on, the software was unable to
delete it because Windows was unwilling to delete a hidden file.

I didn't want to turn "hide dot files" off, since this would make
all Linux "~/.*" files visible under Windows (we have dual-boot
machines in our teaching labs, so almost everyone ends up with a bunch
of dotfiles over time).

So, at the time, I knocked together a very hacky solution by binary
patching the misbehaving software to use "_" as the first
letter of its lock file instead. Not a long term solution but it
allowed me to make a minimal change without affecting everyone else.

There's a full write-up of the saga at:

https://www.ty-penguin.org.uk/~auj/blog/2019/01/24/hidden/

Getting to the point
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

It seemed to me that the best long-term approach was to use a VFS
module to hide dotfiles just at the top directory of the share,
while leaving them visible in subdirectories. Using vfs_offline
as a template I've done just that. It appears to work, so I thought
I'd submit it back, just in case anyone else finds it useful.

Usage
=3D=3D=3D=3D=3D

In a share definition, add:

    hide dot files =3D no
    vfs objects =3D hide_dot_at_top

Source code
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

See attached.

--
Dr. Alun Jones,         auj@aber.ac.uk,            01970 622637
Mathemateg, Ffiseg a Chyfrifiadureg,      Prifysgol Aberystwyth
Mathematics, Physics & Computer Science, Aberystwyth University


--------------------------------------------------------------------
Prifysgol Aberystwyth www.aber.ac.uk
Prifysgol y Flwyddyn ar gyfer Ansawdd Dysgu - The Times & The Sunday Times =
2019.

Aberystwyth University www.aber.ac.uk
University of the Year for Teaching Quality - The Times & The Sunday Times =
2019.

--_002_2019101510170729c9441aaberacuk_
Content-Type: text/x-patch; name="vfs-hide-dot-at-top.patch"
Content-Description: vfs-hide-dot-at-top.patch
Content-Disposition: attachment; filename="vfs-hide-dot-at-top.patch";
	size=7662; creation-date="Tue, 15 Oct 2019 09:17:07 GMT";
	modification-date="Tue, 15 Oct 2019 09:17:07 GMT"
Content-ID: <4D6F3D97086A5845AA114B8C63E05803@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

RnJvbSBhMTkxNmVhNTQwYThkZTc2YWUwY2ZiNGE3YTc3M2JkMjk5OGRhMWUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogQWx1biBKb25lcyA8YXVqQGFiZXIuYWMudWs+DQpEYXRlOiBU
dWUsIDE1IE9jdCAyMDE5IDA4OjU2OjU5ICswMTAwDQpTdWJqZWN0OiBbUEFUQ0hdIFNpZ25lZC1v
ZmYtYnk6IEFsdW4gSm9uZXMgPGF1akBhYmVyLmFjLnVrPg0KDQpBZGRlZCBWRlMgbW9kdWxlIHRv
IGhpZGUgZG90IGZpbGVzIG9ubHkgYXQgdGhlIHRvcCBvZiBhIHNoYXJlLg0KLS0tDQogZG9jcy14
bWwvbWFucGFnZXMvdmZzX2hpZGVfZG90X2F0X3RvcC44LnhtbCB8IDY1ICsrKysrKysrKysrKysr
Kw0KIHNvdXJjZTMvbW9kdWxlcy92ZnNfaGlkZV9kb3RfYXRfdG9wLmMgICAgICAgfCA4OCArKysr
KysrKysrKysrKysrKysrKysNCiBzb3VyY2UzL21vZHVsZXMvd3NjcmlwdF9idWlsZCAgICAgICAg
ICAgICAgIHwgIDggKysNCiBzb3VyY2UzL3dzY3JpcHQgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDEgKw0KIDQgZmlsZXMgY2hhbmdlZCwgMTYyIGluc2VydGlvbnMoKykNCiBjcmVhdGUg
bW9kZSAxMDA2NDQgZG9jcy14bWwvbWFucGFnZXMvdmZzX2hpZGVfZG90X2F0X3RvcC44LnhtbA0K
IGNyZWF0ZSBtb2RlIDEwMDY0NCBzb3VyY2UzL21vZHVsZXMvdmZzX2hpZGVfZG90X2F0X3RvcC5j
DQoNCmRpZmYgLS1naXQgYS9kb2NzLXhtbC9tYW5wYWdlcy92ZnNfaGlkZV9kb3RfYXRfdG9wLjgu
eG1sIGIvZG9jcy14bWwvbWFucGFnZXMvdmZzX2hpZGVfZG90X2F0X3RvcC44LnhtbA0KbmV3IGZp
bGUgbW9kZSAxMDA2NDQNCmluZGV4IDAwMDAwMDAwMDAwLi44ZTBmMjcwMWY3Ng0KLS0tIC9kZXYv
bnVsbA0KKysrIGIvZG9jcy14bWwvbWFucGFnZXMvdmZzX2hpZGVfZG90X2F0X3RvcC44LnhtbA0K
QEAgLTAsMCArMSw2NSBAQA0KKzw/eG1sIHZlcnNpb249IjEuMCIgZW5jb2Rpbmc9Imlzby04ODU5
LTEiPz4NCis8IURPQ1RZUEUgcmVmZW50cnkgUFVCTElDICItLy9TYW1iYS1UZWFtLy9EVEQgRG9j
Qm9vayBWNC4yLUJhc2VkIFZhcmlhbnQgVjEuMC8vRU4iICJodHRwOi8vd3d3LnNhbWJhLm9yZy9z
YW1iYS9EVEQvc2FtYmEtZG9jIj4NCis8cmVmZW50cnkgaWQ9InZmc19oaWRlX2RvdF9hdF90b3Au
OCI+DQorDQorPHJlZm1ldGE+DQorCTxyZWZlbnRyeXRpdGxlPnZmc19oaWRlX2RvdF9hdF90b3A8
L3JlZmVudHJ5dGl0bGU+DQorCTxtYW52b2xudW0+ODwvbWFudm9sbnVtPg0KKwk8cmVmbWlzY2lu
Zm8gY2xhc3M9InNvdXJjZSI+U2FtYmE8L3JlZm1pc2NpbmZvPg0KKwk8cmVmbWlzY2luZm8gY2xh
c3M9Im1hbnVhbCI+U3lzdGVtIEFkbWluaXN0cmF0aW9uIHRvb2xzPC9yZWZtaXNjaW5mbz4NCisJ
PHJlZm1pc2NpbmZvIGNsYXNzPSJ2ZXJzaW9uIj4mZG9jLnZlcnNpb247PC9yZWZtaXNjaW5mbz4N
Cis8L3JlZm1ldGE+DQorDQorDQorPHJlZm5hbWVkaXY+DQorCTxyZWZuYW1lPnZmc19oaWRlX2Rv
dF9hdF90b3A8L3JlZm5hbWU+DQorCTxyZWZwdXJwb3NlPkhpZGUgZG90IGZpbGVzIG9ubHkgaW4g
dGhlIHRvcCBkaXJlY3Rvcnkgb2YgYSBzaGFyZS48L3JlZnB1cnBvc2U+DQorPC9yZWZuYW1lZGl2
Pg0KKw0KKzxyZWZzeW5vcHNpc2Rpdj4NCisJPGNtZHN5bm9wc2lzPg0KKyAgICAgICAgPGNvbW1h
bmQ+aGlkZSBkb3QgZmlsZXMgPSBubzwvY29tbWFuZD4NCisJCTxjb21tYW5kPnZmcyBvYmplY3Rz
ID0gaGlkZV9kb3RfYXRfdG9wPC9jb21tYW5kPg0KKwk8L2NtZHN5bm9wc2lzPg0KKzwvcmVmc3lu
b3BzaXNkaXY+DQorDQorPHJlZnNlY3QxPg0KKwk8dGl0bGU+REVTQ1JJUFRJT048L3RpdGxlPg0K
Kw0KKwk8cGFyYT5UaGlzIFZGUyBtb2R1bGUgaXMgcGFydCBvZiB0aGUNCisJPGNpdGVyZWZlbnRy
eT48cmVmZW50cnl0aXRsZT5zYW1iYTwvcmVmZW50cnl0aXRsZT4NCisJPG1hbnZvbG51bT43PC9t
YW52b2xudW0+PC9jaXRlcmVmZW50cnk+IHN1aXRlLjwvcGFyYT4NCisNCisJPHBhcmE+VGhlIDxj
b21tYW5kPnZmc19oaWRlX2RvdF9hdF90b3A8L2NvbW1hbmQ+IG1vZHVsZSBtYXJrcyBmaWxlbmFt
ZXMNCisgICAgYmVnaW5uaW5nIHdpdGggIi4iIGluIHRoZSB0b3AgZGlyZWN0b3J5IG9mIHRoZSBo
YXZpbmcgdGhlIGhpZGRlbiBET1MgDQorICAgIGF0dHJpYnV0ZS48L3BhcmE+DQorDQorCTxwYXJh
PlRoZSBTYW1iYSA8Y29tbWFuZD5oaWRlIGRvdCBmaWxlcyA9IG9uPC9jb21tYW5kPiBkaXJlY3Rp
dmUgaGlkZXMgDQorICAgIGFsbCBkb3QgZmlsZXMgd2l0aGluIGFueSBkaXJlY3RvcnkgYSBzaGFy
ZS4gSWYgeW91IG9ubHkgd2FudCB0byBoaWRlIGRvdCANCisgICAgZmlsZXMgYXQgdGhlIHRvcCBv
ZiB0aGUgc2hhcmUsIHRoaXMgbW9kdWxlIHdpbGwgZG8gaXQgZm9yIHlvdS48L3BhcmE+DQorDQor
ICAgIDxwYXJhPllvdSBtaWdodCB3aXNoIHRvIGRvIHRoaXMgaWYsIGZvciBleGFtcGxlLCBhIFdp
bmRvd3MgYXBwbGljYXRpb24gdXNlcw0KKyAgICBkb3QgZmlsZXMgaW4gYSBkaXJlY3RvcnkgYmVs
b3cgdGhlIHRvcCBsZXZlbC4gU2FtYmEncyAibWFnaWMiIGhpZGluZyBvZiANCisgICAgc3VjaCBm
aWxlcyBjYW4gY2F1c2UgcHJvYmxlbXMgKGUuZy4gdGhlIGFwcGxpY2F0aW9uIGNyZWF0ZXMgdGhl
IGZpbGUgYnV0DQorICAgIGNhbid0IHNlZSB0aGUgZmlsZSBpdCdzIGp1c3QgY3JlYXRlZCksIHdo
aWxlIGRpc2FibGluZyAiaGlkZSBkb3QgZmlsZXMiIGNhbg0KKyAgICBsZWF2ZSBsb3RzIG9mICJ1
bmV4cGVjdGVkIiBjb250ZW50IHZpc2libGUgaW4gaG9tZSBkaXJlY3Rvcmllcy48L3BhcmE+DQor
PC9yZWZzZWN0MT4NCisNCis8cmVmc2VjdDE+DQorCTx0aXRsZT5WRVJTSU9OPC90aXRsZT4NCisN
CisJPHBhcmE+VGhpcyBtYW4gcGFnZSBpcyBwYXJ0IG9mIHZlcnNpb24gJmRvYy52ZXJzaW9uOyBv
ZiB0aGUgU2FtYmEgc3VpdGUuDQorCTwvcGFyYT4NCis8L3JlZnNlY3QxPg0KKw0KKzxyZWZzZWN0
MT4NCisJPHRpdGxlPkFVVEhPUjwvdGl0bGU+DQorDQorCTxwYXJhPlRoZSBvcmlnaW5hbCBTYW1i
YSBzb2Z0d2FyZSBhbmQgcmVsYXRlZCB1dGlsaXRpZXMNCisJd2VyZSBjcmVhdGVkIGJ5IEFuZHJl
dyBUcmlkZ2VsbC4gU2FtYmEgaXMgbm93IGRldmVsb3BlZA0KKwlieSB0aGUgU2FtYmEgVGVhbSBh
cyBhbiBPcGVuIFNvdXJjZSBwcm9qZWN0IHNpbWlsYXINCisJdG8gdGhlIHdheSB0aGUgTGludXgg
a2VybmVsIGlzIGRldmVsb3BlZC48L3BhcmE+DQorDQorPC9yZWZzZWN0MT4NCisNCis8L3JlZmVu
dHJ5Pg0KZGlmZiAtLWdpdCBhL3NvdXJjZTMvbW9kdWxlcy92ZnNfaGlkZV9kb3RfYXRfdG9wLmMg
Yi9zb3VyY2UzL21vZHVsZXMvdmZzX2hpZGVfZG90X2F0X3RvcC5jDQpuZXcgZmlsZSBtb2RlIDEw
MDY0NA0KaW5kZXggMDAwMDAwMDAwMDAuLmYwMGQ4NDZlNjk5DQotLS0gL2Rldi9udWxsDQorKysg
Yi9zb3VyY2UzL21vZHVsZXMvdmZzX2hpZGVfZG90X2F0X3RvcC5jDQpAQCAtMCwwICsxLDg4IEBA
DQorLyoNCisgIFVuaXggU01CL0NJRlMgaW1wbGVtZW50YXRpb24uDQorICBTYW1iYSBWRlMgbW9k
dWxlIGZvciBoaWRpbmcgZG90ZmlsZXMgb25seSBhdCB0aGUgdG9wIG9mIHRoZSBmaWxlc3lzdGVt
Lg0KKw0KKyAgKGMpIEFsdW4gSm9uZXMsIDIwMTkNCisNCisgICBUaGlzIHByb2dyYW0gaXMgZnJl
ZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQ0KKyAgIGl0
IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVi
bGlzaGVkIGJ5DQorICAgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNp
b24gMyBvZiB0aGUgTGljZW5zZSwgb3INCisgICAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2
ZXJzaW9uLg0KKw0KKyAgIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0
aGF0IGl0IHdpbGwgYmUgdXNlZnVsLA0KKyAgIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0
aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mDQorICAgTUVSQ0hBTlRBQklMSVRZIG9y
IEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZQ0KKyAgIEdOVSBHZW5l
cmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuDQorDQorICAgWW91IHNob3VsZCBo
YXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UNCisg
ICBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbS4gIElmIG5vdCwgc2VlIDxodHRwOi8vd3d3LmdudS5v
cmcvbGljZW5zZXMvPi4NCisgKi8NCisNCisjaW5jbHVkZSAiaW5jbHVkZXMuaCINCisNCitzdGF0
aWMgYm9vbCBoaWRlX2RvdF9hdF90b3BfdGVzdChjaGFyICpmaWxlbmFtZSkNCit7DQorICAgIC8q
IER1bm5vIGlmIE5VTEwgY2FuIGhhcHBlbiwgYnV0IGl0J3MNCisgICAgICogZmFpciB0byBzYXkg
dGhhdCBOVUxMIGlzbid0IGEgZG90IGZpbGUhDQorICAgICAqLw0KKyAgICBpZiAoZmlsZW5hbWUg
PT0gTlVMTCkNCisgICAgew0KKyAgICAgICAgcmV0dXJuIGZhbHNlOw0KKyAgICB9DQorDQorICAg
IC8qIElmIGl0IGRvZXNuJ3Qgc3RhcnQgd2l0aCAnLicgdGhlbiBpdCdzDQorICAgICAqIG5vdCBh
IHRvcCBkb3QgZmlsZS4NCisgICAgICovDQorICAgIGlmIChmaWxlbmFtZVswXSAhPSAnLicpDQor
ICAgIHsNCisgICAgICAgIHJldHVybiBmYWxzZTsNCisgICAgfQ0KKw0KKyAgICAvKiBJZiBpdCdz
IGluIGEgZGlyZWN0b3J5IGJlbG93IHRoZSB0b3AsIA0KKyAgICAgKiBpdCdzIG5vdCBhIHRvcCBk
b3QgZmlsZS4NCisgICAgICovDQorICAgIGlmIChzdHJjaHIoZmlsZW5hbWUsICcvJykpDQorICAg
IHsNCisgICAgICAgIHJldHVybiBmYWxzZTsNCisgICAgfQ0KKw0KKyAgICAvKiBPSywgaXQncyBh
IHRvcCBkb3QgZmlsZQ0KKyAgICAgKi8NCisgICAgcmV0dXJuIHRydWU7DQorfQ0KKw0KK3N0YXRp
YyBOVFNUQVRVUyBoaWRlX2RvdF9hdF90b3BfZ2V0X2Rvc19hdHRyaWJ1dGVzKHN0cnVjdCB2ZnNf
aGFuZGxlX3N0cnVjdCAqaGFuZGxlLA0KKwkJCQkJICAgc3RydWN0IHNtYl9maWxlbmFtZSAqc21i
X2ZuYW1lLA0KKwkJCQkJICAgdWludDMyX3QgKmRvc21vZGUpDQorew0KKyAgICBpZiAoaGlkZV9k
b3RfYXRfdG9wX3Rlc3Qoc21iX2ZuYW1lLT5iYXNlX25hbWUpKQ0KKyAgICB7DQorICAgICAgICAq
ZG9zbW9kZSB8PSBGSUxFX0FUVFJJQlVURV9ISURERU47DQorICAgIH0NCisJcmV0dXJuIFNNQl9W
RlNfTkVYVF9HRVRfRE9TX0FUVFJJQlVURVMoaGFuZGxlLCBzbWJfZm5hbWUsIGRvc21vZGUpOw0K
K30NCisNCitzdGF0aWMgTlRTVEFUVVMgaGlkZV9kb3RfYXRfdG9wX2ZnZXRfZG9zX2F0dHJpYnV0
ZXMoc3RydWN0IHZmc19oYW5kbGVfc3RydWN0ICpoYW5kbGUsDQorCQkJCQkgICAgc3RydWN0IGZp
bGVzX3N0cnVjdCAqZnNwLA0KKwkJCQkJICAgIHVpbnQzMl90ICpkb3Ntb2RlKQ0KK3sNCisgICAg
aWYgKGhpZGVfZG90X2F0X3RvcF90ZXN0KGZzcC0+ZnNwX25hbWUtPmJhc2VfbmFtZSkpDQorICAg
IHsNCisgICAgICAgICpkb3Ntb2RlIHw9IEZJTEVfQVRUUklCVVRFX0hJRERFTjsNCisgICAgfQ0K
KwlyZXR1cm4gU01CX1ZGU19ORVhUX0ZHRVRfRE9TX0FUVFJJQlVURVMoaGFuZGxlLCBmc3AsIGRv
c21vZGUpOw0KK30NCisNCitzdGF0aWMgc3RydWN0IHZmc19mbl9wb2ludGVycyBoaWRlX2RvdF9h
dF90b3BfZm5zID0gew0KKwkuZ2V0X2Rvc19hdHRyaWJ1dGVzX2ZuID0gaGlkZV9kb3RfYXRfdG9w
X2dldF9kb3NfYXR0cmlidXRlcywNCisJLmdldF9kb3NfYXR0cmlidXRlc19zZW5kX2ZuID0gdmZz
X25vdF9pbXBsZW1lbnRlZF9nZXRfZG9zX2F0dHJpYnV0ZXNfc2VuZCwNCisJLmdldF9kb3NfYXR0
cmlidXRlc19yZWN2X2ZuID0gdmZzX25vdF9pbXBsZW1lbnRlZF9nZXRfZG9zX2F0dHJpYnV0ZXNf
cmVjdiwNCisJLmZnZXRfZG9zX2F0dHJpYnV0ZXNfZm4gPSBoaWRlX2RvdF9hdF90b3BfZmdldF9k
b3NfYXR0cmlidXRlcywNCit9Ow0KKw0KK3N0YXRpY19kZWNsX3ZmczsNCitOVFNUQVRVUyB2ZnNf
aGlkZV9kb3RfYXRfdG9wX2luaXQoVEFMTE9DX0NUWCAqY3R4KQ0KK3sNCisJcmV0dXJuIHNtYl9y
ZWdpc3Rlcl92ZnMoU01CX1ZGU19JTlRFUkZBQ0VfVkVSU0lPTiwgImhpZGVfZG90X2F0X3RvcCIs
DQorCQkJCSZoaWRlX2RvdF9hdF90b3BfZm5zKTsNCit9DQpkaWZmIC0tZ2l0IGEvc291cmNlMy9t
b2R1bGVzL3dzY3JpcHRfYnVpbGQgYi9zb3VyY2UzL21vZHVsZXMvd3NjcmlwdF9idWlsZA0KaW5k
ZXggZTRmOTJmYWMxNTAuLmNiNTA4MDU3ZTlkIDEwMDY0NA0KLS0tIGEvc291cmNlMy9tb2R1bGVz
L3dzY3JpcHRfYnVpbGQNCisrKyBiL3NvdXJjZTMvbW9kdWxlcy93c2NyaXB0X2J1aWxkDQpAQCAt
NjA4LDMgKzYwOCwxMSBAQCBibGQuU0FNQkEzX01PRFVMRSgndmZzX2RlbGF5X2luamVjdCcsDQog
ICAgICAgICAgICAgICAgICBpbml0X2Z1bmN0aW9uPScnLA0KICAgICAgICAgICAgICAgICAgaW50
ZXJuYWxfbW9kdWxlPWJsZC5TQU1CQTNfSVNfU1RBVElDX01PRFVMRSgndmZzX2RlbGF5X2luamVj
dCcpLA0KICAgICAgICAgICAgICAgICAgZW5hYmxlZD1ibGQuU0FNQkEzX0lTX0VOQUJMRURfTU9E
VUxFKCd2ZnNfZGVsYXlfaW5qZWN0JykpDQorDQorYmxkLlNBTUJBM19NT0RVTEUoJ3Zmc19oaWRl
X2RvdF9hdF90b3AnLA0KKyAgICAgICAgICAgICAgICAgc3Vic3lzdGVtPSd2ZnMnLA0KKyAgICAg
ICAgICAgICAgICAgc291cmNlPSd2ZnNfaGlkZV9kb3RfYXRfdG9wLmMnLA0KKyAgICAgICAgICAg
ICAgICAgaW5pdF9mdW5jdGlvbj0nJywNCisgICAgICAgICAgICAgICAgIGludGVybmFsX21vZHVs
ZT1ibGQuU0FNQkEzX0lTX1NUQVRJQ19NT0RVTEUoJ3Zmc19oaWRlX2RvdF9hdF90b3AnKSwNCisg
ICAgICAgICAgICAgICAgIGVuYWJsZWQ9YmxkLlNBTUJBM19JU19FTkFCTEVEX01PRFVMRSgndmZz
X2hpZGVfZG90X2F0X3RvcCcpKQ0KKw0KZGlmZiAtLWdpdCBhL3NvdXJjZTMvd3NjcmlwdCBiL3Nv
dXJjZTMvd3NjcmlwdA0KaW5kZXggMTAxNjBmZDM3M2MuLmFjMDJhZDMxMTU2IDEwMDY0NA0KLS0t
IGEvc291cmNlMy93c2NyaXB0DQorKysgYi9zb3VyY2UzL3dzY3JpcHQNCkBAIC0xOTAwLDYgKzE5
MDAsNyBAQCBtYWluKCkgew0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dmZzX21lZGlhX2hhcm1vbnkgdmZzX3VuaXR5ZWRfbWVkaWEgdmZzX2ZydWl0IHZmc19zaGVsbF9z
bmFwDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2ZnNfY29tbWl0IHZm
c193b3JtIHZmc19jcm9zc3JlbmFtZSB2ZnNfbGludXhfeGZzX3NnaWQNCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHZmc190aW1lX2F1ZGl0IHZmc19vZmZsaW5lIHZmc192
aXJ1c2ZpbHRlcg0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdmZzX2hp
ZGVfZG90X2F0X3RvcA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAnJycpKQ0K
ICAgICBkZWZhdWx0X3NoYXJlZF9tb2R1bGVzLmV4dGVuZChUT19MSVNUKCdhdXRoX3NjcmlwdCBp
ZG1hcF90ZGIyIGlkbWFwX3NjcmlwdCcpKQ0KICAgICAjIHRoZXNlIGhhdmUgYnJva2VuIGRlcGVu
ZGVuY2llcw0KLS0gDQoyLjIzLjANCg0K

--_002_2019101510170729c9441aaberacuk_--


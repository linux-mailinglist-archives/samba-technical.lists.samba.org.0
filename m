Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F288875EBB
	for <lists+samba-technical@lfdr.de>; Fri,  8 Mar 2024 08:42:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=qagCkvSMoBHdZ854oi4uSX8acXl/ldRvPhfbySzDuC8=; b=R0D1hN7Kn/86LOREQL5ot/HEAm
	fB/CTvPTkzhOfOJgLngIFtcB6PIVV3xmi1ZTJfdvJEUMU5LTt5KTbH8j/JrXuHm9aV7cTEHsheJAi
	7nNlx8eA5FIuCrIEMzRGd7v6payiYA6SzffomAH0t6Yw4Jzj8EfDiMGh2TL3Z11jjR/JojCOvLNs1
	uXpaXn/HDvEu6uzgk4T5rLWO7cqe1WDvQQzvdJumsKIbpgpjSwqfRAHpEicZUzZXMMSDHREgNHy4l
	HSAL4R2GlvsFJI8h+B9I1Hclzjq/dS1YbhHB7rtIl1l9Uzcg568GVhYDeC/zSf7NpGFRr7aBqM9So
	77rS79bw==;
Received: from ip6-localhost ([::1]:32560 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1riUrA-00C2EA-7L; Fri, 08 Mar 2024 07:41:28 +0000
Received: from mail-vi1eur05olkn2012.outbound.protection.outlook.com
 ([40.92.90.12]:64833 helo=EUR05-VI1-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps
 (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1riUr1-00C2Dt-Qx; Fri, 08 Mar 2024 07:41:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZInUQkdiVrNU4yUmmOhp/ZdOwJt7N86G36ZT4CaS3/F2dc57uyga7EdragT8ElO9tJLDq0SnK5XkC0PIx0L5ria7Qn5w7O+97tpMgJDVc8w06ktFdrEH2ljp80ZvW1ZYpCeiknZ/W8TEP2ghrNDJ5VXI9rngIEE2udVxBrKL5THu4I3g7XwI9h8VRwm8fut7Ys69iBDJ9TXv2JQ+akW+1LPHn4i/exb+qNzWSsHkWrZeIxDX0BeGH2MUmJosnlWnlcrCO5cAv+rpyn8WS5orlr6jpy7yyUJyjYXhaaATbiPdrpIj+n3SP0J/1R4xAlqVh+IYE/yU5l9xy1cvgqSolw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qagCkvSMoBHdZ854oi4uSX8acXl/ldRvPhfbySzDuC8=;
 b=F6aoJD+B+6dWyKf9ER/T3Nh+L09xq/bmOEn4lHYe52S/D70a9JQkT4BrftFZ+XmCVvQSHnMZ4IPgZB6EkMVZQrQrcV2dIO1++/z6RyQEP8jPIqWuKeQzqM1WiB/CkR34dl1oP9wF+lHY5YtdDSxi8AnSzo6W5FOaDFsWko8R6ewg9kmiuAMHFsTPWD6apwPaKG8fa5mKPuEq1tR2JHaq1tLoH7umnHJn6WTiL/cA1HcSFox9nY/E3UWimJvecr1ViMuoUMVzmAYEKFcyVt6d52OjwKK6j79IuBwRKaAAinmGlbjx5dSt4bswMAvAjoEDlZJ05LHylF+cg5DERQHumg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qagCkvSMoBHdZ854oi4uSX8acXl/ldRvPhfbySzDuC8=;
 b=YQHWBq9rUSNYnZyhJCFBQctRU5vfbqyUUUviMjTJRaWorRL0WUiXUaf9KCdu5sPd4zQ1eK48HXK8xd0ZoUQxrhfXZr9kTb69Bfwty1Is+Ov8qvScWEgQj0FKKDy+UiaaYHzGwb0yxK0y07W6NuzYlE3znBo8SI9hZZg7QvgqRQ0dXLz7NBlqv7syukLxOM+EibtOCAhAPDn3ptPZmmA+6i8XI8yyYeooAf3gWoPYKixt1D9mf1ceC19XH0jwykjhb0kjvTlPzzCUK4kqt13zqBGGKI0GFRUf7txkvgv/T9RoJNF7nQZIKlfFLPrJWoW6OkZz+guSVfyI4JntUOBs4Q==
Received: from DB9P192MB1684.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:390::17)
 by AM7P192MB0739.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:174::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.27; Fri, 8 Mar
 2024 07:41:03 +0000
Received: from DB9P192MB1684.EURP192.PROD.OUTLOOK.COM
 ([fe80::fbcc:49cb:4b31:c95d]) by DB9P192MB1684.EURP192.PROD.OUTLOOK.COM
 ([fe80::fbcc:49cb:4b31:c95d%7]) with mapi id 15.20.7362.019; Fri, 8 Mar 2024
 07:41:03 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 "samba@lists.samba.org" <samba@lists.samba.org>
Subject: Assistance Needed with Persistent Handles Integration into Version
 4.19.3
Thread-Topic: Assistance Needed with Persistent Handles Integration into
 Version 4.19.3
Thread-Index: AQHacSqpIaidueTP/ECi+WJw/gAE9w==
Date: Fri, 8 Mar 2024 07:41:03 +0000
Message-ID: <DB9P192MB1684DD738FE6C6B4132AEBD6FE272@DB9P192MB1684.EURP192.PROD.OUTLOOK.COM>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [nZdBA0VYjAGYht/7l4LN5ErP9qTHG2YqbOjK1q0/ikA=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9P192MB1684:EE_|AM7P192MB0739:EE_
x-ms-office365-filtering-correlation-id: 4e80c1cb-9ef8-4f12-62e7-08dc3f431b9c
x-microsoft-antispam-message-info: a3dHXtzka1bM2D7OYe3wfXxSEw17igFNqfcMlYr+mIhu/hTnRvRDTnM2Zp0TEJfs3wULRwIYABomQMyCzdDsL0T3bwW8IRvknM3VmQpgzYePJke4yKiwOBsQBObnK8ICobzhzQiAIZ9qY7jHQX/w2lMWegcYqhM3RhSCr1EmyAU91SSAOPs2AHNl8/1KlQnb3447BlZOqgUzzfyeHClcnZ08VVWIaaQFyEQYqqGTaK18b0T+W8hpR4+poAXTO09Q509XtBd6CkzjfZkYiqvh+rSjyPZRxj+Yenhfwgta30fKMHYOMhlODf/tFpNlp4oSNHuNi+ODBtLNtjxW4Yly5M031hBIGfnBHXRDd0MywSpDUEKI1vYqABeRg91dIeTFz7CWtkrxZvJG8UwubYYiCFHWuyKY9I7sAh8lyoF/6z/nHlFx/uK0cL1B2TM7iy2TgLzrAJV6f04snZHoWRNuTfetl+RjGZ+GydPdy3mRwZcPAtc184zOCL2ncDsZzoSbe5TJEFnQG6Y4AElnEzPdrLleREO5XfxRfPKmxHimpRI+8yKMKeN/Q1uQTo2CG8oY
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SkN0NHRXTWlDRWZMNEJhSmc4L0RKRHB2VkZQSWo0OTgrajJNc2Qrc05rNE5r?=
 =?utf-8?B?eklYWXMxRUszZEpKRGZWRTRBdGR1cnY0MXVNNHdDc01QTWFVc08weDA2MVZJ?=
 =?utf-8?B?djUzNUJGVTNTR3o2bFU5cUNzdVpXWWFGa2lqblRRcFA2L3h1U3JLVTg3a0I4?=
 =?utf-8?B?dms2MllsK0pwcGpqWDlCeExrd0FDVFRUd3ZIajJ0NkErU083eUZGWmJIWllM?=
 =?utf-8?B?Mm5pWFQvZmNtRDRJUnEwbnYrL1JFYXNDQTYrZnBRcWd5NkIvalZOZGxieWFw?=
 =?utf-8?B?SmROOXRqTXU3eGNlMnpURE9sdGNWekpHSEE5ekFnc25BWUNSdGs3Q0VnVjFV?=
 =?utf-8?B?cko0cTAyK2FBRVE0NDFHNkpYZTZDZkVTN0dYRDIydy9JV2dZV2d5YW83aUtR?=
 =?utf-8?B?M2VFMUFXR1ZYZEpjVGdZTTBBcEhjcGpnYkdCMFlJRTNoK21Uc0NwWVM4bnBJ?=
 =?utf-8?B?Nk5SWnFtVGdERUQ4czFZckdUNHhUV3NwaWVJLzBkbWV3TnF5ZVF2aDNScnd2?=
 =?utf-8?B?OUMrOWtPWjRKR2JZT3cxZmljenV1M01Da0hIeHliVlM5Q25ocnN4dU02N3JM?=
 =?utf-8?B?V3NDVm5sb2FpeXdpWElOeFZ5YkcySU9Nbi9NdXFvN056eExoZ0gvc0FvTXdM?=
 =?utf-8?B?RFIxTE9UQXV5Nlk0UWNvVW8yOFBQNTlmZmliUUVjU1pGU2hTbzMrK2pjUlJ2?=
 =?utf-8?B?a1RRZWhCV2pvRm9COE9aOFllek1sSnhsczF2WFNGbzZFaUZMaWNYS08wcWxk?=
 =?utf-8?B?UXBTYWZOdFVMRS9pS3pIMzk4M2d3NWdVY1djdjY2dlBEekxNTlZnazVVdTkr?=
 =?utf-8?B?dTR0STZLbnN3QkRoZVBZcWVlNHZjU3AwbFMrR0VXZ1hZbXk1Z2V2L2FicG5B?=
 =?utf-8?B?Zk9oK2lKWjc0akFnQmxyZDd5ZCt5cUJ5ZEF4UmxzV2tYc0lSWDQ2WFJXSG9m?=
 =?utf-8?B?THFFT0wvMEdWOTcxYWpRam42MmE2NHhYendtWDdyTndOR3JGNm5WM0M4czBn?=
 =?utf-8?B?MzZyaXM3SzhQNU9PWWhkYWxFeWZRc05CMmRpb2JPeE1KMkVLN05wdWZ6VG9a?=
 =?utf-8?B?QUN2M3V5ejNDTDFha0ppT252Ykx1UENmM2oxaWo5c0tPVXVwaC9hVEJ4V1lO?=
 =?utf-8?B?MUpTN3c1MXp0TXZDTCtsbU9BUWUrYTJEWVR4cFpQaUVtWTUzSVVlSjNYTGND?=
 =?utf-8?B?U2llbzBsMFNicSs2cXphcFBwaWpuWGwwcEt4VkUydGNqVzVxZjVvbWdybTdp?=
 =?utf-8?B?REQ3YUNsbWtOVkZsYUpmMDRiSGN5R0NsUC95UFp0a05laDR4VkxIaXR2OU02?=
 =?utf-8?B?QWZRYkhoSS84QjZaQnM4TGhaZVB0NitWQkdld1ZpcTJBUTNjSEp6Skw1THl2?=
 =?utf-8?B?SkxKY1V2WHd4ZHprd2JZSGMvSnJtdStZTmh6cFpDWmxERGY3RE1tZEM0R3gw?=
 =?utf-8?B?dGdqNDNDVHo5QThtTmcxc1EvbU1aRXRBdjczSXZqSFFvcEpZRlY2ak4xMzVS?=
 =?utf-8?B?Q1A2RXljbTY4M05qUWN5THE5dXBwY05ML2FvLzVWeEl0YmEzbjAwTys5WGRQ?=
 =?utf-8?B?UUorcnYxbVFwdkZZRFhqWVBzQVVJTDBBT2lYT2Q2SnQweHBIK0pDUGFwblRm?=
 =?utf-8?Q?3I+BoYvBtQ3hsoflxsbNmo1GgQxbkEZLXa/hHEKeqsso=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9P192MB1684.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e80c1cb-9ef8-4f12-62e7-08dc3f431b9c
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P192MB0739
X-Warn: EHLO/HELO not verified: Remote host 40.92.90.12
 (mail-vi1eur05olkn2012.outbound.protection.outlook.com) incorrectly presented
 itself as EUR05-VI1-obe.outbound.protection.outlook.com
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
From: chin housin via samba-technical <samba-technical@lists.samba.org>
Reply-To: chin housin <sharingfun520@outlook.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

SGnvvIwKScKgYW3CoGN1cnJlbnRsecKgaW7CoHRoZcKgcHJvY2Vzc8Kgb2bCoGludGVncmF0aW5n
wqBwZXJzaXN0ZW50wqBoYW5kbGXCoGNvZGXCoGludG/CoHZlcnNpb27CoDQuMTkuM8KgYW5kwqBo
YXZlwqBlbmNvdW50ZXJlZMKgYcKgY291cGxlwqBvZsKgaXNzdWVzwqBmb3LCoHdoaWNowqB3ZcKg
c2Vla8KgeW91csKgZ3VpZGFuY2U6CgoxLsKgSW7CoHRoZcKgcmVwbGF5wqBjYWNoZcKgc2VjdGlv
bsKgb2bCoHZlcnNpb27CoDQuMTkuMyzCoHRoZcKgZnVuY3Rpb27CoGBzbWJYc3J2X29wZW5fc2V0
X3JlcGxheV9jYWNoZWDCoGhhc8KgZGlzY29udGludWVkwqB0aGXCoHVzZcKgb2bCoGBnbG9iYWxf
aWRgwqBhbmTCoG9ubHnCoGFkZGVkwqBhwqBsb2NhbMKgZmxhZ8KgKERCV1JBUF9SRVBMQUNFKS7C
oEnCoHdvbmRlcsKgaWbCoHRoZXJlwqBoYXPCoGJlZW7CoGFuecKgY29uc2lkZXJhdGlvbsKgdG/C
oGluY2x1ZGXCoHRoZcKgcGVyc2lzdGVudMKgZmxhZ8KgKERCV1JBUF9QRVJTSVNURU5UKcKgYXPC
oHdlbGwuCjIuwqBXaGVuwqBJwqBjaGFuZ2XCoHRoZcKgZmxhZ8KgZnJvbcKgYERCV1JBUF9GTEFH
X05PTkVgwqB0b8KgYERCV1JBUF9GTEFHX1BFUl9SRUNfUEVSU0lTVEVOVGDCoGluwqB0aGXCoGBs
b2NraW5nX2luaXRfaW50ZXJuYWxgwqBmdW5jdGlvbsKgb2bCoHNoYXJlX21vZGVfbG9jay5jLMKg
ScKgYW3CoHVuYWJsZcKgdG/CoGFjY2Vzc8KgdGhlwqBzaGFyZWTCoGZvbGRlci7CoFRoZcKgZXJy
b3LCoG1lc3NhZ2XCoMKgaXM6wqAiXDE5Mi4xNjguMjQuOFxwaMKgaXPCoGluYWNjZXNzaWJsZS7C
oFlvdcKgbWlnaHTCoG5vdMKgaGF2ZcKgcGVybWlzc2lvbsKgdG/CoHVzZcKgdGhpc8KgbmV0d29y
a8KgcmVzb3VyY2UuwqBDb250YWN0wqB0aGXCoGFkbWluaXN0cmF0b3LCoG9mwqB0aGlzwqBzZXJ2
ZXLCoHRvwqBmaW5kwqBvdXTCoGlmwqB5b3XCoGhhdmXCoGFjY2Vzc8KgcGVybWlzc2lvbnMuwqBU
aGXCoHJlcXVlc3TCoG9wZXJhdGlvbsKgY291bGTCoG5vdMKgYmXCoGNvbXBsZXRlZMKgYmVjYXVz
ZcKgb2bCoGHCoHNldmVyZcKgbWVkaWHCoGZhaWx1cmXCoG9ywqBjb3JydXB0aW9uwqBvZsKgdGhl
wqBkYXRhwqBzdHJ1Y3R1cmXCoG9uwqB0aGXCoGRpc2suIgoKRnVydGhlcm1vcmUswqBJwqB3b3Vs
ZMKgbGlrZcKgdG/CoGlucXVpcmXCoHNpbmNlcmVsecKgaWbCoHBlcnNpc3RlbnTCoGhhbmRsZXPC
oGFyZcKgc3RpbGzCoHVuZGVywqBjb25zaWRlcmF0aW9uwqBmb3LCoHZlcnNpb27CoDQuMTkuMz/C
oEFyZcKgdGhlecKgc3RpbGzCoG9uwqB0aGXCoGRldmVsb3BtZW50wqBhZ2VuZGE/CgpZb3VywqBh
c3Npc3RhbmNlwqBhbmTCoGd1aWRhbmNlwqBpbsKgdGhpc8KgbWF0dGVywqB3b3VsZMKgYmXCoGdy
ZWF0bHnCoGFwcHJlY2lhdGVkLgoKcGVhY2UgJiBoYXBwaW5lc3MsCmhvdXNpbg==


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B3779716B
	for <lists+samba-technical@lfdr.de>; Thu,  7 Sep 2023 12:06:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=2LWDe6TUEJCoU50abvGkdTeQGo0TjX4I+Gx6S+CqARY=; b=PILVDvz07J/DueRclSwTLWHpuL
	JnC9kn8zDFhJcBwtadSptR2/zv2dST7sM17zW56lRin3XwxkbpLnx+Sho7ArmH0YfDbHSWweKPyxI
	WWa7GtPle7cKBwseQ77pWBG/zjvktoz1F11aonqbeAgtziUgmMFDjU6ECsA+86I4xj9otJaC6UB6s
	gE76FvtAoBhG0yOcof+SjVAq4PKmXoxGpGPr0Itt8pgyTU4J5EJSh0/R2xqLKpo//aflWAH41e5Ro
	EoU/nho19T0Z1RXMhkWHX3yHkBzruDxc95rCKr3S3E02sdIsBc70FOFjTFsgyoJndbkRLCF3ylIHq
	gnMT2a5g==;
Received: from ip6-localhost ([::1]:37390 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qeBu6-001bg7-4g; Thu, 07 Sep 2023 10:06:26 +0000
Received: from mail-am0eur02olkn2065.outbound.protection.outlook.com
 ([40.92.49.65]:63712 helo=EUR02-AM0-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1qeBtz-001bfy-Te
 for samba-technical@lists.samba.org; Thu, 07 Sep 2023 10:06:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NOHmeZPs1AO2J/bDmYtqKujZzCLzzUyz/wmawgZ6vev2C98lE9AI35mE/n5/plM+vZuSfDG/hrXPpCm7j4UxTj6frK+33RuUH0xEZcTq60UjICNVfMazKBlXMR28EG45HbC+BZFVv7z3PfEOSyuB58dVp5OD+QVJhKKVfHrf7qdhQ1hmFg3Jxi/1azuYTqiYnVyjYPEK07TFk/vJEnotQ1EoX3S46M9F3k5dRmNiD9icYkEM0995mtujbUfEI77GQjlXKQmXDJ74uqZ5lF5ceo7QKBft0FrS8SCc52tzca6bcDLQPfwAlnNlErNla+jggH666fSUD5GlK/YTnjjUwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+gwzVvvsdTecsIEia3De0MH0C93uWPzZO6+H5Mnhhc=;
 b=AYT7NONhbVzr8FiGUnbR3FEN0LKoRBB+bgvlSMiscFIBFYtmaWQEMG1hM2Ma+7wssW+JWGkeDacNka+2/zc5V87L41/UrjF13HE0Iy7Y2InRAGOYz9Fnxyo/lfdH2znl422gXwlag8qWFQixhgR+8J15Ex4ix94i/RfJAnVkSk5PKstkBC6XD3CCUJVxTxudFxhCc2O+8qxznU2aY67Iz0SPm9AwvTx6JZZKAw4ZQ0xTlAQiQpHrm9d88x8UMFQjZz48zgay/9h6sJr3yPEg4WEBdrvS2AhcnTeU5eKhqUSbrfd2PZDlMHig+LUwmGMC3SeiFNHYYZQE9QVEvpoC/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+gwzVvvsdTecsIEia3De0MH0C93uWPzZO6+H5Mnhhc=;
 b=l9gc4tv7zPq4dukc0ZQs2GKKQWODiZUQPwI8yak/bhqpoxZUn0rOqkZhs0azHjx0F7DLZ1BJRGuDPSW1HRjzLQ0CUvOH+yHqiBNv3xtWpo40hDP4fDScFgxVzX8pipR4/I7+j1T5cjvaXu/aTG16IcrVpkt9PIgrbus01QspD3qAMMfCDF6rp/f2oj/0gAMAlEx5sBWDUHEfITjNs7yPYCGfCr8RXTNB/LRcqLFDdUaeBbkyVAcQRLswB6sPVPeD+/Rpqd+VB70z/Jattr9geI5u7i4Ch63/TSZUsRPMUEZwDWUcBmRUb2XDGIUqVSjivITORpFn9zo7J9byzuEsiQ==
Received: from DB9P192MB1684.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:390::17)
 by DB8P192MB0584.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:169::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.36; Thu, 7 Sep
 2023 10:06:09 +0000
Received: from DB9P192MB1684.EURP192.PROD.OUTLOOK.COM
 ([fe80::53a6:f162:4c99:c88a]) by DB9P192MB1684.EURP192.PROD.OUTLOOK.COM
 ([fe80::53a6:f162:4c99:c88a%7]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 10:06:09 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: The current progress of transparent failover features
Thread-Topic: The current progress of transparent failover features
Thread-Index: AQHZ4W+XWhjY+Qcan0KBcBj6HWaoGg==
Date: Thu, 7 Sep 2023 10:06:08 +0000
Message-ID: <DB9P192MB1684885556BC1D4D7C063923FEEEA@DB9P192MB1684.EURP192.PROD.OUTLOOK.COM>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [BXgtgNQjuj4mQFe8dDZ4itRWrXaBDugoLsDXx/SSu6A=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9P192MB1684:EE_|DB8P192MB0584:EE_
x-ms-office365-filtering-correlation-id: 73bf869e-fe2b-4aa8-24b8-08dbaf8a0eb3
x-microsoft-antispam-message-info: 1J2wqMGX+T+CTNN7aT3wxHn9mFJtRuieD7muAnerDepD77Ktv4e9hst0xPxog4LROYpMyj/oLUF8WcDHIbjOMa/MDdBcdSa1SA++H+xzKZzrzL+wAVDf6d8rBJ+5RQy+xjJliwToE1v9NkWUAJpGfbNvfxwiMR+3fs9DCpVMKjEMqyQ13aIzWsYN8U/3xtqQx14rn5Kt58R1wVIjmgYpHRnhoASfQSWO2Zeup6IymuzP6n4xrtqF4O3ad7r2aTo3K/hNQrP5FVZHsQPquHwA1f/d2PBp93se6TVf/MPJlaiYDOVZXDULTdU5eUe/ifcZ3Rgr+uwVTwy+4eLAwl8VElXe9plvWz78sjS2KtOG/f/WVTGpQf3mY8KGQGJskQupJO7SHLtOMfMOfuKadjsGbjfBfRIzPsQGO9Num4Gw3UBZVuRhURZLLw3wBeREj27hw4rNXIj2VkCy5/FU63MH8axpzRQspdVH8JlczYDdSwnHs6uBkSRrI5875lOS+mfLXsbznLoXVC35b0W1iXZyUxMFOlbKwM+eWKziXWeD+4csVhWCtyNFYuAO1R9Ze9IDY2Xj8NlzReqNGkPlRJmBmprYtIIvLRpvUvlvp1v4hRQ=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?dGQ3QTcvNTA3UWkxTmdIV0dWZXBWakUwUHZPNW1wMHREcmxJL1BiVUJST2JE?=
 =?gb2312?B?S21ObVBxNVZhQng0T1FEM0x6NHcxdUtHb1lyUlJaZEpwRkYvUU1PaVZOZjhW?=
 =?gb2312?B?L1IrV3hmR05lMmtBcmJRU0lMTDdMZ3N4d2hYakNtcWplT1AxdFZJd2YxdlZj?=
 =?gb2312?B?YTFiUlhXT0ZyYmlFenJGQVNwOTI0c2pBa1hzeHY4NlR6bEk5K3d3RVl5YVJC?=
 =?gb2312?B?UE1ENHZ1MW1YZXhuNzBsS0N0WWcvcGZXREZseFhPMzJjNnJVb1hXL2VNclMz?=
 =?gb2312?B?MUZ5T1ZZVTlpNkV0RjZMWU11MzRmSEltdjNlUWZ6K0VhUW1zMFA2cE93aDVV?=
 =?gb2312?B?WWs2dWtSV3RtSzR4NXBlc2wyTnpkWUNQK0c0MTV2dWw1ZThIZnYwUmVaZjU5?=
 =?gb2312?B?cERSQ1MrM1ZKdzBsY2lnZW5XQWpLSnM3QWpLVEJKcXUzUkkraXdXS1FxRW5Z?=
 =?gb2312?B?N3UrcDR0NVpOY0xsRFNyem04R3QwZysvR1NiSVg5Y2lTVlFkdEVYWlBjSHpC?=
 =?gb2312?B?UkE3bXk1NHFSTlpMKzJxbktDV0o4dm9xQmx3ZW5EQTBQQU5QbHVpQnI0R1Nu?=
 =?gb2312?B?eGtPZ0NoZ1h5TDFjcTdzOU5rVEtIRjdKRkVaKzd4aU5hdkoybjlWVGZ0SkU2?=
 =?gb2312?B?bEFiSnRMMjAxV0tucVRXYlVUbCtSdmtocUhQR2ZLVVorclJNS0E3dnVXSWNZ?=
 =?gb2312?B?cm5yM0syRnE1YnFDU05oUUdBZzduRzRjaWFUcU94bFV0TkViRWdMT0M3Y0N3?=
 =?gb2312?B?WnFsZ1VVRlhaYWN3eUE0SnhCV2VhYUU1MmRjczV1OUp4dE5venFqb2Q1RE45?=
 =?gb2312?B?a3FTT3JtQWMyWGFpeThoVHloMWM0aElIMDlqYWwxUEFDWFR1V1pHVjFHWFMr?=
 =?gb2312?B?WDZsZGJMWldaSUcvOVFCTVJuclppcUtzTUdHbjlzRTREQ2VlZjk5ZXZwNjJC?=
 =?gb2312?B?SmpzM0lTS2JHSkZBV2FQSTRxWGFNTEpmMVhWbTRneXIzR2hrUXB2RGkxSUxt?=
 =?gb2312?B?QVFWbVV1aFBKS2FXOEFvRlovLzdVcUdwU3NZL1BGVk14YlNzT0R6a1RTTTVp?=
 =?gb2312?B?TkV4aGNrNUNPRnVYY2g0NUYzUHBFYnhtMlhQSFk0ampXSm9iMDFtUzUvUEll?=
 =?gb2312?B?aW51eDlXam1EZkNPMnovNERjbXVuWGhub2hSbHQ0N091Mzc5dDNxMWJtSTZz?=
 =?gb2312?B?Z1JtakluLzVXSU56ZEpVL1dlM3dVbXc0VjlBNEt4WWxCZmF6d25KUFRIUVlJ?=
 =?gb2312?B?eDhXa0h3VUp0SkZ6aUwvci9ER1VFaURrWTBPQ3UyZFlkTUNwN1RBMGF6aG9p?=
 =?gb2312?B?VzdQY2l2RlQrZWVFS1UrWlduMTFWQkhKUUNreXg2UWhhSnk3RjJxNFpGdjY0?=
 =?gb2312?B?MjdoNGtpTFJmM2cxWnptTVd4ZGhqWCtEOTMwQlUvNlQ5YVl2cTQrQXptMWlh?=
 =?gb2312?B?bnlZNUswOWRDdVJObTJsZ29QMXJnRkVPYkZUbUk2V2hwUnJjd3FTU29kYVRW?=
 =?gb2312?B?NXUvanVWTEc0QUhFQ2FJcnVYMjZ6bDUyVUZoL3ZyNzU3UnM2dUYvY0NRRFBT?=
 =?gb2312?B?N2JLcW1jNVN0aUl4eXB4QXN4MVpaTXI1ZGkvamEvWUlmKzByb21zYXIrV3BW?=
 =?gb2312?B?NlVYYTNhY0QyNm9XSkpJT2gxdmEwUVdzbGZjM05MUlRuWVl2OUZQRWRydUpL?=
 =?gb2312?Q?fDMmOGOfQza7uZz06AgQ?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9P192MB1684.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 73bf869e-fe2b-4aa8-24b8-08dbaf8a0eb3
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P192MB0584
X-Warn: EHLO/HELO not verified: Remote host 40.92.49.65
 (mail-am0eur02olkn2065.outbound.protection.outlook.com) incorrectly presented
 itself as EUR02-AM0-obe.outbound.protection.outlook.com
Content-Type: text/plain; charset="gb2312"
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
From: =?utf-8?b?6ZmIIOaWuei/myB2aWEgc2FtYmEtdGVjaG5pY2Fs?=
 <samba-technical@lists.samba.org>
Reply-To: =?gb2312?B?s8Igt729+A==?= <sharingfun520@outlook.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

SSB3YW50IHRvIGtub3cgdGhlIGN1cnJlbnQgZGV2ZWxvcG1lbnQgcHJvZ3Jlc3Mgb2YgdHJhbnNw
YXJlbnQgZmFpbG92ZXIgZmVhdHVyZXMuIFdoZXJlIGNhbiBJIGdldCByZWxhdGVkIHJlc291cmNl
cz8NCldobyBpcyBkZXZlbG9waW5nIGl0PyBPciBoYXMgZGV2ZWxvcG1lbnQgc3RvcHBlZD9SYWxw
aCBCb2VobWUgc2xvd0BzYW1iYS5vcmc8bWFpbHRvOnNsb3dAc2FtYmEub3JnPiAncyBnaXQgcmVj
b3JkIG9mIHRyYW5zcGFyZW50IGZhaWxvdmVyIGZlYXR1cmVzIG9ubHkgZ29lcyBiYWNrIHRvIDIw
MTkuDQpJIHdhbnQgdG8gc3R1ZHlpbmcgdGhlIHRyYW5zcGFyZW50IGZhaWxvdmVyIGZlYXR1cmUs
IHdoaWNoIGFjaGlldmVkIGluIHRoZSBXaW5kb3dzLCBidXQgbm90IG9uIExpbnV4Lg0KDQq00yBX
aW5kb3dzILDm08q8/jxodHRwczovL2dvLm1pY3Jvc29mdC5jb20vZndsaW5rLz9MaW5rSWQ9NTUw
OTg2Preiy80NCg0K

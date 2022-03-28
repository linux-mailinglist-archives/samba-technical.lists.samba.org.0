Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 699404E9F0A
	for <lists+samba-technical@lfdr.de>; Mon, 28 Mar 2022 20:36:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=JxIntGdPVJwFQolb6IRI2Ca1zHeALVjO+TeWxmeaaoo=; b=BUZhX4d5ppaKJPsAtXGIWfBHUh
	ooVAnqXMOeEkzrpMd/B+vdyHWGC1zJ7hkVKL3JzZ8uaAkb+Hu15mtd7GAsC/N0Rq92WDWxC4LuUAd
	Z6cED0s3uO1+EJZHw02yRduPW9OUT5vldajz0uD2fT12g+7grrFTOpDcNum4BngfB6Se0xFbLOOeT
	CxtkucKuEz8h/rk1bFwRIxhJzqkHU29HP7zZixxVrUO75YiNG7n8kpOMjm7qHBD2QgwctwggUDzHa
	fqaLuKJcCCjSYsQDiSQGeTnkxzwik9zjia5yF3WPZ+yExPXVEiyQYW9HaeeVrqRu3XDo/56taa2yU
	zeF73Ojg==;
Received: from ip6-localhost ([::1]:55556 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nYuDc-0063Zq-0y; Mon, 28 Mar 2022 18:35:56 +0000
Received: from mail-vi1eur05olkn2015.outbound.protection.outlook.com
 ([40.92.90.15]:8705 helo=EUR05-VI1-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1nYuDX-0063Zg-1l
 for samba-technical@lists.samba.org; Mon, 28 Mar 2022 18:35:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=moZJPATb8G2/uQpNTf3NR1KzRXQHcqeKBWO/EPk9iNKjQZg1EJPopqnLumyJ0icgGMmtYAbg0taOqLpmpsKF8XA0aTyr/1huPz1lxtqZcXNhdL42tt9PUgT5Yr5fvXB7TuUSipUIVt8ue80xWEusd1goma+9cBa52S+rAAm9eTVjN7jg9tbbCezzuD5Isg0XF6pd5KN2NqR3/TQRPIaKcpAaXBle5B+nGYBrYtCiPKfuHsnsGKwdnv69PwJvrTYzSx86eQU9zPttqbybwlmkTQNYV3TrWTijNtvAGNQdfIttRb4hyl4cc8jyYEuoGKyOZfXHgdmTshNcim6oImorGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PPSO2nOVM7db5+62F32kNEvQXG7pfMbiCo9ma6yvI4Y=;
 b=cDY6G60e29eida9HdpASvoMFK1mwPLkmyODNBC7Z2JqSF9zmNPbhMHcDTauYyXeYCSUQpDhtEmWTfuDAKT8Pij4wzrP0mLd2DXUyCpqMmSi4dq9RDbv5oZMeUJFShLqu3HXCc/Zhlwv2FlpN4VYqwCqwdXrcwcq8if9QBuwdD2ZN17UDbeLdXv2dOGlHbn1cyuJCMgT2i4EQT3kG0IuULAQuARJs+g/sKUFKrUKtf8nsA+LWdsY8FLRzGFsgsIt7qnXUKMJRYj4thn51dxh18Stv2c4grcKs3csD+Xj7vNe4JaCTkMq+hQs7dqz2NRC4hcjxNa08xeza9tCXzBfTLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PPSO2nOVM7db5+62F32kNEvQXG7pfMbiCo9ma6yvI4Y=;
 b=uENhh9IdUxgElEMAg3JJwfZDgpVNNUa1xagwEkt1r1eoHusNiRca/8ykyTnY7yoLbzfVckBGh4+wZ0Yzz4w5f9p9+lHPvFNiVArAtACLu+J1SPZg6NYpkj6FZ0Li89K9EdU61Ld+DACE1v2XklAEe484Xs5R4n0RyIllrCYrYtwnA2W5ZWvM6ImcMrbP2WqPWoez7X4YGfrc8CT6U2HYaz4WKMWsCsW6PfzFJr8JyhRginx771Pquu/FZgqvAdoFrpS0R+RaEHa+agGQDEBIL3NaFfjvbHWug7cqu0+xifA+4RntC83AmwCYSfGTSL6sRn8zAevLUMOTu7LCU0MtQg==
Received: from HE1PR06MB3148.eurprd06.prod.outlook.com (2603:10a6:7:1b::19) by
 VI1PR0601MB2688.eurprd06.prod.outlook.com (2603:10a6:800:84::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Mon, 28 Mar
 2022 18:35:38 +0000
Received: from HE1PR06MB3148.eurprd06.prod.outlook.com
 ([fe80::6554:406d:1be3:50dd]) by HE1PR06MB3148.eurprd06.prod.outlook.com
 ([fe80::6554:406d:1be3:50dd%6]) with mapi id 15.20.5102.023; Mon, 28 Mar 2022
 18:35:38 +0000
To: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Subject: Re: getpwuid(13891) failed Failed to finalize nt token
Thread-Topic: getpwuid(13891) failed Failed to finalize nt token
Thread-Index: AQHYPv5LdU7dCTO6eUOwRvAfLDRLZazNgjMAgAAHKHmAAALyAIAAAX8kgACIKgCAAB7UAoAACcIAgABgI6uAAgZXiYAABw0AgAMT11KAAWcqUg==
Date: Mon, 28 Mar 2022 18:35:37 +0000
Message-ID: <HE1PR06MB31482E6EAB8FE2A1FB96A520EE1D9@HE1PR06MB3148.eurprd06.prod.outlook.com>
References: <HE1PR06MB314825C38C5FED0EFE6E2B76EE189@HE1PR06MB3148.eurprd06.prod.outlook.com>
 <be695e607739913e530fb1c8a0ccc191ea8eefe0.camel@samba.org>
 <HE1PR06MB31488952C3D608E9374C7FC6EE189@HE1PR06MB3148.eurprd06.prod.outlook.com>
 <007c551a46cbad5f4e8179c156ce647891f519d5.camel@samba.org>
 <HE1PR06MB31486C485C9614D48D1B0FDFEE189@HE1PR06MB3148.eurprd06.prod.outlook.com>
 <798cdbdcc5bb1f59af4d9c7353a569dbb55036d8.camel@samba.org>
 <HE1PR06MB3148D20F5FB86CE01ED06A7BEE199@HE1PR06MB3148.eurprd06.prod.outlook.com>
 <34f8dd3498a8ca684f20291adbcfd2d7350b0283.camel@samba.org>
 <HE1PR06MB3148DC4E562D9D80E4C1C459EE199@HE1PR06MB3148.eurprd06.prod.outlook.com>
 <HE1PR06MB314896FC47360E9341A3710CEE1A9@HE1PR06MB3148.eurprd06.prod.outlook.com>
 <f1b560f93cd46cdbabc5c485ad8dfa1ba25585b0.camel@samba.org>
 <HE1PR06MB3148FEB96E249CE728C6325BEE1C9@HE1PR06MB3148.eurprd06.prod.outlook.com>
In-Reply-To: <HE1PR06MB3148FEB96E249CE728C6325BEE1C9@HE1PR06MB3148.eurprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [/ry1XmbKD/mcdIvkxx5p0CQgyayVW1HL]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c817c56c-6a7f-49ff-d449-08da10e9c139
x-ms-traffictypediagnostic: VI1PR0601MB2688:EE_
x-microsoft-antispam-message-info: XzzQE3a2wQ3hRbL7R/zCroRRm055p0kObG9hjWwuKoBySfPNiY169v3LWAPsdM8gdJxKMB2I/yMGsedIokPjj/fq2oUVxRurtiz8iaENSOJiwhoePTTnadQ/UbGsnTmSKIIkrxj4Horiiu/SZ6XFhFv0C3FD5hREI/2C6XSOJ+lf291v6pq6sjlXBxfyepeIiznq5xf8XbPM/hHXw8nd/tTmdxsvBORldEtf1DucfdPkTzB/FrVTsijrLy/fVbzJmUT/fFVdDwnWwxxkUCjnOHkourHfzv//PTl81gXAStK1OXitdz1Ms+F7+bhM84106GozmfJ14Nungj8f9AlOpY6+J4zIDl+Mo7U9i3rSf/v2TFobvUj7PzeiAKBVxTS40y7IQGMOb4RhSW9L5AgmTJEe0TNYYwILDWV2+nBdIqdKrzqfC3a6XzUzPe9QqO+6jBs+Ef1xWjdphvdQ4SPFhDgR5Xg/DB7TaKO53e0y1DDC6J+sG1g6C3yASoKjpSZYsZWKYA0Y/lCHo98JjMpZ1+R5CIK6N9xXutzTD6oa5QF+ZehabDM7CIbxYcGsj+kaLHfW1O8rcrjoDDi6M/W/3g==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HwMMOUKNnp3j3e+QpjztOc91I2A4FbZSFU0/4n1FAb3CrmVi2aSvF/09Leid?=
 =?us-ascii?Q?JqT8w7Mw/02vvabI8faCI4vdnB7RQI6QEVpxnGe6Dj+ShqaOWpClCuEiCARi?=
 =?us-ascii?Q?H4r5LTVWwzNnjH3TdRx68i/s9xlAamxfaeXEgPNsJYIjhnSUkK32eRvQA4rF?=
 =?us-ascii?Q?acjwBcJ3wIK3neYDTy7k+L8G3mQjrq0Oxz18v7X+lVqZSOmGcS6lvErU6nuj?=
 =?us-ascii?Q?NpBh2p3pBqdtuISyAaeD8QiS3nyvZzSYQwzsJZt2Tmp5b975oEmGG3e6ubTq?=
 =?us-ascii?Q?BPLpSnHTH73Jr/yg99r7nXhQcT2csIyBAedpvTq7yhBu7OaO9nOw4CpD0lf7?=
 =?us-ascii?Q?eXy1lL2HZSTpM2eIWu0dw4jM4LRu1tXtsSgZeAt/F79MnVVAFfqrFU/jQpQ7?=
 =?us-ascii?Q?HON+2mY++IIndjLbcQDvOl4zZTX5ACEdIQNQpmImz9FPs86zi7lpe+LQynt5?=
 =?us-ascii?Q?DzcFJS0dHBQkvYz8A7w5O4VjBiGTjTCAs+vxRFPnrifwPUQeBLmFNcy9hxT3?=
 =?us-ascii?Q?V2yRjButhpxSfybmoMisvU49bOU1RhDLfBEdtw7oDW5KW1nelQc35ToqZwSJ?=
 =?us-ascii?Q?x1JCwdog7XC4G73R9NLEQEpcfLJIVKzviwebd2M1y4+lwBrWXE4O3CivySOp?=
 =?us-ascii?Q?q5WyOd7Zod59moZ1sktcVbtpeIltVlBBc9FHgiwL4pyz8YpOEPW4ZU3pTDkv?=
 =?us-ascii?Q?CCDdYRlkycj8WlLocDThO0JcQz23qD9iOh6TygGLemoWhdv2KTH4V/DPyViQ?=
 =?us-ascii?Q?FW2udj2sTYl4FuzoKbk2SU6hD12ZnPgT0ZNOKHO4Q6m7X5aVXTgeYO2yFyDq?=
 =?us-ascii?Q?LTE/qnYMa0RmH/Kc8J6YjywCHC8lLLruB3J9n2/wJcF3Ht9OSDXRoM9XM85/?=
 =?us-ascii?Q?zyrHd0wLRYP6pLDF0zK0Yc5ezGshKUU4yqGqzJoc71Mf25l5pLFCuiXBFrmb?=
 =?us-ascii?Q?PTsU5MVBxY7uKM+zJC5BQ/iOEJjgm5RUhV8GDfpxy7/vfPb+nBQV4zmQud2G?=
 =?us-ascii?Q?XZhsdU/wHZXk4qARjABfJjmr3jrjsRsEVoVEay9eK4CfK3ZHERNfx06IlCdw?=
 =?us-ascii?Q?5jp77xdamAvrpWH0H9WvJOsCtuvskg3aVR2G/7bTrU4892o5ihrj9fmcBKnf?=
 =?us-ascii?Q?EFA+3V6MjHYi+V10Y7bnGX2YxePgICIdWpx1Pt/hlie8CFRGeElhKnHX7k9i?=
 =?us-ascii?Q?TWNKW0b/D2l2ubZNd0lbIC0YnIUcUr5tm3UnOz5WqLKT3+61e5jjyh8Ge4HO?=
 =?us-ascii?Q?Wdb3xmNYVUUh5ns3P6RcWRxuDNuwCy0YCkXNrkVg+JGpUC3Wd9/nJbtuj3Qr?=
 =?us-ascii?Q?CTsXhdisHLGawRI5fg3iWvFQRHqRs/j2/eyV2Lvj/unFBWvLXJ0TyDbvpCHp?=
 =?us-ascii?Q?29FRhM3Lf3scSbvexgnVuVdgPnJp9ErNjM4DmaGmYlrsz9xKBwYXMsurlN0F?=
 =?us-ascii?Q?LXF3IhSQHGk=3D?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-6e454.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR06MB3148.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c817c56c-6a7f-49ff-d449-08da10e9c139
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0601MB2688
X-Warn: EHLO/HELO not verified: Remote host 40.92.90.15
 (mail-vi1eur05olkn2015.outbound.protection.outlook.com) incorrectly presented
 itself as EUR05-VI1-obe.outbound.protection.outlook.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
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
From: capricorn cap via samba-technical <samba-technical@lists.samba.org>
Reply-To: capricorn cap <cool_capricorn80@hotmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I am not getting to any point on this. Quite strange thing that I have all =
the troubleshoot commands working yet users have issue with accessing their=
 home folders.
________________________________
From: capricorn cap <cool_capricorn80@hotmail.com>
Sent: Sunday, March 27, 2022 9:13 PM
To: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Cc: Rowland Penny <rpenny@samba.org>
Subject: Re: getpwuid(13891) failed Failed to finalize nt token

Thats strange then how is samba share accessible to Active Directory users?
Yes we data on new server but its not in production for Samba yet. It does =
run some other application and I cannot upgrade it.
So thats why I am trying if I can make it working until we upgrade the new =
server. We need a change management and down time for it.
Can you suggest anything in my scenario?
My new server also has NIS the only difference is that its using ADS as sec=
urity.
________________________________
From: samba-technical <samba-technical-bounces@lists.samba.org> on behalf o=
f Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Sent: Friday, March 25, 2022 10:09 PM
To: samba-technical <samba-technical@lists.samba.org>
Cc: Rowland Penny <rpenny@samba.org>
Subject: Re: getpwuid(13891) failed Failed to finalize nt token

On Fri, 2022-03-25 at 21:46 +0000, capricorn cap wrote:
> The old server doesn't have winbind in nsswitch.conf but I can see in
> samba documentation its stating to  have.
> passwd: files winbind
> group:  files winbind
>
> My old server has
>
> passwd: files nis
> group:  files nis
>
> Does this make any difference?

Yes, this means that your old server wasn't using Samba for
authentication, it was using NIS (also known as yp or yellow pages)

Is there actual data on the new computer, or do you need to copy data
to it ?

Rowland




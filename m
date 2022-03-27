Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AE74E8A2B
	for <lists+samba-technical@lfdr.de>; Sun, 27 Mar 2022 23:14:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=Huf1syb33HXKpdMNmqS0j5n1EAhPQTzw1Pym6NtouYc=; b=bBKMoWanyrQGTxTY8UFw12lOyb
	L0XBkKrpDaSY53MCTnE9l54bNgY/8F2cb4DuCBIWdX9vQLeVf2ect2wrNGMIw9gTojkeMbTS5AGaA
	d65dz9eImwZQoPrE9XtW8UBU0uU/2x6Tis1p1oQHLEmX3E5qo27VlLc50voASyG0ECH6RZqklLGtR
	jR60pstKbEV6nW/U/4TF6Cyf8qah+zcLWNsekKmiaalIDhT3d8Uig1nGMKDTNK7fp4u1HLDt6R+Vo
	ZwQ0NJ8h0d/QvPCmR9x1WwMu21Rg5AJDw7M51kS9BOV9IzOAAkJnaU4OdH9CqGTWGRWdLGN/zc/tg
	+I+IbQiA==;
Received: from ip6-localhost ([::1]:21220 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nYaCb-005kJ4-93; Sun, 27 Mar 2022 21:13:33 +0000
Received: from mail-vi1eur05olkn2054.outbound.protection.outlook.com
 ([40.92.90.54]:62209 helo=EUR05-VI1-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1nYaCV-005kIv-SJ
 for samba-technical@lists.samba.org; Sun, 27 Mar 2022 21:13:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dq7D6URPN1QSLa3TSPMiCQPcqPDPLiC2Cu73pn1njY44e5/gd9xL6gVgeCVsoDQ2vST1rDRf9yZUvX3v569myhTv9c0nVDAG1q8mRVdjXbqnHxaEGpfZ8JqxjbZtwu0nLf9vN8vyImowzd23UponGa0VwKf82bXZkMlqxC6DVCmgXXTd676Cccn2lqeq0mJoIiVc0m3DYs+Ye7sFLSyKbyAsNBTER+WpTV4NMxpOQ7r1HtlmA6scOr2hUKAB1dcXm4VOt2JVgvTNa2g9Y3RP6LUP5FV2xpv1n918htZt5QhwyTFJzFHvOLs6tp54xWHb94xdLBFmXv3VgELJSG2cWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s87dy80dxLCuLke39fSKchVqr/pVn0jN/AX34k5uvw0=;
 b=GtGFDKUhMyzuvP5Zj3WCK6geob/7poWJRxkLNUiVG+pZNNnAmkZ8zwYQeng00Y15/2F6Lv+giMcUWK2jBB3wuMqeUc6UODodwrzRz56PC+cayWkLIOy3+Q8WXLU9KOuZY1HMti4/5uwuhbEnm7haxcteJLx+YWOBu8YtNu6a9NF34Q1dmrsLxKzgI9MNnSumpvX+BdkhCEASZvTByiN0zVVe1O4USL+t4FC0UU7+6w0FrOlhzyJyYUwMD5n7nrkIRC+XdDbPAB7lTicqvv9SWkIqyl5wpilpEFtoTBRmJLodrak0AeSV3IWCHptJ02FWA/m737aj1wQwfChNx5gHCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s87dy80dxLCuLke39fSKchVqr/pVn0jN/AX34k5uvw0=;
 b=ZMo6XvhFC/TApre6fXpVPkCBah6P8cj7I80C03kuhkfvpYYUDGbhzdu4buno50cSrDdrd3ge17ay6Yt/nzyPMZx0usVKtGztD+O0ZNPVHN0hxx6+qcvCXI0yfj8TacgY2L+JH6XYhMX2l0XLatcluBa8mkwIuX58gusSuYxN+6MnGXEqyj8wehI3V+g5PGRC6ofn+YsfAUIw0Df7FStMU3MlkeQi4i6NvHLIGqdFHNd8WMo+MN4tdDi5q3dl5s4qxVFmSYzqD+Vtg3fLF6ZtQ4PjKs9yYlf5/rg9uPhlDxgAxF9vMdGD7htdbmyST2+qWIlOmDAPfqusVao/jM6wTw==
Received: from HE1PR06MB3148.eurprd06.prod.outlook.com (2603:10a6:7:1b::19) by
 HE1PR0601MB2569.eurprd06.prod.outlook.com (2603:10a6:3:52::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.16; Sun, 27 Mar 2022 21:13:11 +0000
Received: from HE1PR06MB3148.eurprd06.prod.outlook.com
 ([fe80::6554:406d:1be3:50dd]) by HE1PR06MB3148.eurprd06.prod.outlook.com
 ([fe80::6554:406d:1be3:50dd%6]) with mapi id 15.20.5102.022; Sun, 27 Mar 2022
 21:13:11 +0000
To: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Subject: Re: getpwuid(13891) failed Failed to finalize nt token
Thread-Topic: getpwuid(13891) failed Failed to finalize nt token
Thread-Index: AQHYPv5LdU7dCTO6eUOwRvAfLDRLZazNgjMAgAAHKHmAAALyAIAAAX8kgACIKgCAAB7UAoAACcIAgABgI6uAAgZXiYAABw0AgAMT11I=
Date: Sun, 27 Mar 2022 21:13:11 +0000
Message-ID: <HE1PR06MB3148FEB96E249CE728C6325BEE1C9@HE1PR06MB3148.eurprd06.prod.outlook.com>
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
In-Reply-To: <f1b560f93cd46cdbabc5c485ad8dfa1ba25585b0.camel@samba.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [qAtKEB/Zn8CTaih6o+OIh5s6ucouBdFp]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0bfd7bff-df73-4187-ca38-08da10369961
x-ms-traffictypediagnostic: HE1PR0601MB2569:EE_
x-microsoft-antispam-message-info: H/bOVvBuAQDSzoNYbV+iB11ToaSptjwm598wWZYIJHC8/MA9PCMdMNUh9VPE15jEi8m/lpfwmxEReIyxm5wnSlFt7GiFUj4P3M8qqNxJyzX+zxmGxbFo2oCe9JiX4J8+zZ/8wCH3gmAQj6OOjRY3Cd3pEL7ftSu9CPid+07rp22wazlaK8So0OjIMEW9IozV/dxoFFs0w0Siz/D7I6s12fAiuwASR2HPX/fm5xOJFV5WypjNPVwJS8J24htWozde5tnNPH3LknEaxPazt6+lgqscDEuJ/3ITIMhxTR2KjFt7fONYq5IYDqufLWZ4d7NxTg46L77B0GJ5oMr+dZ760niDPyWY4pfFjhKGJzzEVE5H2uu2WIKiK5/pxc0Eq/MZ3naZnIcBZ3cD0Al6PTQuhARnsVH9QNSKDagjp8XU433XVeTiCkUPBOhPajHDHvBFJlLiZj3CaZremroWY/64iipfKlNKSCgr1iOj/Xsls2O89iiz1baso0icR903IeEBAFxVLVVuhZ6OO++IP9o0grv8HizOqIjMbXbF//sqfK6hMrAMHcwJ6KPBIGtipCjcmT4xssZk5De0M41x9DoFzw==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kALPu5v4Ttz0rt0wpwNbmv5vlgmOK6bu8E3qUSF3GClFtBfWCCH8vD9eF8pX?=
 =?us-ascii?Q?aAnqrmPbf0ZmoZU4TAJ/j4UlLWEmjAhA7ELmfAq3prUSwu15Yh+dapYuAVXS?=
 =?us-ascii?Q?SCjplodcdiAWcHEWCccN/b3J50M7hlSg1ISi/1wwi+/zqv6UKE2Bhs6LgVXm?=
 =?us-ascii?Q?YjHZqcfOYNftfXBOcCU5BMEE0OgZ4UuhZUB7adUlyB/M7IupjkyXIfV0+FNq?=
 =?us-ascii?Q?n50Fc5RIsPJ4fPIW+o4WIwqRMG1heGzerWQDm0yrcTm/rnWQVc60R20TNtgU?=
 =?us-ascii?Q?lcHI4M0tcb8tyFPD/M8SEKyEQWi4SlepKkJNIa1bKVPMlKwAeuj3zcrWtpd2?=
 =?us-ascii?Q?XFOBouFCTkbH68ynCwY9PT88EGOFU5FL6qkS63wn7IESRGZ3grjNILga4+fx?=
 =?us-ascii?Q?EcfdvdiFpWsIL5UXIk1pcCYkpZjqSOqdlvVnGRcI2BmCYSQ13rXZr/2bPhrA?=
 =?us-ascii?Q?J8uUQolB8XuPR/FUlvmBfNJys3JS5LkRs0YP+0Uw/Vr9B9jK25A8mOW4Hy1J?=
 =?us-ascii?Q?DgTwBLJSerTSR57HmgZ7TsgiAjY1Zis+O7bgLvfrs7OEls97aMQnp620yl3z?=
 =?us-ascii?Q?xu7mKKffGlBdXIQGcfxcFyDVvTj/ShqHB2xresk21oeJIR/RXRx1oT537rtj?=
 =?us-ascii?Q?caequx2uNuseYZu2HHnHak4cukznpupTZ/ZLESqeLEVGYrg0F0cd+a7FOORD?=
 =?us-ascii?Q?9wxylKYHW13mzPN9nTtMlOCYIkUzAa11KyQ/BHDMhS5qyS3R+ohi6rt/ySz2?=
 =?us-ascii?Q?PI/ccwoH99HhW3anAjqfQqTtdeG/2uHKHb/zaYk2jkAEDwbylplaeh05B7x1?=
 =?us-ascii?Q?LnWzZhFjpb6m4haYNuzLg2/gAGa0dcKAdBzlE3emnU7yn2J754D/1PRfTMa0?=
 =?us-ascii?Q?Y3MrFUtDNeeQaMKy5vNoMjz9q3qMLPZ9TKwieviOXweCJJmDOnSn4pZ19J3i?=
 =?us-ascii?Q?1RYuHrVk+h+RA9q4JVg6bJnv+QjG4/1A4SbmdCrf5zrXatFoW290sl4ox6WH?=
 =?us-ascii?Q?QMSG71m1hLnFfcoKeOywdSYMv0lO3arb2cstM870nMPDArIDDzobSwpSMAGt?=
 =?us-ascii?Q?2bGmlAZbC5fIXKkUFZZJxylYwBRWCv4rtLJLqUAcmTqQVGWBhAOAzRQ8Pdn8?=
 =?us-ascii?Q?w+14uAwSbHr/TJ/tVwbsGlnTuck/6jpDb2JWuAox/sxrndSc3Xa05tVUe/e9?=
 =?us-ascii?Q?5NauAT4TptnEvTd3NSIMIzX6747U6LBfKIjQWB3h1XlWwmCe9sBs7SC+Zqve?=
 =?us-ascii?Q?oH7nAPT5aDYkqn1mOEAl1JnQNjQG4FKBlvQvxiNM/B0W++eKapBflcooilCt?=
 =?us-ascii?Q?3ZdH0sQUs9qRdeh0El2l/T2bPaykEXHYAbKWeNRY4s0zP7UByjGX8anA9FIb?=
 =?us-ascii?Q?h5901zQmchaHXxQAqD8J0f6Zcfe7fAjcrNMxmA7pKenZNHfH7RhUnWm40HiA?=
 =?us-ascii?Q?5/YGojR+H3I=3D?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-6e454.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR06MB3148.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bfd7bff-df73-4187-ca38-08da10369961
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0601MB2569
X-Warn: EHLO/HELO not verified: Remote host 40.92.90.54
 (mail-vi1eur05olkn2054.outbound.protection.outlook.com) incorrectly presented
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




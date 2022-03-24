Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 662AC4E6061
	for <lists+samba-technical@lfdr.de>; Thu, 24 Mar 2022 09:33:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=DW0qqWaeRoC1rigDL91cs7nEK/8h3fgeiB+AUf1shws=; b=z8k7NYMZcu0A4lLSOXza4s1Ma3
	jz3eAbEIFFdqlFCcZMdf4vhC2QrdI8iKTGCphs1BOCNzilXg5VYB1RvfAZVe5n12lhTgjcwlEaqgE
	CAq0p2mW0epUjkiRKW8QpsUToGvBLXT9SLXRcre4Kxk1qStMCRcUBwXZ+2TV0EQpCfIjGK6WN75fE
	B8PRaCDAqn/olao41AyYBKoV4ibO3PcOZzHU59485x2c9WUT6ene+OE4hh2i0CzEklswPE2CR8agI
	FYcE+IiNBGeCBPWcvAURIvXIPJ2nEcG0dkRmmBsD1v8NeqsaPItdhgf/r4DxRE0VyU8iHl3pCBPt+
	aL+Jfl+Q==;
Received: from ip6-localhost ([::1]:22820 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nXItr-004l5W-MN; Thu, 24 Mar 2022 08:32:55 +0000
Received: from mail-db3eur04olkn080a.outbound.protection.outlook.com
 ([2a01:111:f400:fe0c::80a]:16751
 helo=EUR04-DB3-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1nXItj-004l5M-Uz
 for samba-technical@lists.samba.org; Thu, 24 Mar 2022 08:32:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jX0buvCGB4uRzKFZy1VtTKq/iUUV92JxRHPCcUycmrKyxRHabimATsocmBMjtoK7nanof8SkF4y/FP7AgP4+mZQB4AFQ1tI0llTgsTHK+bntiOU1uRV4Rm9EpPDTTMFsffs3U1Qb8nlTxPYuHzaDUrAPiIy6T9fVuBr9VqwDfYfI0/6VFZZ4rUgqB/NvzYL2zyG7AbMr2YWRE9uzOPTU5yDWQBRJdppuTlSpBKcwAYrH3Yf9qQPh/XotuREjBg5QuOIpeh2rKStHzPe79dCQn+mKA+4gTzmnnRzCug2Ve5p8B4MYI3lt9UUgQm6PzGoLtPgUDOF5U/uo252mb+vjSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zNEJSDL8rKNTKMVcyQyiKY5nJ1gRRiKfHPR6Vh4wlL8=;
 b=ZgoSChnu1FnWBkpjVmdmNMAkIQbdiCu1Jb/HbJtDlHkMUiPxjx2MJJ4IsQ+OKnSd5k69sC/hi/bv6wewVYkX60N4Bd8xZzabRJGldYjqZg/L35QEYtTuLVfld9isKqbEMryKx7JRdnGUVLgcIOilwULq3or2mMKuo1rUydnyiop82rUe3HSFi9rjbbftrTw73JhWUrehcDYYn8y4NZRA/T8cxaY4/AZU3V70l5Tiw/V47wKyaZP8Orrc/hHlss7FquKD0ZnbZGTph7Jk0wFJBw/O6jXDbMBrV4S+XjbmYLo0bfA9wcJjLrfM4Unm0NKhANuTTNh+vkvgE3Lm7VMRmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zNEJSDL8rKNTKMVcyQyiKY5nJ1gRRiKfHPR6Vh4wlL8=;
 b=l+jcEjTUMA2RjJk3tDEvvWP9BWOyzL41LQdVyKq2vOUOq3XYSXgX/atMmSNPy3w3nSz3Lo3bvO7AwO1yzo3kfj9QHeguSZLaKveVnrDFjCSnlkUDt/YnYxVYW+m1ZZnBvpiClkO7Eryq+8yDr2/lt1aCi9fJ/irD5dHTTESaSYRFdSux4dx6GcsJQL/iUAiQW0IxKxvvaCXCjEfOifqF9i/RWySlApB/oF4PYj/NipinfIWLTjk3aZrka8ATTThdIuaygw3wEY+XyT1PdsFfTx5T7rObkjEjF2xtaIWr/qDekT+hCWJ1BSXdDVCANWIvt4MXCiJ1PvDmgKglk/NgwQ==
Received: from HE1PR06MB3148.eurprd06.prod.outlook.com (2603:10a6:7:1b::19) by
 DB6PR0601MB2326.eurprd06.prod.outlook.com (2603:10a6:4:1e::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.17; Thu, 24 Mar 2022 08:32:35 +0000
Received: from HE1PR06MB3148.eurprd06.prod.outlook.com
 ([fe80::6554:406d:1be3:50dd]) by HE1PR06MB3148.eurprd06.prod.outlook.com
 ([fe80::6554:406d:1be3:50dd%6]) with mapi id 15.20.5102.018; Thu, 24 Mar 2022
 08:32:35 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: Re: getpwuid(13891) failed Failed to finalize nt token
Thread-Topic: getpwuid(13891) failed Failed to finalize nt token
Thread-Index: AQHYPv5LdU7dCTO6eUOwRvAfLDRLZazNgjMAgAAHKHmAAALyAIAAAX8kgACIKgCAAB7UAg==
Date: Thu, 24 Mar 2022 08:32:35 +0000
Message-ID: <HE1PR06MB3148D20F5FB86CE01ED06A7BEE199@HE1PR06MB3148.eurprd06.prod.outlook.com>
References: <HE1PR06MB314825C38C5FED0EFE6E2B76EE189@HE1PR06MB3148.eurprd06.prod.outlook.com>
 <be695e607739913e530fb1c8a0ccc191ea8eefe0.camel@samba.org>
 <HE1PR06MB31488952C3D608E9374C7FC6EE189@HE1PR06MB3148.eurprd06.prod.outlook.com>
 <007c551a46cbad5f4e8179c156ce647891f519d5.camel@samba.org>
 <HE1PR06MB31486C485C9614D48D1B0FDFEE189@HE1PR06MB3148.eurprd06.prod.outlook.com>
 <798cdbdcc5bb1f59af4d9c7353a569dbb55036d8.camel@samba.org>
In-Reply-To: <798cdbdcc5bb1f59af4d9c7353a569dbb55036d8.camel@samba.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [Sq0K3Fyt7NQxXs7KlAIf1MS/V027jmuY]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 290d4218-a418-4dd0-c4aa-08da0d70d93f
x-ms-traffictypediagnostic: DB6PR0601MB2326:EE_
x-microsoft-antispam-message-info: w1LZRr2TOo567hLML2YV5iDRdUO1kEtgI0qx85vGDAGP2VPbQynotKCZvO8jO6DXLxAjgqVs/fxKXdk1goVPV27A6Z8yyetUQkt9I7cGW2khYeWnuXrqfXd9PM+EnGW764G4US0Q2ioNiyGH3JV3VuWXW9o3uW+xqyCYRFlwjEak5zmds7jIv0wHEWQA9JJ4M+YEm882/4qEUY2g4vdM9plBOpUZVdE/8z/8+6A+bp8y499gd2Z/ukDWSJVZj9acGMonmoUyErI4OYgFybQYmIDPP4rxKrhGXg9AwT5WzqbfgI/hJ4n6QZSzQcP1IWOYMXYBAW/TLOoSMDlK5/11flyViEnmRz69tBun/Ic4g8IEzlEh8kpk5soWv9MRJR/imiS2e3yfxCTOZtoAby9NtGvi6c/xEvNx6/EXBk8grFEJUkBWgFkFv/cVI36HoSUmllYVWYmz6G+mPUBWPnAoxz79P8wXDa+d3foDYQvshlZJdWgSGh/R+/aKxIUaZO9BMAhANxZg0zKxOuBkgqKgYDVeYFcPNaW+4VpXNmRETNpIql/0Fx+60HhUgVfHxMI+UrwfrkhiLB+pzDtJZMzLww==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?I/GGXY0yZOh3Svljyqnxny3jMwfty7p3wS4qS8+4vYbIYr/fsD0XRNwqm+?=
 =?iso-8859-1?Q?+8kZMyYfKVBj5BAfmCML6Fq9gVhu5LXaD7+C28wX39iSZcuTUiLlegVsF4?=
 =?iso-8859-1?Q?X3QrnvAJBAwPXOCurTNao0EHS6hUNpOBvIt7fvwU3PgFPZUXb5serIMLZV?=
 =?iso-8859-1?Q?1KRew2TYmn+2qc/W9/0AL/L5lS85I4yu1aq/cG7FLz8O+lA5XW1VcUWG26?=
 =?iso-8859-1?Q?xVmbOW2giz4wa/INsSbT6x7keq3FTDLsjzMKbMFv7W3hzGVR4eDKTEyjg7?=
 =?iso-8859-1?Q?/Wucp/QyhTcQkEYLdOqIS8z8JYmrlAw7F4AvAl7af2M8Bj08ttDWLaOF3f?=
 =?iso-8859-1?Q?qF0daX661xBHJpfQLMtmAz/T4aBGibVNpsjzWjgIsceJR5ilnDhruLSFCn?=
 =?iso-8859-1?Q?oj1bpXDBc1lKPjGNdE9lFd9AX4sZQDKc6ERIzJ3jg8OoAF4bso5p9EPwEK?=
 =?iso-8859-1?Q?VSPRacwfYuW5PDdWnuHlAcNZDIZ8cZGl17GJJFNZ6prklXaTq0wdIAhnMK?=
 =?iso-8859-1?Q?seVrWzItIw8JomSGSwcKHvBaWM0KlO97IGWw95Ow2TjT5bYSo7MaLi7/r3?=
 =?iso-8859-1?Q?A2HaKAevoT2wI1ibdXzyka5RgN5rvKAaW8dM48rkd5vfB9EtOgBjrx2Alb?=
 =?iso-8859-1?Q?klYJCu4tzunfWehPQh9hL2yrFGqzvdMbZ6SeTPQPdRPMTbuVQ/r5bWEDIK?=
 =?iso-8859-1?Q?dfVJkv5JAl3J7jA2kmO6FZddZNcdPbVsixWDaJz8n3U6zgc3/Eh/o2ABmW?=
 =?iso-8859-1?Q?BFUKEglFBietwLe98IgBJm3/pN1XeinDtQnMP7yaKFP4Uej8vbmANXriXh?=
 =?iso-8859-1?Q?ioTJn2c4or1FMtwc3HiILaqqt0DhaqnkJpnXQ5t7iUlZK9pFsjTlbRkdj4?=
 =?iso-8859-1?Q?O8zFGMUEKe/w3/klezIlsWwLQbxkpBLBEx5zmqmKetEOLk0KRsjv3zyIDo?=
 =?iso-8859-1?Q?+2opP9unuasRhYcNtN99x9oBCYPenOAo+bDMAL/oKcfdEfmVX3rwI3/W9r?=
 =?iso-8859-1?Q?KXpesdMG7XoYEEY8MXSumq6uY1LWOKGQYQ3VLlwRpi+hibyvcSYS/jnbH+?=
 =?iso-8859-1?Q?+2wUye5vBozirMVdfZUMf1ur60tJ+EEzkuU/RiIC0dMKSjgrYo2KW9pl5o?=
 =?iso-8859-1?Q?mpT+/b7f6lAgr7Yey42AbF2Jk2SMSmSa072F2Z+IwCN1Bf/otM5e8ac058?=
 =?iso-8859-1?Q?5XTVoQ/mIXSULg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-6e454.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR06MB3148.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 290d4218-a418-4dd0-c4aa-08da0d70d93f
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0601MB2326
X-Warn: EHLO/HELO not verified: Remote host 2a01:111:f400:fe0c::80a
 (mail-db3eur04olkn080a.outbound.protection.outlook.com) incorrectly presented
 itself as EUR04-DB3-obe.outbound.protection.outlook.com
Content-Type: text/plain; charset="iso-8859-1"
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

We have another outdate Debian server with samba 3.5.6 with security =3D Do=
main. That was configured really long time ago.

I can understand that its EOL but any clue about why I am getting this kind=
 of error?

Thanks

________________________________
From: samba-technical <samba-technical-bounces@lists.samba.org> on behalf o=
f Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Sent: Thursday, March 24, 2022 6:39 AM
To: samba-technical@lists.samba.org <samba-technical@lists.samba.org>
Cc: Rowland Penny <rpenny@samba.org>
Subject: Re: getpwuid(13891) failed Failed to finalize nt token

On Wed, 2022-03-23 at 22:35 +0000, capricorn cap via samba-technical
wrote:
> We never got it to working properly. With Security set as Domain.
> Only couple of users were able to browse to their home folders and we
> were getting getuid error so we change the settings to Security ADS
> and I installed krb5-user package but now we are getting prompt to
> enter username and password and even though I enter it I got the same
> error as posted before.

So it has never worked, what were you using previously ? There must
have been something, or you would not be using an EOL Samba version on
an LTS version of Debian that is very close to being EOL.

Rowland




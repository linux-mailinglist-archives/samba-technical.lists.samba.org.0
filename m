Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF742ED153
	for <lists+samba-technical@lfdr.de>; Thu,  7 Jan 2021 15:04:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=tCrlYbILNz4tYKzgxJRYs/uHMsOsEn6txoy+M/A2Ms8=; b=P+VVdnQwbB/3iRUJ4w8qWvXKot
	pSJOLo700Cyk2S00ZYnQmNm99dOPahdkRReSGrqYV2EBeJ0U2ilN0P66s+lcNfZdVjGAiYivalISh
	Xs6cjwbSeRo9SBQgjZpZ7wi6mXVwooaQ0JhdOEv/Itf3pSS888bVxa7RqTtAv6rl0LN3xgIJBKkM9
	pOOQLQziNVaz8tCUHtYlIVKePuPJB3XvDKnxNXBaSWUqdUguTb/s9e2eeZdnzRVSRLIzNSLGNge/N
	slDQqpem1HNRLqgZc278+EytmaxiEDn7NxhvKQRclh7WEGpe29gWH8mLdwUYQxxW0AR39JUs4Fb4i
	jBeiq2Rg==;
Received: from ip6-localhost ([::1]:37246 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kxVtL-00521I-9s; Thu, 07 Jan 2021 14:03:55 +0000
Received: from de-smtp-delivery-102.mimecast.com ([62.140.7.102]:36033) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kxVtB-00521B-7h
 for samba-technical@lists.samba.org; Thu, 07 Jan 2021 14:03:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1610028202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tCrlYbILNz4tYKzgxJRYs/uHMsOsEn6txoy+M/A2Ms8=;
 b=PgY/PCXFfratXXO2eaZQte3CUvgH0PRjDIyfXQnab3rbagKiPyPZkIXIQg9Fwn1v82Bexf
 j7UNVWu06RDFoO8AuzhUWrbRhJsFoZNDvPSZu9zRROZaRdkdsY7V4MfIZVOdJDLu90FjfT
 9yFRW/C2/8OWamQi89XUCVaRLgIdUH8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1610028202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tCrlYbILNz4tYKzgxJRYs/uHMsOsEn6txoy+M/A2Ms8=;
 b=PgY/PCXFfratXXO2eaZQte3CUvgH0PRjDIyfXQnab3rbagKiPyPZkIXIQg9Fwn1v82Bexf
 j7UNVWu06RDFoO8AuzhUWrbRhJsFoZNDvPSZu9zRROZaRdkdsY7V4MfIZVOdJDLu90FjfT
 9yFRW/C2/8OWamQi89XUCVaRLgIdUH8=
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-eAPNUzd_OJaR3euK5WT06g-1; Thu, 07 Jan 2021 15:03:21 +0100
X-MC-Unique: eAPNUzd_OJaR3euK5WT06g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ih/BF6aWL8GGVN2K0aenLtlaHpHI1IRVZ1PxozWYdqo9sKevv5IOMK7HPSYxrEIGh7Z+ktEzXevvPB9KIohGVuE0j13frCGH7sitQTtqdOa8DVeDZ9ePCND5F9+XxJr0dTtgJCXh6vrc6YbIFwcBoj7dnTwvL+gCTN4pgwbdkzn8z7WyavZ6Cf85L+BQr2DzC3Irde9AsR9ZxSzHm4XS3GRbjwajmBJTcBwsj5CnlldYauVbTljIUcaEmtjb1OCPzIihO9G8s3RCIlCkCkEdeAqqbKQh86JOhZckdGWwgxlcbBplRwJQZGwGrR6CwBVlZz52LKwWVbL2JWB2yfJrUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCrlYbILNz4tYKzgxJRYs/uHMsOsEn6txoy+M/A2Ms8=;
 b=SevVA6ezjybgv8wg/T3IvpZaoxt4DNKuaWKtONfO7h3sSPLciA/gdm9hOaFrE2+fUFHBk+3i3Zu9DyVPzJ6CxfpeBFmH2cUmnvpLRP9vDpVADyD/z4z3sJchsn7cMB4Lm3SlvQZn1HAaxMKRkTThe4528tp08ys4hPiZsOUt0eUwelCBB7+tabplAFsV3xbm4lhmolrIhbkCeJl59lvEpEomyJLrXpPXnVjf6WxWkA/C4IwRc+MoNVsM3ux308T2CbHLFLeUfNL7VTwYDZk7RhLLhmsdyGRZyfmeiTvihyCZ8QdVuK0A0bTEzaJ8xpAI8ol73PcMGH71Wg+VetXDMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com (2603:10a6:803:3::28)
 by VI1PR04MB3230.eurprd04.prod.outlook.com (2603:10a6:802:6::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Thu, 7 Jan
 2021 14:03:19 +0000
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::4dad:a2d3:5076:54f0]) by VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::4dad:a2d3:5076:54f0%5]) with mapi id 15.20.3721.024; Thu, 7 Jan 2021
 14:03:19 +0000
To: Yejune Deng <yejune.deng@gmail.com>, Steve French <smfrench@gmail.com>
Subject: Re: [PATCH] cifs: fix msleep() is imprecise
In-Reply-To: <CABWKuGUj41Qa-y_cApNNvLfTQPLJi2adr+ZKN6RpwFoemskoKg@mail.gmail.com>
References: <1607591258-13865-1-git-send-email-yejune.deng@gmail.com>
 <CAH2r5mvgjFWwEcqt8nfiU_1GJQUU7jN=eNT-t6SBEK8jke0Msg@mail.gmail.com>
 <CABWKuGUj41Qa-y_cApNNvLfTQPLJi2adr+ZKN6RpwFoemskoKg@mail.gmail.com>
Date: Thu, 07 Jan 2021 15:03:17 +0100
Message-ID: <87r1mw3kuy.fsf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2003:fa:705:9f19:3297:f46:6b4b:f1a6]
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2003:fa:705:9f19:3297:f46:6b4b:f1a6) by
 ZR0P278CA0027.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1c::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 14:03:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b1af3e8-2d0c-4e72-a857-08d8b314fcbe
X-MS-TrafficTypeDiagnostic: VI1PR04MB3230:
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: VJ/HNMofplh673jG9CXyAGO1yoqk+e5al0MO9K+Y6qmlDjIlv+Lj76I25XH/tCFYSvKbQ3aU8Km6WahDRFNRzaNgXqaFmOl2fIjcmeCg+u+GGR8vsf7NAC7UFWPtOwp+gl36rhPN6+ZfX6KJsSgfp4MigVpqvc1XDA6R039v6EAqRityN9kECkXq7Tr6vkyvjMt+J5G79PsmuMMsI0A4n51w7tKDjHj3S2ojPJGVfhdkpSl2CDtHrxcTvto20Bn6Y6loUE7N4W5EW7ufoD0u3xg+Q1bsIbLisHlWh9/C24el+USf4p53r6Ub1RYB2/f4wAp+fmTSoqP2Ue6wo7gS2YtUozI/5BOm5FEc1wOUrts2DK/3PAueJV8Zmxsp9DunO7Sfcf2iA+nz/zMaJbLvLA==
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bjU4MkdaUldDOTlPR2VBQ1JWMzVORm1pUHgxaDMwMWpCTHpENXBQdDRNVjNQ?=
 =?utf-8?B?Q3UxdncrUXhIRjlMa0lHR2lqNzg2aDhoUGNzdWYzbmQ3UDBhanZyZ2krTlV5?=
 =?utf-8?B?ck5QN3VCQitFVVYwNDdaQXB3NkJEcEhrZk1rMHF4aTQvVnJ0VWRpT21RWVkx?=
 =?utf-8?B?YVEybnlzMGo3TEdTM3dSTEdSSTV4STZGWjdCSWp1ZXFqN0pJTDFKdTVMdzVW?=
 =?utf-8?B?OHNqYUxTa2lwdnlWVHZRUmJsQW13UUJwdU0wNUZCZnRabjBjaVdKM1hsanVY?=
 =?utf-8?B?VkFRcU9tbFQ2S0dIbDhkYkQ3WUQ1SCtqVWtRVlduYTRENmhCeitmdXRDM0tN?=
 =?utf-8?B?NjFaRVZrWUp2VUQ1RGdjMXdYQjh2QTlvbnVVWjJacUxOT2xTeWk2Q1B4V3I5?=
 =?utf-8?B?K2ZiSDE4MTJpelI1NWpOZUU1ejh6ZWZMdlMwVzFaZm9CZ3V4S2hGdXF6d1kr?=
 =?utf-8?B?bFBxaWhvb3A2SHh3aXNVZ0JRV1FtczY3TldhSnI0WTNIbEhYSkpnYXcwNHBy?=
 =?utf-8?B?c2trMGlkd3BGcms1TWp3Y1NscUhlTWZlbnVBSnozY1duMEoxSFQ1SXd0STlK?=
 =?utf-8?B?eGNmeVRURnpnbUZET3VBSXJsVFdRVm1Zc1pJcFk3V1Z2VUxOdFVZM1ZSVXpn?=
 =?utf-8?B?S2pMM1k3TExkSjlmU1ZEVG5jeHRqeWxxdlh4Y3gvL3RPcTM4WEt4VVVEN3A1?=
 =?utf-8?B?UDB1SGZ6Ky8zTUdZK3pGSzlxc0duK0UzOW93bXYram10cjlIRXQvR1IycTJQ?=
 =?utf-8?B?T1BZZFNzc1R4YkQyVE1hekpFQUNvZTV5TnZXdVZBZUEzbmNMNGwxQWxaK3U2?=
 =?utf-8?B?d3JDdzVuU1NmUDl6TzNmSXNlQy94MkxjQllBTm5OTFZNeSsrNzNiMTdiRmtO?=
 =?utf-8?B?V3hVR2R3bFVIQjFNVHBVRnFPelBSRjBXdE9JanVTS0E1Y2pvbEtVZ1hzZ044?=
 =?utf-8?B?alJOc0hocEFUa3VabkYyQWJKTE1kK2ZabURCVWFFYlNPWHBJcVFDS25qOG8z?=
 =?utf-8?B?ckxvOHBUUnNjdEt1ck5XTHJRZ1l0cExSWmpRUEZPTkpPUmpvbUpLREs4a1Yy?=
 =?utf-8?B?cG5yeUw5UUZjc3NpTlYzS1FrcXBqQmNiMEwreWNDY0xLNzhqMTRZUXJjMG8w?=
 =?utf-8?B?NXVUWnRBdTVOUk8wTGJITXFCMUpacml5UnZEV0d5aXlDeFpMcU11a2h2cnps?=
 =?utf-8?B?MUgwbUFIRTVVU09aeVFEUVZxUW5FcTNkMEpTZWN1MW9OSjkzNWUvWVR5cnZ5?=
 =?utf-8?B?V1dsVWZGYThiS282UVUzc2djVzZvRUw1T1hIbVdsT3FNSml4N2JVVk1sMHNv?=
 =?utf-8?B?eWIxRWpIUmNWbzZyckxaOW5QeS9OTVZ4bXFFcHdSY1VQUkFxOGxSTllCTUFm?=
 =?utf-8?Q?KGol7hPM7YqrUdjrocXdeQ1Qgb0kEl14=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3359.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b1af3e8-2d0c-4e72-a857-08d8b314fcbe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FgrAYSg4SPYUwUmdycvXWRlAvXQ0nAr5D0inDfkp14Z6sS3ogQcmtkoFhWWKWw0s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3230
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
From: =?utf-8?q?Aur=C3=A9lien_Aptel_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?utf-8?Q?Aur=C3=A9lien?= Aptel <aaptel@suse.com>
Cc: Steve French <sfrench@samba.org>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Yejune Deng <yejune.deng@gmail.com> writes:
> No=E3=80=82I just see Documentation/timers/timers-howto.rst and don't
> recommend using msleep() for (1ms - 20ms). It recommends using
> usleep_range(). And fsleep() is flexible sleeping.

I think what Steve is asking is does using fsleep() changes anything
regarding yielding i.e. does it affect how tasks/processes get
scheduled. AFAIK, this msleep(1) in the code is to give a hint and let
the kernel run other tasks, in particular the ones waiting on the
request and response queue.

Cheers,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, D=
E
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)



Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CC94E5B47
	for <lists+samba-technical@lfdr.de>; Wed, 23 Mar 2022 23:35:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=ICHjsa0XWm3qbNTQGv9sTOD8rCiyWnZ5RzY372J7c+U=; b=gOGqX9yTa3v8b70yXPvxW9SOSm
	QYMYxfLKEBB4s8r8sFxQBn0KXTFLIvNf2JlNumRxCDaOspcdpc5MRtSPCvQsbppPdoh3yFjrqIqn2
	BZu8tR6jeg9aOPXscQB5gZ276Fg5sOjwaD623oZttz6A3ZmyF9Qu+4badimidaA4dcDX5LBD6Fhtm
	AAS2Pwv2tJB6WkuBZiHzruqe1Y+kkMw2v4TFQyttgbixXAD2ojR0xDV13t5T6/sVQO/0PucoEi4UZ
	w1yZP+S4c32IHPyha+UicL2NK6nnMtqpclDTboxau01w26MThJugFMGjouslP4QXjRWWbAdiVfvWO
	mC/psgAg==;
Received: from ip6-localhost ([::1]:64552 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nX9a0-004h4J-CB; Wed, 23 Mar 2022 22:35:48 +0000
Received: from mail-db8eur05olkn20809.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::809]:55264
 helo=EUR05-DB8-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1nX9Zu-004h4A-3b
 for samba-technical@lists.samba.org; Wed, 23 Mar 2022 22:35:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iO9rQCGm4c6kaKlOLBn4RtUBeRZpVUlGKgIvvrZlMTZ3SUFcJ+Bt/ZV79xX+nfYPTDdB1j9JKDlf+zR+exF80tl4zLL4j8DQuql41sZXpOY9zCo8U92VL2hO19uxAO4cfA8rBoqoH07eldzTjQJWhlKXEK3Hi8ReObdvHTC6QV+vjAuRvUfQPJ5sKThXyYsADRYsmKxWKW3IPE6p16HeT2J5daihsbY2+p1nne9Bu0xqeuRoKP3ztuZWSXUuzJNzUNimvTQeCcFUJFQXVG4IkQQGIgGF8BxBZTq2+YCp1UG8tV6jmXdWp/THiZQkVOGYc9C8nGoGqzE75iQ3O3qDsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nYu2KtqS+mly2cbbUKSJJDOwH4e8qY3NZlYkl9l4BV8=;
 b=VlH7TG1GyZ6FZB8dOzdBf6wNUX/Ac6zPokz4nGt8PVd3i+v8deEpMEdhILwZ5eeFG851SO6MPs24/YQJC+I/yYewDcBEhKithRxE3vaGJqYbhsg3F4uy1IBIOuy0Mn4EQw7NAFriunVEYxyzG8I9UsEFfz7kPc40/gg9+PG3EvA4qawMVCf5mz/krt30TWmA+R7Cr8cz/gUOZ3U3oF1Hqph9FxKY7wPMxSjMq654CWw4wZxJvieWCOXCRe16QSL1oTkHNG848LO4UNiWUBwnpjV90pUCSU5L4aIZFp5Nzgc+myr628snlFjh7mb80f9ZPs10uk9BgxPP/6vK+gF+Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nYu2KtqS+mly2cbbUKSJJDOwH4e8qY3NZlYkl9l4BV8=;
 b=GbofXk39443Wl4GVckBkTNuba96krsQJt9cLOSdqac3ywtVFex2sdMqoELTvNWNbP1T/z7O1zUOXDUCTdoA29qU1dWO4nBhMwUFsGZ/m2OZYaHq5eujam95cgke2YP+7GlpWZ+dlelIKutQ5CHyw4d/y6ODKrig98tL+tS3QmCKX0zGlPpj/ctxKiwLouHHYtS2NDPhSGPnI6NoV+mvQh1xkA4miR4ySlLs1XrctW4ZYG+XpdsuGKAP7OKPzetYNPiLwkE9zE3m2UVfU7m9ieyYT/ZjLj9yTcLy9vUajNoAik639hGT/wrs8iBScVkFuIfMZfktqKVR4ZZbZlfx+Yw==
Received: from HE1PR06MB3148.eurprd06.prod.outlook.com (2603:10a6:7:1b::19) by
 AM6PR0602MB3400.eurprd06.prod.outlook.com (2603:10a6:209:5::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Wed, 23 Mar
 2022 22:35:29 +0000
Received: from HE1PR06MB3148.eurprd06.prod.outlook.com
 ([fe80::6554:406d:1be3:50dd]) by HE1PR06MB3148.eurprd06.prod.outlook.com
 ([fe80::6554:406d:1be3:50dd%6]) with mapi id 15.20.5102.018; Wed, 23 Mar 2022
 22:35:29 +0000
To: Andrew Bartlett <abartlet@samba.org>, "samba-technical@lists.samba.org"
 <samba-technical@lists.samba.org>
Subject: Re: getpwuid(13891) failed Failed to finalize nt token
Thread-Topic: getpwuid(13891) failed Failed to finalize nt token
Thread-Index: AQHYPv5LdU7dCTO6eUOwRvAfLDRLZazNgjMAgAAHKHmAAALyAIAAAX8k
Date: Wed, 23 Mar 2022 22:35:29 +0000
Message-ID: <HE1PR06MB31486C485C9614D48D1B0FDFEE189@HE1PR06MB3148.eurprd06.prod.outlook.com>
References: <HE1PR06MB314825C38C5FED0EFE6E2B76EE189@HE1PR06MB3148.eurprd06.prod.outlook.com>
 <be695e607739913e530fb1c8a0ccc191ea8eefe0.camel@samba.org>
 <HE1PR06MB31488952C3D608E9374C7FC6EE189@HE1PR06MB3148.eurprd06.prod.outlook.com>
 <007c551a46cbad5f4e8179c156ce647891f519d5.camel@samba.org>
In-Reply-To: <007c551a46cbad5f4e8179c156ce647891f519d5.camel@samba.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [gmn5PrR4c/C6ADDQ3SCYs54Oisrtcu5h]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf45e5cc-f661-4a31-4f62-08da0d1d6f0a
x-ms-traffictypediagnostic: AM6PR0602MB3400:EE_
x-microsoft-antispam-message-info: QQvStqsJtfJ2lcShcARitBygfXiGhaTXssmVudTqsn6Se9z2gh0swD+lu+jkVk143+7dhIplGtZehdPbqKCLZgIXyp9AU2Vq+IJeAOwsTFl2JUuUz0pnGfgWQN8lfUMyUinaUm3kxeLgiLw3XC6NFlBxV2lRd2GSmpBwLoqsS1GYjastQCPJi2x1eBWSBKnkYwC+C8UwmHcOvJwOsiiRPOxA/yhHqFQmJcpgdPwuJUZOwWlApjm4+XPDwCD+lY3UMxhWnpAytxdQ5/f99EwIpXrdcSbjQWEfk6n4Owx54goKgakVPCROv5d+LKgBBS1nE42dM5XWHSUmJKrwO4HIcCNU2k+3lA/DacQdgaLLl0MiFS9ZgB2sgFFVZhEcOr+4Ry0PugzAHCeXpfp9dNbqkSzj5sIeYmxei8qbIb/A1I/Bple0kthcLYZFVQ6kMsM1O0DEHHBSsDegWtcpMgfovIYFW+nl/jZcF5dD6FRl+Q6X791foceWYi8cEIfeRVYi/WdVb0eeFY2qcrJuRiR+5At2sTIXn55OlV+h0VtFjtTpAS7lu6NeKvWMFzWSpcfuzHz1ozpNb0sEtMVWjyi6lwWQsfXRh13N2ci0smgKZRFBzOjhkCB63frmEauQh6p6
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?/KQeTHXnh831xnk98vwbmmiXDa6x5TWRl+Gf27OagXXYauJPOB78Iv3Jcs?=
 =?iso-8859-1?Q?jy7l1Ha2frmyJilAwH/CSYeIWk9D9pAljjbgJzrZ6OeozHKF7oYVgt6Rxv?=
 =?iso-8859-1?Q?YaD+hq+JUm8BzLOB8fj0B6CLVe+/T0ufHcZUNqdDZAp8eNBI013P67Mzlm?=
 =?iso-8859-1?Q?7ZfXGe7jAJBlmZ/4+pD/hrn7QoIji+saTMAZFZ2Fj2Kl/ebY7noqEhotwl?=
 =?iso-8859-1?Q?BBLobZooduYzqwthRecU3EwvDQVguVwznohXdMgRp2ygLl1lNb2LQMyYaO?=
 =?iso-8859-1?Q?fUq4q/CtAPB+ZVfofDKtvfT9x8bR7o22s38iDQAG9/aiRFi5rgHGfE6cle?=
 =?iso-8859-1?Q?CiePcGqngrQGKMNrP9O5H/Vyu0OlUXCJz6IZXrf8yNT+jjw90w9zXEtUb7?=
 =?iso-8859-1?Q?3bWNavdx6URquKwL2TnDL/3164hHvy9Tmc0ouaxsphJbmzhRQrT3Dx39Zd?=
 =?iso-8859-1?Q?hM3Us0g2q+IdO2981K7ac2MhmlDLNvqrstZQeRVWxsrPHn1AKWISY/ygnO?=
 =?iso-8859-1?Q?YihHZt9KmhjVKYymawFhOxRVH7/a4ItCnfZAtOHvhYIv5TqZojb4uoqkYS?=
 =?iso-8859-1?Q?LN6I9IglxJ29EljSTn87UzABkXlaWV7hSe7cy5JMY87yznoodbKuE9APjs?=
 =?iso-8859-1?Q?iEL5M/rj6mzLuKpK6wnf5/LQ/3uF59+Y7c6r8y7csOeHu65khBZcCzxuHV?=
 =?iso-8859-1?Q?GJbRJGwOr7Qhd4XDsOZxWxs4vb/M0Goyvw4WhO4OdP9WaNZ9iAdGhD83Xw?=
 =?iso-8859-1?Q?EgDA22oYxZvhBbw6Z5fMluQ0IIMo1ZwpRh1Reix7cM5g9x0K7P/e2Ij32H?=
 =?iso-8859-1?Q?AKh8bo+y5jxcDncFA/foQtocixl4TEdTUa7fm9YmbYWN7ffkCCSBcjqCAh?=
 =?iso-8859-1?Q?+kY6zm05X1MFGS6Ys8KLbzLV9v7r0qY6b5wRtrimzcRBdtCM9CafkIsG7J?=
 =?iso-8859-1?Q?YJkD5koy5cBYI40VUxixW8lREnIg6jF3Ro1CPO7wHCCqqSg9kn3pw4s93N?=
 =?iso-8859-1?Q?7M/O6NecZZwqLNbR9URIMwNPTnnfjWxr75M50q2limpv4dXFLsyFbLIwVS?=
 =?iso-8859-1?Q?dNXFZuR1/5f1ZKEtfutzIMzQIubnsBzC7jtQlSQlFOoOqOiK5sncQrQG9T?=
 =?iso-8859-1?Q?DzlptfnYlV0nFF1HhINaU7/wrnM8S302sAKWooNvCN9SxCe0TncAY5ZlFm?=
 =?iso-8859-1?Q?SkQeUePZQdf3Lg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-6e454.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR06MB3148.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: cf45e5cc-f661-4a31-4f62-08da0d1d6f0a
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0602MB3400
X-Warn: EHLO/HELO not verified: Remote host 2a01:111:f400:7e1a::809
 (mail-db8eur05olkn20809.outbound.protection.outlook.com) incorrectly
 presented itself as EUR05-DB8-obe.outbound.protection.outlook.com
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

We never got it to working properly. With Security set as Domain. Only coup=
le of users were able to browse to their home folders and we were getting g=
etuid error so we change the settings to Security ADS and I installed krb5-=
user package but now we are getting prompt to enter username and password a=
nd even though I enter it I got the same error as posted before.

________________________________
From: Andrew Bartlett <abartlet@samba.org>
Sent: Wednesday, March 23, 2022 10:27 PM
To: capricorn cap <cool_capricorn80@hotmail.com>; samba-technical@lists.sam=
ba.org <samba-technical@lists.samba.org>
Subject: Re: getpwuid(13891) failed Failed to finalize nt token

On Wed, 2022-03-23 at 22:17 +0000, capricorn cap via samba-technical
wrote:
> Hi!
>
>
>
> We have plane to upgrade but it will take some time and we have to
> fix this Samba quickly.

In that case, can you describe what changed to break it?

Andrew Bartlett

--
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


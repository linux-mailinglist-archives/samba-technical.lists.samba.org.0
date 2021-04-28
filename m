Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B217B36E051
	for <lists+samba-technical@lfdr.de>; Wed, 28 Apr 2021 22:32:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=dQeTV9uCRiO4jj60yIlNa9tawkxogIqZXxNGeNlXxDQ=; b=ZtpDTxONa+1oWO3xJmF3IhzNv9
	yfhYM0/brPd5HAUxANJzq7k8g0nPNarkiz5RrM0piieRD0YyzBBblTQwdqTGWC3JoxR4oMSE6ODJX
	LKXe9Y8M0vLuvI6I56T2+hoXdDHsLQ6vZVmvQdtwVv/qiFdW1Rrma5IclP2QlJArX04uRdFgfy3xX
	e6a+nPRV1PUchj30EG65lq/UzUbq3U/HQRCMUFOUqeBKt9bFuUqOm8rXK5rkSMl3RbOEDTZXQz+3d
	gm3NKaKeg5ecmWRxb+UijjhfIz8iEyoSuKBJfF+oyQUVaLWXC5r+DXO7iBRju3+n+kA2wV9m5R4f/
	+/XrnzSw==;
Received: from ip6-localhost ([::1]:56540 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lbqpK-00CwiL-2F; Wed, 28 Apr 2021 20:30:30 +0000
Received: from de-smtp-delivery-102.mimecast.com ([62.140.7.102]:60786) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lbqp5-00CwiE-Bh
 for samba-technical@lists.samba.org; Wed, 28 Apr 2021 20:30:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1619641812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NvoEruwLSFR/7aQ2mYnnMECgtNapr5tsVEAvfan5odY=;
 b=WmsgTQJG9fLUKKE+/ik1UAEtkyeD5XnqCG0otdT2woVRtZA4swYQEMorPJO8mTQEYkl75I
 0WNnqZuQpvi6kpPPs8STzGh/JmXYUjHqjZNYb2fuRLxyQ7SefU9i2rX68S4aKz7ItWNPL5
 IZXCYWYSz7rTHt3tDYyxPM6swsFwZ14=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1619641812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NvoEruwLSFR/7aQ2mYnnMECgtNapr5tsVEAvfan5odY=;
 b=WmsgTQJG9fLUKKE+/ik1UAEtkyeD5XnqCG0otdT2woVRtZA4swYQEMorPJO8mTQEYkl75I
 0WNnqZuQpvi6kpPPs8STzGh/JmXYUjHqjZNYb2fuRLxyQ7SefU9i2rX68S4aKz7ItWNPL5
 IZXCYWYSz7rTHt3tDYyxPM6swsFwZ14=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-1-fE42c8rXO02ALbUzE3YhRg-1; Wed, 28 Apr 2021 21:57:27 +0200
X-MC-Unique: fE42c8rXO02ALbUzE3YhRg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PD9qzldm7nYB2nAQODadR5T7JTmyXC7Qhf1mWz3piM05N9VzP33cd19yz7KGoWxTHwo7RUbBzoJNNwglmRPWVCr4/E/b5ud6vISJ55P1FgCrLZiyWwBP07bOPpJfLJt55FxOj5tqy4dEjIY3JHq6VfToJV/68FSxuV+60ZvrOBF2imJul6nfloalhH01YsI/tMvCP+ViBd9bIdUI++7CCUyNr6PPJwU8w7O0+iNN+lvqWHtqZkOqb5PLLqYfcR8ieY6hXk6GI5xa54GjiM8ZYeUN9jFl7IpnKH7K0+YxUcPuwUf+O6KKFOJrKk4k13pQCNGKK/QZOhpZNEfGqmG/0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NvoEruwLSFR/7aQ2mYnnMECgtNapr5tsVEAvfan5odY=;
 b=FrTgXLwtlXB3iYc4xVmEkBMy8LXXsok/FaFnl0a57stjfIJWU1qLvEh4/jH+cDbz0w8F0ecfa0ixQw9cALqIbXiE9uX59Zz30dltb+7QKaTMddXzEWGOrqHseDcPKAKGuoAz0p4HLHfb0FrNCnSYGPXom5+TZEBy1GCO8lbt575Qc8NCs0+2FISu62LKGVKECrQS30XCbYIiTBmdZ6Eu5izDBRYQUXcTIGMXsMo1CArNGX/SrJqonImsMGL6bW8yBs+i05ekF0XnOkOovC3dp7GvGrfYPHyVA0Rw923c+LLMiB94yEut1dty1ukWInsrZkEs+6iKINyDdw7prd1jEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: kania-online.de; dkim=none (message not signed)
 header.d=none;kania-online.de; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB6131.eurprd04.prod.outlook.com (2603:10a6:208:145::16)
 by AM9PR04MB8162.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 28 Apr
 2021 19:57:25 +0000
Received: from AM0PR04MB6131.eurprd04.prod.outlook.com
 ([fe80::411:df4b:cbc0:3f26]) by AM0PR04MB6131.eurprd04.prod.outlook.com
 ([fe80::411:df4b:cbc0:3f26%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 19:57:25 +0000
Date: Wed, 28 Apr 2021 13:57:14 -0600
Subject: Re: Time for gpupdate
To: Stefan Kania <stefan@kania-online.de>
Message-Id: <E3IASQ.CYLNF3FV60K11@suse.com>
In-Reply-To: <b8305d58-1cc1-f38d-2abf-9252d5a679bf@kania-online.de>
References: <b8305d58-1cc1-f38d-2abf-9252d5a679bf@kania-online.de>
X-Mailer: geary/3.38.2
X-Originating-IP: [170.39.98.113]
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.12] (170.39.98.113) by
 PR0P264CA0243.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 19:57:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7bc4d6e5-9fff-48fb-f00f-08d90a7fd7f2
X-MS-TrafficTypeDiagnostic: AM9PR04MB8162:
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: jU8KfAMh/e54L1kTPW9eUklLS+4dsj30JBKZnQIuyxRQ2C9EVHXEamAmb7qQ82AUNn8kDidY9Wvq/6Al8dZrF4DeA0ugqFctJbcPy7V5R/5fFJHcQ3DDD7YqiDUGtTSP3n6cx/O3DHVu3Du2K/h0HrXnJijlxANv6QHFgpEmzn+tduJkiVztXNuJif0oX0lemWaOkAC//jY/SJEMr39AAGv5QGI8Ag7k0P6lIpy7sisZZ859Lf9jyBlRRKWZ7UahA0hrqDhreRPEZ1D8qWaLEXEqn3sYihKLtNd9vP8RP/8zzOX3r3uPnIR839d1KRDF2lzzEL5kFe7WVWpUdLGtmf2Zi0Zrdq7mQ7OM+JDP9gMaSxnQHvy7P3mkBwGdbv1xB1oqn28ugJFz0Rd74dNe9Ko/nljWsJ1miOnuvRGiAuB4Hmmj/L6IzEAI4g8Uq5g2B9ocmGiqRCHS+20XEfqsTHhGU2owOAVTYUO8D1seTtD+tOeFgNpEJ9PHMoIzgpy7duxzK3hzU9OKgVp2v3ixk1iEvcw7M+qVGTBc//hfomWwjXtJrl0sMVyV6UwV9ThiI7qAK4HUcNz5UpCHLUPfXr3+XkQHpAQ0zxmfQsmc1c7s50xybeIIWkqrKt3YfTfLM9+fudE4VdmwQoJrq+WTIh9e6HjsNnyA9S2TGGdHbbGcDlp1kkbOctJwSwi3WrUwb4V8atqajENFg9GdJMj2DTPk/LjiAn35vKvxp5sTDmU=
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?uA0nsXcc29HQhSrb3Z38KchztUNGF8OiflC115r9ktacO3N7FxpMGw7Bei?=
 =?iso-8859-1?Q?wwvXEyjIk2/5ffMQmKswzhmOt43Z8+k7tnZ/nR24Ju2M2dJgJamJ90Qqxh?=
 =?iso-8859-1?Q?ZkNb/SVSfHpDtMNqCa5mP8iqJczS5Z8IAXaABUAq0yfZ+kz4WHyjRUBhPn?=
 =?iso-8859-1?Q?gvsAOUbQzNUMERs5oBGZkeFS6MYQaDBbYUPboj5ZFXI/Qg3HrbP7q2zDOs?=
 =?iso-8859-1?Q?+ovEJtFLfuHwjrXPJnxAWHIl850BTdAYr2l/sbcfKlL2Ko8Ph4EC15qT2a?=
 =?iso-8859-1?Q?iL4Gsj6zXWIPn+nEZ2VBKeVAG1mZBFEXn8WQXZbg5B8yfVylm/SJ3owIzJ?=
 =?iso-8859-1?Q?BFKhpgHQ+vlIdGzBgs7+8Fp/FjjWvfW54jaTw3t9DRn6voCplySvydsTVn?=
 =?iso-8859-1?Q?TAeKUNCclaMIbk26TV/V+5vmtA2GAM7Z3agQrQ55C0DNPnftqCPsvygSWD?=
 =?iso-8859-1?Q?U7IpC0cheygC6a8KEcVbmZUnHhVrXBMrTFLLX+ajHLdF7T7xTzcH/+0rzL?=
 =?iso-8859-1?Q?9SbvfZXPE+FEVDdZq4/4l3bYwteR8a3UxEamjnhD5FubaHqP7O6cQm7Dje?=
 =?iso-8859-1?Q?rFBE3mgQS+qU++Y2ziBUw3vvz5T2Jyx+hUunGzVllFteLKEP0syXDsE3lt?=
 =?iso-8859-1?Q?KlZRZkDdci8Fb/U1cC4Z+vDP/ZCEkAdudBrlC8BlIyp8Jotgn/NCrDMbWP?=
 =?iso-8859-1?Q?PAw8QKjeKOyuH2t5YP1d/xdRRWPiB3jQGuFh6Qa7vxQ/0X+Kr2MAsT8k8z?=
 =?iso-8859-1?Q?GszVtc9RI2bLs6MBwUdOn1cIYckVWpFwC5PRIE5Z2NrDR7v7gmHNs/kXBB?=
 =?iso-8859-1?Q?IWi4hpf5R+YNfYd5vyYbrh+xLeYMQproxAV1kZCAs/XMLz5wVEKRWTx5KS?=
 =?iso-8859-1?Q?Y2ANPb3E/q0N2rgsDS7Z+chW3jMjla/OfM33BbTEw2Fz2jY9E1KJMlRBfF?=
 =?iso-8859-1?Q?ImcXfMgIVgIfjZHkGgF3wgcY8TGinY9hOa3TCVr9FWZrzmGXkP2pv13gd+?=
 =?iso-8859-1?Q?4csT1CQft4vLq5Rgb7aWs5PztyXi9edVd0NagE/QR6CIRdV0BW0qvVvQYx?=
 =?iso-8859-1?Q?eLhLthTNMPGwrjvktbIG7u/3XnqtyLN0lwOGYIwM6MPy8y0NeQi1sjZ9hN?=
 =?iso-8859-1?Q?wVh2+yt/XIdQwOqqCl9wcHlAuPXOUMaACYprgHmQTSphK3GLoihaHVvHo3?=
 =?iso-8859-1?Q?ehegEIJ08o6Ke8RSmY6qKsF3TaUXXrqUb5kNh5FH2rUzHYkllhDAhlRpoG?=
 =?iso-8859-1?Q?Gx+Swwveit9kuEoydT8l84WSs1OJhJdn5ePTKzGKdUJ+0jZB4mAA3ycWQb?=
 =?iso-8859-1?Q?aXEQvOK/EmwMLwWIjhikf4AFWeIP0DD14Emr0sFPHIop/TKaCH8N8OUy6x?=
 =?iso-8859-1?Q?kNnVy5PLDO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bc4d6e5-9fff-48fb-f00f-08d90a7fd7f2
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6131.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C6qX4LTEk4Rm8iuLA1PSdnjNPxwkfoGpn/2v064f5JehN2HZr7VvdlBfCFl2gsp/ymzRN5jkfR8AS39gJiKnKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8162
Content-Type: text/plain; charset=iso-8859-1; format=flowed
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
From: David Mulder via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Mulder <dmulder@suse.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Sorry for the slow response, but those are both right. They are worded=20
differently but mean the same thing.
90 minutes + 0 to 30 minutes is the same thing as 90 to 120 minutes (90=20
+ 30 =3D 120).

David Mulder
Labs Software Engineer, Samba
SUSE
1800 Novell Place
Provo, UT 84606
(P)+1 801.861.6571
dmulder@suse.com
http://www.suse.com

On Sat, Mar 13, 2021 at 10:40 am, Stefan Kania via samba-technical=20
<samba-technical@lists.samba.org> wrote:
> Hello everybody,
>=20
> I still trying Linux-client-GPOs. Now I read in the manpage of=20
> smb.conf:
> ---------------
> The Group Policy update interval is defined as every 90 minutes, plus=20
> a
> random offset between 0 and 30 minutes.
> ---------------
> The wiki: <https://wiki.samba.org/index.php/Group_Policy>
> says:
> ---------
> Policies are enforced by winbind at a random interval between 90 and=20
> 120
> seconds.
> ---------
> What is the right time?
>=20
> --
> Stefan Kania
> Landweg 13
> 25693 St. Michaelisdonn
>=20
>=20
> Signieren jeder E-Mail hilft Spam zu reduzieren und sch=FCtzt Ihre
> Privatsph=E4re. Ein kostenfreies Zertifikat erhalten Sie unter
> <https://www.dgn.de/dgncert/index.html>
>=20
>=20


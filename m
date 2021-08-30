Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DF53FB0AF
	for <lists+samba-technical@lfdr.de>; Mon, 30 Aug 2021 07:08:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=T9r96eZhIHCExPxggn45moRFLz22gIkb7cs8AImWRRU=; b=R+ePPkE7MuuQ0jKmKmUze+cIF/
	7iWEZLZcLrwyRZPRMoPCC+AjyaWIZ2mVol6ou3NeLIPS//jXRH2/w/8a2DdPdHsJ85cV9ctvQtulM
	XsuTydzPc5eFcFZcusC1S1Ne3YG7sjpktN/YyCwuIJJR/9CLw9rA0SX7eACWwjaaHg+0eTvVaWCEQ
	OShrgXcHYbtPNtchhGqnBCIm6a8Abj/SGnN+caYXDTmBRpB4/pHFF8yFp4DmdoKZcmcjn4JTO0tSY
	4vsI3BC0xOSRjIYXNPFjMaqoJfGX+aUx0nNCburtem6vZll9TgSSMSDxaMkcNMn3H2nwO//7JbK7l
	NuHNbuqw==;
Received: from ip6-localhost ([::1]:25018 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mKZVy-009mwC-1q; Mon, 30 Aug 2021 05:07:22 +0000
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:27626) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1mKZVo-009mw3-3m
 for samba-technical@lists.samba.org; Mon, 30 Aug 2021 05:07:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1630300029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T9r96eZhIHCExPxggn45moRFLz22gIkb7cs8AImWRRU=;
 b=mY4Yay9oQOkMeGCaKofQTJLxSCfyrZoiVBcNIQ0pG7XUs45RGDN6rEIjeVWSkzojPT8S/4
 VoYTYZFAvabEzey02lez8Wjj4UtdxeI3lZBMllF9Hq969n7YbO21OJicVt/Gvp5u11g1D+
 n16x3yz+oiA7W1YP9UpPepYPHdkWM4k=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1630300029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T9r96eZhIHCExPxggn45moRFLz22gIkb7cs8AImWRRU=;
 b=mY4Yay9oQOkMeGCaKofQTJLxSCfyrZoiVBcNIQ0pG7XUs45RGDN6rEIjeVWSkzojPT8S/4
 VoYTYZFAvabEzey02lez8Wjj4UtdxeI3lZBMllF9Hq969n7YbO21OJicVt/Gvp5u11g1D+
 n16x3yz+oiA7W1YP9UpPepYPHdkWM4k=
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-tF7sMKSOOwu9Ex5nRZCCNA-1; Mon, 30 Aug 2021 06:51:05 +0200
X-MC-Unique: tF7sMKSOOwu9Ex5nRZCCNA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CGFIL67gJn4Jj+/Cr4pD03BfbOkawD+XdNACBnKydGcfzbCzlRkdB1tVAeeMiC//7mW+QMksGGLXFch5Dhl9dOv9nMmYdlM9uCNoR9XhQRt8v6UO7c+00sAxjQ6JYe8FvKLzzxjpsZmpECFbfvwYa54ee+bZjFkJibTJsj7ZGPGTJv2wDVpHLyPHAGQDuIYvdIu8UjYJKKicD8gG6aveSbF8rViGMzdux4rwiqdp2x5j6V4Jxfup+aaQplnIQBUpBlgPaIJzgCQ9IXH5Eqx8K8EoHGSHZlQ3wjrxauaNBUuK/WULnP691kBDvog3nv6pIvA8GIQBZaqKEEo2ytLEAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9r96eZhIHCExPxggn45moRFLz22gIkb7cs8AImWRRU=;
 b=B1Ik5pWTOeKASTYuJBgyhA1R6FhnMJs3Tt/CoiPwZVffTm2fuMn6pl9mJGZye5zT6B5RXr2Iw87hxsdkXfMMh33fQ8WTlcookNUs3s5XnaoUm/MbHWwk9hfikQgYBhDeK3XdjDF1+MhjEAenULXr50oJf9nyqw60sPyB3dDCxnXps61lIO+gVzb+B95qcYG0uDGkAx+R8jsEesXlSV7zyvZUjv3z66CcfSgsArm9+6X5t+a4mkKsCSIT2pu7Rknqh8DaxDRni2bOcArgV3fgC1bZ+P4l31MygFML6e20ioHmG/qZoyOdS1TET6Id+lUIqWr+zyG5gGDWGg7OkcU8Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.samba.org; dkim=none (message not signed)
 header.d=none;lists.samba.org; dmarc=none action=none header.from=suse.com;
Received: from AM5PR04MB3073.eurprd04.prod.outlook.com (2603:10a6:206:9::24)
 by AM5PR0402MB2930.eurprd04.prod.outlook.com (2603:10a6:203:9a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Mon, 30 Aug
 2021 04:51:04 +0000
Received: from AM5PR04MB3073.eurprd04.prod.outlook.com
 ([fe80::b406:ab4a:fee5:1c37]) by AM5PR04MB3073.eurprd04.prod.outlook.com
 ([fe80::b406:ab4a:fee5:1c37%3]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 04:51:04 +0000
Subject: Fwd: [lca-announce] linux.conf.au 2022 - Call for Sessions now open!
To: samba-technical@lists.samba.org
References: <mailman.1449.1628546862.3102.lca-announce@lists.linux.org.au>
Message-ID: <410b9758-c91a-2c65-9d3f-fdb76353ad3f@suse.com>
Date: Mon, 30 Aug 2021 14:50:56 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <mailman.1449.1628546862.3102.lca-announce@lists.linux.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from elen.suse (14.2.156.83) by
 MEXPR01CA0132.ausprd01.prod.outlook.com (2603:10c6:200:2e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Mon, 30 Aug 2021 04:51:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfc18b61-8415-4814-541b-08d96b71c5cc
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2930:
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: 5hxCsxiOfiu3NYF/7o4/S2eg53j35VtvehfART8uT3j9UVpZaqCXTPsvCakMidZJ4MGrgFF9tsajhC/l5geTKuVSA/3cp+RF/B4kvGj7TNszdKwlzwpxBUoOVQK7p+4bdfmVzuNdMLwbU+uo/pxWR49oRG9jjem8R1QCkDQxV/h84tgDI8teLunRS+2Z7eotrsmCjbsfZxV4eTStU3atbxULZrXogCjTlGRElH/x7mvIlVVTDOtiwMipexGPWlYOTgGtRfWJb3a7+0TqLlR+phWEdpuoJFhfrjOYqr1h6wEYj9DBeEcUwe1LtCGTvNFxriAQID4dEhyQtFPRMniy0EWXVvgU5Mhjf4UwJTPoRs2pQEV/8aukkdwnjHrPvvW5hpCN5/plXSbxzyLAMLxsD0zzFRP9NIAGwl7EB9Ea5peNI3nVzn4XAaxNDqKmy2mZTgYc0jexLIkOLzRwJYeNDkwyG3Xi8O/Tgb+mlqqlzL3iT9IhWPd+uNT4Scw9v7e+RQFWDfu75HuqK2liYPijNPqVUZC98TRm1m3B06FJP7RVRXmAmJ7nZpH+9604Whi7V4ywi/7wEydohQfvSME6852rfRqLKugEteKUPaTtq5NjprFYW8UutNz9ISQpQiTlJaI6It2mmOsQFUCNdf2m5E9Rg/hB6Do+WfykTzxzM56mY7wV32MeB4xww0O3qngwkOf+Ctf8kf1TvQ/3tTfFzm1sljerHeAIwyKtasBSYiRC8HIV33nA3q6CMrAnbvNfInU6qX9I4aEK9YPTOj1nCL0e//U3ND5RlArTmGKm8vHm38HLZ75HAVrd64uU3wzK4Eoi2pxNbx4zcnkinIFGzyF0xvOATY+orWay+oE3QOBI10z+wukCJSqbsZ5nr9pRXPFiZ73vO86/MD4j53L021lJoycoDyjEjf3/M//kVAU=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?9RnC3okUHrVrxpc8HlFSoHtViu4fqZyCO1nm/l9XKyIJslAAe35eoqbx?=
 =?Windows-1252?Q?+na41OotOiVjyFWaYpjsMm8YrPDfUUqwIBIxyK88mKS1b9SyvDwPfbZZ?=
 =?Windows-1252?Q?LtRnazlo/rnoaOrU3H/rGvyawkUwaXKpybtdfu3fqHZaR2LX12SwTa6m?=
 =?Windows-1252?Q?O0FOFIq8mY3UeI1XpMRawmPjHinUWk8icG2xTl57sAvqq/X33XYj/2XD?=
 =?Windows-1252?Q?JDlowuNFZdyiQGPX4OzITnHRvZHT7/4GzTherjLLA7Jb9Exm3XnL7ZGp?=
 =?Windows-1252?Q?gv6Wi82S/t/2XJ/T3bZLBv6mEXz40wygVerut0Bfwi0NlBQ3fiwlyuiP?=
 =?Windows-1252?Q?m+ZgexVy2rwoA07gZRrjth+bHrQdn5d1ziGaCwsC/fTx5x8MN2NusvMi?=
 =?Windows-1252?Q?MJdX3l8PHt4ApjjiGL62j6i/u5Pn8LwMTe7+zTMiGqtBlNgBEWVtMqjq?=
 =?Windows-1252?Q?LFPxhHxsy5QXq/N6Keo68Z9Vshn+HaQVcNB94oy/wghknUbQFkFDM8oU?=
 =?Windows-1252?Q?uiNlGw8kmz9rvKI5wj4dTZEK3UcMNNJ8hbRxQ7DA6X4nxKMPW1ej6NEN?=
 =?Windows-1252?Q?0GeQQvpZ49aK8dMlekhx5teFiED8NJQz4jST6XuYS/rNe+NY44lRJmhh?=
 =?Windows-1252?Q?LqMnmUXbrXFTw6SoKrhWpWfNSa7Ulwyu6VwoVuyvERv1qbsmtfs2zJi2?=
 =?Windows-1252?Q?b4JJHyTJb1WURn3y/zxLPSbCHjVz8ZA/bpMk4gmcObALJh8YvSZcfbAq?=
 =?Windows-1252?Q?z3zcH1+J7oYoMP/eOAzJBuMJ/mX17zYsTUNGPb1cJgExRzrV4OU/6B4O?=
 =?Windows-1252?Q?G6sTsmE508txORMQZ2gl1M8OmU2rdFkf7NqxE1WFdxqYVcepY/Tfj2Mm?=
 =?Windows-1252?Q?wdVT8CC1Vs5afo996IuIkQOaDON1ATVLuMfTgCuC/ifO4GdqZAIqdCp1?=
 =?Windows-1252?Q?cc+rAKNIgHKNk9si68WvY/cjwLPj0I0dxH8b8alZDrv/Ak3zc1gQheOM?=
 =?Windows-1252?Q?IIuLgVF4nvYsBKR8bRoCmbHzBrs3trUpvaWqL+WLhFnNNzgcymdfUQ/B?=
 =?Windows-1252?Q?4K3XzEZC2zhH/6lCbngOWkdJcwcr5mKepH9L6cTzQojonR+RNZjLIWXi?=
 =?Windows-1252?Q?DsHUIB8xJyRZoyhkwH0v+uZLYxQl1dBjLKQbxTO0G4p5HEp9EUu/umza?=
 =?Windows-1252?Q?EhWC+GKZbVoNDx/yukENbbCN2Px12AmrTCygyX2h0YREdl1t2stXr/pj?=
 =?Windows-1252?Q?O5h6KS8LUk8vYqSF5fV1WGxKepi8JbayyftQO69jK7285kDpsIlCoPIt?=
 =?Windows-1252?Q?uZt5b9JeoXLfMtF08qc4ZSCq2s/qFWfJjGF3bOXByIz33N4gpgqFntOM?=
 =?Windows-1252?Q?O1iEL3EqFGV1MvmmpPAKMTghTQXBQo/N/W95wpN2xT4DLBtmHWmbBJib?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfc18b61-8415-4814-541b-08d96b71c5cc
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3073.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SWmal4Zk9U+yJE+MTFoiA3Zx+FNneRhSYHIT87Rkc+zRKLfyuECBE+xLP/P+25gF+pQD0ISU4453eRCHFa+gYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2930
X-Warn: TLS-SNI hr1.samba.org
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
From: Tim Serong via samba-technical <samba-technical@lists.samba.org>
Reply-To: Tim Serong <tserong@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

One week left for talk submissions for linux.conf.au 2022 (virtualized
for the second time, January 14-16 2022).


-------- Forwarded Message --------
Subject: [lca-announce] linux.conf.au 2022 - Call for Sessions now open!
Date: Tue, 10 Aug 2021 08:07:01 +1000
From: linux.conf.au Announcements <lca-announce@lists.linux.org.au>
Reply-To: lca-announce@lists.linux.org.au
To: LCA Announce <lca-announce@lists.linux.org.au>, Linux Aus
<linux-aus@lists.linux.org.au>


The linux.conf.au 2022 Call for Sessions is now open. It will stay open
until 11:59pm 5 September 2021 Anywhere on Earth (AoE).


The theme for 2022 is 'community'.

After the challenges of the past year, our community has explored ways
to rebuild the connections we were used to having face-to-face. Many
Open Source communities already had their roots online, so how can this
be applied to other areas, and how can we keep people interested as they
shift to living even more of their lives online? How can we keep in
contact with connections in other countries in a virtual way?

If you have ideas or developments you'd like to share with the open
source community at linux.conf.au, we'd love to hear from you.


## Call for Sessions

The main conference runs on Saturday 15 and Sunday 16 January, with
multiple streams catering for a wide range of interest areas.
We invite you to submit a session proposal on a topic you are familiar
with via our proposals portal at
https://lca2022.linux.org.au/programme/proposals/.
Talks are 45 minute presentations on a single topic presented in lecture
format. Each accepted talk will receive one ticket to attend the conference.


## Call for Miniconfs

We are pleased to announce we will again have four Miniconfs on the
first day, Friday 14 January 2022. These are:

* GO GLAM meets Community
* Kernel
* Open Hardware
* System Administration

Based on feedback over a few years, we will be introducing two major
changes for Miniconfs in 2022: all presentations will be 30 minutes
long, and each accepted presentation will receive one ticket to the
conference.

The Call for Miniconf Sessions is now open on our website, so we
encourage you to submit your proposal today. Check out our Miniconfs
page at https://lca2022.linux.org.au/programme/miniconfs/ for more
information.


## No need to book flights or hotels

Don't forget: the conference will be an online, virtual experience. This
means our speakers will be beaming in from their own homes or workplaces.
The organising team will be able to help speakers with their tech
set-up. Each accepted presenter will have a tech check prior to the
event to smooth out any difficulties and there will be an option to
pre-record presentations.


## Introducing LCA Local

We know many of you have missed the experience of a face-to-face
conference and in 2022 we are launching LCA Local.
While our conference will be online, we are inviting people to join
others in their local area and participate in the conference together.
More information and an expression of interest form for LCA Local will
be released soon.


## Have you got an idea?

You can find out how to submit your session proposals at
https://lca2022.linux.org.au/programme/proposals/. If you have any other
questions, you can contact us via email at contact@lca2022.linux.org.au.

The session selection committee is looking forward to reading your
submissions. We would also like to thank them for coming together and
volunteering their time to help put this conference together.


linux.conf.au 2022 Organising Team


----
Read this online at https://lca2022.linux.org.au/news/call-for-sessions/

_______________________________________________
lca-announce mailing list
lca-announce@lists.linux.org.au
http://lists.linux.org.au/mailman/listinfo/lca-announce



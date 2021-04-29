Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2178836ED2B
	for <lists+samba-technical@lfdr.de>; Thu, 29 Apr 2021 17:14:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=rXRj8Vx8v5hThea6XvQ8/PFTVnbDfTqNDD5epJgFnF4=; b=spbXqv91w0DvXsdmVFjj6G+1YT
	YQDMzKsEYPrmHW6wbGItPstD61cxKuGB6ztgM048Rm36rTHVrq+ozpK7cmYXC8f50Q+zjaxk5ZcBa
	gA9coqtZFkcV2Fvsvwm8F+YYzSp9SGgwPpqfel8gOiIMgbZsXjHPtH20L3isaTDA2JcKVmXKKion0
	rsdbAlSoPsWk6ITVbklCZGhboMkudDgBtxnl88Apy/C0jM96kXOUOSsAPknOOJ5CRjE2+Aw/QDafd
	xQvMzvNct87B008KeTfSW6q3FJXx7nXc6bCPJr7vvrGAtUVhLg3sQ6RLDpDTw1aRZHb6KzJpjrKDi
	4yGGrpaQ==;
Received: from ip6-localhost ([::1]:60142 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lc8N6-00DCW7-4q; Thu, 29 Apr 2021 15:14:32 +0000
Received: from de-smtp-delivery-102.mimecast.com ([62.140.7.102]:58391) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lc8Ms-00DCW0-UX
 for samba-technical@lists.samba.org; Thu, 29 Apr 2021 15:14:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1619709255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4fS1h+z6U40GCIVEGXqEAXfO1JKf3Bqahv1qHHVoDEo=;
 b=BhEZu9iIM4n675Ipb4Y1/xTpYVhVh+wVakpcpyjVYn6SO4tlod7eR1bCa5kzD6FMqT6uCp
 hh9XCIsoOCy5imteAneG/mxST2zhCh7gnAFEnXVSH7Keew3fSO7aZJti4mqTOZdo1rvHzQ
 W8CK7Em690Bjj02ZYn15RvUYJQC5K64=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1619709255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4fS1h+z6U40GCIVEGXqEAXfO1JKf3Bqahv1qHHVoDEo=;
 b=BhEZu9iIM4n675Ipb4Y1/xTpYVhVh+wVakpcpyjVYn6SO4tlod7eR1bCa5kzD6FMqT6uCp
 hh9XCIsoOCy5imteAneG/mxST2zhCh7gnAFEnXVSH7Keew3fSO7aZJti4mqTOZdo1rvHzQ
 W8CK7Em690Bjj02ZYn15RvUYJQC5K64=
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2059.outbound.protection.outlook.com [104.47.10.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-6-uJQrYNJcMYevbl-YYa4sXA-1;
 Thu, 29 Apr 2021 17:07:53 +0200
X-MC-Unique: uJQrYNJcMYevbl-YYa4sXA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oTTWrEnPzgawdb+gYOcy5PhKXus9B3QoVywTILVtsvYT+XNDVv4HqiAbkxYhqxD8YUYl3M149DwwWs/te+HfeI3fy3YbAGS0iCFqU5HtPRaD1Xs1l2UrhIYnLhhFdrum9j6XZJtPIzoBkaWcItp2vCemfYcjhHb6rzJ+ZaFpDI813MWWhttECqb2PQjYauAvcuVt7SNYfDmp1cYu2JQj+4n3eLUGmUtgNMX64jzuQGbXIy7EAKwOypxniXf8cNw6D/ZBaQTOs/zrvgZRU0EgNVNHMRd0dPluvhGLzt7lad21ZBv5cBMCgFy0aFwrOCoB7x7AF42GIjRj5MhwCJrtMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fS1h+z6U40GCIVEGXqEAXfO1JKf3Bqahv1qHHVoDEo=;
 b=MXFUZq8ruwL0tjjPde/oL+BmFEH1mhQ2jGd5dd4AJCWBournjXeDB+FiQEKa/q7TGuCpouZpoVgi9jFHrhht6jHbzVoJjtzIgI8pmqL4nQtqdwD1ieRAxprbhUb19+09DTQ1OegqGTK/I34mzG+V0GeM93jrAM38hhZq3lktsCs0+p5CK5AvcRv9xK2w8g3bwafx0tTyy0ls/n8vkpqG6tbV4zrORxAnYbzgN0mHyhiKXaBrJ4TXCJbYiabQuLWp6ZbGIRWY5RfPcjP79Y1R33bWYjbNo7T6cflOuRaZJe6JRLJP/y+v7Ql7JQHgwkdopPqoni1cjxNC7xz2AvAbtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: samba.org; dkim=none (message not signed)
 header.d=none;samba.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB6131.eurprd04.prod.outlook.com (2603:10a6:208:145::16)
 by AM9PR04MB7554.eurprd04.prod.outlook.com (2603:10a6:20b:2da::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Thu, 29 Apr
 2021 15:07:52 +0000
Received: from AM0PR04MB6131.eurprd04.prod.outlook.com
 ([fe80::411:df4b:cbc0:3f26]) by AM0PR04MB6131.eurprd04.prod.outlook.com
 ([fe80::411:df4b:cbc0:3f26%7]) with mapi id 15.20.4065.027; Thu, 29 Apr 2021
 15:07:52 +0000
Date: Thu, 29 Apr 2021 09:07:39 -0600
Subject: Re: Ubuntu's ADSys
To: Rowland penny <rpenny@samba.org>
Message-Id: <RCZBSQ.RP64LWX1DB4B@suse.com>
In-Reply-To: <1d705810-cb2b-4012-6431-bf92cd5b213d@samba.org>
References: <YIaZmO3WleOfenUn@pinega.vda.li>
 <vmime.608ab327.345.7841bc1123a20017@ms249-lin-003.rotterdam.bazuin.nl>
 <1d705810-cb2b-4012-6431-bf92cd5b213d@samba.org>
X-Mailer: geary/3.38.2
X-Originating-IP: [170.39.98.113]
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.12] (170.39.98.113) by
 FR3P281CA0066.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.8 via Frontend Transport; Thu, 29 Apr 2021 15:07:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a04ba18-82b7-4b2e-ac9d-08d90b208f10
X-MS-TrafficTypeDiagnostic: AM9PR04MB7554:
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 7+j+nLynQllrzuu01kfKjs2/k9HgMriYuOxJbIeSM2zHikXU9errXPC5NPBQQ3Feelb8ued8McPhHPnsDI6qxkyU6mZpZzKunPPVWSxB6u44QUBuTEd10re3DL+OzAxXiSi0OuhHWZPy0f2fmoRnNiQHG9hZBVw7ZTW/bKD319pQPuK11+ZeKO6JdFzAoC82DuFUfEtYaV6pOmo4cZ53MPjkxiTt8dsJGW8Pysc5Ef6wGHPUmKn+kp/Wd2knyjn259eiXj4ArJaPGqkLnjvbG8068sD3OpaEll3zTPJOaqeSi8D0Xf6NHdx+CPP93+t3AelEX71SxZjwC5ke/ui81mN6Q52/zUsSd2Hw7a6F6r0EFEx4I51YviSTJoPOWe4LV21I0ECtoUWk9+P9kUOnNZJxChx8lyHlP3lS2UiLeuoEBjrrvFqXcONqJp+pixusTFE6WQ7qRE/1yXDKQ6QtXwxm07zfk4OAeeFoOeb9bZyvuBQfTVItiPJSX4LUmz6NI+ByIgrP8qVYlGqZTEhGX4TYdDxsG4NwW14ToGevwPAVWQ04j60L2Bqw9owXdWg2RBTLCTPVBHvLbLbQChwoVBN/aTQ9kJ8IRwk7831prEvPisR8cVKKLaslAh/q8Y0F9xbxaZSLaOAe7RDtuegqcRYKjhBR7jAwJs+h/n405uxk+6yga4UVJoHJPLzf6jVa
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?wzoN/s3Zw/Kks42L3z3YBJs4EmJc5f5gXVAjNPvm9R6czczM4ynE2QCYfAbP?=
 =?us-ascii?Q?SRJ/qVYA7ZgJfxdgPhtHcvK/EdOjAb3qZxZD+kwMjn5MAVDJlEa/jsaDZ4OS?=
 =?us-ascii?Q?wOuBwBbbGyUMYOUQg6nvl0DfX8LAs4RjHyNx0ZR4YdpbsDw3gVDdWoqg2O8r?=
 =?us-ascii?Q?xyhI22IZXouXF9VIu64GoGTnWit6ImNK1HTh1/BCl3OGBTisTJwcYoFbXF2p?=
 =?us-ascii?Q?ruOLCaCxYdFxfHmA21oOYNXAuDY3uxvBhqIXndfjHhvX5+uQgN5nR2eIwOBd?=
 =?us-ascii?Q?Np4tRgzjmzRlXURCjn+ROC6yPvmfym0iaKWdvGIG+fyOyefwWOdu1ZKSdRDA?=
 =?us-ascii?Q?kAk3nPndliG8yZnlNOq+d3tSPDgeWmWmOwhVBPL7hBwvRCAVqGKKJfEf3gLj?=
 =?us-ascii?Q?PnsP4kXUCJt/LJkTjVfxjPG64Yl2Fr+bElVwqSPQF09bbCt2Ytfh6XO9hOZ6?=
 =?us-ascii?Q?w5zuE4AuXuMXuoY/j8my4RxQ6iGSBbLWQxPBlfrQbMyCL2nM8ie7s4/gUWNu?=
 =?us-ascii?Q?zaA1ePMh2kBMGmwIvyfNtPLbmHg5w35822JXHuC9MoDbKkFa0006LjVWWtQk?=
 =?us-ascii?Q?8SBQ+08WB6ecN1Rv7g+DkjPejbu4kRIqnQraVV21mP1vkgWzc8onrZ25hdhc?=
 =?us-ascii?Q?GOHQ+BTNMrRW4nMbXS0dUYbbQZ2gziz7eiMy+TxReYmvCiZEdmI+uFEvkxxI?=
 =?us-ascii?Q?tDrXPRBzGziQcXONLn36DDFHrkDQpPaOeQzd9b7hC9otOoyxp2ZN/ggEWVcd?=
 =?us-ascii?Q?rPV60FXFuA3TN5U+hdAQvT3t6EGSBL80ZfRZXukgHvHcZtolDHmqyIKZK9KS?=
 =?us-ascii?Q?S7dAMr3+d0nsgIB5qlwNhkhF0Mo5XT3UFWY00U+70mquT1fIB7BAR0Wpibkd?=
 =?us-ascii?Q?d5xaSqoRQ5z5mvTwJE3MZEU4IvFB97vadNSviIGCw71cyOO6obWkMvmF3WAH?=
 =?us-ascii?Q?aHJjyJiEwPR8em868/djQbCWmK1VgJGbHMZFuWKvairTN5HzBrzeJDmRJb0p?=
 =?us-ascii?Q?6nGPzV449bz4LZBy2kQDjuxJlfo0g7JLu/dbDw3bOq2ALdAEZqX/UbV6Gq6n?=
 =?us-ascii?Q?ZfVx+EQ94hQx78ppnMuKVPCadoVzDcdIcmYFTtDLKdpnas2tLBQ7sWeZyqi/?=
 =?us-ascii?Q?wK1luOk1B26nu6dpMjBa3P/wnQAse7O15H3Pj0hqQ8V6gRVSVvRA1/kJlYYS?=
 =?us-ascii?Q?D59Ma7pS18AoboI4yAptyuh/R3peKjsgG8/73Uoxj0QjBq1/SCfXKO596MA/?=
 =?us-ascii?Q?wtEO+mm+pNpB/+Bd6TsaZwaLeYzB9wEYBqSOIJOoqcdsVu1R2oMishMIUqCd?=
 =?us-ascii?Q?MJ95EkNOYLGvn2mLuxiRW/Ni?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a04ba18-82b7-4b2e-ac9d-08d90b208f10
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6131.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IQv4pl3WN8/SyhMteIyp7NogfIiglbHbZGZhrr/iXvr0JvMCGpJP+C+Z81cCspkDYlZxG1izz0fp7Yzu5NEUjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7554
Content-Type: text/plain; charset=us-ascii; format=flowed
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



> I was curious why something that had just been released with a big 
> fan fair, didn't work, so I decided to find out why and, seemingly, I 
> have. The problem, from a Samba point of view, is that it depends on 
> sssd, so precludes the use of Samba. If 'adsys' can be forked to use 
> Samba, then that might be an idea.
> 

Samba already does group policy via samba-gpupdate, and it happens to 
work with both winbind and sssd. ADsys says they provide "password 
policies and user access control, and Desktop environment settings, 
such as login screen, background and favourite apps". We already 
provide password policies, and user access control is in master. Adding 
desktop environment will be trivial (and much of this is already in the 
works). We're providing policies for smb.conf, ssh settings, sudoers, 
scripts, and more. Seems to me we already have more to offer than this 
ADsys thing does.


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 63872375587
	for <lists+samba-technical@lfdr.de>; Thu,  6 May 2021 16:22:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=OQse68S8puA3yAHb3mf2nsw12n6tXmNoAfXkOCH14rg=; b=V/9QQQxic0Sgs5+vlH7/YmgzqN
	Fou+qOOhXwr4BAiw30hAyT4NCyOTofkOr2OtvMYymiLJg11X6JBHRol2KeOBohMvNJxxMM7Vyh7zy
	w4CvjptEGBSPGWwvHtcoCRbbw1Qo3ubiKWEcMGUBb/0qcAjoVGHxJD88NPczF9h1pbam5ksfP9Rve
	haXFCHKff7qWGy4i6t4DcOoGl0mr9cjq0lg1NNIvX/E7XykhPqIpAJhicO2SAwnTRuA8kN66hXoO7
	yIPSW3bD7r8y0bp8Egys2bF6eNu6+RnM/KMOOB/JXphWB5MyfeWyT3ZZTquZMNWrw5OBWGmGue8Wk
	sKDnHeVw==;
Received: from ip6-localhost ([::1]:62106 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1leesQ-00FoLZ-9U; Thu, 06 May 2021 14:21:18 +0000
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:28734) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1leesK-00FoLQ-ED
 for samba-technical@lists.samba.org; Thu, 06 May 2021 14:21:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1620310869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h1TSXmEgK6eKz+hvQqptgiTzADPIE9wB4X8ww5jPiWs=;
 b=OA3kI96KL2XcCbHM8IdlHueT6f8pIH5/5PrsPb9ZZD+W8mwfAKOEpyWhg/W6ql6V3vsyB4
 gH5MPyR/jUgjI7zTprWlnnYrJ1yWnma9IL7Eevc4UDO5VKJizXZ7ntQI7Wxa5f+Kws5A3e
 /KTEeHHM3Ij+XkH/kTnjhh7X+m8tmAs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1620310869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h1TSXmEgK6eKz+hvQqptgiTzADPIE9wB4X8ww5jPiWs=;
 b=OA3kI96KL2XcCbHM8IdlHueT6f8pIH5/5PrsPb9ZZD+W8mwfAKOEpyWhg/W6ql6V3vsyB4
 gH5MPyR/jUgjI7zTprWlnnYrJ1yWnma9IL7Eevc4UDO5VKJizXZ7ntQI7Wxa5f+Kws5A3e
 /KTEeHHM3Ij+XkH/kTnjhh7X+m8tmAs=
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2050.outbound.protection.outlook.com [104.47.1.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-2-BSK-Ps41NOyyjerBpX1TOg-1;
 Thu, 06 May 2021 16:19:57 +0200
X-MC-Unique: BSK-Ps41NOyyjerBpX1TOg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXn5dmbXuid4XtkSLTkoQB2HVVEs+rZZ1SHqWojYbyvDpFmX4xZsajx/xiEsZZ1e1TQYhCe+0lhMOIVwI6kCuPO27gkFcI69mJABGErE8VDKnNLufJpweetFpLwEBuAyKDCdZfwCxi8Tv7kQtiX1p+zjaVR/7RAAhGAgwt5czzZviG3S6cdMPwi0fZNQvJjEMAFWIrD/+cHMQqGvLY5B5F0BWR2BUIH105eeHjD+lbX5+B2yz9YZ2uCUaparPMYgz5E4EYTi4FXQ4r0hnY0JxrTYbQZeEnQ5qRR3U/jxZqtOEMGh1E3/hKmn0CpP0+SHJRaoIbTTa612UlukZTcg5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1TSXmEgK6eKz+hvQqptgiTzADPIE9wB4X8ww5jPiWs=;
 b=XLXKmFcjmxDWP4HIRoJ+eXV6fnCqNyq8/9tef5plILX5Pf8fK75Vh50VMMDujO2QR7Dh390kkP0gg73qM14Igd9yugeRKNh+9DDRcUGrP2ZiCcH50QXNXywLmXP8vU3BQScFkoZRSf4VoNgISn5gNiw/Fd5vw2fixVJKJ+GAqc6+UkyH3Qv3GJyK5tcrJ610vl68+gTXTzZdEwgdVoZZASsh4iOgr1Cgia98g0BA3vebU0UBxUFq/QSqy0D6bMmXYwyK7NEvQ4NXIUYQ6gCcSbQzBZEojQyzvb70ZnBhg391QbZcb59g5v5RpRckHdmXfXFaEAzLSuU6AUnHQommGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: catalyst.net.nz; dkim=none (message not signed)
 header.d=none;catalyst.net.nz; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB6131.eurprd04.prod.outlook.com (2603:10a6:208:145::16)
 by AM4PR0401MB2227.eurprd04.prod.outlook.com (2603:10a6:200:4d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.43; Thu, 6 May
 2021 14:19:56 +0000
Received: from AM0PR04MB6131.eurprd04.prod.outlook.com
 ([fe80::411:df4b:cbc0:3f26]) by AM0PR04MB6131.eurprd04.prod.outlook.com
 ([fe80::411:df4b:cbc0:3f26%7]) with mapi id 15.20.4108.026; Thu, 6 May 2021
 14:19:56 +0000
Date: Thu, 06 May 2021 08:19:43 -0600
Subject: Re: Samba XP fuzzing tutorial prerequisites
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Message-Id: <VSVOSQ.SIQCCMOGJ5QG3@suse.com>
In-Reply-To: <65193b15-12c8-72a3-36d9-fd730025e5b6@catalyst.net.nz>
References: <65193b15-12c8-72a3-36d9-fd730025e5b6@catalyst.net.nz>
X-Mailer: geary/3.38.2
X-Originating-IP: [170.39.98.113]
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.12] (170.39.98.113) by
 AM3PR05CA0148.eurprd05.prod.outlook.com (2603:10a6:207:3::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 14:19:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9d7c3a9-2eb4-4591-afcb-08d9109a05e8
X-MS-TrafficTypeDiagnostic: AM4PR0401MB2227:
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 5/tCwJXGtWZBg20UA7pGoF1UhufNb1GqXx+kf+h17xCYi9r0VdAhD+WS5/z0VqrPsoWx32VgjoWZAEFJloFacrEXWFSWozJ2j3IN4HGmxzYh/RCx6+oBbTkcEx7iAchjbfkLWh6YXWe9eZShWwHA7lbCmCD+2QI31whAzHfsDXFiKg7QejPtn432OLXhVKaBvXiLkhYveOVJ0PcqjXjJ3oq5sx/jAklPiBs+yi+bC8KM7F/GGc7Dv/a6mXUXJaqifX/NwGsqQSGYl34z6atixCvBzc7vYSBbIyo1fM0vrMqe4y4ZbzgYVC9jsV+7psE/rJ0p+mKill8v6+jnYwc5XoAHI+rVYw3Xu+6gENxUjs3ktc+QBPcbRvA+dicTXLI4hh29OfVfjwPa5dSfMxKo0fsr17jEzHn/u6CXjavCdolEwxbouJPCrtK2SUs3xF/fS+WLgwVpmHVOdGH2lWesEo1OJ3YRc41h7OtslY8fWCOLEt/TSxeYobW/2MQPuI1ahXQpnfCQWtKAQ9dMT0TueShnRw1ez8hiTtz9dA5Cnj2EClduj4035AnGoYhdd8w7DcVQJ6sO1FSqg7MxyLvMGcs9KBf3I2J9io+Qyuyv0r37pfn26BeJyJeZBrAOtWe6LviSwEjwcmSJmGbUDEkw7GiFukUR7qEF9+udOFMA9N61yrdF2tcPwp6mQfVjIARrJck3ubt2F5CH/Xl13mFUcAzA8zBUj5YXKHDBseImdfBWqbWYCFeyW0gfvRMGcMF87+IbVbQ4PB2C7ALiGEjo/g==
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?HxK3AFNq/GTs52HAMZkTkF8XQio1rwxHYv340oCpEa+/Oi3QIz38IFlzsCTn?=
 =?us-ascii?Q?lsSRIiZtbS4MWywWHNI6FqapThsU/wLhOgBsMk2KRhJYQU9N0dq45lo2mdGY?=
 =?us-ascii?Q?0emcQie0REykG+sMBpES1GRwuxDxkp/KnWT5CE4pMWjZGw39k5J1Zr0zx0Eg?=
 =?us-ascii?Q?YI2hP0IPrqsx5VfsQJGJS7FdG0jX6UD+Vwk3DTuSnHkrQW6QQyd62K1RHcet?=
 =?us-ascii?Q?esNntJVlBMuQKNwQH6/rDAC/uD3+PFcEeTbEFE3uPiN7oCBKCPuQLW8g6VRg?=
 =?us-ascii?Q?tbiVRA+MmRV1CLTn2n8GrVIYSuekfYB5f6CDraAZQzanBA8/HaFyO83mepAp?=
 =?us-ascii?Q?rYQg+hduaV1eJ2wiNzMCkPnHmaFhphtnVT1o05OATASs4gf6zeTYR4bquww1?=
 =?us-ascii?Q?A54pnT54oNei62FXKd5370r4lmOCLeV6kIh4WN5lbwmIG7fsJflX5XlDmYsX?=
 =?us-ascii?Q?C3KsSzfeFqIfUp7RVK/lySmKL+RZeOywru8FYOJ8u4xSWi01TurdU91vGmvw?=
 =?us-ascii?Q?rZ1egz6Ake7C6Op5yuLze+NC4C/1GguE+brah90zxaX/pVBj9mU9Sf1VHLgl?=
 =?us-ascii?Q?4kH54Zoh8qWDnU7X4094dgoMIYss32/MSUA9psirUxXzG2oCuevTEQDs572A?=
 =?us-ascii?Q?+6j7aBD4OqxcwrknlPN3BOWvG73Mjq22ShX2Ddzej4jGw7oEdmvruZuz0yuN?=
 =?us-ascii?Q?PzoljcHb4yV3xd+67lIrNg7WWIY9i2I9oHU0RmV0qarQs2yLJMsXFIIOqRl5?=
 =?us-ascii?Q?JuCg3AWYXqYxIsrwwa/IDlHjeHTQwgmQG7h9h/D08/pvRvUjvZ90oi4MxGwI?=
 =?us-ascii?Q?UF78G99AqdWhtI9jpmNNR4gSqGZMihtsVLxebJd3SjiTwWHGS20q/tBVH7b+?=
 =?us-ascii?Q?ecrHL+jX3cJUp5WyI1L7kk3cnc/Tv21A9/nwfOwbOTcvIJ4Nl3mX3PT5KLLn?=
 =?us-ascii?Q?g1ctwvBNmRI6LOseUp1gSUsVQ12hPdytFBmHB768zrGHIR04pQNO3GChGEYt?=
 =?us-ascii?Q?Q1qjCys4B0e/2e6LWgum1Hr+1HoORvKAH4XLoR5v/Zn5W1HMPUAHaL5qvtmL?=
 =?us-ascii?Q?eHAGP823bW+fFJ+Nz2khtbTRZbXePuAHF3KN0BIjcTY5gyzrwzerWxz6DH1m?=
 =?us-ascii?Q?hKQifpFE0CiPilcfTFCf+Ap3qsTEPnxdHA98S/p1bVMK1EqHVxSqOcska5oj?=
 =?us-ascii?Q?ImJ3O+89LU6CqfT0cDBxu5whQn9az6Cb0yJe8OMej+JAqH3zGHyr/Am7dmtP?=
 =?us-ascii?Q?AouJXjemcpeFsW0nFs4c10HonI5CK9urAjC8y/Yxqty16nxbUH8V+ca+TRCd?=
 =?us-ascii?Q?0xaPs7/njYbZXroc+LvAgtB6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9d7c3a9-2eb4-4591-afcb-08d9109a05e8
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6131.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lHFJrdzt0Pn3zJllLSR9OJHYSSkrmsmtXO+gamTz/cC8n70lhKnEybCFEfHp324/K8sI88y2f7+DGZ4bC6Y1Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0401MB2227
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

I'll point out you need to specify hfuzz-clang on the configure line 
using a full path, not a relative path ;) I just tried this and the 
configure failed because I used a relative path.

David Mulder
Labs Software Engineer, Samba
SUSE
1800 Novell Place
Provo, UT 84606
(P)+1 801.861.6571
dmulder@suse.com
http://www.suse.com



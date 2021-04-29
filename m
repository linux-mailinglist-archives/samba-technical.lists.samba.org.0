Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8320D36EE08
	for <lists+samba-technical@lfdr.de>; Thu, 29 Apr 2021 18:21:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=6C5ll6TcWWN/fMRW+WasaQils1WdCHVe6ZRrjRrmXVs=; b=Hk3m4EIpHqEjfFXMjV0ZjRE/ta
	/0eL2wrGws2fu7oKgQ5UuIosD+qovD4LfwuGleJtalum9yo2ueFQMQmJItB7oL+IlC/ZMQcDlweib
	UH/PuAJrixeBBdKiMjIQjhl2CAfhGImBYI3hY0zBSb4co9mMh8/coCvIDDJjo0LgD7/1A966yTtJQ
	T1FpYlz7qwufYp0oAhhHF4pBqOLTaYMBwV+LFTuidSh2UgT3gYGttGqq/lspFl5i50lv67iGmNjT0
	DizJBzzSZfnXq/HBigHhOv6wVUVvWKYmsFypUw4/neYRmfj3eu9kgzvOU4NpfECMDNPOU5e+azjSf
	B7DAmlLA==;
Received: from ip6-localhost ([::1]:64562 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lc9Pb-00DDEv-1D; Thu, 29 Apr 2021 16:21:11 +0000
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:49078) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lc9PT-00DDEn-8c
 for samba-technical@lists.samba.org; Thu, 29 Apr 2021 16:21:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1619713260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vOomPc8bT3APl9y02VWLb2KZWHXLheeo99ugcbkmAmQ=;
 b=R9b55RRFhT6Jyw4Qa1DTZ1HkXTPc1Ye9vhcemVbIoOare0d2iSUyCRH6xno/CCX9n7zqz/
 XYnKuOVMDkE2b9DH1G1BlU6/Ka9+djvk8m+mNDXWOiUtNsVdt8kLuTEHnhLyaHR7Mh7eeU
 Ym4A0TGhDFCbwZ/QoqUdpPhfh3p8h+I=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1619713260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vOomPc8bT3APl9y02VWLb2KZWHXLheeo99ugcbkmAmQ=;
 b=R9b55RRFhT6Jyw4Qa1DTZ1HkXTPc1Ye9vhcemVbIoOare0d2iSUyCRH6xno/CCX9n7zqz/
 XYnKuOVMDkE2b9DH1G1BlU6/Ka9+djvk8m+mNDXWOiUtNsVdt8kLuTEHnhLyaHR7Mh7eeU
 Ym4A0TGhDFCbwZ/QoqUdpPhfh3p8h+I=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-7-wq3qL09RPd64Lz2Y0VCBpw-1; Thu, 29 Apr 2021 18:05:04 +0200
X-MC-Unique: wq3qL09RPd64Lz2Y0VCBpw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hunQ7CIEiPpwM/KF8kTG+bo0UVk6G2WGMzJER3+x+j1t/57d13FAfooZid1aQDbScEwddAVK0pPk71ww4aVf8Rw2Owp2uwqe21sYaOnZ+3LB0qOh/L9Xdp4rCTxa0eEqGiCkNlI9ajLx8hKEZ0jWsyhg080+BsqC7z9s4Bp35Juy7vFLOYVfasEWjYgRp5Y/TghjuLP73FMe2ZdI1ze8K5CGtTEgIDNUvnEtgZ0BwbddV03SvJoU1A4P0e/f98Ck9JPX/FiLQg+qNwnRwoYhYZKiviLDGZKm94l6t0VeGROCNVZoya8uiY1NkQVvmuChobejxa5/vLwgAek69l6nog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vOomPc8bT3APl9y02VWLb2KZWHXLheeo99ugcbkmAmQ=;
 b=ffUlOvO5PlH+n7NlpK0dfMdpyvUnDd3oReU3yLe1SrB0DN+A133wHeOZHBU8GHKD+0+fET+SrkGKWSqKZiQhskJiYX+tK7RvXCqFCER+zY2E9bzr1axToEJ3bvgfMfl8EPZuxDLa87lzQJjCk3vPW/e0tCaw+5YZoIHi2fxvkHkf78PmME0IM10RrtXlIw1ZHSb4U7DRu9fq3V7NgoLv5oOlDsabb8SVJycv1qNydV15P1+XTKerh3VJlJ+gX7hvplJqKi/SIgP8xMkyT0dWD/mB86Id8u8GnoFpoMRxq6Qu7p/WVttkC0DamrC83tGpSXE7RZNtx1tmifZ27xWUZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: samba.org; dkim=none (message not signed)
 header.d=none;samba.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB6131.eurprd04.prod.outlook.com (2603:10a6:208:145::16)
 by AM0PR04MB4081.eurprd04.prod.outlook.com (2603:10a6:208:5d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Thu, 29 Apr
 2021 16:05:03 +0000
Received: from AM0PR04MB6131.eurprd04.prod.outlook.com
 ([fe80::411:df4b:cbc0:3f26]) by AM0PR04MB6131.eurprd04.prod.outlook.com
 ([fe80::411:df4b:cbc0:3f26%7]) with mapi id 15.20.4065.027; Thu, 29 Apr 2021
 16:05:03 +0000
Date: Thu, 29 Apr 2021 10:04:51 -0600
Subject: Re: Ubuntu's ADSys
To: Alexander Bokovoy <ab@samba.org>
Message-Id: <302CSQ.K437P63P8WCM2@suse.com>
In-Reply-To: <YIrXaNVMOKnOCt+3@pinega.vda.li>
References: <YIaZmO3WleOfenUn@pinega.vda.li>
 <vmime.608ab327.345.7841bc1123a20017@ms249-lin-003.rotterdam.bazuin.nl>
 <1d705810-cb2b-4012-6431-bf92cd5b213d@samba.org>
 <RCZBSQ.RP64LWX1DB4B@suse.com> <YIrXaNVMOKnOCt+3@pinega.vda.li>
X-Mailer: geary/3.38.2
X-Originating-IP: [170.39.98.113]
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.12] (170.39.98.113) by
 FR3P281CA0067.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.8 via Frontend Transport; Thu, 29 Apr 2021 16:05:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c881c6d4-477c-409f-004f-08d90b288ca1
X-MS-TrafficTypeDiagnostic: AM0PR04MB4081:
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Jvn3Xk71x9r1g335UqTIoecQkWuUCzEq8+IUI579PMjag6Lzkq+nr5uUurcvRcdjNkGEI0bk1wlKdlPYE9LH2TpeTI/6FVVE6s3dbqepD8c2BeOPwLKjof2rcVnWpBQQ2s+0Xq2SLhmnwEynyXZaZMz5Ra8JJqu9jqvBjjjuHWq2fxd96PaBa7RqjHqW3MFSdQF0HGSogH0MtORR5d+mDwOtn1ihHwgkK09gfd2yzWF2LCiP33/Jbw8TW0k1KBIOAZxrGibcZx3CleWqbYrhS06AC2bO1/upvvRb6kbJ5ak0/aagX9HnGdEQEF/V09DKWw8S4Xol2npGsvUa0tNMsrRL9SpRnendl1lEVMxLZ36lqjj5s3KRj5Sow8FJIOdkNTEUvqaJFKpGmg92gNvBuxGDtgerpfuvKYfQrR+Wd40gocvAKZ580ELKVhYkBHfpH74vqkJZR+teQxEdOV1ImHO0FzLHJbpr26c3X2cOCIeXB+gX/kkajxcSfq46oh1rsZ7gZs8bFbPQcfTC0YwaZ4IiieDKF9DJH5hHWdN8zhjqoBqXkHRSDO99Y1ihbAV48/Lg7nHndWJOI/5P83ystLNxiNW9TLGES88X9IpYBlWF3shF3xY8Sm13oq8UFTEQSqzZKtq+rnxBG/VD+3taGw==
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?hvULe0rUPwQfjFlDIOIm/JM7+finseLnGI772LsAsulGUV2Pv+2hVw04VF3n?=
 =?us-ascii?Q?/L5FvAWW0GTfOvwYPs3iFYYwKbwnnaf/I53xQqC30xvbVmoyF2gY6/vxJBKw?=
 =?us-ascii?Q?3drq8TGjl7+rZSJJBoueUvDgFSqf10cws24tiF2npEq2SB68Y/D8GbwLqEFf?=
 =?us-ascii?Q?4HnwURlxvRmI5Rkbd/33zv3pL+qWBecmzo4mWvMaOWCGIPOrUbKxUk1iCtSC?=
 =?us-ascii?Q?/SJy0zxwNWf4de7JIyNEQJNfgdTQaI2CjIOXt5UF0W/SUkV/Z71hRxMZ73ju?=
 =?us-ascii?Q?aYhR4MOW6RSAzBysr2KN1f+R7XEwrDn28OX9vWIKm8RAziGQlrdNQaVQB2F/?=
 =?us-ascii?Q?YARxq+nnhGsWOP1Y0lKOItcwpc8884HAL5ln/H67OaXQ+38vMV6C1NpqJ9+L?=
 =?us-ascii?Q?1mI/CCBIgUQRYPw9kSQJDTY7E8rV/BxgYJ0V0UXTOF2b3O4pHh3GfB31hFB4?=
 =?us-ascii?Q?++OoWWTY4Z3DJsMKSHzSi3uNssWMWRUe6kjp/dfVWLSXf80YEKcvImH/obEe?=
 =?us-ascii?Q?iisoEkacj6uwsfoZl7Z9Ovvg3na4RZ+YKMTKTHoPnECFxvAEiIddsBCaILZs?=
 =?us-ascii?Q?1EkEqf/13RC9rl4Dj6/YLwnAR5KntpKxYgZ1NIJTXcaMQkOjM/PfUZz0jBUD?=
 =?us-ascii?Q?/bJS7+TgxmYvFrlOI//EObRYFJRyaT/TAjsThbYzjZCGApdZx3LUYGFkpvc7?=
 =?us-ascii?Q?jFb2jF63P2EhHeQwevmYCk9HjYpwSyqRyY7pQqMbSXamFl1hjvRC2GlKyrH3?=
 =?us-ascii?Q?4uVsTdnYU+wVrsK/s1p55Bt/7Tz89IGtuBUuj1WZDVZzjIODLD23KiHwxN1G?=
 =?us-ascii?Q?KxUltvN6+OUN3PhzBC01nI/krkg6IgCfe7yMFTWCO4lFKUENMKPd81ovFQZ0?=
 =?us-ascii?Q?/1ge8G270e6Fu7jD8bj8feyuspMESl1cAZdUkk7fceAhk0EXaYweDOXC3Bsd?=
 =?us-ascii?Q?L9TtE/txvEXS0NrsOhp84NDYgBwVNSaM+isQeFTUINYvT6u/JQ7JfmiVnjLH?=
 =?us-ascii?Q?S7rqpG6mi0cTZcrXgnIPADyhU8ARYbmh6ODiXwxFdHHAXPvzJbWPzDvIdw12?=
 =?us-ascii?Q?qCA5mxINtzWleEb/tWZri4vPYtRXSApQkh79OLOo8B+QpH2p3mHu+e50g9x9?=
 =?us-ascii?Q?ubbi+Bu3q/rHmghd7DiPDYIpaLUqU07Pjm5EH1BI1lJdAqu5ClRtc9yTWdzV?=
 =?us-ascii?Q?aNgSVppuUhfHdXRJwj05qhS3hVWSweMkQXRv07ytULKhEOIqqfv78BMsAP/y?=
 =?us-ascii?Q?1SUB9aQMYfgU0sB5hJ7gMep4MFPKqwRZCP243cqVWySN/olIjBdka+XHEJYx?=
 =?us-ascii?Q?h445pnLfEky+FvuvknrbcDY4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c881c6d4-477c-409f-004f-08d90b288ca1
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6131.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VE4chkW9TONHiX0FtGKn9XtkOtYZB6YCerhHIXgx4jQdkWZVMDc7RgqVq9PihZlVwSRpXtA3ZDmmh5sV7X4b8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4081
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




> ALT Linux folks also have a comprehensive group policies parsing and
> applying tool[3] that relies on Samba Python bindings. The tool also
> exists for several years and will be present at upcoming SambaXP.
> 

Igor (from ALT Linux) and I have been working on merging their gpupdate 
into Samba (combining it with samba-gpupdate). Their gpupdate has a lot 
of cool improvements over samba's version, so it'll be nice to have all 
of this in one place.


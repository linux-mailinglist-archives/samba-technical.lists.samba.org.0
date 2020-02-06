Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CA3154EDD
	for <lists+samba-technical@lfdr.de>; Thu,  6 Feb 2020 23:23:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=QG5cIo38S37qGgvmrN5h+PYp0b218Ezi3iGjF3BGDoI=; b=Vy0B2ycyS/MMOgHUWsFFhcOopD
	T2ggvTeBUhHZR0KXy9NFdsb2IeyAq0y8VmIFH3Ht92oQ9wkqd/H4GEdQoPRr+O8beu9J8nRmVb2zt
	PH0pSVnBmCggw8vjD7IaausejB0dvD3KrLPVIepe1UUxteL8CkkLDxCT6FsAHwOLeON5hCWYn/e/9
	IDH32//C9cjWnIxQGe6Skkn2YE30zxYWE4HYdjhUiuL+7RbvQ8DHMuR6j8fDOp355f8gTVlWFf0Vh
	P23B6sgaaOJbnJUZaYMAdtJVusJT/96kE76crb8YhbINy2WQXTB0ir1QDILbXC8iq2qN7fbGpe++k
	MvilAAjw==;
Received: from localhost ([::1]:47368 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1izpY6-008X7a-2L; Thu, 06 Feb 2020 22:23:02 +0000
Received: from m9a0014g.houston.softwaregrp.com ([15.124.64.90]:57306) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1izpY1-008X7P-JT; Thu, 06 Feb 2020 22:23:00 +0000
Received: FROM m9a0014g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0014g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  6 Feb 2020 22:21:55 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 6 Feb 2020 22:11:52 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 6 Feb 2020 22:11:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=me4psgwgaQj11K5DgqLUgYCvHZ18Dwl94n+hynCZVj1jPNXbgtXn2X9XjG9U2XZfBlr37woD7CKswO3P7MlEIvyR9M5O7J8ihmW9jWJeEPiSNFGgkutSY+RrjlD2OCgr9lLFwfTuwvGOgYGDS/y3WeIZNrpa5XzMVyiwABKWh04Q8VTClo0p7dZpgBnGMs5zUPeJZcEKXznt3xoF382wmTRnZby70I0mL5Fz6A0mnKFUaD+u9BGTjUpt0UI/dxAsVFoxCnvnvM24FiLMCekMlkZwX/+Fv23MCePZqDR4A9Z/xXk8Mb0Q19sbyFatz7ZMPBJxJRcSV9eyF80ZuqpxJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fmeGYY0P9wytaqIwKVzrzoqi+1lCF9qSmCXR4cLwDIk=;
 b=cnV2+Nf8ks7qU2LJKxjGGN/BlAywqQ44NVcNyYs6Lr47W4drF0bXtUgk2qvqYVeGBs74uy/Tb647OE/VbfCoPhTTnhWJ8hwuW92HfLuc9r3GrcAXUyC6Gu+572f0rSbpH963IT87WGvbl6820Qgvbzrq0n/V914Oa1/BNJx2vXqgL9I1PXQwyCb60B6n/AQdvpe8M7Iefhmt1PMJt8u43XFnZxEPYyC8UQebwA2k+3wLMzI4GvNCwrxZj8LR2p1yFFebrVYohKDJb1M1+xyyk2GrV8muPLxgPwqlctlhw6wq8s5n849Lm9+GlFRLuy02a/MNO3YTvU1WLUBcLUugwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=david.mulder@suse.com; 
Received: from CH2PR18MB3158.namprd18.prod.outlook.com (52.132.247.221) by
 CH2PR18MB3285.namprd18.prod.outlook.com (52.132.245.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.23; Thu, 6 Feb 2020 22:11:48 +0000
Received: from CH2PR18MB3158.namprd18.prod.outlook.com
 ([fe80::e5f6:7dc1:a62e:cac6]) by CH2PR18MB3158.namprd18.prod.outlook.com
 ([fe80::e5f6:7dc1:a62e:cac6%6]) with mapi id 15.20.2686.034; Thu, 6 Feb 2020
 22:11:48 +0000
To: Jeremy Allison <jra@samba.org>
Subject: Re: Video of my FOSDEM Samba talk.
References: <20200206165543.GA214397@jra4>
Message-ID: <ace90091-5852-f65c-c380-5769f10102c2@suse.com>
Date: Thu, 6 Feb 2020 15:11:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
In-Reply-To: <20200206165543.GA214397@jra4>
MIME-Version: 1.0
Received: from [192.168.1.9] (74.122.77.94) by
 LO2P265CA0405.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:f::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21 via Frontend Transport; Thu, 6 Feb 2020 22:11:46 +0000
X-Originating-IP: [74.122.77.94]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 578c94a0-692d-4ab6-533c-08d7ab518f5e
X-MS-TrafficTypeDiagnostic: CH2PR18MB3285:
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: LbYbTuoAvEvkky61lk5BRZXdTceTv60Vv+uE3CLTV3sw0VkNLsfNv2VZeBZsIATisnVAszZR4o6vw7/YvmExGvLYBGWJnw/C3zGOYQHGDNvHocKIFA3knh9uxjRA6bnazcf0VP7ITE+ebYDrdEB7E6URX/jaGtuSMHA+A8OI3Pnfyr30ipVuTI/h3nIWYEwf4+2X+HKwqij/IFLXYXxKkzSbbLNJNniGJNTnufPmdrhsJomapsqYGQUJK06W8vc8QnfRrSo0Y6i0oFmWOfbQUzIHVJ61khF/uX3QNGh5tSz1UbyNDzx+CXe/RUsT2OZU/aHmg+/w2pAVIM+ItSWDjNIR+YHRPvf3pcf0p4flEjGPeOpk0Ol+Zuxu1qd++Kr7HLWh0qB2FvtA+EnJzgSr3b1oHsXuS6WzUTOb/uAAXnhRIE9Bl68o+JQQMMJckiVkUkOJHEFnPTZ8J4cZPTovbtTPZPgABfCg/wHkzZWIHTgOtJ9+dmJUJAxfKMGsbgky+IxbiUpp2ziXCAE1PkyDNg==
X-MS-Exchange-AntiSpam-MessageData: tqINYnjVrRpTuoYK2LSFAufqHpEfZnmRMpk2XD3xvZZ/DrtLo7XtzYW21RKj2VHHSuqY3TFX+wKl6vTRc5mlvY5vMOmtGik6WKKR3NwE/vHPq0NItJSESAulmyBOxRkOXyANUqZATuvN2BNGljPMtQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 578c94a0-692d-4ab6-533c-08d7ab518f5e
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3JPEllh96CvdrortemJP1zPapLY+8x4j37WchFMe7lEyRr3drIuzdU2bR5E1oCzJ0eV5QuPyR1znex83es4FMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3285
X-OriginatorOrg: suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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
Cc: samba@lists.samba.org, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Nice talk! Thanks for sharing Jeremy.

On 2/6/20 9:55 AM, Jeremy Allison via samba-technical wrote:
> For people who couldn't be there who might
> be interested !
>
> https://ftp.osuosl.org/pub/fosdem/2020/H.1308/whats_new_in_samba.webm
> https://video.fosdem.org/2020/H.1308/whats_new_in_samba.mp4
>
> Enjoy :-).
>
> Jeremy.
>

-- 

*David Mulder*
Labs Software Engineer, Samba
SUSE
1800 Novell Place Provo, UT 84606
(P)+1 801.861.6571
dmulder@suse.com
 <http://www.suse.com/>


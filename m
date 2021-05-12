Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B67CF37B965
	for <lists+samba-technical@lfdr.de>; Wed, 12 May 2021 11:39:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=pEVb+z5L/MOLhBEVNm5bXUnjYt9WWILi1dzLw31dE/o=; b=fuQ28uOmul/3EK8VdbMMGXqP1x
	1dyeHCmGbRy+5yNCyKteV+71rXAcutw6X6jlycyhq7x8yvlpu5EDgYhNT5v8G742wGS4kYBp0tP/e
	5FDjaTSd7ieD87ImfUua/APQUXRVNUH64obgvoMriWu/naWqq35enz5MYA52YLXhrYTra06zNU9xc
	yRJuMZtnlv3XE73dBlhOhCHdVY5EevQzW5mWe4s7pWFwu7JMHV2Ir+4mnRC7s4Lcnmh0BmH3cfRVx
	glKqoBTMfDiLfuq9Ckf4yABr+iWCj3/4TyWB9PiJKOc6vOLysu4i+6r2TJp2DxE4ALTBEIlq/rLlA
	sSNZOcRQ==;
Received: from ip6-localhost ([::1]:50056 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lglKK-00HClT-9e; Wed, 12 May 2021 09:38:48 +0000
Received: from de-smtp-delivery-102.mimecast.com ([62.140.7.102]:42288) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lglKE-00HClK-N2
 for samba-technical@lists.samba.org; Wed, 12 May 2021 09:38:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1620812319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pEVb+z5L/MOLhBEVNm5bXUnjYt9WWILi1dzLw31dE/o=;
 b=HyQ1A3Cu+i8doxEfhpFQjtudWhhPaitIDYsLZ6a508NqD1WGDtrpvEevwkbv+50zk0/Dt/
 KgqipeGWs0RnwInRLHu/MKtI6ScC7KpnbU6Cxwl2TfumgRPte1PdVmi20LRLawhO8EAVgB
 N24vBGhSrmPLMY2BeKf7d6d1G4cF9Ek=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1620812319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pEVb+z5L/MOLhBEVNm5bXUnjYt9WWILi1dzLw31dE/o=;
 b=HyQ1A3Cu+i8doxEfhpFQjtudWhhPaitIDYsLZ6a508NqD1WGDtrpvEevwkbv+50zk0/Dt/
 KgqipeGWs0RnwInRLHu/MKtI6ScC7KpnbU6Cxwl2TfumgRPte1PdVmi20LRLawhO8EAVgB
 N24vBGhSrmPLMY2BeKf7d6d1G4cF9Ek=
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2059.outbound.protection.outlook.com [104.47.10.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-26-w_gKg2ncNyKcVEKz1qav1w-1; Wed, 12 May 2021 11:38:38 +0200
X-MC-Unique: w_gKg2ncNyKcVEKz1qav1w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZUzRfjc9svErTubp0IUetDlD7CnXqXLIaZiqm3sXz0gQtGM1GxrrT4gmTw05zHpPU0Xwg66L49ETwp7S5vN7rk4krJVpi4AFDlGkv7SxTf0XS9PqxzdVEcvqDVmaVxx9lY0rXM1h2r0VsmFdEM/c2gp5GI4erniYG49dxtrfLcX+4qXui0Ljjg7wE+k9iJJWfFJgD+ETe1/eppn/fr1YXscoeuKE28ypVdusIlofoO/2rFz80SQHhbVMpEdak0yv5guyNPCi1nYiBrT7Nm8KH7lvZkBXlTYx3LzKLqm/JCC6ZrhASpq0XWOLIckLOglvFD6R1FHGjdQBba87YmwCwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pEVb+z5L/MOLhBEVNm5bXUnjYt9WWILi1dzLw31dE/o=;
 b=a8xOiL5BF/u7yPqYjsW9jepzZNeod0U3SlqJ97F7OfWrA606YspWiY+gs3hfa76DMWXkpXvD5IyZACtBtSIRQ1Vx5S0u6nkzXYXXzP/DO3sOgT3qFRV5dinsS61E0MSEAaKC5X8FxRNKXPdViP8FzQAmY+doIIT4VR6U+YJHx6jhjAnW28MGH1VO3Zr/glfHzqaxGoXPSUnbp7XZrv6qOcCCEaTNqswDLypC5o4K8IaGtFpE5Iv9Tc95N/64L5BjFZRZbSyCp2bMNxUsvOkANsLRYU6SMxzFqosFq5Qxxc9RJCoAG/enRBOAZAZs6jLzBNri+MKickUW0P4RPMigzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: gwmail.gwu.edu; dkim=none (message not signed)
 header.d=none;gwmail.gwu.edu; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com (2603:10a6:803:3::28)
 by VI1PR0402MB3519.eurprd04.prod.outlook.com (2603:10a6:803:8::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Wed, 12 May
 2021 09:38:36 +0000
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::3c87:7c9e:2597:4d94]) by VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::3c87:7c9e:2597:4d94%5]) with mapi id 15.20.4129.025; Wed, 12 May 2021
 09:38:36 +0000
To: wenhuizhang <wenhui@gwmail.gwu.edu>
Subject: Re: [PATCH] Deadstore detected by Lukas Bulwahn's CodeChecker Tool
 (ELISA group)
In-Reply-To: <20210511223425.12863-1-wenhui@gwmail.gwu.edu>
References: <20210509233327.22241-1-wenhui@gwmail.gwu.edu>
 <20210511223425.12863-1-wenhui@gwmail.gwu.edu>
Date: Wed, 12 May 2021 11:38:33 +0200
Message-ID: <87v97os352.fsf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2003:fa:713:d359:b215:6aa5:3693:e486]
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2003:fa:713:d359:b215:6aa5:3693:e486) by
 ZR0P278CA0088.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:22::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Wed, 12 May 2021 09:38:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2d7a275-5c5b-4a94-f09f-08d91529b715
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3519:
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: /g6dtVoIWWGfJETEz5jKYsfWT3mwut2ElvLCoTMP3BQeRKlQeS5cBZDQV8iG804HMnPw9nY5BNzSMMQZp1g+IOTsWeu+hX+cjfRevU1kphZWuaWg1bfm3gwFuZa8rzWM3a1QH7l8RMEpjYslCBc9Z+pxViOjO4izU2S8vWCWJHl+iGZMp3dx3KjOCQeH3yf3mR78XhXacKRJb7q0G5d9CizdkmPDtAd1CvkfkXP0yNMf7DYzZOzZCVtRnEQGt5fDHgRfUhUkuj9PeHePFiKJe+4/8tq+HorjgLNQ62gNmOcROqXvMl2nYDnzhUXdW0XERiYgzHYn2OYYhDV/JAqP+cOjxzyd7Zx2cBjh+vsajQetEQZi8WC72nFaOjsYH3AGsE+e5pxMgcMR7AWkbOVKEVQ4XZd8MRtLB0I1Tabr+ULrI6sRrw9YH1uEbQ4BZpa3u1UT+nBOQHg6NOsqjdBHAE5bfvDL4dyyp3Bk7EV2PjJAtUdR9TtpKKeFvWQw7wC4Y1IdkuGqhuXg97jYonriExoolHeYBYTHBH7orNocpdkUFT5VjWzDttHN8TFmPXrC+apRcFGS59Y4GLO+YPBdJQ==
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WStkeVNpUlNEaDgycTZKRVJ0YUxxdnppb1JYYTBHRGg4SlhIVTVsblNJZmEr?=
 =?utf-8?B?dHFFQ3hWbzVvK2ZFTEdKemtGMXFrcGFDT2dTbklXWkpVV3V1WWdBSjB2cDBx?=
 =?utf-8?B?NEZ2MmhsRHJka3NvN2dLNGQ3am1pMWFYWTNzZkFYMEVZZ09IN3BGcENmM1ph?=
 =?utf-8?B?MlNKdGE1VFFqd1pMUDRsVXlGbk83K2Z6cnV5UkZkNVh1T0lNaTJRM0RRSkNC?=
 =?utf-8?B?eUZNSHdjK1RzWHNaU3BMdGFYeUJHaHFZN2MzT2tUbGhscVAwMXpKRmtyRG5J?=
 =?utf-8?B?NDdjVlZNYXorSVAwTWZodi8rNUh5NWpySVduME5NL1JOMjhybFcyblI3MlQz?=
 =?utf-8?B?WUVYN3F6eU1JVWNEMnh2U3crVW5NSFVIS002SGl5ZnNUNE1TT3kvN3EyS1lQ?=
 =?utf-8?B?c3VoM0tuQWdPSC9PdE96RitqR0NWd0QxT3lHY2p1aVNsRVdqRTA2cEtqNHo0?=
 =?utf-8?B?dXczMDNoL2VVY2t0SkVkTkFNdmpnRWVEZ2NRV1c2bzR4VzdGU2w2L0ZTNU1H?=
 =?utf-8?B?TFJLcGMzalBZRGR4b2NhWnNvREZRM0pIQllhT1BzN2I0ZEMzUDlvUFQraFVo?=
 =?utf-8?B?dkhXUG5ZQnBtZnF0WWYvdzB6RVo2aFFGREdqM0tmY0x5ZnB1RWc5Rm43bEFG?=
 =?utf-8?B?Yk9sMmhJa0VSVHJ5TktkOHF0cHM5ODlXd2lIQWxETkc2VHA4QWQ3bWQyWUUr?=
 =?utf-8?B?TE0xeUtjQ3dBOFlveFpuQU5oQUd5ckw3S2tFaWhFcm9iU2dKSkRVeERNbUNE?=
 =?utf-8?B?ZlQxRnhYK1cwZkdtUnljWmRGS2E0cGtsMUxRUTViZUxFMkE4UWluL0hNcmV6?=
 =?utf-8?B?Z04vM0pTY0N5RWJkNUdlRllzRGU3bWR4eDNPZVZUUXFKM29EVHlUTUVlRGph?=
 =?utf-8?B?dFB4by9MSDUzQnd3Rll5YU9ZazFreU91TVB0b2F2aCtkQnlWYWR0c0pzWE13?=
 =?utf-8?B?V1Fiei9nZTJiVENCT3JtT3J0L2NzNEZ3THJxZEhFVHd0a1ZSR09UWldPNmcx?=
 =?utf-8?B?OFE0eXA2dVZMV2JDbi9Rb2tSSVdGN3R6bDdrbm0vdjNsa0lVS0JVQ3JXQ3Bh?=
 =?utf-8?B?bFJMWFdkeGJBYkt5cm5od1VrajI1N3VCNit4M0R1RnJ1MUhzeVpxQVhVYlNJ?=
 =?utf-8?B?cDdzeXhYaVNOVm92YVd2Z0lsdzhKZk9vUmdkMXN2UnBXWWdoR0QxUnFka3g4?=
 =?utf-8?B?YiswSmJyRHNZaHFaemllWDY5ZjdZT1E4SUpIVkhIcWNPbTdQSnd2R3U5SXFs?=
 =?utf-8?B?YnVVMXhDVkpMN1luaVEvdWxCd2E0WlFrR3dIQTdsY3hWVnpscEh0d0o0M3A3?=
 =?utf-8?B?QVByVitjdVEvTjYxa25MOHZrcWF2OU84ZXVjZExGZFRGeVo2Q2JOdHBSRUpq?=
 =?utf-8?B?R0plUXFLY2JxbjQ4MTV0MVo1V1d6V3VkUUtsME5hSTJlSVRLelZVK2pmN2Vl?=
 =?utf-8?B?aDA4T3ZHV3dpTXVMSXJ3TDJ4bTJoOTJJVTVXb24vTVZ5T050UWJ4RlhFWTJU?=
 =?utf-8?B?TWVabmNUcEFrNlNEa0Z6MkVUUnRmVmhlRU1TV2F2bnovTHF0bis1cWVObkJS?=
 =?utf-8?B?dkIxOXFTa0l1YjRwUjluZCs4eFZmcHlSRnlkaDYrZEhyRFNsbmRHTlF4MEtt?=
 =?utf-8?B?dFc5QnRUaVlYeWFCYUo3aWNFRE81TE1sRTVYYzZWWUE4dXd5T0dKY0RHWWlX?=
 =?utf-8?B?SnRmYnFzcGZBR0p2MjAvVEd3c3NEbzM1cVUvSUhJL2xNRnF5K3VWdWwxeVNq?=
 =?utf-8?B?bTgrTWo5L0JCcGxSaUxOaXc2Skw0K29YQlc1UTUwUVBMZW9IcmlmSmsyck9y?=
 =?utf-8?B?ZEVhNnIybi8rM2tpQUlHRVJ5L1pyWXV6UHJKbzd1TEs0enhiVEVJUy80TDVm?=
 =?utf-8?Q?VGoWVwbCWdzZW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2d7a275-5c5b-4a94-f09f-08d91529b715
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3359.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hb9iPlCPIvm5xyBHRBfC8xI/1KHSopOMzr4YtmflkAkDQCBKfOGPEJx9tBAs3i8E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3519
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
Cc: Steve French <sfrench@samba.org>, wenhuizhang <wenhui@gwmail.gwu.edu>,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-cifs@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

wenhuizhang <wenhui@gwmail.gwu.edu> writes:
> Deadstore detected by Lukas Bulwahn's CodeChecker Tool (ELISA group).
>
> line 741 struct cifsInodeInfo *cinode;
> line 747 cinode =3D CIFS_I(d_inode(cfile->dentry));
> could be deleted.
>
> cinode on filesystem should not be deleted when files are closed, they ar=
e representations of some data fields on a physical disk, thus no further a=
ction is required.
> The virtual inode on vfs will be handled by vfs automatically, and the de=
notation is inode, which is different from the cinode.
>
> Signed-off-by: wenhuizhang <wenhui@gwmail.gwu.edu>

That's better but:
* the subject (first line of commit msg) should be about what the patch
  actually does, usally with a prefix of the subsystem. So for example:
  cifs: remove deadstore in cifs_close_all_deferred_files()
* the body of the commit msg should be wrapped around 80 cols to avoid
  long lines unless you are quoting some output or urls

Cheers,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, D=
E
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)



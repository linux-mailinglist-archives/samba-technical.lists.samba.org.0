Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E0307359929
	for <lists+samba-technical@lfdr.de>; Fri,  9 Apr 2021 11:28:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=nHsrt5/7lhTA5zmToO9hTqeidRu7nYSVD4u0c1/41gQ=; b=0z6uHBlV7+UZahq6RJX9L9ZTPr
	gnlqZDLFngKfN/Hakwkzp0ERPQSRwL+UmOq7/xuG+wHvh+pXTFX36IFEAl7+MtQoH1EUJQsjwKub2
	PjJLYIhg04Bkf4kCNkveKKqRDq9ERZf5XAPRN10CdxDk1uEc/pgm5bov9P5Oqm2X7NHG/nIdJBe1Y
	9GDG+e3nwjvMHqsKbxc4m5MaYSiwLz1a+6KKA9IzLQmP0/ew8b1R0GirvVrC6yA1KdJOTPXxQgaXU
	5mmb0zoyLsTY7/OI/aWCCkDtjEL/dRV1EZ912QwBxxC+2XjTuv/s7mldrt7RhZfsfLlKqolfdSbUD
	Z8zbogGQ==;
Received: from ip6-localhost ([::1]:57526 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lUnQd-00AdIP-Iy; Fri, 09 Apr 2021 09:27:51 +0000
Received: from de-smtp-delivery-102.mimecast.com ([62.140.7.102]:36234) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lUnQY-00AdIH-KP
 for samba-technical@lists.samba.org; Fri, 09 Apr 2021 09:27:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1617960459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nHsrt5/7lhTA5zmToO9hTqeidRu7nYSVD4u0c1/41gQ=;
 b=TDL5S9yYafL2ker0UDvEyZrC43Wk4G+No5MLTRAdkwG2D37On9WAjvalS+BatpUBLdDSx9
 RmXMzwtZJaD75w/XjhF791vTGWYNNQIDOGoWy6CW0KbnmKlSUt/q1BEeozQaCEJMXkp1T3
 WhFLJX/YGwxVGlq8w5N7xHHbzdbdr+E=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1617960460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nHsrt5/7lhTA5zmToO9hTqeidRu7nYSVD4u0c1/41gQ=;
 b=HECCFzx2HNLcumZqYmm+fc7eoKMXfGdBXSuDNfuVJwyvOMCkYsiU01Nuho1X8cIHSqEL4H
 nRBF0SQagvOQxM4TH6IK5F+k0mWe+E2RGL+bUHmtMbbk6ndMVvG/21j3W/Zzz43hX3h36Z
 kx1aiZMMEBGHWc4naN3R6C8s4b3dXuw=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-28-AFMbnjdJMPGBUBCx7B9w0Q-1; Fri, 09 Apr 2021 11:27:33 +0200
X-MC-Unique: AFMbnjdJMPGBUBCx7B9w0Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kbjt2xrIZBzKSBAQdb0GY+0OwF+Vto16p13QdE/9jtRxME/x2C6xJnNDNsVvFW+AO7HfeKqca31IHqQ0SYk8T8EXbF5bh63AuDJtsHayRIJlHLBj8R6QrAL7k4vPmsgdOEDHM1DFDbzl968wtAcX0KGENaXDTKfoazh+01A29AglHXoddD0V9uXTXTaXzDXM6DQFz4ppF93zX+0cMefdG8BWjDpmfEuOWNak+ZpHlGX6yjQPJTnNLbPNi6NIWngAacoqM/Dtyxmr2BSrb/LttK/2Aj4Rws9L3oan9ekm3L2DdgKT/8XWJjzKehRrsIhWxv5WVJK3+TAE95IOvnMvzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHsrt5/7lhTA5zmToO9hTqeidRu7nYSVD4u0c1/41gQ=;
 b=N9pgruz6TMLdtOhjqCWhLcjdf31mYh/g5ety7mZfLXzR8Kf5/w+hdwfgu7C1950Q023um1QD5Tn4awOXFI1RxPBd/JzeNERV4MPefdAvwOysUXM3POqwsOnqu/yuYpE/mZ7Ciq/C/Cy0CyjWGStYfozlmHlLkSSRgG310qLmW+RW8HUSVM7qMh5GVHhfNWZDb2rMZ/xMY19Ja9aI30rPFnQKtUOX29uWXm56RjzZ/Nppf/rNWnPmaIzZUblwWj/VDaI9hVm5UT32qA18aKNnuCgJJG3NvkgYeUfyJBEwyX68AIA3bmUD/pdTgsra7qNa6+YVILff7w//gM/4hy8ZYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: samba.org; dkim=none (message not signed)
 header.d=none;samba.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com (2603:10a6:803:3::28)
 by VI1PR0401MB2384.eurprd04.prod.outlook.com (2603:10a6:800:25::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.33; Fri, 9 Apr
 2021 09:27:32 +0000
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::3c87:7c9e:2597:4d94]) by VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::3c87:7c9e:2597:4d94%5]) with mapi id 15.20.3999.035; Fri, 9 Apr 2021
 09:27:32 +0000
To: Ralph Boehme <slow@samba.org>, Igor Chudov <nir@basealt.ru>,
 samba-technical@lists.samba.org
Subject: Re: Setting up QtCreator for Samba development
In-Reply-To: <bc0db8d3-f6c5-103d-3193-9f687f94c434@samba.org>
References: <502aedfa-7290-7e9b-11fe-06d2cfe59bb5@basealt.ru>
 <bc0db8d3-f6c5-103d-3193-9f687f94c434@samba.org>
Date: Fri, 09 Apr 2021 11:27:29 +0200
Message-ID: <874kgf4xku.fsf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2003:fa:705:3046:69ee:cad4:97e6:ea8f]
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2003:fa:705:3046:69ee:cad4:97e6:ea8f) by
 ZR0P278CA0063.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:21::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.16 via Frontend Transport; Fri, 9 Apr 2021 09:27:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d6eabbb-7ad8-46a9-53b6-08d8fb39b3ba
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2384:
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: nU+JLSPBsvY0J/f9huZc/xTRQRHh+Ehcm3pmK+/bvRJqclF7hdT7KA71FBnqxXSKQH3tU2/aQ9EUiSv7cu7cMvHyaouw81pDp82CR+S5ryROCR3jyCSGOkd5h5S9peTlENBdb3cvhERQyEiPuseWxdABrFrulizs5cJ9CoAmciUkxgYgdCW2zQ5dVXhEfwNN4HBaKhzBIDWxsGUt0SRKDY5JnDHEu58toDzuxGE1p4mNekpPhFEgkFR9zIzRnRZmMk9zNK9ona0jeetlNQg2mxOd2wL3qVdWIGcIl9R7/qyR4Be6mr6MlsH2AXzo3SHWZ7VbGwNEZ42Hq4ZUGJR6cdfD6waj1xAXAXUitRO26gAErDR117fas1jsSfGHXVSF26fUIwSjLOV9XM2/mRY+CN5Tp2Ig8G7+tqCOjmn2ganl009yC2MWBgyTECyix9NIJfg17narhpQdbleuQOi/55CLhl0twbmZo34Ia7lMZae9zIBNJb4UK/H5lqNAz+/vRLruDdIwJV4zRPRxNHBAkrpFfZJZN6RGogZ93NZV+3tC9hsfBeYvWIWEVaoVKAUza1lOoZwIQn7PCH9k4vkwmgM9M+F40fhkw8DaqfEtKg/T455E43CYs8H71cbou9KGXFG/kAvSqcVaPasE5PmYmw==
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SHo5dEUvUG9yME5BNVk5WG4vNUFWdlF4b0FEZGJNU3UxSkhQalRlb2Vra1E4?=
 =?utf-8?B?NU8xRG84QmFEK3g5VjhhN042SitVeUNiaHhQSzRTRlFmNmttaUhCWnJPQ29o?=
 =?utf-8?B?SVdINmJPTkxWc0NiUnZ2bnR5OFZTUGFoOTl5cEJiR3BSRnJJUUxVT3d0RHpM?=
 =?utf-8?B?c1pid2JSdkNKOHNKSk5QOUxScFhiaHJXQzMrNkwrc2l5MndBcnVraGNiRjk1?=
 =?utf-8?B?eTJZUzFDNzF6elUyUTBuUzNqc05iS3dudnM2cWtqUW5yYW15REQ0cW1yUkdD?=
 =?utf-8?B?czRTdHhaanloNDRyUWJlRWJtcnc5V0pydmQzVW0xdWRsWDIrdUR4K01mYUQ3?=
 =?utf-8?B?Yy9CVzF2eWplVWp3c0NJVGRCeFpDbUxGRURyWjhSaFcyZU1qYitVcGt2YkNx?=
 =?utf-8?B?bnhFNlVBSFc2Wm5nOHNuTVJJK0gzTUhrL1RYSUZGejhXVEJmRFlSTkJvTjhw?=
 =?utf-8?B?Mzc1RlJDT3pMdlhzdjlLRWhNUGErdUx1YWloOStXYmJmMmRrNGlzNHNjUlM4?=
 =?utf-8?B?ZnNhczZ0Z2tpMkN3VktSVjhuY0R5ZTg1ZmJsOTdrRGN1bmVFd281cy9oL2pj?=
 =?utf-8?B?VEZvQVJNZVdiNUUzS0x4YlRNaUlUV0pzOEJSMmc5S2U2L2hpUFJmQVNDQnJN?=
 =?utf-8?B?b3hFN2lKZVZSV0tqUWd2ZWU4L1JzNVBaRHcwc1N1WFg2U1JmclhxYSs0N1B0?=
 =?utf-8?B?MGJ3MkJwVk1QOFBWaXZxb3c1Tmk4SUZ4MWdlcWJIS0I0SFBFWFlkNitFR29W?=
 =?utf-8?B?UGJLR1ZxTEs2dVpDL012RzdmWXFURnJ2TkpqM2J3RE1jZ21UQ0lCOHVXdEJD?=
 =?utf-8?B?dlU2NWZLeFlTUjVsM3VoM3AwMloyVDhhNTVPN29tK0lFQ2thcVZGU3g0OENX?=
 =?utf-8?B?OVU3UmE2VHVPaFlFR0M5bmprTnpMZWFDNXc5Q2w5UGpTNkJsMDNudGpkWkx5?=
 =?utf-8?B?TkFYU3BKQkVFam5DaXJQYmZGVVJIdjFrN3Z1My95M3FwVFFzRUluem1ZNm14?=
 =?utf-8?B?WTNGTkpVTkZ2TGxXa29BdEsyZFA1MUc4WEQ5QWZEVjh3MDdndTE0ZVRXT0ww?=
 =?utf-8?B?MHc2QTd0UmJkVk04RGdkdnRWdzhhbC9ra3gxTXJGc3hqTUNQSXA4WmJybUIv?=
 =?utf-8?B?SDZ3azRnQ3M4T01oY3pwUEg5aW0xdDNheWhjbkRUY2lDMDFUSnVqZ0poYlUy?=
 =?utf-8?B?aVpPd1NQT0JDekd5Rk9RZlJnOUlBYzIrdzdlVzkzaEMrNVJhN2p3bHkrcGVj?=
 =?utf-8?B?elVCeDUyUXA5VVRRaXo5TVphVHFlbDFpR2o1Z3BNRjBMeUlSUVhhUHR4M0kx?=
 =?utf-8?B?cnFqc2JyOGlJMldXYWJxUkpBSGEweGJxWklKcEZUS0pzSUpENWVMN1pMYmcz?=
 =?utf-8?B?SzFqK3loTmd1QzYyYkozNDNZU0FjU2gwZlZsQVFSc05ta2dDa1lZNnFaTHY2?=
 =?utf-8?B?VTU0cHY2SVFUY3p4aXhOR0lvUWpSVkw1Tk9kVThESVNlR05zSjdrUVMvWEV0?=
 =?utf-8?B?QWtIelRSRk5ScUdzYWZqS3l1N202ZS90eTFjTnhjeGl3QlA2eFRXVWVvbHpS?=
 =?utf-8?B?VXFjOEFWMjZrVG1uRXRVMi92TE9rZHd1Zk41T3dtMFlPVERIRVhSRFZjV3Er?=
 =?utf-8?B?a3pSdnFpekpEQjVRbC90ODNZSC8xSG1WYTRnMXZQbUpEeVdsa3E2RHBPdFB0?=
 =?utf-8?B?M1FUa3YrSVVwVFYxTVlJL284SnBYNzdpK0dSelg3YUQ0em9iemVhNWQwKy9j?=
 =?utf-8?B?Q2xiblpoOEVTTGtBVGVsZnZzQ29KWStCUHhmN2NvNE4vNmJLL29yQnpiNEpM?=
 =?utf-8?B?MU9WMnFhOWZJT25LWmxzSXNJVi9jMDMzQ3Y2UlU3NDJTM2tBTFVBdGVrUjRL?=
 =?utf-8?Q?S81E6AkJj4MeL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d6eabbb-7ad8-46a9-53b6-08d8fb39b3ba
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3359.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4jsgJGAJquZiu125+uKHqQ2SNn/if7/hcz3GzSTLcBSp0uevFIzZtd2p5f6vFmRS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2384
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
writes:
> if you're open for other IDEs, I've recently looked at Visual Studio=20
> Code on Linux and that looked amazing. I was just about to dump my Emacs=
=20
> setup and switch but then mehhhh! :)

You have to resist the lure of the dark side ralph :)

But seriously, what did you find particularly amazing? Does it come
builtin with good C parsing/analysis/xref?

Cheers,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, D=
E
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)



Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC2D37ADD5
	for <lists+samba-technical@lfdr.de>; Tue, 11 May 2021 20:07:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=173L8vf718O/bPdbE5QQQSIeLcFB1JS87qzy9IasVv4=; b=ndsxJsppZmVxDjth4mbRIbJXWZ
	7igFuf1uRg9j79rDlvhAuemlO4pAaFSpiFKxXV/b6VdDvXmgaed5WERoXPsn/CbwPM6lvV9R9ncgx
	5aYL0/3f4wshiZMzNiU0Jhn9LhlwjbxHOzCks4RvmJSUXGH9H46gfyXgSIVOdeYzwiHm+xifyAJIa
	t583rp/7TIOjbX8B4No2UwE3EFF358oId44lQn9TkD9RYBu3m+JDMqLCZLoUWotTIsvVc7PDxf+i1
	vwM1vvyUChPEF6t7W9xoEQr6OAYuSBQGp7TMJ1vM/CnUlDymd6qfCXgVdRNEW7x2lGHuFxVf1c0/R
	QEDABorA==;
Received: from ip6-localhost ([::1]:30774 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lgWmK-00H2tM-R7; Tue, 11 May 2021 18:06:44 +0000
Received: from de-smtp-delivery-102.mimecast.com ([62.140.7.102]:25122) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lgWmF-00H2tD-Hi
 for samba-technical@lists.samba.org; Tue, 11 May 2021 18:06:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1620756396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=173L8vf718O/bPdbE5QQQSIeLcFB1JS87qzy9IasVv4=;
 b=LbOlZhOQutX9MNuoyQb3/aJTBfBJHNLyLSEEAWkPGJqmZY1ara1JE16Gato3iwt3tY3PTC
 jPb9Jc4UNVxtAv0G3U7GZL0V2dud6S8ekIj8ppBp4EdAR2OpgTDWsLl8vLNUZgBg9K+DBQ
 8j4mXGG3c3UZgcrx66vvkZVI+CnCXpw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1620756396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=173L8vf718O/bPdbE5QQQSIeLcFB1JS87qzy9IasVv4=;
 b=LbOlZhOQutX9MNuoyQb3/aJTBfBJHNLyLSEEAWkPGJqmZY1ara1JE16Gato3iwt3tY3PTC
 jPb9Jc4UNVxtAv0G3U7GZL0V2dud6S8ekIj8ppBp4EdAR2OpgTDWsLl8vLNUZgBg9K+DBQ
 8j4mXGG3c3UZgcrx66vvkZVI+CnCXpw=
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2057.outbound.protection.outlook.com [104.47.4.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-wnnrHb6lMxGgKBdGOMQlDA-1; Tue, 11 May 2021 20:06:35 +0200
X-MC-Unique: wnnrHb6lMxGgKBdGOMQlDA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WtFqw22Cqw1De/mtMZkXhbhVfyo3tgS2B35zpkA4e5q/uztNibFD9+Q4/a/FnthOZ6EewYggCZwiCZmC9+8jFF/kA8OBkC9SMYGWU7wbPF2inKmBXFeM7EJ8+Y/cTahwGQ3PO12F3h1vjXr+C+GPUbsn79iitmr+52dCfKLrYlKhKgFx2+M/jDJb6DqjGFbpCsyiufkzhrZPGQq5yAPXITn39jqlm5L7UKdjYwUd6LYEG1Zc8JUfojTzg4cIKRFAmT+We58/+GqHJA21kyVDEENFUloBy1Nu7ifYbcJMkBjbmuwrWAGbh5eCkLnViyHgAEe7DFlumpErCO1t1Gxusw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=173L8vf718O/bPdbE5QQQSIeLcFB1JS87qzy9IasVv4=;
 b=kikWEatoSJtH6cty9PLCV9ivO413WQMn96zN5Re6rzFwwhpL64WuE/6+2cZ+lsUOhbADkVUq54dEYKm8pW1aWZF3eePAGsJ9rVhZ3dfOdmiohu8JUbufHqTPQP6eQemAPnefHjrVDqx58Y5gm6BZod+ysZ4UPG77o/tekVVfNktDcI7QLT0s4SX3rt20ZQomozQxeXl1mrEduh+o2nPWhT6vblWCj1wnqE3Kf8W7nN+OoLOVwkXxCnqbElPOrg3AMTbEiUASafRp7Y7x33Gs7JzQziV37fJwUnBm3fUOUbvDJNedyF6OdSuoHdUBeIKy6My26JwwNw3fUN9T06oBOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: gwmail.gwu.edu; dkim=none (message not signed)
 header.d=none;gwmail.gwu.edu; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com (2603:10a6:803:3::28)
 by VI1PR04MB5918.eurprd04.prod.outlook.com (2603:10a6:803:e1::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Tue, 11 May
 2021 18:06:33 +0000
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::3c87:7c9e:2597:4d94]) by VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::3c87:7c9e:2597:4d94%5]) with mapi id 15.20.4108.031; Tue, 11 May 2021
 18:06:33 +0000
To: Wenhui Zhang <wenhui@gwmail.gwu.edu>
Subject: Re: [PATCH] Signed-off-by: wenhuizhang <wenhui@gwmail.gwu.edu>
In-Reply-To: <CAOSEQ1p80+JemJkj975ZTt5xw4XCPtOf2uBEvQs9RfW4UkDWXg@mail.gmail.com>
References: <20210509233327.22241-1-wenhui@gwmail.gwu.edu>
 <875yzptenp.fsf@suse.com>
 <CAOSEQ1p80+JemJkj975ZTt5xw4XCPtOf2uBEvQs9RfW4UkDWXg@mail.gmail.com>
Date: Tue, 11 May 2021 20:06:31 +0200
Message-ID: <87zgx1rvq0.fsf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2003:fa:713:d359:b215:6aa5:3693:e486]
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2003:fa:713:d359:b215:6aa5:3693:e486) by
 ZR0P278CA0148.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:41::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.50 via Frontend Transport; Tue, 11 May 2021 18:06:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e554e124-5072-43e7-4a3b-08d914a782af
X-MS-TrafficTypeDiagnostic: VI1PR04MB5918:
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: bpyZArgTacwSNSj2f3+Pkhimy0LjPT2c/9Pt5rgD9RdIjFgT8sjvmRb+4vLe2a5BT5+zUcENUjKKKtwMgzBKZ8jJ6VediFySFAOtJPcVi3MTXR8mlYmQIzWzJlVqDutGNG84QCOlNEs4c4eXWl6YejWgOAHB493BtkOfd/eP9ePK931m+8USZd8aFfJmWhzgJbpsE4UGR72lpdiuEUak7YfZKSv5nF4cVJE++/jOyN9Lj0BIuNcWqQqtkBTEOYXt8bUr/4MjgyKjPUg/KJRalfcqyljFrxDFAeT31D3Yzaq8IwwM3JuZNM7/n9nS0WZQZEyYWBiUekykPiifjPr0PEh4+kAIvtedxlAtdhm93IA0P7vUaRx+K9a7ivua5O385TMAxIL+vAW4+J7j1G7jVKJuSYzRWm9R5C/s0VvlwW7cYCZGPqtsoVV1v1xuQI+a1HMK2elywjUaASi50aCEA0pxvBS7NEOXkf3SljQKWOVjPl3muRND9UEioI1R7Vs2DVnCXzt+UJm6tmhXf8ApJonjRWOK3DWPvR+jUbLkSJUgqASNrK5m2PawSg1hoElR3w+s7ujmsW+JEsgSkh48kA==
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UjhrRWlhN0NYVmtIMjQwTGQrYWJ4TEl2eS92UWNSdEVYSnBhVE1nNzNjWmsy?=
 =?utf-8?B?VHJjVUU4NGFyVVdSL2U2bVQ0aXhlNGxyM0ZpOG5BamRyR1RtMEJNYUVHS0tQ?=
 =?utf-8?B?MmM4bU02RTN4ellnTjBJSGQ1bS9zcWhNbWp2TGFuVkwxM01FalV0VGNSRkJa?=
 =?utf-8?B?aHpBRWZLOC8zdEVUT2pldTYxa1JaMXhOTFRzWWkreXh6WHVMbnhPQjlrZWZZ?=
 =?utf-8?B?MWJrMEF3WGVaQVJ5QURkbG5RWjd4ajFGSDFtTjErbzd2VTNiMVBaVVFldlFj?=
 =?utf-8?B?dHkyMnFrZkwzYmVnL25vZEw5dFNyN2l5ZHhZemZuWjAxWTM1NkVMaFI5emg3?=
 =?utf-8?B?cG5La0dLeW1TdFhWYVBZVWs2cnlyOUE3TkEyYjN3WmIzWGlodjhtUWVxYjlF?=
 =?utf-8?B?Mm9sVFNqRTVhdFl4UUF3U3gxUXE2ZG82MXhkME5STWJ0dEpIdUVVNjlLc0JO?=
 =?utf-8?B?QXUrdVNMSWtHYy8zU0o1Kyt2V3NKTzgzaDRkOTNTd3ZBaWRKOUlpZm9JSC9l?=
 =?utf-8?B?UGplc0pzejhsS0ptZWd0SWtJdHlmQXVoeFdPWVBiK1hKcDhiU3ExSjEyaHpB?=
 =?utf-8?B?YnVCM3J3WkxNNi9KM21ic3hYY0lUL0NvU21hYzBpZnpaWUhhd3Zpc3dYNjF4?=
 =?utf-8?B?ck1VT1lrbWg5RGhnRlNRSi82NmZBU3NLdTVraWVFUnd0K2wvbWF5WW5nMlZu?=
 =?utf-8?B?aEk4aFpmK0RzM2E5dDc2RmlvTXNBbXpxYStEZ2JUQVJBZWtOOHR5U3ZoMVNq?=
 =?utf-8?B?RTlBSnJyRWxYdis4ZTl3VkpxVncyOEExcU1WSlBhYi9DSDVnQzR5N0FDYksy?=
 =?utf-8?B?aW12QXdoVkVTU2EwdUsxTUZrVkUxOTl3aTFEdFRNcmZwWFVLV0NWOFJEYkdY?=
 =?utf-8?B?aE94N1lFL1N6ZGdPa21wYStsdUwwQjBsendqd0g2VitFYWxyenNGT1Y5NXRN?=
 =?utf-8?B?Rmthd0ZJcUJnUFN2eXhoUnB0M1ZjWTBFV0hzRks1bXEvM1dEZk1KMkFiNFNI?=
 =?utf-8?B?VEIxck5TVG1KQ1JnV0lmRlk4S1g4Wk42bzNqNVNWMFRjc3pma1Q2NlNuQ3N2?=
 =?utf-8?B?QWdWRWMwMk41RWtadWdaQnowSU5PL09YRWFGWDUrcmQrblBiWExwbWRiSmc2?=
 =?utf-8?B?am5JeDdFL0hoVk94T1UwTjZhOFM5ejlJTUkrMUtqM0YyZm1pUVhvZnRvV2sr?=
 =?utf-8?B?Z0k2UnAxSm5HVlp1VXl6MER5b0llSUNRM2FXWVFEVmg4WnlncEIvMXdEUGR4?=
 =?utf-8?B?dm1vUDAvWERFTnp2akZPVDhJWnZvU2FHZFI3QUY3Rk9qOVdoZ0haakprUC9k?=
 =?utf-8?B?aGdPaXYzMTZiZjhDS0tpQ2dzOUNUeUkvUnJDRndPZWFCNXR0dkhTWitadkR0?=
 =?utf-8?B?R1VLdjF1YjArTXBzWFIvY0lZU09wNDJlZUpzUlpKUUx6a2o2K3l1Z1U0NnlC?=
 =?utf-8?B?aWdmSW40WTM2RWxRVHFvTWg2aHY4MWh4RWp5ZGRJNFVvZFRIcVhpaVBQTmRm?=
 =?utf-8?B?SGZHN0QxbUJVUlREK1BITkZOZUlQQmpCQlVrWHl1YkwydWVNMGFQTTE5aFJT?=
 =?utf-8?B?Mmh4UkZ5Niswb0hERmtnSmVUQ0hreWVFNzh5M2dscFJYREx0TDcwSVdlYThj?=
 =?utf-8?B?QWhNN3ZHRkpQMU52NG9ibFo1NER2Y0NOTDVZNHAySU0zMmdyNjlCd2lleWFo?=
 =?utf-8?B?R25ramNxb2h1Wjd4Yjd1bkhCZ3NnL1pXbnBuRTFoand4L3IxS2ErOURrL0NM?=
 =?utf-8?B?aWZVcGhrN1RUUkhGRHRpWWZBdStCem9iOFFCV2ZvVUNYVTRDblVSWThpaFY2?=
 =?utf-8?B?allZSEQ5RTVkYndpVVVhNVlTeXRhdmpYa24xSTlvZmZaaU9SblZUOEtTWUh6?=
 =?utf-8?Q?DvM+K7WuSZDsq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e554e124-5072-43e7-4a3b-08d914a782af
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3359.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +KFcyzJLg2n8DDdPZWV1zhLMrFVbjWw45YWQgmMbjRLI3UuQnU1ZIF/mKd1/YW4J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5918
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
Cc: Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Wenhui Zhang <wenhui@gwmail.gwu.edu> writes:
> In this case, should I send out another formatted patch push request?

Yes, fix the patch then you can generate a v2 and send it:

    git format-patch -1 -v 2
    git send-email --to=3D.... --in-reply-to=3Dmsgid the_fix.patch

where msgid is the Message-Id header of the email you want your v2 to be
a reply of. To reply to youself, your msg id is
20210509233327.22241-1-wenhui@gwmail.gwu.edu

Cheers,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, D=
E
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)



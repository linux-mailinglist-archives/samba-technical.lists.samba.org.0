Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDF63058F4
	for <lists+samba-technical@lfdr.de>; Wed, 27 Jan 2021 11:57:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=D5jrgJs5i4JMSBKbOnZT6tVEu1z13v3hiXLkLCZNLLo=; b=vdDXPQyzEXM4A4P7z7VECi7eVC
	uGACJr+nz0fu5sJFlY3yGE4L/7enWUBwTFw9oUm5yilZn5YfCwDOp5pce3j3kbHSOMC55h6h+5NSN
	W0Pb5y7JyPHhkI9EMPDBBzzjcvxS5r9T0d4lWTy+PFE/fDi7TzB78/C+G80LluWoaUDLqFloUZ/eh
	RnqZ4yAuOLKokPD7YMbl4o8nZ4FdpvLL8gTSFMwRdsJ2ckSYQcei77iGMBdlvi8BxAb8Uu4qc1nqS
	E5VqoKMQGi68EKeyhZOCBU4ufE9iPAgMnX+Upt+07euqlayqted8zRl2j9eFP5wwnkkQCl0hIQDwv
	9CRffGvw==;
Received: from ip6-localhost ([::1]:28306 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l4iVJ-007N3G-Cf; Wed, 27 Jan 2021 10:56:53 +0000
Received: from de-smtp-delivery-102.mimecast.com ([62.140.7.102]:41216) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1l4iV8-007N39-Sg
 for samba-technical@lists.samba.org; Wed, 27 Jan 2021 10:56:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1611744982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D5jrgJs5i4JMSBKbOnZT6tVEu1z13v3hiXLkLCZNLLo=;
 b=D7108Y3mWxHrkZVI387DG6N2XB1n0xrVgJ6PtFOVtGY4tfVxbdEgOzIgLOgUh7Ac2gYeQP
 7Em7Q5uG+iWnHvCC5D8ksfyq7lOx9ZVBF10yH+KuQqGMAyyWNy8Y6kLiq1E08DrO/F2Nt0
 rx5B2BQpiNQk3xF5CudYwM2ZESmA2eE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1611744982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D5jrgJs5i4JMSBKbOnZT6tVEu1z13v3hiXLkLCZNLLo=;
 b=D7108Y3mWxHrkZVI387DG6N2XB1n0xrVgJ6PtFOVtGY4tfVxbdEgOzIgLOgUh7Ac2gYeQP
 7Em7Q5uG+iWnHvCC5D8ksfyq7lOx9ZVBF10yH+KuQqGMAyyWNy8Y6kLiq1E08DrO/F2Nt0
 rx5B2BQpiNQk3xF5CudYwM2ZESmA2eE=
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2051.outbound.protection.outlook.com [104.47.2.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-R2Zaq3JQNxiI3z-5_jlW7w-1; Wed, 27 Jan 2021 11:56:20 +0100
X-MC-Unique: R2Zaq3JQNxiI3z-5_jlW7w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jL+qaBagm08Rc8V8U5OVazJ7ke7kA6od7Au9Cd6oOe7eZbKj5V6wnODHrAO6CG8pUy/7uZNu1AeW13gepV8+X4BQ/32IMHsAwy6eLWUVt3H39y60lCK69PkD+nGAIBY0rIbDVgEXp5laRC6SXsqVQyaipLqHU3cin+M36nxWXuv20Upug+UHq3omLpFNQwZJt7MteG32KlS0GW3lA5BaLujWAhq03rAJ7XzuVkXFXyUR31wuJh47JAJfC+Bu9zLFH54aorZP71UDQh8VJcu83pAqcw6N7R6iHSRLpD6TK3KhPd8YDVWgf4qwYeMgLekqZ1VXUZrOSYalNKmW/DbABg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D5jrgJs5i4JMSBKbOnZT6tVEu1z13v3hiXLkLCZNLLo=;
 b=ETHq2GBPUx9kaezLDE1HsQpGzByCEyGK24zQhLzku039CSsc2P1L5SU5dq/Iex0vfzF6BFAa7pjd4Kbqx/k8SrRtUUADT6xIFt03jMe1pK+WMx8QtULGkkW0xvn7PlHOo6rC2WjKwvAWnKrWuZpE6fLOc2LUw3L3Nu6aO+JnMxmx5UBOvl/SEibu6trpNRDLPoTKN+3hWE35VpcqfakQXGzj1BTBXMB99z3SzeJ2f//xRbju/M6cL7BkJxVzAg20Vfx+UCXf0qQlr+HbXvASLNqeOb/Hw3YIY9YmX1DImMkzy8vJ6DAWjbrfr2wvLxNovHL/XiqtSZ5JpfE1vo6Idw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: adamharvey.name; dkim=none (message not signed)
 header.d=none;adamharvey.name; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com (2603:10a6:803:3::28)
 by VE1PR04MB6655.eurprd04.prod.outlook.com (2603:10a6:803:119::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Wed, 27 Jan
 2021 10:56:18 +0000
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::9c1d:89de:a08e:ccc9]) by VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::9c1d:89de:a08e:ccc9%4]) with mapi id 15.20.3805.016; Wed, 27 Jan 2021
 10:56:18 +0000
To: Adam Harvey <adam@adamharvey.name>, sfrench@samba.org,
 linux-cifs@vger.kernel.org
Subject: Re: [PATCH] cifs: ignore the noauto option if it is provided
In-Reply-To: <20210127071020.18052-1-adam@adamharvey.name>
References: <20210127071020.18052-1-adam@adamharvey.name>
Date: Wed, 27 Jan 2021 11:56:15 +0100
Message-ID: <87lfceabsg.fsf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2003:fa:705:9f70:a57b:e953:1c67:f634]
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2003:fa:705:9f70:a57b:e953:1c67:f634) by
 ZR0P278CA0029.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1c::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16 via Frontend Transport; Wed, 27 Jan 2021 10:56:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74031fb1-833a-43ea-6e57-08d8c2b22cbd
X-MS-TrafficTypeDiagnostic: VE1PR04MB6655:
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: T2ay9jKAWVMuqqT7etsa6XdO5crS6fynI7O9PYfOpTId239R0w01pOpFdXlsM4msJbaSq2sWoF2HLEoM1cgHAuaMae8GMLohv1dQ3ZmXVpP7t4FMG8YUxcWN4iq2lOSoPdQbO0uVN/ic49/LJ9A4jBRX5araMnddoedr9rpNBGykTFC/4q48n1Wv5diBmyLd7erLWloO/sur/BZzLY2ENYAGiFMeTqsfprUuBCdQDmYs90qD9wBJjaYLM8Ia91r72QIHi1hIgmDKCU7bCqCNM4jiWACDcNVYehPZ7hOtxsc5RSJ3QXxxrQjFvzYqR9TxySngBUd1MxztPYbzTEDIsMTiHrOInNQRAtR5lnik4PdzfJLESCxjnR8d6dvcfco3WkL2ex+hhBapy3fOZ3XaHifeXDIslsM8yBktodYje7Yepo4B8ICR9eWahIzQAhadK9MpA5QhUmph/lssn+lM+lkrUtFOGeRr40yzaiThlZTiyZ8Np9d534WUxJcTt4HWDE2bgA2PN4tXB1bSqloeyQ==
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cWFBd3FGMnkvQStBV095dWNtUXFWNE5tSVJiVndlODFlMFI2K1pPRmtKUktS?=
 =?utf-8?B?a0Vyd3VRTkRERjVzcDh0cFd5eWk5WVJRWUExK051RUlEbktURU5SaTY1Yzhr?=
 =?utf-8?B?SlVXanZXTlBwbi93alJkVlJwNmxYL04zK0RleUsrSlUyMVhmbzRkeWZIeVgv?=
 =?utf-8?B?VG5aZ01LYXlTSEVBVlJkNy80cCs3UXR6eklFTVlnQnU1LzFLNGJ1d3ZDa0o4?=
 =?utf-8?B?b2pUYVc0eS9hWWtZK1FjMXV6VDgvVVo3NXFrQThrR2JHVHFGVDF3TXk3bllk?=
 =?utf-8?B?U3liQzlIVXpLWUJPb3VVb1dkM1JhdldqTXBNVnJrWTdUZEdud2NMT0NtbENl?=
 =?utf-8?B?dlFHSFRxL2Zza2xCRkxFTjFPN3dkdVRBY3oyWmVBR1lJNis3NXZhZjduc0cz?=
 =?utf-8?B?b3RjM0FkK0hZZmorVlBuV0QvU3hxcGdBZTZzSmpMcGdQcHZaajdjdklNTGQ1?=
 =?utf-8?B?MWJzUERxNGpsOWFVSkJFRzl6S1UrdXFSRFIwM1Q5MkdHL2hGNWhKRFMxWVN1?=
 =?utf-8?B?eW9zdGFnZlE5MVYxajVLcGg4OUhISUx6aUpuK2dRY2RkRkZUbmhLTjRoMEND?=
 =?utf-8?B?c2VZeGxVVUNUN0N5M2ZoK25PaTlrMnJ3RzYxT01iSk16SEljREVnWVhTUDl4?=
 =?utf-8?B?c08yZkVyMTBWWThRUVVia2Ivc3BqWEhnWmZwWmJxQzVRQ2kyekJ2MEs4Qlhx?=
 =?utf-8?B?S1ArK05RMVpaTWdKSUY1dm43c0pIZ21RVzZaaHVpRDdkZWJYQjA0STNGOVNJ?=
 =?utf-8?B?OUkvV1dtN01NNENjU3dFUXZvUk1sRWI3Qm1yZWJCangySSt6QlZ1WFAwb0du?=
 =?utf-8?B?aXRROUdtek5BdldIU0Q2M1V1MUliNTFIMjdFV29HWlFsdGNSQ0JSeWNZRGxh?=
 =?utf-8?B?dUVOTU1abUM4RklYeU9HalVJUVJWelA3RFp0U0NXaDBZZnB4dFN5WnF0ZzR2?=
 =?utf-8?B?Vm5mM1U1MWNONy9NbTd0M0dYcmZTd3JocHN0Y1dnUEJpUDU1NnAzUDMyMUJD?=
 =?utf-8?B?UEx2dFNFU1podXhESU8reXFsVnYzT3RQWUpLdGdUc052eGJqR3RabHl5MnNy?=
 =?utf-8?B?TmlVbDRsemMydTVsR0pJNG5qalk3cEZPYXc2aGp3VU5DUGZiZ2R6ZnJPRnRB?=
 =?utf-8?B?NURXVVdJdTJtdWdMTXE4VDF0My8zaVpNYlZMWUk0S2RWRGFEU1FOUFVDa0dl?=
 =?utf-8?B?ZlhKN1RvdjhDTHJzVUxzbjMwOGdIT3hFc1pPNnBzbTFheWUzUW5iWFBsS1ZE?=
 =?utf-8?B?eUJKNFRoZjJCSTBoaUVjb0RqRW9uZHBQa3hWRmJBakhNYzFGK0VCVFJ4Yk9V?=
 =?utf-8?B?NUpTb0t6M1EyR2pJTm45RVNUZ2FtRlJQcUUzbXZEdG1MWTAzemIwNzIwTVAw?=
 =?utf-8?B?RzZOcXZZOE80TE1QdGRManpqekRKdkxTZXVlNFNJQ3luZThXVTgwblptNmlU?=
 =?utf-8?B?R3FJcHY0eml6QzdxS3ZjOWR2UEQ3Y25XNDFDcW55TlVKMXVOUWxWbUFyTUFV?=
 =?utf-8?Q?h4DFq14zvO9gZE8DxpdbOZfHWAf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74031fb1-833a-43ea-6e57-08d8c2b22cbd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3359.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NNJsW4jRgLpH73Q9B6KrCRyPiL70/xh9FPXumrBZJNA2LvhI549+nI3Dk34Zg5Zc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6655
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
Cc: Adam Harvey <adam@adamharvey.name>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Adam,

Adam Harvey <adam@adamharvey.name> writes:
> In 24e0a1eff9e2, the noauto option was missed when migrating to the new
> mount API. As a result, users with noauto in their fstab mount options
> are now unable to mount cifs filesystems, as they'll receive an "Unknown
> parameter" error.
>
> This restores the old behaviour of ignoring noauto if it's given.

I was looking at other fs code and it seems no one explicitely parses
auto/noauto. Any idea why? This looks like it could be handled somewhere
else.

Also I would have expected fsparam_flag_no("auto", Opt_ignore) to allow
for both auto and noauto.

Cheers,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, D=
E
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)



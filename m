Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9FE2F5D42
	for <lists+samba-technical@lfdr.de>; Thu, 14 Jan 2021 10:25:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=zCPfuXy5Bii+wf/SqTz1JCjyXiojJoo0V1h2IG7/dvA=; b=owM6dp8i6aVDnZ1xaMiqJA+iC8
	555USlyAy3AlotqsOVAL0jixERjd370qGwu+XtCHG9BLf+yZFDRdkZf3NlHNV8qrJMUAnGZoSxze+
	a898eAtZVmg4HILp3vByCOXCJeN3ZB0JQnDU39ufA7248CheUUaNNOaXNiBtBd7zNyGD+ZrQzWVyS
	u3xwKFZfgLhDOLvekbFRhRRbvXP0T/RrFkGX/bhDq68kohAV6mXMIxVVmKINpVcZnhnt8vjN1AOB2
	1zVUgbFdyzydqwfp5uiVDtUXs+u5cJeDULPDsq6LWX+H2/3HIvOzv/5aXe323u6qpCf4+HXL656tA
	A8xWXRTg==;
Received: from ip6-localhost ([::1]:47842 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kzyst-005czA-5k; Thu, 14 Jan 2021 09:25:39 +0000
Received: from de-smtp-delivery-102.mimecast.com ([62.140.7.102]:36999) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kzyso-005cz1-5l
 for samba-technical@lists.samba.org; Thu, 14 Jan 2021 09:25:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1610616330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zCPfuXy5Bii+wf/SqTz1JCjyXiojJoo0V1h2IG7/dvA=;
 b=ZPXXridQqCZ/Ku68lx+yIMagY3Z4yW5nBS/couOSbDxnkXvmbF5HKKHDD2sdG8XbVOLzoq
 VATWb72f6Q2fiHRB87OfcGBjNi8ay8nTC3s9wDEz8A1Fn+De/9DKApKV1E/RZruRoGLLyc
 uOaTPfxEpPTVNh8pTnPt1muI6hGWz0g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1610616330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zCPfuXy5Bii+wf/SqTz1JCjyXiojJoo0V1h2IG7/dvA=;
 b=ZPXXridQqCZ/Ku68lx+yIMagY3Z4yW5nBS/couOSbDxnkXvmbF5HKKHDD2sdG8XbVOLzoq
 VATWb72f6Q2fiHRB87OfcGBjNi8ay8nTC3s9wDEz8A1Fn+De/9DKApKV1E/RZruRoGLLyc
 uOaTPfxEpPTVNh8pTnPt1muI6hGWz0g=
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-VyfuKy2YOJKnN-xHhcLqIw-1; Thu, 14 Jan 2021 10:25:28 +0100
X-MC-Unique: VyfuKy2YOJKnN-xHhcLqIw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EjFpuvw3odOeGI7WB2u9+QSqPIIcX0bxAymRbRT8qhb4O3znC65dZcKIeQ+Tp1vaXESz9fIR92NAtnFvWFVn2KPFyXw719dmq++kTLCKCYlZmkoEGPips3wquxRfBcJGnFtr229idujfFAMz0tENLqEIMjhSJ/XrPEROVr+H9HQM/Ft2Fk/pyICO8MZznX7zeoltLA8j3febzHxAdH0tFcGPk/rOALh2itheQmWc9lwBwC1UY2HcJDL9tktj9YbAlgQLl6ksy0/zOtV7OkQrGe/mb3oPa4Uctheq6tBHNxc8In7uTeHBfMNT9qvyZuUMt8NyaMFp07ZgtyEM+yPPdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zCPfuXy5Bii+wf/SqTz1JCjyXiojJoo0V1h2IG7/dvA=;
 b=aERdl4fjPjjX1IojS9pbNYqjjbuYB3S4RrbJUa/jDoSPuEBhZl2FrN6xv+sb4fj5ucXpGxFctWGrvcHtnQB/QBt4p9Oa4RdyHkp6oGa5rSvMrInehqP/tCEnhKqxnhDqZBsVqsu9PHh6sKrb2Vi2449FSvMjxyYM6tgf5UhS2orWHOlBUHcE7KUpNLKKXNg8P1HezS4jHI3f14CHXcoqz2I7TpLGucg4c1jfXt5BP2la1jk46s0pcfz5U1S/k3CN3FgVNb/s+hFqMKdRwjRkZM0uiOkxbnBgAuet15LmSw2Sw38ZauLtYm8JnFGtqxcuVJrGM0MH76GyKXHir5PP8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: linux.alibaba.com; dkim=none (message not signed)
 header.d=none; linux.alibaba.com; dmarc=none action=none header.from=suse.com; 
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com (2603:10a6:803:3::28)
 by VI1PR04MB5055.eurprd04.prod.outlook.com (2603:10a6:803:53::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Thu, 14 Jan
 2021 09:25:26 +0000
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::9c1d:89de:a08e:ccc9]) by VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::9c1d:89de:a08e:ccc9%3]) with mapi id 15.20.3742.012; Thu, 14 Jan 2021
 09:25:26 +0000
To: Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>, sfrench@samba.org
Subject: Re: [PATCH] fs/cifs: Replace one-element array with flexible-array
 member.
In-Reply-To: <1610615171-68296-1-git-send-email-abaci-bugfix@linux.alibaba.com>
References: <1610615171-68296-1-git-send-email-abaci-bugfix@linux.alibaba.com>
Date: Thu, 14 Jan 2021 10:25:21 +0100
Message-ID: <87czy7lvjy.fsf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2003:fa:705:9f69:1ef8:3a2c:dccb:e3f5]
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2003:fa:705:9f69:1ef8:3a2c:dccb:e3f5) by
 ZRAP278CA0015.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:10::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10 via Frontend Transport; Thu, 14 Jan 2021 09:25:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8acf310-2237-4ade-40d4-08d8b86e53d1
X-MS-TrafficTypeDiagnostic: VI1PR04MB5055:
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: fe0RpK9fp3t9nspM2vLOKN/e5SlRrcq5+IVf1o9WFJgR9SEtP/gWXqLgIoF1GpHKLKk4KCWotQ83fHSjVNfCCIIMzs2lrIIdpGGzV08nSpS0jaRnqRlw6To4q7tSVI9XUUG9fp1DM1oqj1bT6Ncc9wj1O7pLIthtBHG2SYT8tiJQLasWRCqwQ6i+JW3LJBTM/Yl6CsMY8mSus1ZXA9CmqfKELZV5EO4QfKk+vJ1/RQ4e6cQBtZncDNDt4w39NQpvUD55go/P9e0hvkFeUKmhfUYJkmBnxpbMWR/5sJ6rJBWUV8APIT+GAh6//1LQJ7agoOZCMTAts+qh+pOqqlBOal5F3oAheHJb7KFGTdZGbS6a8RVwR+hWUyChVnnxjzP5HUk4HQ6Tf9yv7TURJkf0bw==
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?a0dVOEF5L2ZZVTdCRHdrZVAwZzBOMXF0bEpRMGZ0NlA1eUFYcmxUM25zN1Jr?=
 =?utf-8?B?OEE1eW1RSDZaZlZiQ1RyQWN0alplb3cyNkJvY0NYTWw4QndqK0hoSm1hdGNM?=
 =?utf-8?B?di9qQklvNW1DOXNSUERhV3RnMnlGRVBNU3Z6K0V5VFNFT0lhQ0V4bGVzazlE?=
 =?utf-8?B?anRmTmZIWnpaS3NSWkZGZ3VrQzJLbWRJZXZXWSt5M3l6Sng4S080RFpuanB1?=
 =?utf-8?B?Q1ZLVDFmeXorUFJBV2psM0pOZ3RLWkxYNjFSY2JxV1lqZ0JkY3pPRlNTT1J0?=
 =?utf-8?B?RUtSekYzTG51WTR6dTc0dWhyS3ZRVE1FaFBFVkYyUUpPVXd4U2ZmaDNDa3F0?=
 =?utf-8?B?ekIzS01QODVyRU1kSk9BNmVkcmZKWU5TQmZDSnlvUStDSHU0TmVYMy90eThw?=
 =?utf-8?B?bk4vZk5IRzJtVlFaY0FmdWpQdFcvT3ZUOUh6R1JiVWxFalM1TVIxTTg0WWt5?=
 =?utf-8?B?bmhmb3ZDK1JzcVExcEtJVEp0WWRyTWJVU2RvclorZzBkN3FmUERIR2N4YzZ2?=
 =?utf-8?B?MjhBS21zR0xCRWdJcEVQaWNYQW9nNW9xblMyLzFOMVZCb09NT0hBZkIwWjRs?=
 =?utf-8?B?Y0svU25zRy9nMlJOOWllaTBkUWg4SjlHNzYzOU1tc2o5WlV6cC9WVnBaOVQx?=
 =?utf-8?B?Nm0rdkxRd2xQYkd4QTRSRjl2L0M5cEZ0UUVEamZpTjJhL25ZUnR6eHF4ZXVj?=
 =?utf-8?B?VTYyQ3oxOVN2Tkk3U2ZheUpacFJ5Qzg0a3VtTU9UWkpJRFdqNDVQSitMcHdo?=
 =?utf-8?B?ZUE5NmNmbWZQOEcyVEVpN0JqT2Uyc3RpYlFGQ2J5Vi9kQ3hEaHlUdTh1Q04r?=
 =?utf-8?B?VlBRQ2ZFa05lYXRwRTJWRnV0NkxnQUJ4dy8zakNGdXJmaXc1ZEF4YWp2NGtj?=
 =?utf-8?B?WjVmVitxTklFcSsyRllVUkgzYzFmQXpUZ1VMblZ4S1BWUFI4SkQ0Q01yQnVs?=
 =?utf-8?B?WGRwSHNxOGROcTlEb0w3QlhXcExvb1YzZFZBazFDV3RVd2M2WjkyQ09HK0dJ?=
 =?utf-8?B?M3BMenhDVDlJYnEzUDVIUVh1ejEvczZ6UUwrOXZpcHNocmd5emFETHpva1ds?=
 =?utf-8?B?ckVkMFAyZm9SVGprMURBMVIxei9CRHZrVFVpeUVHeHNoQkFuVUhPWXpGbGtE?=
 =?utf-8?B?UG50L29yaVMxRklDSlRrc0xmVlZUeWF0cXlUTmdMOGZmV2dTaEFQa1hrdzl0?=
 =?utf-8?B?RXFTWXNISTB1ZFFYSHJFYUZKaXoyaDFMclFVUDcwM3RTdjJhWXpKMG1rY2Zi?=
 =?utf-8?B?S3ZXekFJUkJBaGlBS0xlRS9jUzBuUG1rdkJ1S0o2K21PYVFVRE1MUEFQVk9m?=
 =?utf-8?B?QnpmcmNoR2FOWlIwWFNIbk1NeHVDcWpvaU05Y2hDQnMxNk9ZaEVxZk5GN2to?=
 =?utf-8?Q?SXBOdVN95e1xvPJ1zh2YRq2ADULHYyFQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3359.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-Network-Message-Id: c8acf310-2237-4ade-40d4-08d8b86e53d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8UFvgW5TQlzZxp8btpFgLsbnSGika6jjQGtpFNXhZrIF3ofdAed9Q2o4upYmuFMY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5055
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
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Jiapeng,

This will change the size returned by sizeof(). Have you checked that
this doesn't introduce off-by-one errors in all the sizeof() usage?

Cheers,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, D=
E
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)



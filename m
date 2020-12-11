Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0912D71BB
	for <lists+samba-technical@lfdr.de>; Fri, 11 Dec 2020 09:29:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=g6lIINDsUGGaCiYq8gIz4Yrx60+XaWVuwdAjsUbKyZE=; b=QQ9I+lbgX86tNfoc7TF0eemxRn
	w2UPioA3rRLPcndBlouExT7W+dNbXNxkVZjzr2HxHlMn3ZuZG/KktUJjXmCwG7oeoV0HABHfLxYuA
	qndn/j86AW6Cg8tcAIhr0P5WQlqStcliDuExF2FC/uhl6dRPa3WRjWQVlhpeaO1gbZ8rCIHcd2i3k
	Cg9RekVAoOzIghCEhxvj8WM8tahfMG3L1ZZqcM2og4R2Xi8vrJwXsMaRf1FQg2EZ9tlRO2KDYn9qe
	gGIUW/HaLP7RZ7h9slc3OyTRTKRzppwA3h5V1pffv0AaM97YtSw2qjsUk/clnB8veWdx+jPf5Qxxu
	pvgL5LTA==;
Received: from ip6-localhost ([::1]:61562 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kndnk-000Ugn-Mh; Fri, 11 Dec 2020 08:29:20 +0000
Received: from de-smtp-delivery-102.mimecast.com ([62.140.7.102]:20729) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kndng-000Ugg-LG
 for samba-technical@lists.samba.org; Fri, 11 Dec 2020 08:29:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1607675353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g6lIINDsUGGaCiYq8gIz4Yrx60+XaWVuwdAjsUbKyZE=;
 b=hEq0xd1MEuCIgETBtjIO3ZdJAoEXEgVUtkZD5WTvqehbDF6RTELvIvKLoTJG3VehPkK6Lg
 qoBcKNJKJF4tqqo+E4axLFhdzKo4ghDlEypd1D34X8KSZ37/j1W9TZKBUaM1B7bbZPg9Mr
 YWOPvwTDF7Vh7Bj7SyQi62Jr/s0JV3s=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1607675353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g6lIINDsUGGaCiYq8gIz4Yrx60+XaWVuwdAjsUbKyZE=;
 b=hEq0xd1MEuCIgETBtjIO3ZdJAoEXEgVUtkZD5WTvqehbDF6RTELvIvKLoTJG3VehPkK6Lg
 qoBcKNJKJF4tqqo+E4axLFhdzKo4ghDlEypd1D34X8KSZ37/j1W9TZKBUaM1B7bbZPg9Mr
 YWOPvwTDF7Vh7Bj7SyQi62Jr/s0JV3s=
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-tax4BwX0P0ytVoo_MWyzaw-1; Fri, 11 Dec 2020 09:29:10 +0100
X-MC-Unique: tax4BwX0P0ytVoo_MWyzaw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ESw9BR/sUz88N6DmU5dt167t3xh3z8LOBjbHMDGmdy1dGmtdRpL67OXBdXqChs9knAh9P2/rbsxFRSvmPg2rbYhfbILONXmnArYXkudfeD9ARZmOwnxAp83VcKW5ikzqG3qYvTaR1/aTqF9KGPhJGGqi2aSiz4wTlccSMyr7tbxME1aOYsgHzodzsT9EQzNYI5uMtry2YhNBJ+lyabdER0lAzDrHaH+1XzlQh4EfDjUQrqsmHI/HeipHEtcAWB3aoS2dKVUNKjrMWtynoOMIV20FbM2KU2pZRTbwxUUN25Of/e4vP3qNXVXRMxVAVNn0xLibD2BNXCWDusqUs3O4aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6lIINDsUGGaCiYq8gIz4Yrx60+XaWVuwdAjsUbKyZE=;
 b=nsXh3Ot945ggofK8BVdj/GvlU/VrYLITi+p0xSl79abGO2+0j9WsQjsKY2jq7hDRGic2MRk4H1bYkR7YIRP0Ma2/pJyxitZKWWbFCdXq0y2gqDE5FWQahYwBz5DddH2E1zWnGGmHagD8klDsaHAkj+y3M1sYuAe6VOtei7guIhJEti+JlTpYHaw4YtijkprRRtfS2e3RdmnT3Tso1My6bc4bpHV+7nhyhIQqPQTtUh2XJ+IEws0dP/KbxTzz95K0ActAcf8cyuOne16Gr4B4kdnUnSh3FLGMtCkm6abF24+IjNAm2GgW51OvNjIUYG3i466uou/33tnyZ3lp/9ar5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.samba.org; dkim=none (message not signed)
 header.d=none;lists.samba.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com (2603:10a6:803:3::28)
 by VI1PR04MB7165.eurprd04.prod.outlook.com (2603:10a6:800:125::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Fri, 11 Dec
 2020 08:29:09 +0000
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::4dad:a2d3:5076:54f0]) by VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::4dad:a2d3:5076:54f0%5]) with mapi id 15.20.3654.015; Fri, 11 Dec 2020
 08:29:09 +0000
To: Boris Protopopov via samba-technical <samba-technical@lists.samba.org>,
 pboris@amazon.com
Subject: Re: [PATCH] Extend cifs acl utilities to handle SACLs
In-Reply-To: <20201120214918.12517-1-pboris@amazon.com>
References: <20201119214042.6113-1-pboris@amazon.com>
 <20201120214918.12517-1-pboris@amazon.com>
Date: Fri, 11 Dec 2020 09:29:06 +0100
Message-ID: <87lfe4d9v1.fsf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2003:fa:705:9f47:f45f:bc81:70ef:c11b]
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2003:fa:705:9f47:f45f:bc81:70ef:c11b) by
 ZR0P278CA0040.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1d::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 08:29:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9f3802d-afb6-44b8-595c-08d89daed4c2
X-MS-TrafficTypeDiagnostic: VI1PR04MB7165:
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Aggrpalkgr+cqYaM++/R30n2i1LvN2EkGY/9sNzXkVPivJE12zvBENEW9TVryt75Cf9wNTubMvfWcy323HAs+SuC2Q5zyRO7r/LayvfDTSrmVC/AgcrM5JVVw+Dtmo5EWMgEb/CvO8w9/crGow9IPLun12gNPF8LXPg2tQTkrBePdGDZdBM/KrhlgDai+wK7e3eWaBypEM6S1NaSZ/8IMcw4VjZjoCkLiA/kvbfuJxCgGsBjC9f5WAMlsbjMcQPWqa2XdNk0CQiaGDzhlfS2Z/R2AxENxX5CD3zVx1RdLo5OtphFHv7RMB04mXSWwIDxJo8cgVPx9P8X8S7VL/Nsow==
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?V3l1ZUsrb0dCTDBtSDkzeEtNOS92dzZzdldvSTEyNFlzcVdGcExTYnd5aGFj?=
 =?utf-8?B?amxvdHZQKzZvSGVTMzFIUzVGZWxwY3hLZFQ4WC9qODhZSnNnOHRFbGpUd2Jr?=
 =?utf-8?B?am5ZSVFuUmtNNE5KaGFKd2t0ak5LNW1rYjIyK0VlZldLS29HaHcwV3J1bUQ5?=
 =?utf-8?B?QmprcFNZWEIwRThCQ3pYaHJSVXYxc0x1NHJ3L2ROTStnVkVCemlnYlhNcjBK?=
 =?utf-8?B?UVFFdUxsMk4razFqa01HRFlXU2VNQVVmcDY3U2ovZDB3aE8zcjZSZDhaNXly?=
 =?utf-8?B?S1J2Mmk2UmVoZHBieGdLN1VrdHJEbGF2NWtZZk1Xa1Voc0U1RjNYbG92NXJq?=
 =?utf-8?B?ZDArTHNMM2o2NzIwK2FVOGZyTlJhK2lqeWhOaUV4SkV0bHYrdjBiMXZRS3ZQ?=
 =?utf-8?B?MXZVRkVDd0lDRXpDVmdHSExabkJ5UTBocHNrOGt3d1FOWkF5eUV6SmhFNlJG?=
 =?utf-8?B?TFdDOEJVOEZINWhvSkpSaGJUVXViNU0rYTFvVEFkZVV0NWVXbDBUeWNUUXdK?=
 =?utf-8?B?UGdJd1B3Vm1abEZURVliT2tEY3lKaklwUFhHN0FMSUNkbURmK2h5T0owaWk0?=
 =?utf-8?B?QlZQSHczLy8wTGN4Y2R3RnNiS2Ftb0p3RnRlb1JkUjRNVDY2TWE2eFA4Kzdt?=
 =?utf-8?B?dllNT2dFT1VjcWtNOUx4K1RvWGd6bzFzRFpvVE9MdjRXZXBkcnJaaVF3N2lB?=
 =?utf-8?B?RkNUNDBYa2k2eGUzTVNOVVRWQkdsYndaam9KMlpqdjNaNWxtUisrMS8vbFhT?=
 =?utf-8?B?Y1AwSVp4aWIxTE5QZ3pIbUFXaVlSdm9pdGl1WGVSaVpwY09MQ3dtU2VLTTNE?=
 =?utf-8?B?cE9YeGJvb0dKbFhlak9wMk5lUUYzUUZXTXlsQysvYWdGT1ErNHpUSGhKVmMy?=
 =?utf-8?B?VHJ4aHZLMDBPTlE2QTZVakxLWVFWSTMwL2hWeExUck8vZkNYbUtpSUVhbEow?=
 =?utf-8?B?aTRmUldtTmdGMkx4NXNmbld3MG9mSEVWY3FTVUYzb3piNnpkZTdmVlcwZVFK?=
 =?utf-8?B?aGN3bFdoWlZndEt6WVU2TlhpWWY2aDUzTXgyMUtQcitYRjl5czdWT3dvRmQ2?=
 =?utf-8?B?Nlo2RndWVlRHcEd1QSt6YndkSnpXSHBPZ2FnTS9VNmVWY2N6UDczbXVwekV3?=
 =?utf-8?B?L29BYUxCeVB5R0Fhb1IzT050VlloUUZMRGNqT2lveEFoWC84OFRpSERDN2Fj?=
 =?utf-8?B?T2V6bzdMMTJDLzVOaTlGOGRUWkdUMUdtRXRaUEd1SlFKelBidzMzNE1OVmti?=
 =?utf-8?B?QlRoaTRGVjFyRGpraCs5UlJnNEVpN1V6cWZIdmgrN0ZtL3BXa1NIcUE0RUVK?=
 =?utf-8?B?RHBZRk9RRVZIVlZuWXpld2NXbkNDMnBJeG5oU1hKZHNXd0pHTkFsNnozaEVD?=
 =?utf-8?Q?B34XgV5umHGCPP6G68uEhp0ZQMxOe9ME=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3359.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-Network-Message-Id: f9f3802d-afb6-44b8-595c-08d89daed4c2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: //ynpoc1gbdOtWiS7mFPTEaYbKzXc+Xj1/q0ComfRdw8NsYu+9z9MNhJ7xI/9v7q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7165
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
Cc: sfrench@samba.org, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Boris Protopopov via samba-technical <samba-technical@lists.samba.org>
writes:

> Fixed error cases for insufficient privileges, added
> attribute not supported error case for getcifsacl.
>
> Signed-off-by: Boris Protopopov <pboris@amazon.com>
> ---
>  getcifsacl.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/getcifsacl.c b/getcifsacl.c
> index 1c72e7c..c1974d3 100644
> --- a/getcifsacl.c
> +++ b/getcifsacl.c
> @@ -445,15 +445,26 @@ getxattr:
>  			free(attrval);
>  			bufsize +=3D BUFSIZE;
>  			goto cifsacl;
> -		} else if ((errno =3D=3D EPERM || errno =3D=3D EACCES) &&
> -			   !(strcmp(attrname, ATTRNAME_NTSD_FULL))) {
> +		} else if (errno =3D=3D EIO && !(strcmp(attrname, ATTRNAME_NTSD_FULL))=
) {
>  			/*
>  			 * attempt to fetch SACL in addition to owner and DACL via
>  			 * ATTRNAME_NTSD_FULL, fall back to owner/DACL via
>  			 * ATTRNAME_ACL if not allowed
> +			 * CIFS client maps STATUS_PRIVILEGE_NOT_HELD to EIO
>  			 */
> -			fprintf(stderr, "Insufficient permissions to fetch full descriptor fo=
r %s\n",
> +			fprintf(stderr, "WARGNING: Insufficient priviledges to fetch SACL for=
 %s\n",

There's a typo WARGNING -> WARNING

--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, D=
E
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)



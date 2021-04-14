Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0743635F661
	for <lists+samba-technical@lfdr.de>; Wed, 14 Apr 2021 16:45:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=z8vQAcnfWJdb9OKzdwff3rOMVHaLmV8wtDaLDKCKwJs=; b=rWqGFT8PeQiPTGFnVI50V8pTvz
	ftRRS3pcAfSO7wD/uabXQuykis0SAfV96ymKmHTcdElwKqNv73/N9OyTt7RExix8O9NV1dYgnMfjs
	UZUqgUCfKwJQD73bfrxqk6VwMxn1PvB2zicFzc37l67GgFIOSi5E67afsGB7d/TilByJmRKiWbRWI
	qyWTEo8eNwohD+u5SBfsWIpXVq2JHVRIwbUUqlPwsJrASXrbDDZCRfuDgAFu9SNhmQOKROUmGWCjB
	89xo3nHabwGYwE1XC9Vgj+d6+3vfksTU4AL0XA33SLtpB4ka8MokW1+V6IsHudfLrgOWkKAotPaQG
	Sui3v1/g==;
Received: from ip6-localhost ([::1]:53036 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lWglZ-00BLAS-0R; Wed, 14 Apr 2021 14:45:17 +0000
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:60654) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lWglP-00BLAF-Kb
 for samba-technical@lists.samba.org; Wed, 14 Apr 2021 14:45:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1618411500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z8vQAcnfWJdb9OKzdwff3rOMVHaLmV8wtDaLDKCKwJs=;
 b=dwwlzN6aNY13Q223h6E/za/fArIOlpflbiq7kxi8G66G2zdB4ygyTx5R3jG2sNOdB24mfm
 TWlITPpJ503lCHItlKqAhf1r8U57N5ivJ7YOfH9E4bB+AVTKOnOOQInHcVEFY6bQANoXMU
 Iwuiue6/frZyXFNQHFm5hgph3xAg4Io=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1618411500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z8vQAcnfWJdb9OKzdwff3rOMVHaLmV8wtDaLDKCKwJs=;
 b=dwwlzN6aNY13Q223h6E/za/fArIOlpflbiq7kxi8G66G2zdB4ygyTx5R3jG2sNOdB24mfm
 TWlITPpJ503lCHItlKqAhf1r8U57N5ivJ7YOfH9E4bB+AVTKOnOOQInHcVEFY6bQANoXMU
 Iwuiue6/frZyXFNQHFm5hgph3xAg4Io=
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-4-fhyIvccROxWM9HdDj4drpA-1;
 Wed, 14 Apr 2021 16:43:27 +0200
X-MC-Unique: fhyIvccROxWM9HdDj4drpA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z57Jc6lw/8SqMhdFdhEQa4MrAn/H2zIVHZHVJoPpqgpfuj4MsS7EBzqncx0Wf1IbStdQLlxsRbhpgO65QwlclWby7rO1ztPK55/Q2G3+ATkfQokDRmdT7uuYM6LDpe7j5kmTH2A2CoJGLcH08ypvzdELhvnOq/iAsbnfQZRB+99m1ImhO7Q4JRyY/4pNN+KNFq38/8z5OBbv3ceKYVNdjUjCnsRB9dQfT1tfdYw3yUhbZoxP5lk42GwHOg4sVIwb+wwOI/LBM5vavT3kwjJvmz8Bmmwdqvl8rX8HdRj9jLHrIg81Cb0/TB/vM4mHZT79lrF+XWJYarA9kv+P4n9qaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z8vQAcnfWJdb9OKzdwff3rOMVHaLmV8wtDaLDKCKwJs=;
 b=NLjmMRFuFFu03jB+VDLLVdZ5YC+EUPw5Zg5nlavwk9cmnEpGo4hkfnt7Rpqe+5sDJ0Yfa1Yd/vQjbBXXM8l2HKFlOiMjrQ2V5I7IAASXvUwQNjxQhBh9LozaZ8akeNppzmm2H66HNqarz1vKbjeM3tqKhepVae4+r5BcITY+l3egixLuGT16tnNBwrrqcOxNbIdNtbehoV29SYPSLs/hffuxg5t9aZQT7tmkaDzwDkDATIW2otT4pnb5MFk/3dtWQGGQ/fDz5eI9L7V4wSEX8d3+mYu9xPoEnCuPk4eWdqlGe0jjHIa8uybmJR9jFxFUeMJp8awUzpaYSHQcY1imWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: samba.org; dkim=none (message not signed)
 header.d=none;samba.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com (2603:10a6:803:3::28)
 by VI1PR04MB5053.eurprd04.prod.outlook.com (2603:10a6:803:55::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Wed, 14 Apr
 2021 14:43:26 +0000
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::3c87:7c9e:2597:4d94]) by VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::3c87:7c9e:2597:4d94%5]) with mapi id 15.20.4020.022; Wed, 14 Apr 2021
 14:43:26 +0000
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
Subject: Re: [Samba] findsmb: drop it or reimplement in python?
In-Reply-To: <1785578.urSO1NLUhl@magrathea>
References: <1785578.urSO1NLUhl@magrathea>
Date: Wed, 14 Apr 2021 16:43:24 +0200
Message-ID: <87r1jd0vw3.fsf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2003:fa:703:334:3d56:188d:3047:1bd5]
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2003:fa:703:334:3d56:188d:3047:1bd5) by
 ZR0P278CA0032.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1c::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Wed, 14 Apr 2021 14:43:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d21d25e6-df43-4444-0cfa-08d8ff53a987
X-MS-TrafficTypeDiagnostic: VI1PR04MB5053:
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: ewN56JyGeYMdUg7WxegjTa3EEoASmnmq2OupnzdJY0stVxw7B+LZN51/AfQbaOcoRbxXLLj8moJxwlH3G30w0LBYfX6mjajGNAu67SUABblmb1lp9UlJaEi+lkitVWjoOgVDZQ7oEgFsOJ/fsORxIVvCsBq9FX5y66qqHoV+DF3HmB4YEDf43cDbXGZE1z+oEKDOGyNl0URjLGPfE7lYYDLkC5ykhFL9B9KxbaHteBVrANyOq47HBfWnz0RnFpDiCxPA7zkNs5BNZpZDvVaZrEfNAliN2CA9uW9uDGA5YVNIhNtweWgzhd6xUPl6R9lugjyc4ZLr/GYzDr+SJGfUNTOlzlq9T+qpEIgZ5aP5MXOhk0JCnJnsHk2gTj0c5Hk9b3776vgn1daPHjifVLIxGADGn8Au6Pb4ERwk8HGjsN+UBmz8d4+npqunS54a+7bdqYKLp7WOQUUnxN5AJKRU8e5d/tML/G7dOvtLoWLGW4GPUdpqHcb9y6znhZOsPyQ6gKc823wA/lTUqUij4Gn2EsAkcqC1TdGJGU0MImUzUj9oyqLQRGWAqYR4epNLGHsB0DGcStDvx99fnk2wyx7rb5sPRM8P+7nkJ+rEpQoBewP/xsFhX0ANOI6eTIbP202deWm88opgsXWZhL8mE3hfl/Ae7+2Hczu+4lFMqFiYbDqcrwud/+DCuWqsg4ql4+aojAhw42KRqfgopG2InXgUwLhM7rqDnB7p3IgP/7er0QX10a5lZL/MnCpgeld7kakZ
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Rk54WTFqZEEwVlM4Si95RjBsTEo4OTBIOWhEdjY3am5JSSt6ZTkvTDRPTTF0?=
 =?utf-8?B?V1NicWdPRmNob3hVTmhvTTJPblhZRHppUkJFZmVvc25kUmVxbU5PenA1dUVE?=
 =?utf-8?B?Vy9uTFRnNnlwOFkwV1FJeDgra1RQcVBlNUc5U2dyNjd1VHpjWEN1NWhwNDVm?=
 =?utf-8?B?SkliMDFtUzdVTDBvbjJVTG9Ib2lSSW9IR0dxS0Nqd29GNjdPcUxVRDBKQXpa?=
 =?utf-8?B?NldWT3JyR2pZTG5yY0hSdnVMUWFQcm1NNmlSSUF3QllYVmJkRFJIeExnWjdJ?=
 =?utf-8?B?Rk1VdUNuQ2dDb09IUHlyZ1BMeS85QUs2UUcwYnNsYVBaUmtmQnl1SGRtVDc4?=
 =?utf-8?B?SllVTWNYVGJIZlVWNFdDYlJ2QUg5OXllOGxRTEcrQ3dyNmdMb2czM2dleU11?=
 =?utf-8?B?WDRhTWFxZmo1ZXBSVnYrMWVLOUh1RnBxTHdZellyZnowMDZ6L3ZvSVpiNVlj?=
 =?utf-8?B?QURkYStXNGRKYVNSMUlucDhGWGNjN2RWOXF4YTZvSkFkQVRoMXBXQlZld05n?=
 =?utf-8?B?bFp2dFptUkVOZXcwMWV4STZIL3RLNTJ6YkJTVk1mdWJoOVBtSDh6NmVRS2ZD?=
 =?utf-8?B?cVlmY3NvTW5rRitWbHowK01LQk9hU1A1djVFZnIvUWtGSE4zbGZPai9UbEtr?=
 =?utf-8?B?eHAyUysvQlhMSTNNYnIzUGFqdDdGbmVKME9kVlR3Z0RHOGk5WS9Ic2htdjls?=
 =?utf-8?B?b1p0SkR5dUdtOC92QytrMm50UkJHdlhaZ2VObWozajZLNWxKejVaNkRHeGh2?=
 =?utf-8?B?cDh3am5YOWd6aWF6MXFldXpPSGtEQ2g0S0s5SE41NVVoRDVBdWVZWkZMbVVv?=
 =?utf-8?B?MTN1Q3c5SzJCeXVKbUsxaGU0WEdYVFNwMm9na1p3OEhmWjlwTTR1S2JSWUJJ?=
 =?utf-8?B?dk9ObWh1WEFSZVYwVlRFTER0Ri8vUlJ2dFFYRmFTOE9BWnF0Rjkwd3FjRDM5?=
 =?utf-8?B?R3g1U2lHV2FGRlEwaFg3T2xkN05hNTdjeDhvRS9kZHMxSmw1T2JkUGYyU3kr?=
 =?utf-8?B?OEJrSndhQStaeXM0YnVkdzZIZnRGVmpWKy96S3hwL2ttRFdDanRBalVBRGJK?=
 =?utf-8?B?RmROZnY3RzgrUVhCcHE1TVFwN1UwbjhGZDdHcS8vM1RKYjVicWRza2VIek1i?=
 =?utf-8?B?Q3c2Z09XZnVRUUFXVm9yQ0JQNVQxbnloc3F1cGw5bStHd2Z0R2lSbVlVTVY0?=
 =?utf-8?B?b2NHbDFjTjZWbEY5SlpUeGZVVjA3bEM1NTQ2MVk0Ny9jaG9jU2hHT2RHK2VS?=
 =?utf-8?B?RnJqSyt3QnJkckl1amJFUHVSdXNKc0NFbTFhMG5ja3YwSFVuaVFOQXNTUGhs?=
 =?utf-8?B?UDMwU1pkK2I1UisvWkFYeHpHSGM3alZUZ2VSUGdMOFVQbldoN3RzUXN6dnlv?=
 =?utf-8?B?QkpGY0ljZHJiRmNNRUhWTWh3SEt1V0RSWTlkdFJJSjhuT2lPalo3aDVXNDVi?=
 =?utf-8?B?R0doaW1FdjR1SEVydDA3RXhETzNhUGRKVHpSbjVTa3lVRE1oTkxHQWZEdGh1?=
 =?utf-8?B?MzdNbVB0S09NTjNITTZGTW1kNVpEYS8rMVQ3NFYxOE1sdWtmRlVrRGJiR3E0?=
 =?utf-8?B?L2NLbENWdTdNQ01ScndIOXNZV1AxTzJldzVXUEg4czF4KzdSa0d0Nk15eU56?=
 =?utf-8?B?eGZwc0g1Q3p5KzVYQWNYbEZoQ2RUY0JOWkE4SWg1bVBXK0hONWxUbVlLekZp?=
 =?utf-8?B?U0J1enJGdlZybk40Ry9SWWljZnpxNVlMRXpSSWFvTWsrN215cHlYMERCYTNo?=
 =?utf-8?B?NFNMbFltSWxnOXFvSTBEdGtzM2xTRVFaUnlxSzNGVlA0SC9hb2cvbXhvR1dj?=
 =?utf-8?B?Nm9NWEUyVGlHU0cwVWk4WEJsL2JUZlRjTUVLOVUvM3BxRG9hZEpvWk0zM1Uw?=
 =?utf-8?Q?7wWLdPl1wwgIC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d21d25e6-df43-4444-0cfa-08d8ff53a987
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3359.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VYmceROkgF5XgLkbo7NEromCbhdLD0hnSC6MCCR/EKlQS/sPP8xvd/BBQM3TsObT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5053
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
Cc: samba@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Andreas Schneider via samba <samba@lists.samba.org> writes:
> is there someone out there still using findsmb?

I don't know, but if we are keeping it I have a 4 year old patch to
clean it up, posted on this mailing list:

https://marc.info/?i=3Dmpsbmumjbgr.fsf@aaptelpc.suse.de

Cheers,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, D=
E
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)



Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CD8326568
	for <lists+samba-technical@lfdr.de>; Fri, 26 Feb 2021 17:18:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=dkJA2hHXxL9GeCkazylIsoERKLX4N8nSqmsuQsQyS60=; b=onZ1uFaqGXcpMkGrIHLakFHBeL
	73sw15hGtgdhPQkMRVJL7alG/hg1Wl0Ih+xD30x2txwEyj1RtV3JZLvw+odvIJMSglJphqrQJR9Cs
	G90Ny3Djfsdw3S71foz1PVx7fYe+OF2F+/odJWmovm4i5gjKwFV8g4+dzyAILxd3XCEljbE7/N+PL
	0iuLvdxQzNTMHqBtLIE4NDXXBW7joM8Y1FTljoZBSmUvbGIg8h2gFGnzW+PozsDRQcJV2SQfbw5wU
	G04wHHDIbUM9hwNBdTB9o3gqHkFH4CayEj2Coe1rU5DVrKnfkhRzCkxzpUe32TULuT7tvfxbCbBcJ
	40b1BJ6Q==;
Received: from ip6-localhost ([::1]:55470 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lFfoj-001bzk-Sd; Fri, 26 Feb 2021 16:18:13 +0000
Received: from de-smtp-delivery-102.mimecast.com ([62.140.7.102]:34342) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lFfod-001by6-NG
 for samba-technical@lists.samba.org; Fri, 26 Feb 2021 16:18:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1614356277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dkJA2hHXxL9GeCkazylIsoERKLX4N8nSqmsuQsQyS60=;
 b=kfA1B8HxMcEk/Uh89Fa7tnJAhW62SXSqp/xOmEjqgvYCsjp/ozaKkyiJHFBYSJMsexju1U
 S/RqvOGM8UiKoV79kwlYfacbMaqnwlCJP4xs3tCPr/zPI9sIc5iszcp87RNVpFmMrcNhwd
 XqklRje6bK4lgDi2mSgQMVPvTwOhQ8k=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1614356277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dkJA2hHXxL9GeCkazylIsoERKLX4N8nSqmsuQsQyS60=;
 b=kfA1B8HxMcEk/Uh89Fa7tnJAhW62SXSqp/xOmEjqgvYCsjp/ozaKkyiJHFBYSJMsexju1U
 S/RqvOGM8UiKoV79kwlYfacbMaqnwlCJP4xs3tCPr/zPI9sIc5iszcp87RNVpFmMrcNhwd
 XqklRje6bK4lgDi2mSgQMVPvTwOhQ8k=
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2056.outbound.protection.outlook.com [104.47.4.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-59GCiDREP020lX1BA58gDw-1; Fri, 26 Feb 2021 17:17:56 +0100
X-MC-Unique: 59GCiDREP020lX1BA58gDw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LjJZSzqUwAc+R84Ri8XJXBuvZvjAk3nytI9UohZPi2Ab1MoAoeQc+8ANTv0yT3RLI4kBEu2Te/VaFGzPHsDghbNGoss40FfSzr3iT+ku8Ise+8fvfLopL+0rDrjALwfoUMW4XNmmi6T3wbxq5iOuRBqXupnjmCz2Mt3WDdzZa73dttx9lntOgEnHMnAfnkP+Wl6LOmUWdMSh5Rt+8QcviQvxDhWSwLABlzEfIHsnjU4uliILQjfAXbkEVH9ldQwo2Lnw4Ei7SlALsp+o9DlTJrXYqKw0x2HbozfVsYROYVC71mdONh+4o0b4C6tpPL7MAFFTvypztsdsixjcuZDSXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dkJA2hHXxL9GeCkazylIsoERKLX4N8nSqmsuQsQyS60=;
 b=hUXGwJi6lyzJvUlAXTb46LQEhbS9Juf6zW7t+dV4CdYu7tjUnvkLI7MRc9Eg5+qm1hos11t2xgvgnUc92psCXYPSXdoAgHoHtbnxnt5XHEfMEt/Gu9J95JHNT/aDS8rergNN/vzVL1QcK/AlspQ48Hh1RUoc8tCE1wQ9jw9hyWQoH76cyDB6x8lM1+mNr2D+fCFv/la0ZS0d7t3VgSnGaPW9qo8Q4dFvRdWTUwDujKsx/QEilVBApzs9bls5/8iEF9N6i4W2wGs2KhK8dkOETI9cVZblUdgf6SX77EbdkOuct2n6Tu4bQCYD7azaR3MBplFvA5nmOFji/bGPhJC8eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.samba.org; dkim=none (message not signed)
 header.d=none;lists.samba.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com (2603:10a6:803:3::28)
 by VE1PR04MB6654.eurprd04.prod.outlook.com (2603:10a6:803:129::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Fri, 26 Feb
 2021 16:17:54 +0000
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::9c1d:89de:a08e:ccc9]) by VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::9c1d:89de:a08e:ccc9%4]) with mapi id 15.20.3868.032; Fri, 26 Feb 2021
 16:17:54 +0000
To: samba-technical@lists.samba.org, Jeremy Allison <jra@samba.org>, Steve
 French <smfrench@gmail.com>, Pavel Shilovsky <piastryyy@gmail.com>
Subject: flock possibly missing in SMB3 POSIX extensions?
Date: Fri, 26 Feb 2021 17:17:51 +0100
Message-ID: <878s7aztu8.fsf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2003:fa:70b:4a16:8e2f:26f:4cd:eadc]
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2003:fa:70b:4a16:8e2f:26f:4cd:eadc) by
 ZR0P278CA0041.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1d::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Fri, 26 Feb 2021 16:17:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2529c70f-8221-45fd-affd-08d8da721232
X-MS-TrafficTypeDiagnostic: VE1PR04MB6654:
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: RuK3TcdXpVlpDDln/bCcMoYNp86DF3/6WCHkTif36MriQ7zEMPTE0aWAc548TpgrrDSZ2oCRrG/qonWS0oxq7fcrUj4zAWZGu6tamLKUGhFnJQWVxFOuRn5hF1l4jR25dhYv+wvBKVqQ4wz0H+XDn4Z8UWudI47WzOztSTGREtzi4RzLXkR4HvuFs8PNOqN/PSr1KrfW85QRQ6OWxZtwmQWm9rvI0NzAQqc1puD+kM/4CIzQeXog4mYhKmmzffQO0c2SfK+oQiJJgj2yjxEvLibLg+fPp5BCWMCnPHubJsmX7h68sBL7YICIymnOUhPgTwi9WOJ/okEPkWUCZNKEQPWgRPcjgB6Ysplp+T4fTO8Nj6sxSiV1luVU1/1PfqFQhK/as+dvjcGx5cpycCfeLvWnCNkFn7bfM50vb36Vqz4JexIvaR4EyUEe7a0Ouh5y26cY4VnWn5F1qn2qo14fiyCXp18NscwF/EjAC9xcYIDKpDO9cf2RwTg7m/kb+WW7sNGQapQv+enPYL8uHiV7Qg==
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?V05IZmIvOWsyc1Y5Uy90TldRbVd0YXlsUndta0J3WDgrWXA2dEN3eGFqT1Ra?=
 =?utf-8?B?Z0N3MnVLSXVOc3NGMU54N2ptaHowT0NrWFM0MmZ6WHFtRlRCUGZ5RDkxOGR1?=
 =?utf-8?B?RmZoMmowcVlvWFo0U3RNTHd3bjdOZVMyem5Sc2JFWm1iMVdza1VkQ0paUWFu?=
 =?utf-8?B?bUU4N3B6NG84L3lhaVZpTE9HZmN2V3RYdFJCSzJZdkY1eVl0Z2Z1WFZHeDJR?=
 =?utf-8?B?T3BRbDBjVzhWdXovK3pVeEVZMTFXdG1XR3UreWdnc3NiRjBIZHVqK0Z1SWty?=
 =?utf-8?B?ZDc2UjFYQWp2bDN6aG9pWXNjVFFtK3R2MXNYaE9sSTdMS2xpbjNod2E4UVFZ?=
 =?utf-8?B?Tm9sQWVBRktpOFI3ZCtlZHdvbGh4R1RmRTdFaHI5LzgzYWhRaGFidnIybmpw?=
 =?utf-8?B?U3FVV29PeVhXQWJGd0JTMksyZXZEN2ZDUnd2Ty82UXowUnI4OXUxUWVJM2pi?=
 =?utf-8?B?TVlpdENFcytoNDZDY2Z6NDF5dGhBUDdSOXVYak0rMmNQK1pZeFFMT09YaXRO?=
 =?utf-8?B?ODRLNUFBU1VhS0E4ZFhXRXR4NzI2QnZhUktSWnJFL3RyM0Q2RjRBbG9TWGlY?=
 =?utf-8?B?Tys5V1RzbWtnVjhXenIvV3lKc3VaUmQ1Y0pheDZVcTBNRVFDeUlTY2ZLaXFz?=
 =?utf-8?B?UXRMVVdMWkxaNndENVNobkZQRVcwdW56d3kyb2laMlZDUVlLR2Z2bFhtZkpa?=
 =?utf-8?B?Mjg4TDlkb2dYUkJQSkdWOXpWY3I0a0wrc2RWTit1aWRNU2FDQ1RLUDMzN2cw?=
 =?utf-8?B?eGhKaWt2THlIT1dVUFRwMVNNUkJoNi9UUDY4U2NPeXJsdlNxOWhvaEM4bG41?=
 =?utf-8?B?eHkyZHRGWlNUdzVpbkE0TDdTcjFTVjNQRzBqUjZ4WXc4WlFJS3VyMThtOXEz?=
 =?utf-8?B?b3d3SU15TnliSmh5RGZaaHZkZFVjR2Y4SDlXYWhlb0k5c01FYTVLZ2cxMUdi?=
 =?utf-8?B?RW5lWEw0MEtoSityTUVubjdKWWxFRHNxZUR2M2hOLzE0OEdoZTlicTBLWHpu?=
 =?utf-8?B?MGsycFRSYkdSN1Mrc2lYZzRpUFJhL0c3NHl0RjhJcHJGR3VQc202eTFwb0ZX?=
 =?utf-8?B?OHcrYUI2blhUMktaaWl1MDI4dTltM2pjRjFpU2grT1pLL3JGbG5USk10Zmgx?=
 =?utf-8?B?RFFnNG9XSDErbWQyVUhwVmN3VUg1azNRRDBTVUxuNWxJLzE0dVp1Ly9CWUdh?=
 =?utf-8?B?TkZCVjZSekFIUzU3ZWlhUVZIZU45cWtzZFkxQmQrOGV6eVF4bk5Cb1JpdTZk?=
 =?utf-8?B?K3BDTDU0bFhvT2Q1czJXNVo5ZkxidnRINWZZMWI5TTRBNW1HM2QwMVdNZU5q?=
 =?utf-8?B?dG5GTnZUM3paVFZaSjVYemRMTHlLOWQxczdpN3VqdVp2Ukt2ZnJBaGZnRXl6?=
 =?utf-8?B?bGtDYjB0ckFmT0F6WUJTa1N3S25BREhKRXlEajIxVU85YnovYTVDQm5sQzIz?=
 =?utf-8?B?eWg1VkRQRTdyVHZmVkZxMUZ3QVowQWhtaHZjS0xvb25uclVGbGZPYW1TaVNz?=
 =?utf-8?B?VEc1VncxUnlrOVI5SU1semU5VDJyd2NMQnBSOXdjdG9FZmNWQ21ZYjcrNFB5?=
 =?utf-8?B?dXUrMEJjem5hdDZNcThkQXR1SkY1cEowNjVsY084ZVN2RzVDQWtCS2ZuTmhD?=
 =?utf-8?B?RlVTRkczR2I0WUxJZkN1VUdHN2ZtZFFORmZMbFZrZ254YW9GOVlYNGh1Y0xH?=
 =?utf-8?B?UE5SdnBWMW1IM2E4UitadzZvbXJaRHZrSVhmWUE3YTlTZkQyei9nS2hiUW5B?=
 =?utf-8?B?SEFibXNpU2NOeGdERUlLRXJ1R0EzYjhrRXZMdzRqZnNjNS9LdnFucHJ3Ry9i?=
 =?utf-8?Q?o7GWCjclkn69XsxujW2xC1J/q5+1MdWuBrWK8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2529c70f-8221-45fd-affd-08d8da721232
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3359.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tAw4hB6QcprzLQyHf+8PvaosnBi53WYZrZO0OBKt4FYS2jY2mEBhmUb8tueVxl6l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6654
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
Reply-To: =?utf-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

While debugging cifs.ko customer issues we found that flock(2) seems to
be impossible to properly emulate using SMB.

On first sight it looks like they could be emulated with SMB locks but
the main difference is that FLOCKs are completely advisory, the application
is free to ignore them and sucessfully do read/write, whereas with SMB
locks WRITE/READ will fail on locked areas.

The flock syscall is avaible on most unixes so it would make sense to
support it I think. Maybe via a special flag for LOCK.

Given the number of options to control locking behaviour in Samba and
given how NFS doesn't support it properly either maybe there are
problems I'm not seeing.

Cheers,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, D=
E
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)



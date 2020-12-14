Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7282D97E8
	for <lists+samba-technical@lfdr.de>; Mon, 14 Dec 2020 13:17:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=N9KoRFIKaZjkeuHajQ45Krly+at3FQpppiR+GLYueUY=; b=ZaCBHzJv0BP2u2BL/bPl+RCa+8
	5hpBL2AnkIw9H9xjkNNdHyXrW0k4B0+uPmDWiaqp+PlzHLT/9C0HOLJtrZfJDr1Sh5FEnx6K86ljy
	Dwe0LcdLleejwduu9+TGhox1BT1tuVZqrP9m3RnxgLZK9KdDpKshcYfgUaOBdW/7Mq7K96bFFh45W
	ge/m6IyKfIMAkX5eJ5pwIEhf7IpGwwtvDvcXCwVqj/UhsbsmsRG27ikntOE9L3rXWUMYDp+wjRTAw
	HklgamOYHsqmW5Trr2CwJXYxbEs0vd/buPgQ5APgV7CCNU9avaRx8s7wayFgIDWZiCK4HdEiJqIwx
	Vqfu5CIg==;
Received: from ip6-localhost ([::1]:49524 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kommO-0012Zj-SX; Mon, 14 Dec 2020 12:16:40 +0000
Received: from de-smtp-delivery-102.mimecast.com ([62.140.7.102]:58838) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kommK-0012Zc-OO
 for samba-technical@lists.samba.org; Mon, 14 Dec 2020 12:16:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1607948192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N9KoRFIKaZjkeuHajQ45Krly+at3FQpppiR+GLYueUY=;
 b=nv4vWzdGEZJlt9qfmL9/4ofs5Z1aDrlP+bdbYcchFGPtxGWlcdDJS1RKdFJ9gyIrvDi39d
 UbA8O8tQDnEmMSzsiXwxp/hrekh7SWofMSSODGoRAj0iXuuktBTBRF7u+DsILWpgLAlkH2
 B6l+4bhNswAFhU5gGR7em+JY8oPx6Vo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1607948192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N9KoRFIKaZjkeuHajQ45Krly+at3FQpppiR+GLYueUY=;
 b=nv4vWzdGEZJlt9qfmL9/4ofs5Z1aDrlP+bdbYcchFGPtxGWlcdDJS1RKdFJ9gyIrvDi39d
 UbA8O8tQDnEmMSzsiXwxp/hrekh7SWofMSSODGoRAj0iXuuktBTBRF7u+DsILWpgLAlkH2
 B6l+4bhNswAFhU5gGR7em+JY8oPx6Vo=
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-4-UR7cRh5OMuq8RJam71b1Fg-1;
 Mon, 14 Dec 2020 13:16:31 +0100
X-MC-Unique: UR7cRh5OMuq8RJam71b1Fg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K6JFf1+d1E0XL90UgzaWKlGW/Os3Evu1G5DTQUkle7/FSgwYKIPEH5btm03Sl53W/WH1xGtP2rYQ8QxA7n0H3cT11MQHeSlwIxMpPBvWbCiwQ5APX54FONojqB9viltGYSwLtk54AJsIewpP04mxaPbZG0Nw3IVlI4/EjOUgnywvrnanx0FlXgg3VnOE65uJ0QQDrjII+OIPI54rPfyUdy0qX9folhRIGFeKufC9VfQxGOIaNQkwlzKxwTS/NP65j/SydzJ/2gqKJQzJ/ONoSljvXQq/FLQSokdtT5FPklDyj9GJEAXa2hH4OeVjD7qYzwba9JCrQMPxVGanOcGG8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N9KoRFIKaZjkeuHajQ45Krly+at3FQpppiR+GLYueUY=;
 b=RULZ9yaapjLdWcc7S6BZqvt4jbIBwr5c0UqvMLM/pktWX4dUJ5RTsHCbJis55pTq257OgcZpb+rPanJOgIkDqLiKsOkmZE7U+IDGXbqTaYHxMuwXALEsx48exnzi+ICeGFLbz9/riflo0YzA+7vNo+kmy0NLZPjaaMTgJ8QPVjT4BRtj9+V24wojrG9/keEZrDWiKBfPgiB2qyb9ZkaazPesj5eAUEEkiRywb/fRKiv/fze6Iw0h07PwC/ex0NkvxRHDCPpO7cmJl+wRkou5K0NfvPy+VmH5oLG8ATmeEQ7MTR//+WrpNnafPBoH3QCAMHUztfBouED/M5QsUVKREQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com (2603:10a6:803:3::28)
 by VI1PR04MB6909.eurprd04.prod.outlook.com (2603:10a6:803:13d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.17; Mon, 14 Dec
 2020 12:16:29 +0000
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::4dad:a2d3:5076:54f0]) by VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::4dad:a2d3:5076:54f0%5]) with mapi id 15.20.3654.024; Mon, 14 Dec 2020
 12:16:29 +0000
To: Dan Carpenter <dan.carpenter@oracle.com>, Steve French
 <sfrench@samba.org>, Shyam Prasad N <sprasad@microsoft.com>
Subject: Re: [PATCH] cifs: Fix uninitialized variable in set_chmod_dacl()
In-Reply-To: <X9dS1EllbQhuX7/C@mwanda>
References: <X9dS1EllbQhuX7/C@mwanda>
Date: Mon, 14 Dec 2020 13:16:26 +0100
Message-ID: <871rfsd1lx.fsf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2003:fa:705:9f63:f5bd:7a8d:a064:3118]
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2003:fa:705:9f63:f5bd:7a8d:a064:3118) by
 ZR0P278CA0004.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:16::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Mon, 14 Dec 2020 12:16:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 225b0d8e-d064-4aa4-4931-08d8a02a1600
X-MS-TrafficTypeDiagnostic: VI1PR04MB6909:
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 4w1wQBfv2iWLgW2zWSUP6a5WK9+w8BWyTiya5AV3w4J8d0wSq+mo0n/+1gYIc2hxtulN3NkaqB4FL2xifoPGRzZTsPbewwRvCbTvrmOrvVnidkRFvm3+lAVQB7B8p9MSjB/OeP1AoM/CkEEhexz8d1R1dogo/LGS9VJC3ujZwW3FmcAfsV3Te+ieK++xvZaPvTkjebsrVAM9fAWcgd0U3ijoxCQfRC/VBH1LDfqXQk4HP9aqZxy8lv2xi7D3K13AzVOrQ6tMWm1SCgZ2WG8XgRPLZE2q+YvoOhAUX0Yg4xdmPXd9dcsI5HP6iEkzyegHxpM5HQ3LGp0Mge7sdxVLhg==
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T3lYQzFSZW1iTWtVNEVvMEYvUmpUK0JDYnducklRTEJNNjhXMTRRVHlPOGdJ?=
 =?utf-8?B?cE9VM1JNN2dheDNLU2srV0htNlB4YlpsNGdhMkJPYXJDVGUvUDdRakhscVc4?=
 =?utf-8?B?WjBXRktZWm9pS2kyZFFxMGFBMVd1b0RkRWdmemk2Rzk4MmFma0NlelZldU9L?=
 =?utf-8?B?aFdWOURZRW9UbHd0TjhtYzNJMDdlV1dDc2psbWFFUHp6b09XNzVSWjEvN0hj?=
 =?utf-8?B?WTV3S3hHZ1JUUEdKY1dibHlzTTh3UWEvVWNVeGhTZVNLUzZEMytXV0pBSTdB?=
 =?utf-8?B?Yk02M0FLZExOam1SbThaS3hsZldueDFaZzgyQXRCZCs2Z1ZVN2EvdmtoOXZz?=
 =?utf-8?B?N3dWRGZsSDV6NFR2MzFuQXdvR1d0aDJyNCtWbzhCSEM2b3h1cTdQTVZTRnAz?=
 =?utf-8?B?SXRoU3Y5WVlxVnRsdkJJaUhHdldzM24xemNZbkpYeUczakY2YVV0UTVMMVNu?=
 =?utf-8?B?Ry9XcHhGcmpnTDVybzdTS1BBZXRXK0xFNDFVd1JaUWNNUXJET3YybHBGcSth?=
 =?utf-8?B?bTE2VTRCZCtVczJrWExzT3dCM0QydmpqcHg3Y0pHL0IzbW00R2xnVU9NNHJo?=
 =?utf-8?B?cUMrY3VNZmdjMWUyeXMzWmRBUXlzd2gycHo5S09SdU5Rbnl0SnBSS2c2SWtU?=
 =?utf-8?B?LzdRenJNcGtNQjFtY3IwMkJwVklMTEl2SXNIQ0xJanQxOWdaSjkycGNvQ1cx?=
 =?utf-8?B?OG43aWl6SFJxSDhiV01UdVBNK2htM3pib2pGNGhMTmtZdTFaclVuVllVZkNB?=
 =?utf-8?B?bm52ZElzaGgwYS9iOXVocC9jTkV1ZTlsUUNaV2toV0tDVzcyUytPSDVFSHB3?=
 =?utf-8?B?ekY5SUJ1Mmo0cW5WN2p0WTBpaUpwSUVQdjdFblE2Wm5WanVUaFpFcTJGUzIx?=
 =?utf-8?B?WGdlWnlpOTlqSlVNclBhaVJkSldyZnJkWFJsaUo3YXA4Qk5WNVo0b3ZyNHkr?=
 =?utf-8?B?bXV2RjMwZkdiRVZOV1pFRThtQ0s5MDRZZmFBVDVYR2dFelBjWGxGN2lQNWlZ?=
 =?utf-8?B?d0Nzd0VjZ3ZvQXFSckFwTWVwRDFjVWVRc3BJQ1lyV1g1aXhtM1c1OWttanhV?=
 =?utf-8?B?RUc2b01qcXMzdlhEY1BxcTF0dmVNT0d6SWwyRm5zWHo2Vk8vUDlOMlh1Rjln?=
 =?utf-8?B?VmpMYnpleGw5bkxrdm05UHlWYkVRM2x2bjZTZUJsZHZoZGdmNTFLUVFBa3lo?=
 =?utf-8?B?NU1sZk96M3NnV0JGZ0VaWlNQSVZHUTUyeUZQaEVoQkt2K09od0hvL1dzbWIw?=
 =?utf-8?B?NTJtOEx2b1N2eS8weThkYWpDYXo1Q3BNYlZWUVoybEZ0QS9xRDZoaGpIcTky?=
 =?utf-8?B?YlVkOUh2MjM3Q0lCQXRFbFJIM2lTRmE0WldidmZsMU80MERVK1lScmhxTnVm?=
 =?utf-8?Q?5yqq9tL4cIrcyZABKP6rUPSzRtIvybBw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3359.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-Network-Message-Id: 225b0d8e-d064-4aa4-4931-08d8a02a1600
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sGFDnRt2Z2D9NHoK6aBt5mBJOOpsL8Crs6hdPBytfUP3FpG5T+DuWRySUcKlqf07
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6909
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
Cc: linux-cifs@vger.kernel.org, kernel-janitors@vger.kernel.org,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Dan,

Dan Carpenter via samba-technical <samba-technical@lists.samba.org>
writes:
> Initialize the "nmode" variable earlier to prevent an uninitialized
> variable bug when we do "size +=3D setup_special_mode_ACE(pntace, nmode);=
"
>
> Fixes: 253374f7557e ("cifs: Fix unix perm bits to cifsacl conversion for =
"other" bits.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

The current version of Steve's for-next already sets nmode earlier in
commit 0f22053e811ca ("cifs: Fix unix perm bits to cifsacl conversion
for "other" bits."). I believe this patch can be ignored.

Cheers,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, D=
E
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)



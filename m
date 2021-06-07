Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F5E39D8DD
	for <lists+samba-technical@lfdr.de>; Mon,  7 Jun 2021 11:34:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=WtACEiOY8RgARZyx03otlzwOKuTShHgnkv50rCELX4o=; b=xAEWlvYc5m+aE4GeVlD+Qwcr6S
	DAudUpqITk7Q02oZEW+L+ryW5CkCuk7ph0ag9wTnqOjO8zhM5zhUJM26hyCV7RnTM1Ci4aVRvKIkP
	+1HdNzacUPNBSK2EhFRNq4XSyqx6i6sBWIW7ZA5hFUbN0pcA0EYm2XQqCC+0/UmkyIfr2mWwpXqqM
	SqewmEBuG0BqE2RANnYi3qchmy7WPqisIFX0U/Iursx4cqA8mDaCJoDeLscLDGKlcSWY3kSAf2JGT
	ScikRrXPeXNgUaZaQ0RalXKwF1lTi8+eYxTUocvK1zUHETJRsiqPm0VFj4+feHuFJQKWCBeelU3PB
	2MwszsFg==;
Received: from ip6-localhost ([::1]:22934 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lqBd4-004CID-2n; Mon, 07 Jun 2021 09:33:06 +0000
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:48201) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lqBcr-004CI4-5e
 for samba-technical@lists.samba.org; Mon, 07 Jun 2021 09:32:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1623058370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WtACEiOY8RgARZyx03otlzwOKuTShHgnkv50rCELX4o=;
 b=XAAk17ML96U4ndvLS0ImVhBZyLAB7mBrcxJaMXct5WTQUZVYcZBfvOxlFLo2zL+lnX6KKZ
 FOZPTtf+mAKLELDadML8iUls+/7vBnj+cJQL0OX6OWZcMXAsEcLWixQzc6xPESJrVCaEE3
 SJddLq1sNbahadaSKwD07LWAXHetzkQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1623058370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WtACEiOY8RgARZyx03otlzwOKuTShHgnkv50rCELX4o=;
 b=XAAk17ML96U4ndvLS0ImVhBZyLAB7mBrcxJaMXct5WTQUZVYcZBfvOxlFLo2zL+lnX6KKZ
 FOZPTtf+mAKLELDadML8iUls+/7vBnj+cJQL0OX6OWZcMXAsEcLWixQzc6xPESJrVCaEE3
 SJddLq1sNbahadaSKwD07LWAXHetzkQ=
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2053.outbound.protection.outlook.com [104.47.10.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-5-p_YTx2nTNRSkmiirSHNgxQ-1;
 Mon, 07 Jun 2021 11:32:48 +0200
X-MC-Unique: p_YTx2nTNRSkmiirSHNgxQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SAsTY5ybnbdo46ERG0lezhKP/DD14Ig1/nsgm1vdf8ltccHHZPYpZuByLtnA2X/1HLI8Yos9mm/plaWiQoSQxT/riXS1fk3tufJ6lt4ugSvWi9KOqeDuJF6wtpbdwhZEcWxMgtLylDiYXOwF3TeHJtwbLMc/BxzcJWExecwGrF7X+SJcmmp1fE9kXUOaHieWOvckiCIke1Ih9aZ3Y2kSRokBbF3xZnIdOTTSaElF+HE0HijN7N0aWBKEXHBjcnKgGQGFIWqy22HYLBz8Hf8WnI34KssezOVPGHOHgMJ7t2BfQpXohRWhSY1MGZaO6f77sfzKX2Nly0BcgJqVxZ0L6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtACEiOY8RgARZyx03otlzwOKuTShHgnkv50rCELX4o=;
 b=To9CDGlXvPWx/5tWmlHUM7/YKX7KXJ1rSqiOdkAb5HVvlkWG2dc3HsIIdlsBffxb0eHHBjUebjhYE1FE55MZjPNAxmwAcVYWGIJjlOReHRyi1yvEBVlvRrTnIva5PcrXpu1yCbJIMjClj5YycqJMGIVzLjZ4yh9TWowi03c1htgwOWJ29wQ5KY3de1bsBXKsleSb0h/EGOCpr2tr3+FqG/u0Xqg8xCguoICVNrcjKRbGVpsBUlZFq2i9Qkb4fXz1nE8wSl0Z2tVzAu0j7Gzrqj5ejMfDcsbtfjriqf21PXvsiKWRIyaUOSMtdmuoZcjK+K6WD4vysi8Fd1R9+kiP+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com (2603:10a6:803:3::28)
 by VI1PR04MB6191.eurprd04.prod.outlook.com (2603:10a6:803:f8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.27; Mon, 7 Jun
 2021 09:32:47 +0000
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::18e7:6a19:208d:179d]) by VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::18e7:6a19:208d:179d%6]) with mapi id 15.20.4173.037; Mon, 7 Jun 2021
 09:32:47 +0000
To: Thiago Rafael Becker <trbecker@gmail.com>, linux-cifs@vger.kernel.org
Subject: Re: [RFC PATCH] cifs: retry lookup and readdir when EAGAIN is
 returned.
In-Reply-To: <YLplrk3FQiUtVoWi@nyarly.rlyeh.local>
References: <YLplrk3FQiUtVoWi@nyarly.rlyeh.local>
Date: Mon, 07 Jun 2021 11:32:46 +0200
Message-ID: <87v96qrpdt.fsf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2003:fa:714:9957:af14:fb36:6198:c925]
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2003:fa:714:9957:af14:fb36:6198:c925) by
 ZR0P278CA0144.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:40::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.21 via Frontend Transport; Mon, 7 Jun 2021 09:32:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb94b3cd-ef56-4fc8-dcb6-08d929973603
X-MS-TrafficTypeDiagnostic: VI1PR04MB6191:
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: oveOgOMXC9alQNsaJ79h78loIh/bYJWiyJxHJDg3x72Un5OS+36dV1EigxcMP2WRiuIvwH91pynR3mHGpJ75nqq7Q4tByHlcjG0s1Wtw22OXq7UyNUVYwdQDFRupA3aerVHhGofqS+TCMfWquoy2YCtATeV+9Cbgp2JLnz4u+Du+WRpscT+kO3pO+z6TbuOrExhSePt4umIVlbY+sHfrNkp4JaTm9Nhk2pCDiRwiS/lPZyIT3lKxDpL/JW/vmcG/cmSDRGBlEJgqgN10NTZN/pJJVforbRVMqfOLSB/+z1gom1XP1pykXmbPJIJwEJCrqRWIkuV+5Uh+oCq4n+Dr3irr3kXd39cM9+ARaX6cUxgGZ3hSc05DcQNKGtE2ofgnz6RFzgd4UDRHT+s0oNGIVy5jcVJaj8hEBrNBMLrQ39V3GSL04Xr8dRPdws5RbzbmLFdWaWPniIXTHVrKuifO4jv7JSbn3d70sRBsxs6vfIc+Ace84mPaJbojJc4j2WIUWdmqlMHboq//p5RE6T+BRzFeFvpwr/MB7YoV+BKgZgxwhxSXa5Q86i4fjFN4A41K4/8kmsAyikqXZAwNaqgM5Q==
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZWNjeXFaZVp5UWNnMkZSOUE1SXJTd1l1VWhtODNDMSt2cHRock9CZElOSHAz?=
 =?utf-8?B?Mkc1dHFLODBibDNaWExQSGhFWlByNTJmcmc5MENqZWhSYVJHRkV4TisvMTJQ?=
 =?utf-8?B?T25WYzBZM0lOdzZKWTQxd1pzd3JHSWFEVlloYnhUdnNSeG1obkc2L2p1MjBo?=
 =?utf-8?B?YjJyWmV4cDJxYjkzY216WjBlc2Izc05seE9rTEhDSEFIdjVqWHQyQkdtUHIv?=
 =?utf-8?B?ODlKL0xkMU12OUFSdU11TW9uNncvdVZGSHRpVjBsZ0crdFA4MUhCQUg2TXE0?=
 =?utf-8?B?ejh6RHNlM2V5S3JIdTFJMEkwWHByOG1PMWlNbnNaenZtb0kzZERNSzRHWWFt?=
 =?utf-8?B?VGNHc3luVzNSQmVUcUx1cGE3WVZjbUllWVpjMjlIeTJlM1hvNkc0UXFyeWFC?=
 =?utf-8?B?VHhhNXM1UjRZemRzT3RGMzNNbzY0R21hb3NSRVBTcTRVcjllOE5FL3RhcGlq?=
 =?utf-8?B?VGo5MjRNZDRzT1ZrVVQySXpheDBvbStzcElMZGtpS1JxVkZSMk52NGdDMlRn?=
 =?utf-8?B?Y3ZSSU9sWDIwMHE2enhna0VFZEVkbGZjdS96Z28zOWVwQlEreDFYMm5UOTJO?=
 =?utf-8?B?eGc1ZUFPeXFidXI5cjljVm5YUlEzaTROZDlrbDhvSHRYNGhVY2xyTm9Kc2Iy?=
 =?utf-8?B?WE5wM01OalNyVEVzaDhNemhvV3VoSTRjS2l6N0RHaXNsSkdKVUJlSDFMaUc4?=
 =?utf-8?B?STdpRmNMZUcvSjlzNi9TZ0F0TkxKTkdHcEdqekRRUXYwMmk4RjIxZmNITjhq?=
 =?utf-8?B?Z2xWL2h3ZWdKK3NHTko4N3VZeHBNbG0vUmVHdXI4Rm1tcUlua2lKdSt3WnpN?=
 =?utf-8?B?TXI2ck95dTR4cFVGdDhhdVpJeFVFc1B5RkFJc0Zoa01wUGs0TjQzTWFLTklq?=
 =?utf-8?B?bFNMeDlpWmRsWjcvQ0NXQ0xwWnF5LzFVRHQ1alhDU3QxYXJNREh6c2JQY0k0?=
 =?utf-8?B?UGtBWU5KZDdvZVZqY0RTT2xwSXV5SGVja3lmbEhqaFBlS1daTFRpdHdPcitw?=
 =?utf-8?B?M1JSYVlVWTk1Qi9IbytpZEd1N0hwWjJMNEhhMHdQSGxKUHQzZU5XcVREK2pH?=
 =?utf-8?B?dk5TU1hrT0JuYkkxbGVIZy9WUlhnVDdWOUpLdW5uRjViaWdlbG9iNTJ0RkNr?=
 =?utf-8?B?MWJjOStEbG5lM1ZBb0ZiVDdJRXgwa25oanFmK29uOUpHeGR2VlVnN2lQQ0ln?=
 =?utf-8?B?TDlDNG83LzZBMmNCelhVdXhUclR1ZW04SkU5Mlg5MWlLSWZtbys4QUpRS29J?=
 =?utf-8?B?c0xPU1NtM3Q5K0tPbm9Sc2pJUUJzZGIxbmx0YkYzS2VmdlY5R0Q0RU9FK2FE?=
 =?utf-8?B?dzRrOXZVSG5MQVBuNzd2TzlPb25BbEtOZ0dKOEl6enErWG5xT2dMVlp3UU9i?=
 =?utf-8?B?SFZVelNqOStkQWV4R1RBNnR5N2JzLzZjUnpyRHc4S2MwSFY4cStrSFZwaEdY?=
 =?utf-8?B?SFM5R3pVWDU2R2RBcTdVdkE2aHU2ODk1TkxibjBScXBGbEZzaG55T0N2Yk9F?=
 =?utf-8?B?bnltREZRa3FOTXFJWnVpZ2FCUXNvaG4wbTFSSEFmcEhFQUp2emVtS2Z1c2dB?=
 =?utf-8?B?cjdqYmlld05WYU9ZY1NiaHJacDVSYkVWWFdOTml4YUR3RlhuU2FuK1JPRmJ6?=
 =?utf-8?B?aE93TVdRcUpkT3dmSXVBcnV5OFVTVzVZejBoSmdvOElFR2x0blh0ZU12V0V5?=
 =?utf-8?B?bmQzVlUzMEY1ZWtEdVV6YWpZTG5BRW83bFMxSko3OTN2ZUVCalVwSjVXZWdu?=
 =?utf-8?B?cXVNME1iSWlaSUZMeFdLazdsTTFYa29BZzZtYUxqYW1ZYVpFd3NBdXBycEt3?=
 =?utf-8?B?V1dCby9SWWprQUdzck9nVzMycjVpQ2YzRzlaTStIZXZhWFBKUjgrM3ZxMytB?=
 =?utf-8?Q?22eKFlf5xonZ1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb94b3cd-ef56-4fc8-dcb6-08d929973603
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3359.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OID2HrOH3TSGI+QlHcFdq8XMVF85vYaGqsEbUFEN5sGZforuTD4EFQLhc5Aw9G0p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6191
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
Cc: sfrench@samba.org, jshivers@redhat.com, tbecker@redhat.com,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thiago Rafael Becker <trbecker@gmail.com> writes:

> According to the investigation performed by Jacob Shivers at Red Hat,
> cifs_lookup and cifs_readdir leak EAGAIN when the user session is
> deleted on the server. Fix this issue by implementing a retry with
> limits, as is implemented in cifs_revalidate_dentry_attr.

If the user session is deleted trying again will always fail. Are you
sure this is the reason you get this issue?

Cheers,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, D=
E
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)



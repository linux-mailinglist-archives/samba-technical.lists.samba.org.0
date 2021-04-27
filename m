Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 401F236C1CA
	for <lists+samba-technical@lfdr.de>; Tue, 27 Apr 2021 11:34:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=M4UnmWeqs6LPHo5pugfPEktB2o2ztGSuOLXzS/loqWo=; b=HS0HbkQ7YJq/uSdOQWPde2Iqgs
	mJV8i6ELtIZza8sN51AOJdIU87BUiLDm/ntEjh+EuIK79vJajXclQrJds/ZQ+Y8idb3QYMhGXznWQ
	Kkf9lYnY3oPeFhXTq7bHHpDmzf0Bd1dXlk3OIaz6TKxlyTJRP0Sbpy855r187vqbN2iB4khfnni3Q
	kWHFiBZmCOF5fzb3qxAfsW6/TAue9GZglDBbSOE5ZeiyZFgeo/EWsl7LYtZnyI9ERxmq2XNxoN1rI
	s5R2J/Db+1PCFWoHX+xk+j+VwGxl0iJtoV0R6ZAvUKb70isb6kdoKEmAZc5dfAPsuXczBntxHbY+u
	5707cC8Q==;
Received: from ip6-localhost ([::1]:37954 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lbK5Q-00Caop-Pm; Tue, 27 Apr 2021 09:32:56 +0000
Received: from de-smtp-delivery-102.mimecast.com ([62.140.7.102]:21636) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lbK5F-00Caoi-Ev
 for samba-technical@lists.samba.org; Tue, 27 Apr 2021 09:32:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1619515950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M4UnmWeqs6LPHo5pugfPEktB2o2ztGSuOLXzS/loqWo=;
 b=PMz/rO+ulTahGSNpVj55z8GzCJwPWOXPROVwPVJrLuprdjqpc5D+wDW4sHXiIOeY3aBmnL
 5L+fLxF/9R/TgnvsbqZNtb6vCnnxTso7LFNIDJUd3S9TkgROQrCqXmkyQ3yN+j4K9UHaUk
 fLRH1DBNUcTNg6gXz+y3U57giijZVig=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1619515950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M4UnmWeqs6LPHo5pugfPEktB2o2ztGSuOLXzS/loqWo=;
 b=PMz/rO+ulTahGSNpVj55z8GzCJwPWOXPROVwPVJrLuprdjqpc5D+wDW4sHXiIOeY3aBmnL
 5L+fLxF/9R/TgnvsbqZNtb6vCnnxTso7LFNIDJUd3S9TkgROQrCqXmkyQ3yN+j4K9UHaUk
 fLRH1DBNUcTNg6gXz+y3U57giijZVig=
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2053.outbound.protection.outlook.com [104.47.8.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-NuqGPDf6MMiNcGa3Qk4v9Q-1; Tue, 27 Apr 2021 11:32:28 +0200
X-MC-Unique: NuqGPDf6MMiNcGa3Qk4v9Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QyQP1VABB60ke0+RRPRkh2yRQY/posbEOJlJfG6U7SVQpf2Gbv7pz+B4GSpnH7Xi2z4jlDmOBb3JzIiKVE1YKQRN1xgN8dpM9dj4PA/jJO1yEjCVCylY/v3pdF2RGkCfJB3FZtw1FkoLSwRXWnNnF2AGvpy2I5HUwPupbACPL/bp7TehtYNFp7J1bH5ZbU+q063osaG+kir8nHVFS8EHdAyayZf+Lwnik/FESnC8qWlc+KMzkIo9E362Mg4djuooW3CkS3mxo/2m3l3N50CPSxi7ZJhuRdAujO65Xe1BYl5TrrfEoHhn2HYHyc8vYT5uQ5dSF71q+89UHVUdleL3TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M4UnmWeqs6LPHo5pugfPEktB2o2ztGSuOLXzS/loqWo=;
 b=j/8MzH1bHLKnSAVTuh2spblB/BGDJ79IM8EBrNjFE3R45IQ/Tp4cAUop70gGMHY6yVfoCfeifdBn7m2JqtwaGf+LcCbFR0lXFjFKwFqoceakkcU2TvAhruc+xsCMoei6Raa8Bzh5geI5KYetcQ5TYRmC13F6PE6/R80hhkjVTebbPDvpfFVuI7CN+57g24u6XddaKWTm+vh7U2C3Cxee1IW5pMPrCGtX8app6dVkXmaohZQNueSK8PEyYkXqXMPFsd1BpxFjbnXPzNl2oIvJgMygJRCi1V7IB/LwuDlLGowlseYB93FRUgjAW2VnwWISFZ9uG9JRmDN1lCN+gdWhlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com (2603:10a6:803:3::28)
 by VI1PR04MB6927.eurprd04.prod.outlook.com (2603:10a6:803:139::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.24; Tue, 27 Apr
 2021 09:32:28 +0000
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::3c87:7c9e:2597:4d94]) by VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::3c87:7c9e:2597:4d94%5]) with mapi id 15.20.4065.025; Tue, 27 Apr 2021
 09:32:27 +0000
To: Dmitry Martyanov <dmitry.martyanov008@gmail.com>,
 samba-technical@lists.samba.org
Subject: Re: SMB Multichannel for linux clients
In-Reply-To: <CAG9bPH2WFAD8UWkF0YzjgjO3xhbQH57MWFxmSwkLxQ+kSM0vpA@mail.gmail.com>
References: <CAG9bPH2WFAD8UWkF0YzjgjO3xhbQH57MWFxmSwkLxQ+kSM0vpA@mail.gmail.com>
Date: Tue, 27 Apr 2021 11:32:25 +0200
Message-ID: <87r1iwvzrq.fsf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2003:fa:705:3855:41c0:bae2:e87d:86bf]
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2003:fa:705:3855:41c0:bae2:e87d:86bf) by
 ZR0P278CA0133.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:40::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.25 via Frontend Transport; Tue, 27 Apr 2021 09:32:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6995172-2d12-467d-630f-08d9095f5f70
X-MS-TrafficTypeDiagnostic: VI1PR04MB6927:
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: QI6BgODZxYZfUhc/4/m8lr3lknhvhqXZajvqUz28EGrrJPuraKFwy8zsKII0am5VJnk8QbQBbR6MLPLJ3XcF9eH1kIMnWJnLwnFLXbLAgY9vTZAZuuK/iVh/KtYjXQ/yg2iJLxaoy9I/FvBqVt2qUQjyJMwPPCzaGLAzE8BOzj+wVlhfMjR+vxOW5tjhedLP6b9IWezUzoo96bmIXiT+7iTcCQqkKK2AFxh8cgXl5K0OeZsGTYWpUBnFxJUlP9fhPwh4hFJkViD+J6Lr1wGfv5MDKLmRHuycmeO3FZlUiYQhsELM5YaljVujf2A0GpNJlMm/ARmqI359C7Fbwcw28ivQ0zeICkXA/uh/UU4HQeY9s6+70bB8Ha3SDYsdxFhDILM+5LYN/FJn3JuqXqqOupna+VC0ZmPQvewvkJna2sPkHlyVY7UdtqBpd53dH59ZH8UP5LvbG8EJP8Z3ZfCRWVjPveGEb1Ce/T41UnzF0uXBMH10iNb7HwiX1aZ+hn3bwvr4EYEcBVHeAuxuZMq5Uk+B3MuAY6mS3903rJp7CsEJNNfLb3T/kn+XXppLzLkKLD7R3r8RkgGacrxcrfGT5w==
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Ui9HZERCc0lYTitCd1Z4Ym03em5iV2dLN3hWYkNKTTV5UWF2QURoNjhkRmZX?=
 =?utf-8?B?OEgxbUIxRnZxY3VmQTg5bzlIWjJGSlJVNi95bmNWUm5FQWVXTXVqSFJieXZB?=
 =?utf-8?B?bVY5b3ZKNENzSExMVzU5MGlUSUd6aHBhRjhDZnhsRnlUUWV3R1d3dDA2VkhZ?=
 =?utf-8?B?aEFyZWtDd1RTdzZEckdaMGF5MFFnK0xOTW9XZnI5cHh6WVNqdlMxN2xneHFQ?=
 =?utf-8?B?RWI1ckw2T2Njd0hEK05XRVloN3ZWbTNBUUJzSTNUVFFqNnlkenZIMUZCcVNj?=
 =?utf-8?B?M0s0bkdHOW1RL0FjVDR1OUVVNzZWUVhYcWcvK3gyWGNpZmJvc0I5eFNyZ0Q1?=
 =?utf-8?B?VGJUZTF6SHZVNDJuSVlLbGFHOFhpemoxTG9TaVhqUGF0N1MrUWc5L1hzV3Rj?=
 =?utf-8?B?c2lCM0gxMERJajlEdHV5RlRhVGE2M1lWNEVFaXoxUnZEYmM5K2dla0IzUk43?=
 =?utf-8?B?eko2dHgwejlmUGloTzlvREozRmpQRWtTcmlvY0M2NVZ3b010UzZ4cDBkajJw?=
 =?utf-8?B?N0lvc095OStjTlhyWkVQV1k2ZUVoY0lGN2trN1h3azhVUDZvc3FTR3JTVkVZ?=
 =?utf-8?B?emovY1VlSlJKTC9oTERsUTQrMkZQYzBobVRGWk1TWEtOZ09oQnRQWGhOcXdG?=
 =?utf-8?B?ZlVOQzZneWNIdEEvbXB2ZVRtK210U0lkR1o2YTJSbjFXcWo3bUp6eVhxU3I0?=
 =?utf-8?B?YnFpb1lzRWxnTS92TmE5c3crVzVHOWVrUWFjdm5Gb0NtOVo5Q0VKTTJuaXRa?=
 =?utf-8?B?N3N5TDk1L3pIZTRoeE0yMUlmOWlzcWxGb0plcC84Z0RoZUlERGZhTU9BSjZT?=
 =?utf-8?B?V0txWkh6Vi9LK1c3aG40UytSZlV5Q2g4bWwrS2haWUZ4ZXV4NjdYaVBua2lT?=
 =?utf-8?B?QzJQS2tFV2FyYnlhLzd3YU0yamdPMi81dkdTa2lzVXRwaEgrKzBpaHVjdm5D?=
 =?utf-8?B?S2tqUXFQL2dQbXBKNEpZL0tFcHVYZTFuY0NNSjRvMytGR2pYK0ZaOGs5RFNS?=
 =?utf-8?B?bk84MGZOamZ1K2ZqWXFiS2RoYzlVWU5xazJGNytaTlhUcGlDOFl2T21iTTNH?=
 =?utf-8?B?cWVPakRLQ2ErN3pZc3VRWjRXR0tiV0M1VlZHSGcranlmYjRNSTFYZE8yV3Fr?=
 =?utf-8?B?bS9mbVJ4d1ZIemx5eXAvYU9nSFpQdGc0Zmk0ZjVHL3FUZllKdDRnaUZGZ21v?=
 =?utf-8?B?WS9iajZVaXFnL0pzT3lYUUtwSXJCZ3l0QnFTOFJmdDM0cWJKekNOUUtieGhE?=
 =?utf-8?B?T1RPb1FPOFYrOWdkK2U4aTZDbXMxd3VqNUdzZk1nakoxQXliV004MzZKK0xi?=
 =?utf-8?B?eFVZc0l3RFJMWm9SSHB5cDhteEtpVGxBcTNWMVNWVEw3RzBMM1p1c3VTakFk?=
 =?utf-8?B?UVEzTnAwREZGWStNdXhVOFdLaDB4TUVibCtyeDNiNnlPNTFqcDNRcTdIZ0Rz?=
 =?utf-8?B?QldQNFNzVHVKQUtBMFZQYkVTNU5ZbTg3MTVHcjRWN2FaQTB4QStGY2I4b2Ft?=
 =?utf-8?B?SkRIYlYzc1N5U0NCcit0UnNnWWZDOGlld1o3M0d3U1luZ0Q0elpPOEg5UFBE?=
 =?utf-8?B?U241TmFLK0ZHd2dsUkdTVE1mMVFQcmJiK0svRFFFbWVhYS94OVFMeWJRU21s?=
 =?utf-8?B?QTVQd24rOFczZVZTSmJpOFY2KytLMjNNRVp6TWM1Mi81MW91Y0ZhdlRQNEli?=
 =?utf-8?B?M1Qwa1FzMUhkWStKdVNtZkhWRVBoMGJaWWpuQ1cwN2Q0TDRjMVgyWXNxbnQy?=
 =?utf-8?B?TDA1RzJHT3FTUVNROGpVbzkrRnlpV01valVTQUQ3bTd0WTR1MHRUWnRGdHNq?=
 =?utf-8?B?TDN2MjY1SFRvL0V1UEdnYVF1dkRWbkVaM1ZvYUhSVzNlZnR6UnIrWTdzVDEz?=
 =?utf-8?Q?e4rE7bw/R4hCp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6995172-2d12-467d-630f-08d9095f5f70
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3359.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n4IuPwOxcGuPHW6/SIchvsuqi8QCrJrnTOitfKwNHNANh3v02A9KHZoEkk7xCMvu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6927
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

Dmitry Martyanov via samba-technical <samba-technical@lists.samba.org>
writes:
> But for linux clients smb multichannel doesn't work at all, the traffic
> goes through only one NIC...

If you are talking about the kernel client (share mounted with cifs.ko):
for now you need to explicitely mount the share with -o
multichannel,max_channels=3DN where N will be the number of channels you
want to use. It is getting more stable but still somewhat experimental
so you need a very recent kernel to test this. The main remaining issue
is properly handling reconnection in cases of network problems.

Cheers,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, D=
E
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)



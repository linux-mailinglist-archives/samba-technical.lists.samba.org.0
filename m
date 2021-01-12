Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B9A2F2FC1
	for <lists+samba-technical@lfdr.de>; Tue, 12 Jan 2021 14:04:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=fK5r7uxJp7khU8wYpOUbsek3+XXxkbrtxPAHFXoYrKc=; b=es0gHYm4Xrq2IltuSiH8Fobz0O
	cxzfpfdU1mCTXhf+IbbkenVYJ3U25WfLFUip+7pqI3JoI4u5LsnQn8IY1JntvBsj971s66mpzuvqt
	QmrdBLp0MSqywRSyH+mE9Ki+YDrPI4rLiK+VabVyZTHQXNIF2MjT/zciFpM1Yx0s6yrKNoeCPNuZy
	RLL3Hk5Nphdy+51aGyDSX2tnJXlGknMT51cEofiwu14GNmDKc1rZMiH3W2cKD+G1IOLbWu54Wr1hr
	Y6SQ+jkIzVSQKY++B+8DjOs+9VTazla5kLZ4gNPRQ2jiTeXNB4Brvu8RdZPCQOtILqz9AFOAVSnTX
	MnjRcOGQ==;
Received: from ip6-localhost ([::1]:21610 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kzJKP-005Pbg-6W; Tue, 12 Jan 2021 13:03:17 +0000
Received: from de-smtp-delivery-102.mimecast.com ([62.140.7.102]:40309) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kzJKB-005PbV-Rj
 for samba-technical@lists.samba.org; Tue, 12 Jan 2021 13:03:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1610456562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fK5r7uxJp7khU8wYpOUbsek3+XXxkbrtxPAHFXoYrKc=;
 b=gXZARi3ihos9Cg2bs41ZRz2Frg3KUXeTpRSWH4kJDtUFIHtq+KVjOMeEFlUxT+xRcHaeC3
 VrqCrPgd50W6GhihVe0SDCaTEuxVFgqxNQfpPN64wleAuKyOBlxwvuZJKlHuBMCwSabzSK
 lq01OEkbt7SE9j0L1nSzL1wJRFcn26k=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1610456562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fK5r7uxJp7khU8wYpOUbsek3+XXxkbrtxPAHFXoYrKc=;
 b=gXZARi3ihos9Cg2bs41ZRz2Frg3KUXeTpRSWH4kJDtUFIHtq+KVjOMeEFlUxT+xRcHaeC3
 VrqCrPgd50W6GhihVe0SDCaTEuxVFgqxNQfpPN64wleAuKyOBlxwvuZJKlHuBMCwSabzSK
 lq01OEkbt7SE9j0L1nSzL1wJRFcn26k=
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-8Nhw74rSPHCL8NQxWhSP5w-1; Tue, 12 Jan 2021 14:02:41 +0100
X-MC-Unique: 8Nhw74rSPHCL8NQxWhSP5w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HzYBLBH9MDtX/aMkAPjNJJ4iAY0Rtaz4lxTQrG8a2Jimj9SLrgg0rZPYrfa3/5Nn2KICVc8PBHHZTps6JqW4wgFJnNThaPbFkuoV1fuWgmxommTgym8rU5rX4cB+2HPRr+g1aPi1mNNt8gDGKUivjlwXmZ0fTsK7spkwG4jGJszXMgAYDKR34jZlRqd2CWgqNGdObYcvr2pCmrYJSSpp71l2SSCZrsQd3rzbxqJoYemqRQTXxzWK6J5uIqKmOqw0Kg+NzvKFDmHyR2NiP75qayrViZg3wY632Q41+1TB4auWkEr/iQxA/3LOURAPUcuwXQMKjtec22SbzYgMV9rOwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fK5r7uxJp7khU8wYpOUbsek3+XXxkbrtxPAHFXoYrKc=;
 b=mN3zaZQUFnqHspL+Sh2l53ZA8WhHDa9hQAP8G6jQEuLUxxBKM6AlZStWdsAsZ8CGSWk/s6OygTU4NmO9nDJalU62BNvhfv5DZmkHrqowGScBx0lCSw0k6nHwmTxUpo3LdGFIXMui6OhQmrHIGfvZaBQ5KjSV4s38qmly10smh8UFMbVhGdoH7v/oOYAJPE/Ta54OtUZaOkl7AjKJQJyJuXJsy/NTvB/CLStiJyCYcJDGEPyRAtenDLztATwrUwbB/fe0tqLCGs8LiOr5lQqxFOKTQZinrquPJVog/bZrh1w+dTtx7SYTYGSQNH3EFCBcIJsd8SxK5bjsPljgIZ24ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com (2603:10a6:803:3::28)
 by VI1PR04MB3278.eurprd04.prod.outlook.com (2603:10a6:802:4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.12; Tue, 12 Jan
 2021 13:02:39 +0000
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::9c1d:89de:a08e:ccc9]) by VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::9c1d:89de:a08e:ccc9%3]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 13:02:39 +0000
To: menglong8.dong@gmail.com, sfrench@samba.org
Subject: Re: [PATCH] fs: cifs: remove unneeded variable in smb3_fs_context_dup
In-Reply-To: <20210112091340.7500-1-dong.menglong@zte.com.cn>
References: <20210112091340.7500-1-dong.menglong@zte.com.cn>
Date: Tue, 12 Jan 2021 14:02:37 +0100
Message-ID: <87im82l34i.fsf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2003:fa:705:9f85:a5b8:801b:5f46:ca87]
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2003:fa:705:9f85:a5b8:801b:5f46:ca87) by
 GVAP278CA0009.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:20::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9 via Frontend Transport; Tue, 12 Jan 2021 13:02:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2ef6382-5570-46c5-2519-08d8b6fa5742
X-MS-TrafficTypeDiagnostic: VI1PR04MB3278:
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: //FoZCXlHXIAsxC/cX2sOYKFmDSnFQbkLZ2QiS6+Lwt7A4Ire37D0oTSBAB5cGgi6qLVsXj7yaRXg/FpYp1lATtDhls2IIkQ3rOLnyhGSvi3o3Ek1RYvFeUhCOh3y3EpEmE93joHgh89I7vjxwMGDQOnR1YsHuPSx9+BXxsWe3Z7aw36D/vwrNVR2ZV/WEfBZbA1f0yp83uC6JlPp3QQjwVUKW/FMU+DwxNKW3zWT7SfUeUGyW3cx11ScvNO0+ytfBQW/UOTrcJT51c3f33QxHbm+7oOASo2I+pEQcDGt3tjXkFFMk4OoTOu7C7sz1x3Km70Z4yNqEclpj4u5pfxhB8M69wGm/itBmn6vwQK/XVltZioQF/cVYOz3TvuqPZTbRdZFtiogCzWW2PEX6/TiQ==
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?V00vRXdlOGhXR0xZUjBjOGlDS3AzTFRINERLZnprSUVHL2dZR2ltay9VMFZw?=
 =?utf-8?B?SEIrU2cxWnYxMTkranZBd0ZQcXBIeUREbzYrUllPRnFYOTRPM09EaC9DWFFv?=
 =?utf-8?B?ZEluU2VXcGlFakNCSkRUWW4xSzFvZFZoL29DY3Vsa2lxdFRLUXY2SFZSQnUr?=
 =?utf-8?B?a2VWd2htakRMUCtPZCtxb09pcjVjMjdNMVdFVVRXK0V6VVdxM000ZFBrcHZX?=
 =?utf-8?B?YmhJTFdkWDU0NDAyOVZ4WHB6OVZRVmQ4ZHd5QVNlWjdwanF4RTRSOUViZ2JH?=
 =?utf-8?B?TUNHa015QVNoOVErTmwrSEJPLzVhWm9uL08weVN0M3hnWGYwNC92c0hKaEdS?=
 =?utf-8?B?U2M4bTdqVmlUeW1OSEViaGZ1b3hyWEcxNUkvRlNvT0tjSmZITnpJdmdibVN4?=
 =?utf-8?B?TmlmbVNTUTlvTm9wMkpISDd1SFN4WG1tSUhBWGxQT0VpUW8wMVlhRTJ6VFRr?=
 =?utf-8?B?eWt0Um9GYmphZndYZWhlNzhRaDJ3YlZwRUZ1OU5qeDE2QmxWdXdZRzNHZ1cv?=
 =?utf-8?B?bXo4VEZuT1lrSUJmTVdoOFF4WUt3ejF0cmEydHNsMXVQV1RoelQ5dWozREhU?=
 =?utf-8?B?bUlmQjh5dmEybG8vRUs4NndEWnlpaDF6NStzYTN0R3Q0Z2FpQURpTVdGdU1l?=
 =?utf-8?B?UFkzdTZ2cWRVbzRwdkk2T05mYU42dXAwNUFEbWM2cjBTcjVEZTdYRVV0Q216?=
 =?utf-8?B?Qk1zVURDY2J6VUpWU3BOM3BjZHB4MUF6MXZXQ292amhUTU53U3pUeEVOOVcy?=
 =?utf-8?B?U0dObFllTnBNa2VMUlBnMTdFZ0d2Ujdwd01IcU05RWltNmNZS3dLQVI5d2c0?=
 =?utf-8?B?MFp6VUUrNWhzVjFxL0pFT2hlMVpTQTZVS1ZLUmNXdXRiMlZDSkdvMy9SYTVh?=
 =?utf-8?B?Wm1XaWRaMGxDWGQ1STJmTVk2TEEweGdEcWpmbXUrVTBUMDJpQnRhYmhLMGxO?=
 =?utf-8?B?N3o3Y2hPR2tZbXNPYy96ampCYjVJVnNpQ0VBV0dpbGJPQ0FPMFpoNC9ZOE1S?=
 =?utf-8?B?WEp2T25kcFMxY20zUGsrTDF6cDFoSFpWWGZXMkYwcmlTUDZzRWV6STdHM2Vs?=
 =?utf-8?B?Z3EvTk9lMEJXeHRhRjZIZFhtQTJDLzR6WHMrTGIvMndhUCtRendNS1ExRTlY?=
 =?utf-8?B?M1J0TTZ3Tk9Nd0xHSXJvTGFpeHRvbFk1SnR6Vm50STV0VHdML1hZWHl6RWJx?=
 =?utf-8?B?TlVRVURSdXRwSVFqc2lRbEZ4dFM2M05Rblk5TXUyUWpPRllXU2pmK1ZrMUdF?=
 =?utf-8?B?NTJjNHRvL2g3WjJNSGI5NzVjWGZVaWliaE1ONkg4emRaU0J6WDlCVldoeGRj?=
 =?utf-8?B?ZE91NThkcXphMDg0WWl5RFNOcEdVd1EvaEpHUVJhZHJGSVA3djRQRkpHWTRs?=
 =?utf-8?Q?KlltFTZjOqGV336q+HgwA9UcDmNFAtOs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3359.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ef6382-5570-46c5-2519-08d8b6fa5742
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rMk5M5+CKCldEGeGhDnsddcBDnHMYbgMCzFGnuBbQgUKU3MltHcVBCT/8Xh/KSUu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3278
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
Cc: Menglong Dong <dong.menglong@zte.com.cn>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


Reviewed-by: Aurelien Aptel <aaptel@suse.com>

Thanks,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, D=
E
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)



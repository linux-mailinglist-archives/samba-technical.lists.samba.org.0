Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DC89B30A60A
	for <lists+samba-technical@lfdr.de>; Mon,  1 Feb 2021 12:00:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=hJUOe6c0ycRAwODfzuoeGt3q8aeZ4vFGoKtV8gWXnKI=; b=jcuqvTWns4bi5DgMpgiEddvoGH
	AyZKIZWrO3eXZuwVBdfZtE6DrbLrQMcW2UBTs0Tz3D3ZJzM8r8MxhfuQocCey3BbsvpThzlmYv6KK
	zw++qNGEtN3gioL4MrSFTwSUTYmaCgEP4BC1V/kDw9HHtKoIMshJ+BUeTPFHYmobQCt/Y8vUZe7wz
	PF2b3HcxxZ+tVbS4iGK32OLCQixhQGiBEfq+RQ5tURe9DhAgxgKsnLjsHOuXPCNFf/f7ovbINaq+0
	/n7yN6oW/+j3aR0XAXs13ve6eS3yz56wC6NuCfJLVO3j+XxMi5jXfDYdcNG8Q1hh4fRq281L4JOBm
	Md3QR/KA==;
Received: from ip6-localhost ([::1]:23220 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l6WvQ-009xpQ-FC; Mon, 01 Feb 2021 10:59:20 +0000
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:38854) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1l6WvK-009xoz-ST
 for samba-technical@lists.samba.org; Mon, 01 Feb 2021 10:59:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1612177152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hJUOe6c0ycRAwODfzuoeGt3q8aeZ4vFGoKtV8gWXnKI=;
 b=REolG853lCCX9mkPeZQGHvH8e9ZgkdcRWi4/DZbbQtqu/9VAc+EHdTjcx+pqvX2sLOFVKS
 8adjmKiHEr1JBlAZeM/rjIs/zbmP9Hkh/1mAHpbhG52ApB1QzMkYpwru8XutJmf6cFk8sN
 Unp8fK+TgSgg8qbPSW3xx0Gc2JmlBOs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1612177152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hJUOe6c0ycRAwODfzuoeGt3q8aeZ4vFGoKtV8gWXnKI=;
 b=REolG853lCCX9mkPeZQGHvH8e9ZgkdcRWi4/DZbbQtqu/9VAc+EHdTjcx+pqvX2sLOFVKS
 8adjmKiHEr1JBlAZeM/rjIs/zbmP9Hkh/1mAHpbhG52ApB1QzMkYpwru8XutJmf6cFk8sN
 Unp8fK+TgSgg8qbPSW3xx0Gc2JmlBOs=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-irgrg7yiMfi7YbmPECSgsA-1; Mon, 01 Feb 2021 11:43:04 +0100
X-MC-Unique: irgrg7yiMfi7YbmPECSgsA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aT3DZB98a/LHMQSbBt5o+62FO6gwnkA7QqenV1G9QCKeYNCUtIchHsY/xjj24gSvfQlWL2VtUeHeep3GzfRAiE1kaBY4MV6TBJWo4UCA9cE3ZdOIi0SmAodu+8XAUljcuXeA8ECqaIgy67gMdVXU/889i2vx5dCBherYAGjDTnTfFrYfNOMIPpEgli7nUlbDrXwQScTBCgCUnvVLazK0vPtys5ZZZEwat0hFtBRT/VWS+spoDna1wWH2agWzrjPbpMuPF0GVJI/ivE+D8UhFnSXGl2oQ4n6705lRS9PTShCEGkTJoHnuBeLd0vajDl8lLa84ljxqdZdTS6zqYjY7/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJUOe6c0ycRAwODfzuoeGt3q8aeZ4vFGoKtV8gWXnKI=;
 b=AnNVdGxBMJA9CVpZ+3PWY3Mj42pwLCC4Rq6DonJBZQNIot6OtZZzOKJN5TRSwvrKwu7l3tzxJcJAfIrAPbmz62pkp3u7c8rl9qlDxhrBwdDUuvd+A+67ySr4Vv5hRH9C8L3GqDBTxuI74zT0oAVlk+pUXjGqelO7hoounCzBZ1gMKtLehDGJJrjwGtgTj7Qll3cspqqgke33r1N3jscdv4kV5dOnHGpsj9oY9djWU2Yme/d+UIdaZ2F1mJF7ppUUGq21HFrEqyjfhLHtm2EbcuP+CvIR9Cekdrc2gEIesyCyE4DwaBwu7DSA8x/PsE7NqOlfw8QhRMJPVQbzxaMBjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com (2603:10a6:803:3::28)
 by VI1PR0402MB3360.eurprd04.prod.outlook.com (2603:10a6:803:2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.26; Mon, 1 Feb
 2021 10:43:02 +0000
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::9c1d:89de:a08e:ccc9]) by VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::9c1d:89de:a08e:ccc9%4]) with mapi id 15.20.3805.022; Mon, 1 Feb 2021
 10:43:02 +0000
To: Shyam Prasad N <nspmangalore@gmail.com>, CIFS
 <linux-cifs@vger.kernel.org>, Steve French <smfrench@gmail.com>, Pavel
 Shilovsky <piastryyy@gmail.com>, ronnie sahlberg
 <ronniesahlberg@gmail.com>, sribhat.msa@outlook.com, samba-technical
 <samba-technical@lists.samba.org>
Subject: Re: [PATCH] cifs: Changes made to crediting code to make debugging
 easier.
In-Reply-To: <CANT5p=p60ahfnrxU=sazMszPaxWWp4YLKiDWkZs0mf8iie-TbQ@mail.gmail.com>
References: <CANT5p=p60ahfnrxU=sazMszPaxWWp4YLKiDWkZs0mf8iie-TbQ@mail.gmail.com>
Date: Mon, 01 Feb 2021 11:43:00 +0100
Message-ID: <874kiw9ih7.fsf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2003:fa:705:9f12:fb7a:e8aa:e796:34d1]
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2003:fa:705:9f12:fb7a:e8aa:e796:34d1) by
 GV0P278CA0068.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:2a::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.17 via Frontend Transport; Mon, 1 Feb 2021 10:43:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5d5df85-d4b7-4fb3-99b2-08d8c69e2632
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3360:
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: YMXF+WnWpH+7XiTBxxatf9V48qL+x9QxFst6SCts6NOAsP0K7zAZtk9X/CvwiBZ+KvybXgmXPqnA7/Ua7HRSQr4vTsY0MCtum9AHH7VoKcCfbAP6Rw02qLfLZ52cgfV2AHFtALYBR7VwCETcHDENs6WIYzoUcGWoFdpx6UBfPcA86DVQPWR3X18Rrsm9CHy+FKWidExpx3LdbVJsRTK03jM6sHJlmNYxIWpP+DevRoSZ8xg2gTk3pJ1Bf1OUvsZHgudQCvrgasZFEm8lPQ/mAI+bGpdxfb2iZPftD2t8xpknQIG70oLm2jiI4XEZZqkEXZeb4/a3fGgMEFFtl+I3oqq19pjnpcPPJ3H8mg1oJHQyd0tSVyN4EMLYVDD4aoopWUC4zDaa8LxHAXDMX8ZZIc1SSkmyaUVdUVf6Qp/c7WhmuAKcG4/3oxd3e9FyZ+9P7/twrNh9oWgD5BIgipbNFhlovadQBWt380JnTpkUhD3ZOputBYZ0q0SlBfo2sIjwCwYfHRcZyNTpTMbtyAnAcA==
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K2ptSk83UDBteDBTQUw5ZVBYZnREckJlVElyRzdaUUw3RXdJT0thS0lBeWZE?=
 =?utf-8?B?RzNwUGsyWi9KcXV4REdybS9JWTdwWGV5Z0pSengrY3owVWpOSXhKdHRzUXZJ?=
 =?utf-8?B?OXpybkRiSCtxRHFzeExxaUlxWm5nRml4U1pVY1NvZGFDeFBqMXVxOGw3bFdJ?=
 =?utf-8?B?YU84U0hsOWltblFhd3pob2V0NDF2QWxoeDVtWlUyU0JFcjY4ZUhmY0sySmtS?=
 =?utf-8?B?d21SeFRRVkZRZFZFZ25NMi9Dazg1UjhsZTQ0RjVPYXZFb3lDYkFFT1psemZB?=
 =?utf-8?B?ZFRFaW0rV0NCUHU3YnlPcHVjOFRzY2JhcEIxT3Nna0toWjRGc0F2NlQwdXZC?=
 =?utf-8?B?dDJiaDlidHlvMlB6TG1LbjRmTEFpbi8yMDFwc1dscWdZUGRzdlNHdHhxZm84?=
 =?utf-8?B?MW83eWhOdWIzQ1hFRTB1VWo1bEUrQUFiYTNLUklFYTlWRjl4dWFPRitVcm9S?=
 =?utf-8?B?T3kwbkdJUkZraEdMV1pJS2E4OXpiNHlxUFU3VkkrU3NSWjkxbk5JbFVKaXNl?=
 =?utf-8?B?SVQxNyszWXVOMXNkdmxCN0hqckd3U010aVFWamVOMmNhdFNCN2FncDN3Z0NP?=
 =?utf-8?B?YTZXUW1aV1BwcmtVT1hVdkNTU1daOTY2YkJiREE4eXBIRHR2ekdNNWFTZVI2?=
 =?utf-8?B?OUNJUTdaZm5KZHVCUzAvU1pCVUdtSlBQTTV3SDd4UjBSYlU5NGZOdmpKcWNS?=
 =?utf-8?B?bG1SUlRoMit1c2UwU3ZUNGJoZFZON2l0UXV5UGtUMFBiQk9qaXp4YzloaHFC?=
 =?utf-8?B?MzhNRGlQOTFhbjlsQkxDWVM4bE9HbWYxNHlHa0dOQnowSnJrbGE4VzhmL0hU?=
 =?utf-8?B?MHFNVEJtb3dzNmNLV2VYUFEvRXNENU16aXkzU295MmFFbmFubHB2ekNWUjh1?=
 =?utf-8?B?MXluTXdqQWRCMDhqNlNJWEt0OWVlaEtTU0lUWFBMeWZIM21uREdkVTdJK2Rw?=
 =?utf-8?B?dERveU1yWU1ybG16cEkwMC8wNGxNblJpWGhWODdSVThXblRRUDBDSGRHRnpI?=
 =?utf-8?B?YTZXa0orSTFFUmN3V2J2WUJnd3lxWmlVUmRyQStYRlpZNStuRzFqeWNXdWdQ?=
 =?utf-8?B?NnNUMkRabmkxc1djbDAzR2ZXNW9ib3NjV0pZRkd3OElXY0VZOGlScGhaQnk5?=
 =?utf-8?B?c1JlTVJzT3lVWXJJKzQ0SGxEWXN1NjhhT25XVFVqZ1BxZ3F0YjNJOTNnekJ1?=
 =?utf-8?B?azZtNnAwR2JiK0dHWmJEa0VXNGZZRzN3Vk52UXB3Q2NUKy94LzJTL29mUnFy?=
 =?utf-8?B?V0dEME1wbEJaOWt3SWlEaUJiTHlWR3VPQVRaMmZuVG4reWZtNHFjN05jWXZW?=
 =?utf-8?B?TEJ5dHZ3cGpoQThEZS82SnpNaXp2KzVhNWhlbEdHSWh2SENERFRRaUJwKzZT?=
 =?utf-8?B?dXJ2ZTlCNERGdXRIQytmM1cxQXFWWEF2aC9sOGk1dnYrVStRMUg2cXA0Y1Rq?=
 =?utf-8?B?NU9qb2VXN25WcWhNSWsrZ29BOUFsdmoza1A5QzBremVhbnE1MnpvQzJZdHpt?=
 =?utf-8?Q?t74yyH45Pl4ciA0s+wGlMH4i4w4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5d5df85-d4b7-4fb3-99b2-08d8c69e2632
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3359.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: agbppwxLh7Lxwiojbgdw2DbNkdwr/n30wa/74xp/LGkGUdqnh2JLLD8vS79vkY14
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3360
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

Shyam Prasad N <nspmangalore@gmail.com> writes:
> Specifically, I keen on your views on the following:
> @@ -1159,7 +1181,9 @@ compound_send_recv(const unsigned int xid,
> struct cifs_ses *ses,
>         /*
>          * Compounding is never used during session establish.
>          */
> -       if ((ses->status =3D=3D CifsNew) || (optype & CIFS_NEG_OP))
> +       if ((ses->status =3D=3D CifsNew) ||
> +                       (optype & CIFS_NEG_OP) ||
> +                       (optype & CIFS_SESS_OP))
>                 smb311_update_preauth_hash(ses, rqst[0].rq_iov,
>                                            rqst[0].rq_nvec);
>
> @@ -1224,7 +1248,9 @@ compound_send_recv(const unsigned int xid,
> struct cifs_ses *ses,
>         /*
>          * Compounding is never used during session establish.
>          */
> -       if ((ses->status =3D=3D CifsNew) || (optype & CIFS_NEG_OP)) {
> +       if ((ses->status =3D=3D CifsNew) ||
> +                       (optype & CIFS_NEG_OP) ||
> +                       (optype & CIFS_SESS_OP)) {
>                 struct kvec iov =3D {
>                         .iov_base =3D resp_iov[0].iov_base,
>                         .iov_len =3D resp_iov[0].iov_len

preauth should be updated for both negprot and sess_setup (except last
response from server) so that looks correct. But ses->status will be
CifsNew until its fully established (covering the SESS scenario) so this
shouldn't change anything. You can test this code path by mounting with
vers=3D3.1.1 with and without multichannel.

Also there are no 80 columns limit anymore, I think it's more readable
as 1 line.

Cheers,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, D=
E
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)



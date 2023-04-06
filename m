Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA1A6D9A6B
	for <lists+samba-technical@lfdr.de>; Thu,  6 Apr 2023 16:32:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=5MsSVPsfquSRDuqpzGN16XaYA6X4FvDZ+n7NuCigD0M=; b=s9ESZNKmrpme9Qhpu+RsORaDu3
	8esL70ra8HCsSTwQA8D5Z6yuV2X0RSL1TcMCIMCOZNcQJakoVuAdLVJIKGh48EPoBT/B3/zaWHY0m
	Hupr9ghygiqSz8XX3tiYRenWuEJ6jbl0StvUVBLVsYSFLKvcfknuXisaDVU4pIFp9rmgkXxqRXugi
	UPOuWVyIG4kCUd8IwpdI8v9ItpMAxIAhGHQ0ojQ0NRboj1/no9vD51klMnhoDzvz/rqhosFfhz/Aw
	joSZ4GsQdUc3Wd7whDgRQxVxolqTy1JrHf2HGgh45SfxdYwAy4vaT8OHlAWBB0DKZhomj1D7smMO7
	mAq94cmw==;
Received: from ip6-localhost ([::1]:22396 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pkQeG-009gAC-Kt; Thu, 06 Apr 2023 14:31:36 +0000
Received: from mail-dm6nam10on2084.outbound.protection.outlook.com
 ([40.107.93.84]:52897 helo=NAM10-DM6-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1pkQeB-009g9y-02
 for samba-technical@lists.samba.org; Thu, 06 Apr 2023 14:31:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DglbiRyh4uQi0lOWKuJth0XuAv4OB1kisazMtMgRvYomfEcIgGQhAJHg1YGLnIgJj2AxX0UKJlu+hZp5PcY0wfUHVsHkbRKqCn6pP6uyrPfcGV07Vr/5EzcEavVOOi0LVJ4s1kJVvfGI39SqlP51vz8tnCUk5rn6S1PgQiYvl9OrZmtrZu7OaZhZUzD8p7S2qqO5cB5uwe6yMfGv70lz4enrXPALOmehkQfloUmgthStUWUcBf7bBUJEPporam3N9xrUiG+tys/MPF7tH1sgyqyd/3do8/qXJYe+TuBDpnKTgtmoGyEjyXaDCbfgNlcPkZWa6B48SpepzMOvxakxbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5MsSVPsfquSRDuqpzGN16XaYA6X4FvDZ+n7NuCigD0M=;
 b=jhExWjuGuduzkS7zdsofrNKqF3p7D6xs6DF+7rMks8BbDPNzAHCUgrHTekk+FTH2NleQV9zK2jHf0yfCqhHBK52e2AyCOdqxlEf7XZ54uF95XjfXUqkNojM4/buiFe5wRg3zsjfdRH8aQYsCyjG8gtvwfs/wpZo3beRjoh4j+hmXO1p8WnqMR6R6nznTXiPvIQK54tw1BiFZnCsf6c4mTyqPNud1wZBO/deOswiXMLp+tgfHHis+HjRTzXzuJx0fHspEBQ+t5LUqCRERrRw4xHtyJUi4idpiPD0KX46cSKhi1H+FkedPZ5ucsrgfdS18B7RXZKrOUWKpWLiT6JAKIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=talpey.com; dmarc=pass action=none header.from=talpey.com;
 dkim=pass header.d=talpey.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=talpey.com;
Received: from SN6PR01MB4445.prod.exchangelabs.com (2603:10b6:805:e2::33) by
 DM5PR0101MB3020.prod.exchangelabs.com (2603:10b6:4:30::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6277.21; Thu, 6 Apr 2023 14:31:11 +0000
Received: from SN6PR01MB4445.prod.exchangelabs.com
 ([fe80::342f:eeac:983e:3e2f]) by SN6PR01MB4445.prod.exchangelabs.com
 ([fe80::342f:eeac:983e:3e2f%5]) with mapi id 15.20.6277.028; Thu, 6 Apr 2023
 14:31:10 +0000
Message-ID: <7c7f01ba-66d0-c33b-21a5-800666bd97a1@talpey.com>
Date: Thu, 6 Apr 2023 10:31:09 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] cifs: reinstate original behavior again for
 forceuid/forcegid
Content-Language: en-US
To: Takayuki Nagata <tnagata@redhat.com>, sfrench@samba.org
References: <6cf163fe-a974-68ab-0edc-11ebc54314ef@redhat.com>
In-Reply-To: <6cf163fe-a974-68ab-0edc-11ebc54314ef@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR01MB4445:EE_|DM5PR0101MB3020:EE_
X-MS-Office365-Filtering-Correlation-Id: ef1ddc6b-3bfc-4137-a368-08db36ab9133
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: c9Jwcrxbw0FZpoh+yGKQ0FscSu+AaKHtpM3NAgBFOXNk/AUjALy7zKSR/Zcu9X0vVSVjP2ocQ5ppEKBMs5wkV/bKc7D+pLjX6iOvRDQEk2vnxu1LLBfqcVO8bayvD1wlsffigiMpPx7AnVvQeC4Ix/19y/jBmUhuVr2gDpXylDmljMuGLo1rp3b1/+P/ferEZvRh92QW8NUV/rfL0XNvYSNlIYP7EOytBRM47CK9cBWAndD+r8UkbNjHPYg/GlequHBEKxjWnoWCJg96pSdhdOdWjr4hd6qyuapU52RhaUsQlUZw8Kdt8FgoG2zRkn6hay0IRlK40Ua5dK/3k1D5uK5N3hMRTPh75iwdiz6Wvvtvx+oHT9c6l+d1JQxspaGRlqaEGtEv84pzCEr6RBXjzxnlP15i6cPws2E38DmNjCDLkW6OIjYXFnADYc/UxcsayxOTtJngBwQTmBWXW4JPCNK7ATVEBQGZirzvjh524E9LcMhxq+zr1OcX946DKcMAnt4x78bkMEt0CbhXbmhoYDH35NVEB+La5Ps8OKZXjIUaHcNIZEQzLMLzNmLAj4Ty+zbEER4bolF8K3K9D8OT/W26LrjeoxzFDpXQrX14OWV0GuGfap8+9AcSl7EZDqI6ZYy3bSfPWKpwH38JAaFD2Q==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGhkQWRwUGxDSTgxZ2pKSlJwU1Nmek9KeTg5V2k2cDlHL1Z0YXRWMEVOV3Mv?=
 =?utf-8?B?K0NRV3h3RTJ6eGRjMjlDaHNWVHFxdFJaMVltWkZjSTJMcTZiRmNLQXlGMXdN?=
 =?utf-8?B?V2o1UHVtK1BQMXBVeGZvZ3dRckswTkFxc20zQi9MTzFEZEpaMG5GVlNsU1cx?=
 =?utf-8?B?em5CUHNKdzNuRTNHck0wM3FzclR3cHNoL3hDR25wNmV3eEVqaitnd0VvNHpu?=
 =?utf-8?B?NityOTFHd2E1ZFhKbWNtUGJlMEhBUEJIeTZ0L05xcmtQZk5xOXpMRzRIUTBZ?=
 =?utf-8?B?clhSREs1WW1ZYjBkbUJxSHNLTndIWmpjSEQ0dnhCME9Hc0tCL1ZMK1dYOHNl?=
 =?utf-8?B?NmdyOGxVTnd5SE12M09FdGlpWGNmWk5wRjJickpqSXBtS0p0bS83WERjOXdr?=
 =?utf-8?B?T0xsemM1THR1bGFobllFTGhmK3Rlc1VuWWlxY256bWlhSU9uTDdwVWdzQ2hn?=
 =?utf-8?B?RlJjMitsUThrQzRNRmpWU3Jac3poN2EzOXMwZXdHTnFsUjBzS3I5L242eFBI?=
 =?utf-8?B?WGhkNFVuQ1UyT2R4bkUvbkF1OTcyL3VXR1pNZnNraS9pVUEzLzN3TjZYK0lU?=
 =?utf-8?B?ejM5SVdYMG5YMHNIQkF3bTRTRS9MaWNKTXZrQzI5Q1VNZ2RVQXNLNndEdWJO?=
 =?utf-8?B?amNEU0dPWE1mZlc3VWM0L0tZUXp5Z0dxbk1wTnlNYjZQNUhSRiszUW9pUFI1?=
 =?utf-8?B?d09CODRxQlZPSE9CZlZFTm0zOEt3b3RaK3VPSDNpNFF1RU9UaEpUQTNaakQ1?=
 =?utf-8?B?enRiL1NaZk1DUGVPZHlkZVN6em00a0s5YnFjdWd2QlUzYUFWWktDOFh5LzNX?=
 =?utf-8?B?RExyQXNkY3gzMnF2VWZSbDM5MnRSYTdXV3BsRGI3T3NMMVpJU1FGdnBlemNS?=
 =?utf-8?B?TkxVMkpWWlAxWFNUTTVsbGlkWDBLM015bTIrODlERXIrY280djVxclZrY0FZ?=
 =?utf-8?B?MFRmYVY1Q3dZWElVUjRPSXFoMUVnbXgvdFk0bnZZdUtTVk9GaWkxT1ppZHh6?=
 =?utf-8?B?QTZseTdYRW5iaE4xcXVtQjllN0l3SVJwSjlSa2JEV2U4aHcrMEQ2V09ZdTNP?=
 =?utf-8?B?SnRRYmJDUzNLQ0dCV2I2d0JFdmpUc2ViZlJJN0c2c0c0eGV1T2pqT2VwU1ly?=
 =?utf-8?B?WWduaWdCL0YrUlRJYzlER3orUFRyRGZGS09ER2RGbUcvc3BMT1lLNWlxZnlu?=
 =?utf-8?B?REp4WmJyWU9Hd0RkZlJiZG5waHhKaDgwTWRkYWtsRklTQWwxdHJDdHVZaXg5?=
 =?utf-8?B?cVQ1Q01FdVJsNXZsT1l4djNiV2RLdmlvNkR6dmM0eFN4SWRVMWtoYjl6NHN0?=
 =?utf-8?B?MnFsWW0wc0tPN2lQWlVlem1EcGNKSUxUK0J1d1c1UHRicFhhQ2tONFJzVlFB?=
 =?utf-8?B?dE5Uc21SSk80biswdzdSWHFOUnh5RTVVSVpJZE1ieVVoclN3d1kwZjcycXVM?=
 =?utf-8?B?RnJCQi9RUmptWlMzQ2xNTkZCc1BMK0s1aDBsZDQvVEdDbzdCZktrSzZVWGRW?=
 =?utf-8?B?UTFjY2xDMWZ4K2t1TlFjcVNLZFhveXM1enZlQXpNNkhhSng0WjJSdmNVczRw?=
 =?utf-8?B?TFBkaTlKSFZOc0JQKzZ6eEFZZXhFazZ3L2pUb1IzeG9MU2NYZUdLbzJiNUpi?=
 =?utf-8?B?RTVONTlGWGgreU9mZjVjVXhRbVJ5bjlhdndDN1BqeWVPVmViTklWVm9YcDdP?=
 =?utf-8?B?YlExeFh4MzVVUDVCaUJzbUE2dDYyYkhDWEFoZ3NvRjE5cCtpQ0ZxM2h6cDh6?=
 =?utf-8?B?ektSdFdJQWVmY0txei9kejl1dHVRcENVMmEwMHdBWng0U2ZseUV1VDUxVFAv?=
 =?utf-8?B?eVEvNDR5amZRM3d5QWVkaTQyVGVtVmhDZ3l1SndUZndrU0owZnFRQ01CL29G?=
 =?utf-8?B?RzN5Q1I4S0VDa2dKQkxScnc3czdaUXVxcStHVytJM0JYWFVBZDFoRkdJdDI3?=
 =?utf-8?B?TllXUDhVaXBTZ1FvN3RIWEFYcC9UWUZaLzVyWTZQR3JPVGpMbmFzQmlpRFh3?=
 =?utf-8?B?Wm9rbENZRzMzeXNJRGFVRWNjSytkZDdFS0s3Wkl2MmlYUHowVllkaFRkcmta?=
 =?utf-8?B?Y0EwejNaYkFiWEZzLy9lOEkzUkdTSmlqWUh6MVpzMVFQRStkaElUTmhweHZR?=
 =?utf-8?Q?FDERptyj4/ZADhWLSt/4dzpD7?=
X-OriginatorOrg: talpey.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef1ddc6b-3bfc-4137-a368-08db36ab9133
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4445.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2b2dcae7-2555-4add-bc80-48756da031d5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E2BShFujIFaF9tWqvx+D3JDN9ALJ1dHMZscwT1q4hre8HnhWZoC9ynO8nHzJEEgQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0101MB3020
X-Warn: EHLO/HELO not verified: Remote host 40.107.93.84
 (mail-dm6nam10on2084.outbound.protection.outlook.com) incorrectly presented
 itself as NAM10-DM6-obe.outbound.protection.outlook.com
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
From: Tom Talpey via samba-technical <samba-technical@lists.samba.org>
Reply-To: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org, sprasad@microsoft.com, pc@cjr.nz,
 samba-technical@lists.samba.org, lsahlber@redhat.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 4/6/2023 8:02 AM, Takayuki Nagata wrote:
> forceuid/forcegid should be enabled by default when uid=/gid= options are
> specified, but commit 24e0a1eff9e2 ("cifs: switch to new mount api")
> changed the behavior. This patch reinstates original behavior to overriding
> uid/gid with specified uid/gid.
> 
> Fixes: 24e0a1eff9e2 ("cifs: switch to new mount api")

This looks correct, but I'd love to hear Ronnie's call. Looking at
that commit, was it simply an oversight to set override_{uid,gid}?
It kind of looks that way, but...

Tom.

> Signed-off-by: Takayuki Nagata <tnagata@redhat.com>
> ---
>   fs/cifs/fs_context.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/fs/cifs/fs_context.c b/fs/cifs/fs_context.c
> index ace11a1a7c8a..6f7c5ca3764f 100644
> --- a/fs/cifs/fs_context.c
> +++ b/fs/cifs/fs_context.c
> @@ -972,6 +972,7 @@ static int smb3_fs_context_parse_param(struct fs_context *fc,
>   			goto cifs_parse_mount_err;
>   		ctx->linux_uid = uid;
>   		ctx->uid_specified = true;
> +		ctx->override_uid = 1;
>   		break;
>   	case Opt_cruid:
>   		uid = make_kuid(current_user_ns(), result.uint_32);
> @@ -1000,6 +1001,7 @@ static int smb3_fs_context_parse_param(struct fs_context *fc,
>   			goto cifs_parse_mount_err;
>   		ctx->linux_gid = gid;
>   		ctx->gid_specified = true;
> +		ctx->override_gid = 1;
>   		break;
>   	case Opt_port:
>   		ctx->port = result.uint_32;


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B774AA838BA
	for <lists+samba-technical@lfdr.de>; Thu, 10 Apr 2025 07:55:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=aK6OdU94XpRVRl/ICmnCUeJTopLalPgZLehncx/OLoU=; b=MAHDCK1kxxCtYHrpjqXousRqlM
	qEDFHrAIZZJhKXvRdZqBkFRIxK1CBjdG32fWJp/MlsbmKKqlnzWqt5hgkuisLZ8tzLEACQ9Y43I3P
	G+Z/s0/0bmq0q/EDZGhk02i54xMpPeGLDvezEncToctS9m1a9gWpXOHz13tIeXY6j0Pk6sgbpPNBX
	72YE4uGAowUmiZEiTjjqXrXAT2igZcmz9bqUFMgP9l1rl30XdsAs/gkWf17ByeRsOsAL4oAUvTvoH
	76Pgzl2RWOD8NRJD6mIBTK0pRK/0eCu06ZmotUOM708lxUVeZkgGRKk0g3HX9CE0FiO3F0IpgQvU/
	vpUjxTZg==;
Received: from ip6-localhost ([::1]:63082 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1u2ksU-00264Z-KF; Thu, 10 Apr 2025 05:55:06 +0000
Received: from mail-eastusazlp170100001.outbound.protection.outlook.com
 ([2a01:111:f403:c101::1]:30663
 helo=BL2PR02CU003.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1u2ksO-00264O-QJ
 for samba-technical@lists.samba.org; Thu, 10 Apr 2025 05:55:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jMUyKowcaZK5IRxPJhzJeRZTym5XxzvP2bn4J42BT1zchZVBQwlJdA6Xw/YAwA8nuvq1M4JqfGxPShZPsHSXBGDqNQNEKOcJONW5zxYpqrn6yi8XC2P70dFyOpQsbj+JW55GxMOyEBdRa5bY+27SNKxwM8vycbnYF4Ulnt39+crM+WrHINWKeQBPQkkO7nOtM9d7R6ghagPnslSNtDkzxb8wpkPM+6KkzRz+9DrzNrQ9tB04wyHg3JoESZ3IPb/E8CmIwjk1mrBxm9C6xjQNBeFDycBRMy0+EIgoFE5XAyukJ63Q5iMC6Cx7FdtWaEiOkd0hmiUz2v39c0jXbC+dHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aK6OdU94XpRVRl/ICmnCUeJTopLalPgZLehncx/OLoU=;
 b=cF9ANHAPrR0giTLY9tDu40XD7fgtDW/tms7t3Bh1Y8TOiDQvFbtvgYMcXOr1CiiYj8RxhUokcBEAAhgZal5NhteWUFp/5SAYvXb4el7TT1mKIGMe5qxnMFHI4abf/jl5qHT0WtT1qq+i2eaomwTjxCz+jYO+T/WfWOwyUrKidtH+kg3EWlbx9GmoCjbEgwIluay/HmEvlQsnxX+CGqT2O69vV0PB8RmgmKWQZdY1PfdNrAPDuvdJwsvd+26b/I2WLX5FU+A8Xp5G1Mgzvit3mcbZg+NRP4EcIawwi9q5nm8EckA21ZS35tuJnDirbYI6DcMUd6CX1ivdO7L0deDaqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=talpey.com; dmarc=pass action=none header.from=talpey.com;
 dkim=pass header.d=talpey.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=talpey.com;
Received: from SN6PR01MB3854.prod.exchangelabs.com (2603:10b6:805:19::20) by
 DS4PR01MB9249.prod.exchangelabs.com (2603:10b6:8:281::15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.34; Thu, 10 Apr 2025 05:54:21 +0000
Received: from SN6PR01MB3854.prod.exchangelabs.com
 ([fe80::66af:6788:adc5:f856]) by SN6PR01MB3854.prod.exchangelabs.com
 ([fe80::66af:6788:adc5:f856%6]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 05:54:21 +0000
Message-ID: <1c653a48-f59f-4dd9-a8c1-2881c6240047@talpey.com>
Date: Thu, 10 Apr 2025 07:54:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Handling deleted files which are still open on the Linux client
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Steve French <smfrench@gmail.com>
References: <CAH2r5muEV7=ygqdCe+mrDgXXXtoEEF69HxgeWkD05Z1KY1jJ-A@mail.gmail.com>
 <20250409135128.mzwcyakxg22fk2xw@pali>
Content-Language: en-US
In-Reply-To: <20250409135128.mzwcyakxg22fk2xw@pali>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR01MB3854:EE_|DS4PR01MB9249:EE_
X-MS-Office365-Filtering-Correlation-Id: e32f54c1-13c2-44dc-a6a8-08dd77f42392
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TzhqdENiMzlJaXJBTisvYWJGaFZqTU5HVjdMK01mMFpOaFJTeTA1eW5Ebkto?=
 =?utf-8?B?VWNqcWlQUFhDa3JiQ0hLbTNCaVZ3b1RMUFYrZzBHUm5VeDY1MUl0VnF4S2Jy?=
 =?utf-8?B?VUY4K1M5MDI2ajJnaEJGbjhla0tOYS9QYWlvMjg3ZEsyMGdFMGZwaEd2N3VM?=
 =?utf-8?B?UEhURlBZUHRhaGJDRHVTK0lEWmZrSU1DdXN4VGo3d21oSXl4aVBjQ0hJTFlN?=
 =?utf-8?B?RGZjSTEyWWVSYVBVNG1WZGs1LzZJWGFTZmFHcms0YzlhckRTVDMyZWZ1S3hz?=
 =?utf-8?B?bFZvMHFGZ1FRNHhKNU8wdTRXUGZTeENxaFREbFhjUm4yeFU0QXZaQktidTZi?=
 =?utf-8?B?YklRb1JHYW1vZnVLSVM1TFN0d1ljQ21UNG53V2ZwdEd0Sm1iNUpuVHZNRDlI?=
 =?utf-8?B?amFvS1Q0UnI2QlhEQ0hVRVU2ZzdXb2Y4TjN0RnJmdzFrUDBFNnFXaTV0MkMw?=
 =?utf-8?B?VVJFbnBCcm5nWWQxVGdodWhWUlZSK09YUFZ1UldKbURnMTRMSVJPUjA2VWVY?=
 =?utf-8?B?UTVvSGZERTRCSG5QOGI2WFZOc0tKMlVjN2JKRUhTYVV3b0J4L2s4eU5IK2Fy?=
 =?utf-8?B?UFllT0ZiV0JGbkNBZmY4NEJrdUR5VENvUzgyYVZia0Q2Wi9wbXhaWmdzdkpO?=
 =?utf-8?B?SHFveEI5VGN5SDk4NVA0Zm94alVYN29aZEd5alQyQ3Zxb29iQVAwdEU3QWxP?=
 =?utf-8?B?VkswNmVlQ01OWHZyZXFJdkU5bXYxNENxdG0xdnBuNUJRSzYzVEYybDUybzVS?=
 =?utf-8?B?b3gvNStaTDhGa2c5b0NKUTFCNWV3UU15Y1lwcXJhUnFQK3FlVHJaZFRZQXkv?=
 =?utf-8?B?akFoN0hTelNZaWx1M09ERXcwTlAzMEh3SlZlN0o3Vyt4QW5WK3hzZGFBVmZU?=
 =?utf-8?B?c3k5aTJWc0pYR1RKN3MzQlVFZDNLcTFjb2JPaXFEeTM3aHUrM2JKS0tGcTUy?=
 =?utf-8?B?aktFcENSTDhHQzlxMThLS2IrdFBMUEVZVzRiTVp4THQ2YXhTS002eTFlc2tt?=
 =?utf-8?B?M3VpbXNpWFFUcytoejdrMEZvKzI0VnplV0Zxby9oeVRLdnlhZDIwWXl3Qkgv?=
 =?utf-8?B?Zmt4Y0xOV0dMMEZBVzA5eTQ3WDBsYlovbWsyNVZhWVBacnZwUENWaHUwdHd4?=
 =?utf-8?B?UEt2MGx0MFIzMXZpalJKMGd5bmswT29DaVVpRGYzWUx5REJ0cHJ5MUlMc1lF?=
 =?utf-8?B?NzErQWNRRXJieEJpUDNWTm4rMHpZbFpWRmFjMjR5TW5jYmVNN09MWVlxSmor?=
 =?utf-8?B?SE1rRk5mZ2pDU2x3MkdLN044TGRNTStYbFZ6OVJmbmZKQktVZnJrQnBVTjI0?=
 =?utf-8?B?R0JnYTg4SHRYazl0R3ZpRjhzUFcrZTZQK3VhK0YxVm5nN3ozZnB5UGNkYWQ0?=
 =?utf-8?B?a0xCcjI0dTJ1NGE5bkZQUER2WktLK2p5aGo4eHhCZE1BRlcwcldaY053QVRU?=
 =?utf-8?B?eHo3ZWhCVm5RMUFpOXkvbnpRTTNtTlB0RURaYlNaMHVLeHppWnpxS01vVHh5?=
 =?utf-8?B?Q1VyR3AxaFo5V1ZiZWFRdS95UyszWS9YQmtZa3llckhob080TDVYUUxKMlNY?=
 =?utf-8?B?OVQ2Q3Y5U3RJR0RlS0tpM1Iyc1Frc3VNSjRsTTZ0S3N1S3ZuMlR5RXd2OVZE?=
 =?utf-8?B?Rk96VG1DalZFbkQveTJhcEZHQ0RPR1BKMWpFUWtxemVRODRYY243R2VQRGxy?=
 =?utf-8?B?dnJ3akpNcHVURjVJWkh2L0dZY1JKLzEwcGtmaEoyTEE3cHZ6cWp0Nk40Mmkr?=
 =?utf-8?B?S1gxcTd3T0JtTHd1R25CdXJLM2FvVDBQVmdjdVh3K2RWbmVVVFliR3psS3Ez?=
 =?utf-8?B?Ky9pQTZSRUlFODZLajdtSnlIcnVMcGlJb2J3bE90OEFMYlNyWExpMGF2dGRi?=
 =?utf-8?B?ZDliRVVnNkUwWmZIRThjODFZVHp0QXVNQnZDb3dXeHVGNDVZbm5NeUN2d0o0?=
 =?utf-8?Q?7AXVQtzNoAA=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sng3ZzFUNnFwQmxZeS90RmpQdVlVR0htcnVkQjk3OElWcndPMGppTGZIdDVQ?=
 =?utf-8?B?b290ZzRhYndUKzNEb0RXK1UxcVN3V0hiSHl4SDVNc2dIZzZJTnEvMWVxYmpI?=
 =?utf-8?B?NGZYWVFPd3JxZzhQQ3BieXVhVkRxOVEvWlVvRWNCb1FMMWl2QUUzYlY0WHpu?=
 =?utf-8?B?K3JtTWd2Zi8zZjJrRjJKNW56MkI0MlVFd082WlRUb1JwejlsT3dCeFNlN0VQ?=
 =?utf-8?B?YktBWTVNSHYrRkpmOFc4SHFQYmY0Z2JBSnB6SFR5QXdmSThZeG1rMWtHbWFS?=
 =?utf-8?B?TmRYUlpJeDh2MGxFVUZ2M2xFUUVrQmRQeHlEZzBtVzErcXVWK2pOU1dPNWov?=
 =?utf-8?B?WUtIN0U2UDJRQ2NxNzNRamdkYXB6QzNEWHdUdm4zRENkSEl4eTVSQWxmSWRO?=
 =?utf-8?B?U2lRSktuYlhxbjZlTG40ZTdadHBKSk50eG12WnEzWXNoaFVCM0ZZNjVGRWJ1?=
 =?utf-8?B?WkRwNVZGc2E1bkR1VjlVYTVyV0NSL0VadHhVRVpPNnJvYkk0cnhBSjI5V2Uv?=
 =?utf-8?B?ZXBKVFhOL3ZjVEd6NHV5RkdTWlF0NUNkVEpMYXJlVThROWVIUTYvZ00zWnpN?=
 =?utf-8?B?b3o3dFVBeDNUSHg2OVFEUm1QMXMzb0YwMjlVeGI1V2Y1ZENuWGl4K2J3c2do?=
 =?utf-8?B?emoxVUh0U1V1bWJpMy9Mck1jTXZ1ZUxBM25aN1BQOTdOZ2hCUFEwa1lzd3J1?=
 =?utf-8?B?dXlKYTZPNmhySVZlMWRna3AxV0VmRjBGTzBiQmVLRHhOa3Q4M3R0MDBpL3pq?=
 =?utf-8?B?QlNJZzVlQXFobE1LYzB4ZEJKUmhKdGoySzh4bzdYb2lPelFyQ21iOHRUeGZ6?=
 =?utf-8?B?OHZZUitJbnBMdDgvcml4blJPNVBlbGVWUjhoamFzck5VMEJiZEp0dWM5OGZM?=
 =?utf-8?B?M0lRbVVDekNiUnlJVFZLYlN0aDArN2duTHBkMkJTYXdiM0tUNG1qYjU0bmwy?=
 =?utf-8?B?UFpid1FiejBLQk1HcEZ6OE5rMEtmODZCdmVtc3IzUU9GQUVXSHloOHNmNU02?=
 =?utf-8?B?ekI1VGtMWTcwZERub29aQXZWdTZIY1RaTkJhS2JpR0VjYXd4QmNPZVZ3aE5C?=
 =?utf-8?B?ZXhZSHJXRFNHUENWaTBnNDRFeEo5WlQrTE80MGd4dy8vVmhkYUV5UWtjM2JN?=
 =?utf-8?B?SEdpbkVod29GUlg5SnQ1UUFlVFlwdlNIcDZHUUZ2aGxtZGF6MzBhUkt0TEx5?=
 =?utf-8?B?VnhrNnVpcW5vaFljbmFCd0pBRENHTDUxQ0llUXdFdThxWFZrTGpVaGc2dWpR?=
 =?utf-8?B?NTZkK2VnUEN6cGtFQkQ5TitKcmRZM3VjRnpqbmpSTVJmb3o5NE4xWUQ0MTNT?=
 =?utf-8?B?eHJrdzhXL0xPSmVlUXFiR0w5dUY5YytTdjBYNnBlbk8zQkIvMm9xZ1RXMTBo?=
 =?utf-8?B?RXFXTTBaQmxoR0hGZ2pyOVk3Zzg1L01lOWMxaUNUaU8zT01OQktmL3dTcGdy?=
 =?utf-8?B?NXMyVTZKbTllNDRpRkhxZHZRT3RxL2VvK2RyUXhvZEFnTjJGWnBuMDdMd2dI?=
 =?utf-8?B?MXkzTktEcllxMkZlbjBwdDl5Qnc1NnRNN2FFdmJoSm95ZkRjQUN5aXRBTi9R?=
 =?utf-8?B?R2NHblBlVy9YT2NFVGFUbzdYeW12TFdSS0VzRnhwRkl2cm5DSE9qQWN2ZDJp?=
 =?utf-8?B?RDVZTWI0QWw4T2ZwN1F3Y0cyY1RJN2M2VlNueFQyT0dDdm9QNnJlazlrQTZr?=
 =?utf-8?B?NG9GK3hSTEZ0Q1lhZkxCbWovTW92MWpJR1g3bUNEeHR2bEEyZmxLZ3I0VGRn?=
 =?utf-8?B?emp4SG5tY2JzY21TSytUTjJVcGtZWUJWYy9iQ0FOakNIS1RQblJVZEVvWWlK?=
 =?utf-8?B?amhSWUx5VmhQK0l2YnpNTlp3VGVWUVl6c0FxK2lPdHZIdDV5S2x5S0tZcXkz?=
 =?utf-8?B?RXgwcXRKWnducU5JQVZSZlhBVkV3dll1c1I0eU55UElCOG9qcnRHYUxsZ3k4?=
 =?utf-8?B?V08vb1cwb3Q2Rkw0VzRvSm1ZTU1hRHkwZXBWNWRINUxzWFFLZjFpN0hQbHZF?=
 =?utf-8?B?QXRjSXZrd0hITmtZcGd4VFJGMXIvcWlYZkc1b1Nhd2pYb1lPTUIvYlowR0kx?=
 =?utf-8?B?ajhXZlpHdTlYQUFCN0R2ZmNMZ1ZvRDNyNXo1MHVleEgyc2lqYVBIV01xVTlx?=
 =?utf-8?Q?2wnQ=3D?=
X-OriginatorOrg: talpey.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e32f54c1-13c2-44dc-a6a8-08dd77f42392
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB3854.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2b2dcae7-2555-4add-bc80-48756da031d5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ze0aidwJLBwOB9Go1+sqJJ8yzU8K6KoKn2uOWVp7adanTbpshHYBiSYLpdPRRnlc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR01MB9249
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 4/9/2025 3:51 PM, Pali Rohár wrote:
> ...
> Note that NFS3 (client) has similar problem. Its unlink syscall is
> implemented as silly-rename, it just rename file and disallow opening
> it. But the directory entry still exists, other users can call "stat" on
> it, just cannot open it.
Um, the sillyrename can certainly be seen and even reopened, removed,
or rewritten. It's only special to the client that renamed it because
some process had it open. The NFSv3 client on that machine is the only
entity that prevents opening. Another protocol from the same client,
or pretty much any other access on the server will sail right through.
It's called "silly" for a good reason.

You're correct that DOLC can be "canceled", but a) I'm not sure it's
ever really done and b) a Posix client can't even do it. So we're
talking about a two-protocol problem. Let's not go down ratholes.

My main concern with EBUSY is the fact that it's a change, and to
somehow "improve" a situation that doesn't seem like a bug. It
seems much riskier to change it than to just keep living with it.

Tom.


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB3FAFB6CD
	for <lists+samba-technical@lfdr.de>; Mon,  7 Jul 2025 17:04:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=qA6a/VtbhYm2WIW/oGmhssj9uP2bniJf4vPBCfHhazU=; b=cIro/3jR6sxvkmwOk+PIHDZ1zp
	P04l14lfUzNgeVYB2Ry0VwcWRU6n+kjbKdLHVYAhABFe/0T4B5h0XidI3cBufO8v+t4YITmnpx35E
	440uUa2yOCwAHN8xVUiSGhF5yP3gGR50JxGDikpD0LMOhVH0IRaeF1sUWVaHjt7vyln6nb2E0P/fe
	6YEWbdq4FluanXWTAXMR5rc2+QvaLRt9LzfW+9Z5NeiV/MXOnpH3SbyM/N/1dPOIdkJOWI98yH1lV
	bSJk3e31WSIC8R6Bq0+euBA7Uehi9fHjlzgQw4Eu3lPOYXQ3mbKxuBBcwQXak75od1Q/q7AGDU5m1
	b5UW5KIQ==;
Received: from ip6-localhost ([::1]:64756 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uYnO7-00Ajzk-F8; Mon, 07 Jul 2025 15:04:11 +0000
Received: from mail-mw2nam04on2120.outbound.protection.outlook.com
 ([40.107.101.120]:37567 helo=NAM04-MW2-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uYnO3-00Ajzd-Dx
 for samba-technical@lists.samba.org; Mon, 07 Jul 2025 15:04:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y0qudBhs0MBKVcE158nsK30u0Yxdt30wtzaKzKDfW+Ig4XZuDxL0XQcpOzyn8I+8CGWh7fqKLPXhM/IKZxpDNTAIiQLoaJFcaj0di25DQVuXqSIc+LOP6I29eA+08AclqHi+ukgQkCFqfFcl8XDmB3OeegMmeEDO/Z5NEHaRQ+mHMWvf+Mnzw11nsJoirRUqyHIOAOjbya8xty94s/6VAyiBfFJLaJ5JU1tvHmcIWAGVzKQw1iyQXznQ4Tb7tSazqBPVOGhzolVmBaEH6tgkU/hQbIooNc9Qv77hw6TdMs5mCL0Dz2ukTxmTAC3ZxVDmWdvito9oweAKcPHreQdjAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qA6a/VtbhYm2WIW/oGmhssj9uP2bniJf4vPBCfHhazU=;
 b=uYXFxpE5Xqchuc0OIoB6wa4IVVDLjy75Ywq+vj2H09S0Ib7+cVpVw9SgGnvq51my35DkAoDU38iY7MYJhgITm3jZ2UliTw3GIAimNsKajg0hacNChpK3P0SB+PeqQFAsRXyuVDYRVel3fxwGAkVCUwGrCKpKrquSO2+RzMfbQTgyMqld+A2Mphf49l1iBffIRQ1uwTxqc3T+qzvWFadYYikTTYXYXVj6tZbNT5b1wn3lZNfk62GEQtuFMVmYpgIYkVAYci7WR8VQYFbea5wXmQ3clI8tjlJCFCKSpJjsA4n3SnPDqfs0hkCWarzNbx6W9siC6DRWba4ZsaiE+v2JmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=talpey.com; dmarc=pass action=none header.from=talpey.com;
 dkim=pass header.d=talpey.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=talpey.com;
Received: from BL3PR01MB7099.prod.exchangelabs.com (2603:10b6:208:33a::10) by
 BN5PR01MB9156.prod.exchangelabs.com (2603:10b6:408:2a9::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.16; Mon, 7 Jul 2025 15:03:49 +0000
Received: from BL3PR01MB7099.prod.exchangelabs.com
 ([fe80::e81a:4618:5784:7106]) by BL3PR01MB7099.prod.exchangelabs.com
 ([fe80::e81a:4618:5784:7106%5]) with mapi id 15.20.8901.023; Mon, 7 Jul 2025
 15:03:48 +0000
Message-ID: <f5c5155c-e53b-465d-a1e5-659ce513d87b@talpey.com>
Date: Mon, 7 Jul 2025 11:03:42 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] smb: server: make use of rdma_destroy_qp()
To: Namjae Jeon <linkinjeon@kernel.org>, Stefan Metzmacher <metze@samba.org>
References: <20250702071805.2540741-1-metze@samba.org>
 <CAKYAXd_KjT5qd3amwKr3p6v0nC2wURdODqHSyS6AY=KXeaR93w@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAKYAXd_KjT5qd3amwKr3p6v0nC2wURdODqHSyS6AY=KXeaR93w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7099:EE_|BN5PR01MB9156:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b0372f5-cea6-404e-2c29-08ddbd677a21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NDV1eDUrVUhjS1kveXNFVVI1RmgrMjlDd1dTTm5GdkxkK21hMU01ZXZrYzgw?=
 =?utf-8?B?b0NTVmszMGtYMUk2K0dGd3IzTjlnQ055b3JKRlYyY3ovUitiZ3ZSUjhqWFFv?=
 =?utf-8?B?QWJOMW03R2JLTFRlNmxzclJJSnFIcWZNYTlCM01DZkxqVTBua1BLRGxxMDdH?=
 =?utf-8?B?TlQ2V3pMNk5manpid3BLZlphK3Z3TG9wbnpxYzkyN0tqN1dxNjR6RGdGZitj?=
 =?utf-8?B?SFNJb3BTZVNtS0tFcjE3SVE2NUJCNXR1NWJBVHM0TUMxcHllbCt5dXV0WW9a?=
 =?utf-8?B?eDFWKzNsUnQ5NytKRFNubEY2SUc3RXhXSDAwOEE5K3JMdUl4bFR5bXBvdFlH?=
 =?utf-8?B?QWV0aFM4MmFYbW16UmxWeWZWRFFpSmxFTmdNc0I0dlNydDNyQ0xrYXlDdVNE?=
 =?utf-8?B?NjdyZE9vSUFzc3lyUzVyV2VTS1c5RGFUSmtnZCs2MGtQZkcxREpCS3lJUDlw?=
 =?utf-8?B?VUpYUzZVMzAwTEZscThIUFJqVFRVaG5GdG9TK0EvMlR1ZE4yVVZhbWphNmMr?=
 =?utf-8?B?Ny8ydkg3Vm9tWkszaGhKOVlud2lFQ21XdU14SU00UU5COCtvemNya1U1ajFF?=
 =?utf-8?B?a3dTS0F3M2ROSUs5Uytqc2U5REZuWmw1RkdvWkkvNW1wUHNtN09nc29FMXpU?=
 =?utf-8?B?QXJZdWxNRi9BaFp6NDhBREhCQkFweTUwY3hUbmRlOTdESzgrVWxCRWxtMUM4?=
 =?utf-8?B?ZytMYkxCcWVjQmpkSU9nMGw1TC9PYjVxdTBZMFgwdm5nVDkwQWE0a25yUjFH?=
 =?utf-8?B?YVZKam9tR3hVWDE3bGxaWW90Q2hrRkZ4OEZVTkt3UVpSQUZIRFhLb0FuSHhY?=
 =?utf-8?B?OUk5eElxNE1hNlJEUEZiNm5TQXJhMUJqYWp1TS8zRGFYR1RFZ3FjODhweEVL?=
 =?utf-8?B?cTZQZGJoc0ZuS1BZZmdzbUpqN00wRXBNREYzNlNWMnFROS84U1ROMU9Dd05s?=
 =?utf-8?B?cmErNWdJb0Z2L3pNNE9Kd2RScGE5bThyZU9rNmx5VEtQY1pZbnR0YW9kQXp4?=
 =?utf-8?B?Vmg1bGdlL0tzcHBNY3FQb296VkE0MFI1RmFCcGRtd0RHMDZyNmpHcEtJTmZ4?=
 =?utf-8?B?dGcyZVBkcUJOYkpPb0VwZFMraTJQQnNXQWdnSlVrWTRwYlZGYkRpbGw0eFc3?=
 =?utf-8?B?M1ZRQUFVeEd3UEFSbEd3cDNKVytmQld2RVQ2M2dIaTBvUGwrUUxJMVNrWC92?=
 =?utf-8?B?Nk9WQURramtkb0liMUp2cHZ6L25iOEg4SjM2VktjZ0tNSzhXdFU1OG12K0d3?=
 =?utf-8?B?RnBKUGpFMlNtdmtlMk95a2w0M1lOV01kTGZjU3lPV2tVNmVidGpCZ2VmQ25z?=
 =?utf-8?B?VCtDR1ljNXZZeTZCdVhiZ3VoRkhZbFA5OW5sZWZBVXJRSFZ6dEZjM3c2Qloz?=
 =?utf-8?B?TmVOdFZQUUlRbEdYQWIzR2NTdzlyVDh6UG45aHo1STBZdlhUNnlEaFR3bnhu?=
 =?utf-8?B?b0pybHYzYldzT0oxY2hrcU1GUDh4a00rblJwTE1mNEtnUk5pemg5WnJhcHN0?=
 =?utf-8?B?aEd0bHZua25xbURMZ3g3dUJRcEpFVEpXVyt3OFlNVmtQTDdSKzk4Wm9JMXVz?=
 =?utf-8?B?NHRPTkgveVRySEQ3K2tncURyWnRFS012OFRpQW8vSHhOQWIrSUJTOXhDTTA1?=
 =?utf-8?B?b25nWjk4K2psR2p4SUswOEhTdXJ3dWtyNFdCaEo1dEx3VDBJalM4MzJvcVli?=
 =?utf-8?B?TUx1ZEJsQ0NtMmxVTHViQnhRaFRXTjVPOEQrNHJ4WWE0dG8wczdWNFNsOCtS?=
 =?utf-8?B?cEgvVXhUUW1xTXk2eTQ4WFBYSHB4eTNKUkVSZmdaVTZQcHJpUVBsWFcvbFNC?=
 =?utf-8?B?OGd5UlZQOWdaV1lPOFZuZTNCZWEzRlBqUnVvdEE2bHoreWVyeTlqNWtJZVVS?=
 =?utf-8?B?U05BWTBFSm5vTk8wTVFGdjJZM1NBYUFrZ3JwN3ExWm5WMHNLQnF3a2sva1Yy?=
 =?utf-8?Q?TOgBSlq3iLc=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFRjVHZMQmVtdXNsSnA5Q2pkTHRCSXZGZzV2NWFMcmxaZjRUbGVxMWV5RmJj?=
 =?utf-8?B?emJ2SUFLYjhxNWZkVnFQcE5TNHFiM3JNaDJXb0JjZnVvYzZUcTV4K0pSK0U5?=
 =?utf-8?B?d2hsZTJvMU9WenRPY0Npd2orTDBiRHYwQXVGSi8rc3FaNzd2REc0bzArTGls?=
 =?utf-8?B?MW8wNUtTTG15RHEzak5iY3BQbHlSNmJ5cGM4Z2FyRXRNQzBtTTFWN3QvSWps?=
 =?utf-8?B?RUZoR002dEZJaWMrMStuamZGZTduaHJCdUZkaU16alQ4c1FZNXZaWFRuYWg1?=
 =?utf-8?B?ZTM5NW9oMjlmcFdhVWdhMlN3aGN3LzBiWDd3UzRuSlIzRC8vczVFY1JrMk5P?=
 =?utf-8?B?V1NpUWtGcWdZL2RlZzlnSEVyeW1udEdqRytBSnRDQUQzZFFWNDVqNVN6UEpr?=
 =?utf-8?B?Um1zc0krcnZkbldxV0Fud2UrVm5DU2lGMGlHY21iWVdvSzdqL0NQdWxrM1hm?=
 =?utf-8?B?YzBpY1o5MEhCYi8vbHBpVEVnUGo4UUNLS2pFYSs5aXhsMWxFOFY0bm1OWEFW?=
 =?utf-8?B?YWQrMGQ3UzZRZndGMmdqNlY3NGpSUW1raWU3SXhWSmtuamMvZFpTVVV0bUZW?=
 =?utf-8?B?VlhtQWtOelVYSTZqeFYrUVEvc0xYeVNXd3hJaFBVWkc0M25ya0RZdTJHTVlv?=
 =?utf-8?B?cytMdlA5RDgwUDdHZ0lpNVIyaXc3ZXpoenFLdm5CNmZscGtnaFFMcEcyckN0?=
 =?utf-8?B?aXhEZUZjSDZNcGJLakROVnRqZnBKK2g2b1BERUozOTFScVE4YjFDL2R6MUU4?=
 =?utf-8?B?NFhRRFhtK04wc0NNQmVtUGtGYkViSGkvNkwwanJTVWgrRGJvSytFbXZVak5l?=
 =?utf-8?B?MEJlSjQyMk94MU1sSUtsTnZhVUVtcTZHSjd2MkFWQ21GaHB4MXZMcC84eVBF?=
 =?utf-8?B?bFAxQzNJTXlWYnBtWEJDcWpKbUNSdmNlbDZCZTNST09UeWRudHRTQktXbmdY?=
 =?utf-8?B?L1RETzBxS0poTEVYam4xS09PTDAzQXdCV1Npek1NZ1NlY2NhcXVrMmpteWpY?=
 =?utf-8?B?Y2NlUi9rWWY5elhKZEROU2FOeWlxalZiVTlTU0JRcTFCK0hIdlhjTVl4QXEv?=
 =?utf-8?B?NnNTR3dmNXUzU0h2bG1ENUdvY1J3NHEyS3c0VDZTV1dUeGMvU1Rmcnloci9y?=
 =?utf-8?B?bDFBd2xkd1BJbnhjTWJsdHJvK2ZEaDdudW8vWVU1SHlFUG8yVzYzNkdWK3NK?=
 =?utf-8?B?aGlONFZ4eSt3RG4zTTRQcHlGZkg0Vy9EYThuUlljMGE1aXVGbDFwYkRLUU5n?=
 =?utf-8?B?cVJHRHY2NW9NNVYzK3cxdUdMMUhVUGZ1NGNCbFRJWE9pVkVKMHd2TDR3dHF1?=
 =?utf-8?B?NnhFTXUzUzhCSzlpdzl2Uzd0WlRId2h4Y0EwS1FtOEkxUmx2ckFxQnM0cnZS?=
 =?utf-8?B?bDBldFVSMlNWSWdwRmkvWDh6WWlXNUtvYWRxTUJOb3h3ZXFuUTJtSThmOHdI?=
 =?utf-8?B?RUlyeG5jVlVsMEhEVkQyK2IwM0Q0QnlDckhzMTFweEFPZkdQTCtPcng4TWR4?=
 =?utf-8?B?ZVhFQUdyaWwvYnRJWmhMWkVIV0pWOUhhRG55VVpyV1UxZHgyNzlLdXJ2NFJo?=
 =?utf-8?B?ckx2Nk12dHVOcjRyU1lFaTZDM1FzckdBZWJzVmtSMW94TFVzWFVGYmNqSUJq?=
 =?utf-8?B?ckNONmduam15dVZVYlpXUUN6OTR2WHppWDZEVGh5aG1Pd2ZLTXJPc1BNbnJu?=
 =?utf-8?B?emxyTlpUbU9IZVdjUi9QaE1Da0czRVVZZ3VTV01yUFJkZmowRzZEUzMrWi9E?=
 =?utf-8?B?Y3YyTEMzYkV5NmNVM283MlFSamIwOUN0Z2RKU00xUmtYRUozaVh6cktEanVO?=
 =?utf-8?B?WCtSemM2VGZia3dnRXc5Wmd5L1QzL0pvV3kza2c1SHE2WVhjRWxDYnBqZHdN?=
 =?utf-8?B?NE0xYlQySXhrb1FCcHNQS2d3SjgyOFVLVmh1Nm5PR0FXQWV1eThyRFZMTVg5?=
 =?utf-8?B?bHFXNXVSZDRsQVp4Vi82ZkFXWi9vNzc0NW1tUWNxNmpMSDBwa3NpV243bWNP?=
 =?utf-8?B?TUVuOHpJbEh2bVR6b056STNBSkFZd2wrazNoZjQ4dzdtZjFBMmNJVXFteVd4?=
 =?utf-8?B?UFNUTktjM1V1Sit1dVZuaWMxQW95Q3hXT3pxb2Q4dGpiQWlKZVg4TUU2TVgx?=
 =?utf-8?Q?7C4mODZOmb0Aw/Ci456iNUwKB?=
X-OriginatorOrg: talpey.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b0372f5-cea6-404e-2c29-08ddbd677a21
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7099.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2b2dcae7-2555-4add-bc80-48756da031d5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ad9Bbg6wv9K6Db+IvWv8sztSIjw4JqV2jfuOIjF6y/z68Q4pJERblOberRowm+Ri
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR01MB9156
X-Warn: EHLO/HELO not verified: Remote host 40.107.101.120
 (mail-mw2nam04on2120.outbound.protection.outlook.com) incorrectly presented
 itself as NAM04-MW2-obe.outbound.protection.outlook.com
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
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 Hyunchul Lee <hyc.lee@gmail.com>, Steve French <stfrench@microsoft.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Definitely better and safer.

Reviewed-by: Tom Talpey <tom@talpey.com>

On 7/3/2025 9:06 AM, Namjae Jeon wrote:
> On Wed, Jul 2, 2025 at 4:18 PM Stefan Metzmacher <metze@samba.org> wrote:
>>
>> The qp is created by rdma_create_qp() as t->cm_id->qp
>> and t->qp is just a shortcut.
>>
>> rdma_destroy_qp() also calls ib_destroy_qp(cm_id->qp) internally,
>> but it is protected by a mutex, clears the cm_id and also calls
>> trace_cm_qp_destroy().
>>
>> This should make the tracing more useful as both
>> rdma_create_qp() and rdma_destroy_qp() are traces and it makes
>> the code look more sane as functions from the same layer are used
>> for the specific qp object.
>>
>> trace-cmd stream -e rdma_cma:cm_qp_create -e rdma_cma:cm_qp_destroy
>> shows this now while doing a mount and unmount from a client:
>>
>>    <...>-80   [002] 378.514182: cm_qp_create:  cm.id=1 src=172.31.9.167:5445 dst=172.31.9.166:37113 tos=0 pd.id=0 qp_type=RC send_wr=867 recv_wr=255 qp_num=1 rc=0
>>    <...>-6283 [001] 381.686172: cm_qp_destroy: cm.id=1 src=172.31.9.167:5445 dst=172.31.9.166:37113 tos=0 qp_num=1
>>
>> Before we only saw the first line.
>>
>> Cc: Namjae Jeon <linkinjeon@kernel.org>
>> Cc: Steve French <stfrench@microsoft.com>
>> Cc: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
>> Cc: Hyunchul Lee <hyc.lee@gmail.com>
>> Cc: Tom Talpey <tom@talpey.com>
>> Cc: linux-cifs@vger.kernel.org
>> Fixes: 0626e6641f6b ("cifsd: add server handler for central processing and tranport layers")
>> Signed-off-by: Stefan Metzmacher <metze@samba.org>
> Applied it to #ksmbd-for-next-next.
> Thanks!
> 



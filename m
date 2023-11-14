Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A186E7EB597
	for <lists+samba-technical@lfdr.de>; Tue, 14 Nov 2023 18:35:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=3bZm5K200uZ5uq90MlGPdtM3DFT/kABkWj8LrAV2hOw=; b=Iluvyrc7fjJ23h+cebdW6LhB/d
	EugfRaWfIxflaKscWdCSzFtU6yv4j/0z6pjjtba60aY4BIi47ASxtFlriA17uH6BKVbqHqLq9fu4K
	4OZMYPCkOmAoS0c9oYWfLZelrmwfGZtdklhdtRSbcd88stL+ny+bZE38UArop3zesJd9SRu2sfaCR
	3VZ+uYUBUFey5W5P4Im4xKwmrH8AJKj/AG2k34qOSumV8+BSylD0cRXpMwS+FV7UNiMNds/JCn7oV
	D+1Cydd2LKU/vrzYtbRC5bJZZ0c0G8O/D23Zoa+ksgQBTQhJ5T7qiVzJHFOYF+ynym7rRrYigEbzI
	7JikDySQ==;
Received: from ip6-localhost ([::1]:21952 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r2xJP-008HiO-IM; Tue, 14 Nov 2023 17:34:55 +0000
Received: from mail-mw2nam04on20615.outbound.protection.outlook.com
 ([2a01:111:f400:7e8c::615]:28513
 helo=NAM04-MW2-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1r2xJI-008HiF-Kx
 for samba-technical@lists.samba.org; Tue, 14 Nov 2023 17:34:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TgEl0C4XamReGN4k8Nhf4TAB443PiiSh05c4h48jwnJVPW+gv2wgSL3NhLpCrnx2+2gGUm5IrqartcO1y7QV4nmirNq9MWYP25HB77hv/TIH2XIWhZ9nd7LdBNiNYLl3ErmePRT+8DIYjfWFPX47z5HV2uSkdKnojMlDzQbBgzOHIOX2gcYQl1zhgiZcArwJXN3siExW8nHudH44t/3NFzu04/qCD6aQ1syzj3uhIfPGKVlLox11pIlePOtSidFntYOltEGeKhvl7rsrYxltrRgYSl10GE/Uh9hVJiQIgGYa70FJMBy1lZ8V5YzGqcOmZxCT+YWhNPzWhdzlUhus4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3bZm5K200uZ5uq90MlGPdtM3DFT/kABkWj8LrAV2hOw=;
 b=hi87lZLnX6AECouHWTtVbXQZYB3XqDsZNRvyjV259sIpRVXo+noJlDcU0u1JdSQljr37BP4XjQYn3VWe0iInJCGIaqWsRf1O7Mi0sxZaKnb19ybAHiTpdatLYmpDuijPXKW+uvVwg3AoJaDoy2ap1nml9dApvnaSioEnPm4xQRgsN3klRxlaha57UPahMZdbo4I5pPChc33V71KRxMG7CVC9JO+ObXK1hSU4dKDu/bfFlGiaZrcJNiuCCkRb/FxVbvOgoZfIhrC75SVNlveq9HcTg0jb1l8j2p/1iF+g+r9krwhXiA1c/8QWOMLC2CI4hXuyMWn4yPdHpVi+/VWweQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=talpey.com; dmarc=pass action=none header.from=talpey.com;
 dkim=pass header.d=talpey.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=talpey.com;
Received: from SN6PR01MB4445.prod.exchangelabs.com (2603:10b6:805:e2::33) by
 MN0PR01MB7657.prod.exchangelabs.com (2603:10b6:208:378::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.17; Tue, 14 Nov 2023 17:34:29 +0000
Received: from SN6PR01MB4445.prod.exchangelabs.com ([fe80::e38:e84:76d4:5061])
 by SN6PR01MB4445.prod.exchangelabs.com ([fe80::e38:e84:76d4:5061%2])
 with mapi id 15.20.6977.032; Tue, 14 Nov 2023 17:34:29 +0000
Message-ID: <87e931d2-9780-478d-9b60-1dc32d9faf29@talpey.com>
Date: Tue, 14 Nov 2023 12:34:26 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [SMB3POSIX] File attributes
To: Ralph Boehme <slow@samba.org>, ronnie sahlberg <ronniesahlberg@gmail.com>
References: <e916bdea-4197-4372-a15b-cea41c8ebe03@samba.org>
 <ZVJh3X9GQ5L9mLS0@jeremy-HP-Z840-Workstation>
 <e6bd562a-296c-44f2-8164-8a90d98fa6e2@samba.org>
 <CAN05THS4H1+vHuPSnRQmiRtDDpnw3j0PUUJi6FwFZf_2zrAsRQ@mail.gmail.com>
 <137faebc-3bcc-4e01-add2-679465c934eb@talpey.com>
 <45f53fba-a78a-407c-b711-c2a61b836b9d@samba.org>
Content-Language: en-US
In-Reply-To: <45f53fba-a78a-407c-b711-c2a61b836b9d@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR01MB4445:EE_|MN0PR01MB7657:EE_
X-MS-Office365-Filtering-Correlation-Id: fd8ed259-3c69-465d-88eb-08dbe537f4a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: jIukmw7jHxs3vInLjljg71Hk+le4Eu49+fJv/OcyhHo2KcOXzaRVBs4aA+mCg+cxgSmohdo5yNaUSRo3qtvjKumeTbrWNv6/7zdkLgAscNfmiKEtOv19+zyL0tHUJDmwtGIdtk1ks1Coe5GrWcB8H3/U/qBnmkjAPl+uBry5ParfUb/IQCu0B3p0An7ydTuD5XxP7wqnWoQoi5lG0bLJCivuyhavHyKHlklTBEMwJptNXwgmanIP6gkQlUnz7XJ6sbgnypFQjpdQArCb0csCR+2vyXTIAti8px6UOKx3XuaZG8jArs3IpRZQE9kZWz/8UCwJxISopLG78kRsFX0BzuJTkHPDhgFELznhdovPQdqpQXI7DXVE3r/XqWIxcb1FRI1HrdMFZb6cQT0PalsusuCXGx0+EM2wMbBJ38V7pC3G9Ste55GTJpIFE21LiJCGn/fRExAW+af7zt8hC8jo2DiDD8cjvecZ1i/zimsrz+mm6xHVaVvUm89T2bIe2eVIXSqU/IkXR1ZgQ/4Ip+Oq2gHBoEV+wMDzA4k2xYKjwSbYBYcVwRkRZAaO0qJ3pOSEv3ZOIUC3HKXDQzGuCs/oXQ5ZNTaxCYw0pXDvTdGB1WSYpWuMPz4EVxcGCgkqFDvR
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkNvbVR5Q05sYWZMOHJCNmhYdllqQ21EaUlzaTY1SWViZnVaeHZhSFBQNXRz?=
 =?utf-8?B?bHhJYmpBZHFodjJzK0lPOE56NkE0RzFRdWtkbG9zL1FCcFVFeUdvYVZnenl0?=
 =?utf-8?B?SkxQMEdWd2RmZ1I1VitJbmw4bE5BK1dBRDhlN0YrdFRheW85MGorRXIwVGpo?=
 =?utf-8?B?NTFGTWN4Zk1UT2ZFelBsZkREelJlSGM1VW9QaXc2amR4SE1uYzhrMnp1NGRF?=
 =?utf-8?B?SVhCZUVzeGVIV1p4ZHo3TXBJdzBNUDBnRDVFVXNTNFJ1SVIyTUdISHdkRlhX?=
 =?utf-8?B?emJGd0E2eFNaWFZvZDMvYzNJVXdrM3hNVk1UZ2FPUmdROUp6Wis4ZUJRTkJV?=
 =?utf-8?B?UEplUG5VSEtGOERIMDNTeXBJR1RjWi8wS1phZGYwMlpVeDc2UnhrQ1hGbHFl?=
 =?utf-8?B?OVl4eWtwMUI1bU1LMkJLREZuaGtsSDBKRVVDMXNKT1pTekpmQjVDQjNSeDIr?=
 =?utf-8?B?bTlNbmdQN0Z0OUpEQUg3cWlBWTdXZlkzMVg4UXg5RC9aeXhMZEh4V0Q4cFFV?=
 =?utf-8?B?T3ZpdGtqR2RSaDNuZk5KZndrK0t6WGtBVHQyVkMxT3pPZVI2cGU1aXRVU1RX?=
 =?utf-8?B?OUo5WkJPOXdPQjBQdEpYTWRSU3pGTUlxTUx6R1gwSUlkSWNNY0FDSDRGU1BU?=
 =?utf-8?B?Y1l1aHMrVklUQlEzeGM5TzlpeEEzeFJITFFUSlNtTURTNlJWcXR5bG5HZmx6?=
 =?utf-8?B?RDZUMjFJRW1Id3BDVEcrTDMrYlRUbGkyZ2FyNTZhYlB1ZXRST1Z2WWN2R1ln?=
 =?utf-8?B?emtvWnZGREV1M2xLQndmODdGVFpmMElWQ2F4TE5MQVJyZW5PYkhXQTNnLy9o?=
 =?utf-8?B?T1ZRbTZsMk9UMVNKZitNbjZ0VkM4RkQ2cVY2bkVYdWxDTnpKbmVDRmpDaHly?=
 =?utf-8?B?dnQ0V3gzSHRwZlg2Wm50RE4vc3A5Zmp6blZaQ0NEVHM2MHhVTWp0WjJCSTVj?=
 =?utf-8?B?Nmh6WjgwTmpIeTNoUk4xaExoYmVBekZEdkFSbEhveFltUytkOElOTmxCSjg5?=
 =?utf-8?B?cGxRVmpkR3JjTjM3d0Jjb25CMk9QWXg2a2VrL2p5UXZZRm56VVdFVW50WFgw?=
 =?utf-8?B?U3JleGhGam9UamZxZ29nSTdLK2lpWlJaVEo1b1N0azlPanQ4VVhKc3R5RFdE?=
 =?utf-8?B?empMbTgwMTJhM2hwQW8rWXUrUjR0cDBiME5JU0xsN2RtTlROaHZFVGdDb09H?=
 =?utf-8?B?THJ6ckFVa2hVQXJQWHRtTE1ycFM4alJLSFJQZFlmcDE5eFIxWnhENnNYTnR5?=
 =?utf-8?B?TnczcldzbzZabnRhY3NOeTZzQlo1a25PQm5VU01CdlNJaWZBdXNZN0U2L0Ey?=
 =?utf-8?B?Si9SQnh6cFhxL0gwVGlXck1qamo3d1orckR0LzloNmFJVWJHL1JXeXFFMWx2?=
 =?utf-8?B?SGVvWlJPb29hVjk1M3FGSE9sZm5JTkl2cXlSL2VRLzdDcmIvVVdvQ1JzeEJM?=
 =?utf-8?B?L04wM3JQTGVNamdJZm1SQ0hSUmd2Y3lTUVk2Qmw0TUo1RDFrU20wYThiS3J3?=
 =?utf-8?B?bnByK3dlTTNEbWpaaDBIOWY4QXp1RTJRVkJuWW11R2c2NGEvaW9vNmVFM3dr?=
 =?utf-8?B?bG50MHJlOUVWdWRleDRlKy9CSTd5QzV5QmtLZEhwT1BwMUkxZ3NleDl6OFdM?=
 =?utf-8?B?QTFRQno4RDdueU0yRERiSlpBb3cveVFweVJWL1QrSEg4K2hVaVk0ZC9WNGVH?=
 =?utf-8?B?MXNIYWN1YytCd1p2cHBkSFN3UUlsNEJZdU1vU2Y0MHIveGhZZEF0TnZ1dnZy?=
 =?utf-8?B?aFZnSjVRRFdEejJLdm0wWVNJRnlDQ3pTcG9uTkR0ejg0VGEvQmxNMUhUKy9y?=
 =?utf-8?B?WiswNGtuQU1VMEFpcnJjMUY0RWtpSDA5MUNKa3Q1b1BxK0IyUldieTBOZ2cz?=
 =?utf-8?B?NzNlcmszVzlNM2JWSmkrZlBEVmpDaDJUa3ZPRUQrWDFWSEpXdkIvdW9ScDdJ?=
 =?utf-8?B?WFNjbi8xRWt4dmV0QVVGbG1TU1FmSzlhR3ZKeE5TQ24zVXBiQ2VzTjNqTmNY?=
 =?utf-8?B?S1A2K1krOURiczNvZVg0Sy9rc1ZsWkNDa0l4QUxQVk1yT0VRelFsRktYMHFw?=
 =?utf-8?B?VndycVg4Zm9MUjRObFQ1NVRsczFNMzJKWWlRbGx3cXZDd1BjbVJIZStPUmxK?=
 =?utf-8?Q?bcMSplYnaoBzGfKNggJVcQFj4?=
X-OriginatorOrg: talpey.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd8ed259-3c69-465d-88eb-08dbe537f4a3
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4445.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2b2dcae7-2555-4add-bc80-48756da031d5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uJvPbuSc2g/DSnrhWmBoRrNiLyn1gId1zYwUAC1LQeaUQElXfmeyvFBpg3nwOXpc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR01MB7657
X-Warn: EHLO/HELO not verified: Remote host 2a01:111:f400:7e8c::615
 (mail-mw2nam04on20615.outbound.protection.outlook.com) incorrectly presented
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
Cc: Volker Lendecke <vl@samba.org>, Steve French <smfrench@gmail.com>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 11/14/2023 11:44 AM, Ralph Boehme wrote:
> On 11/14/23 17:22, Tom Talpey wrote:
>> But, does it need to be exposed to remote access? It would seem to be an
>> admin function, most appropriate to apply via the server-local API.
>>
>> So to flip the question, does "chattr -i" (or any of the zillion others)
>> expose any new vulnerability if remote? Some of them look fairly juicy
>> targets for ransomware infiltration.
> 
> there seems to be a working local privilege system associated with the 
> attributes. If this was flawed there'd already be a serious problem with 
> local access, so I don't think remote access changes the big picture, 
> does it?

Agreed that the privilege needs to be correctly managed! But exposing
it remotely increases the attack surface significantly, so in my view
it needs a good reason, and careful security analysis. That's all.

Tom.


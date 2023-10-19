Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 601B87D012E
	for <lists+samba-technical@lfdr.de>; Thu, 19 Oct 2023 20:11:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=fSL54lGRqq/uvGKflZf0t2xfnJ/0wpEAIenypWlYt3w=; b=LpKrtmoARy3NKPWiEaqamD4XlK
	YywZEPoJN4BU8xqQL8PwgDF0rc5C+ljc+Oxq/0e/cb1qiH9HIihD2aEelxkl65vqylfLp5wTCBjti
	wOnLsC1/fr1KWXdCyor50Sl9YD1J53EHJOwDupdBguVtBCJ4PlbN1m9mUaje9Myu/yK4mEe0fThBI
	gAFm7RypNU1/387wY/eZ7JGcR51hBDcDW3ZIyjcgcFpKZfqHotkMj+bN3TVthqilDjt18q8JsfUXc
	h2O8y7Bb4G8a+cEQ6Y9/ti+vGHmf1k6czaj7mMO6lQzuOiKQMhKi3XnnSRCCzx2gR21cqxw1Qbpd2
	v6LbGpyg==;
Received: from ip6-localhost ([::1]:27296 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qtXUK-001N4u-7v; Thu, 19 Oct 2023 18:11:16 +0000
Received: from mail-dm6nam10on2061d.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::61d]:44545
 helo=NAM10-DM6-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1qtXUC-001N4l-U2
 for samba-technical@lists.samba.org; Thu, 19 Oct 2023 18:11:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hyk9Zo8rxplVuVRRvY7/J60CW0ZMGN1CgXIyl/YlRroPfIvjzRBvUw/J1+hOYlk3T74waH1x7O25l2ppJgADKRTpQJ47EjivXEjOtJqzgCP9wb7dTaf4/NzZcALYsN0leWMYN3L2h6SL8nZ1xsY2l3HWW+NiQRTb9/xHFQxgED+yDWmEvFjAJrVuSru4d5R4DYQTMSG5TVp/QAxrrkdQppWVREFgRUwmJDU7DWzzFKO1LPjgVO0xsezJdlAn/saWq1q3geNuXsokD2cwdH3EmiANL1q67CGC9wKN5YHRm6EZrRqdg86Pap9EQfO/HK32nC2kCpub9dj5N9m+BJx73w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSL54lGRqq/uvGKflZf0t2xfnJ/0wpEAIenypWlYt3w=;
 b=en08pQUf5K/E7UFoOd3Z1AhzetumunTzOxHUJPKXqH97kYvkn28t4hiBlSAAt7z/wIoR/dcLTJSB9JsGQoYhuK+GdJceX9/8nJdk07aAHRLVv+1LgyMYPXErI4pj9FcTlxSQ3tT9ZbfbqvvJXZId1TYUpaGGR3QO7bnRw0KuuqjqBgTtpjiPW6bV9yNAEpdB3Ar0kHtet1CGncBYSH0wEF2vzh1xUFWMu6ErDUIeBmfuZylGD+QQlJG6e8cma814RC+sRgzZl55c0w+j33pRPQuyIwruCE4ynOYU+HwMWeME1EPukrEOaqBYR7ni9wRksZ+YaxVC4DCYuic8CZSNXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=talpey.com; dmarc=pass action=none header.from=talpey.com;
 dkim=pass header.d=talpey.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=talpey.com;
Received: from SN6PR01MB4445.prod.exchangelabs.com (2603:10b6:805:e2::33) by
 SJ2PR01MB7982.prod.exchangelabs.com (2603:10b6:a03:4d1::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6886.34; Thu, 19 Oct 2023 18:10:52 +0000
Received: from SN6PR01MB4445.prod.exchangelabs.com
 ([fe80::28cd:b4e1:d64b:7160]) by SN6PR01MB4445.prod.exchangelabs.com
 ([fe80::28cd:b4e1:d64b:7160%4]) with mapi id 15.20.6907.021; Thu, 19 Oct 2023
 18:10:52 +0000
Message-ID: <6e68caba-45aa-4512-81b4-a33d31d2bdb7@talpey.com>
Date: Thu, 19 Oct 2023 14:10:51 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: SMB3-POSIX: Move section 3 inside section 2 as 2.3
To: Ralph Boehme <slow@samba.org>, David Mulder <dmulder@samba.org>
References: <bb0a36f1-609d-4cb4-984f-be377375b3c0@samba.org>
 <ca9e50c5-ba42-7a3e-9158-24a08ed42512@samba.org>
 <7861de81-2176-4996-82da-11b663c20991@samba.org>
Content-Language: en-US
In-Reply-To: <7861de81-2176-4996-82da-11b663c20991@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR01MB4445:EE_|SJ2PR01MB7982:EE_
X-MS-Office365-Filtering-Correlation-Id: 71f37b98-f1cf-4455-306c-08dbd0cebaff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: 9w+3YqHtKM/lXsdjOssSmeCa55KvF/c6XZ2iXRv1RJo9WQ1cXOXRbad3i8kStQ74VkdVmC8vnH3BoSf8WY+VydG42/UyDzCqYQeQJ3BNhPAfJ5ksqClKhuxYoPT1kX5ZilrH464d6OrqogSx14rWHbHVS2ONzi5/OnmSnUtvnbRcamP2yaueJR8uLzksg6ABwI8cDYOD3QpgsyVEoyaNHhmSm+An8eGYYooBO1/0eiM+lc8mndY+U27Gct1tjHFXb2fvBmjnucoGUbAy2pgLMumXpE+72m6xWYd5TTmeHnNKfgcNS/NrUz9c3xc13/8rpaVs6h3nX+wew96dXprGt7Jl/e8gICe91qwc84KYTlrJ03g+vGdrZhaGMqbzuCvmo00EQyVESMDk51f5GZsGZ+elyFl8rwrSJ3TfACOurd5MrHKrnSlGw+k03VpX7RH1aePeEfDE37mrLMQXGuSc33Ncao9D13x4H2t9nmcJ7wOpTqrzGBEyTn1JkKE20vw695uDqLa0wbjPRnBT4VCW3xqL6Ib7TnwJMdpPtWFGctYdLDeDJAlEyhRQWoK7mtJqpIcgxJF7g4NXVFYG4U+wuI8YadApmRerlsS3iSyFgH4=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkYwdDVsNmFMTm96S1BpNHM5R3RSY3NzakcyRnRHSHFBMkUrSUxYVHZaQlpZ?=
 =?utf-8?B?RjZLWFFJVmNIVlNSZS8zUXlub2dldkRCT0NYc0VMdmlqcTVqdDJ2WFBrckFo?=
 =?utf-8?B?U2JCRWVCM3lhN0RlVDJIOGpIMVBpYjFUTHZEY2lZTHI1Z2x6WVVKaW9VTktu?=
 =?utf-8?B?cHlYZ3VEQU9RNWs4anpLVE0zbFBpWFdVUmxmdXNIcmloYmVTbU1UYmxQUDhz?=
 =?utf-8?B?eGVyeDhJOTc0K2ZaOEVjd3l2VXUzc0VuMXIwWDYvMXF5a29GV0t2c1BtSVd0?=
 =?utf-8?B?WmRNM3o1aFhWVGFaWlNrdlZCeFc4SjNMT1B1UU14Sy9DckowUS83bE5XQ09q?=
 =?utf-8?B?dGFGemorcTI5RGp6anBPTGVaY2xJUll3UTJSb2VEczhHZUxGRDRDODQ4Ukg3?=
 =?utf-8?B?THAxbHJ4OHlleTE3cTFZM2VWN1ZwbFIxZzFQMDl3dFZhN0N3bGYwK0w3SFp2?=
 =?utf-8?B?V0VZcFdsMXBqQmZGSzAwTkxqaThEUGFnU254ZG5aNnBwT1ZzekFGRmpubWMz?=
 =?utf-8?B?ajNuZ3VIZHpUODJib2RYNndOUFJSMXBkWlM0a0tHR2NpT1ZCT3daQzlEMEdN?=
 =?utf-8?B?VVgzREtTWEhmV1d6L2FrYkJzOUpxN1BjTEI1YmtLbHNIR1RDUUVJalFxK2w2?=
 =?utf-8?B?TmF2Y1BaaXRGVExubHo4N2ZybDNZdGU4enJzbU8yRG1jejZmVFd6ZDZSWFRJ?=
 =?utf-8?B?YU9jOU5YT2JoMWJ3a3Z4VDJ0R3VEcjloOG9EbmJtdjdrdDY0VitIWkQyRStS?=
 =?utf-8?B?bEJvL0t0b0hpMzlZcmN3THkrODY1MnVFSDArZjNYZVEyM3dmc1J0cFg5NTNw?=
 =?utf-8?B?LzZramFoOWFPcUgxNUZhM3dmL2RqdTE3YTZ5SHc0a2xnRDZiWmpRczRiNjVB?=
 =?utf-8?B?aWZkVDgyeFl1S0NMYTl3Z2owRzErOE5UaDRrQTVqbkc0WWNZQld0NkE1NXdu?=
 =?utf-8?B?M0lMenlJOEk0bkVQNkJmSHlPWTRWaU0waUo2RWhJV2NQSzFOQUpxZ0VLU1dN?=
 =?utf-8?B?OTZtZ2YzVUd5cUJ3SGJJRVdjOUFQS3hxTWg4OUgvU1JoOFFoTzQvVy8rQXYw?=
 =?utf-8?B?YTNoV1FCMjZGaGVHZ2o2eUlmNjhJbndKUW9XN000eVJxOVhYYTV2UVNNUndM?=
 =?utf-8?B?ZWNteUdyQXpEMlR4ekZrbm5yQVA1cU5HYXZjNjNLdTIrMi9GQzlHeGhvbk9P?=
 =?utf-8?B?S2hMd045LzFTMDlieXZONUFxQ2xNVVVZaXI3SUZqcHhzeE1RbFA1TzFOTjZM?=
 =?utf-8?B?aWV0Mkw4T3JScjJBWjlLZ1h2ZnYzaERVZ1BwWHBwUUwwei9BQmlCcDhkNGhD?=
 =?utf-8?B?bDVsaEFWWG9aVWlNQk5wZ2x0eEgvdUhUYUtWWDBudWFRSHQyNlcvMDgwMnE2?=
 =?utf-8?B?SjdPSzBydmYvOWNXNWNqZnZTUER2eUlwQmx4Mit0VG1JbVBpWU9rR0xyYkcy?=
 =?utf-8?B?WllndHIrMEY5NG8wYWFYem5RL2FZdml5bGoyZkU1VDBJaHMzSi9wN2VPZm9i?=
 =?utf-8?B?L2hhOTljNTU1Y0ZrZUo5UHR3TE5RZzlvK21rSGttaXNBZWFpS3hhcjBCVEM5?=
 =?utf-8?B?YmtpVHNYREhOeXd2UnJrcUl6VmU1TnhUWnVoS3FNSlBXR25zU0JvVHp4MkpW?=
 =?utf-8?B?QnJudjVqN1NWNHNpdnhTWG9UcnhWY09OVlZ6WDFxR0taWXV1RXVQWkRkbjAx?=
 =?utf-8?B?WWp6ZTFpU05kK0tRbUZJZUdmWCtaUGw4K1ZNL0wxMmkzV1NjTjdnZ1N3MEJ6?=
 =?utf-8?B?MmpBTEhNTnpRQTBhYUt2S2FQbnVnRnQ1WUdaaGFtQ0V5VGxvYlNEaCtVMzVQ?=
 =?utf-8?B?NEV5MHVmelNHQ1NkckRLU2dxcy9Fd1RZUm9Sb3lMYzA4M1ZHN1lpMUZySlJ6?=
 =?utf-8?B?K1RrODBBNUorSkc2ZGxKRkRjdTgremJTNHZmbTFhbmQ3MkJJYzRMZHpTWmd1?=
 =?utf-8?B?dzVwbjNKYkx2bGdFK3VsRkxSMVV6QXJmMmRKUk1DUzBiQzROTTRlWjcxSStp?=
 =?utf-8?B?UTE3bEVCVTRVY3ROaENVUE01Ylg5cGJjVU9LOFZiaWMxaitmcCtMT0RZRzhr?=
 =?utf-8?B?ck42K2hOQWlRMm1mNGtyMXF3SitKSnNMMTZ1aVJyZWtXWTVTVWJTZnB2S29z?=
 =?utf-8?Q?iTCafnx+dXA61aI8m7ZNe10JP?=
X-OriginatorOrg: talpey.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71f37b98-f1cf-4455-306c-08dbd0cebaff
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4445.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2b2dcae7-2555-4add-bc80-48756da031d5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bpEnzfFCqPNYHtbXfXn6tNhAEC1VS7L2qcct/rT7nbtIRctengwmSQfKF7iwrZuk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR01MB7982
X-Warn: EHLO/HELO not verified: Remote host 2a01:111:f400:7e88::61d
 (mail-dm6nam10on2061d.outbound.protection.outlook.com) incorrectly presented
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
Cc: samba-technical <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 10/19/2023 1:27 PM, Ralph Boehme wrote:
> On 10/19/23 19:12, David Mulder wrote:
>>
>> On 10/19/23 11:09 AM, Ralph Boehme wrote:
>>> Hi David,
>>>
>>> what would be your thoughts on this one?
>>>
>>> https://codeberg.org/SMB3UNIX/smb3_posix_spec/pulls/3
>>>
>>> @Jeremy: do you think you'd have some spare time to work with me on 
>>> the section 3 server behavior stuff?
>>>
>>>
>> Fine with me. Ralph, I've made you a member of the project, so you can 
>> make any changes you like now.
> 
> thanks, but I'd like to keep a "needs two team members ack" policy. I 
> don't thing we need signed-off and review-by stuff, but we definitely 
> need more then two eyes on changes. :)

I agree that's a good policy.

I noticed the same issue - section 3 in the usual template is for
processing, and it's appropriate to place data structure stuff
elsewhere. These filesystem-specific structs live in MS-FSCC in
the Microsoft docs. It may not be a good idea to infect that
document, but a new section 2.3 might not be the best choice
either, since it's not a normal template. It's ok for now.

I have some changes in mind for some of the other 2.x sections
too, after looking at the terminologies during SDC IOLab. Hopefully
will have time soon to organize them.

What about "Client processing"?


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 674C27DCD33
	for <lists+samba-technical@lfdr.de>; Tue, 31 Oct 2023 13:49:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ktTwPb1SX9q9Z9om3exD6oYeC+1NNVx9mK8egVQ31GU=; b=IIDh+AxeO0hRL8h0MNWSuDrHOU
	Bpd7mSpek6wwmxEf+aS4t/RmgDStn9xF1WWLv7CVyUxOOFR5yAVtKSRnPPk0cLFH1fgiyQFljynFA
	a0y/I3vadGrKd9pc5A8MvBWDKjuBrteiDracPk1p+q7PUbxfbA8psLoyA+pBqxsrikB2OxjTvL0RT
	OybZV8RmdDhU4fyhwPrjHapNQfUDpcrzDXtyt44TloWeo4ndyQclVJils+WAriygxbgawEBioLdE2
	qSKFfge4hGLq7gPipkaOa/i0Jfpv4GJqfEWLUw3JI741TtCex3O6sxfB814P1XoMy/XoCHZ1dGIck
	ggdVztlw==;
Received: from ip6-localhost ([::1]:36608 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qxoBF-003gWY-1r; Tue, 31 Oct 2023 12:49:13 +0000
Received: from mail-bn8nam12on2046.outbound.protection.outlook.com
 ([40.107.237.46]:13979 helo=NAM12-BN8-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1qxoB9-003gWP-95
 for samba-technical@lists.samba.org; Tue, 31 Oct 2023 12:49:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DKL/KWI7plYqxqfYTAY7d0CbvLon0542Eg8KOxCQ2Eel9fMtXa7XmiB39saqfkfCbl514YzCiirmKdHv0a0H531DKZ2nMCSR9TGq2uppJg8GfkRAmE6wShjmhgVslZE/6qUgMbYLGCHuV/kezQlNLF0OmmDi5Uu14bCaIW5Hzp/VLBqFGzcjWfkBf93kksHZK6VzYFOzrPo24YpdsMYlBKyrHrrvWa6c/UbVxdCaws+6H7uS61vy2E9R4FNVlBXQCS7E6Pk58zjTCl3xObN8FwcZZNJDSTxfYFDP+PgsScXdj1BnYESxA6yBXh6NOIVTFnd/1YW9S6CagvreCgRXJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktTwPb1SX9q9Z9om3exD6oYeC+1NNVx9mK8egVQ31GU=;
 b=MsT7BFGzWS86UUZNQEKPEPpS0BRqkFKoEHye1iioTPF82g3y38/Qw+xOYfTBCN45gCeSvpcNwdGvN192uSi9iaXlfp3Hwdy9wd1eCkuu+fJHuNR5xcjlpoQoW5JmDJ/qLwGxjp3mvZ0NlScrk8v5m+ylagF4J+RGxnpeMYbeuQSwFZd83fl+vaX7ScYt2qhqCJY8itVZUKpJ92DDhNXMEMlStSQ8aF/fjyq3gCCJKEXPu1D6w+LuKQYc0ySw2ZmFIgaV78QNvzs/hAWDyfuCG4gmsEaerFG16g9+NUfCb4lABwCRBZ7oePh2mgVkH3I0ge5jM+/YZ9WG7AeSb7kX9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=talpey.com; dmarc=pass action=none header.from=talpey.com;
 dkim=pass header.d=talpey.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=talpey.com;
Received: from SN6PR01MB4445.prod.exchangelabs.com (2603:10b6:805:e2::33) by
 SA1PR01MB6704.prod.exchangelabs.com (2603:10b6:806:18b::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.33; Tue, 31 Oct 2023 12:48:51 +0000
Received: from SN6PR01MB4445.prod.exchangelabs.com
 ([fe80::1df3:d3b8:e0e0:b36d]) by SN6PR01MB4445.prod.exchangelabs.com
 ([fe80::1df3:d3b8:e0e0:b36d%6]) with mapi id 15.20.6907.032; Tue, 31 Oct 2023
 12:48:51 +0000
Message-ID: <6b020b4b-9c7d-431a-86d7-fe4ee01a0df6@talpey.com>
Date: Tue, 31 Oct 2023 08:48:47 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [SMB3 POSIX] POSIX client creates a file, set the ARCHIVE bit or
 not
Content-Language: en-US
To: Ralph Boehme <slow@samba.org>, Jeremy Allison <jra@samba.org>
References: <3b2fa1bd-2eae-482a-a9d9-543ebb921046@samba.org>
 <ZT/ZoUmdarteCey4@jeremy-HP-Z840-Workstation>
 <18abc825-a35d-441b-9476-32c6c368275f@samba.org>
 <ZT/tY0fVsAaaqpZE@jeremy-HP-Z840-Workstation>
 <a92a20ea-5e03-4f0c-9129-db4c62043dd1@samba.org>
 <2c4005f6-e5f0-43b1-bc96-0d497e547934@talpey.com>
 <64ddbbd2-9499-4f6d-ae64-19fccd924220@samba.org>
In-Reply-To: <64ddbbd2-9499-4f6d-ae64-19fccd924220@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR01MB4445:EE_|SA1PR01MB6704:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ea720b8-5a0a-4a7a-81aa-08dbda0fbbec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: dMwkc0h1wl6X4svP1sMdDcw48UqK0dKnuOdgAd0HQFq/EvJFjRb4FYY+nn6Sjc9KJwRpeKBs6cZTYBgjW22xYQDfp+oJiTnW191lXiFmiC/5Ud6Dz1QAFHy2K4X+1d9WD6lzeJ91JGZSk44jMhmMQipDE00q5/O3ixNyku45xuts+hlJ8rfrjei8HnWxbn6FLdzlAZ2fy9EOOa5eBky0/R20rzLi5TUp0ungUdCybQ37G8CZrD7edtoDV7rkw5td0VX+cI+hfW4d6vb5O4QnT6GZJn01vMSMlsvZEr+BbFnEwWixUjwaRCKMiKSOxZv4YKDlFSUgJvzHRLwpBfRuUqBJr3LcfY6fnsaFngwRTwzecwy3TQDOOHjCtlc4BosTj3Dzjs9o4Rd+K6a5A0o42BGE9GD+5nZgx8xqaDSyx5I056Id2FLTlN1zR2unRQYt4mQDP6D9FhrIEEO48zYC9OP0Ti78Gjk2o6Zq2+euQkg+Om7GlbIf6TuMs+pO14wXII0FUgwixWEPEr9jYkytrWb9sBLtgpFdB9/zMjOeqLgesGdr0zeJ2UPHM1JC+eO7kJsQPqu2me7GFjEWGm3NJTF1UeV6bMpwyjPgwGbWaPUNWuMH0yZppPQ1i+zUWg9q
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDlHNkwwN0RUc2ZuR2I5WVRndXJBUkM4OTdIa2tWTGF2d01zTW1iY0NWQWxX?=
 =?utf-8?B?VEphaEQrTE94YWVLTkpIM2hNR0JrREFmNFEyR21Vc1ExN2VSRW1uYWNpc3Ri?=
 =?utf-8?B?Q2NYbXozSi83VVdJdDVaRFY3aGpUYWFrTXdxY2RYbW1ReDZlak1TRThxUWpE?=
 =?utf-8?B?ejVDYzlUV2FTcitITjBMaTlNY01Bd0JuMGdRbyt1OWhYS2lUclBuVGV0WFpM?=
 =?utf-8?B?L1F6RENVU3lOK2pKRXZBOE1FQXBuM2hoM3RFNGZ2RndPMDFQUlltdVR5NHVl?=
 =?utf-8?B?Y0pmOS91eVBlM3NKc1F5bTlPdzhLakRGclcvS3BVTVdRcDdSeXd0UWhoZzJV?=
 =?utf-8?B?QUR5d1VWdjVwRWRoTCtHQzRkak4rUGg5dCtPdVd4OSs0VHp1Vm5mL2I2QnY2?=
 =?utf-8?B?U3UrV2hmcHBTZHl2dW5yOUVxeVh0WGduR0xNK2NOampMWmpuUWtZNURqL2Yx?=
 =?utf-8?B?WTBEKzBiOTVPblB1Qlg3T0U2dlBrMVU5RHpRdzEwUHM2eVVxOC80WkFyU1d3?=
 =?utf-8?B?MFF3TitWNDBXckgrbWdhdlhPeXNFdHN2V0RKZmp5Wlp1V3RYM1Bsc29QcENk?=
 =?utf-8?B?V1pHbllSWWVqbjN0NmpycVUwTmx3YXJWeTRvb1BDNXFsVWE0L25qb0Mzc1ZW?=
 =?utf-8?B?TmFXZElCb1NjcHJSeFg2UWIvN3VYWUNEdVhiZTVrMk5yVmNnb09MS3oySXkr?=
 =?utf-8?B?TzlkaC9hSzVpdFZINGJnWHV6Z0pRZHV5RDB1YVNDUzVob0RWY2pseXBQUnJY?=
 =?utf-8?B?b3o2RGl3U2pnTEpGK2gvQVlQL0pLVlBTdUM4UXNQLzR2emFoaHBKVFBYYVVF?=
 =?utf-8?B?TURLOTA0OWRqLzZPYzRRUEpZTEdZQ2ZpOG5Xc1h5MDRmaUh3dGY4MEhieWVQ?=
 =?utf-8?B?MnczSmdsT3I5ZWVZVHpWUHRIczJXS3F6WUdNZStKcFJVU200MDFMWmxVVXNn?=
 =?utf-8?B?cnIvV1ZuSEhtMURtMEhLdFQ4bzh1eEVIV3hIMEdiaG1RVm1Tb3ZZQ05SZFIv?=
 =?utf-8?B?Ky85S25KalV5bU5oMU50YUNSNE9GQlVqQVVGR0RqTjdQbGkvWDczSTNwbXZL?=
 =?utf-8?B?RzZFclVhSWRCc3lyTWpoazRPUlVaYXZSalM5V0l6TUI4QzNzMG9nMndlQ0lY?=
 =?utf-8?B?YittMXRGcTQyOG56akpibk1jQ3RkU2NIRHA5TWNjb01kQUd0QlZqYm94Tlpi?=
 =?utf-8?B?MjA1MlBuZHEyajd4OTFhaEJrSFZNY1VRRnZ0Z0tYSVQ1TnFWY3B2cWt5K1Vv?=
 =?utf-8?B?aWh4dXF2dnZuLzNiK09TcXlhVnlDU2hBdlREdnBoQlFqK2VkQkZoSlY0SlYy?=
 =?utf-8?B?SHR4Y0hqNXhIcHpFUDNzazdHVkIrYnFCbG04d1hwNVdyN1VUMjlqWU84YXU0?=
 =?utf-8?B?MWhZR3RPVjhPVjIxQ1k3ZGc5ek83NXpFbDRFckJxeWFralRMK2hOM1dULzJG?=
 =?utf-8?B?OU12VGlBbnpaU2QvbTBFTmZVcXJHeGtsNUdvRmllK3hUWG1VSStWa1RCQk84?=
 =?utf-8?B?QjQ0ZTFoTlJvYUNSVGxOaXR1dFBSZFdqeEprVzh0MTUwQlhwNTVXeGpwOVo2?=
 =?utf-8?B?YThUYTU4Z2hpbjlDMEw3d1U2OFhXdk1zaVNTUEwrYWMzanVWOGhDVC9KM1lE?=
 =?utf-8?B?WE1GdVhNSTRsZWp0RGdBOUFQL0xmUlRYMldKWkIwZlluK1NRQThGa3Zudk9N?=
 =?utf-8?B?SFZFeDJ1SDdhT256elA1L3VnV2M4b3JDdCthditkbnI3dU5ocHNlSGhpWWMv?=
 =?utf-8?B?MVZJQ2lMNFpGN1VrOFVJZmNYcWdJOCtFb29VNE1uTE1ldkRyemtLbXJCWHp4?=
 =?utf-8?B?UU4zQnJCa3kxN21FRDhuTDV5VUsrUG9ycmhrcEVrWEFGQTk1Yms4SURIMFd5?=
 =?utf-8?B?dXZrTkJhbFJmaVBsYWY5TDVZd0YzVGh2dzhTeldIMTVlMWtOOUkyS2V4WjJS?=
 =?utf-8?B?UTdhdzJHbU9xdFpWOHFOV24yc2RLblcvMGZVYWFlUkhsVnVTMnN4MjBjUTRQ?=
 =?utf-8?B?REJreVllNXpwa0pwb0FQT3h4VnFsTkIxSkIyWVdqM2xwejhTNlF1dUI1UUJo?=
 =?utf-8?B?SEdVNUoybXIyZUtPRUhkV1JPQ2V4bnhRNisrM05XVk5oUnNXdlJaN0d1NktW?=
 =?utf-8?Q?ejPpQh9B1w3F6m7SeAu9nopX2?=
X-OriginatorOrg: talpey.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ea720b8-5a0a-4a7a-81aa-08dbda0fbbec
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4445.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2b2dcae7-2555-4add-bc80-48756da031d5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JbvSQu7N7nV7bznwfNzznavTzWknx0VTC7wL/qarzfBbJ7Kgo4RnMi8aXTFAKT4o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB6704
X-Warn: EHLO/HELO not verified: Remote host 40.107.237.46
 (mail-bn8nam12on2046.outbound.protection.outlook.com) incorrectly presented
 itself as NAM12-BN8-obe.outbound.protection.outlook.com
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
Cc: Volker Lendecke <vl@samba.org>, Stefan Metzmacher <metze@samba.org>,
 Steven French <Steven.French@microsoft.com>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 10/30/2023 2:53 PM, Ralph Boehme wrote:
> On 10/30/23 19:25, Tom Talpey wrote:
>> On 10/30/2023 2:13 PM, Ralph Boehme wrote:
>>> On 10/30/23 18:52, Jeremy Allison wrote:
>>>> Yep, sounds good to me !
>>>
>>> ok. Noticed we need the tweak at a slightly different place, but 
>>> anyway, working on it while at it.
>>>
>>
>> Is this really worth it? It seems odd to set a Windows-only attribute
>> from a Posix system, just because it's there. I guess it's mostly
>> harmless though.
> 
> to me the question is: do we want to special case this in the spec? I 
> would rather just have the server set the ARCHIVE bit for POSIX clients 
> according to MS-FSA.

I agree that would be a much cleaner approach.

> Otoh, in the case of Samba, storing the DOS attrs in an xattr in the 
> filesystem is an extra IO syscall.

Isn't it even higher overhead for the client to be setting this?

Tom.


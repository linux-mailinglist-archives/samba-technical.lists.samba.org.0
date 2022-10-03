Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DCD5F31E6
	for <lists+samba-technical@lfdr.de>; Mon,  3 Oct 2022 16:23:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=liKmkes9+WhhoOtEH9P2r3Lc2iHpl+VkGZsdzHE5aFo=; b=shfq8V/Op7rPuSYMMj0c/PGwUY
	wYRWoF+FzkXPcar9GYHkoI0JzcSONy+ebsENbGr1uqgmgs6puIuI0xQP4vV9xr6YOFcIy27rLhlPn
	1PYdfkirq+1mj8hpL0C3T79Wos+2se8uVJl37lCaHYa2KJkwtEw190JrCLHmUe0bvmfbMYSVTiE6g
	3jaFYwcI9CZG0lGMNizJK8jc5Sh6R3rp0NXca1+Ae8T4AL0gLs1hc4ow0tJUn5DemSB3FmL5p+mJT
	azwxhs3uFBTbfQ4uNwXr4lndjR2ieopUq8FfLR6lHqllUEq6No5eD2csIuUa9sQKIe0spLgKuINBU
	rdwWYoGQ==;
Received: from ip6-localhost ([::1]:19380 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ofMKj-007Mxd-Rx; Mon, 03 Oct 2022 14:22:13 +0000
Received: from mail-dm3nam02on2058.outbound.protection.outlook.com
 ([40.107.95.58]:47585 helo=NAM02-DM3-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1ofMKf-007MxU-4s
 for samba-technical@lists.samba.org; Mon, 03 Oct 2022 14:22:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OTBpMaUZwEhESDQ89PjuTWhvFLPj+zV9WDgaPu63hYWc4Cb+faqN2u1Wt3Je3qz++qxFwbbrGZ3TqRvGtGgZK1EUNTtRelZePJ0Zy+9+WYcpCFYVm6WwDKZtH0bNPdgmGPC3bf2aVxrW4FeN/YwrhIdgJCZHmWnlJiJ//SBQ3YjCEIdlf91tyKTc/NmSpZXo+Z9jj1am9ebuuFE4Vy+TtXYGrM35CR2KGJhECg2RcEUYe7Q5GCo7gNWfNjMB2Fhm7vUnXSpS+OFR/fG6vCUhTKF4BRaGkAPOIclQjpzGFuowLtB6bimVFtw9KrOjBcSE/a6wqKGKDstV7v+VnD41vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=liKmkes9+WhhoOtEH9P2r3Lc2iHpl+VkGZsdzHE5aFo=;
 b=UwoCMZFZJs7d5+DWqxlgl+BGQz+a7/X3qXBrwbL2MgcCZ7geWy71Y+MYNZxWYLnx54B9OMnp3dT2nVIOsiqxq/34FSK7V6UhewvjSN4Sw/VMOpeika3T8vVMoQKwwqf/Pi+T7IvTpy17BQKUJ2G2MNVdu00s+oK2ym8ZomlNvAMwnvRywJYkZZVzXrmU39mTJObLZWSpe3NDbfX8jzMnXCH6zk+nCVyZv4QsZCgeJJXV1fOZvvle7eJQ5/zbTMsDvmcfXD0mHceNwLc2FXTFdHh439h9/gF7qQqVha54HYbi4BjSLNhtrznJQcrmRBp83PP0I+WmiSa2QfaU9PzPMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=talpey.com; dmarc=pass action=none header.from=talpey.com;
 dkim=pass header.d=talpey.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=talpey.com;
Received: from SN6PR01MB4445.prod.exchangelabs.com (2603:10b6:805:e2::33) by
 BN6PR01MB3283.prod.exchangelabs.com (2603:10b6:404:d7::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.23; Mon, 3 Oct 2022 14:21:53 +0000
Received: from SN6PR01MB4445.prod.exchangelabs.com
 ([fe80::454c:df56:b524:13ef]) by SN6PR01MB4445.prod.exchangelabs.com
 ([fe80::454c:df56:b524:13ef%5]) with mapi id 15.20.5676.028; Mon, 3 Oct 2022
 14:21:52 +0000
Message-ID: <d7bf66c8-0695-a239-4bfb-d234241479ac@talpey.com>
Date: Mon, 3 Oct 2022 10:21:50 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH][smb3 client] log less confusing message on multichannel
 mounts to Samba when no interfaces returned
Content-Language: en-US
To: Steve French <smfrench@gmail.com>
References: <CAH2r5mvS6_AXjbK8sY_dEWUbmtRjodSYEtxeNz_NST9+EyC96A@mail.gmail.com>
 <df473fde-e79d-ae90-37bb-3a3869d3aa9a@talpey.com>
 <CAH2r5msDX4eaGuyine__ePtOTRoSBDjiUN_dthaHpiA9UKm0yg@mail.gmail.com>
In-Reply-To: <CAH2r5msDX4eaGuyine__ePtOTRoSBDjiUN_dthaHpiA9UKm0yg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR01MB4445:EE_|BN6PR01MB3283:EE_
X-MS-Office365-Filtering-Correlation-Id: 99faaec2-dab7-4554-a99a-08daa54a9e31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: iChqZH6G//JiG7VHuqPHDXw8/7XlJICqT5dIhs0L+coiyqyYgD6aeth9EAKf93oexkCN3Y9BHkziJhWUKzA06BtFn4ViNQl0LLa+ZhQ7EeThX67ha+Ko65je51E7xhHHYpL5eRvjx3LGBr1ADPUv8ksl4eMwLHtU0aEATWbPyf+bRSa37oaULbKxyptBrv4fmQ3QxAg3YHbEb4846PVwi4AUv8wlLw7OEqTer+jXSQUPx7nWoP459rJaQyyVn1i55D8yaWn6rJtQwUiI2JPWV8zSniqwSIOeR5A2QHU+li54ut6djsOjXwq9svs483hW+tNrRjmvI1bjeFKum/zgxn4xZX01i/QTGFJ5lpzFV8X98+x+JklNP6zg3m/Ew5p1AfFNVv0KtvWaXkk2WZbIVD7G5p+1bx5urolhKhbaCUQ3TW+REOkCSjXFpF+xPNRKTanJd3eQW+rP4GuiZr00XtfvXwMIKaPCX7cNxyLNAq2JWH2k7/ZZJcJK48FaJWAoGUlDqYw1a5zSKdcMeEfvOnprGluGrF3nXGh3GonY1KNOaCEsgAk9YzZmTigqW8rXzwLOIk1vDy+TI5pyFofTaOuYsp4u+r31lkJnM7GrrnjKnqNAXqc1NiJ1LO1mTZj6dyWhS9n8Gn2NUN7reedjlKXcbCf3qWm243+CwlzmNZk4APeVeDOeh03tKsTrwEvcpCbldQBkQdKQUGcb6i4TJVZCxETtDhvorT2UerNnYm3VQQJu1JAcGIKqcwWFReTSbyYRrwlgeaWavna+kdm+aBtlN7XfOrGzknAD3fEJogo=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0kyQndvbFd3dEpGeUZJUmhCVHhSalAybGJZZWx4clpxVnJRVW5oK05pSVdw?=
 =?utf-8?B?TFd0NkQ4QXZaNXg2cGhUb3pqb1NUNVJwcW1STnp3bEtPQmlYVk5mMDlkR0tQ?=
 =?utf-8?B?ajUxYmE5V2xGWitJUDdGUmRyN3NCZElDMkltT3RETkxPSEJZb3NuVFdEazFx?=
 =?utf-8?B?QWVRL2Q4T0FHajBFV21SZE9ibU9MMjRnL1RmN1FnMTZrK0NIcVAwbHhBemNh?=
 =?utf-8?B?eWxRSzVadUwrSUpENFArS0tnSzV0QjA3Y3B5SlJyVXQ2d2NqY3BObk8xRERT?=
 =?utf-8?B?c2NtcTlKOURLN2NDc2Z2L1g2dTU4WmhpRmdDcGxKa2paVG5jZUJZTnVDeEsx?=
 =?utf-8?B?S09PdEZiUjgzNTVSUmMrYzZnQksxQndrcWltdjZLYzhwZlJIdXJTajZaaldh?=
 =?utf-8?B?ZDFxMDZHS1oweXZKdEw4T1l5QXdmS2VNb2U4T1h2RSt4cmdLaUtScjJ2QTE0?=
 =?utf-8?B?TG10WW5ZVlRvTDlJeURPQ2JtRm55dThtKzVZQTI4eWw0eDlDY0RWcWFScUwr?=
 =?utf-8?B?ZDdmVWpaYW0zTTNlMkJCdjNIK2ZPZE41R2M4dGl2RnNpelF3MlJYemJ0YzRI?=
 =?utf-8?B?SkhrdlQ0VTN1QWw2TWRnZWRFUklDUnV0aHJVSWh3Y0ZpNEFkYkl5eUE0YUxx?=
 =?utf-8?B?d1Z0ak44VzdGdVQ2RVNqdW1rMnlySUFGYmQ2Y2thalNQcjFKSUY4RUVYYnNG?=
 =?utf-8?B?NmJ0aTk2MHlOUVJsTXlkMEhDV2pGcnozYzVCelR2NG9Oa1lHSFZkR0lTeGla?=
 =?utf-8?B?aHFOUVI4MXJRaU8yRzI1UGsyOXJvSHFFSVl5QUVNc3R2US9hS01qeHozZGts?=
 =?utf-8?B?cDZtSnkySmx1aDZMV3g0RGlRZk51VGVYZkVhdUdQaWhaeHcyNnpKT3hCcThU?=
 =?utf-8?B?dFo0TkdrdmFVU1lxa1k5SXJ4UFRENHN5Z0FkelRoWjVwTEN3TWc4OHVUT2s2?=
 =?utf-8?B?dVpnUGN3MGdjQVM0VERlYmYrZW8ydmhVTm9ndDB2TG83ZjlaWjJrUU9DTU0y?=
 =?utf-8?B?amhlVDNqZnlTd1FkZEc1aWpSTDVGbTdEQzhZSGpqWDBTRU5nNjZsTUFMQ0NS?=
 =?utf-8?B?Z202L0g2cWZpK01qMHZWOWxxdkJ6RTVYaGxWS2J3cEFLVi9XeDUyQjVhbGpv?=
 =?utf-8?B?WXFwYU5uaUd1OVV2ZTdrVTYwbmhqaEtrODFZSEU5bGRSYjRlWjBsVDZjbm1h?=
 =?utf-8?B?R1hJRy9hZkNOWDY3NmE5QnFsZWNLazkvTE5SZWxya2hQUjZmV1YvYjJaeU5v?=
 =?utf-8?B?U1RzclJjanZMM3YvM29MaEI3Q3gxM25uMWFoUXRGMzB5Tk5CYk1STGpZSmtT?=
 =?utf-8?B?ZEdIWUdxSEVoZXdhOXc1QXR1L2JVaU5XbitLNHNQVWNYYm9OSHRzWkhvY2JZ?=
 =?utf-8?B?ZFRkRkVkUjRzQVdDY2NaZldsOEM1bitzN0dBL2lLRGtZR3R5ZmVsT2tXdmlH?=
 =?utf-8?B?VkxHT3BOVFhjeEhxMi9DWHdwK0p2cEZpYXI5Q25JZHlxT04wbHcwaUw5cnox?=
 =?utf-8?B?ZE1VRzVvK255Q1NsMFZ6cXJUVnlwUktUclJIdmNreEFPYmFWWWhjdm5UTzdt?=
 =?utf-8?B?aWpOU1c5K3o2bmNITkRiTmNDb0xDN25YSndLN0hZTTcyZWJLYlo4dDMyaEw5?=
 =?utf-8?B?dm5zQXlKaHZpdmxWaVlmaGkvMlFOZFFzK3hFbTlQbzVIb1Njb3R0YXZ4blVx?=
 =?utf-8?B?c05XNFlPWS9qRnFiS3dqT0t3Rm9SQUdaeTRpSEE4NHFiY0Z4WUxVQjd0MklB?=
 =?utf-8?B?YW5JcWZXV000UmNsNVZnVnhPYWNkeHlKNE1Da0tPR2hKSFhiaVM4d3d5VE1z?=
 =?utf-8?B?YXNZU2wwVFZvWldHdFZWUWp3OXFQV3lMQkZVZW8rdEFyK2VCdTl5c3BneWQ2?=
 =?utf-8?B?cEFyVjBCUmJFVzRaemJyYmIzNm5nV1Z6eFlLcHp2RFZaNDVWNlFQTHd2Y29Y?=
 =?utf-8?B?NURYS1d6RC9RcDMwY29DNXF4REZSdlUrRjB1TTNub0NGSlN5VnA3Y0VzdXdn?=
 =?utf-8?B?bUpVYWhCYUs3WFV2bzlHM1VKWCsvUjFteFA5Z01ZUkE3LzdnakpySkdBS1lz?=
 =?utf-8?B?VGRkNnY3ajFZUis0VXBvVzBrN3lkNVl4aTVVSUNpQ3QxRXdVMEFDY0NmWXcy?=
 =?utf-8?Q?SOzg=3D?=
X-OriginatorOrg: talpey.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99faaec2-dab7-4554-a99a-08daa54a9e31
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4445.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2b2dcae7-2555-4add-bc80-48756da031d5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eP7IgAdkD52tLDRbRy6O3vTvFoBsy5vVtAJZVxbBo/HQ7xrLkUVgytInD/GdhhR/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR01MB3283
X-Warn: EHLO/HELO not verified: Remote host 40.107.95.58
 (mail-dm3nam02on2058.outbound.protection.outlook.com) incorrectly presented
 itself as NAM02-DM3-obe.outbound.protection.outlook.com
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

On 10/3/2022 12:38 AM, Steve French wrote:
> On Sat, Oct 1, 2022 at 6:22 PM Tom Talpey <tom@talpey.com> wrote:
>>
>> On 10/1/2022 12:54 PM, Steve French wrote:
>>> Some servers can return an empty network interface list so, unless
>>> multichannel is requested, no need to log an error for this, and
>>> when multichannel is requested on mount but no interfaces, log
>>> something less confusing.  For this case change
>>>      parse_server_interfaces: malformed interface info
>>> to
>>>      empty network interface list returned by server
>>
>> Will this spam the log if it happens on every MC refresh (10 mins)?
>> It might be helpful to identify the servername, too.
> 
> Yes - I just noticed that in this case (multichannel mount to Samba
> where no valid interfaces) we log it every ten minutes.
> Maybe best way to fix this is to change it to a log once error (with
> server name is fine with me) since it is probably legal to return an
> empty list (so not serious enough to be worth logging every ten
> minutes) and in theory server could fix its interfaces later.

Ten minutes is the default recommended polling interval in the doc.

While it's odd, it's not prevented by the protocol. I could guess
that a server running in a namespace might return strange things
as devices came and went, for example.

It's not an error, so the message is purely informational. It is
useful though. Is it possible to suppress the logging if the
message *doesn't* change, but otherwise emit new ones? That might
require some per-server fiddling to avoid multiple servers flipping
the message.

A boolean or bit in the server struct? A little ugly for the purpose,
but surfacing multichannel events - especially ones that prevent it
from happening - seems worthwhile.

Tom.


Tom.


>>> Cc: <stable@vger.kernel.org>
>>> Signed-off-by: Steve French <stfrench@microsoft.com>
>>>
>>> See attached patch
>>>
> 
> 
> 


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 211037DCF37
	for <lists+samba-technical@lfdr.de>; Tue, 31 Oct 2023 15:30:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=pURbBgwM9KrfuCv/x3ktqwooV0jVOGWBAWat+a1p8mo=; b=GwXCOalpboZFI1TdPwkFbW2gUb
	gM6n+hko+gzHqvcQNXOQyITSTk9dVV7RcFAvAm+z+0rWwTnaw7mF31J4517tSJAeXaB8U6QhM58cl
	g+e0LB5Twr3cHsSzjm5E4hD3wL9+tx4nY04pJuhvM+YI80vHznRPyO+PzidFJhqL2/5k8XB6R+mCy
	8tAsBAMKx+LVrcl+PfgO1HliyJGBJqjfWGfn6JtMyEBh5GgHpHhT0Til0UfZWlxYVOwMwYei70D31
	DZq/aGCEtJ0/0fCnXQoygHpR5CPMNbOBXOsf60pgt/RdGNex5pft4mCEl83riJr1Seuu0Fq3loDEZ
	qTxIOAiw==;
Received: from ip6-localhost ([::1]:43464 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qxpkm-003hU7-1s; Tue, 31 Oct 2023 14:30:00 +0000
Received: from mail-mw2nam04on20604.outbound.protection.outlook.com
 ([2a01:111:f400:7e8c::604]:35168
 helo=NAM04-MW2-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1qxpke-003hTx-U9
 for samba-technical@lists.samba.org; Tue, 31 Oct 2023 14:29:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZccbAylb+PrVD3+ff+pgqeH6lu952qOxHT3K9JlTQWzojw44ffjcPdQQ9AK6GpQDW7e26LP9qsWOejPrQ48GqRFv45sB3jCecLN4L68OZ4sXAQRk/4dn4vdM40tMp5Z/YL25uqLBreWiz41E3LqgY7DbgCjUslfWlEbAY/yHPNkxZFdTSuPsi20BT9oSCGq3Do2kmetY/hWrQHSYD5hnt9BcBuWndUvE/Lbf9mJa66ApI9t1mwZ060+1UHTKomyZ8DW2nSPvjdEsPq6Bw9vgQzfkO+C9k1wJjafGqCLVvCx5lJafZznI4IOB79urlqxCvMfX9nvFt9uCUDc+QR/cIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pURbBgwM9KrfuCv/x3ktqwooV0jVOGWBAWat+a1p8mo=;
 b=fuSTYxL/DddlCtz16oGzXyXMHgNBvxTvP24R9vl3rgdD8oJaowd2cUf1q/wj1nAR8y4275AAMegVj+PSWBPRwbzjBFayvb3XVkWuj5rL6tivA/MVOitPGZFshcEA8Y+MagDWkQTOWfIPuQQuk509RA/pWbe9DCWuBJcSX48NuTpRbTMDYt8x5qItpJ41jfkPJXEMHSx+tZF9hFJV5uNF/2ihprexy5XBdpWOzAZyp4ntTC0DuJOPt09Jk1cmayrMqndbk1Ry9rjRB69YuVkK7EeEvnsBV0g87BbUpomPHeZSTZzWy8sprXnfSX9XhNwZPfQSD8IUQzd8PYCWFVE5gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=talpey.com; dmarc=pass action=none header.from=talpey.com;
 dkim=pass header.d=talpey.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=talpey.com;
Received: from SN6PR01MB4445.prod.exchangelabs.com (2603:10b6:805:e2::33) by
 PH0PR01MB8168.prod.exchangelabs.com (2603:10b6:510:292::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6886.36; Tue, 31 Oct 2023 14:29:34 +0000
Received: from SN6PR01MB4445.prod.exchangelabs.com
 ([fe80::1df3:d3b8:e0e0:b36d]) by SN6PR01MB4445.prod.exchangelabs.com
 ([fe80::1df3:d3b8:e0e0:b36d%6]) with mapi id 15.20.6907.032; Tue, 31 Oct 2023
 14:29:34 +0000
Message-ID: <4e2895ca-feb0-4086-b478-2dd8be83d442@talpey.com>
Date: Tue, 31 Oct 2023 10:29:29 -0400
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
 <6b020b4b-9c7d-431a-86d7-fe4ee01a0df6@talpey.com>
 <4b0104db-9a80-4288-96b9-fdcd6a37fd1e@samba.org>
In-Reply-To: <4b0104db-9a80-4288-96b9-fdcd6a37fd1e@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR01MB4445:EE_|PH0PR01MB8168:EE_
X-MS-Office365-Filtering-Correlation-Id: bbdf5a5f-38d1-45c9-14f5-08dbda1dcd4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: yoDg1YWsovoIy3Y73DrMBxVduMZ2nruAWmk0HZZljK5DZl2+3a7P4QPIKwc3vGnvD1HEqmeWL/hvBWO5jItXQfprCbzX2HxELL/ev2MjEMXDy0bXPzqu0/DujspTfpVeEnrp6Pe/gJKeKF6CmDkiJS1YQg4lOqaa4IpGt0WvcmWylnqaAP8lwl16a8MPIRkf7sQeqwzboMiqBeAOoFtXdne6goAkvYl6lnff6ECsy3bbXabOYIGAuP2T2wGZJKa1uEFIXv+Ws2sfyM0jfWle8Ye1EY+DfLRTdWlICirKh5DtX//mFL//QCj1sMTg8O9uaL41iAYx4z0EerrKQGfr7HHVN2psFLhuWAznBHIoV5QLJrITlf+KnkISE9Sc7pRu9FuX9aFWqSVRYMJyJ7/VmonALmXbL2kLwpXfSOCUs+Rn7xZts9ml++OWkMVhvzBDocnmnFGaBR11qD5P/4VWxlt8lzvsh9MKM2A+HXQAb/n1BfrkR2IqasGgDKZhjqX5O82fLgK4cU0flIu7Pxjo7QHyqdhYGUXiLg/BvaU8NqNoo9Fi8eSqNKpRvaU9a7AQcCYldTDxvAo546JM+pypP8O3kL+FGIfq3JRVjWleoVGqCmFGS7h8Guh+L0L0biiY
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3pBU1R0TkgvczdoOUxxUzkvSVpITEVGekVqcDA0QW9veGlpajNIMmFHSXFE?=
 =?utf-8?B?bGlmMjkycFJOeis3QjlKVjgxWi8xajY3MHlqNkx2SUc3d3k1TDZtSHNiVkVT?=
 =?utf-8?B?MkdnV2R3Skx6WTZObUFOVUkzUjhSNkFvMlpOVXBnTTJjTmQ1R0ExVi84OTVD?=
 =?utf-8?B?TzRWMTd1V2JvSWZndHAzdmo4Y0ZNL3RlczVka3ZJY29PU01hSitIZmowb242?=
 =?utf-8?B?ZDA0SnNIb281aU1wN2ZyNkxrMEFoczg3ZFRWcnhRM3hDMUpENk1ZTFdPcDcv?=
 =?utf-8?B?azZQLzlrbmIwZ1JYTWFKTlkyL2pDa3c5Ry9XdHFhN3FiYjJxOUhOVGswTmwv?=
 =?utf-8?B?cEN0TUQyR2Rna2o4cEtkZkh4TUNCbWdiOWljY0w3SE5oQStheFlyaDk3YUtT?=
 =?utf-8?B?aGsvRmZTenhITnZIWFk5dFFseXRpekk3ejBpcllxTWluQ0RJMkd2WlNONnNt?=
 =?utf-8?B?VTdKdlh5RHZpQlV0dEs2WklJa0VMcFBhNjBxanZGdUxkN2wyN01jWmFPaGN5?=
 =?utf-8?B?cS9YV3drUWYvQzl6U29RcERuMHc4MUs4TzlyT25iSElWQ3BmdmxYMEZwd2N3?=
 =?utf-8?B?ZHVRNkh5bUlsakk4MWdsRjY2WnpxS1dPMndQR1UzVmUxSlV6VUZCTXVodVJX?=
 =?utf-8?B?c0o1TlArSjRmZVFJbXZqVHZRU1JURHE2Nlp1T29nSENFSWo4cjFYNWpnV0J4?=
 =?utf-8?B?bWNYYUJXdmQ5eFFROGZwZDBlalQwRTBKRExwTmZWbDlVOE9VYmtSK1l3dWVX?=
 =?utf-8?B?Q0xBUVNFQmlEaVFTbXM5RW53TGxqR1hQMjZ6cTFSYU9YUkE0L3NhSFlVZkhE?=
 =?utf-8?B?Z2RtN0w0QnBLUmdaaW1LalBDT0VoYnB1dUdqK0VuaU9Ba3UrMlNpNE43THBh?=
 =?utf-8?B?Q1VRdEt0T2tkK0dRUmdtZ2lRYTJkbCt4NW56NzQyb3IzbUFPaFFOUjIrNnlN?=
 =?utf-8?B?ODZTOUpsVEUrVEptd25YamVXYnZxTTVlUGNELzdOeEVtK3k2RlJIMDFzQXJ6?=
 =?utf-8?B?VTQvYzBpWFh0QTE1WDZHbnlZUlNBd1U4cFlhK2hqVWZ1a1B3OGtDVmltUTRt?=
 =?utf-8?B?NDNJaHBuVTJxWDArdXJXeXNzbEU1Y01IR3JYcUZLKzVEby8rV3duYVFrRFd4?=
 =?utf-8?B?TnpMRGxQUFlvYk14WVlwTndMR052dWI0UWU2Q2R2THZEQno0aThBajZXMmdJ?=
 =?utf-8?B?SmlDWFVPS3Z5UDRBcmQ3R29RTDBaVFcrVHNBUEhlNFpPMytlemw1YklLRkJB?=
 =?utf-8?B?UGthL2QvWGY5d0llMWlhS0tINURsWUV3NCsrZ3Q5NGRwcUFabG5QWWlCWHhj?=
 =?utf-8?B?NVlCaFY0SGs1RExsbkdVTG8rRFl4RHEvN2N4ZnlrQ2dkb09ZSWluT1dtM3FC?=
 =?utf-8?B?a0JaUVlkR2JPelVVckw5ZWd1N3ZGdkZVNERKVGNMYXhGL2E2SURlbWJmT1Jj?=
 =?utf-8?B?b3VUWElzbHk2aXVpNlhTWXpzTlVTcW9URHV4QnprQjd5OE9ZbXlneE0vY2I2?=
 =?utf-8?B?UW4vYU9QcEptTTRaUEhwdDhyVkF0MzR5UWV6RDRZZHJKblIzbDdOWlFXamtC?=
 =?utf-8?B?alNTYTM2K0tXWnRFQlZnSzNOTkdoY2NqNEpPaUI4ckJXUVd1WVljbHo0UVJN?=
 =?utf-8?B?aHkyekhheEFKdmNwUkNpZVdCQ3BXMnlhR2c3TDQyM3lhT3BLdCt0OW1HK01H?=
 =?utf-8?B?a1RKVmt4NERzbnJYSjdhNzNJcSs3eWNFZnJlSWZ3ak5DVjNtU2JrZEk1VU8z?=
 =?utf-8?B?UDdTa2owRWtSb2xVRVNyRXlOMVpTOUZRa2lLVmc1bGJPV1NOYUFwbTdaTndq?=
 =?utf-8?B?RjZ4VzA0QnM3ekt3djROaXdmSVVUWWhzYXRXZUZxVUF5ZHBwd2hHNjIvUmFz?=
 =?utf-8?B?WkFDYVlYbURJOEkxK0V3YVBaU2NyaERNcDQxc2x1b2JnU2huaWQ0b2NENktE?=
 =?utf-8?B?dU14RE1OQW5IK1dIQUlDWFluUzJTVHhUTjlJK1A0MGFwTTlBN3ZyZjJVdEhn?=
 =?utf-8?B?WW40WlorNFVQV2JTcFlBRkJiWWdLRURPU0lZYnZpVDVHZFNxTTVMWEZUUXI3?=
 =?utf-8?B?TEQyT0lIbVp6Q2JGVUg0aGMxZTFCams0Z0FsQkdaYlczRk5ZN1dTYmVPY2J2?=
 =?utf-8?Q?P5/AnNp5iHtoctU4DbWAzNY4d?=
X-OriginatorOrg: talpey.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbdf5a5f-38d1-45c9-14f5-08dbda1dcd4e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4445.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2b2dcae7-2555-4add-bc80-48756da031d5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OoE88XdXv5mmMeqPQZSPzIfnroGPp4uO0AH1VtvQoXlu3VoFPGP76JEsPLRZdPzU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB8168
X-Warn: EHLO/HELO not verified: Remote host 2a01:111:f400:7e8c::604
 (mail-mw2nam04on20604.outbound.protection.outlook.com) incorrectly presented
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
Cc: Volker Lendecke <vl@samba.org>, Stefan Metzmacher <metze@samba.org>,
 Steven French <Steven.French@microsoft.com>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 10/31/2023 9:28 AM, Ralph Boehme wrote:
> Hi Tom,
> 
> On 10/31/23 13:48, Tom Talpey wrote:
>> On 10/30/2023 2:53 PM, Ralph Boehme wrote:
>>> Otoh, in the case of Samba, storing the DOS attrs in an xattr in the 
>>> filesystem is an extra IO syscall.
>>
>> Isn't it even higher overhead for the client to be setting this?
> 
> it's not about client initiated setting of DOS attributes, but 
> implicitly setting them as part of SMB2-CREATE (and similar protocol 
> entry points) processing.

Oops, I forgot to context switch from client to server. :)

I still agree that managing the archive attribute is best left to
the filesystem. Should this be a VFS behavior, perhaps?

Tom.


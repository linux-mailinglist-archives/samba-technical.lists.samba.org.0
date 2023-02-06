Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E851868C773
	for <lists+samba-technical@lfdr.de>; Mon,  6 Feb 2023 21:18:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=CSBg5sR6hTNo5jjRsTfFBdSjhXQ1dP7TzBnnwVWOW6o=; b=EklFYCTRw/WtpVNX1HDqs7Ut/5
	KhjG+trLu7QTao6yos3NODExOkOgWEK2wawCDGToJoDppnTX2vclirawU7j9P4SrDE1TWLzJrh4Ta
	D7ZMCmJakZw2zmiNuApy94/7h/c8+2r5n6eR+FuldhiwvFgjjE4RKZqQZY5o5SHjw+KrIkVXawHh2
	mD6pjWUkvgqbOrEIIaeLYcxunUGliT4ek8S5Gl16dWZSxuyvhHFMhU7rrUY4QZDZW/dKyCj+xL8H8
	+aLWaCRKYBvP1gdAE/qlv/HAYCgPVCQnpwsr9gM0rlZrHq46Yfeh9IUx2T2r9VwmZSPKqiK8ZCmGN
	c36Ubeug==;
Received: from ip6-localhost ([::1]:45680 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pP7vl-0091tw-7Y; Mon, 06 Feb 2023 20:17:37 +0000
Received: from mail-mw2nam10on2047.outbound.protection.outlook.com
 ([40.107.94.47]:16545 helo=NAM10-MW2-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1pP7vf-0091tn-4Y
 for samba-technical@lists.samba.org; Mon, 06 Feb 2023 20:17:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dm358TU2GRaHDnqkEGOGXd8fzwE9B62DhDcIarDqpvJHS2lp/0L0jGWaBj1PJ7RjOHzwbbbI2/racZNLtacPcOwewASdfXV+YV94wCyM/cKPoUcywZSqbNq7tQQfRLMTCPFHJeHTCoztf4WTrsOD0xZ/a9iuPmH4wIve6pvdzokYhs8BmqtA8TlArDVhTAXFwNeaPVn7LRX4+yLCQbbBj5BF73Gqt60nDs9eX7zp5uc44BvCxp+1jB2qf0KeFUQiBaKpEpjOBGbW4AJ2soqfqw2/FjfKShNVAk0JFTt2DGWu9alubWF3+qIe9RNra42b6BPgT1dkeqHWtzoAKZdgEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CSBg5sR6hTNo5jjRsTfFBdSjhXQ1dP7TzBnnwVWOW6o=;
 b=CPlflxLMe67arxQYCy5ZXd4jM1V30RGQSBvs2ZSK+I4nHxB0yHgFGil/8neF31J3EzzijoltfvLOBiF79jP3DnXLh1WfQN/TNzOcCU4WCGzFGxkDo1shcX2cDTvUab9+GMflYEM9ChhISKYSOFVTjbPg9eY3jBw5bKEjeTWl1DekM/3VVu11dX2A09BW3wQys02nPoIgfRo/1qYQOAExnPVMu4mjJHF2QrCJoT2cz/D56nBMSB33d6MJEcS0zV+6PavLcTiKlMmb5gGbS8HTwouze93g3In2AjWAXesSlREQOTPVOZySAWWdpeVjArTeusmnr+xrZRcTVn89TJz+0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=talpey.com; dmarc=pass action=none header.from=talpey.com;
 dkim=pass header.d=talpey.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=talpey.com;
Received: from SN6PR01MB4445.prod.exchangelabs.com (2603:10b6:805:e2::33) by
 CY1PR01MB2090.prod.exchangelabs.com (2a01:111:e400:c610::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.35; Mon, 6 Feb 2023 20:17:13 +0000
Received: from SN6PR01MB4445.prod.exchangelabs.com
 ([fe80::e58f:c83c:6b17:d3ba]) by SN6PR01MB4445.prod.exchangelabs.com
 ([fe80::e58f:c83c:6b17:d3ba%6]) with mapi id 15.20.6064.034; Mon, 6 Feb 2023
 20:17:13 +0000
Message-ID: <f359b643-6754-3cef-ef8c-c2a6989ab37a@talpey.com>
Date: Mon, 6 Feb 2023 15:17:12 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Does the CreateDisposition flag of a client depend on Server's
 response ?
Content-Language: en-US
To: varun mittal <vmittal05@gmail.com>
References: <CA+RDaRC68P7Sfa80X9Z6VFyYnrvoxvC-hLGh=X6BQuXJW9jO8w@mail.gmail.com>
 <6b9c96ed-b116-3cdc-d361-44662662626c@samba.org>
 <Y9QgJwNzUh9EQFQV@jeremy-acer>
 <CA+RDaRCMPnsbg9yH9ciO_uPErDm_pKa+_fZtLtu0JbRpPkJUnw@mail.gmail.com>
 <Y9QuBd7wf9hfbpT5@jeremy-acer>
 <CA+RDaRAxOKK9FmwOFrh=ZNkw1ZP7xZiyah=NjKjjxvs7HnK7tA@mail.gmail.com>
 <CA+RDaRAY7WLbZf=8Bp=jA0X435SvoQLFv7EK-WcbFCpPy67S4w@mail.gmail.com>
 <Y91JdhAtd41n9C7O@jeremy-acer>
 <48083804-dfef-7348-7e8c-9bc10fab9db3@talpey.com>
 <CA+RDaRAUAhjM9CDuJz13HKt9GcbDhMR-HW3YPTpWuMGPLQU-FQ@mail.gmail.com>
 <a395da31-5812-9fb8-6857-7da0bf1b8531@talpey.com>
 <CA+RDaRDGLQya8TzsUrBDR4vV28HcoxsEaJSE9_r9bn_Rc=f9BA@mail.gmail.com>
 <d59214c5-6917-94ca-0608-1832d8de916a@talpey.com>
 <CA+RDaRAhOz6h3K0H_WuMC+AOuywBtBuGtwgnm7AbkiEJpNGUnQ@mail.gmail.com>
In-Reply-To: <CA+RDaRAhOz6h3K0H_WuMC+AOuywBtBuGtwgnm7AbkiEJpNGUnQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR01MB4445:EE_|CY1PR01MB2090:EE_
X-MS-Office365-Filtering-Correlation-Id: 3267dbda-4bc0-427e-0a2d-08db087f224e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: zbir4+oHv8FVk9OeO3xkdxG12FRKav8C5vsohUAUv/O7TYSTfcC8QVafY3GyNbP+7mrNQrxACWiXR5wx3U57Wa6lNSWe9hDiLzTYkRdqDXIluapG3jHEhlo9VtfJrCcw3aj59mlIONYlMn2aan4p6Xeb1z5AmCVk64qgcwky1fzEMq06HVHTRA//1CufnHfBjrvfw4a+Iucj0nt7PAxgNqWMOPiJXsEKU1aQHJ7Z20JK4n4sz7ywZAVDfNUBOxag8+dNhA55Pa2xKtTWGFCTy16Ckfxi5BNUBEv3Kij/MzcVZnOQqhdfSrZE2fDIABjXxPsh/IdVYG602yox2zGkrmyF13oKR28wfI47bkGJAVsAwZzZdKTMUiWVqn2FmPO11CohUi3ZtsgPON0HTezn21Wp6iwiYvjwZBOcW6azMoxa26+Sbo8eU+37EuBJE0DAbWeVd1YQGqPaSgnXV2LA27lfTjRNHSI/PD0ywglKzz33MN5eLjLvXfilCEHGe42BzFUaP3K4wuyMTk6yT26Yd1wjj6HzEoIxgxeVkD8JqNrgeAA17hsWTHD2WOlfMoVwS/Y+Asz6LDoSyKl+XRSX7+IPHT4l1LlcnrwSE/bcPJ26dXWbAy12MdjnxFPuHlnSgoIQqtf2ov3vIZBLjvDV1taKw0vszS+dzuniwqxEb6BhsIR/puZHe3E5sTBhtSCMbqJbXdEnvWJ2d9UbSgnzxZAu5hyUdBXFDG7vX0N8KvK/llkPdYhWHRTCG/tAhDqziLMkaCJkUCxvc0mK93uRRQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L21PSTdRa3JvaFFOZHRWY09kV0Y2aWQzSVVhd2I3VGMwT2w2Mno1M01wdE41?=
 =?utf-8?B?dzFVSXNxRHJQNDhXUGRtN21zZUYwdXBlVXZOa3NRcndxbHlMU3ppZmY4MUxm?=
 =?utf-8?B?aDJwaEtHWlFzNCtvcDEyVUU4eGRPVE14S2lWalM1MVc1V0VPNW5QN1hWUm4w?=
 =?utf-8?B?QjhZYVZBOWtReGRWTkkrR01pMnorTWxsMWkyZGF3NFgzVHZCNTNpV3p5cjdT?=
 =?utf-8?B?dW5oYVM0eEdkWldtaVZ3ZE5nTmd2S0Nqem8yeFFDSEpFV3JXZk5PWnU5UFg0?=
 =?utf-8?B?cEMwTXRzMHJqRTRPdEpxTVVoUkJpdGlXZUFLVnJFZUJIVzI3L2huaGhJQzNO?=
 =?utf-8?B?cnJTRmFnR2ZtSTdWS05mWkdkM05xQ09JdUtNeXJpWXMwck4rNjRoVEUrakNT?=
 =?utf-8?B?N0Nmbk1XbFc3TjhBVWZjcXJsVzljQnBHUmlQRzhEZlI2VVhHNCsvTEdPeVgw?=
 =?utf-8?B?emoveWwrcXdkU2Y2ZitQTytoNmNWd0pDNXh1MTNzdXNNS1l5dm1PSk40dVBF?=
 =?utf-8?B?a3hHN1RIT3V4OGxFYk1DVG1pT0NkVUZ1d1lzVU9ER2YzQ0svajRYbEVuNk16?=
 =?utf-8?B?U1hncEhBUzhqZ2pRcGM2OVYzRWhLNlI5YWxxZTdxT2p6U0xBek1aVjJ0enhN?=
 =?utf-8?B?UGxrR0YwMERNQ1JTUUs4dnFMbVdIUndUalZkYmVWM25nZ3hHcmZkbmhwUlJh?=
 =?utf-8?B?c05mMzVvMHU4YkN3Vk42ak5yRHhpNTVnZHRSYXF3SWxsZTJVK3I3Slpybmlq?=
 =?utf-8?B?UDIrWGRWaE8yclNST2xyV2RmelRoNUtqemk1Z1ZHczZMQm41b3VFN3V2K1Vv?=
 =?utf-8?B?eWZlWG1rK1RlRDJnOVdEMFZJUVp5L2s1citRTGtxYXJSd09xUHc0NFV5cXVP?=
 =?utf-8?B?Y2pNQSsvRnB5S3RoNG02NE5LK1hqUWxOVjAwNUw3Z1RHL2wzbk8ycTA0QmQy?=
 =?utf-8?B?ZXY5TlZVblJFQ3k0Y0tQdWNwc3B5R2J5eFFOMEYyQld3TjRhSng4VXRGY1FD?=
 =?utf-8?B?NUlVaHBwM2pJalFiYkxCdTZHajJuL0dVR2FWVkpCczZ2MlU4enU4ZlNJWWlN?=
 =?utf-8?B?ajV2T3FHVWMwVkpJd1I2aDNjeFJVQ2c1YXhGY3JCdlczTy92S1c2SGd4ZTV6?=
 =?utf-8?B?RndCRmVpczU0dHVEOHVTYzNxTkt5NW5LL0xoTC9sOHAzYzRzeW1NelkvU29V?=
 =?utf-8?B?SlduMHZpeEZDZ3p5bnk2U0Q1OTNRVStnSDJGWXJzbnN5VnBTQWFkOEhGZm03?=
 =?utf-8?B?blpQS1QxOW5rUzhVWk44RW5wY01uZUdtZ3hwRVBDWHV6dXZkSVM5Z1NXU21P?=
 =?utf-8?B?eXI1V2dBTHpmamhRN2lVc1JUMGN6cnBnTFdocjY5TTU3bVl1VDdxY2MwSUhY?=
 =?utf-8?B?OXV2VDRmbE56djdUOCtjQnVvQ0Z3cWYyQWovcjJDMlhnbDdqWTFJejZjVjFR?=
 =?utf-8?B?MGlZV2RtZm5oVEEzVG0rNEdWU0RkcnI4UkZ4L2d3bG1GazlPcnVocWNTd3JO?=
 =?utf-8?B?L0tIbGY1V2VMQURaTDNTTk1waFdJUUFKRmhHWngvNDZ2cXlXNUVqemVnTnRs?=
 =?utf-8?B?cFF2NmZJZTlRYjVBQmljSzBIZURmbGNCM2VJZ3hBak1KYS82eXg1eTFzK1Q3?=
 =?utf-8?B?R0kyMzRDMUEvUzlHanJ6V3BaRndvZzVsWXgwMTU3T01KTVNOcmFhM0tUQ3FR?=
 =?utf-8?B?b1poRlM4UEpOL2I2bk85T2p2ZlVPUFVoemNLbVJtNE8raFo2STltUG9YcEZB?=
 =?utf-8?B?eWJpOFlENkEyZTlNeVl1clNkOHF3ZUdkZU15VDJ3aUJ4WmZHRkZIWEJPNmxs?=
 =?utf-8?B?Q2pqU3BzN202MVJSTnpXTyt4RFhLbFVLRmxIRHJjVEJRVVM2ZGNWeE5ya0dT?=
 =?utf-8?B?VS9VbUtyTllDZ01oUUpJWExmb1UyWXFUaFJtTkpIMFlMaFZuMStjNS9JS3Av?=
 =?utf-8?B?TFZuaEVMYit3Z21uTnQ3UmV6dGd3S2xvZmFTRUpyRUdFRFZZaU55OGJRMU85?=
 =?utf-8?B?Y0xHdzdxNDFSTklSMTNWeDFjRTJaZmtITlNHZU5HVXhOWXJmUUJnWmo4czRS?=
 =?utf-8?B?RnBVNHlZVlhxdVlYaVg3VGJtcjBUd0dYMmRweXdodWtBQTdUQ1dBdkZrRUhs?=
 =?utf-8?Q?AeICa/49d7ETac1gJG5veLy6k?=
X-OriginatorOrg: talpey.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3267dbda-4bc0-427e-0a2d-08db087f224e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4445.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2b2dcae7-2555-4add-bc80-48756da031d5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ge4Y11KhAVIcbm5dSZOgYeQjc2o8J7NDqJKyhKJabYCbSFlZKugmf4BMlRzZ9+++
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR01MB2090
X-Warn: EHLO/HELO not verified: Remote host 40.107.94.47
 (mail-mw2nam10on2047.outbound.protection.outlook.com) incorrectly presented
 itself as NAM10-MW2-obe.outbound.protection.outlook.com
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
Cc: samba-technical@lists.samba.org, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Sorry, I missed that DCOPY:X fixes it. Weird though, since robocopy
isn't copying the directory in your example, just the file.

Ok, definitely a robocopy thing, not a protocol one. :) Thanks!

Tom.

On 2/6/2023 2:19 PM, varun mittal wrote:
> I observe the same behavior with my Win10 client and Samba server with 
> streams_xattr.
> 
> The /COPY:DATX didn't change the behavior for the directory, but 
> /DCOPY:X does as I had
> mentioned in my earlier comments.
> And not sure why, but only /DCOPY:X does, if I specify any other flag 
> like /DCOPY:DAX, it doesn't :)
> 
> 
> On Mon, Feb 6, 2023 at 11:24 PM Tom Talpey <tom@talpey.com 
> <mailto:tom@talpey.com>> wrote:
> 
>     Aha - ok, if Windows-to-Windows is broken, it's in robocopy.
>     Interestingly, I can't repro this from my Win11 system to
>     a Samba server with streams_xattr loaded.
> 
>     Yes, I'm aware it's the directory create that fails.
> 
>     Maybe one other thing to test. What if you add the "X" copyflag,
>     which turns off copying streams? Perhaps your robocopy.exe will
>     ignore the filesystem stream attribute and use FILE_OPEN like usual.
>     It's purely an academic exercise though.
> 
>     robocopy C:\Users\mittal\Downloads Y:\Shared\Folder1\Subfolder
>     <file-name> /COPY:DATX /R:1 /W:10
> 
> 
> 
>     On 2/5/2023 11:44 AM, varun mittal wrote:
>      > Hi Tom
>      >
>      > I did test it with Windows share too and the behavior was the same.
>      > But please note, the FILE_OPEN_IF I am chasing is for the Directory
>      > and not the files.
>      > In my case, the source directory doesn't have any named data stream.
>      > The files in the source directory also didn't have any ADS. These
>     files were
>      > generated locally.
>      >
>      > On Sat, Feb 4, 2023 at 7:38 PM Tom Talpey <tom@talpey.com
>     <mailto:tom@talpey.com>
>      > <mailto:tom@talpey.com <mailto:tom@talpey.com>>> wrote:
>      >
>      >     This is worth figuring out.
>      >
>      >     Because it's a file in your Downloads folder, it was probably
>      >     created by a browser. This means it has an additional stream
>      >     which indicates it's from the internet. Defender and other
>      >     tools use the presence of that stream to throw the "Do you
>      >     really want to open this file?" dialogs.
>      >
>      >     When you copy the file to a non-stream filesystem, that stream
>      >     is obviously lost, in which case robocopy is not going to do
>      >     anything special. But when copying to a filesystem that does,
>      >     it will take a different path, copying everything. Or maybe it's
>      >     the fact that it's in the Downloads folder, and robocopy is
>      >     being clever. Or just a bug in the Win10 robocopy you mentioned
>      >     you're using.
>      >
>      >     Would you happen to have a Windows system with an NTFS share
>      >     that you could robocopy the same file to, and grab a trace?
>      >
>      >     It would give us the breadcrumbs to figure out what's missing.
>      >     Maybe there's some other volume or filesystem attribute that's
>      >     missing, and confusing robocopy.
>      >
>      >     Tom.
>      >
>      >     On 2/4/2023 3:17 AM, varun mittal wrote:
>      >      > Nothing fancy, simple copy command:
>      >      > robocopy C:\Users\mittal\Downloads Y:\Shared\Folder1\Subfolder
>      >      > <file-name> /COPY:DAT /R:1 /W:10
>      >      >
>      >      > On Sat, Feb 4, 2023, 8:05 AM Tom Talpey <tom@talpey.com
>     <mailto:tom@talpey.com>
>      >     <mailto:tom@talpey.com <mailto:tom@talpey.com>>
>      >      > <mailto:tom@talpey.com <mailto:tom@talpey.com>
>     <mailto:tom@talpey.com <mailto:tom@talpey.com>>>> wrote:
>      >      >
>      >      >     On 2/3/2023 12:50 PM, Jeremy Allison via
>     samba-technical wrote:
>      >      >      > On Fri, Feb 03, 2023 at 08:51:57PM +0530, varun
>     mittal wrote:
>      >      >      >>   I was able to narrow it down to the "Named
>     Streams" bit in
>      >      >      >>   "FileFSAttributeInformation" response.
>      >      >      >>   When this value is toggled from 0 to 1, as is
>     advertised by
>      >      >      >>   `streams_xattr` VFS module, Robocopy
>      >      >      >>   switched from FILE_OPEN to FILE_OPEN_IF.
>      >      >      >>   Thanks
>      >      >      >
>      >      >      > Thanks for tracking that down. What strange behavior.
>      >      >      > I can't see why having a stream would make the open
>      >      >      > change to optionally creating the file, but it's good
>      >      >      > info to know. Thanks for posting the follow-up to
>      >      >      > the list !
>      >      >
>      >      >     It's not the presence af a stream, it's that the fileystem
>      >     supports
>      >      >     named streams. It's getting that from a
>      >     FileFsAttributeInformation
>      >      >     on the root directory.
>      >      >
>      >      >     Robocopy has a very broad range of OS- and
>     FS-dependent behaviors
>      >      >     and optimizations. I bet there's some combination of
>     its 1000-odd
>      >      >     commandline options that can change this.
>      >      >
>      >      >     Varun, what exact robocopy command are you seeing this
>     from?
>      >      >
>      >      >     Tom.
>      >      >
>      >
> 


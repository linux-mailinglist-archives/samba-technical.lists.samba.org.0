Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 486826C691C
	for <lists+samba-technical@lfdr.de>; Thu, 23 Mar 2023 14:07:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=YoyJM7oAWbeVFHfWxZyhrbHjf+YBSkENWSUFSPa1CTQ=; b=IWicxjCjmYrAKiXkDlGPtVS0iB
	6I9Ljp7pazIgTNSMs58ZeUFLaKkxSnHxNOlgW40QwL8tZr7cq0Ol7lGhfOhjNzIjaN+w11i7ZpU9X
	yMwe2o4750DINWqlguI9kGLU76vnENGBRnb+puXz3QUKwyBkwrj2nnd9xKU8ADrJoj8Q98iLqKxN9
	1lMGiCRgsZLCwF5F/qnHPGKQThUcps9rJsW5+VuOoP/7CzQt0biglRlCgYrkWCv6Nbs246pUYDHyE
	6gkaGVCIOhUr1Qnm06pn75AWAIkTmjZLdMKvV43jErka9+NSLeqZIO5UsojwP7ID4/E5QYp2dz3nM
	0y8ELEAg==;
Received: from ip6-localhost ([::1]:64084 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pfKeV-0049Lb-Bb; Thu, 23 Mar 2023 13:06:47 +0000
Received: from mail-bn8nam04on20623.outbound.protection.outlook.com
 ([2a01:111:f400:7e8d::623]:59584
 helo=NAM04-BN8-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1pfKeO-0049LS-6N
 for samba-technical@lists.samba.org; Thu, 23 Mar 2023 13:06:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mOvKa2Mn+qS1JBAALZpX2dC5kxJyprJ9vvXrv86yOuVok1JNedDsVuOldXtpg5iQeVqcdKUhIudiiDiyccktCkA24tL3uW9EW832YdKleyiMlDu52FJmiXF5dI9eomK4wGf8F3J1qfvzHFAeKeVkCHBcQVNrZtF2DCTZwDJDHV5niFEmfKWjcLvHtSkv9iviLSzd7wD+ixhMtS0CyRNqQJ4yOYdm0nyAMiTtl5kxJpwz8CEg354OTWK8dqKcDi30NBmy7vM67YVc2MurkNdbiVU82powipRxb+SUQTRz4nenVBIDtb0KtvLZZn5doNFcE4Y99yfZn8KAuYi9nZZ96g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YoyJM7oAWbeVFHfWxZyhrbHjf+YBSkENWSUFSPa1CTQ=;
 b=OhTeNNMMP4DuOHhUKsI3ZSqpAJ6+U0Q8WaUb5TSZBIBb1RuUZ+qzLzrJZfusM8Az9LUVg3ozrzdgEYvqG7aSQzDwhDpjixObK5TgZh2krOrk8Q1n0y6w5lJ7N40OMBbIQqNhellmTawaFcguy4ouvJDoE1ZNNXhhaerTUCrXl1aAS8uzmum4OLdb4sIr0LNMsh+JWaAlg1Z6uxC58GSVlWWZ2AESk6GnLADBkA2Yale1GXTNt92S4tWoYONAPYwsyVOoy0fZeeOM1JJDe/IO700fLJ513jfN7qMdel3/ewPGlmZaHRcHFDf3pzqWo97Lgm3Y2goaAs6ukOWxYdSm8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=talpey.com; dmarc=pass action=none header.from=talpey.com;
 dkim=pass header.d=talpey.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=talpey.com;
Received: from SN6PR01MB4445.prod.exchangelabs.com (2603:10b6:805:e2::33) by
 SJ2PR01MB7936.prod.exchangelabs.com (2603:10b6:a03:4d3::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.10; Thu, 23 Mar 2023 13:06:21 +0000
Received: from SN6PR01MB4445.prod.exchangelabs.com
 ([fe80::1d6d:194:ddc0:999d]) by SN6PR01MB4445.prod.exchangelabs.com
 ([fe80::1d6d:194:ddc0:999d%7]) with mapi id 15.20.6178.037; Thu, 23 Mar 2023
 13:06:21 +0000
Message-ID: <bbb33b9e-570f-8d02-1162-fa93fbe006dd@talpey.com>
Date: Thu, 23 Mar 2023 09:06:19 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [cifs:for-next 3/8] fs/cifs/connect.c:1303 cifs_ipaddr_cmp()
 error: memcmp() '&saddr4->sin_addr.s_addr' too small (4 vs 16)
To: Dan Carpenter <error27@gmail.com>, oe-kbuild@lists.linux.dev,
 Shyam Prasad N <sprasad@microsoft.com>
References: <13de0bf0-aa74-46a3-8389-3c70fe77be1f@kili.mountain>
Content-Language: en-US
In-Reply-To: <13de0bf0-aa74-46a3-8389-3c70fe77be1f@kili.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR01MB4445:EE_|SJ2PR01MB7936:EE_
X-MS-Office365-Filtering-Correlation-Id: d54fea8d-0df8-47e2-a336-08db2b9f65e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: nGWHA1gjkHiSX2A+f08NUvTJpLSAVXurWZcDZbJ+p+v2slU8Gk3GaCIhdXL0/YI9Y8nriIpEDpQx1VnkoRojOlbOU1rTgecIMJnlWbXxRhoZ5YIHyjKuHONsBHXxa0GGis6joqtIL+5mCAJtkGWGl78n/wCJ2HrdUqtttmTtd+IcfCNgkqyLDehWWv5ehH659Qjm/IhivaA/z8dv67ys++qt0deTg5KBO5ncL3EWtJhX6Ls+jp+MZRmJue6E8VV6Xt3kNGZ4QkmPjehEqfM/G+PPrGXFBZ7cXNaRHcHa5Zuec8BDKB5kpotVGEVN40bvvR9LIJ7luNQWh3FtGFBWHr11wc5XzZgMMTMj2Q9ykKMwtV9bZUvfpqeD45vIJAS7SErc948rp4SoCuz6XqnDDsyLtTxSK4iR6KpqwRM15txb5eaEAsbgsBBVBklXxs+Q78qIfPJhC551jeXzqxsJ8d34Ssa/oa/9mA9NdYnm9pqv2TRgur/5RJWhWTKKTqvQqKyOOu2MYzJUMaPJ9uQR0z1N5uWjixJedTnqBjRF6r4eojEBzz5G3dmAtmzJ6Tdx0aszzRatnmJJmz4oQCVLbssHmPr1eMHCEGtE82Bfj/JbZ+5bST6xNxff4JVN/EWHhI3ldebrQ/6ejXeKynoDA34TljR6J95sRrgzy2pSm9U172xbMkOXEW534Uo6TltLOnMw4YVvi6ethPdVa/Qgl0iYOX7OQYj6sBR+X6wKwZ58gl3C3imv1vJ9CtKzJTi9h5Ne/lfgo4kXleJQHSbdpw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlIyMCt3SktRODF6VDg5MUhtRlQyNFI0eXlTUVJiekZDeFlUUXRGQXpJcXd3?=
 =?utf-8?B?cmxxcXR4L3B1eTFlcGJZbGZGMFVCTStGRmF4d1FhTi9PU083OWJuUDhBcEl0?=
 =?utf-8?B?VXFObU9mN1RzOU1jL2FkNVp1emJvQnpMbUhKdXNtNGdLc1FZWkVJQlB6MnZH?=
 =?utf-8?B?VjJyU1RxYVBVMlEwTVNMN1V0UXY3eHpyVXMxUUxBQ2FLVzdPN0NyaWVUYnJF?=
 =?utf-8?B?S2RySFkxdEFML1pSTXhQbE04aXkxeEtGNFRUNUswMU93RXJBamdCSmVNUVFI?=
 =?utf-8?B?eG9jYmVUSy9DTDZHQWFQUDNIb1JuZmlrTUl3Q1dydy81YmV2QUNHU3NvY0Z2?=
 =?utf-8?B?dWtUK2d4VVhtbDYraytReER0cUFFYjdFT2ZDZFpMSi9haGIvRzRlVHlXR0VW?=
 =?utf-8?B?VU0xYWpZOUQxS2trTGFlYldTakoyeTZwcHpkcDZGd1JpQ0JRMys1VU40cWxF?=
 =?utf-8?B?dEVmMzNsQXRPMXlZay9VTTE2MVJXcDdlZ0I3cWkxTW0xejdjU0lUNSt2QkQr?=
 =?utf-8?B?eDE3bFk0Y0Q1STNDTXE3RmtPM1ZIQXVHMWlrQ3FHOGtjQzdlL1hpQTBSUGpN?=
 =?utf-8?B?ZC9jYkE3cnU3am52djdyUys3bGwxbTlaaFgrOThlZGs0eVYrZDZuVTlta2RJ?=
 =?utf-8?B?VXdCbCtOQldqUlNlTWRtTlc5NmZGZVlXL21iTUdqNEdPcVZ0dWwzUlJ5ZDV1?=
 =?utf-8?B?dTFZRTVaaXlaR3RjYXB3SDBaL1R6c0FiczVCb2M3OVB2eEpXbUQ2ZnRWS2Ro?=
 =?utf-8?B?dXBYdlRtbFF1NzI4a3hWdmhTZFhoUmZRVmR0OTBFVklXK3dsZGxIMlk4OFpJ?=
 =?utf-8?B?cWw2SFdrM0JRSzJSTWE4KzErekdESnA1ZVJ2MVliWk5FNk5qeXhsNkdkbHZG?=
 =?utf-8?B?VGhDS3V0cE9lMk5EMC9pbjR3dlpxRk16V1RmZjQyRlhRcHhNTmROTkdYaW9U?=
 =?utf-8?B?V2ViQUNRTVJaaVZ0and0OWVGZGQycDVRVlVDMkFSNEJDeWhIQmd4b1J6cUtH?=
 =?utf-8?B?aFVFODRoM2t3MFM2eGVBU1l1ancyV2VFQ0dWcGNieXBFMDB3aDRvUGtKSkM2?=
 =?utf-8?B?QnNVRHVMakp6ZitDa3I2cjV4ZlV5V2w2bFZ1WXlURmxNWjZlUzdjdUF2bGJp?=
 =?utf-8?B?YS9vc2pPbzF6NzhpN1ZHSUdBaDdMYnlTNkFMMmRLaDN3eWQyZEJYRTFnWms1?=
 =?utf-8?B?emhMWVUwVlUxZm05eTZ6R3B6Z3p2b3Yvd2FuTTVvaTR5ZDZEYXpYcTJKbU90?=
 =?utf-8?B?Q0RmUjB3a3BrcGxmdFkyWUJTL3RUbkw1bHBMampuYUdUaEV3bk5SV0hLK2dH?=
 =?utf-8?B?QXA3bll1TG1qbWdHR3RScEsveUF3aUpaajJOTEd5RGFTQWp1Nmtqb0kybzR6?=
 =?utf-8?B?eU1PVWJnSThlTGZIb0h3aStlSXloRHduWlMrTE02ZVUwRzhPU3EwSlI0Q3JS?=
 =?utf-8?B?aFVIdEltT1VRTGdVbUdnSXp6c0oxOVV5NVVNL09PN3lMQWFsRGdzb0FxU3dB?=
 =?utf-8?B?N1hkZWFhSlNPYk1iZTB5SG41ZkZCMFRtcElqZkQvR1YzcTRKRnZuOUwvZU9O?=
 =?utf-8?B?UmNTTWQwYXI0QnVkdTBkb1UwdExOYmdNUjVmcGFmK0VZZmRHVVFaa1htN25m?=
 =?utf-8?B?dGZLaEoydjQ2UDI3ZHpMKzF4cGxjNXdKcUxCYzMvL3p4Yk95a3ZnMmRGaTla?=
 =?utf-8?B?UXhuOWNiSzNyU1dXTjd6WWhRUmQzamU4ZGFGd1hJU1hNUTFYSzJwbEVEbzNM?=
 =?utf-8?B?ci9vQzNDcUxSWXdrUm92bGRhb0NIOThidGxQUExXRW5XMHVtSHdQcWlCWmxr?=
 =?utf-8?B?OW9LWUdScDA0VlBjcHZEYWRsZ0pQd1hoTGhpNm9iRk5LUmNSSENBUnNrdVkx?=
 =?utf-8?B?eWVPVGJOK2Z2TTh4bFJrT01qNUF5QXU5MTh2Zk8vdUh3MTNXT0kvcGs1UG9p?=
 =?utf-8?B?WVZxWlMwdGFpcjFBdXowS3NZN1RETnVMeDRFZGNTalVvYzBpN0sxS3ZUdzdN?=
 =?utf-8?B?U1R2NVlRRm9MdUY5dnJJT2syS252K0V6dElwYVI4ZFZnUFlHTUdZZkp1RWhM?=
 =?utf-8?B?aGM4MXpCdkR0QldrK0hrNmZFZU9RREYrM0tobUdUQUNIellkVzJkTm1GSEpp?=
 =?utf-8?Q?XJwmTHB2xTUXlEhfL2irds0s0?=
X-OriginatorOrg: talpey.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d54fea8d-0df8-47e2-a336-08db2b9f65e5
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4445.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2b2dcae7-2555-4add-bc80-48756da031d5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m+OFI0BIBYhKLGB4MBiBqEOeb4n7Iko+vszikNNGIcFL8B7PthGTYwRMweg99SH+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR01MB7936
X-Warn: EHLO/HELO not verified: Remote host 2a01:111:f400:7e8d::623
 (mail-bn8nam04on20623.outbound.protection.outlook.com) incorrectly presented
 itself as NAM04-BN8-obe.outbound.protection.outlook.com
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
Cc: "Paulo Alcantara \(SUSE\)" <pc@manguebit.com>, linux-cifs@vger.kernel.org,
 lkp@intel.com, samba-technical@lists.samba.org, oe-kbuild-all@lists.linux.dev,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 3/23/2023 5:40 AM, Dan Carpenter wrote:
> tree:   git://git.samba.org/sfrench/cifs-2.6.git for-next
> head:   96114df697dfaef2ce29c14089a83e4a5777e915
> commit: 010c4e0a894e6a3dee3176aa2f654fce632d0346 [3/8] cifs: fix sockaddr comparison in iface_cmp
> config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230323/202303230210.ufS9gVzi-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Link: https://lore.kernel.org/r/202303230210.ufS9gVzi-lkp@intel.com/
> 
> New smatch warnings:
> fs/cifs/connect.c:1303 cifs_ipaddr_cmp() error: memcmp() '&saddr4->sin_addr.s_addr' too small (4 vs 16)
> fs/cifs/connect.c:1318 cifs_ipaddr_cmp() error: memcmp() '&saddr6->sin6_addr' too small (16 vs 28)
> 
> Old smatch warnings:
> fs/cifs/connect.c:1303 cifs_ipaddr_cmp() error: memcmp() '&vaddr4->sin_addr.s_addr' too small (4 vs 16)
> fs/cifs/connect.c:1318 cifs_ipaddr_cmp() error: memcmp() '&vaddr6->sin6_addr' too small (16 vs 28)
> fs/cifs/connect.c:2937 generic_ip_connect() error: we previously assumed 'socket' could be null (see line 2925)
> 
> vim +1303 fs/cifs/connect.c
> 
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1279  int
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1280  cifs_ipaddr_cmp(struct sockaddr *srcaddr, struct sockaddr *rhs)
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1281  {
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1282  	struct sockaddr_in *saddr4 = (struct sockaddr_in *)srcaddr;
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1283  	struct sockaddr_in *vaddr4 = (struct sockaddr_in *)rhs;
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1284  	struct sockaddr_in6 *saddr6 = (struct sockaddr_in6 *)srcaddr;
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1285  	struct sockaddr_in6 *vaddr6 = (struct sockaddr_in6 *)rhs;
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1286
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1287  	switch (srcaddr->sa_family) {
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1288  	case AF_UNSPEC:
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1289  		switch (rhs->sa_family) {
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1290  		case AF_UNSPEC:
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1291  			return 0;
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1292  		case AF_INET:
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1293  		case AF_INET6:
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1294  			return 1;
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1295  		default:
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1296  			return -1;
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1297  		}
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1298  	case AF_INET: {
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1299  		switch (rhs->sa_family) {
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1300  		case AF_UNSPEC:
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1301  			return -1;
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1302  		case AF_INET:
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27 @1303  			return memcmp(&saddr4->sin_addr.s_addr,
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1304  			       &vaddr4->sin_addr.s_addr,
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1305  			       sizeof(struct sockaddr_in));
> 
> saddr4 and vaddr4 are type sockaddr_in.  But sin_addr.s_addr is an
> offset into the struct.  This looks like a read overflow.  I would think
> it should be sizeof(struct in_addr).

Oh, definitely. It's more than a read overflow, it's an incorrect
comparison which will lead to creating new and unnecessary channels.
Two bugs here.

Tom.

> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1306  		case AF_INET6:
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1307  			return 1;
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1308  		default:
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1309  			return -1;
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1310  		}
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1311  	}
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1312  	case AF_INET6: {
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1313  		switch (rhs->sa_family) {
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1314  		case AF_UNSPEC:
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1315  		case AF_INET:
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1316  			return -1;
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1317  		case AF_INET6:
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27 @1318  			return memcmp(&saddr6->sin6_addr,
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1319  				      &vaddr6->sin6_addr,
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1320  				      sizeof(struct sockaddr_in6));
> 
> Same.
> 
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1321  		default:
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1322  			return -1;
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1323  		}
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1324  	}
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1325  	default:
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1326  		return -1; /* don't expect to be here */
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1327  	}
> 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1328  }
> 


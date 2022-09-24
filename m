Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 915635E8690
	for <lists+samba-technical@lfdr.de>; Sat, 24 Sep 2022 02:11:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=odiSodDSmLb7O8POPIJ1QJVfQ9wGlpE3QUZRBdcB1C0=; b=c2lil2F89shhOOKBk9qEZfNeN1
	sq8jn6oN7pwUYH7DL9ll+ougD+PtCC1MxM6WLUxItCez2txHnLrUZZLP5PsEFYO6TVcofWjzdGncW
	M7oLyXDinbLcIsVklj0HdRy4TRTTA6QGlP9S1/RX46AmzbKbnTK59T7baGtTAGSE94oRT+lb54eaa
	JGQStR3IeA8o7cQUGZnr+o0tCo6EBWBL69BR0ThOnDluQELSt292fH0jQYgREu7NUMRymS3p5qQJ/
	Lt7RqcvaBvlN0/z2mbG7Be/8f5l/KzPNPXpFLyktNjD2VdVQ+rVi0umM7DBmyQasLTSlKmdYBeo0G
	IW66KCeQ==;
Received: from ip6-localhost ([::1]:47386 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1obskZ-003m3A-Gr; Sat, 24 Sep 2022 00:10:31 +0000
Received: from mail-co1nam11on2057.outbound.protection.outlook.com
 ([40.107.220.57]:40576 helo=NAM11-CO1-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1obskR-003m31-D1
 for samba-technical@lists.samba.org; Sat, 24 Sep 2022 00:10:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NwbACPlQ8leVVwSaody4Q8pzdLDdO2Cv9ojxkiHmbaZEi/ozy0XjzOf8Gv9Hkvwgtspi8UFyO4w3MfwFWDxheEq48nRS7KzyNciEUQgujV5Jlv9qXwKfzbggiJ21iE2//GvPrX0ZG2uBd7vplEhu/qXiWnxfxB/xoExaXpZjg0MAxsKUf1WfVx8fEwLDePJrfspkKe5TFmAhFdShi7iuuYc7bZnfNfbG6smWoShUnXtwkxPGYbP2R/MNJaBuHg9okIyN2iVOCCAUVye0FWMAk3/iNYv3Qp4azz3Q5wYaDJpUA8neMZe5n1WWJu6RdqIPkQKUjJzCqak20S4HCP8/lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=odiSodDSmLb7O8POPIJ1QJVfQ9wGlpE3QUZRBdcB1C0=;
 b=jajvVuOO0SXOlXPGZ0QLFmUhVqvax3G1M7OetVgbtXqxn5M7LaLQ4J/mu8J/gGzym5jrFs7Z/IwFxxTlgX3oH61c00S9B9rGnmqlgthxHeONeleZ7uEqgNRVI+oMQYz+xzJCdTrJBaS0pBDJDxtCDPO+g8ug3Gy+RoA7yduKShJ0dHYjN3JPYzlE25nzqanYi5Nt/aGzlhg3DQqQ02kCnHTkKvtttapIFEphtqdvDZZFGfje96JLDtF8cWSU8TIadtQ+yprM6EgLcM/zG5/RVZKCQ2aU4+ssIXdg/ctJb8rI4fwNRDrgJMAp7sbu9gIfKVCUjq0EzzQpiD532OD1Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=talpey.com; dmarc=pass action=none header.from=talpey.com;
 dkim=pass header.d=talpey.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=talpey.com;
Received: from SN6PR01MB4445.prod.exchangelabs.com (2603:10b6:805:e2::33) by
 DM6PR01MB5500.prod.exchangelabs.com (2603:10b6:5:152::19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.19; Sat, 24 Sep 2022 00:10:00 +0000
Received: from SN6PR01MB4445.prod.exchangelabs.com
 ([fe80::d99d:5143:a233:36a0]) by SN6PR01MB4445.prod.exchangelabs.com
 ([fe80::d99d:5143:a233:36a0%3]) with mapi id 15.20.5654.014; Sat, 24 Sep 2022
 00:10:00 +0000
Message-ID: <afc1d4d9-6f14-f657-42ee-af9696f01d01@talpey.com>
Date: Fri, 23 Sep 2022 20:09:59 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: SMB3 POSIX Spec draft
To: samba-technical@lists.samba.org
References: <9ae62eb6-613d-6347-62d0-15d5cc429150@samba.org>
Content-Language: en-US
In-Reply-To: <9ae62eb6-613d-6347-62d0-15d5cc429150@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR01MB4445:EE_|DM6PR01MB5500:EE_
X-MS-Office365-Filtering-Correlation-Id: d875c6cc-d2ab-4138-8165-08da9dc11f31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: G9MydShIALS75cSmuK+D7anZ98hcTRJO1CgsxItU0k6ZsHA6wYkAgrlcyg/Zja0yQRDFn0Dc82pUGhkGUpdRRquuESc9+FpMTnKKL1djSLpPRmCQqk32Ux8zn5ZQLTIPEHHE+rXA52nKpj64JLKSr/UveQMQy9DQoT5bKMh9wWwjuYFQJ20m1IxW1gxC2opZmxwEc3C7DwSKyhPCsIf0V0z6Zivv87/pbHeejOko26siKcl6thqVSeN1BtnMBq0qRCTaPaZKnOlmLk/qeyeRt6qKCAPEixcN3wU8diHtOKF0MUU2IjgwtoORVNqSuJuskJQeRLfpyXAl91guM5QiC2dLUyHvy4hSgHF8fYTnyiDzSM7Lcnq2Fck+jIeJCHk/T80/4x2Dfn/Q8euR9E1rqev/NTZKxKCEG7JmQ65sS4JxHf6euakgJi/kUms0ns05cpPz6BkZDGk6rJ6aBMsXUx3PFkc3NVIUhh6j6ikrBnMbPVGeXkBFwyeQACujKgltLvV1W6oJ5kZKrFgfdOW3R5k9J9+5Ex/bz3hgDoPg1mbRxFBKpQKzskPTtq9NPvlUll/LBNoQp+BKcDyL/HnxTKcaSeKEazWmIZWqi6WjjZMH0J/9GhBim881+yePfNEoC3FB6pdWONms8reTGmCGs+eufF+CWNlIvZqxPhPub64ffWkljiZJNi8i6Vg4l7FsWT5wp5yLIXKODH3Lw8p1fKnUpydK0lbSQxgLSRSUECzaj2Dp8Ryt+WIm7Lqxzpz4k+kdwIVQp4MdJcly5saIvwm8/WT3DBm4ZVL2XT9wnAXM++DAQzNsyVE0oitZmKDWuHLw9jNJzhH/00/P1tBPlQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3ZuUXhpTVhTR1grMVVEZXB0Q1V4V3dPeVhkQkxlMnIzbk52QnVYUi95N1gy?=
 =?utf-8?B?bmVHMlhaaTNNcy9SQTM5QUx5T01DaHVaRlBTb3gxa2JFdDZ5QWVUNGdPKzRW?=
 =?utf-8?B?c1JHUzFUL1BrV3I4SFRMMCtnMUQ0a2RlWHBZVG8xS2RUUkpxTklPWHdSamVF?=
 =?utf-8?B?TUxYYjU3ZVZJYWhGUVJWdEd5REc4cEQzeFFNWnArOFNOY1MwQ0pWVDM1bGxB?=
 =?utf-8?B?UXh5T1E1cXcySEVWZ1ArZEpXU3RMOEdCVXdIcDVHRVB4SU51KzE4bEp1Q0Fz?=
 =?utf-8?B?aDNaV0tDTkkvOHBkZWJjWjZ0YVljOE44OEozOGwyTys3YXk1NlRYaWdnYVRr?=
 =?utf-8?B?elRkSnBGQkRKNGFEWlNaK1poQ3lLSVVZMVZtTmRJcnh1RStjalFITjBpWVA0?=
 =?utf-8?B?WkxQanlyYUFDcjh0aUx0dFVGc21kOFBmUTlLVzVkUW5Kbmo4MkZtZWs1U1NV?=
 =?utf-8?B?S0NWRk12azJ3ZXIxM2hYaWVQNGw2bVBiMGpyYkNnSEIzNkovd1BQSGNwNWhP?=
 =?utf-8?B?VTVoN0tuS0tqc0dQeHpqS081MjRtRDVoTXZmVnlqRkFlT2s4eFJZaDkyczBr?=
 =?utf-8?B?OGVYWnJGZk5HeXQrRktLdGNTNWVCZ1VaZy8xcDdLenJScEhyZGhkUnhGRGhr?=
 =?utf-8?B?WkRMT3dtZ2p2VnpRQk9sVks0Y3d1YU1rcFhQUXhySVFjSmVXNm85amF2dHVP?=
 =?utf-8?B?U0RqekpPczNOVzlmK01NSEtackN6SmZwSUdGMm5Jb0NJeHZSWkJMWDF6dXlF?=
 =?utf-8?B?WFF4VzJqbnBibG12TlZKYjhvT3JjSStFaXhyd1pFM2FQamM4S00xdVpCallQ?=
 =?utf-8?B?Y3JXV3dxNE1IMGNaMzNuUWpKVER5YzNucGtkanRnN0NVbDZTQlpWaEZJelA5?=
 =?utf-8?B?VzhESldMZDBodUZjUk45cFRtVWhla3VRbHpxbEpuaGNOUzZkaUttbFNmT2tZ?=
 =?utf-8?B?azh3QSs1QXYzenFIVzkyNDJxVVRpUlhDRFNweHpwSGNvNnpwVDNlUmhiaUt6?=
 =?utf-8?B?Z1h0clNZckxtTXo3ZlNzaDhZK0xWZGtVVG1mdXBJUUlmY1BSTVh0Z3ZiU2R4?=
 =?utf-8?B?TkpzSUZTZXNraE1SQVAyYnBRTFRNb3JFRU56TjVXK3pPaE9jR3hPdkpKL1lw?=
 =?utf-8?B?TG83MngvRjJLN2lxRHd2eU1KQjlzWEhaSXB2RUhheGtRd241ajdjNlZ1ZWQx?=
 =?utf-8?B?YjVMQVlET3ZIeStCeUdkUStqQUZ5WklRcUIzS0xlcXhkTHdUY2xKSHYzL0hr?=
 =?utf-8?B?d1Nta1Zucy9zeS8wMS9KalJHYmo2dFA3L0ZlY21hOERNK0JpTzBSVHI0VmJl?=
 =?utf-8?B?Z3pmZVo3RU5mVkhlWUJDSGZzZUhJR0JQODdReVlzb0dRUXMwZUQzSTBObG1j?=
 =?utf-8?B?WEswUGxyY1FkSGtvZnd0QkxIeWdtV0ljdGc4cVJ5Ym1xVmlvLy9lY1R3Rmcw?=
 =?utf-8?B?TmY1ZjczbDZoOU5pTlpCKzByNWhqRmp4WHVCcFhJZ2NFcWdqQ3N4RTc1MFlM?=
 =?utf-8?B?V3ljVUVnQi9GYUM0Ym1WRUxXMVNJd0ZmR2YvbGRLd2ZqbytoU0pqUlpKYjFh?=
 =?utf-8?B?VlhJd3FCMldoWUN5eWlPY3g1QTkzNFBWaVNzcERHRFdUV08zdlJROVQ3NnZ5?=
 =?utf-8?B?SnhUTm40NjV6elE4RmErVmxNM1dvZFpiZVRtWmJYcTM0WW5Na2NzRWhmci80?=
 =?utf-8?B?bTZNay85aHpQVzFhTHZ2TWxaUGZtbHJkek9DMm0rUGE0MGQwNWZ2ZW94dXJm?=
 =?utf-8?B?OWwvMVBxZExPS1ByWXhCVmhicGNFRFhlRzNOV0pNSGt3d28zZGgvSTZaRkhn?=
 =?utf-8?B?S3d6RzdpL0RZSnZZVHlab3NyckFjTGw3ZEphQklpcFVnblZFcWZnbFhRUVNs?=
 =?utf-8?B?K3ZlaUE3T21Md3cxZnZQQ1dZMDhhQnpQL2tUVk5tQy9PMEs4SHlnMndqanB3?=
 =?utf-8?B?ZHRKL0NwcE4vZm1taHl6dlV6QVpTTEY5WGowWnJ3QkNGa1d4UlZUU0ozSklQ?=
 =?utf-8?B?VFNrc2dqQU9SUi8zRThsVkZwMTE2dXdiVVpLbGlONDZHS1BXTFhTR3pKMDRJ?=
 =?utf-8?B?bStuY01tWWViSmNIMHcrL3pnK1kzZllLdWE2aFVCd2s5U0lRSUFIdnZOV2lB?=
 =?utf-8?Q?iSzXQhr0AabfzRWvZiRWTMUu2?=
X-OriginatorOrg: talpey.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d875c6cc-d2ab-4138-8165-08da9dc11f31
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4445.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2b2dcae7-2555-4add-bc80-48756da031d5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cwg2a2nBuaBGo/29FQvGumw4vZcbLAeovcWl9jAGxeGID2VHza8ICz6DDFXqv3EM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5500
X-Warn: EHLO/HELO not verified: Remote host 40.107.220.57
 (mail-co1nam11on2057.outbound.protection.outlook.com) incorrectly presented
 itself as NAM11-CO1-obe.outbound.protection.outlook.com
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 9/22/2022 1:36 PM, David Mulder via samba-technical wrote:
> I've attached my first draft of the SMB3 POSIX Spec. I tried to find a 
> balance between providing too little and too much information. I want it 
> to slip in cleanly with the [MS-SMB2] spec, and be easy to follow by 
> someone implementing the protocol.
> 
> Please provide feedback on both the technical details, as well as the 
> formatting, content, etc.

David, this is a great start! Organizing the markdown in the Microsoft
document template layout looks good, and will make it easy to cross-
reference - and who knows, maybe even merge!

How do you want feedback? I'd prefer to use email, personally, so we
can all see (and join) any discussion. Is samba-technical the best spot?

Tom.

> 
> You can find the source here: https://codeberg.org/dmulder/smb3_posix_spec
> 
> It's written in markdown, with embeded html.
> 


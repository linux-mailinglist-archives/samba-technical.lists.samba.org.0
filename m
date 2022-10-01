Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1095F209A
	for <lists+samba-technical@lfdr.de>; Sun,  2 Oct 2022 01:24:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=B3T2DawNDQV5zK52dOsZQuQJ/dil8ofb38e3jCwvGug=; b=bjyOu2WWAdmt3UVlLobj6jhdQC
	OS1nU2hQPBoZFeqwCuFCfqqiOMC8SP3oXpRoy1RPR3MCwrSgi+kv22Qil8ehqrsHXDpiVuCTLDQOQ
	IyPELOgUsvcL1kLE/fwq/op+wSPHFB71LNQFXEt58Tz1y/FkGqs+4YsLi17hSpn4kVuq7nvKoC1SI
	S+nHV3eiQJPH9Hxic07PtfBx2vgkdzWDm7Vqt+odgyCESwMjP+hb8ZoKnQwFLc/C7cYS/XmUK4XF1
	IU9JNDkhUK9c+a+SGJQFL5UKknqfNbjfcUU5m72gn7zfLr0Su9Dyg1ShJtMGpcOooOb2js/LfiaKQ
	t+eZ0gNw==;
Received: from ip6-localhost ([::1]:32312 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oelpE-0077UF-QG; Sat, 01 Oct 2022 23:23:16 +0000
Received: from mail-mw2nam10on2086.outbound.protection.outlook.com
 ([40.107.94.86]:13793 helo=NAM10-MW2-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1oelpA-0077U6-3y
 for samba-technical@lists.samba.org; Sat, 01 Oct 2022 23:23:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DmcWvcsbOKBW6M5M26QkHrLIVsHY6DGcIrYuNkLd81beRf8MtfvmugAJRhwPXTQLIijTICGdTTvmR+4UspAHuT/rcgC33cckWoqtbfW3QJg7Cb6jH1y75X82eD+hAKqBqCvQHTNX68Uce04qEs7NvMFFNudP0RlElPdjSAWXVM/5KLR+kTNNak5gnAU5yCN325SpOcSlWN64jXcHLxXp57xPvNHuXU2OWsA4MZtRhuAxC7c1PX7ncH+cJ6lzIJjAGXsekDMjcfmcMCO4smhOozVyKEd6y9VPDeN3qo/ssZZXJ2PIeUYaBMZmUGBmcbuZ9yVEnf2G36R6GDrn71E65A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B3T2DawNDQV5zK52dOsZQuQJ/dil8ofb38e3jCwvGug=;
 b=nuGtXF0YZzTx8W2wq09ix5hRuGikYJz5G07nYDMGgIOy3c9oR+67L9oeZme+lTcURiNXxEtJnTkSh8yhBDnQufP83R9fs1LJTeBu+5UnxA+2j7fgkam1N6FWuPr4KjAoldeO/ClAaF/m4RaNNVLnkjpAFJJ1xOyzVYZ6CfoP48tIK4NbgLCBsS89e43TdOrrcDqxzQ3ZonjpTgrJyxJk2f5yfWo9YFyXHib1Y3DG8YL3yETfEfLXfea/Fb5YFpE/Ig9dWw1qkKkLFp8Tcy60DidAshTbyZyGIcndP6BBLJ9s7Y6pQnBVWQeAQgOV1hAKusKnyC0++cc7UYBNn8PUCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=talpey.com; dmarc=pass action=none header.from=talpey.com;
 dkim=pass header.d=talpey.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=talpey.com;
Received: from SN6PR01MB4445.prod.exchangelabs.com (2603:10b6:805:e2::33) by
 SN6PR01MB4256.prod.exchangelabs.com (2603:10b6:805:ae::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.18; Sat, 1 Oct 2022 23:22:52 +0000
Received: from SN6PR01MB4445.prod.exchangelabs.com
 ([fe80::5c62:b328:156a:2ded]) by SN6PR01MB4445.prod.exchangelabs.com
 ([fe80::5c62:b328:156a:2ded%7]) with mapi id 15.20.5676.020; Sat, 1 Oct 2022
 23:22:52 +0000
Message-ID: <df473fde-e79d-ae90-37bb-3a3869d3aa9a@talpey.com>
Date: Sat, 1 Oct 2022 19:22:49 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH][smb3 client] log less confusing message on multichannel
 mounts to Samba when no interfaces returned
Content-Language: en-US
To: Steve French <smfrench@gmail.com>, CIFS <linux-cifs@vger.kernel.org>
References: <CAH2r5mvS6_AXjbK8sY_dEWUbmtRjodSYEtxeNz_NST9+EyC96A@mail.gmail.com>
In-Reply-To: <CAH2r5mvS6_AXjbK8sY_dEWUbmtRjodSYEtxeNz_NST9+EyC96A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR01MB4445:EE_|SN6PR01MB4256:EE_
X-MS-Office365-Filtering-Correlation-Id: a846dd21-20c4-4cfa-685b-08daa403dd05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: /ZBvhi+vDcg0PgXoeMTdHPkO6vdkwXx1yFKcGI4Q3/iDf1G7l8GVeG2oQ7mJqMXWAoWYt3maPOzsKkC2PEM92a43OtOhKSJ5oGrtDguAuF1B/fIuiIvx6FOq4qLulnW+tG+WzC6j3qFI3wq5HcgyRIyjQwDXkWv4SvtmzjVyd7erTrcsxC120cxW+NSjcDzgyFMd8pataBztj3h94t+I+uoWvk3J6SQ/ZdjfGm+miCB6Z8qJWzPyzUkc4ulLSt1TX5bte18zIZZn73tfNzYNgriGsF/wAFjKExnr0AW6eFYU8wv0QKG2POl9fcCPFk6T/9FmsDoUPLudXb3dIUeBOu43xhcgchx+1W5NnH2Dz7PCbwd5hA2vm55ufqSE2l6ubLFAI1r6a+uP+hduK5LqzV2RUviHo+9RwcHfy1oovhbWZGxIoB5FdCFTnbqnENXf7vL9c973ql51fgRG9wB1lat8LV+V5PIHdirGal04e2/qVWibztl5beZ2YY+EGydO8F86w4HnT+1vjFIfVTv7aGzJNH4TDFZVG0+GHDf0ZYbL/za2z25hM2K7zI1m+I9gVp4EiWoSnAyTdnlFZJqkMIlVmZ9LXlTOiP2EPsQwite825dB999e2TJvrF0dj0qx2uOWeR7Uqg3opDDBZ7fRKCXDs/zG8cNDHc7/ExobCFeRDvSlt3R864YzqKsBvoZec/2CstcfCx8Z7nG/gNCPdJ+15ITPToj75iF5bVKdDXqJXNu9xL4lMmIQZfh7uT7LHvSI1aO8XKWlFXKhcFTjFz84eYDVZgWHJ3jxsnGlUS0=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDE5THI1eUZxM1NuMUZhVERGUFNXWjdHc3FPT2dRVlNHRGgzdmNNYTE0SWZv?=
 =?utf-8?B?ejhwNkZGdzdUT3dnWkxjVk4xNU1DRHh6MGhjTVJORkYwUWJMYWxqM3I0R0VF?=
 =?utf-8?B?QmJjZEltV3hPS1NKVGEzZ3FCcGwwdXhvTmhHWDE0RGFZMkJXaTUrNmdLaVd0?=
 =?utf-8?B?ZlhUVHdUT3JKL0EraWxOTmZTSkVybTlRV3d6SzVpZEVnYmZRUGEzcFR2VE1H?=
 =?utf-8?B?S2N4T0JGUXprSDRPNzhpdndhYzEwQmxHY2hSTWljYkZ5UzZ3QktJbVZFSFBv?=
 =?utf-8?B?WTBNdHBhMW5VM28wSUxZT3hhR3F0dEIxQ2VhM1RUcjNmaHhNNGI0UzZreGVy?=
 =?utf-8?B?bVd0WW1vUXJtZlVFODVHdUhpR2JHbG9mcGlwVmNPUzdpRXdaWmRsR094THly?=
 =?utf-8?B?cWlYdGZPbUppRUVxRGw3Ymdmekt3RnkxTkRramJLeGptclppNE1KckJEOHov?=
 =?utf-8?B?SStuNlMycTZwVGtYTTl4VzJzQzlONDBrS2kyY0NmYkt3Ui9jVjJhN3NFOWVa?=
 =?utf-8?B?TkpuTk1WcWh1dUovZG9vTFFmWXh4R2JiWVJ1QVdpd3lBSVVlTDFJZFV4dUVx?=
 =?utf-8?B?bVFza0dnS04yMnBGSTd5OEtid1AyU3JQT29Wb0xHOHI5L3JpMW9XK2VkRkg5?=
 =?utf-8?B?MzhodHRBN1N4QmpjbE5xTDAraFk2azhKY0FOZDRNb2Y2MisvWGZ3NGRuYWFZ?=
 =?utf-8?B?dXlndDJVdk40ZFEwWlpQWTdzWFh0YTYzblNFdEoxd2ZwajVaQVNTVnBtU1VY?=
 =?utf-8?B?dnM3MzJRZFp6K0txSGIvcXlGblF5RnFIaWdFZ1Z1VDJnVGRXVEtyNVhsVkFu?=
 =?utf-8?B?SU4xYXNZZFFNTnp5eUVvbnNUYnpEREhaQlZHOUdnajFHd1I5M3E0SWJyQkIr?=
 =?utf-8?B?WlU4enY2SXNnMWtNMmNOT2J5M1NBYU1JTjJTNnUxdW5TcjhLMi8ycFI0TzBP?=
 =?utf-8?B?ZmNmb3JFUlc5TGVZU0pwbmtXZ1MvTERoZ0lEaSs2Rkt3Ly9aekNYQ2M2WHht?=
 =?utf-8?B?QUE3M0VlczQvQUZnVVRScHZraG5MUDdBa1dRRHZ1UGEzdmcrM2FXUGErTFcx?=
 =?utf-8?B?UVhpSEpGMk1kcjlZSDJ5b0MrcUNXMHdNYkhTQSt0Mm50RjlRSGU3NFVNdVJX?=
 =?utf-8?B?eWNZM25OQ0t0YVZqYy80eFVxUnNWbTN1NURFMG9tSmFlbVF2ME9IbGlPSFQ0?=
 =?utf-8?B?bmlITms4VGNHaEVERTNPbG5VVzkrbDRpWEdic2lIOWVTQjhLZ1A1MWNkUGFW?=
 =?utf-8?B?YmlKK2x0azh3WVZOMTE4OWJDRTNvYXZJM0J2NkVnV29FUnh4MkZSUEhwLzNu?=
 =?utf-8?B?S1ovT3lxUEJoS0IyenpNVG9NK1p3SExjUzdyclVMWmkrTk84T3BwSGFCaHRC?=
 =?utf-8?B?d3hoYTNwcVlTU3NMWGhmS1ZxYWJpZGcxNzF2OFhVTFdiNlNoYy91M2k3MFJD?=
 =?utf-8?B?NDEvVVlYNVZsdml6LzNRT2pEOHdxZE9iTmcvc002MGtGQ3JoVXdEVlhscWJj?=
 =?utf-8?B?dXZnUFRsb0J3Q0tuK01MZWVkK0k0dWRZRFhGWFRmZ25ET29xcENiaFoyRTZn?=
 =?utf-8?B?YjhVc1ZweHlKa1NCZUE1ZjZqenoraWpnNWdVNzMyVWJ6cXEzdGx0eUhLUkRH?=
 =?utf-8?B?elRsTEQ5OVVUbjY5cTZySWNNNTVRa2pwTEZhM09pTDAwd1RwdTJxa1gxa0pG?=
 =?utf-8?B?NVV0bWcxc3gxS1BlQ2ZKMmhCYkdRbzVscklNbGhET0FxOEhXUkdlSUN6S3pS?=
 =?utf-8?B?bGRpelFRZ2RUUUxiRnN5cm1mWXQ3TmZoKzQ1TkVuY0JLZ3ZxeENFUXVIbjRZ?=
 =?utf-8?B?WFlYRlZBckllRmZYT0R1WXBQWFllM2EyTFVFenZxV1VJVFpES2liKzA3RzFT?=
 =?utf-8?B?Wk1TazMyODZMY0ErbnBEejMvc3E5NmUwZm1ZZzduS3lNTitPWTM1aHJ2OGwx?=
 =?utf-8?B?OHVXdStFaDhkTG14RngzYS90YVZ3dHZNK25Qdk5hTlJaL3JYSzVYSzc2SWR4?=
 =?utf-8?B?QVFYaWlzTTRMVE5mbTZVQU5xeGx0dDViS1NnZlUwNVNueGIxKy8vM0liTWlk?=
 =?utf-8?B?OUx0RmJRYkpjWDlwVUxBL3hXeEErT21IOEpVdEROZUhoMStCTHBhNlV0N0xW?=
 =?utf-8?Q?6K04Y+uDW3nDIiW9wX7NUMb8u?=
X-OriginatorOrg: talpey.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a846dd21-20c4-4cfa-685b-08daa403dd05
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4445.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2b2dcae7-2555-4add-bc80-48756da031d5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /iR2VMHdXYSxUwUZKhVsqL8bhaQUin3gy3Z+BO/Lf+EJsCgRfDsJ8Qtlqi9fgmkW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB4256
X-Warn: EHLO/HELO not verified: Remote host 40.107.94.86
 (mail-mw2nam10on2086.outbound.protection.outlook.com) incorrectly presented
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 10/1/2022 12:54 PM, Steve French wrote:
> Some servers can return an empty network interface list so, unless
> multichannel is requested, no need to log an error for this, and
> when multichannel is requested on mount but no interfaces, log
> something less confusing.  For this case change
>     parse_server_interfaces: malformed interface info
> to
>     empty network interface list returned by server

Will this spam the log if it happens on every MC refresh (10 mins)?
It might be helpful to identify the servername, too.

Tom.


> Cc: <stable@vger.kernel.org>
> Signed-off-by: Steve French <stfrench@microsoft.com>
> 
> See attached patch
> 


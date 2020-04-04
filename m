Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9184E19E50A
	for <lists+samba-technical@lfdr.de>; Sat,  4 Apr 2020 14:52:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=T4XKwabgLD3qrOtiDr16yrH5qOhKH50S7/alt1T/cjU=; b=Krn/+lkgV7i0UXrI42sjSpo4HE
	u8q8XTAZv52rzFcU1jQfgyqurobxtYBN/DcByY3S4Q0/8+U9UkcafOJ+ssPJltE6IeiYe+U0Buhuk
	u+tFki7jENBaeE2CX99HRkSThZUXFEBU5+K9wxeeeYF7IDjM6m5ozpV/nox47bOqlUaMDpFaWD/4V
	kTcjVO+Ze1oZj1OX6QbZY31rqphrKBw90NImUpa5ws0HvM20t6ze3Y/BsmFgXvZfTmDv6xtG9tHMZ
	vZZRatVFC/d/rAJKT6hyRQ/cK8ZYbiMyCgXaE9068xQDDiofQ3NZ6TnOrtUOZ0dMJ635T6OV8FtYM
	ATycTg8w==;
Received: from localhost ([::1]:36416 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jKiHT-003J21-0U; Sat, 04 Apr 2020 12:52:11 +0000
Received: from m9a0013g.houston.softwaregrp.com ([15.124.64.91]:41621) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jKiHN-003J1u-Hb
 for samba-technical@lists.samba.org; Sat, 04 Apr 2020 12:52:07 +0000
Received: FROM m9a0013g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0013g.houston.softwaregrp.com WITH ESMTP; 
 Sat,  4 Apr 2020 12:50:54 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Sat, 4 Apr 2020 12:35:32 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Sat, 4 Apr 2020 12:35:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kXnpl8d1TpJEcYj2uhBAaQkKHtMs5DtLQkUTrZWUFnY8AOj2xgW4hd+5Zd+cr2P+pEwAsTaWsvB0F8HI02MtKnhNZko8B3eRszftrxldjIdOOoolwCsuQ+5mUc33aKOAUSPjQu3/TXJWpml2SBwb3rcAMo2HtqyQRBa74QLSEsgobCfMpCuhq1QkWMyfvWsWQkGEUk6MK727ltq92WoSc+873LwxpHzCh7+8U3caveh3nxUKYjQR7fyN/q3oL2g/uNYW0/OBHjaAS9wapBUwELy7ypozl4ZPRLKHn8KY4waxC3WlhjncvKd6PacBAjXhNeqe+JYNMUK92c2XvWmIXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PDG6gzo4JSWmCvEv5+a7ByOneO+DNecoLUtmYsxUfMs=;
 b=JcIHA18Vl4EqDQHs713G2cfn66+N5hcK2HpWjoD7X46SO7UUk02QAU21kafdnXIhUxgRA3ceZO3ces/oYRdzXzn5PS78a1PmlXutgyMw2+8dOyaF+rDxTi58wZl6bXTILtlo+Dt+GCk2IF+8SJcwv0D6op2SK/5wOvHkIfGCVALVroBTIWXvn4e/VosGsmztzsZTRyY/dFBMs0qmKmGZVKvAjLjTUx9ZESf9GiHzRod/4y/vi9ctbmJF6snP9npsC+jxWlj9fXZtsw2HymHN6lp+dolGOpQSySEnjXeJjVCB7400cTBwnZoZsBz79ZANFQ1glHQMYudQAj36W4YvTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=NoPower@suse.com; 
Received: from BYAPR18MB2533.namprd18.prod.outlook.com (2603:10b6:a03:12c::25)
 by BYAPR18MB2373.namprd18.prod.outlook.com (2603:10b6:a03:12e::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.20; Sat, 4 Apr
 2020 12:35:31 +0000
Received: from BYAPR18MB2533.namprd18.prod.outlook.com
 ([fe80::3d71:6b8d:d54d:ebfc]) by BYAPR18MB2533.namprd18.prod.outlook.com
 ([fe80::3d71:6b8d:d54d:ebfc%3]) with mapi id 15.20.2878.017; Sat, 4 Apr 2020
 12:35:30 +0000
Subject: Re: selftest/flapping: mark samba3.nbt.dgram.netlogon.* as flapping
To: Andrew Bartlett <abartlet@samba.org>, <samba-technical@lists.samba.org>,
 Noel Power <noel.power@suse.com>
References: <20200404011303.EF6081400BD@sn.samba.org>
 <7206459d8324b34757339d9d858266c9cbf47303.camel@samba.org>
Message-ID: <96732fcc-6632-f93d-c075-bec077475165@suse.com>
Date: Sat, 4 Apr 2020 13:35:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
In-Reply-To: <7206459d8324b34757339d9d858266c9cbf47303.camel@samba.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.18] (109.76.112.40) by
 DB6PR0402CA0018.eurprd04.prod.outlook.com (2603:10a6:4:91::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2878.15 via Frontend Transport; Sat, 4 Apr 2020 12:35:29 +0000
X-Originating-IP: [109.76.112.40]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b847490f-ad5c-400e-672a-08d7d894a931
X-MS-TrafficTypeDiagnostic: BYAPR18MB2373:
X-LD-Processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: naDoQZ4N2+901Fk5c9mPWE3bojN/iZgOeT7N0gSSaQggGJHgqsKxDWDvYkievFwGEMwjok9mFq6lsQLv5TY50Ei297vdwh/ibSvwBao565RDJPtUfPW1RHA6OPo9vDryngk9nqVjK/BuktSxr9qm0MFXuFGpCPExDbSTAJHI3pcnjGucEU+56SblrlgJk205olkGaMuoXMHoTfbhZl2U70V9R6hk/RE3Q9zOzF+GLZNO7qINDpozb869m4tB8ZTWC5vXxnWwsrnRbBylLjIjuyKAEkua4cngMCEc3GyfNqkvJXRxDrrgKt3iPGZHgQGG3vs6cJvp32d2Xu3HQ1m9hBMHPxOgsoyqIDYQH7nUl78zofJSXHlQNbsSwHD1N+QUrCOAf+jw40VlLCQlZKYCyzbcrZZ+sroRyNA+e0UCM4UlCtE9n8/NKEzWnKzfo0Eb
X-MS-Exchange-AntiSpam-MessageData: X/Q0FqDGlq4fteREls6AYE/0sM8IUpg5tdWF39XiZAbxhSmz5uOznHextYvBnbm/vwRPxXxZUUxTRKC6c3zLFmji1kn3k68B+BaCCIVCIIeeDPdg9K2Tdx16F5lQNr7xgAC2oAT0CulGcBmrKRqdQA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b847490f-ad5c-400e-672a-08d7d894a931
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BPW6v77KhzFxa9D+Q0pMgZqM5RlUCedMt3dQE5LrmlNDwYRnyIEB+LU1zpsNCLquPBHT0lvKYNdGQ1AgJs46Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR18MB2373
X-OriginatorOrg: suse.com
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
From: Noel Power via samba-technical <samba-technical@lists.samba.org>
Reply-To: Noel Power <nopower@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Andrew

On 04/04/2020 03:50, Andrew Bartlett wrote:
[...]
> diff --git a/selftest/flapping.d/nbt_dgram
> b/selftest/flapping.d/nbt_dgram
>> new file mode 100644
>> index 00000000000..b4e4c3b4ac8
>> --- /dev/null
>> +++ b/selftest/flapping.d/nbt_dgram
>> @@ -0,0 +1,7 @@
>> +# following SMB1/SMB2 test env split it seems this test
>> +# fails randomly however it doesn't seem to be directly
>> +# related to the changes (e.g. not protocl negotiation
>> +# specific) Best guess is the order of test having being
>> +# changed (as a result of test moving env) or some other
>> +# strange env related side affect is causing this.
>> +^samba3.nbt.dgram.netlogon.*\(ad_dc\)
> This has been flapping for years, and nobody has worked out why.

interesting, I didn't know that, must say don't recall this one in CI
but post these changes this test started flapping more frequently on
gitlab CI on the merge branch. But it took 3 attempts I think to get
this patchset through on autobuild (all failing on this test) strangely
it seems it on the samba-ad-dc-1-mitkrb5 job that it fails in (can't
recall seeing it fail on the normal samba-ad-dc either on gitlab or
sn-devel)

Given the increase in frequency of this test failing randomly it seemed
the sane thing to mark it as flapping. Of course any attempt I made to
reproduce this test failed miserably and it passed fine anytime I tried
to run it either with/without mitkrb5 specific config, very
frustrating.=C2=A0 I'll give it another poke during the week

Noel



Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1323B18F1
	for <lists+samba-technical@lfdr.de>; Wed, 23 Jun 2021 13:30:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=oYMchobsyO1/l5ZFtFet20yHjD5yny2xSfdM7kiI4OU=; b=mJNU3qm7YSpg/v/cnEpwMNPgHG
	kB708y07id+/rDSxlZgwR7h23MBUF4m5otNFA8jtY1BZpzgpcuVuSmLua5A0LbqfiWYjF/N5Cqeev
	HG2h1E3ZLvTvm+sI6miiP7oCAf3gz7oSiCZyuhasDfTIAvhZbGlg74rZHbQlfn6gUc91Iq4B8dW43
	iRBNVhZCD14vWInd7lMkqg9quxHg/T/Kw1ajSayeEMQjWLO6kocv+iLuow3BRWHfm9WZyoM0tXk6z
	LuzEeutqVEw5C8PhT3301bnoVuWQFM9Fo4Tcw24BI1fnrbHxI+IKvdRW/yZK8frvLBviCszZjCOLh
	LkDV6kPQ==;
Received: from ip6-localhost ([::1]:47182 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lw14o-007kjT-C3; Wed, 23 Jun 2021 11:29:50 +0000
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:38301) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lw14j-007kjJ-Dg
 for samba-technical@lists.samba.org; Wed, 23 Jun 2021 11:29:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1624447782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oYMchobsyO1/l5ZFtFet20yHjD5yny2xSfdM7kiI4OU=;
 b=Bc8MpfvGoKaqSeYtPDJRBVsMlbDaHHaFd3QV8Y0TqpB59UZevdd73mVQ7Rlu7kRhBqZ70u
 fA7D58kshg8L2zishzKztQDcai69EH3du3ALEwEz7Y2PT5b5LKI0smwRwxLUdfTvuLwWC/
 MQ0YS/QcCca3pwssDuMHzOP+PPTMbWg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1624447782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oYMchobsyO1/l5ZFtFet20yHjD5yny2xSfdM7kiI4OU=;
 b=Bc8MpfvGoKaqSeYtPDJRBVsMlbDaHHaFd3QV8Y0TqpB59UZevdd73mVQ7Rlu7kRhBqZ70u
 fA7D58kshg8L2zishzKztQDcai69EH3du3ALEwEz7Y2PT5b5LKI0smwRwxLUdfTvuLwWC/
 MQ0YS/QcCca3pwssDuMHzOP+PPTMbWg=
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2053.outbound.protection.outlook.com [104.47.12.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-XomPvFXyPSaNKlf5bOLxXg-1; Wed, 23 Jun 2021 13:29:40 +0200
X-MC-Unique: XomPvFXyPSaNKlf5bOLxXg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=evUrycrVeinvrMUPQYfMpnfNXbCe6QCfcCmjevqjWX3Oh7HjiSejKaMSPVz3WERn/rOgIsME12lt/iqkA0SfKeKRlUa7GW0bzW4CZ3Hp82ZdpXKXe59RiT+1QWK1EW0CJRogH6zWxcH0QItyVlLwrNHx0rpWT4kVAuN5ZKrDKTIrFypXLAmhYvJ9+gKy4JAA2RXoiePz40kdEFCvorxnCmXZECOgmeDSKQAKLU7eH1SNpQaqm+jHV50LpCEhrPnmPPCOSCm5CL9cPi48slr2dh62ik5m+VxkEiLfJtoH6cXH3Yr2vjlBoOaZs3ak/A4j6+L8vq85OHPQg6H2OqeGYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYMchobsyO1/l5ZFtFet20yHjD5yny2xSfdM7kiI4OU=;
 b=BkAAYBLfmzpjlpX+JYTA7UKzvfTyWnQLCZ4wYRrBbptx4MuHLD/YU1ng4bRvJNiq681H9kkfohSssOPw9j/ay5R6YVVVTQfI6Tip1ZWod22wpX9Xw84G55Z7dh/91D3pzn2u7r92hyhiex5bbdOmf8PjR/6YvgJfPK6vWkqGJuP9NYmqGay6HW68zHrPEx79KiEyrZ8E6deXrCAb3dlBhHPcLL1xVVO9VS2OF9O3c1HLy7tPIQa8iszHYc3zwbkWFU9WCSFvQsfxZlReEgiNQQdJHC5vhvCUXvUORw9cRaCfywFFkLiNoMqeN8Laka8uTb7v4VD9t0vY2kNACOrpWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com (2603:10a6:803:3::28)
 by VI1PR04MB6912.eurprd04.prod.outlook.com (2603:10a6:803:134::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Wed, 23 Jun
 2021 11:29:38 +0000
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::18e7:6a19:208d:179d]) by VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::18e7:6a19:208d:179d%6]) with mapi id 15.20.4242.023; Wed, 23 Jun 2021
 11:29:38 +0000
To: Dan Carpenter <dan.carpenter@oracle.com>, Steve French <sfrench@samba.org>
Subject: Re: [PATCH] cifs: fix NULL dereference in smb2_check_message()
In-Reply-To: <YNHCq6N9bAODxvnp@mwanda>
References: <YNHCq6N9bAODxvnp@mwanda>
Date: Wed, 23 Jun 2021 13:29:37 +0200
Message-ID: <87eecsrf8e.fsf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2003:fa:70a:9978:e3b4:c6e6:8f68:a927]
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2003:fa:70a:9978:e3b4:c6e6:8f68:a927) by
 ZR0P278CA0042.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1d::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Wed, 23 Jun 2021 11:29:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31ba8201-4c63-4bd1-eba7-08d9363a2fae
X-MS-TrafficTypeDiagnostic: VI1PR04MB6912:
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: B4TP9+eGzcE1ceiVAtP5+x9oNBxuT/GXmXcuoRZ0Oxe4V9DFXURxTOBCpTKsA+eAXwTDjJtsfkpg0nkWMKKdA2po7E70z+ylr7LMuf/7oDN9jq0iI7Ee41l0Doe53KhR+uu0g0gZJK99abU4szdbgKF+L8KbEwyhtMH/thpfq2IcZzzjS3Q5p8DKshrSf4mGF60xBJvflgCF+hishXwz+NWifs/dxQ84RYiTnRfxQ1jnJmcIBTW80XKA+QxfLHSXkwmt2LA2yQUpOWHkTAwqk/PyRbqG77Zyaij6HpUDSR82FQ3NNYJtz/Jibv1p/3AkihuRN/tgS/9eaj/503RN7ik1y8wwhUse+eG9rR9cMYzHHoJ6U7yRw0xQdzSWGajpuLEmMBO5dec3rFJLzZhTxI3JMSsKOLQgdqJ93djTWU+ew0tRzZemfQbHEtBuE5R9y84jmZ9ad7u5w1h5S7bkNazT3cCPA5BycmP9kmMQAUlRLrTz+y+XC/dflWp88vEd2YYfufDruvUbe8UyvFA/J8JMIyt4F5AL3ay8IXDhuiXjASz3L7xjrVgKGhtlpCjuBUhMS0ncVXPysJJ6Mqw/yxR3xtxafa7Qj02nUE57rXg=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlZvbGNUZlpDVlR1bVNYcnpNdWpZbDRHRFJVQ2NzUUd1RTZNQUtxdXRERk05?=
 =?utf-8?B?Nkt3dnZMbjdUTGNoUWpwdEZkcVJtRVFZVDhPRHE4dFJVOERET1VHNS9nRG1s?=
 =?utf-8?B?aHhXRGUzaWs4RVNmblNpbDhZRmN0MHdVYmRKNXA5c3JuYVVXLzZKUkdSeElS?=
 =?utf-8?B?amZjVVQ3TWVLNm5xOVpnRlFjeHJIWVZhNDFZTTdLTU1ndDI4b2YxdFJqSHNv?=
 =?utf-8?B?UlBQSEFZWk9kczk3eUF1K1RiaDE3cFpwNE5waWRZUXlaMGx4VFU4Q0ZpZ0w4?=
 =?utf-8?B?ZDFGbS8wRFRwVTZZVjEvbW9jL21IK0p1enBvc3ZNWFFvNDJWdmMyNCs1Q2Ra?=
 =?utf-8?B?THdzZ2JFOEIya0xOeFRUam9uZWw4NTBGeEU3b0tUQkhIOG5seEt1MkhIMlhj?=
 =?utf-8?B?VXlCNkhsdWZScEpZZHp4b2JjSk9VMjh3UVpBNExMVHhHWG9tSkpIdDVqYzhX?=
 =?utf-8?B?bzVheEIwTDVQL2NpSVJDQkNteEJTQVFCSTFCOHF3OFYyZGw2Z2ZaY0pScjFI?=
 =?utf-8?B?bDl1N3liQjgwYWUzOEJJMzFIZzdZeEpyVGlpVExSakVEME5VSWRBZFU3Q2Yv?=
 =?utf-8?B?VnFta3ZmUHNxZ1BEYWJpakRWRjI1R2JFTUVPS2RFN0Y2WVgvZkV5b2tyWUhK?=
 =?utf-8?B?enk4Qm9JOW5KYlhUbmxVSkg0bk9yeXF0ZUhlVGZuYmEzYjV1RDE2Q2N2ZVNC?=
 =?utf-8?B?SWM0R1N6anR5b3R6N2lja3FYMEgxTXhmZ0VOeEhIRmpGMEFIZ3lBaVZYMDdR?=
 =?utf-8?B?TkFnR08wc201S3huek0yTDRkc2tqcWtPaGNsK3QwVmNkMys5UGdJalhTQlNv?=
 =?utf-8?B?RFlPNWRoMkRPbkFkbHBES2VOWjl2RlBqVVZvVFl2MTJPK1hFVS96cndSZzdW?=
 =?utf-8?B?a1FidGV0eG1YWHRmcERXVDV0dnU4UnpkR1BYcnQ2ZEhpQXE3MkhseFU5UkQr?=
 =?utf-8?B?b09BV05MNkszNVhBbm1VbVdOc1MzbnE4Q1dTcGNCTjZnVGZ0emQwMjhCUk0y?=
 =?utf-8?B?dmJlSlZyVkZHMEpwWHFPRWJwQnVOVlc2cHdSWXZmcklzdFRNdW1sY2Z5akNX?=
 =?utf-8?B?aVQyTExsVUdNZmFmZUtPZzFKS3hJQVh6c0dEczRLQ1VFUHRYRnlyTkxWbVo5?=
 =?utf-8?B?OWZ6cFIvM2lHT2pzQ3pJQkloUWZzeHdoa2hyM1kvZUp5aE1oYkJyN3lETXlH?=
 =?utf-8?B?blZnYkNVNDRhbUFYQ3U0L0MxSy9MZUJkMnR0S1hFYnNKcnN4SE5hQSt0cUdP?=
 =?utf-8?B?WGlSNUp0T1lZVGV3Z0k1M0QzWTlSdzU2Ti8rdFdiMFhwUVZuSGZ6ZWM2Y083?=
 =?utf-8?B?SDE4K2pjZDdyK0VINUkwbVc1ejRIOEVic0RvVm9jMjJRUkNDUjJoVHo2NjZp?=
 =?utf-8?B?VzVuN2hpMjdwbk9aSU1YUUYwZ3pjWVNwU3FPVHFZckFWeVQ5TXRhTEN0cjRT?=
 =?utf-8?B?ZEdWK0xsQmdaUnY5VWxBWEpudGZ2NFhQMDJiOWx5WklEWW5OUHc3OUVrREEy?=
 =?utf-8?B?YWphNTE4a2dSZ2FIUlA3bUlxb2NTb1B2SGIzWmRaTUVFVmUybXdTTUV2SW1w?=
 =?utf-8?B?UEZ4QldmNS9iVVg3Nm14ODFscyt1ZnNRSE14QXo2UkJGcUlRNTZEUXcwLzJT?=
 =?utf-8?B?aEZnODJaVHpEeVpOYVcwU09RK1BabnlzQkxDckQ2L2VuRDc1SHBzdjJOUVRO?=
 =?utf-8?B?a3NPc1pWNW1jamhkWVVyMWVEcUhHejRqV1prYlhRcWlYSTFPSTlSa2FPUldN?=
 =?utf-8?B?TnNFeTRaZThjU0lXVVVhb2t4TWRBWUx3VndVdk82cGNFMDA4dHY4NkNldk1F?=
 =?utf-8?B?ZUtEUXVuZkR3Rm8xSVd5Nmt4MWpzWkg5anpiZTErM3pBNDVwaHBEWExYUHNa?=
 =?utf-8?Q?ytxz9BMRnEefy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31ba8201-4c63-4bd1-eba7-08d9363a2fae
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3359.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DccjDMHBgdXsW/vAJQlxwoqV3+vBgkxeSb/tK5CY5oo3CialfxNvwBF4xfoirK6h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6912
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
From: =?utf-8?q?Aur=C3=A9lien_Aptel_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?utf-8?Q?Aur=C3=A9lien?= Aptel <aaptel@suse.com>
Cc: linux-cifs@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Baokun Li <libaokun1@huawei.com>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


Reviewed-by: Aurelien Aptel <aaptel@suse.com>

--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, D=
E
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)



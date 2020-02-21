Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EEA16822A
	for <lists+samba-technical@lfdr.de>; Fri, 21 Feb 2020 16:46:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=v9inrVG0e72NR0I/x4uou/QM/w72JdmTOmMB28rwFc0=; b=cdEsEmzZsmz1oiyjEozyjgnHkt
	cVj16JPi1APaY/PdGBDVI6FpFqvu7GkjX5xla80tVOD8u6XNn/CngUW8dkepdIdlRGLKiZwZcIQaF
	URaiKmFCmCObDCcJJArb2o4sYMHPANVseiGAvPgmV8mYXzfBxhdzL0byjpP87ZykMAT+mRrdsL7aZ
	a0bPTQBWWt10uTm/aTqZgktVkufrH3+V/56k2KOFllAGgSBOOMbhMEqg8MRlQ7JTB5eQ05QEGBeXN
	Qiy75Z/mZ1V+9OnA8ayKI2FZly9liSdZGKXHMzaA52Mxp3iWhK+My6tFf+8adNwnExxok6DQ293b/
	fVwYnBjQ==;
Received: from localhost ([::1]:24028 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j5AUx-00AwVf-9X; Fri, 21 Feb 2020 15:45:51 +0000
Received: from m4a0072g.houston.softwaregrp.com ([15.124.2.130]:49517) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1j5AUr-00AwVX-LC
 for samba-technical@lists.samba.org; Fri, 21 Feb 2020 15:45:48 +0000
Received: FROM m4a0072g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0072g.houston.softwaregrp.com WITH ESMTP
 FOR samba-technical@lists.samba.org; Fri, 21 Feb 2020 15:44:47 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 21 Feb 2020 15:42:57 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 21 Feb 2020 15:42:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XogoiCFVk7pcdzMuIE5/givvm0oTQA6H8u8DJTzANSaifMtdg3e5rq2PhFNdS2mN5IddN83OvMyruGik6zRZrXtlNIpoeho5CPOph/OobeGQu6C8TGviYkbjGhzqjvN2e+OOz/gklud9Udxme+z+2xPusAUUUZBVBQljsVVxLetDPfQH5Vz3TX7Kc3cXaTdLabEQZLnmdZBEZbvINJkD+WVGOGPk5AKB7ncgJzjFABnTOsa8Tz/L9NX9VhgWs/yKLonarKLJYoW+2jdyy9lH5ciufr4i4W2BncHmu1s91Jkpyh0Mc4RgeLnFfD8e7evb9W8Sm6KAGudDHkW3ts9aDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5lUwy+9v7E9qMXiWEuNz1NyZZLYnby7IOMi9vtcJls=;
 b=Fpce75s8PZmn4g98+gSn0UmXiR13wKTPsCfPafbvR9N/NbenuJdjhNU+IoLxO16ayUCS3td2v3er5tIbgWcrlwBUB2MLFbu02HkB7ZhezMyR2UF3ag46Mq6vfXkrJuyQTTk2RbT4OE8HUhe3Ob6QFzWF6X4hBFaxF6tg5lPbjU317nc2cFICO6wIeMHAyYDZ70jZwnTY+fSd8FeUZcGA7b91FX+zpEbnk46BhFzDi7XBLP9ib4FKK+6alF9FlQDoGMCb1PMtji2i+v/GKM24gwGEBwmMWYMpVYH/HP1tKWeJ5KkSCQetrg2Ta+fMjjfNQFUxVn/fbZ6IQTl7S2vF0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=david.mulder@suse.com; 
Received: from DM6PR18MB3161.namprd18.prod.outlook.com (10.255.172.90) by
 DM6PR18MB3116.namprd18.prod.outlook.com (10.255.175.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Fri, 21 Feb 2020 15:42:56 +0000
Received: from DM6PR18MB3161.namprd18.prod.outlook.com
 ([fe80::54ab:ab05:458e:8c67]) by DM6PR18MB3161.namprd18.prod.outlook.com
 ([fe80::54ab:ab05:458e:8c67%6]) with mapi id 15.20.2729.032; Fri, 21 Feb 2020
 15:42:56 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: rpc.spoolss and rpc.wkssvc use RAP
Message-ID: <7b5a4761-1490-7aac-5ee5-1271eae751d2@suse.com>
Date: Fri, 21 Feb 2020 08:42:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
Content-Language: en-US
MIME-Version: 1.0
Received: from [192.168.1.10] (74.122.77.94) by
 LO2P265CA0029.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:61::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.18 via Frontend Transport; Fri, 21 Feb 2020 15:42:55 +0000
X-Originating-IP: [74.122.77.94]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4976eec9-28eb-4f19-778b-08d7b6e4b858
X-MS-TrafficTypeDiagnostic: DM6PR18MB3116:
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: OM1Wxigwki3vQSPQF9j3K0KizwvzK7WA7jzW9+422aKuZsiDVvW5UUS4Uq0qCaaslrMs995rHAw2/4tt64HlwgaILzMEa/aYVOKllfUoU5LOIOvk9/QCbyrgRrM82BJ0dRZEBZTV//GEaGcMZm5wi6oTzrxaF15xEe2MhWJrxI7ls7LV033OmKq15NleLqzbsHCKy2M4nGj7RYYPPSPV7O/RmLDrzIS7Jqk998TtwgjHOerCUlAcGA32pZ4VzmiC9cq/wcTvgQmcQKL08rUGJg00y2GlWHKLpwMpPlk3dc4GfkLGy6gkQ47FQ6TGaoMVB0QQX3PQyM2N+8iC3AE8wHiT2ymc6Q5pymt0FCo1v7AlhEFXvxlwQZjRW3lKwIXkRhn2Bp8XCaowEdiWVW8mt99Fo0H6c5ew6e+vq1iXajIdOG1TF0e3hBXlX7jTPh/zEAaK5Pz1z+ROzMqkG5Q1Z8Rza0mTLASKTJH6JBDTPXhnBIVNsJTIgPU858dl+djkpsJKIbpNW8qaV7gMJwzJgw==
X-MS-Exchange-AntiSpam-MessageData: 5oRb+XqCYLkHjKgbdoYYRk+4TPrDFbugt7Q4eEn2lBZdq8de8LBl+5Hkspzxwk0TEXGzL59n6DWMhcUv+/DCiOhiz3bXfLbR1e515ioz6/bAKOozXtSrcSXIgzTwZ9K4yCJ9CXaxCaq0lC+oWtCEWg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4976eec9-28eb-4f19-778b-08d7b6e4b858
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /bVK5H2/jcgO8LLqvWibi034mhiLD4k3Hxg8qEXB/MXPsnOal6PfFkiQIM3H6nWDAAJXCPnfGli8t4nhIwX8tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3116
X-OriginatorOrg: suse.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: David Mulder via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Mulder <dmulder@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

When looking to create SMB2 tests for spoolss and wkssvc, I was blocked
because they make calls to RAP, which is deprecated with SMB2 (according
to
https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-rap/66764=
94b-2a48-41dc-8289-009895f22ab9).
Specifically these tests use smbcli_rap_netservergetinfo(). I couldn't
think of the best alternative here. Anybody have any thoughts how to
work around this?


--=20

*David Mulder*
Labs Software Engineer, Samba
SUSE
1800 Novell Place Provo, UT 84606
(P)+1 801.861.6571
dmulder@suse.com
 <http://www.suse.com/>


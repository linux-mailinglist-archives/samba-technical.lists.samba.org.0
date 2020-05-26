Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D56E01E2A2E
	for <lists+samba-technical@lfdr.de>; Tue, 26 May 2020 20:36:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=/imt1auhV715dKgNHN5Qk9UvkDhBOPxIfC0Ok/eZW7E=; b=d9KBMc9gOi6T9Ku6Usz5vy9EuA
	4JPwiD2JjWDD1EYk3lv06UmzsMBwQKciSW9zL/VNnOcwelFjxSJ6mVtrGGygC2oA4dTRfBGw4xNAX
	MSKf6oPqMZW0x6/WnDLu6PRO9dlUX5XVTS38LutH6BjVO3T3i5fHL5Pm1CiV2NqSH8jYwZk7u9ydZ
	doXRizcpPHag6fXNL4n37drBZye5HTCXBstTWKPL9xPGHU8E6gwytwwJxmeB16qU79hNUZEKm1PAr
	xq99Df6w0ohFI9FQXK6s3KKJJ2egEKb9wIXiQ42ZnwCpYw1xJj4ROfxiCCU8aEMsArNhRfFXr64sI
	QraH+uCA==;
Received: from localhost ([::1]:37352 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jdeQS-0060Ax-Dx; Tue, 26 May 2020 18:35:44 +0000
Received: from m4a0073g.houston.softwaregrp.com ([15.124.2.131]:52035) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jdeQN-0060Ap-Pp
 for samba-technical@lists.samba.org; Tue, 26 May 2020 18:35:42 +0000
Received: FROM m4a0073g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0073g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 26 May 2020 18:33:05 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 26 May 2020 18:19:03 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 26 May 2020 18:19:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PbA7yxC2Z4+RfHrCp1oa1Bz+7fa+ZEURVyCORQ22S0X8EbGJThfbYBLBckJTgbxs8b3XtBMZ4cmNpiHdqm7g+ieaCYbj37vBFjqjiJub/LckItj1jNCChccZpZX1AnsyH38De2vxxpmVajXydmQ/COsbPcRh4IHP3pmgDiv/SCksVk53OIIQo+eKZQsG+GrmBxwaJmQa1FXAkCc31UA5KKdomG33W28r+bTVCt7SXUch9cjmCgQBohI8588NzFPm+t76bBA7PRC/+zwr96nlC0cwzFETQJVoWtPiYRYUd1l9Yec5BNxpcvzt6vUthecc1aSVyZCx/gGTork0NHY4hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/imt1auhV715dKgNHN5Qk9UvkDhBOPxIfC0Ok/eZW7E=;
 b=aBnPYHKaujCRsU6tayT6Ni77xDMj4tbUnvGeZm+DJC5Z/lPJOwmsp/nXQkT4JMJKfwx+x5uEvgJPQyilampOW1falfBuXL9v1b6Cf+Xk9qBhxV55zL61EEfH2ASYxmm+x9xnNrqDNe4v0JyhViNulDDilOt++boYgMfaMcF2jkCAXiTCkV/QFFXmIm2uLm0xzD5suPmWQLzMBcNJCd8zqQpeeGIl1UUDjeVN1Xr8Uh62sjAcQrkbVsZWz7NgWCTkKamPD5N+3JOdkrpKpNdruydxd4NAvLFNu1w+cqELK+BE2eFrRCiDOBQkjomKtabDsLEyCn0G3VrhlZdXd2S/vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.samba.org; dkim=none (message not signed)
 header.d=none;lists.samba.org; dmarc=none action=none header.from=suse.com;
Received: from DM6PR18MB3196.namprd18.prod.outlook.com (2603:10b6:5:1c8::26)
 by DM6PR18MB3458.namprd18.prod.outlook.com (2603:10b6:5:2a2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Tue, 26 May
 2020 18:19:02 +0000
Received: from DM6PR18MB3196.namprd18.prod.outlook.com
 ([fe80::a1e5:eb3a:7175:3f42]) by DM6PR18MB3196.namprd18.prod.outlook.com
 ([fe80::a1e5:eb3a:7175:3f42%4]) with mapi id 15.20.3021.029; Tue, 26 May 2020
 18:19:02 +0000
Subject: Re: New Contribute page on the wiki
To: Jeremy Allison <jra@samba.org>
References: <8b444948-cef4-74d8-a455-958446832aaa@suse.com>
 <20200526172611.GG18267@jeremy-acer>
Message-ID: <aa76e04a-f29f-05a0-97a3-82507fda5e72@suse.com>
Date: Tue, 26 May 2020 12:18:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
In-Reply-To: <20200526172611.GG18267@jeremy-acer>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.9] (74.122.77.94) by
 SN4PR0801CA0002.namprd08.prod.outlook.com (2603:10b6:803:29::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.25 via Frontend
 Transport; Tue, 26 May 2020 18:19:01 +0000
X-Originating-IP: [74.122.77.94]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a2ed485-f97b-4d5d-4658-08d801a1446e
X-MS-TrafficTypeDiagnostic: DM6PR18MB3458:
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: k6i3dngFU32gNUghitUoGEP/CZ27V09Usgwp9bhEWmPet5ER3o7HmZml+pcdlwQhCNBDBc1U/j2Q2SUTIlZc0m7/E00zEOa/6GAKzjcTN54sYNJq3tY1tfVcau5BsNlF8R1u9FuueypWjkQ/qsp8u38n6ZE8UtZkbr2g6LS/JGqKnbd+887GvtyHOvMsmcEqfEqlH6epcOdpLwobohdbGzNOPrTYVCCJeTbNeXKuPdCJHyM/MmZfaBu4gWJ2+m2OE0ZJ52jhYs3Y4Npfqf5p0bldQ9HElUj/mlZoe0znlhhPt1E+hkULdRFNtZAutpftfvqUybeUGqwJn9e9jsUEV7Z5DK4k9F3VXmGdtDz8t7gwUzPfe/BjPicXG9BpByt7Ueng3N34CS4XGKg5ouzYmyem2HrTZOjLDurkrYmoRSk96KX3RSwSr3gboX6W6fbaeglOKl4L6OiQ2HOM4ycoOQ==
X-MS-Exchange-AntiSpam-MessageData: sO/SbhtRyD9/8UZasjzbuMf/Mwde7j0136qFnab6YPhxkAMzssSN6fntOQco1stBjTFsvkjDG6x00VhytkAKqUMJWEGTQnW1uVSx4FuKqMs/wESNUXll2AFwOiCVVfoouu0HqhFUy6ooNGEBATqmVIZkLaR62QvtLrHO1z4HsOqMDOXa/0WkEKOgE3DgHF1wzjVJVxc/QMk9hRLlvHXyXPQMNUtEDSnKpB61E2WLjckAGIPoRmWRJiplHCCillxSsB2oTmuilzIyzhyTTYLfqvjxwUrkEsLlUs3gq4Rfnq6Iw8f/hyMY6VdDZB/bjO7VKRvuJtC/CIq9yJKsThr1Jhf5wRDzegbrtMXS5GcMYYICPMIb2gaB7pXTEZGp7Lx7bdK18slIvF2jG2zJylt6OFLfSc8fPjfJUVY8uSD1536/nVl/No+VMe8IdBngf5oU0tqz9zuwuNsyJIF8L0sjZIVB81oU3iy4XdZgNjyNRjs=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a2ed485-f97b-4d5d-4658-08d801a1446e
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TAN4Y0zGG78VARME1+3nwSdZAkQTtEgoo2p23P5KFLy8xczASpb0sdGyfzvwCsxirWf2HEZqq2EDcpIKpmV/NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3458
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
From: David Mulder via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Mulder <dmulder@suse.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

> The only thing I'd add is a link to the (C) statement
> and an explaination of why we need it for contributions
> of big (more than a few lines) patches.

This is mentioned briefly in the 'Prepare your patches' section, but
I'll add an explanation of the 'why'.

-- 
*David Mulder*
Labs Software Engineer, Samba
SUSE
1800 Novell Place
Provo, UT 84606
(P)+1 801.861.6571
dmulder@suse.com
 <http://www.suse.com/>



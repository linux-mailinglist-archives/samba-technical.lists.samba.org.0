Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 570501E2418
	for <lists+samba-technical@lfdr.de>; Tue, 26 May 2020 16:31:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=zC1UVnqe0YACouDOkFgA3mvFvDDYYhvb7RbUIJbGsLU=; b=H9ZTxXRVR2IuW1+43UDeZ/ugNp
	hDG4jqXaK6G3JWdi3/UQAxZr8TRDh1LyJm99b8p5GiPDfzTZdE6PywgtDaTm7AWZitaTdPXuWhx1z
	ucfTF7uF0iCh6LMFi6bhH+BADPz42VW7TlI9GPuUZVlXh5FSEGbBd4sUtB+cUILIbGKhG4MDE9YTE
	u8aaivdl6y3LBgWeJQM+2CnMH1qlvsSWUUBI/r7E4XZHwRgC2+5cZ0qbJHGR165+SEjf4+AZK/3AK
	JaUOyHpRKEUhbdenuKi945wKs6PKbeYnVXm87VYgWfbog6XtVGqO+TcLirMCHm75FEe9AJZI+YJfA
	yR4+JbnQ==;
Received: from localhost ([::1]:64938 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jdab5-005xNv-EG; Tue, 26 May 2020 14:30:27 +0000
Received: from m9a0014g.houston.softwaregrp.com ([15.124.64.90]:49713) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jdaay-005xNn-HE
 for samba-technical@lists.samba.org; Tue, 26 May 2020 14:30:23 +0000
Received: FROM m9a0014g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0014g.houston.softwaregrp.com WITH ESMTP
 FOR samba-technical@lists.samba.org; Tue, 26 May 2020 14:29:37 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 26 May 2020 14:13:20 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 26 May 2020 14:13:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JnAU1sw1O7HzvgTA1VtxU53GJBujNAhRVEU6IVGe58qtTLSnfQBWdbSM5R8j6X8xG5Eoq/2ka+JNirMLHjkoNhYnhNcKnMpvyKoHd/55OIeNPz7Y8202ZUrek+QKluM1/39p1a8d5QlAfQzd/0fnTGSqiWc9raogIDB/e99UNgzP26djL64kUyVySnC6TM3pfaqUFQ3ms82yyviXlw2D4ogwA8lT1+vMR3qZdbxEijqSk6fwDQ7pvpY6waDR9qQ1dGjKvpvBAnZRZTvoeErx7cBYKc+siALy5ex5ZoRnHqRSIMaRb8ZpwrWkztCMqYvuZmG7O5rmEaW5bhq8F58Hbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zC1UVnqe0YACouDOkFgA3mvFvDDYYhvb7RbUIJbGsLU=;
 b=M1T7G6Jv2YgV5okA0YUKGBh36dXvsJ+B1kaEWOr2sqgCXgQEiVNpBtMmCMQDd2FSBdpsS2EBcngrXMTL74WkB/bis90+F10/o5ExfGSk4XFyAJfpPoIheLlNtz1pmxxpw6+o7Ss//u+Rfnh9OrcJk7nuGUwE/JzEiAMWQ8Hp/tEvBvI6NKYUMGKeOtO+GZ8quaL+UcbLcvXrIx11Y/H0/d5xIcGjfiUN3S3jFNFptcWRE97WFZ5vcLvOJZwJAxKFCnOm3zpaoFK7oNni+Sm2XrFuswus1CPxC0VP+dnzSATb1DIz2XlF7F6jKlHAO9Lmw1GkuLS/ue3PbNVckqM5Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.samba.org; dkim=none (message not signed)
 header.d=none;lists.samba.org; dmarc=none action=none header.from=suse.com;
Received: from DM6PR18MB3196.namprd18.prod.outlook.com (2603:10b6:5:1c8::26)
 by DM6PR18MB2972.namprd18.prod.outlook.com (2603:10b6:5:162::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24; Tue, 26 May
 2020 14:13:17 +0000
Received: from DM6PR18MB3196.namprd18.prod.outlook.com
 ([fe80::a1e5:eb3a:7175:3f42]) by DM6PR18MB3196.namprd18.prod.outlook.com
 ([fe80::a1e5:eb3a:7175:3f42%4]) with mapi id 15.20.3021.029; Tue, 26 May 2020
 14:13:17 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: New Contribute page on the wiki
Message-ID: <8b444948-cef4-74d8-a455-958446832aaa@suse.com>
Date: Tue, 26 May 2020 08:13:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.9] (74.122.77.94) by
 LO2P265CA0391.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:f::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.23 via Frontend Transport; Tue, 26 May 2020 14:13:16 +0000
X-Originating-IP: [74.122.77.94]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c533697-5d37-4c43-8076-08d8017eefa7
X-MS-TrafficTypeDiagnostic: DM6PR18MB2972:
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: shre4b9W1rs0D2XQv5WPovZMyfuCPQE3Id2OoOH1WoVRNy4/s8RsS3aKfm9+YrGhXAq8ZajkDt7Ci/svYRkSqBiyWTfKCOpD1rVKPjjIHqilpJMQtExPpS07B/1rYQ821XKNFlR6Ee5INjtwLuitvWmpojDGpWIgkalQGyOzncu4tKm3DU1Wu5klFhDCmBLqmFno7R5MF1+tHFERL6fsa9iypmEPEFwjQeb9Cx7MI3+iVOisjO4zbMbYMYJU2Xjuwn0o8PaphMzCg9Tp225JUhm/UdREhbuoxuzcej9gDjhB2YGS1v3bSPQdgqYpLJt/29lNtR3ysMB64sz5abceFYpQwdmdmEGv80rAjQ1dDPdqzRm4e6VrWiAO8+0wYU/5iDWuNX56KFYJBZlsqNUDVTiEWXCKaounV36lKqOrXgM/9/rD+/RcLysxinzWZ3X7T4YFOGwLOxhllKvTbsWfpg==
X-MS-Exchange-AntiSpam-MessageData: TEIyuKL68wdFPjeBmeJkp9t9qkeJvq6gc0uZwzQu+1M+gHSiERBUrHhfxghWSwsF5EBnL1uerc03XGLQdT6a6h02zJIqgDDflHhSvjqfdChv/9zVRBRmGU1v5uryeLRroydu1c1/dJZ127F4uv9iZCLHtl1XAXEjzc9MwzErdpvw3OjDlbthFP6omHwflnZ6odasPqR2QLriIfJB+nbxnOQ1gYQGCcEaVv/bAd3SxkUi3+LheU+8GVwm5uVO1NzASanPT0k4VCcIj/b2+m2RZPnsUMZLNGGCDHHtxt2iK/lUtwpZmvNxdMBp9tfyMz5ECZgehuhQbDAYATkp5YCfQee5v30KIqMSbrcjYP2BG7dGuTO7HE1DM0Dthyea91IqaGiHhtL8k3imhNYCXNMhf3yxcm5ECrDIhSqMnno2ye4rhnGHekJsooeAFeGwkJwZvYnvqv7F38fOG8Xvv/MUnqkjm3TcGKy5EqAQ5ECO218=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c533697-5d37-4c43-8076-08d8017eefa7
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hGZzZQa2hrT4if4wf2ZEza6przSe0dd5yHaV6QbAX1m2F1FnvdS5UAuQ4q6mpE08WdxG69yg7ZiBQYhxDmtzOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2972
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

We've started hashing out a new Contribute page for the samba wiki.
You can view it here: https://wiki.samba.org/index.php/Contribute_New

The old Contribute page doesn't match the current process, so it seemed
writing a new page from scratch was in order.

I want to start a discussion here so we can hopefully improve the page.
Please comment and also contribute to the Contribute page!

-- 
*David Mulder*
Labs Software Engineer, Samba
SUSE
1800 Novell Place
Provo, UT 84606
(P)+1 801.861.6571
dmulder@suse.com
 <http://www.suse.com/>



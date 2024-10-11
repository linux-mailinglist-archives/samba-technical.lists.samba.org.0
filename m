Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EBD99A9CE
	for <lists+samba-technical@lfdr.de>; Fri, 11 Oct 2024 19:21:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=nrh/UT3Q3N0kwtfBuWXYTMm5f1WoGdPc2w0QT6avpM4=; b=i4fbrA3q9lSoX159a5H/SAY6a/
	Rjs4Ejf/IdnjGajkNSfzut4R62iuOSuGgfgYOntZmU0qITGxgRExBSVEDmYe5XRJhpLFffVICwlMv
	XisGCi61+46oPyEhRKn0A7zImpcxHG8blvCo4T5ehncsbUQwmt5TjLAlLGf8vmsICl6ufp62IMrhb
	GX8kmBDmCJd42DDopkbEYAlyzPwwjwUyBl3wb0po/gKHowBdU4BbFIqAjg3BXp8XsPTqIaYoq8bZm
	RyVxP6w9fFyPHJy0ZIBC2zqdVL3izeaVfqCfU/vssxSIQuYM+qhODJu9FC/5PeyqABOlnlVNdksh8
	4DP/Xo/Q==;
Received: from ip6-localhost ([::1]:18192 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1szJJg-003eab-My; Fri, 11 Oct 2024 17:20:40 +0000
Received: from mta-64-226.siemens.flowmailer.net ([185.136.64.226]:49903) 
 by hr1.samba.org with esmtps
 (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1szJJb-003eaT-WB
 for samba-technical@lists.samba.org; Fri, 11 Oct 2024 17:20:38 +0000
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id
 20241011171023054947bffbce963202
 for <samba-technical@lists.samba.org>;
 Fri, 11 Oct 2024 19:10:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=innomotics.com; i=michael.osipov@innomotics.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:References:In-Reply-To;
 bh=nrh/UT3Q3N0kwtfBuWXYTMm5f1WoGdPc2w0QT6avpM4=;
 b=SkuRca8tpZcCz+5cBAdgnsrer1cVJtqNSTA14GEpkOZqPLCk/8s5c7Gjqy0Ez9kQte4ckT
 lBGF1FAUg/Jgv/Ajh27smLEFFzE8rkkVYj3R5WT30KGsNJcDFa2ttOSezLrwi7tnIgtrPPwE
 9AoXPq2GhzZgfrsHSc7I4U6imxnS8LUyH7ND2a3dPpUCfwkYgtsIxSMTIGuzXmKdb/8drOrK
 xny8F0MZClGWLQe3yq7Qj6LLQo00d6CySji7QUBHD7UB6Ff0jvc7udhrOTOl3HXPTmFxWA+y
 IkQO/NV5NfxJ7rDBGsLexzwfofyPT5IWkVYbgosYE/VRUJpgSgWig0KA==;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gH3CKGVmoEgKCLyYzSv82hP1EwoRSStS6VPw99BIF/YYRvFLFlloiFvDrSEIwdoAQ+xZDoSDY01Dy+eRviFmrLn31PZJ/0ZDwsr0YWUkK9sUZSed6tn2h9a0gdYik+TSEBGPpi4E7TDlefGPbBJfvGTiffxi/AcSxkop67lMLRXcjGItslTLLxcH2/wcYbbX9FFT8ocTLSyZFaUNwwqVRrKyrs/c6lMCkcLJYqmELbP1nsINGrH9nB5qaRMkA6nm0o+cO52LibMLCF22XHAeFgu5qE2aLK3DfARH+MboObpAIDG9GuuOBGzvilunnve5TFAVH36n62aXnK+ov3fC7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nrh/UT3Q3N0kwtfBuWXYTMm5f1WoGdPc2w0QT6avpM4=;
 b=aj/+1ndDmDwysMWR+LmH1+9aMWW7AjjubBMcroxM7KzHIQokjufjCkPgCshaYr7fDvQSVapTqNd9l2UuH6px958efFmEGNRshdw4QzJnU+4H2rJ7kKvSClRQyZ9BANh0WMMbDLo2Cqrpj4FD33uaYlm+baZnQKwXoUsIAqXhYi1mtQ1HhPk9Qm1kQEbwsm+JIiDFL0TrG13eCJGDPRvWlJvtgCKptb8aw3UjMohuXHOVpQdIujWzLh5lxZQGPxbuuHcuweWlux+u7Xbmgw/lSs8xAO+zQtBPJtD7ARqJX+XRCL9XfVj4V3JsOm1Kpq0tU3/7ygJvPLuJWj3jhiN3pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Message-ID: <f85b50f2-a5a5-46c3-82e4-a86c10df40d9@siemens.com>
Date: Fri, 11 Oct 2024 19:10:20 +0200
Subject: Re: Clarification on MS-PAC KERB_VALIDATION_INFO and Samba's
 implementation regarding UserFlags
To: Jennifer Sutton <jsutton@samba.org>, samba-technical@lists.samba.org
References: <52296fc1-872e-4b82-899b-338d18108300@siemens.com>
 <1402f334-328f-44bb-9cb5-34250e0cc1d1@samba.org>
Content-Language: en-US
In-Reply-To: <1402f334-328f-44bb-9cb5-34250e0cc1d1@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAVPR10MB7035:EE_|AM8PR10MB4050:EE_
X-MS-Office365-Filtering-Correlation-Id: b72fa383-b8d4-4bd0-dcc7-08dcea17972c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: =?US-ASCII?Q?=09uE2OdRlrdXcNr9AoYdU?=
 =?US-ASCII?Q?VAE/UzCNObmYlfwQILJwt?=
 =?US-ASCII?Q?ZLKt9smc9kX8jiYzaEFKzeFm6mhvMtT4LRz7oKjlU?=
 =?US-ASCII?Q?gZ2WEsCZCO1EvGmyhLW97soAsqEdDyYj92fSQTAI4?=
 =?US-ASCII?Q?01gB5jvXBrjsxJlrw3xg97ynXF4E6vTazSJ3yzfetW?=
 =?US-ASCII?Q?b/5OGF6uNYRp41+kh5fD2QFnHgif2agKuq+j6B8dv?=
 =?US-ASCII?Q?Y5Sdmg2NxFGfdtjGoHndsRxugJ69LxMQQiKDyE2pAr?=
 =?US-ASCII?Q?9Ak+MO4Nn7VyI4ZLyWnVcHr0Dj37u70XqLbQuIJKF?=
 =?US-ASCII?Q?hnZCgZ4xGCRTGiFvT9fXam8Q4F01AMETazqnY6O9pz?=
 =?US-ASCII?Q?vDsM7LXlhEQiRetsOpnSuRnN5qskSDe0sLkFluxxw?=
 =?US-ASCII?Q?tM0qWz61KZF0AXkpoq1wMtO5E6WrCfEbi10w4u8Wr?=
 =?US-ASCII?Q?g5eXQakEavJlzn7M1WyjAnC3XD6aodcHcxaRQrAly?=
 =?US-ASCII?Q?BN9ta6Zsf2Ye+0mn3cs2qFSmDdO5Lb/shOZ+ZCU5UL?=
 =?US-ASCII?Q?+OlT4slPFTmW/ULN/Awl2BfTHKdMn49Q1eyPz5eXv?=
 =?US-ASCII?Q?Sqrp5ER7GywB7Ilk3UJ9kfxEvftW+PxWs5xISW72CJ?=
 =?US-ASCII?Q?nr7IXZTwgKyc0bqq6xrPPSAxwNqTL1eLdXcMjou+l?=
 =?US-ASCII?Q?Aqg2Jn0L6H6am+UvnxmU4QM2To6l/393UaaZRv46NC?=
 =?US-ASCII?Q?vq2cnwyB2zkPASb80Gl3fkWSnuVEfniC0rYkupLab?=
 =?US-ASCII?Q?60ZjZJNxjR5Q00gX2O7bkioHTa5YsVDA0/VlKZcGy?=
 =?US-ASCII?Q?QGfnS0Clnk7fzYuMUgXBmPv+VpA0UJGu8KdnGMxGD?=
 =?US-ASCII?Q?ktVYugKxJytQtcQD6qr9gFtWOAWZiVywJQSNtUD0fr?=
 =?US-ASCII?Q?LBnxAe3dxoq3OM4u73i/wE+6TPA4MAqKrQ7P89+82?=
 =?US-ASCII?Q?oJC6Yl4zMd2SALP2Iuw4pEWtOpIiBAX9svYkhoOfCU?=
 =?US-ASCII?Q?yn2xTRrgIAEM80+soziJCi7AKOpImzCS5LWXHzquh?=
 =?US-ASCII?Q?Pe1DTiMLzNdNM9Mw4J81lluuvKpZcKP2MJDv5RZqbx?=
 =?US-ASCII?Q?S3zuOTW2gY6ODk0pMSnoNpo5QD0BGg99frTkNk/WL?=
 =?US-ASCII?Q?4mOFfnT2gN5uHqRyDELIQMmupYW1novy1ANSkTNPf8?=
 =?US-ASCII?Q?bJKlewR83LTtvBv1rQ28X+yFtx+Rk4zAjxHHVr/ks?=
 =?US-ASCII?Q?tVvaLRc3SAKV/MVzqXRyC1s2EQnaa9e8f1KpM1wU9Y?=
 =?US-ASCII?Q?6MnPK6ppFBvmMB3EaAWGFlee4V84jfmxV3awdCZRU?=
 =?US-ASCII?Q?k51LDtM+QyQUmHJK8W3b9ir5FFAsQyq9l930WrPpLb?=
 =?US-ASCII?Q?xovXv19fgvubkaDvHN3U8abWa0BeMiW5wpfmdXe80?=
 =?US-ASCII?Q?SR4lUxyu/HZIszJ+CaqAeL27H3T+4bRnK9aBJJ74A=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?US-ASCII?Q?=096yzWQNUZAq4?=
 =?US-ASCII?Q?32K7UWDJQ6gyy?= =?US-ASCII?Q?TvL5zThx/7uOFGXruJPaa4XMR?=
 =?US-ASCII?Q?hqoJiO1fzCKfqrWttaFGQqdpwbGT3NtQNJPc9fWT5M3PaukRX+Y?=
 =?US-ASCII?Q?7jBdL5aa2EFTti/ZcWatGdjTh4uc9iBlLt+h5qXcfH6lkb48oFp?=
 =?US-ASCII?Q?cLI/D9LlCKbXaFtAqsACQfHoHVwHz4YMtBkAP6EbCWizNJrozVf?=
 =?US-ASCII?Q?6snLA/tqpSb2Sz5+y9ZglCYx8QWbIjCzbjzhHjoxf2/Qy5ruhc?=
 =?US-ASCII?Q?mGJEjDNEl4jFzsf5mk4MQFhkW/MkOjnHYxwD6rMjCJnWzo9IFYv?=
 =?US-ASCII?Q?B56hQOFpob4A70QvGIlJIfX+IO5vYQofeW7hSiwFLDcXSuKBaGn?=
 =?US-ASCII?Q?FnYyuCQttVUPTAQ4yOG4XCzEaKhcKVVNocLUvTMIjkHUoueJQTa?=
 =?US-ASCII?Q?lpS3DAAu58I7RPKTRck+idNd/YzPSeUvYwdoPrCyTVZfq2CzU8?=
 =?US-ASCII?Q?V1EBXXhusqT/HfMA0VQjQe8R7N59vxApNrO1SkAyxyLg5x4mKJF?=
 =?US-ASCII?Q?Y3BxC0YTj8WqcxYvcpQKMwcDQxu41TbSInKPH8wlum1vzQ1+Gpg?=
 =?US-ASCII?Q?du1tM1/J1rU9xQRc9ZjCwqWd4mfBqvarc37qaAcv7oE27ADwueT?=
 =?US-ASCII?Q?lc1bRsB+LZGqzbOET0q/f9Ip4u7IzRghsR5Z+zdQf+RV9V+/cq?=
 =?US-ASCII?Q?tqtzR5eYC9J7hHguylM7ib5iHvpCsANhyrGb3YWjj1Ww0ZqXQCl?=
 =?US-ASCII?Q?IUzF9ROa9E/VQQez3wxvgZVfM5Xj5HQ5FlnVOIuMY/Qw47ZUAfS?=
 =?US-ASCII?Q?09jFwJHCXRi7+f6FnhSPz9w8Jk0kF+k2FtTKVx3aUcJCOqJgmpy?=
 =?US-ASCII?Q?sD5D3QCUIqTE2dBkgPJ75IQyI5BWJce3dMUDpQJXIvMsSEWQiX?=
 =?US-ASCII?Q?527JEJKEp5DHVIdbEhB9SELojlbflizhZ9vVvYDgdBiOeuDnOKO?=
 =?US-ASCII?Q?nz8e5HWhf942pyM7SSK+N8sYaCpNvOOmjFZKjd7SEXjZQT0YFnH?=
 =?US-ASCII?Q?/IB5rOnENeJR13PjVWWxvEshnBYmWmiZMUR56Cy+y3B8B2/rRUe?=
 =?US-ASCII?Q?fp0qdHBXSxU0k3Yon1Y8k/bzHh8z+nfmxoCURypvfFtqrq8Qd0?=
 =?US-ASCII?Q?+9uIKnftSvm0eQNeg7lLCVCFbmwPOyZ5uN/NSt4GAJVIYqbdxRX?=
 =?US-ASCII?Q?iQ+kmBDfe8iqVmgZG8lJZq0EPFuYlFjzgTNZ94gplVzvW8ST+A/?=
 =?US-ASCII?Q?HiH0Zh6y7JkoISFi+qy/WxFhWx8Y2rrIHxkMdDoZTQ6wISs+xpe?=
 =?US-ASCII?Q?ornRi3GvdqHbnCMopzo8k7wQrPwc8d8fg0L0mOv3w3whizabR2?=
 =?US-ASCII?Q?jkaWeqyO0Z+XeUgvNysLx3F79wMlXGyNb6EWz8NudcT7BURT2rC?=
 =?US-ASCII?Q?eHRj6QNQGvI829kQrkb/iVwgt+mmgOL44OHZSVrRkvYE6ZYEwWl?=
 =?US-ASCII?Q?FCERhdQsdhGErR8jNtav/M3IiTGfqCEXItXLHkSNqWi9XQOvun/?=
 =?US-ASCII?Q?SPSZ7JMlRYJcnG2W/AfFvmX1329Bq6pwtvIxp8g3P6J/OQgty3L?=
 =?US-ASCII?Q?GCu5Og1fSQT+lI9JqKgz2mDR+fC9ugK03D498fSqPBi38itAi+k?=
 =?US-ASCII?Q?N55rzaXGKIeDZPfqL6rmCvcpHHpubIAs+EB+/QGll8XV70xMV4y?=
 =?US-ASCII?Q?oA5iYO1wzj1NJvyjEr8q9KjUdMkXPy4CFsZLMmoL6wW/nLfEg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: MGEFqWd45GfNK1TjOe+aiV8MepGOWF3oHR4ahN+JNTJi8x6iYNBMxxYIh70jf2iVianuYZPjmqGF+NWY6L8O1NdPDnmKyYlfov15B+y0F1oq5un8Wn9UqYER1dgrjLeNi0zHT0k8/0n5MhdSGC6mav0TTgaZM4OMuClR7JOV+OGssbttzGAC+zoTkAPKT1P6dynv94yJz17+xUFFpEios87+lqdX8/4824T7goRfe8E/f0RcOULe1ByRXvaJkCbK0ADScu95kZ/7HS5fkZu8BS+zeuwUgUy2QpbfAcAZYwlGQET1qovEYhJQ0DYBagj38ZijLWrdInJbQgpwcYgCwdQPW7uXmPvVqWvkwtojaoa8aKLgL4qgMWKD1GyXq1i7r/YPdw3AZ9390NmNvpuLLhqOsWSqBRV+3OsuQRBDE0R7+LoyM2uhuzwrNX4iOM+UnuBwgRcFwouQwttlaoZzgXhsDWekvS1ztaVzGS+Zx+o/EFoue+KDgvPff+9FrUvfk4drZlBsip4egINpNsSPMkoro9tZ+AUzNwxlGMCX6gcL9nU1eVFEKHM8bmGLdoPrCM1iKQiA37eXyhsZROTiveXo5z7S0SStZrYoImVfX1WmJ9AALdyncI84dyQkY1Jy
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b72fa383-b8d4-4bd0-dcc7-08dcea17972c
X-MS-Exchange-CrossTenant-AuthSource: PAVPR10MB7035.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fFuTtHG8hOnUEvzPUMtF/9Xdjjn+D2kXGn3nYPdZdu8Iv7dNe9D+NASQG7Po46r5EDPYMcfactu4qUn8fScI2OZQxjhBHwZXgfzqFtk/oog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4050
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-7515:519-21489:flowmailer
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
From: "Osipov, Michael \(IN IT IN\) via samba-technical"
 <samba-technical@lists.samba.org>
Reply-To: "Osipov, Michael \(IN IT IN\)" <michael.osipov@innomotics.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 2024-10-01 02:11, Jennifer Sutton via samba-technical wrote:
 > On 1/10/24 2:49 am, Osipov, Michael (IN IT IN) via samba-technical wrote:
 >> Hi folks,
 >>
 >> I seek guidance from you experts on the following case whether Samba's
 >> implementation and your understanding adheres to the specs off MS-PAC:
 >> I have moved a server from one forest to another last weekend while
 >> the actual users remained in the old forest. The server runs Samba
 >> 4.16 ATM, but also also custom software written in Java utilizing the
 >> MS-PAC from the service ticket.
 >>
 >> While processing the PAC from one specific user the
 >> KERB_VALIDATION_INFO failed to be parsed because ExtraSids pointer is
 >> set to NULL, but UserFlags has flag D set. The domain controller
 >> issued that ticket is Windows Server 2019 Standard running on
 >> domainFunctionality/forestFunctionality 6 and
 >> domainControllerFunctionality 7.
 >> Now re-reading [1] it says that if flags D/H are set the appropriate
 >> pointers must not be NULL. Something does not add up for me here.
 >>
 >> In Samba code the NETLOGON_EXTRA_SIDS [2] is always added regardless
 >> group_sids_to_info3() may actually not add any extra SIDs [3]. On the
 >> contrary, this code [4] does set this flag only if any extra SIDs are
 >> available, so does this test code [5]. Especially according to [5] my
 >> KERB_VALIDATION_INFO case is expected to fail.
 >>
 >> My question is now: How to properly understand the ExtraSids/
 >> ResourceGroupDomainSid/ResourceGroupIds when those are NULL, can the
 >> flags still be set? If those are non NULL, the flags MUST be set for
 >> sure.
 >>
 >> I can provide the dump and a parsed view from the dump privately
 >> before and after the server migration.
 >>
 >> My actual fix for the problem is here [6] and the issue for it here [7]
 >>
 >> Best regards,
 >>
 >> Michael
 >>
 >> [1] https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-
 >> pac/69e86ccc-85e3-41b9-b514-7d969cd0ed73
 >> [2] https://github.com/samba-team/samba/blob/
 >> f749330ddaba04cdae20570a9e842327715f3594/source3/auth/
 >> server_info.c#L613C27-L613C46
 >> [3] https://github.com/samba-team/samba/blob/
 >> f749330ddaba04cdae20570a9e842327715f3594/source3/auth/
 >> server_info.c#L252-L254
 >> [4] https://github.com/samba-team/samba/blob/
 >> f749330ddaba04cdae20570a9e842327715f3594/auth/auth_sam_reply.c#L399-L404
 >> [5] https://github.com/samba-team/samba/blob/
 >> f749330ddaba04cdae20570a9e842327715f3594/python/samba/tests/krb5/
 >> raw_testcase.py#L4195-L4214
 >> [6] https://github.com/michael-o/tomcatspnegoad/pull/24
 >> [7] https://github.com/michael-o/tomcatspnegoad/issues/23
 >>
 >
 > I am not sure that Windows itself is entirely consistent about the
 > NETLOGON_EXTRA_SIDS flag. For example, the KDC ignores the flag
 > (treating it as set) when extracting SIDs from a TGT to fill the device
 > info PAC buffer [1].
 >
 > Feel free to use your own judgement, but I would think to treat
 > ExtraSids/ResourceGroupDomainSid/ResourceGroupIds being NULL the same as
 > if they were empty. If those pointers are non‐NULL, you can *probably*
 > assume that the respective flags will be set.
 >
 > Cheers,
 > Jennifer (she/her)
 >
 > [1] https://gitlab.com/samba-team/samba/-/blob/
 > aac22d9ebaba854daf56b8d75a1534375a3bb408/python/samba/tests/krb5/
 > device_tests.py#L71-73

Thanks Jennifer,

I have already filed feedback with the MS-PAC specs because I am not 
happy about them. Too much room for interpretation.

 From your explanations I can deduce the following liberate assumptions:
* If the flag is set, peek into pointers and they can be set, but don't 
have to (e.g., SidCount, ResourceGroupCount)
* If pointers are set, flags are expected to be set as well

Regards,

Michael


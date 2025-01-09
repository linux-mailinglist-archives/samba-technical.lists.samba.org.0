Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BB8A06E27
	for <lists+samba-technical@lfdr.de>; Thu,  9 Jan 2025 07:20:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=7Um/CG3Z52nmq875L1H44mZKPbIoTylKWj/m90eNSps=; b=aozzU/F2dbgtl6T3/jJgy8yPPG
	YNu8FPAkFxRQA/VL8lUzPUU6L6Qs260OzTY0dmlQZyVcr8SxnwUQVZNIogqlJza7ZYomJgwh4kIMt
	g6I2I6AqY0PxhjGSvlh/3p/pw0FDHkjV/ris5MsPzjSPlETleuDczeLCIZZXIcvtpjQY2Up1QS4QZ
	riTJDrGLNte2zZnTsmB4r2zYNnAxaezFYnwmywEeCohezIt4ZirG9jmZgPOmCbs2iMQIcTiFe5dQz
	4QjIlHe4HMamgBG0WXxWaWXcULW0RE4vogLG8m1hCjuuc3vAIRQtlvOCqEVaGrqEOtdt88hgruJQ0
	6d11BbSw==;
Received: from ip6-localhost ([::1]:47042 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tVltf-007eD0-Ub; Thu, 09 Jan 2025 06:20:00 +0000
Received: from mail-co1nam11on20626.outbound.protection.outlook.com
 ([2a01:111:f403:2416::626]:25710
 helo=NAM11-CO1-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tVlta-007eCt-JY
 for samba-technical@lists.samba.org; Thu, 09 Jan 2025 06:19:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U5DwSG93n+vpSBa2qCZ7xlhkPaAkLCoywSSXEQm4xjL5CK7GLHP36ACvQbzrrT9uR90YX0pJu64kihJ+F+63wjpR6/Qs9xxf1Aa+6ojvmS3h+RSpf4Qlp70YppjikuhQFkosAZ4P93XywUQcfL7gVRKfLg3LuQRhIYDLvgLPO/F31bNtKZsnDrEGkD0iPDxN39QXWpB1bqStpBNxYhLmFVum2MgfLINiqPeC/+7zLWwRqJKbcWgzs4qGGvY6yR2TeZuWeo7ineIdtAMYVWlumC/EsLgfWKzd2ore2P17v67D9i//VRbUDK97lVxm8F8/ioUlW6zYjp+rRkj6XieObQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MBFRkqUyeS3p66IgjIdhNK4ZdJ+++j+LF9838AN4f1s=;
 b=wyP3O2C4QdMioNWKfo0B0Vv6YWe3oSdZEuk9E7PhqrT3kIeQzS9FE1nSr1okWsN6Wn76V29hoDRuI/II8Bw8mfKKQv0g1UUVsQyds50WMst9KfzpFH1/4cCIl2mcmKBUAzSzdtrePm8tLjjMT90WwEWqKN76W7M/6lZsy3di3OJfmPX5oelCCp5f8+0tVzmIcer82zGWZm9xIPG/GFEyV0ScpeCIIZh05ybhRfFAhkehISDhen1YYvh1aSLFMZF0S3Cv1Gq7O1VosrlA6GChuB3q5QDxj7MI/zwfmTaHz2iLXBZNeIKnmwgYb4UToBczj8K3poWQAZd7GU3UrFT12g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=veritas.com; dmarc=pass action=none header.from=veritas.com;
 dkim=pass header.d=veritas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=veritas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MBFRkqUyeS3p66IgjIdhNK4ZdJ+++j+LF9838AN4f1s=;
 b=qMCuIRbIG2CFLYkdfKPfDgBs9TLo4W0vlSxklik9Tp28v0ouJH2SeuGIUJS1FcpGhSRRxTs3cNozocJF2W/rLyhZOK/xWs7sHc6/Twx/Z0CscAbZkKcmi5wVAC4fw3xrFhz9IroU1k5VXwS+tMXnPn/sVEjvHedQUyZtDjQA7/oSn3wgS++aN4gywOvqzlZTH4BdguVNE+cR0C0YjllxTGBpnOPbdfWYiDDNOMP1tt3Cr6OGWNvRBNfDwmHqJvbRpKBtTJKU/TJgpD0Xm+VdtxUGQK6V4qEHxRjT0uqTBXZsnw6ZEqmfdSLuhu5RhMxRTsjxd/T4wUS7oSKZm6h3fA==
Received: from IA1PR20MB5052.namprd20.prod.outlook.com (2603:10b6:208:3a4::21)
 by CH0PR20MB6417.namprd20.prod.outlook.com (2603:10b6:610:18d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Thu, 9 Jan
 2025 06:19:37 +0000
Received: from IA1PR20MB5052.namprd20.prod.outlook.com
 ([fe80::4cd5:75b0:6528:84e7]) by IA1PR20MB5052.namprd20.prod.outlook.com
 ([fe80::4cd5:75b0:6528:84e7%4]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 06:19:37 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: Need Security Descriptor in SDDL Format (using libsmbclient.so)
Thread-Topic: Need Security Descriptor in SDDL Format (using libsmbclient.so)
Thread-Index: AdtiXnTfZGgDecNERVau9hFsO55KWQ==
Date: Thu, 9 Jan 2025 06:19:37 +0000
Message-ID: <IA1PR20MB5052B5C1BC44A6A0F6B4F107EA132@IA1PR20MB5052.namprd20.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=veritas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR20MB5052:EE_|CH0PR20MB6417:EE_
x-ms-office365-filtering-correlation-id: 407503ab-6277-4b73-dad2-08dd307597ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam-message-info: =?us-ascii?Q?Tq/0QdmXIMzBe7BNMpoBpPvEeisPdiydaSkiYKqxGQefnHgWP6s+Xi4aw8K+?=
 =?us-ascii?Q?zNrnQsZ+P/zFakPg6jKDGOUHgBRIM5KHlO9ItvpP75AGLx7pLyPZ63josOgT?=
 =?us-ascii?Q?1w99LKJ2m5Kz/u7etQAjotBvbLHvVS898w2kVVfSHbGigiE+EnpSTFtHWwPg?=
 =?us-ascii?Q?fmO4IeGmaEohI7Pni9fTnaRWCZ5Qkyx9Yf977M+ejqREXrVaAZ85nEgyFRzH?=
 =?us-ascii?Q?1KEpXD0I3wv4WmRIgHnrQRZtnLHlHG8bHBIpZIWuvOwKFaNeetDhO8KGpkBH?=
 =?us-ascii?Q?+YAh358wkix2vk5WBl7PkC5hMhlkX3W/dl6fQ9pe372HRffEudNfEc7RYaz0?=
 =?us-ascii?Q?HKR1Ch0OIodmv3jo+5FAByT7GaryzEZAtfh2/LA2CSRtTlrlZrVOprQHl+al?=
 =?us-ascii?Q?LClU1pM7nBhfBKvtWgbRWfV1svx65uBq3o9n28ZzLrW4Sql0ODMadq/xwKPK?=
 =?us-ascii?Q?C/dLmkopJN5zO90P1SWD52Zk1glOCvR7KgXNwvbXfDy7rjqj5AkpZScf7CMx?=
 =?us-ascii?Q?MZ5HIlQ0NOzV+/mc0O/6zqljltD5gbOmXvyOWQvHh6oATd9qG51cwCvfe0u4?=
 =?us-ascii?Q?I15y+5J1mLW8QJ6i3GZnV4IQxwIDPTX8z7f2XKhJaYjtmM+Ll6LlNePXowfO?=
 =?us-ascii?Q?9C53Ro2YOCBTh8ZiTcQHbSfJ4fG+ZcOi37qloreytgrh/g99Eqzl8ihcudY7?=
 =?us-ascii?Q?g6ED35myObHrJDyA1J3KKS3uzTF0IADK0rtoE+wUoa6ZW/t+UfdkU9xpv0P+?=
 =?us-ascii?Q?ZsPRhmR2WF6MV/r8SMRgLPZIcMX/mZU9VKkuYnVSiX1qQM1dCYF7ozDLIwc6?=
 =?us-ascii?Q?RVk+aI7C48SpPxb2mM8oW5+CkTFi6woULnJI8oE/7QfH0UhxfN8U+ih5ZDlU?=
 =?us-ascii?Q?mDQe56qLfOp1Bt1clzAZ8oCZcJhyyRHJPtpmAvL+pDmBgKrFXZu+UWbz2lfz?=
 =?us-ascii?Q?J/g7TRHcT+u2OxEs9BWfQBwxjkG5pUY7o4WrRxUC4NuWt7gR0MIAncUCb8u1?=
 =?us-ascii?Q?RvzxJTax3uJMnhWdk6Wa7MIvH6MQMnVmdOYoVyVLjD9dm8ffBtGKfuP41aHW?=
 =?us-ascii?Q?V7oWZWin8dUe9zSv/lz4626Nv6APp4cBip71t3tviW9pCjK0TTjR0ICtcCCH?=
 =?us-ascii?Q?7h88F0fCJBpxemFMdlJONcZK1dYUCODwNEE4dtq02q5jAFVkJv8oAXyuKKFC?=
 =?us-ascii?Q?1Ktrchf4/ovMZni9v/aEOo8pu3HCmMfoEI61PlPCTdpY22pNinsFKHhF10lO?=
 =?us-ascii?Q?hQcZClHFF/AlzoKRemfBgo2rdq6HHQQoYsE8dfqyb1wl6FoEDLJmw4HFrsJc?=
 =?us-ascii?Q?k+N9DoCPLmI5qfKlIWhc5FNeNyR1z7WN8YEInH8hZRPFXrvyQRbkyfj6JMrT?=
 =?us-ascii?Q?e7BsNdq2xPCjZi2uvkehLwD0BKgFReIVWdsPihxxHB+eN4o0DBPwtTQRydHs?=
 =?us-ascii?Q?Pe6tMxq3KQgBmXSYES2pFDo1Ooqv7ERG?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?s5xzsOHE/7Wvq49CXKb70Xwu3qQqJOgT1LWOE3N8/V95d3vzYYY2Bh5Iyz30?=
 =?us-ascii?Q?UY+/JDCZ5nY2YbJ7LKVemJkFqE4Qt1RHMA3YuWE5HGn0vvPrVdTsS1aQ38DL?=
 =?us-ascii?Q?kzx5W9Xanlclt9wN3salrDx6fFpUUqFIPsSOP28JaS3t235w/2uwuWvoJGs+?=
 =?us-ascii?Q?HrzmTyMnJktyLx815TdhjYEzdlRpIxyE3NqYsZlaKP8UryqjNUSQ393yaf1n?=
 =?us-ascii?Q?FL9FR2/g0m2QzPxvwUpvdn/oRXBJH1qLvBAXZGdJd909YygyUH4gf0qsuyU4?=
 =?us-ascii?Q?8xjz0v8nqojTDQ41rp74Ffm4+viNQzD83UikjOsy4GEj2XyWt2O1UzTuhuyy?=
 =?us-ascii?Q?XXBiF4CCfarD3FJOMx6hfQxOjBA8lDj/dd2w6y12lAAR1HidlIQipWYMT9BN?=
 =?us-ascii?Q?isoUe9rkkGb6ZSdNIjIxg7An9AmZchQPy3S2gf4HDB1GCSNZ+0LgPzz/S8LW?=
 =?us-ascii?Q?RXblVZcqs/E80B1q2vMkuF7qVAcQHWUugbHEwQFbAZKdhy+h8J8kg07jx2gs?=
 =?us-ascii?Q?pVTGrinuxhCXIrlC/9h9j18b/TlgnAS3dA9U3lklS1q2umLPXbI+yjp1ROVd?=
 =?us-ascii?Q?DthrFL3ZitkBb8mwCM83p+MXrILQOA2saYlqg3yFA+mNpc5aHoWKL93BmA0C?=
 =?us-ascii?Q?OY1oa1GbpWsin5C7Ujh+01GYW+ziy3zNLbnMyR1t6dyFgpnlDBPJk32DCjJO?=
 =?us-ascii?Q?uMLlm7kM2Ks3KFs23ztOpL8g+3ruhIzPUMnner8+ML/jFrNX9X6APc/nVo2W?=
 =?us-ascii?Q?/Nf2k7zxkRq/fkOZHkqTcsE6qAD8k5Ih9yiMNr+mrxa84ALLgA0M84L1i5tI?=
 =?us-ascii?Q?tYAqtAYgXZ3iV+pMR5fD4DYxsW5JdzDVAuJdZOwLMkRc6HR6z2j4s7scTFUV?=
 =?us-ascii?Q?QCVEE/X4uMnZcj4qMR2Fsj2RhnzeqSzXHN5SejRkbkqFyoEUU2DSDLBu0aou?=
 =?us-ascii?Q?MDxM7Ze+nm7Iy33h8/1M6V5okUj7Ff2E+zhDgmjzlwHeHWmsnDOpsI10WzLq?=
 =?us-ascii?Q?N27OAfHMUDi2raCe7VxVV/VxgRAyr6s9k+wApImcAtopbYHA1+ER8IT4D4iy?=
 =?us-ascii?Q?8aR92QR91Ia0MSh7wNbGKA8IT23sPfF+1a+/LdTkDGxK1eHTjpoIuuAzPa/9?=
 =?us-ascii?Q?qNzixZn/gqU82AjlBJLa7FJyjPA7KEZt7bKjfXDC2GnDrDsXll65VmG3v8TK?=
 =?us-ascii?Q?eXHaa3SMt1Y9WP90zcgrFz+rCBjZ1h3Vb0IWMWvmVAjf/0IGOUCVENKN77eY?=
 =?us-ascii?Q?++yjZ5JK3FUeMAdCfifj8lfrAu9FAfDtlqiFQYc5OqSP2BrYH3ROnKKdtLRR?=
 =?us-ascii?Q?s7Z3TXCCrYTixNTYwUZ/VmXBtC1csFrMxbTrZ//AOZVdJ56EQ9zr/HRRKaik?=
 =?us-ascii?Q?bL7TZROLAKvnK0fJcOyld0M6L9YB8YN10ozAJn224Fl1apVHPBdFjzTGX+dm?=
 =?us-ascii?Q?wf7x8PTBwMNtEFQ7k8FzpFURooKrf5ZS8gpmy9/b0Da3JTF3xr4YGi/GZLGl?=
 =?us-ascii?Q?QTtfjAl4u4s3qLRuCJrc9VD8SkWOTTZriCKHU6DT/SqLFfNRbcmZi6Vjs6A8?=
 =?us-ascii?Q?QDW9ZN1WMtuQpPMGAM9WqLpLXj2uadu3rcOyTFY+pimocA0IUjAPBa04qDVn?=
 =?us-ascii?Q?Xw=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: veritas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB5052.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 407503ab-6277-4b73-dad2-08dd307597ec
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fc8e13c0-422c-4c55-b3ea-ca318e6cac32
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gwm2sch5E3oEaorKZvNHZ5ymBirtpyMi0a6yfui1hiOkOVFQ1dEb7xmoFlYW7Op6IpMrjBlaULCCJsm2STRUKot4U1FaEXRvUb2W7UsQVbA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR20MB6417
X-Warn: EHLO/HELO not verified: Remote host 2a01:111:f403:2416::626
 (mail-co1nam11on20626.outbound.protection.outlook.com) incorrectly presented
 itself as NAM11-CO1-obe.outbound.protection.outlook.com
Content-Type: text/plain; charset="us-ascii"
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
From: Nirmit Kansal via samba-technical <samba-technical@lists.samba.org>
Reply-To: Nirmit Kansal <nirmit.kansal@veritas.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I am using the smbc_getxattr() function (from libsmbclient.so) with the sys=
tem.nt_sec_desc attribute to retrieve the security descriptor. However, the=
 retrieved descriptor is in binary format, not in SDDL. Additionally, I cou=
ldn't find any attribute in smbc_getxattr() that directly provides the secu=
rity descriptor in SDDL format.
I need the ACL information in SDDL format to use with Windows SDK APIs like=
 ConvertStringSecurityDescriptorToSecurityDescriptorW() or ConvertStringSec=
urityDescriptorToSecurityDescriptorA(), which require SDDL as input.
Is there a way to obtain the security descriptor in SDDL format using libsm=
bclient.so, or an API available in Samba to convert the binary descriptor r=
etrieved by smbc_getxattr() into SDDL format?
Any guidance would be greatly appreciated.


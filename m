Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B615F58A8
	for <lists+samba-technical@lfdr.de>; Wed,  5 Oct 2022 18:55:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=+PbRjPwDCVNTPLqODwPjLlJ96Ed+jy9Rq0oSv7dXyfg=; b=WGee9hzr4hNmKWcOPal8H+8A2z
	1uDd14aWBp9PcQUjdI8HNDYNhUpMcvXuI+B0H82dZkkOl0m9jW1Wk/GKlSRUcVDw1+iATA9dv6Mpk
	NT5FSS6L0cvY4/l0yegBtsShX17R3J60d0XmePkks2SZB5H1C2cPWYw5K9SPD11MmEOQWbQh82xZc
	lJrMwy/SbyEg+RjgqnDDtIPH5kPBO1ECSNm+FNALiJKev8LcuKz7ieSEM2cyJcpFHdjEUBcq9YQCj
	+gJc2PicdexT7A87qg8EIaiIWmlD+Drf+uOR0evYe6eH6Lnj7QBSASFOcJk+bGQzzgzc4GlI7+khZ
	b9wOa4ZA==;
Received: from ip6-localhost ([::1]:63482 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1og7fJ-0005BW-Bu; Wed, 05 Oct 2022 16:54:37 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:37652) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1og7fB-0005BM-OE
 for samba-technical@lists.samba.org; Wed, 05 Oct 2022 16:54:34 +0000
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 295E3IPt021627;
 Wed, 5 Oct 2022 14:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=+PbRjPwDCVNTPLqODwPjLlJ96Ed+jy9Rq0oSv7dXyfg=;
 b=wTpxn/pUQbq9GJ7SDBHqa0IN+PDLtPJ/+MSFiqNLT8RBORQfVogD8IbIoQF7x/wQT9pF
 Z+QErxOSxahT+J+pQfhnTepMWCwPX7yALh7wPZK7Ff6cfyHQtAlEZ9q1gnhFyoIRhozJ
 12kaoYx1xU8NVqRrSeiBN72KMx3svUBrgz2GR2pzIYcWo1MlRy2Ng5psLDb5fps5wBSR
 +iDa8yuNX9Q76oc9xa1CgQGHfVN5rcp2MGCPJ/I3J5Vxqq0BKbo0sX5wLYVs0V3yPVEo
 Z8G0YNvQQdZOxbJLPRWmmiKK01DhpXlVT4Cq3bXPSfaCHoGXKdOXB31ptqd5TbewfEkn pw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jxcb2shh7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 05 Oct 2022 14:58:24 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 295EYcBG005018; Wed, 5 Oct 2022 14:58:23 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3jxc0b79nd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 05 Oct 2022 14:58:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HWLJRz+/RpeDkGXgxb+yIEhxFC6EAFuALkdG4Z8H6U0umQkS3CfupxOTHbtpegMehpsAV5xmt4GJnivewTDzZB0bhIa1mW0IuD8VpmWjLGLACd1oR3RlvEnmr60K5ax1HwArcy5EdeMmLFFtciehr4MXmc1iu0/NRjsu3XgYoDRus7wPzj+ZOzo2DNDgLrvh43x2K2uo8tmu+KE/jQ3J0XvOuNKg7AGxfEIDo7cTy+kQmM0FLuVLA9k/UOqXCMGQgE3j0Op0wAqJq0ahL6gLG6tRMAyhR7opeWlP6/YWRsSYLMYPyl4BtzOZP6kzshLgS+7VibI2fP4B4N+RFlOa4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+PbRjPwDCVNTPLqODwPjLlJ96Ed+jy9Rq0oSv7dXyfg=;
 b=GFgydf9xAUj4dIgqhXGl/EgpQzkBOj+jmwfAtZpSE0uJSabQ/FVU9PM9qMgPEWEjrsjPYKQvs4A6ri1DKXujwmrfCA8yNxdVu8e3eEpv0X3tXb55RVdUuw9/iaOXbJuAQ8JxiKdlo8ARRJ3OBEWkWbCZ93POdaKHxCLWwff/fIym76GtDMO1zglOvS5YdQ8Kq3QJc30QOEe1OztXZ/Z2i7A5QIbVJ7JLzlyrjOilmnpaeauOuK46oyPivOC85MpiSSAh2kts5K04gjjJmIn9vsrvsdhH+cwIwPe+7sznL7jMmFDK2YP23hdJg8KGU0h0DJL3R5B+luVoy6+OilHXxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+PbRjPwDCVNTPLqODwPjLlJ96Ed+jy9Rq0oSv7dXyfg=;
 b=Je5ytLM1o9hMylK6n9WR3EIqdMcVnyAVj2Tyc7OAVJrUkKOh7RrbBjvI75yRDaQ7Xf08zY7OfhK7dhlcDLLgPsaO0nr6jAN/dTDKPe4ggCmtrtSV7GWwvCNpHkX/G3J1os2OMaiPqSorfBJ2xcmnjZOBzTPjzNQiUMkWvBw9zC8=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CH3PR10MB6901.namprd10.prod.outlook.com
 (2603:10b6:610:14d::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Wed, 5 Oct
 2022 14:58:21 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec%4]) with mapi id 15.20.5676.031; Wed, 5 Oct 2022
 14:58:21 +0000
Date: Wed, 5 Oct 2022 17:58:14 +0300
To: Enzo Matsumiya <ematsumiya@suse.de>
Subject: Re: [PATCH 1/2] cifs: remove initialization value
Message-ID: <Yz2bhrotBMO6JwPw@kadam>
References: <20221004062333.416225-1-usama.anjum@collabora.com>
 <20221004142306.ysgh45nhgdo4z3ok@suse.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221004142306.ysgh45nhgdo4z3ok@suse.de>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|CH3PR10MB6901:EE_
X-MS-Office365-Filtering-Correlation-Id: 25970d69-533b-4135-7cd6-08daa6e20b2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: lFnmNLagYRrmYP3x2E4aqEoID7UdYENmjZcElz3H+Eg5m5Z5K6XLaMlKXGc1zLfxIm7e7sP5IF+R+uNbBuhCS1uhFtAL5YUFBZRoyrnfGlV9H7/9OKLj694mtLqSl66b5z6bJgkkateypr0HVeewD+8K9u8J6thKDwHG3W2KwsJVbQXTJDj0nYzsJLSLo11svWxc1q3LgTz3estHilmgjYj7q4D+PiTRx8Ctt3GlPUIpiouFSm6JcT1SEBrhQaEOjJp9lppgDVOkzADriZ2HYyCbpodJZuoZVrEPHJ67lDZ50tHTxPxgk3bQYGZxZnqc5+tYbwVFLmWocanQALsq4gdyZC9S9OgwxM7IVZg7gxyg0Qc2WmhD6OKqgUjBPhAYKaGzIQVJwaGsNPVHf2428651kDgIA0Ea/Nhk5rhkomjaDa2cYvX43F7rslUi61tDVUoP55qx0rxvznps1wB4Oa5eMAGDo7OirxoImZfZgDitX25JAXQA8C2h2J+Z0A3S+QIkSrk/C63z29fjMb7/wSXzoyRF5Je+Jw4fkjtZUljHwl8R7bGcrK38wkM9/Zh6GB2hLUITAWll7DCfvGK9F95ZuZT9cyKy6MmvVM6J4Wb/bOKqmIDpGCZr7WH7+rSIlmQZhYxYpbCZNZGvMk9bQg2OQGc9GL7Lr+/e9GIOuIdGV/MvC11V0dTc14CQCrSfNTf0S+tRT9mCIV0gKjPX8A==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PDze+oclWOY2maGM2RIDoDlkysFl4SAnS47lfQsjvmv5P0Hl+nT+xubk9WXS?=
 =?us-ascii?Q?upmpIlHhSbP70IBhrA/Gk/AT/56RAnl+NgGhmzKD2zxhUrNiXSaDqVGu0kyr?=
 =?us-ascii?Q?KTjxf+1PU+v/++7XYFr0ztjTBvyLm5Qg8j9pJKPOVP/aJh9FQxJ+fcQsKJUS?=
 =?us-ascii?Q?Aw9XFhN0uwam04ekN67tsHz8AUShoPq+YKl2j6iPY/XxnL0tb+XHpdAxTIW+?=
 =?us-ascii?Q?/VRxZYrQoX5nRpkbfwQhpVob3Ai6f94GUGSvbxAJ/HRULmzlMDlU6fAGoeC7?=
 =?us-ascii?Q?Ieg74P+TSZmljhiSOFjAxaRu31oNlBOSFferhQiHc2YC/hsB939jKdzXokuG?=
 =?us-ascii?Q?iibmAQFpv6uVtX77riWjT6tOHJSrTXgi6VV1Jcf9piSUO1H37+ELX/GfdzJT?=
 =?us-ascii?Q?A4T9mte11NK62WFPhvcbVRM5X5H+woIQ3fUoH6P7Q+oQUrtiVjKsC4ci1wZr?=
 =?us-ascii?Q?PXD8wWLMLg35hZWI31IitubB7hvf/+j3tYR4ZuZkQINCWX79IMiCDAn3GQYd?=
 =?us-ascii?Q?JFou2dH0RXfOYp4y8EI5pKLe7ROnTCOromS3lvcnMMMDeHKquTAqL1AALGsr?=
 =?us-ascii?Q?/RO7SvdO1pDMicxh1CSOmQzsIUK5hqVampWnbZcB9pDDfbcG6Z1AaIsVkStw?=
 =?us-ascii?Q?0m2ZjhafG257mgRTlVHAgtKt8pc+Tw/gvmItO4qDRl2TwQ6BEwQ6dOz9cao7?=
 =?us-ascii?Q?kI4XHPbabROK7jnME1llncpRbg93XG8b3UaroOKGh16X4k43jfkZUwlKhIka?=
 =?us-ascii?Q?68OI4L5KCbJ1xc7KhZzkdZPWoWyj5lelnwWB2H/Sr7uWb5CVGIF+SOQ10TqD?=
 =?us-ascii?Q?tUa4EK1bqhVHAe+unkJECFE3GcXm2AFx+MGbWLtBF1/ySSrMmYiucgOuRNRV?=
 =?us-ascii?Q?lP1wjEfIuJ3dGlbxe0CDm+yXff7e3MTOo1pEqypYaxNyVxDrPVF8jivnbhFq?=
 =?us-ascii?Q?QGVNW8+fywoW9eAhuVC9fhg9Ag72ZVurfDr+Mjs3j160vyPzuT4HAy0CHr1f?=
 =?us-ascii?Q?+7J3uW2P+X4FBHyqpil1Kgabs90EiQTUA8uXT/TFKzuvhZAcC4gsHrP/TfFz?=
 =?us-ascii?Q?df/+kEHa+X7Iw9ePQrKHM6GL3k7W62I7BHQkZPiPSU6V5NofnhCi2ahm6s2p?=
 =?us-ascii?Q?g7qza3Y49FhDa5RWgzWSLaMFX1G95Le3rdSqE2Fwsb0bIk39TmCskJLvCYlo?=
 =?us-ascii?Q?qdD3S/wamqKZoEakKFmt1aZQzAlvusQVpvREh66BUwNKGF4S1AZc/wM6M2vH?=
 =?us-ascii?Q?ZRlR4aoLwtRN/gzHkF8OvQqrZGqhu0p16wqZDZqUaSM7/d8L6TLJrMrz7cLj?=
 =?us-ascii?Q?IkcjKsM0Am68HCWca7VdyTrUh2OIN9BERRrhJJEFy7PRFHqlxt8hNVpqTXwY?=
 =?us-ascii?Q?C64mX6Jlr8eY/s2PXiIPP6FLHBAjpMR39q3P6V63Jdas/RoI7v/tWRhGZN5z?=
 =?us-ascii?Q?TGO1AEJRu3sWwBBCFWkEa/RIlcDn9FB/BwLHt1Bn3db8efX6sOm6ZRDqdpW4?=
 =?us-ascii?Q?PKSiWgGw6VeE7FbW6jdPfsXd7HL0GD7xF4Wwn4hjaz5j8rljYZsJwZ+6vdBh?=
 =?us-ascii?Q?IirrP8eus1yHgZfBT6uYDNbel2J2FeqaIZLvL12qiAAabl+/wm9r3AkQbVpj?=
 =?us-ascii?Q?nw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?J7n66R5tkdSQUGWVPNS3thRDBuMDCsRQ8RBPxJNLWJ/1srrAj76zGyBdYKz8?=
 =?us-ascii?Q?OPnNvSB7AQ7i8B0NLY7/WIYsY8gWqqFO0Vk/A0yRn+2dQ2eZnzWl0e3voxoU?=
 =?us-ascii?Q?T2APXLlLMyt3P6Xo+AwWxxwKvSMJaC7nzvLS2tBDw4/NjbMlD2ul6kRws1Pa?=
 =?us-ascii?Q?58SsHRPPBony2mCLwfxWULuLQpbBeMjJ1OFwrUoZ24Cra2eSHFXmbZZ2Kg7o?=
 =?us-ascii?Q?s8Et5aQ9lWWBV6kKH1gXE1CkAwkUPBZpV7nAwftHjS9tpFd3ap2JQCDakWXY?=
 =?us-ascii?Q?/TvDl6Guyiax54qtmCgcX+jWkGQh64RX3OfVuDYi9oTjqsU2gPyecNuUTgiD?=
 =?us-ascii?Q?/6p/cQMNAYw5mD5gZRRX4nA/v7vL+kO22YruPaFdZ7EA6FpA142TsjcfDkG+?=
 =?us-ascii?Q?i5W1HahML6CMmpAv2tPitRoRNeaqnis2UrnXFUd9OSDhOA53m2NSNPiCRUDW?=
 =?us-ascii?Q?dRC7KYZVnK3HI7W3yuEatN3kYRcUdBFCc9JS67fojpsfRTIVO3TJG3M01Ujh?=
 =?us-ascii?Q?8a0j7QG4Lg8mM7cvpDprMfl57dZ0uxgqAc26+vHe4hjlNCX7+w5mq4syPw+1?=
 =?us-ascii?Q?KXNEZQLkZHkO+HXUBwm3blGBfo9XCcH7mfpdlD0e732SHlPNgjHTV2Cwu6yB?=
 =?us-ascii?Q?7hzj0HdrLy+ai2NigTHKcsoZCgE83OhTtEVxV5RsN0Dkraw3SreeX+gdwPV4?=
 =?us-ascii?Q?1QdQYPXC6H/6m+fT1srQwrA2JaZ+3yrgSAemT421HK+PAaRO8dI1UM9sjXj8?=
 =?us-ascii?Q?1NZDDrNVkJ4F+YypUvqIbTPUwW5gTKtstejJeG6QG4VcxQ29jf7SbuTdt9Vi?=
 =?us-ascii?Q?gncB/PmnJZVwuYJHFurkBU6sSfhmJ5q0Y8MJSM+osHdnyer0DUFeu4sPh67C?=
 =?us-ascii?Q?4tRUATc1sxEN63WQ4zk9xY8W0VKgrHLSKbu1tzarkKD56QjuHuRUmfB04bXj?=
 =?us-ascii?Q?MGYicFYUEpsigqdnhXMhdwA3m0whDbAzQMBViXjjjxjeF+fp8bM1mU49ovRT?=
 =?us-ascii?Q?QWd655NvfpRJr+0XLw/PZ9tLMKAykguZySK1bXkQN4u0k7ZX+wfIY79GhLlP?=
 =?us-ascii?Q?AZcrjgl63Xp9PnaTUjNSYPiFwm4ADes347BtaadvAIO+Y8ZQMMcdcb8iVyuR?=
 =?us-ascii?Q?NN+Vm+3Z4Q2j?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25970d69-533b-4135-7cd6-08daa6e20b2c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9L7JWfvz6i0P0kdTXcOXwpV2E5p8HUEg8PaOKTQ1nCJdt2HrhjEWKuiD2uxTE0u4mW+nDQH49Ad7lslPd0p0lGkdlxXmnkCY9yc9PyCi8qw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6901
X-Proofpoint-GUID: pALgl_5HWG1F6_quQyksrWfK6dE9fFft
X-Proofpoint-ORIG-GUID: pALgl_5HWG1F6_quQyksrWfK6dE9fFft
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
From: Dan Carpenter via samba-technical <samba-technical@lists.samba.org>
Reply-To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Tom Talpey <tom@talpey.com>, Shyam Prasad N <sprasad@microsoft.com>,
 kernel@collabora.com, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, Paulo Alcantara <pc@cjr.nz>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ronnie Sahlberg <lsahlber@redhat.com>, Steve French <sfrench@samba.org>,
 Muhammad Usama Anjum <usama.anjum@collabora.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Oct 04, 2022 at 11:23:06AM -0300, Enzo Matsumiya wrote:
> Hi Usama,
> 
> On 10/04, Muhammad Usama Anjum wrote:
> > Don't initialize the rc as its value is being overwritten before its
> > use.
> 
> Being bitten by an unitialized variable bug as recent as 2 days ago, I'd
> say this is a step backwards from the "best practices" POV.

Zero is a random bogus value.

How likely is it that zero is the correct value or a negative error code
is correct?  There are probably a four to one ratio of error paths to
success paths in the kernel (100% made up statistic).  But mostly
success paths end in "return 0;".  So when you see a "return rc;" there
is probably less than one in ten chance that rc is potentially zero.  So
there is an over 90% chance that zero is the wrong initializer to use.

Meanwhile what initializing things to bogus values does is it disables
static analysis checking for uninitialized value bugs.  So it hides bugs
until the user hits them.

Disabling static analysis can make sense for a very complicated function
but it's not best practice in general.

On the other hand uninitialized memory is a source of security bugs.
There are two ways to prevent this:  1)  Use static analysis.  Currently
the GCC uninitialized variable warning is disabled because it is kind
of rubbish but there are other static analysis tools out there.  2)  Use
the GCC extension to automatically initialize stack data to zero.

regards,
dan carpenter



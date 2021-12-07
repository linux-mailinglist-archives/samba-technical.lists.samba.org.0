Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B63746C83C
	for <lists+samba-technical@lfdr.de>; Wed,  8 Dec 2021 00:31:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=YSz8G7yYD6uD46rgHMktkHwSuq9cgv0hMzLz/YZjZSA=; b=Zb0Du4IhpGTi8Cr50lXqyJ0Nj2
	mBT0HArFRx/y/wH4qtwu4HoWqN1GKB8cRt6MYNBGksdKrktN2DAlkFJZ4usQjmuVCnNK0+YoYmsPQ
	sLyAyD6s+hV/ADPjhwTb8r+1WqrJeqsSEgGiMpixou6+JwpXHOeJh7QWXLjgs6KXlXtAxNYq909LH
	Pog9ZNH0UV0yqW9K2OBv7Np4RkNZ2asYds2jUrs/yzC120Ca+XhIOLzjamZnh8ZlSZascjA92uMzo
	d9upQzKOCeSr5TDswkxMxfYlH0blNh+AmBdfmP0bvSNfgCCGxFh6D/ccO2+FkGEuGXxBkbD2x45jt
	QtMLZzQQ==;
Received: from ip6-localhost ([::1]:32186 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mujuu-003xdW-4H; Tue, 07 Dec 2021 23:30:36 +0000
Received: from mx0a-002bd802.pphosted.com ([148.163.151.128]:28966) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1mujum-003xdM-JE
 for samba-technical@lists.samba.org; Tue, 07 Dec 2021 23:30:33 +0000
Received: from pps.filterd (m0146913.ppops.net [127.0.0.1])
 by mx0a-002bd802.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1B7JjLLV017327
 for <samba-technical@lists.samba.org>; Tue, 7 Dec 2021 17:18:49 -0600
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
 by mx0a-002bd802.pphosted.com (PPS) with ESMTPS id 3cte228897-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <samba-technical@lists.samba.org>; Tue, 07 Dec 2021 17:18:48 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ExGU0vIdrG9ckhnN/hNRAe4fw8ihYp14WsMAzWl+8HgESnFKbBKcuwav8AyYF/oCA4+Swz5pTq8XEO66+EXs8Qsh1yJdpWnWJYkvux1EjIERmvfFPcpIU9t0h/AEfRwA2vj1SNpm3luGau4NifmbXoU/jDs9Cnhf6kLJavWgJtuYUT1/2/S2JSMwsQtJFUqFKadV+RRcv9ssAvY4qtAWJin8vGrNhx+8O1MHhEWpsiQ+Nv2tGmX/feD/c4DuJdYqzkxHEKUPIVl3/zG7h/3r6UEyuKydmmryHR+XMkzOkeKN6VwiBXOiK8sZ194qmc5L0YS3wkSNHmCoILc3C+wt1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YSz8G7yYD6uD46rgHMktkHwSuq9cgv0hMzLz/YZjZSA=;
 b=lEhN3/iQbOYtIN3AOFT5CEPZMoANwT2dPKS4ldKyhq4cXwiC4VlLM9JOyU2yAG6E1NJwnPa5hHl0pAM1qHy9wc3eIwwd3nuh3Du3HDTxKeamGrilaQ8RH76CH+xys2aFlEwNp3bw/7wl4PgzCYEWLE3a3cjBdemyShr+TU6vmxklUsx+B2svSHz2lsFxWrZqkIfXCnfXnYBGqEjOxn++vbXoHoSPtjaHM86ihl6ddjD2aUwEBsYulSdI4+2O2dTXp8LCAwm61orfqzdOKLDqzpz79Fnligt7/oIgvRfPW/uwpd8G+OBC1I8jowDfO5PelOE4YNtZHRz5qaRs/JTKXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=relativity.com; dmarc=pass action=none
 header.from=relativity.com; dkim=pass header.d=relativity.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=relativity.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSz8G7yYD6uD46rgHMktkHwSuq9cgv0hMzLz/YZjZSA=;
 b=WjrQCwA9bh5fhwNYVhnr5HsETh8u+MIaEAvCiH80TsnI8AV82bVpzKG5+h4/pWV5hb8GkItrqBXkj76WdL2slURMo+eEzVrGUK4YwM9jNNaqwO0Pf8Q9fDzPUv0cpB03eTcqxTMaHhynZ57091FsMouVoxoc9AG5ja2uuQTdm3R/Sc4wx3Yffxm6TVVXUAR9oBt6LpVPMVPVmMDrv71KHuLjdqzlYZZgoedFq1jmt2HpYBjBXGupucwuQ2K+rZy3C6dmjLatCm2uJ4wITopgrX/K56Kzj1KX6HRQnSc9d9bukjt2NwZqu/PnMLXmkt+G6qBKk2IjjMX/vv/G1Cxy+A==
Received: from CH2PR12MB4152.namprd12.prod.outlook.com (2603:10b6:610:a7::8)
 by CH2PR12MB3943.namprd12.prod.outlook.com (2603:10b6:610:2d::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.11; Tue, 7 Dec
 2021 23:18:40 +0000
Received: from CH2PR12MB4152.namprd12.prod.outlook.com
 ([fe80::59d:27e5:56a2:513b]) by CH2PR12MB4152.namprd12.prod.outlook.com
 ([fe80::59d:27e5:56a2:513b%8]) with mapi id 15.20.4755.023; Tue, 7 Dec 2021
 23:18:40 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: Duplicate SMB file_ids leading to Windows client cache poisoning
Thread-Topic: Duplicate SMB file_ids leading to Windows client cache poisoning
Thread-Index: AdfrvsECucADkDAcQeeM2h+0DdErwg==
Date: Tue, 7 Dec 2021 23:18:40 +0000
Message-ID: <CH2PR12MB4152F65AF85E23297EB5146D9F6E9@CH2PR12MB4152.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc3RldmVuLmVu?=
 =?us-ascii?Q?Z2VsaGFyZHRcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04?=
 =?us-ascii?Q?NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy0wMWUyZTkzYy01N2I0LTExZWMt?=
 =?us-ascii?Q?YTU1Ni0wOGQyM2U4MTlkNDlcYW1lLXRlc3RcMDFlMmU5M2UtNTdiNC0xMWVj?=
 =?us-ascii?Q?LWE1NTYtMDhkMjNlODE5ZDQ5Ym9keS50eHQiIHN6PSIzNTg5IiB0PSIxMzI4?=
 =?us-ascii?Q?MzM5MjcxODkxMDAzNzMiIGg9InJpRCtxcFl0THMwUzQrWkcveDNIa25qQ3Z5?=
 =?us-ascii?Q?Yz0iIGlkPSIiIGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5D?=
 =?us-ascii?Q?Z1VBQUhZSUFBQlY5em5Fd092WEFYWFJxS2Z1Y1BzU2RkR29wKzV3K3hJS0FB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFIQUFBQUFzQmdBQW5BWUFBTm9CQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFFQUFRQUJBQUFBK0ZWeWxRQUFBQUFBQUFBQUFBQUFBSjRB?=
 =?us-ascii?Q?QUFCaEFHUUFaQUJ5QUdVQWN3QnpBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBR01BWXdCZkFHTUFk?=
 =?us-ascii?Q?UUJ6QUhRQWJ3QnRBRjhBWVFCdUFIa0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFB?=
 =?us-ascii?Q?QUFBQUFBQ0FBQUFBQUNlQUFBQVl3QjFBSE1BZEFCdkFHMEFYd0J3QUdVQWNn?=
 =?us-ascii?Q?QnpBRzhBYmdBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUJBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFK?=
 =?us-ascii?Q?NEFBQUJqQUhVQWN3QjBBRzhBYlFCZkFIQUFhQUJwQUdzQVpRQjVBSGNBYndC?=
 =?us-ascii?Q?eUFHUUFjd0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBRUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFHTUFkUUJ6QUhR?=
 =?us-ascii?Q?QWJ3QnRBRjhBY0FCb0FHOEFiZ0JsQUc0QWRRQnRBR0lBWlFCeUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFB?=
 =?us-ascii?Q?QUFBQUFBQUFDQUFBQUFBQ2VBQUFBWXdCMUFITUFkQUJ2QUcwQVh3QnpBSE1B?=
 =?us-ascii?Q?YmdBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFB?=
 =?us-ascii?Q?QUo0QUFBQmtBSGdBWHdCakFHOEFaQUJsQUhNQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUdVQWJRQmhB?=
 =?us-ascii?Q?R2tBYkFCZkFHRUFaQUJrQUhJQVpRQnpBSE1BQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?UUFBQUFBQUFBQUNBQUFBQUFDZUFBQUFhQUJqQUhBQVl3QnpBRjhBWXdCdkFH?=
 =?us-ascii?Q?UUFaUUJ6QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFB?=
 =?us-ascii?Q?QUFBSjRBQUFCd0FIZ0FYd0JqQUc4QVpBQmxBSE1BQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUVBQUFBQUFBQUFBZ0FBQUFBQTJnRUFBQUFBQUFB?=
 =?us-ascii?Q?Y0FBQUFBUUFBQUFBQUFBRHdKV2pWRmRabVQ3MXRldUhyTTlDbkhBQUFBQUVB?=
 =?us-ascii?Q?QUFBQUFBQUFiLzNpT1JpZEFrQ3VqK09SWGRIUHFrQUFBQUFCQUFBQU9BQUFB?=
 =?us-ascii?Q?QUFBQUFCeUFHVUFiQUF0QUdRQWJBQndBRjhBY0FCcEFHa0FYd0JrQUdFQWRB?=
 =?us-ascii?Q?QmhBRjhBY3dCcEFHMEFjQUJzQUdVQUFBQmFBUUFBQ2dBQUFCZ0FBQUFBQUFB?=
 =?us-ascii?Q?QVlRQmtBR1FBY2dCbEFITUFjd0FBQUNRQUFBQUFBQUFBWXdCakFGOEFZd0Ix?=
 =?us-ascii?Q?QUhNQWRBQnZBRzBBWHdCaEFHNEFlUUFBQUNRQUFBQUJBQUFBWXdCMUFITUFk?=
 =?us-ascii?Q?QUJ2QUcwQVh3QndBR1VBY2dCekFHOEFiZ0FBQUM0QUFBQUFBQUFBWXdCMUFI?=
 =?us-ascii?Q?TUFkQUJ2QUcwQVh3QndBR2dBYVFCckFHVUFlUUIzQUc4QWNnQmtBSE1BQUFB?=
 =?us-ascii?Q?dUFBQUFBQUFBQUdNQWRRQnpBSFFBYndCdEFGOEFjQUJvQUc4QWJnQmxBRzRB?=
 =?us-ascii?Q?ZFFCdEFHSUFaUUJ5QUFBQUhnQUFBQUVBQUFCakFIVUFjd0IwQUc4QWJRQmZB?=
 =?us-ascii?Q?SE1BY3dCdUFBQUFHZ0FBQUFBQUFBQmtBSGdBWHdCakFHOEFaQUJsQUhNQUFB?=
 =?us-ascii?Q?QWtBQUFBQUFBQUFHVUFiUUJoQUdrQWJBQmZBR0VBWkFCa0FISUFaUUJ6QUhN?=
 =?us-ascii?Q?QUFBQWdBQUFBQUFBQUFHZ0FZd0J3QUdNQWN3QmZBR01BYndCa0FHVUFjd0FB?=
 =?us-ascii?Q?QUJvQUFBQUFBQUFBY0FCNEFGOEFZd0J2QUdRQVpRQnpBQUFBIi8+PC9tZXRh?=
 =?us-ascii?Q?Pg=3D=3D?=
x-dg-tag-bcast: {AAFBB105-1DFC-4AB0-8164-392D7D82EB5F}
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a1828556-781a-4bca-f963-08d9b9d7e7be
x-ms-traffictypediagnostic: CH2PR12MB3943:EE_
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam-message-info: FeuTdVbqFqsxIvQMsIzvO4QDWMMGGnI3JKjmUYjfRmkWYSTsRID599cDqTWUZTbI1U90janW04JJB13Rtmt7jZsgaZiUfHlQ9HZPRX9kOehbX+FWXA72Pu2oh1nYnS3bok9MoVRfVf0+8Gc4248Rc2R2V5bDt3k81AF8R2tVn/jF2UvUDtRCVdwgBddZVOnvOhqMWtn5o8CJ/C9XvBtELXy7LAC2MCbbKL8Hnmu5+A48hCijK/7Uyr9j1nFbzGsu4HYj/Ryp3DkE2dJEZqaaARAcdneRMgPsj5MfifWUqr3mrvTjlh0fxR96qTofoU9V3X+gUlE9xPoevzJ8suE8ybAVNLO7qly3BfYTeB4HqtSRjJQZRI6n4xWBK2ytqvfg7e46aC/qS8n4YiCG90tgowhlc3KJrMGRS0QKo/xyx1tM7/pndqPakQzr66WE8EeSkZkcLLg2xj1aoQ+aSpDGyPEcziiTBo+shbXG7dlnOP+8o6YaZjTx39MnlMqcSDi5xag24RCdv9TAh+HLwRFsOhNzn3fQAFYlu/5n6E5Jey0H87V6cHlIXE9BRQrf295LKGcOCMAIeJ1Vso044ypZhRgKW/V1/m9aZiQsp0eGkmHB1jV71iMHSwHJZfhyKQE5aH/cnTZxOGB3mcPRHy2N3JCslqTAhOKq2P8/ZvEQSjRSNHGop9V2dBG3vn3h4vNgaFBTPmZ4npDGc3y3KGgJoA==
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gIcZAeRpbDDE8KpDri7gP9NjrM8yOGZlJwukKmJhJhyb9a/jfaoZHyBJy6ym?=
 =?us-ascii?Q?+VVk7bf8kjGh7mHelseIlAfFQGdjYBHgk1j6ASP6x6iOkAlVvqYe0mZ2CMtx?=
 =?us-ascii?Q?ixqDBPMpuzK/NsdTO5rIbGzPU7+Q6P9sRSswhiK5u5hUsxcWDgaJIUxKb0FZ?=
 =?us-ascii?Q?i/WCu1xMkhENN9OKACNW+O04jtAfwFiEBYJXtq3WHLsTKkoh/hgL01eePHvE?=
 =?us-ascii?Q?E695QrBYmK0+d5XKV4S20U2qxNkr0+VEDliQWOz6XIBKAF9eNVdu9i+CuOwF?=
 =?us-ascii?Q?yOUh3TaZs0YACeXF8ZPhKO0B1XUsbXD7ZoQ8oHcTbz+QywjAocOaPB1Tv1Xh?=
 =?us-ascii?Q?cPlWYF2bIK3UAfr47nfXb7D+mTVW+3oDUEk9AAkZuSYhF71tXNHQSDA8ThuE?=
 =?us-ascii?Q?9nwhOK8e1mg32xvczz+wVG/5Uy7GnymT/heFveBqxFE3mSeM7cbR6DD/iGou?=
 =?us-ascii?Q?9U7x1PeFmZ/LqDhwT4bhjpFm03zT7iTc94CsEOL0SbslC5SZ5LtiOgzWM+la?=
 =?us-ascii?Q?4rOKcWeERUcFdF9FdcZKSMBTwg6WOXRaPNjTQTP5uKSO2bKtQTnuv4G/mjAe?=
 =?us-ascii?Q?p4GJx1xDSJqDOQlYAAgCIRFzmSb+yXbfVGkqqlK2pNo0/xyml2BR3lLf8DSK?=
 =?us-ascii?Q?+e1x/XEWijsi9+uknHFJQ9k9JYm2XyPzaIp+Cm0gfuKaiCt4YtLq+T87WIxV?=
 =?us-ascii?Q?jyVuecqvpgMVuoThIEbXdZ/YVcbZ8zJMHDCGgaHkKdB/UGKRYI8GJ/gLuNkI?=
 =?us-ascii?Q?/jTv1zcFyqtWsS2fcy1pjofoCSTRAGQ7uYcZPKSTWYSzigOkBNNqu5xBqiX2?=
 =?us-ascii?Q?RUio8bBiDg4ss1ZXcdbZBhArcp5qSnt17aCRhUXZNyKp04ZuAViidFQH101d?=
 =?us-ascii?Q?Nz3ob1HHp5VObtWkjxodWQdDBzHzEf+OFvf05rgnSlJoRGda0/z8LmVcfeOL?=
 =?us-ascii?Q?jx7R7OofkBmaT8mlMl6iAOuTf7/ZSZ+uMOgsDFUxsu3pqvCeGNSkt6YZKgbS?=
 =?us-ascii?Q?hNljt7LGUtVC0C/0AvKeVd44uxZnM6IZXAr5pH0MjqSbFE2rrHpCWYyJrVac?=
 =?us-ascii?Q?rZ4WqS8KvC8xdTd7lXcaUxqUqORDDS+59OuuGh4OdT8jIEZq5w4b2anZsNhC?=
 =?us-ascii?Q?6bTyPm5uBTi7tNa+2O9ZC04xYvzQc3H9DKrXjdvL4Uc4xHlUKI49A2/K1FRi?=
 =?us-ascii?Q?9kUljvMGl/u+m0SKgl4tGcao+KeA8nhiCe61EJxp3uMQzAVFakA+S87tNrHb?=
 =?us-ascii?Q?ecvY685xZ2bx6CDYqmD4WL7Xq5kSCWOKpLWrlhi8IlDvFnx/V/b1Q0nw5hlU?=
 =?us-ascii?Q?FmEWHhQ8yPofff4G3w680lHuVOgBisFTfMIaWHE1F5iTfBUfliw+eIKLoufR?=
 =?us-ascii?Q?bMBConmv0QXFOetf/Ttrs/hXLYeEBXiGh2SJ55WiycrfR4VtQimKtLZLFLk/?=
 =?us-ascii?Q?LhHy8cVqOdmFzDyqqPA3Xkq13/hceDxdxgfpr+iTCbain/bn6Hs1hLQ+kIg7?=
 =?us-ascii?Q?3a6/XGYxcAQwssuKmrVRbeQYGt3edVa03N8xFQrZohbjj7pRFcyNztrGxVjU?=
 =?us-ascii?Q?eGU5TqJ05Adqm5poE22Rlr+vVUt8ACN9CWkExsHAToeJ+v1FfFwyq2uKo9rv?=
 =?us-ascii?Q?VhKvtv0uaQCfBU09+WGP+oraTSvtMxCI9fnA8VNHaZUypur5N2JiDNZQTCBR?=
 =?us-ascii?Q?rdNXPYQUxUNiw/D7HUEPH35NtoBzxWFcQBilIslH73YmFOaJCL/u2dk+G+WN?=
 =?us-ascii?Q?fuupK3BUWC9tU1jQs9eYQN861xKr9kYtoQkJQ55dAa1wq+M04WRRAx2KCvMv?=
x-ms-exchange-antispam-messagedata-1: dmlIAnHi39LPHA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: relativity.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1828556-781a-4bca-f963-08d9b9d7e7be
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8afe73f9-0d93-4821-a898-c5c2dc320953
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gGQ5rDRdTfhDshZUWM5q5PcrrDrUSeeDUbeuVKumBReBhlhsnSOr1TddTDgBwfSwGhs2iyGtzmD5Z7yAaz1wNXlzYRVqyCbzwH747YA3rxOTr/TqPcVdFNaKPEXbe6g3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3943
X-Proofpoint-GUID: 8mXig3tQDzs0Rk6X_ZHHsd-xBBPmh6qL
X-Proofpoint-ORIG-GUID: 8mXig3tQDzs0Rk6X_ZHHsd-xBBPmh6qL
X-Proofpoint-Spam-Reason: orgsafe
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
From: Steven Engelhardt via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steven Engelhardt <steven.engelhardt@relativity.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Samba Team,

While trying to roll out recent versions of Samba, we believe we have disco=
vered a bug in Samba related to SMB file id generation which can lead to Wi=
ndows SMB clients to observe wrong data.

Samba version 4.11.1 changed how it generates SMB file ids to be instantiat=
ion time-based. This change introduced a bug in that it made it possible fo=
r two different files on the same volume to have the same file id, in volat=
ion of the SMB spec.  This appears to lead to cache poisoning in the Window=
s SMB client-side cache, in which two different files share a common cache =
key, which can cause Windows SMB clients to observe wrong data (e.g. the le=
ngth of a file is reported incorrectly).

We first noticed this with a C# client program on Windows which created 10,=
000 files in parallel, each of a different file size (e.g. the first file h=
as size 1 byte, the second has size 2 bytes, etc.), and then checked the fi=
le sizes of each of the files one-by-one using Directory.EnumerateFiles() a=
nd FileInfo.Length, noting any time that a file does not have the correct e=
xpected size.
=20
This bug is particularly easy to trigger on Ubuntu 18.04 in WSL2 on Windows=
 10, as it appears to have an effective itime clock resolution (based on ob=
serving returned st_ctime and st_mtime from `stat(2)` system calls) of 10ms=
.  In other words, if you can create two files on a WSL2 machine within 10m=
s of each other, its exceptionally likely that they will be assigned the sa=
me itime and hence have the same SMB file id.  However, we have also observ=
ed this bug in the wild on Ubuntu 16.04 VMs and Ubuntu 18.04 VMs running in=
 Azure.  Obviously, the better resolution of the clock from stat(2), the le=
ss likely this bug is to trigger.

We tested a number of different Samba versions and observed the following:
| Samba Version | Date Tested | Status |
| ------------- | ----------- | ------ |
| 4.10.18       | 2021-11-26  | Good   |
| 4.11.0        | 2021-11-26  | Good   |
| 4.11.1        | 2021-11-26  | Bad    |
| 4.11.3        | 2021-11-26  | Bad    |
| 4.11.7        | 2021-11-26  | Bad    |
| 4.11.17       | 2021-11-26  | Bad    |
| 4.13.10       | 2021-11-26  | Bad    |
| 4.13.11       | 2021-11-26  | Bad    |
| 4.13.14       | 2021-11-26  | Bad    |
| 4.14.10       | 2021-11-26  | Bad    |
| 4.15.2        | 2021-11-26  | Bad    |

Using git bisect, we traced the bug to the commit 459acf2728aa0c3bc93522799=
8cdc59ead5a2e7c.

We can also deliberately trigger the bug by creating multiple files in a di=
rectory with identical itimes by manually setting the user.DOSATTRIB xattr,=
 and observe that these files are served with duplicate SMB file_ids, in vi=
olation of the SMB protocol.

We wrote a simple patch to temporarily remove itime-based file id generatio=
n which has resolved this bug for us:

diff --color -Naur samba-4.13.11.orig/source3/modules/vfs_default.c samba-4=
.13.11/source3/modules/vfs_default.c
--- samba-4.13.11.orig/source3/modules/vfs_default.c	2021-08-09 02:20:55.00=
0000000 -0500
+++ samba-4.13.11/source3/modules/vfs_default.c	2021-11-30 15:40:00.0893022=
00 -0600
@@ -3003,10 +3003,6 @@
 {
 	uint64_t file_id;
=20
-	if (!(psbuf->st_ex_iflags & ST_EX_IFLAG_CALCULATED_FILE_ID)) {
-		return psbuf->st_ex_file_id;
-	}
-
 	if (handle->conn->base_share_dev =3D=3D psbuf->st_ex_dev) {
 		return (uint64_t)psbuf->st_ex_ino;
 	}

We would appreciate any guidance on the correct long-term resolution of thi=
s issue.

Steven Engelhardt
Relativity


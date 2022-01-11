Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E17448AC14
	for <lists+samba-technical@lfdr.de>; Tue, 11 Jan 2022 12:02:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=YfVJN+0FzMrzlQh+OXtIOogmYXVQqYQ6e6RXpMUeP/0=; b=Twj4qo4qwGiNMqC+6MO0BPhHfr
	l+7mtpm8g9QzROsxJSNbr4+pApEsLwDiwC4e4CzMqaPkgmgUAYtBNdJEa91kjQC6IESZ7pNozOZl9
	qkAVYQsga5V98WZri/6Tz2iHGrZcCz9YX+FtQFctQzXEZnxL4wdgc6FZQ1/4tXgNdOpz5NVKcL2Wz
	JAPV+DMI+GZUeYcNb46mls2W0O0SzTBbgV+OjdNspUWcptsGe8Tyu21qDSCh4Ybd3yQsKElFp0OHf
	3Uy+8ofFLrFXNor2YN39FpK88+O8q2cClHSlnFeouzVjljnRmZ/rzHLvaDcDdpAH6wvZFBCc4skhG
	QqiElXsA==;
Received: from ip6-localhost ([::1]:22316 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1n7Ett-0077ky-PG; Tue, 11 Jan 2022 11:01:13 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:63140) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1n7EtZ-0077kn-VD
 for samba-technical@lists.samba.org; Tue, 11 Jan 2022 11:01:04 +0000
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20B3TF0g018675; 
 Tue, 11 Jan 2022 07:17:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=YfVJN+0FzMrzlQh+OXtIOogmYXVQqYQ6e6RXpMUeP/0=;
 b=zawOmCBAXRbsl0fx7/7plonDbgLKqNSIsjfGKFowh945LMH0JX/uxYC2S4Z74jmj0mYx
 OMVQFnKyZhuK428tZ5GFzn8vSxKRy8p68wBWO8vDmARoO7WrgbMP6u4KxU6QQyXebjPz
 e0a8KXkyZ5i5aq0LBrNbeUDPtIaFlEAgn/Pbjc22QViVVBsfjLXeZo+rbGNOtGLCKWWC
 zTH1eQKDgPq8HnwLUyBdXfZxKRD8IWwXUn/t1W767gt93CaVvfN1iKwcrQlST9stosOD
 csAM7rLYCOHP0S2HelgccLxYR3Pa3P/reyP4sKsV0bfeSoJO6GFB+YDwZ6hEekbqlVAE gQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dgp7nj48s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Jan 2022 07:17:30 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20B7G8p9081734;
 Tue, 11 Jan 2022 07:17:29 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by userp3030.oracle.com with ESMTP id 3deyqwp1xe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Jan 2022 07:17:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dGLZ6fNs7WSwYtIwCjiOoyjdLbB9ON1jdkvAwjbG6LZJjJ6bSfw73Mq5vbbLXaJ/12Y1A8sjsPdIrJt5E0o0KT5FaxJqiMtFA5fETR3HUeUygGkvEy929ewS+bAn+ug0kw+f9tlENtYdZRBEPbcBAkLf8BWyJ14/gsP/49GvOsP0kOkvFSOZpOMGGi4kHIf8G+WTXnlMyZV71NBVtLZiWShiKEps18xK5DCesOcTkQQuSrbBvNTLUtRHGB3/2uFZqeVtVGvBko/bc5DIsSPTVGtX4BG/XR2mud1N6YAHKOEyHccM1A42waXbAmXGy0vCDytfix74Q9xEpEAX7VjPgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YfVJN+0FzMrzlQh+OXtIOogmYXVQqYQ6e6RXpMUeP/0=;
 b=b/SyPYrHQtc3amvylbLOJRi6dPfeJ1/kDjxIxZV7uULe+wBK+1wqluASX7QwUOdfPTO3JC+p+2ML/3qhXF7or/jKqE/y4G3tcmKh1Rq0CZaUNYc5drtQ8HKFDPCAA7J7UUxqGgtyxDsjNo/+/cJlmQq//vnwUEF+vDcONMVYM1SmpJBw3Pe0HVpRbqwVYzrA02FOcu5ZlNzcuWDtKlQGuEm45tnTveUaLOV4dHzUJAWd3KanSwdcKQGkxsLA4BiP/bkp4rJDtx8/psOVyCLURcrZ8bxsy/rnehQ3eICm4A7dExFy+JzfMQhEpjEYtCTkoFN1f5UbAC9Niv4CavVy+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YfVJN+0FzMrzlQh+OXtIOogmYXVQqYQ6e6RXpMUeP/0=;
 b=yACHvwHA6anvCyWEj4AjOEVv/6unrrgyTdCY13l4nJUMJ9NI5d5KxMeVZN8pgdnyTKGgm6bZFrHNEn1llbXbdAseIOMk5JWe1eTekY05Astc32w2IS3VpgOaXBFCNHhzC6YIqiwFx97ehjNPFh9iYJLg4JXDCE49hjOJ8/4Z8gI=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1421.namprd10.prod.outlook.com
 (2603:10b6:300:24::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Tue, 11 Jan
 2022 07:17:26 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b889:5c86:23c0:82b8]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b889:5c86:23c0:82b8%4]) with mapi id 15.20.4867.012; Tue, 11 Jan 2022
 07:17:26 +0000
Date: Tue, 11 Jan 2022 10:17:16 +0300
To: Steve French <sfrench@samba.org>
Subject: [PATCH] cifs: uninitialized variable in cifs_get_next_mid()
Message-ID: <20220111071716.GC11243@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1f9cb32-8c5e-4d62-fad2-08d9d4d26baa
X-MS-TrafficTypeDiagnostic: MWHPR10MB1421:EE_
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: z/l/g1RWgzIoQrxcAQhEIO9YsotsP6pJHdU3QgRMKLeZDDDf9RlvJEnRxzoom69koaNyy/lMuuZOApxHrzG80mHLNONXq7b8M5f8htvOW1HlJIgLFxDi6jSjZbJ5WaMNc1XWak0tsAgjuMMD2KXyC485q5gN3/wOfP1LTuUAl4CRn4lLPKJUim8UsEAokvdpmZkQOL9ApvPbklrqPWBc5Qvcg+HSfL+pE0vpJhUAf4TsZxzX4i3hwaiIFxgPy4wJb9meA1/a2F4234yEowN7nmPL4Icf04TnDPknfT6JdqE8H5lkvqqhStj21lIS6vRyO3lRQ39LEz4xOhegb0bb5MxOu1QcJaB0MT1NxePqx344bbJwqhszigPw4pRpFKLz83jNXSwucotgmrMDwaq3T3ckTTl4cxB6KsLaTl2dbUgO01AKA3sKQLTjC26s4Tk/t6Yju3xw6ESkXnUeH7w8w7R45cGh20f631Cp8fOq9y31kZL15OaOT5m2w2d3Pl7mDECf59r79yMBpUY56EP10TErSov6xSszvlc7fooG3MfSf7Xsk34JBMKS2cM5XKNfg7lqJ2u0E0OOQuA5NVMPcNPgO7euQvQYbai39mwp6+WLPWvxcTbEzFmI8Cp2g080a18aL127/PkTn8j+xUqfopIGXMhqQj/fRqZgyeJxKdMsQl2JgAIz4bJf1EAuLacJl20P4GesLh1ONyLqbfHndg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5Z1Nf2HQn0RZ2rCIUH/uHoUuqYIPMixhSBlTFn5/YhxKm0rAxopmemMJhVy/?=
 =?us-ascii?Q?nsLH7EzcmFkof0BP+n30sjFFAOwP1p5Nufgc3LOfvz3ExdBaHFhntQvSocUT?=
 =?us-ascii?Q?drIyjQtXc1T9JU1qZ7bKOSOeoa0AWOqt62r76M2ziR9f6hwsQn2bUQJlLhtt?=
 =?us-ascii?Q?GmqqsLTwmNL3KsZOAdxuTU7GqZv5aoUNP7ZH//YQNAfDyDq09jyEiJhU8+v1?=
 =?us-ascii?Q?tJrifkNZVHnq2efdIIx53Eav7//DuoY2qzPaZtsx0+D0WjSXWHfKCqV1vnxM?=
 =?us-ascii?Q?1BS88n7yTQZOz21yTJwnO46iXKDtbcn6UpXfIls2blPvmn1LaYz039alsmnP?=
 =?us-ascii?Q?JqHZ5y+B7EP+vl6OgA82mpAwWh+cZyDiGbpxJ71NZady7Dj1KZkR5/eNez7f?=
 =?us-ascii?Q?vLvwfO/7uHuzgwem5iZEpb9FSomBiYk+iUGyzYnqgP0lQEx1va8QcX8uIoid?=
 =?us-ascii?Q?74V8cQUNVd2XmyXvfFSnN3zz1zrqQCq1T1AFWv15bpqnEuI1TSWV0jEfZ8Hg?=
 =?us-ascii?Q?v5mGoOygO2y7l9FZ3+zP44DPWgU+d20Xzh3BI9GEEAfb9IY/C5Y8RqOEyRQi?=
 =?us-ascii?Q?jGC/S2xgvBAP9cVyh4btSfroXvOSxxHH9InAgAarZYCf/a2hYco1EDi8UHkS?=
 =?us-ascii?Q?B+1ux5qMVd1/XxsaurLXFKGHYFWUyyQtYZsYFGfy2k/e+b0vwMlaqdNckUNJ?=
 =?us-ascii?Q?h0NcxGTsqHplcCCcNuDMwbr1Md/0358qCgm1dvoteu/3OE6FI6M/ln6bOE9S?=
 =?us-ascii?Q?qhKx782JZnoYkU6UPoKH/CN4FCFiCQNjEhCriBxnpXLktZgF7riH7RqDFgUf?=
 =?us-ascii?Q?LB+nCd6rd7IrowoT99NLHMdtKVXFUPcGFiySfm+p+WoOLYY4GggRmlEqzTJH?=
 =?us-ascii?Q?TXL/B7Ku3UMlv1ZbF+n5tM45iWrZpkVzOIK+SeASuP4w393qqEsak+bFyX8T?=
 =?us-ascii?Q?QYnrhxIA6tTUe9QTtyH9N7pnA9RwYgNT3Xl9frwVT/+1M4Nzuyq0HqZyhEXW?=
 =?us-ascii?Q?nHEmlhhjviTHLugLt8w8ENu6mHFVhWoFHgf3CtIVc+Xu/9oNqtGvid/Lpe6n?=
 =?us-ascii?Q?mfWp8McN97Rt7IxHvXswDMJTNDqnPrpFJOOZpOPHFKjNNHJ3Wl0EksBUDDP6?=
 =?us-ascii?Q?EwMzCFAfyZ3oe+exB924LBL4oDHL9f2g6vKjUTqmnKKlxNqOPPzZhR+Yqfbf?=
 =?us-ascii?Q?Qlo87wsvVs0Dy0WqndNnUPyAqmxgOnvAtOqzamge8qZnw0QC7YtLLAW9Fiyx?=
 =?us-ascii?Q?0zxGqEpdMaoBpRMK7PEy+vTunXMwehHdwSsSTmg3Pp3MrECdYFzJEFeW0CQM?=
 =?us-ascii?Q?vwcH+3JFk+zKoE7WO+GMt5c20M5ncjcE4UQ7NHJ58XECvkxM3z3KVt0j5/Hi?=
 =?us-ascii?Q?haO3SbUKvZrROcvm/yZngmh3vA9nNNrfGm5lyyDvQhPiYkRVlNWZ/Ds3lO+e?=
 =?us-ascii?Q?8Fo2JUPJCzTQ4aNu9mQ0zKZs/VMsyACdydYSaSyHYKumUZeAQ5e5p4grRQui?=
 =?us-ascii?Q?CXVzX49IFN9aFYs7FAmsItOKaKeXy7VvalR+RDvWnD6U3LAwMIkRxWs4Ph5W?=
 =?us-ascii?Q?uWDKvxidiUgQeueykHqWkGjvTLKB2axzqAm9jbyJrpPxl5GCb59W6VBlnzVM?=
 =?us-ascii?Q?HBoGyrnDe5FjambDRoaYEycBhiddcWje8XIdEplZfwCs+6BZONC/hjcUOT86?=
 =?us-ascii?Q?siHbZ/o/O+jRza+X7yKle2H3vkI=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1f9cb32-8c5e-4d62-fad2-08d9d4d26baa
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b0ByaDKeHlXgVHYLf3zG821mgguNtxeYCnJw7y0xZeMWJB1YpZL+Qzc3uUjICNOKhqp87qHmke/K3z0iD4M0s5Qk9hbh20CEzvI+JxM9A98=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1421
X-Proofpoint-GUID: izGAAP2mP9YlDZztbee2eMJxpy3ZwsNf
X-Proofpoint-ORIG-GUID: izGAAP2mP9YlDZztbee2eMJxpy3ZwsNf
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
Cc: kernel-janitors@vger.kernel.org, linux-cifs@vger.kernel.org,
 Shyam Prasad N <sprasad@microsoft.com>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

The "reconnect" was never initialized to false.

Fixes: 220c5bc25d87 ("cifs: take cifs_tcp_ses_lock for status checks")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/cifs/smb1ops.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/cifs/smb1ops.c b/fs/cifs/smb1ops.c
index 54319a789c92..6b1b048b36ae 100644
--- a/fs/cifs/smb1ops.c
+++ b/fs/cifs/smb1ops.c
@@ -163,7 +163,8 @@ cifs_get_next_mid(struct TCP_Server_Info *server)
 {
 	__u64 mid = 0;
 	__u16 last_mid, cur_mid;
-	bool collision, reconnect;
+	bool reconnect = false;
+	bool collision;
 
 	spin_lock(&GlobalMid_Lock);
 
-- 
2.20.1



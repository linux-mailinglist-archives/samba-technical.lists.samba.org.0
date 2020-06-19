Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F2351200AFE
	for <lists+samba-technical@lfdr.de>; Fri, 19 Jun 2020 16:09:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=yHRsn7TYianoWqXxyxY9DpNRBR6Xr7lfIMV4r1Vg3gQ=; b=4IV5EMYf6lBYyfujNzuJd+qvo5
	kvbXd9bCk9UiAma6jmQJAyD41byq7NUU4mZuxLODLetP1wZdFpFrqW5Vq9fv8j382A8DzsDEAvYxR
	54AdTrrQyp97hgrdRoolg/YNJzXNS3aRuKo6FF7H9CN305pE/pPXH+z6ZBYj3Z+r4Pdyn7PbhH1O7
	JzaCMT2ckS99y5D3un9mXqN6jAjgYKdNJZayN1sZL5trppNBYlYd+Plbz6lN6rlA6WFOUK0EBAzM5
	k0uzs8o4pSsBIyjHMmrqa9qvA/SMVUidQACvwQF9g1EGabXzyG0OnVbRxw+14XqcZdcn9oifQjNYE
	hJXat/iw==;
Received: from localhost ([::1]:59010 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jmHh0-001OWp-Rd; Fri, 19 Jun 2020 14:08:30 +0000
Received: from mail-dm6nam10on20717.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::717]:6272
 helo=NAM10-DM6-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jmHgr-001OV3-BG
 for samba-technical@lists.samba.org; Fri, 19 Jun 2020 14:08:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SDn0ULpBSoQN4FW+Pjz6L0gK4p244JaFlgRsFEZjBIvqTPeoxE1wfjIv722HOBQhoG16UzmN8kGZlhiaXQUdNC/DSn6r28TMg8mXfMVTUDy1wwoY/MGaz7rtjE9NutLenLBxF4jwpeDnIt6ZDBHYBcFD404Kz36cUr/+aDSblV9DbhkBNrTbjHtFY907AGYdlOhtRPNadcaUAyH8EG937s+A9CIElPjo1/YPNdbsGNPQbF6YU8VGlEu9ccNCuZjH0wXj89vvD+qaNs2fGi9jArr6kuAosaWCjovZSzNMhkYAtVtiKW6Nzaauihk1zdPf5MFWaC2CGMLRM6wu46okIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yHRsn7TYianoWqXxyxY9DpNRBR6Xr7lfIMV4r1Vg3gQ=;
 b=ZC0aBdVGJyQMmNwamYGXL6gbxaOW1ffV6MTTWsjV6dxC2EHhgArAPXLzgLSjOZtzV4iXUOqN9Yo3XuKBsjBBNwOMDD8/g2D1bBihsl6K0djh8f4Jk/Gr89FSn5cCkv2wquYeIQ3ZD61ohl/cIS2Xs3fVHkZeEBce+GdTdR2DatKebw7fUOkmAqW2eqFT8JNwB+JMXUUE+YoRTDaR2MieUdh4vjpIlMFR9hZJSJiVJqOV8EgU+s7cYkbNxY1hOFoggqf6g/4qJ8AzWBhXYRnBIQgAFf687jZGbggIbZFJbl5xVCyfHUGCdOb78RwahMpka8SBrIcoEahGQmqYGEeUQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=miami.edu; dmarc=pass action=none header.from=rsmas.miami.edu;
 dkim=pass header.d=rsmas.miami.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rsmas.miami.edu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yHRsn7TYianoWqXxyxY9DpNRBR6Xr7lfIMV4r1Vg3gQ=;
 b=k13GCyiNUtlM7zLRd/8iUIdgvFowTMx0qtrPpk2anytHscnvQ8eUDmzCV3evQiuJAeAmIwkdmnPWQ64BT+Flo8XlhBiUe4qKPQoZZI/QF3Wcx5NbEPSzZBvID7/LqYh+wVrp2ibt9b6+sFk8Zj6yflFFddLSmKrAjS7xSJmDLC8=
Authentication-Results: samba.org; dkim=none (message not signed)
 header.d=none;samba.org; dmarc=none action=none header.from=rsmas.miami.edu;
Received: from DM6PR07MB5388.namprd07.prod.outlook.com (2603:10b6:5:50::19) by
 DM6PR07MB7164.namprd07.prod.outlook.com (2603:10b6:5:1ea::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22; Fri, 19 Jun 2020 14:08:02 +0000
Received: from DM6PR07MB5388.namprd07.prod.outlook.com
 ([fe80::e5e8:cf2d:e2e8:70ad]) by DM6PR07MB5388.namprd07.prod.outlook.com
 ([fe80::e5e8:cf2d:e2e8:70ad%2]) with mapi id 15.20.3109.021; Fri, 19 Jun 2020
 14:08:02 +0000
Subject: Re: [SCM] Samba Shared Repository - branch master updated
To: samba-technical@lists.samba.org
References: <20200619110010.02B25140341@sn.samba.org>
Message-ID: <ac6f6687-dd7b-2b1c-3bdf-9a182222740a@rsmas.miami.edu>
Date: Fri, 19 Jun 2020 10:07:53 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200619110010.02B25140341@sn.samba.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.68] (104.4.177.11) by
 BN6PR10CA0014.namprd10.prod.outlook.com (2603:10b6:405:1::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22 via Frontend Transport; Fri, 19 Jun 2020 14:08:01 +0000
X-Originating-IP: [104.4.177.11]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e076a8e-0356-4b15-0823-08d8145a2da2
X-MS-TrafficTypeDiagnostic: DM6PR07MB7164:
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: crQm6jJBSxcjpgm/BoTIPmdoSIOitHB6o6iLJ28oX6C6y4JleJ5sGZbLymS4GHF0na8LAiwoSlBN7Cw4aZ0sHsCPYS9qCrqu4sV46rqTbUCBhtghW9x3+4P0h4LGcCTy4IZoRA8W3U/cvw5y3AFafIM0/eYvHFCWGkn4GCb4ZXiEywIA9q2j5WxhZqyaeT04ljBwBJfGr+2tZnYJri2VXLue/bnoIVpi1gpsv4f+ts5aDJN/rAJVtdIu3nHFv2lMVEJrDWu9J/BHl44cjQB6iTEv47hWZoBaBLCyHG4FopYb54m1pKka6f0CWP/OatBthbOGZvpCuNBQGq7M3/ob2tA/d3eP5kVeDcFt9rdGsqgbtCn8EdjvW0a9rA9XQK50
X-MS-Exchange-AntiSpam-MessageData: psGbysc1ke/yoovYHUDS3Is+pSHXZto9AxZsQhqq9Z84+3/UE+YlnBUewgBdGpTiwvKAD5hnY8bJIG6KHxQgwGlw+w9JrAwz66v54EaXdw2K7xXYTzpfJkVXtU9hSDmT0yFZ3y6ii2OO526RcAzQJLDyVbxT4inwHGjKh11YJJaQ7bs0i9pteEx+cOPZIs6A4DNGog5gPiWeYAYI8+oSmD/B14X2lVrAknCUfk7C82WfcDnqJDKW4H/IP3PgVejk6DoA/NKSic7iWxTXc1Ik7UaEnzUYs0VvUFHmkjz3SCfaUeukFkNvJUkUabyihJE7udAH5tlhEvx5FLs55+OiPi4Ns25kEtuZnQ6TynljhNp8WPIx816erHjrwdyk1KEQyBmDFDMDU1CPk5DSeEDqoZgalGk+mhZmj7dUI2zB8uJD54ZnkINNkwMQnoF8QCEoHrKOn/axzuClSz5DNpI0cp2q+sT4PA/bmkFIrW3bALc=
X-OriginatorOrg: rsmas.miami.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e076a8e-0356-4b15-0823-08d8145a2da2
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2a144b72-f239-42d4-8c0e-6f0f17c48e33
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ViErJuBR6WwX5zqNEQGdExsNOqOPKt3taG8voyB6xMlHQt2Kee4VNlNbecSiYF5/JGyqgn4gHOE/xIpA7Rt1aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB7164
X-Warn: EHLO/HELO not verified: Remote host 2a01:111:f400:7e88::717
 (mail-dm6nam10on20717.outbound.protection.outlook.com) incorrectly presented
 itself as NAM10-DM6-obe.outbound.protection.outlook.com
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
From: jim via samba-technical <samba-technical@lists.samba.org>
Reply-To: jim <jim.brown@rsmas.miami.edu>
Cc: jim.brown@rsmas.miami.edu, Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

If you want a minimum of 2 workers then why do you allow a result of 1 
worker?
The second test should be '< 2' and 'return 2' to match the limit of the 
first test.

On 6/19/2020 7:00 AM, Andreas Schneider wrote:
> +    # Always run two processes in parallel
> +    if cpu_count <= 2:
> +        return 2
> +
> +    max_workers = int(cpu_count / 2)
> +    if max_workers < 1:
> +        return 1



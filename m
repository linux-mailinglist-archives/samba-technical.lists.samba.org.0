Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F5C11D743
	for <lists+samba-technical@lfdr.de>; Thu, 12 Dec 2019 20:39:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=rdrlgK/1UO2PfXVu1pbR40Qq30Y5eA7jS4lvWKdR8Xs=; b=UaPBY2oKYozJW9RebSobI1QLbb
	7oN/UYh9opQ47jhqFf3wp0hKww7iVB74g/4GhSDtwn1V16QYkr86k+3w9Dq3BVQ8G32mczCkcFmrG
	vFV5AsiUitiQS6aRPnolDmYyvIxoENoiPRxsWbiY/fAugpw+L/nEGsKK3NhhtF4+tCKuCnJephSxL
	KcrRHeGqmRQh0gdPqVCyQnHB+cdhWLWttoFuBfDCz/tBmxg0ZLKeI44vuZE+Nm+ECW3S/ibVhIbQY
	q8ZbrkHN/gMn4MIWQ/xJdZHepsqP/dOhQhXe+CK24hl3iAiaRtUTSDLSHBhLqzDlXYbEXmRbXThMy
	naP24Kmg==;
Received: from localhost ([::1]:26186 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ifUHZ-0074oS-Hd; Thu, 12 Dec 2019 19:37:53 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:8652) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1ifUHU-0074oL-4p
 for samba-technical@lists.samba.org; Thu, 12 Dec 2019 19:37:50 +0000
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBCIePWk143847
 for <samba-technical@lists.samba.org>; Thu, 12 Dec 2019 13:43:39 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wupys8ten-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <samba-technical@lists.samba.org>; Thu, 12 Dec 2019 13:43:38 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBCIcgZa006578
 for <samba-technical@lists.samba.org>; Thu, 12 Dec 2019 18:43:38 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma04dal.us.ibm.com with ESMTP id 2wr3q7cad5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <samba-technical@lists.samba.org>; Thu, 12 Dec 2019 18:43:38 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBCIhbr147251860
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <samba-technical@lists.samba.org>; Thu, 12 Dec 2019 18:43:37 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5DCB2AE05F
 for <samba-technical@lists.samba.org>; Thu, 12 Dec 2019 18:43:37 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D7D5AE05C
 for <samba-technical@lists.samba.org>; Thu, 12 Dec 2019 18:43:37 +0000 (GMT)
Received: from mail.gmx.ibm.com (unknown [9.209.252.215])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS
 for <samba-technical@lists.samba.org>; Thu, 12 Dec 2019 18:43:37 +0000 (GMT)
Received: from m01ex005.gmx.ibm.com (10.148.53.45) by m01ex011.gmx.ibm.com
 (10.65.151.204) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Thu, 12 Dec
 2019 12:43:24 -0600
Received: from m01ex005.gmx.ibm.com ([fe80::7d2d:476:2d5a:cb2f]) by
 m01ex005.gmx.ibm.com ([fe80::7d2d:476:2d5a:cb2f%9]) with mapi id
 15.01.1779.002; Thu, 12 Dec 2019 12:43:24 -0600
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: Parse::Yapp::Driver on platforms other than Linux
Thread-Topic: Parse::Yapp::Driver on platforms other than Linux
Thread-Index: AQHVsQ4oNxMvyZtrCEO1mpNIpdPbYA==
Date: Thu, 12 Dec 2019 18:43:24 +0000
Message-ID: <9ff45788c1634239b78dea68d22e4fad@ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [9.16.14.37]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Content-Type: text/plain; charset="iso-8859-1"
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
From: "Christopher O Cowan - Christopher.O.Cowan--- via samba-technical"
 <samba-technical@lists.samba.org>
Reply-To: "Christopher O Cowan - Christopher.O.Cowan@ibm.com"
 <Christopher.O.Cowan@ibm.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

So, my builds broke on AIX with this commit:


$ git log -n1 --stat 83ffe67
commit 83ffe6752d589180eac96d7b8e7d1a54e3476bfd
Author: Andreas Schneider <asn@samba.org>
Date:   Thu Dec 5 13:48:52 2019 +0100

    pidl: Remove Parse/Yapp/Driver.pm

    This file is provided by Parse::Yapp and on install we overwrite the
    orignal file.

    Signed-off-by: Andreas Schneider <asn@samba.org>
    Reviewed-by: Andrew Bartlett <abartlet@samba.org>

    Autobuild-User(master): Andrew Bartlett <abartlet@samba.org>
    Autobuild-Date(master): Tue Dec 10 01:54:02 UTC 2019 on sn-devel-184

 pidl/lib/Parse/Yapp/Driver.pm | 471 --------------------------------------=
-----------------------------
 1 file changed, 471 deletions(-)

Easy enough to fix with a cpan install.   On AIX this is not a default with=
 the freeware perl offering.  I do have to wonder whether this module is in=
 the base packages of other Linux distros?   I use RHEL at work, but I'm no=
t going to check other distros, obviously.

Would a better approach be to add some logic the waf config scripts to cond=
itionally test and have this available as a "replacement"?

Regards,
Chris

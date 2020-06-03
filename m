Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B9B1ED8CD
	for <lists+samba-technical@lfdr.de>; Thu,  4 Jun 2020 00:52:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=NK2x4tgD4v+4dg41qhS4t2GnJFMB3BodNCbLYd7bCG0=; b=gWgoK84mqQLsivJRCr1eHz+rrO
	uCCxv78mMdyKV2z3wwOnJ4nCI6UsDsqi1dzq5PTWC1XIHic5yQjiUV5A7DmbttCqcQAmka5O1ni1q
	s5J/yrb9nsCyVAseO03xcX+iN6doxfm/LhqDm2PXdPQbW5PCFlg+A+bYRefwdmWFh8wl+VVBsALba
	CAHG9thPszBzXfwmRmXkMu+4u4d9Q3MEzvq1YZrPah+tKzCROfGQj0KL886X9PyUzN3/XJ1LAyW+n
	uMFYjWy37UlikL5l2Ou46QEhnCz0Km5Iq/kLPOyAfuW/SREG1TzlFT8IHO0YeBtsHEk+ioy/AmbN5
	JafUTNTw==;
Received: from localhost ([::1]:54976 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jgcEU-008jB1-AT; Wed, 03 Jun 2020 22:51:38 +0000
Received: from m4a0073g.houston.softwaregrp.com ([15.124.2.131]:39951) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jgcEO-008jAs-Uj
 for samba-technical@lists.samba.org; Wed, 03 Jun 2020 22:51:35 +0000
Received: FROM m4a0073g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0073g.houston.softwaregrp.com WITH ESMTP
 FOR samba-technical@lists.samba.org; Wed,  3 Jun 2020 22:49:19 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 3 Jun 2020 22:51:06 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 3 Jun 2020 22:51:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G7IfMFXxauV8sbetqbkRPeMyqQpme/83r4wH28Z6UOTRFTDoxn6jzYERlNiE1jzoUXGyhWXPokdOI1Qcubfa9lZ+R5ilwvHvzFZkCEPYzFU68kSG2Vs2jVy5WshusvhbIODi0Y0a2qCgPV8dO1ClfADQFmz7eKotyNGS1UI2RBYsWqv2NywI6jFmDITBespiW+pQKrS8NbU56y5y44lrzsLOD0NkKCI+eX0ka30gAFZxUGxaQYptPpvrQAjvaGtxeFRhy8R6gV2QzqXuj71G+eb+/D+yoMsKl+vDO78aYi2EQzZZr6nMSfLsk1xv1zKeOSmeHVIou/GY1iswNhsv9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NK2x4tgD4v+4dg41qhS4t2GnJFMB3BodNCbLYd7bCG0=;
 b=gZV6chsfklW03m1Ovt1LugYQgpRdYJ5X4QGvsToVoym8gruriUW1VO8MXtxxcjG1yfEy/merKkKMsydhTQz4h34vMRIQ7PByInkQg6SlZ4+zKwieA/9G/Va63p46f3zdjXp/t9AwNjlRSb9/WH8footBEWj2bnaek66c2HQRD6O4CCtobxEJaENmaNHHmgorYNg8FzgyZ6WEVyrXznd8ocVN/5M3v+vnGmaijxm65euPY/okp02xcK6DRxHWNv2Ymwm4OoGM3JelAt0vg7hbkdHiyTi/xG7zlJjnkmoWGe3AUuROX0yf6GTa3X7qR/UpQXkg7YGU6anFpYNfa0MEBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.samba.org; dkim=none (message not signed)
 header.d=none;lists.samba.org; dmarc=none action=none header.from=suse.com;
Received: from MN2PR18MB3199.namprd18.prod.outlook.com (2603:10b6:208:163::32)
 by MN2PR18MB3608.namprd18.prod.outlook.com (2603:10b6:208:26f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Wed, 3 Jun
 2020 22:51:04 +0000
Received: from MN2PR18MB3199.namprd18.prod.outlook.com
 ([fe80::bcf7:4209:3ebf:79cb]) by MN2PR18MB3199.namprd18.prod.outlook.com
 ([fe80::bcf7:4209:3ebf:79cb%6]) with mapi id 15.20.3066.018; Wed, 3 Jun 2020
 22:51:04 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: Release tar ball scripts
Message-ID: <7e3f689e-1170-8824-340b-b6af3a7ddcbb@suse.com>
Date: Wed, 3 Jun 2020 16:50:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.9] (74.122.77.94) by
 LNXP265CA0043.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5c::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3066.19 via Frontend Transport; Wed, 3 Jun 2020 22:51:03 +0000
X-Originating-IP: [74.122.77.94]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ff956fb-f4ca-41ba-adf6-08d80810981b
X-MS-TrafficTypeDiagnostic: MN2PR18MB3608:
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: JKu5d2ir99spvGgo8UUK15cXlGqGTJlKWZy9gTwVq1e5lArmduR2qTAWxNbITb3OCPzV8yhEos5Q0/8ta/c3XbkkMjh5dmX7ZXDrRRcJXU4XLg7215uc7xJIjhlg0rcyRSdGhIJjtQy+5uyOeRMwFEyNfC4MlCT/dU4p6P16LzpqOFqw5HgUNYaX4QBXEUqX2w21FptP5LuGJGfxWdCvVuYCQc7V5VvFIKWSZ9cKVXQGJfMOp5cusXRBrKgJs2fcOI3AnU6Pl/q3HfwJjmc0xvYcxpZHSRCP6Sjkn5m4SNDTUDofNmo7lS4ZPCHxfSyM6Zf08TiNCAH1N8sg0BXbDDnMAlNV1z8X+pFWj+Sdh3xbI39rlG6iK95mUj9xgqXZYXW575BXBz8g/+SE0JNX1Cv0BVA1lnipa7l47k03pIQO+SwVeI201wlPyfJUZXsa2NHgYVHQWR0pH0fshNZLVw==
X-MS-Exchange-AntiSpam-MessageData: BYpJze9llxL+auVpTyUzH6DHWM8Z2WEclIyTdqmHkmoUtOYs5F7qqrcelHsdlv1ZAxdB+YOzyRA3Odyn3sfBHi18kNaz7PZb03fxeQmFZOBwyyOq+BfIp5fhAFc9PPqoCWWUJn1INS0YqesGh72EirZVh92Nv4GW7E9v+mTXEBMORVqRHHoIaswANoyD2qxj/IDvma/2dmtA67tS3NkjhnFuA2L4R8QARzX+G4WRoCdmcHNJAQ7W6JAoW7hlpTlR8r4Tu0ib/cQeDq9Wakq4sS8Fa1Xc5JLmJxWVavWTpmZuwYLnw0VdTtvd/3CvUwjh1L0LtQZ1UjDcTfWDpg50ibh5ZwsjiMrjJMVnVgQO4H+eFywDCkwOXrz4nc72igHc+sPFVet5hPAx/ymtZBp+379X7K64zpVmadzLGru80LkQhPbgszPUUE9mCAjsQVWE05AbICX4BCUlQCvlCbmA5EeXkQ/1cfEHMEq9zwJoW1o=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ff956fb-f4ca-41ba-adf6-08d80810981b
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ig4QL0adkrthErb2jFneWwrq2oeiOnoiRv8nDDCbdXXWl955YH1qp3ug0A4dJ7Y9UZYSD9x4hLJoUJ+L/hfo0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3608
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

Where do the scripts live that generate the release tar balls for
talloc/tdb/ldb/tevent? The ones on samba ftp?
I'm trying to generate the latest ldb tar ball off of master (master
requires ldb 2.2.0), to simplify some build testing, and it seems like
I've seen these scripts somewhere before.
I could figure this out on my own, but it would be easier if someone
could point me in the right direction.

-- 
*David Mulder*
Labs Software Engineer, Samba
SUSE
1800 Novell Place
Provo, UT 84606
(P)+1 801.861.6571
dmulder@suse.com
 <http://www.suse.com/>



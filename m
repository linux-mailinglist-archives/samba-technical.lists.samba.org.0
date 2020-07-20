Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 107AC225999
	for <lists+samba-technical@lfdr.de>; Mon, 20 Jul 2020 10:03:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=AQCEKSOJwkR496P4H0W9LCvpLYko5lfZEFqiyTm7WPc=; b=k5ldGx02zbKFcV05AHlw21UBtG
	xFUITsfBgUTID1bTd0cvRM/fDbuRR8bR0YdjKrcWZGhL+QcW3BF4cP3vsInJnbH6SlJbx3TQ9oaq7
	Vrvn/qmiiBbYOYmN6vpP0Q0Jy6M8DbifRetsHyIGwP4ShfDfOarbie/8ME6Yj0//V6OZbjWCfIRx1
	8QsfKvVEdXV7rHvPxhjpgwD5QuLAC+2Fh8+k0YO0yR/0zw1ZD71fD5q3LC8jZSXxONNQ4hVjjCnii
	jYmpIpOs+l8q91PQ4tFmL+uzRa/5s7e733EBKRqhPqksoDLuWQAq+BlekS/RDuAAiOrEo2xe+08E2
	hlD+LgiA==;
Received: from localhost ([::1]:23736 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jxQlX-008lfT-9C; Mon, 20 Jul 2020 08:03:15 +0000
Received: from mail-dm6nam10on2127.outbound.protection.outlook.com
 ([40.107.93.127]:1697 helo=NAM10-DM6-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jxQlN-008lcr-7l
 for samba-technical@lists.samba.org; Mon, 20 Jul 2020 08:03:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oEl5VQNXEKqghI7mOlSBPP7HE6RDsLzQSQKzliMEpX3NRpN+9jOPHdKW7o20zflHzZQTixCSDfoR1IdbFZYxWmmM5HRGoVQbCdIcGIFqy2Wd2wf97TNssj/34a+JHX6NMPBnlv+z0jO982KJ3TdwsYrnaFfCUohqUrmJ/lCqFaohGRwJN2p1uLwX4Pd5id0FI+gDtFlZFtMSJRT2GKCMlY452ZWvxqRp79yZwqtbz/tm9cah1Ax5dDZAr9ouhIm7wz9u9/Lil2kBa+/WxofP4UDk0ejLXxM1yXmPlL/6vOKL+weD7POOXci97ooPPgbPlSo7qGnJY5YHomkqFlVECA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kthHBdjID3DVNR6FBMbX41XVDmEA/kH8cWI9y+mceDk=;
 b=PtBBWhshx30XcfMRgOMKfAq33hRGqt6nciWxIGQPtShyhRie6caeezLrb0Oq21naAnpdHfLz1wx1s9YfYuM07cc7rH3HZxe0TeokMhZxuXefzTvsP+ZZkESlaccB2G4HYW8h8NodKuP8ilJKo7dou3viC4RmFRAOrGwmo1s7kwGXzZuPKGBstRA/nX91ZwMGf14Xd1LQ7PASsxJJ0vgiujAB/qj/SBb48tGqjv5gU+hOKWrUE8mXisFNHJ0LhlBR/Bhr7ycqeycwJ8fkIcRijeoEPr9MUHB1njuqaXspdw0kCmestZh7UC67z8Hy8JXahnpmn35iYvYrf+FeMXbw1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=commvault.com; dmarc=pass action=none
 header.from=commvault.com; dkim=pass header.d=commvault.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=commvault.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kthHBdjID3DVNR6FBMbX41XVDmEA/kH8cWI9y+mceDk=;
 b=EADJd2kQPpDJ/+JW699kAoV25l+85N3Ak4CxyvmGlRPbsMz3HajOkGRaG3Vlz60IYzEleJu3+z/RXqZAnXq8WLOL4LGplsJBQ5y3afZ1pJpj8Vf3/1mlNYL3Giw7fKJH/800RsznL5tdONlARzJQZjO4i9ZxZCvhm8OBtTohmtY=
Received: from BY5PR19MB3096.namprd19.prod.outlook.com (2603:10b6:a03:182::29)
 by BY5PR19MB3349.namprd19.prod.outlook.com (2603:10b6:a03:18b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.23; Mon, 20 Jul
 2020 08:02:48 +0000
Received: from BY5PR19MB3096.namprd19.prod.outlook.com
 ([fe80::a468:d4c3:9485:837]) by BY5PR19MB3096.namprd19.prod.outlook.com
 ([fe80::a468:d4c3:9485:837%7]) with mapi id 15.20.3195.025; Mon, 20 Jul 2020
 08:02:48 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: Samba 4.10.4 - Error loading module nfs4acl_xattr due to dependent
 libraries
Thread-Topic: Samba 4.10.4 - Error loading module nfs4acl_xattr due to
 dependent libraries
Thread-Index: AdZeZWKV0/pBpYqlScGFyi/z1rB3JA==
Date: Mon, 20 Jul 2020 08:02:48 +0000
Message-ID: <BY5PR19MB3096D158005BDD10D2A4CF17DE7B0@BY5PR19MB3096.namprd19.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.samba.org; dkim=none (message not signed)
 header.d=none;lists.samba.org; dmarc=none action=none
 header.from=commvault.com;
x-originating-ip: [103.226.169.199]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2139a98e-6d3f-461f-560e-08d82c834afc
x-ms-traffictypediagnostic: BY5PR19MB3349:
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EjyDscLscsuScfIdg+S9U7wMQhwGb939EKi09KTxg5TWeNFpseHuKoxDVUvhlEZBPGGKrB1lxBiucAx79T7cBqZO0nklPh1na8Kw2Ex8n8zTkOS4d81D8YYlFbLKkptDzs32C5I7NRiiU9HhiNJvNHYGB7ifD0Q3rm0FkkyEnbSgYCLhnsr+0u6GE5eN28WtoF/CIl+IvpIdMETHHoOvPMax3MgFP3SUUyqyKd6DdAymbhg1Auwz1myUyy10ze3M+e5OP4Ho19WZGiCbIt7Suwn+vpNea4qCr38mkRtLjPZkvgb2gyJJm9tc+qSHyAQlIxY6Fp9VjmYWtIBl3rI5eg==
x-ms-exchange-antispam-messagedata: j2AIBEgJ1BC36tl6EBHVnjMMDoPs1vKTiWFV0aJSwrwVifxrdFjERqA4G1ZeUv3y1nImGv85yu8YMML0UfUmOVE6TzcWdbDfmY/VkQELMscaPbRoSpnOA+8wF7D0+FjB9lUkv6pltdUHcUhCWI06RtRg6IaoglXHQMGvLANTT1rRAvpZCq08/F/308olCkblY4iyNw7YANjFXwsIbo03cx9NmyNq3Bd7aH8m6YfQbv0VUB/Wg4v2L7G52MVuOSCk2SWn/BeBzdyJz8K4nkpWeys5TWu/v7TPrMFSkhBVYrqPZfgpVsYfSZ2Qlq0MvTpQti+ejvT/xuB/OnTFRQh2ybtNs6WbZQXme980X3k3uM4+hjzL3PUoOuKrTJy13CFpGkRJ/OXR2MPVbBY0orJTkuqPa36pu/Tho47SRvy/juyuy4UJlO/T08WLDuG5FGZG/Xhq6A6u8JEc6UxsHeBOKD+DbKldqBbIuZRiHTlrU56rTqTA4FPj6AYs4o/7+wdR
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: commvault.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR19MB3096.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2139a98e-6d3f-461f-560e-08d82c834afc
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 40ed1e38-a16e-4622-9d7c-45161b6969d5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4is4U4n1WpO2m4061T+HOYbm91wx9IeVSe6JmvbAAy8jJ0qTYa/oymkYKF3nP7bIln9Njo4mITQXy/8hNhhlD0RzrW+mtiyM5kwD8MY84kg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB3349
X-Warn: EHLO/HELO not verified: Remote host 40.107.93.127
 (mail-dm6nam10on2127.outbound.protection.outlook.com) incorrectly presented
 itself as NAM10-DM6-obe.outbound.protection.outlook.com
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
From: Sandeep Nashikkar via samba-technical <samba-technical@lists.samba.org>
Reply-To: Sandeep Nashikkar <snashikkar@commvault.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello

I am trying to load VFS module nfs4acl_xattr which is compiled and linked o=
n Samba 4.10.4 as shared module.
It fails to load with following error:

  Error loading module '/usr/lib64/samba/vfs/nfs4acl_xattr.so': libgssapi-s=
amba4.so.2: cannot open shared object file: No such file or directory

I have been using the module compiled with source with samba installed from=
 yum repo till Samba 4.8.3. I did not face this issue before.
Can someone guide me why does it depend on this library and how can I tackl=
e this? Do we need to install another package to fulfill the deps?

The libgssapi-samba4 library is not present in standard locations on a setu=
p where we upgrade/install the samba-4.10.4 through yum repository.
Its present in the ./bin/default/source4/heimdal_build/libgssapi-samba4.so =
when we build the samba for the module itself.
If we provide the LD_LIBRARY_PATH and use LD_DEBUG=3Dlibs, we see it loads =
many libraries with -samba4 suffix from that directory.

Do I need to build samba module with a particular configure flag so that th=
ese dependencies are not required?
Appreciate any help in advance.

Thanks
Sandeep

Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id B98B71339F
	for <lists+samba-technical@lfdr.de>; Fri,  3 May 2019 20:34:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=AaF2xGmMKEo5FJDdTrOyQaKRcbKSqw2PgK7WBJg3wyw=; b=H6nIN7vVT4KUxma5NztaAqyUmq
	XwGjeoD/gMkhaRuofcg9IfzxDKAVcYzYaIN/lhBrzYL/9F/Kb3z8RDN28WqqNatW/QD4a2303glXK
	w7XD8Jj5buMQeu/Raf0QDTt7lUqTDOtRIyPKhO9maueYuUebXb36WNcsZoJbk4enV45RyZfMH68Q+
	2ks/v4n0Z1BJfI7u+YNn1jTdqGcOGDgZ9UxidpY8njPhP1PnXK90Vo+yGq8MNcNEWSZL3hmQgQzrB
	dmGkURXb3CUn3I6vOOC+Oc9Y3ppktW1KZGLmL+GpLqreWQr3BlbBUcgwp/GUptTUaQJzYmKffVn9s
	HQFciNDA==;
Received: from localhost ([::1]:33394 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hMd01-002Jox-K7; Fri, 03 May 2019 18:33:33 +0000
Received: from mail-eopbgr690120.outbound.protection.outlook.com
 ([40.107.69.120]:63651 helo=NAM04-CO1-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim) id 1hMczr-002Jop-Vw
 for samba-technical@lists.samba.org; Fri, 03 May 2019 18:33:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=WDcppC4TXLE4sjl6q7IiuI4fG6leXuByWs6Lj/K+50CzsiJneYiEhMNWv2mMeacW/jV6UsebqoJN7+rxzXHD5baKZ5+BzGmDbGfX1Ue3IqBO3gLLDP0kvhwFictyMqwsdIHSxZZKC4XZgROa1cug5SSGEZU/8sAxx1yScQQq79E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaF2xGmMKEo5FJDdTrOyQaKRcbKSqw2PgK7WBJg3wyw=;
 b=sRawLMgMn4A13045qrQfXRPZzSJln6ZhDya9XINM6klfC57KybGa7V9VcGEUwnSTYJIVBYljb9PhvV49En2Rmya6X+X2I1+KkqgzGBd0RW6H1Hr6ua/N3XrxqBWJT8S58AkcXpmfsCq9T5jDS0k3YVGsGmQ51KUp+MFlANwRHss=
ARC-Authentication-Results: i=1; test.office365.com 1;spf=none;dmarc=none
 action=none header.from=microsoft.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaF2xGmMKEo5FJDdTrOyQaKRcbKSqw2PgK7WBJg3wyw=;
 b=b2iSp5EvdYdmd3jxvXUcoe/VAsj+lyGhshBW9U0HBdZF9P8OH9SqDPzJwX0od2tWOks5318h84zF9o8dshzpFO68HDFxS/Mmy4Bt1tU+RYhInZ6sEmJDllZ3+om+vxiCFFMskeGZf05zvTx9mqp20497/0UNPKpN/ZUSBCBIM2o=
Received: from CY4PR21MB0149.namprd21.prod.outlook.com (10.173.189.19) by
 CY4PR21MB0760.namprd21.prod.outlook.com (10.173.195.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.20.1856.6; Fri, 3 May 2019 15:57:21 +0000
Received: from CY4PR21MB0149.namprd21.prod.outlook.com
 ([fe80::557b:1240:94cb:8f77]) by CY4PR21MB0149.namprd21.prod.outlook.com
 ([fe80::557b:1240:94cb:8f77%9]) with mapi id 15.20.1878.004; Fri, 3 May 2019
 15:57:21 +0000
To: Jeremy Allison <jra@samba.org>, Steve French <smfrench@gmail.com>
Subject: RE: [PATCH][SMB3] Add missing defines for new negotiate contexts
Thread-Topic: [PATCH][SMB3] Add missing defines for new negotiate contexts
Thread-Index: AQHU9gDJf2vMizjMXkSZLohRVXfnP6ZCKvuAgAYumJCAEUrw8A==
Date: Fri, 3 May 2019 15:57:20 +0000
Message-ID: <CY4PR21MB0149DC81B079BCD36D580AC5A0350@CY4PR21MB0149.namprd21.prod.outlook.com>
References: <CAH2r5mvEYMEUjz8BDRUumn0yGq__VntNKx-8AzWcZgCDOJQv-Q@mail.gmail.com>
 <20190418172353.GB236057@jra4>
 <BN8PR21MB11863B736AA5D284CC213118A0220@BN8PR21MB1186.namprd21.prod.outlook.com>
In-Reply-To: <BN8PR21MB11863B736AA5D284CC213118A0220@BN8PR21MB1186.namprd21.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=ttalpey@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-04-22T15:50:30.4876102Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=f0abb4e3-ff34-476d-93c6-1b868e8a85b8;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ttalpey@microsoft.com; 
x-originating-ip: [2001:4898:80e8:b:d82a:7b3b:e387:5826]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ab1b744-8453-44b0-6145-08d6cfe006ac
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CY4PR21MB0760:
x-ms-exchange-purlcount: 1
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: E3YIVP21+EhWmadAJaKUmCGw3xk5tbYpIuN4vCGa4ju0TQKLeYslmgQrZPRQPBKc8tcgLjDU5tu/HGO3oyRUc1dHEijdDzzyS22Mjb0o/U6fUQiIdgjpJ6mb+a2nRZDkRGPJ5bsaiiqs9acOqNA1AMbdGu/FtH5/fqonufbkIyPt1XZ1ttm7qNXws8MkemC3PWAjiG+Rtkrqt4CAEJpYO4SxmWVmVkqvo53NPqETxgP26vIjAR7MwUp0PrOmex/dN9uSX7xt1ul7LzxesshxHjR+TTQscyJqBuA4XbzGWP3/033uOUEzJbREBG5UD1NbUO59JbBsMduozyehEFxUDoubROZtN0d6evqWmA5zAy2/IfEQBpH47RywL713KrLQyqQ7QDD62FXf6LTPOk2aKLgxpv+H/zHx6hyVr15PwgU=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ab1b744-8453-44b0-6145-08d6cfe006ac
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR21MB0760
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Tom Talpey via samba-technical <samba-technical@lists.samba.org>
Reply-To: Tom Talpey <ttalpey@microsoft.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

> -----Original Message-----
> From: linux-cifs-owner@vger.kernel.org <linux-cifs-owner@vger.kernel.org>=
 On
> Behalf Of Tom Talpey
> Sent: Monday, April 22, 2019 8:51 AM
> To: Jeremy Allison <jra@samba.org>; Steve French <smfrench@gmail.com>
> Cc: CIFS <linux-cifs@vger.kernel.org>; samba-technical <samba-
> technical@lists.samba.org>
> Subject: RE: [PATCH][SMB3] Add missing defines for new negotiate contexts
>=20
> > -----Original Message-----
> > From: linux-cifs-owner@vger.kernel.org <linux-cifs-owner@vger.kernel.or=
g>
> On
> > Behalf Of Jeremy Allison
> > Sent: Thursday, April 18, 2019 1:24 PM
> > To: Steve French <smfrench@gmail.com>
> > Cc: CIFS <linux-cifs@vger.kernel.org>; samba-technical <samba-
> > technical@lists.samba.org>
> > Subject: Re: [PATCH][SMB3] Add missing defines for new negotiate contex=
ts
> >
> > On Thu, Apr 18, 2019 at 11:06:57AM -0500, Steve French via samba-techni=
cal
> > wrote:
> > > See updated MS-SMB2 - two new negotiate contexts
> >
> > Link to latest update ? Is this a draft update
> > or a full new version ?
>=20
> The Windows protocol documents were updated on March 13 for the
> upcoming "19H1" update cycle.
>=20
> MS-SMB2 version page, with latest, diffs, etc:
>=20
> https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-smb2/5606=
ad47-5ee0-437a-817e-70c366052962

So, there was a defect in the published spec which we just corrected, there=
's a new
update online at the above page.

The value of the new compression contextid is actually "3", but the earlier=
 document
incorrectly said "4". There were several other fixes and clarifications in =
the pipeline
which have also been included.

Redline diffs as well as the usual standard publication formats are availab=
le.

Tom.


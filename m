Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DB08E79DE2
	for <lists+samba-technical@lfdr.de>; Tue, 30 Jul 2019 03:20:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=npPlCFSmMh9kUixW6XFutZgnJSdrTsrxN8qsR/rUtQM=; b=3q9By5rNuw8DaoYRKBK+QYYimq
	tIGf7ONPv7iD1OAIdtXw26Qt2BbMw/NEF0K/56LKRsXZvtQ19qBPJg/3ffaYa0EesO53D4OF5KfiJ
	ZvnwnjZoZatGpGQFkepFWRIorzPShgcpWTaZuKF/k3j17au76abM9HG1mlSwMpTVPz6IccVAZiOW8
	Hkp17ARwna8kYQjSSiMnxtqdKca+U32dvYAly+kfme19tYjpsepH4Sr0enuMCUTaN7sJrhf+x80aD
	9rnL6dsg3rKWnxDyDnD209DFtu1tImH47eFjSK0MxNxRbbWlJulUv3DOacUmrcnD9YBMmJo3E71aE
	WN8lM9Kw==;
Received: from localhost ([::1]:59492 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hsGnz-000s38-CO; Tue, 30 Jul 2019 01:19:55 +0000
Received: from m4a0041g.houston.softwaregrp.com ([15.124.2.87]:44969) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hsGnt-000s31-BB
 for samba-technical@lists.samba.org; Tue, 30 Jul 2019 01:19:53 +0000
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP
 FOR samba-technical@lists.samba.org; Tue, 30 Jul 2019 01:19:47 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 30 Jul 2019 01:03:10 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 30 Jul 2019 01:03:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eVMyyJdyvKfnjBb5Djm2p4VMkW8BOCAkOPyVUyxjxMQEhWH0mKWGVK+5LeaUuM1xduIESlEsUN2XmB9fJPlt3gmf+kbuEs9xIIDJC99MzEK+RmaCx9dAUc0staljjDNGNkZxKKf4Wm41Za9bjuVCCDw9tB3jN+sXzm+9YmpJQ2aLbQedxYs06Ih++VutzyhGxxAq65mKW7e1hqazphiYGoaBODMxvPF+qb7KoHNn00CmqC3XfOSuc0GEOhKJFhCopXyBCP4erQZ2YgFAShdh2FapiAjV7s9H9NuuMXvUDM6ROYM9nT6w6c6IuWooGa4d/slc5IdUqOpsGbdXQMTjCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=npPlCFSmMh9kUixW6XFutZgnJSdrTsrxN8qsR/rUtQM=;
 b=aiNiMoErxZl43twWJcEgaINQ0zpKkwoS+sEaXejJAvvdk9zJLiIqW9ypu2VyFJskjq0+Netk9xDl7y5D3DbuEdkL8AdLrxf3b+iZ6CiQlA6GwXxBzW3XVGPDJINM5tF3xEGF5gdnpgEZcCrVyYxVNc3QGU155BjlioLhm2R1gT8BlEDbxyrlBMsiTsoi9ZeptoRwOCgudoFk0QLZyww/r+kQ6WytpIprts94Qi4QIyJMyREl1Qsq/7P5OMh9rfUzHFk3CMcsidvJAt9mJdSJzbNJQd4B3jSqOuJcQu8vl2POWSR6/2NKwxOLkAmc7dbVwEOv1Yc+YHbq/7aWsGJUYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from CY4PR1801MB1861.namprd18.prod.outlook.com (10.171.255.12) by
 CY4PR1801MB1975.namprd18.prod.outlook.com (10.171.255.140) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Tue, 30 Jul 2019 01:03:04 +0000
Received: from CY4PR1801MB1861.namprd18.prod.outlook.com
 ([fe80::801a:2bc2:5211:88b5]) by CY4PR1801MB1861.namprd18.prod.outlook.com
 ([fe80::801a:2bc2:5211:88b5%6]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 01:03:04 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: Re: Fwd: [lca-announce] linux.conf.au 2020 - Call for Sessions and
 Miniconfs final week!
Thread-Topic: Fwd: [lca-announce] linux.conf.au 2020 - Call for Sessions and
 Miniconfs final week!
Thread-Index: AQHVRRIiNyjq9bUNcEGp/joyB9e0AqbiWuQA
Date: Tue, 30 Jul 2019 01:03:04 +0000
Message-ID: <6df8b219-59e7-6776-985f-8de05d4cc326@suse.com>
References: <mailman.235.1563886694.3523.lca-announce@lists.linux.org.au>
 <c018f760-1619-5659-c561-fed599f44c9a@suse.com>
In-Reply-To: <c018f760-1619-5659-c561-fed599f44c9a@suse.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=TSerong@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [14.2.161.78]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e375d3d8-23bb-4d55-95fd-08d71489acf3
x-ms-traffictypediagnostic: CY4PR1801MB1975:
x-ms-exchange-purlcount: 6
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IaX+SynYrqr0QKY7Z/vJDKlr6tLcECDXi3Cd6hmhZrDi67bkImsXe1NLOrdpiXajZoVIIDhWxS9F3CPXukyIhd7WcMneiS2mdGcNnnWIzxDqqqFk6jHspe1v5SnO+cFeojK3g/MY/Ilz5I8bA0Fb5V/QYeDI0ZzkGCebLkG4bI6xOi5uJ2nd011rzAPzdgfb1Bu64AxID1WSE/YV0Ra2cl047KCCgQEMK7XHgSD8pTZCltWP3zbZ0yDfvAyJoRYOEbQYP08jJzcVHMiybjHN6M8gst9sRsJKL+dquL0LKlwsUIWofkmjehfKF2uzbu0xmDLfAAMIG+abHb2IeU2VNbQBHa1vvsdl3N4iX4bVRmJrZrenIzAASjtO0BWsXczQK2DpPLS2Zz7T74zAJn0LiGKN33AulemL1qrfeF689T4=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <33828ECCE12C684FA8E2EDF771A00B24@namprd18.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e375d3d8-23bb-4d55-95fd-08d71489acf3
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TSerong@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1801MB1975
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
From: Tim Serong via samba-technical <samba-technical@lists.samba.org>
Reply-To: Tim Serong <TSerong@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Good news!  The CFP deadline has been extended to August 11, in case
anyone missed out.

On 7/28/19 5:00 PM, Tim Serong via samba-technical wrote:
> Hi Folks,
>=20
> Just a reminder, there's approximately a day left to submit talks for
> this most excellent conference.  As usual the conference theme is
> intended to inspire, not to restrict; talks on any topic in the world of
> free and open source software, hardware, etc. are most welcome.
>=20
> Regards,
>=20
> Tim
>=20
> -------- Forwarded Message --------
> Subject: [lca-announce] linux.conf.au 2020 - Call for Sessions and
> Miniconfs final week!
> Date: Tue, 23 Jul 2019 22:40:55 +1000
> From:  linux.conf.au Announcements  <lca-announce@lists.linux.org.au>
> Reply-To: lca-announce@lists.linux.org.au
> To: lca-announce@lists.linux.org.au
>=20
> Hello everyone,
>=20
> We are now in the final week for submissions to the linux.conf.au 2020
> Call for Sessions and Miniconfs. If you have not yet submitted your
> proposal, now is the time to start working on it to get it in by the
> cutoff, Sunday 28 July Anywhere on Earth (AoE)
> (https://en.wikipedia.org/wiki/Anywhere_on_Earth).
>=20
> As you know, our theme for linux.conf.au 2020 is "Who's Watching",
> focusing on security, privacy and ethics. As big data and IoT-connected
> devices become more pervasive, it's no surprise that we're more
> concerned about privacy and security than ever before.
>=20
> Call for Sessions
>=20
> Would you like to talk in the main conference of linux.conf.au 2020?
> The main conference runs from Wednesday to Friday, with multiple streams
> catering for a wide range of interest areas.
> We welcome you to submit a session
> (https://linux.conf.au/programme/sessions/) proposal for either a talk
> or tutorial now.
>=20
> Call for Miniconfs
>=20
> Miniconfs are dedicated day-long streams focusing on single topics,
> creating a more immersive experience for delegates than a session.
> Miniconfs are run on the first two days of the conference before the
> main conference commences on Wednesday.
> If you would like to organise a miniconf
> (https://linux.conf.au/programme/miniconfs/) at linux.conf.au, we want
> to hear from you.
>=20
>=20
> If you have something to share about security, privacy or anything open
> source make sure you submit a proposal for a talk or miniconf.
> You can find out how to submit your session or miniconf proposals at
> https://linux.conf.au/programme/proposals/.
>=20
> If you have any questions, please contact us via email at
> contact@lca2020.linux.org.au.
>=20
> The session selection committee is looking forward to reviewing your
> proposals!
>=20
> Kind regards,
> LCA 2020 team
>=20
>=20
> ---
> Read this online at
> https://lca2020.linux.org.au/news/call-for-sessions-miniconfs-now-open/
> _______________________________________________
> lca-announce mailing list
> lca-announce@lists.linux.org.au
> http://lists.linux.org.au/mailman/listinfo/lca-announce
>=20
>=20
>=20
>=20
>=20


--=20
Tim Serong
Senior Clustering Engineer
SUSE
tserong@suse.com


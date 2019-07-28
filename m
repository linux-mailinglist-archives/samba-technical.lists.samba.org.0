Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB0577E76
	for <lists+samba-technical@lfdr.de>; Sun, 28 Jul 2019 09:35:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=X0YZ+zfDxLdPpy/xjZVv7pUQjc5JTzuOIOzlFWNHfKw=; b=oAwYL0HP/5KTp5LO7Kbabqa95j
	O9wdmZvYYVk36/cHYNZvHpfkx6R824I7UFNTniRRCU01xX1a0TiSOTkhZKphVxqdGUqeFa/iHVbVb
	T8wf1z39nMCujj43kgTBHWe6uppRPwzyqq9OBBeF4VUTm/DkfOMWWK3VInGHEfKpimEzc+9iEWf9K
	rpwVkf7x1wgQCQUJ0owPDMglFD9np77z2dvSh/OiNpJrOhJC5X1Z322uDQ7Tt3fvPJwQE/jksYN10
	2K9GqevhcMYb0xL0jjM/nOPcDyTG/TxYEce3+eTTuVpg6XJqB/fx+yDmRxglgo8MUTXZTkgQiujfX
	8L5cYWUg==;
Received: from localhost ([::1]:59154 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hrdhG-000c46-6u; Sun, 28 Jul 2019 07:34:22 +0000
Received: from m9a0002g.houston.softwaregrp.com ([15.124.64.67]:36647) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hrdgw-000c3y-58
 for samba-technical@lists.samba.org; Sun, 28 Jul 2019 07:34:12 +0000
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP
 FOR samba-technical@lists.samba.org; Sun, 28 Jul 2019 07:34:01 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Sun, 28 Jul 2019 07:00:47 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Sun, 28 Jul 2019 07:00:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PRU8TT1ypn5x6rxzGyvbQdRuz69IpN4pzLH7C+jGZynCQK4/vku3z90mktfM9DMNrC0JgdfcOerGxBC5MiM79nZmMMjZXGJSsuaa8afjnVsqE6d5TqtwGIceOKwHSzQOQ5zrx/OJIODgWMs3mdISAWGk3urqFthtA93YHuXcu5vKYePb6Sn+hGWfd+dMB5NlVmkCEEC23HWJy1fHtifcHxkjeSITc9uUUjpl6JgetAt6/9OtxpUN0BaiL3xh29+Bi4oo/hy+v00vu0dgRnxPcJnaN4hJ8/zd3hXCb4UV+ESUXyEHjkhQekP/pPbbccq73HuRUCGyIjH00YoMlYsicw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0YZ+zfDxLdPpy/xjZVv7pUQjc5JTzuOIOzlFWNHfKw=;
 b=ciQcufzRhA1GRnLjWzkwOHlGv22qghQX4r82S2aVkdj+rSwcvGh/cLA8wubAby/eyTbeIEUcVHeWTmHJk/1kkH8LHtzWMH1r6xgy8lw7X8lAxpTnjmgckPdUNwrseaX4Wx+bjMHIJd2ESSlTKsJmcQENGLXi3UgkgiO8MbrtKj5gbiLA/KlBEc9vhFd1UgmhbwOcKkO3elBH13cRKWsPQj1r03yyM13t9hL813Z/yk4bn64m/ntX+lNGmoFXeUmyCRsPl2gWngK3uWu335AHn8oFh89spljuiIS32wXjfaseorU+BzVRhYhpCo9PLhJJLoxrkU1m5nrrlusNHpZ42w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from CY4PR1801MB1861.namprd18.prod.outlook.com (10.171.255.12) by
 CY4PR1801MB1896.namprd18.prod.outlook.com (10.171.255.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.13; Sun, 28 Jul 2019 07:00:44 +0000
Received: from CY4PR1801MB1861.namprd18.prod.outlook.com
 ([fe80::801a:2bc2:5211:88b5]) by CY4PR1801MB1861.namprd18.prod.outlook.com
 ([fe80::801a:2bc2:5211:88b5%6]) with mapi id 15.20.2115.005; Sun, 28 Jul 2019
 07:00:44 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: Fwd: [lca-announce] linux.conf.au 2020 - Call for Sessions and
 Miniconfs final week!
Thread-Topic: [lca-announce] linux.conf.au 2020 - Call for Sessions and
 Miniconfs final week!
Thread-Index: AQHVRRIiNyjq9bUNcEGp/joyB9e0Ag==
Date: Sun, 28 Jul 2019 07:00:43 +0000
Message-ID: <c018f760-1619-5659-c561-fed599f44c9a@suse.com>
References: <mailman.235.1563886694.3523.lca-announce@lists.linux.org.au>
In-Reply-To: <mailman.235.1563886694.3523.lca-announce@lists.linux.org.au>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=TSerong@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-forwarded-message-id: <mailman.235.1563886694.3523.lca-announce@lists.linux.org.au>
x-originating-ip: [14.2.161.78]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cd9c696b-8d0f-4103-4c5b-08d713294eed
x-ms-traffictypediagnostic: CY4PR1801MB1896:
x-ms-exchange-purlcount: 6
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JOF4pB/CbG8cDaAhc8SrZahugGXAHwx2g346p1jXcQ2BNoc2d7iCoYAbHVW5siDR8+3ZCAFlVSu6GezpnF8kDm0pN+brwYBzPJOi+9HzkKKsAnOvbAbB+pS7fjtneYNCiBqxqH+tz4crY6B+bQiKixwWiadaB9IuMOQHaQpUEINzcFwijWOost9eVwosPZHk1AtSA0LmuCeta8Si36LrjBs7+LRibpTUbqs//t1NLlbmFh5QnYziB5v+Yg/UsPXhFNDvhCo1HKuK+CXR4Duqhrnte0AZ3ru0lc3VjoIyJb+8SP/GjZy4ebewHv5AykG0nYuZrIlT/2ijiazJhjqDxDikZxB8M8Wo4Sx2BG9+WtFp8qMlmVpCBgNvl6FdlFrT3dyv18z0rl7ufM05LpgLoosaxgxwSRDXUpXh9z7SXOc=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <3EAE430E3B51734EA0AD9F55F06137E6@namprd18.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: cd9c696b-8d0f-4103-4c5b-08d713294eed
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TSerong@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1801MB1896
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

Hi Folks,

Just a reminder, there's approximately a day left to submit talks for
this most excellent conference.  As usual the conference theme is
intended to inspire, not to restrict; talks on any topic in the world of
free and open source software, hardware, etc. are most welcome.

Regards,

Tim

-------- Forwarded Message --------
Subject: [lca-announce] linux.conf.au 2020 - Call for Sessions and
Miniconfs final week!
Date: Tue, 23 Jul 2019 22:40:55 +1000
From:  linux.conf.au Announcements  <lca-announce@lists.linux.org.au>
Reply-To: lca-announce@lists.linux.org.au
To: lca-announce@lists.linux.org.au

Hello everyone,

We are now in the final week for submissions to the linux.conf.au 2020
Call for Sessions and Miniconfs. If you have not yet submitted your
proposal, now is the time to start working on it to get it in by the
cutoff, Sunday 28 July Anywhere on Earth (AoE)
(https://en.wikipedia.org/wiki/Anywhere_on_Earth).

As you know, our theme for linux.conf.au 2020 is "Who's Watching",
focusing on security, privacy and ethics. As big data and IoT-connected
devices become more pervasive, it's no surprise that we're more
concerned about privacy and security than ever before.

Call for Sessions

Would you like to talk in the main conference of linux.conf.au 2020?
The main conference runs from Wednesday to Friday, with multiple streams
catering for a wide range of interest areas.
We welcome you to submit a session
(https://linux.conf.au/programme/sessions/) proposal for either a talk
or tutorial now.

Call for Miniconfs

Miniconfs are dedicated day-long streams focusing on single topics,
creating a more immersive experience for delegates than a session.
Miniconfs are run on the first two days of the conference before the
main conference commences on Wednesday.
If you would like to organise a miniconf
(https://linux.conf.au/programme/miniconfs/) at linux.conf.au, we want
to hear from you.


If you have something to share about security, privacy or anything open
source make sure you submit a proposal for a talk or miniconf.
You can find out how to submit your session or miniconf proposals at
https://linux.conf.au/programme/proposals/.

If you have any questions, please contact us via email at
contact@lca2020.linux.org.au.

The session selection committee is looking forward to reviewing your
proposals!

Kind regards,
LCA 2020 team


---
Read this online at
https://lca2020.linux.org.au/news/call-for-sessions-miniconfs-now-open/
_______________________________________________
lca-announce mailing list
lca-announce@lists.linux.org.au
http://lists.linux.org.au/mailman/listinfo/lca-announce




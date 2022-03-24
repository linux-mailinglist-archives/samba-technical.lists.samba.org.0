Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B31984E65BD
	for <lists+samba-technical@lfdr.de>; Thu, 24 Mar 2022 15:57:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=3qt7pdHkWT/29JnIueB4dMyA8lWn/yA+2KnovnW1BZU=; b=3htNEzv0TSSf8f0CLoJdfp77GH
	e1oF+dXLKW9SVnGbGj57oKXru6Y2aY2bsng+u86Z0xarIMbX+GrwyqoNxVQ3a2lv2aBWJx/+l50l1
	X1iGDXVVFJ3kiy4ItberfuLOw8+SnOFelRVnWM1r8GQzpLVjphkI87aSCSVOPNtgAHUaDbKyX34sR
	S2nN1SaPr+sS6jTYdGH8QDPDfezWaP0chBYz0uy3hDZkwKmD/RKBCONVtP4f7obKhyEAART80kUL5
	nEOBCb1gqsBIA13TOftjhEEYdQXvjPqdYgik4zLWXts24VS0LOGhjSaDJ2SnblyXsoeyptkgn7Oad
	PIjPjp7A==;
Received: from ip6-localhost ([::1]:36748 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nXOst-004rhL-46; Thu, 24 Mar 2022 14:56:19 +0000
Received: from mail-am6eur05olkn20822.outbound.protection.outlook.com
 ([2a01:111:f400:7e1b::822]:9056
 helo=EUR05-AM6-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1nXOsl-004rhC-C7
 for samba-technical@lists.samba.org; Thu, 24 Mar 2022 14:56:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AVvyOvNrTR7ChjkMqsUW8iURjNymBaZvub3oEY34QnKXX87W+BYb5xAjuOvo/RDcOtv2+TISIcFWwjx2ecPDn5+KdnoBjroCeznW8txnhJ+2eK6XuB46W9C7Eh9DkHCuSF/E264TJQhKDmBdRsp0aCQ4Rx1t6+x2LnyTRj0cZywjHqUl2ZURayEqs6R8R/jQwTbrUqyPW7cfW30VHJwNO6aQzQkaSsxomcELwp373/NqP3/j4RNR6pgrDWSyL/7vJMXbdk84g/vyuBLU01XsFpCq0rRPjUaZzlp5G23MDqUA5TKBpZHF2OneB0J4wwwIAlNUpo8SPa3wVeXgx+XpEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U22qYqGpSPeuDqq/Bds+B5mJoJ0+gFOiP9JJppK/zc0=;
 b=W7GyPFFBihRUYgqqJf43sZi7LKdyX4xz7QDD7MXZcM4RU0l/aRTXdetSEZrpzyWfWbkuX0PQiE4QcEPUYzH3a3ZTdF59ZzV+hAeqFdT9mjD8ajXUAlhjVuv9rXpZ+Kha1LPCfu3tQ910h5IPY3/T21T42558SPsMYrw485BVjy636AiMZhqSsvRbi2oNMiTfKp3u+kB/EoT/FcfguXY3/PasxbYmQzeHl8ceU3nMARbqZHNNKUN6S5A+YRhzIPVMPCpXYrsX/o1Bl8ws8AxDv8RZTAWbf/R4uGV9Ko/euW4HxfkA/riyKgYsaSbMqWsSMYnrZu3MIDSmOllci57Trw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U22qYqGpSPeuDqq/Bds+B5mJoJ0+gFOiP9JJppK/zc0=;
 b=uRVjt/i3Jq+L5HX9s54X0/hMhLvbdpOCv3WhC8udOdP1g5YmdfYTJ60L3jMo2HS+awrC8wuFy/rPSB3EH+ITTwTgoCCBUvgkEk69RkjHIcYiswIKn8kWyqA/og/WnwywIQO+zvvt2317xXQnyEaWDawogJ3k+l+nSdvgf/J87nOKyvTcYSQgNWQ7Yc+4uMv54+QKjvvuuwxRAf5Gw65qWmU+pwXi1GRgIHEfbtIOVPCJSl2W2wEqi1dW3JR0q9qf2Wx8cL+yiZuvlxwy0lcS4IMnlrA7a+5Dd2WW0hu6ZHHSh9Y90woCO0aWZV/rp4Z2DwZafrdT7r87MUCF4Zv8DQ==
Received: from HE1PR06MB3148.eurprd06.prod.outlook.com (2603:10a6:7:1b::19) by
 VE1PR06MB6880.eurprd06.prod.outlook.com (2603:10a6:800:1aa::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.19; Thu, 24 Mar
 2022 14:56:00 +0000
Received: from HE1PR06MB3148.eurprd06.prod.outlook.com
 ([fe80::6554:406d:1be3:50dd]) by HE1PR06MB3148.eurprd06.prod.outlook.com
 ([fe80::6554:406d:1be3:50dd%6]) with mapi id 15.20.5102.018; Thu, 24 Mar 2022
 14:56:00 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: Re: getpwuid(13891) failed Failed to finalize nt token
Thread-Topic: getpwuid(13891) failed Failed to finalize nt token
Thread-Index: AQHYPv5LdU7dCTO6eUOwRvAfLDRLZazNgjMAgAAHKHmAAALyAIAAAX8kgACIKgCAAB7UAoAACcIAgABgI6s=
Date: Thu, 24 Mar 2022 14:56:00 +0000
Message-ID: <HE1PR06MB3148DC4E562D9D80E4C1C459EE199@HE1PR06MB3148.eurprd06.prod.outlook.com>
References: <HE1PR06MB314825C38C5FED0EFE6E2B76EE189@HE1PR06MB3148.eurprd06.prod.outlook.com>
 <be695e607739913e530fb1c8a0ccc191ea8eefe0.camel@samba.org>
 <HE1PR06MB31488952C3D608E9374C7FC6EE189@HE1PR06MB3148.eurprd06.prod.outlook.com>
 <007c551a46cbad5f4e8179c156ce647891f519d5.camel@samba.org>
 <HE1PR06MB31486C485C9614D48D1B0FDFEE189@HE1PR06MB3148.eurprd06.prod.outlook.com>
 <798cdbdcc5bb1f59af4d9c7353a569dbb55036d8.camel@samba.org>
 <HE1PR06MB3148D20F5FB86CE01ED06A7BEE199@HE1PR06MB3148.eurprd06.prod.outlook.com>
 <34f8dd3498a8ca684f20291adbcfd2d7350b0283.camel@samba.org>
In-Reply-To: <34f8dd3498a8ca684f20291adbcfd2d7350b0283.camel@samba.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [xFxxOZnWlsT9NEuDvki4B4HFHxqkQsuR]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1a021524-f7b6-4c3a-4493-08da0da668da
x-ms-traffictypediagnostic: VE1PR06MB6880:EE_
x-microsoft-antispam-message-info: 8rGb2kYKImdl8C6xGGU9ZEMt5ty9SlpI/nYWMlGJ/GZLsStApuNeJYXTajRJSqtKlizg97xiKqoAHdftHUm4v7MtJiLQhy1EBzGdGuUofNA2ElhqdGzL4kUlOqvwwcSWx83IzwkstUBYxQMuPqzYBxyf++WidkJe4b9mZFilk/I+W8MDXNZrLACP7a+wFv5M62ql1NlG69Pf5fwK10KAX4mwO4rQfK/orSsPPf0sqBH5pgQRLS0JaxqVnfk59BzZH4p6FHCHZ0eOrrRs/BaoPh1d5hoIG/dYgpeYkxXDA57B1XwsnuTynBY4o2E/18SwVk2eABb0Eh5yUXvmYJyPCFUSOEgng68F0pimNMjoiGkWtgSPmD8jsb+uoJif0Z2jablX7J5MjHo19LFBWmJt+Xnzrx4dTyGhGYZK2zu6plf3NEYaF+cfkVNJ33d8W1C6LEJkqAggRo7QIlDYCM3q8qEXLAHsnfqi7xih35+3voXY2sUJMkbQ6HxxqdLEyuyJum++FYzPfMYS8jVSaJQ8IXkkTcn34vQT0vnta3IOIVno3qswD9GN+9Y5ofvFmNIQGBSoxMKvM/BDnE5gDoKGdw==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?V9Uci/ZpsJ1JLCa66JQnmPZKDIgSl2zjWNV1GcrYYVW+zGB9aPnSfDQGRN?=
 =?iso-8859-1?Q?Cqp8pU+7EGB+fV1WyLe4xfzXuP1lKFsIe1YdAWtIcelf/67rBhPgWfuZsw?=
 =?iso-8859-1?Q?nE0mE8R68V/C/EUK0FK3USpA8tyubICb3LxvkCEcf7eh7CK0uaZoL0148J?=
 =?iso-8859-1?Q?wsH3rwZYQlmHYJnksifBBH2Qk1j04UzDhW5BIvtJ1qgMzQQy4UcGlsCiY1?=
 =?iso-8859-1?Q?E85FJdxgUAsUqQNngw7eFCVN+NoSyP6euZE1LKAk1dQqFpZaNXSEoiPMhs?=
 =?iso-8859-1?Q?neI/DCcE7tH+l8mDc46tjsLFCX7vziMvda36Li1AHmrpZ2WQjUJWvxjPQz?=
 =?iso-8859-1?Q?xRsMfEJtQCOAz3cPkdWO8LPddpBa5/m7C6gVpqPzYmD8cRS8VFUFuK9UKB?=
 =?iso-8859-1?Q?jzHBY8frEfA6IAQ0RsN4aH+nbp9dTO+KGVQ9m9LoIRQCITFkBiMNR+3Ofk?=
 =?iso-8859-1?Q?2imotfS9bCS/lMpSDkyYJZm1+GCPxcA8V9itHPLpwJQQIleaKZvpofSda1?=
 =?iso-8859-1?Q?y+IiTRJfWJf+pvL+3KNuEdPPWUZyk9rQMKl17QRAQl7WgDhkU+VJixVKRS?=
 =?iso-8859-1?Q?hUjG3NbgzyBqMzm4HQbUzwx4vaT5OOx0irQqc8R1BazCMJZUafkoFf4ht0?=
 =?iso-8859-1?Q?kvXMd250BA8Vgsckcr4p9pC51hdDHz3hGqjOw/kDw5O3bQ58XWqQrDa2A1?=
 =?iso-8859-1?Q?UKHntJqOLgxcw4vDsS9DUnlqh/ij7L6jNkouUKXgra8P/AuxCNp/y2BE71?=
 =?iso-8859-1?Q?mqNXpMm0W8K9Fl+IFJPBTzQYPJYowiKTShXV1v3qC+39PaZpnAB2b5TPqM?=
 =?iso-8859-1?Q?YtEom+WgVGOtSglRHTr8ogOH+PPJLCx2kHS3svV06or3niPbKqju4+e7/7?=
 =?iso-8859-1?Q?fpuhk4TYmHzUcBni6Gwh27JYmJfWiJ/cVOc7osgQ+edITyqwJYSzPkxUIX?=
 =?iso-8859-1?Q?sMCZmFtmxD89DywPWZVf9KvVu0cCkhbgwlQXu2AW1fPaO4Xz85zAnISV+R?=
 =?iso-8859-1?Q?dU5CEPE0+dCyiOKE2KctSlocjQrCFxncdGR55N6uzEkFBCs/81YQJAVkEu?=
 =?iso-8859-1?Q?VOzReB0u0a8e8zP7d68FleFCKNpcXdzRp+QHplbSFrm1vhl52atlRm2M1N?=
 =?iso-8859-1?Q?2owheef6Dq4mb8i6sPKlKXFL3DAfc0SN7DI0lsd+rfn2J/+W8YGwYzshiT?=
 =?iso-8859-1?Q?vzYHGhGxCaPA9Q=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-6e454.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR06MB3148.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a021524-f7b6-4c3a-4493-08da0da668da
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR06MB6880
X-Warn: EHLO/HELO not verified: Remote host 2a01:111:f400:7e1b::822
 (mail-am6eur05olkn20822.outbound.protection.outlook.com) incorrectly
 presented itself as EUR05-AM6-obe.outbound.protection.outlook.com
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
From: capricorn cap via samba-technical <samba-technical@lists.samba.org>
Reply-To: capricorn cap <cool_capricorn80@hotmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Its was the previous guy so not sure when it was configured. May be in past=
 it was NT based domain with PDC and BDC but now the domain has FSMO roles.

global]
        workgroup =3D NUTI.ME
        netbios aliases =3D FS1, SB5
        server string =3D %h server (Samba %v)
        security =3D DOMAIN
        auth methods =3D winbind
        winbind:ignore domains =3D ETL_UIP
        map to guest =3D Bad Uid
        obey pam restrictions =3D Yes
        passwd program =3D /usr/bin/passwd %u
        passwd chat =3D *Enter\snew\s*\spassword:* %n\n *Retype\snew\s*\spa=
ssword:* %n\n *password\supdated\ssuccessfully* .
        syslog =3D 0
        log file =3D /var/log/samba/log.%m
        max log size =3D 1000
        server signing =3D auto
        load printers =3D No
        local master =3D No
        domain master =3D No
        dns proxy =3D No
        wins server =3D 192.168.1.34
        kernel oplocks =3D No
        ldap ssl =3D no
        panic action =3D /usr/share/samba/panic-action %d
        idmap uid =3D 10000-20000
        idmap gid =3D 10000-20000
        winbind use default domain =3D Yes
        invalid users =3D root
        printcap cache time=3D0
        smb ports =3D 445

[homes]
        comment =3D Home Directories
        read only =3D No
        guest ok =3D Yes
        browseable =3D No

[nobackup]
        comment =3D These files are not backed up
        path =3D /export1/nobackup
        read only =3D No
        acl group control =3D Yes
        guest ok =3D Yes


________________________________
From: samba-technical <samba-technical-bounces@lists.samba.org> on behalf o=
f Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Sent: Thursday, March 24, 2022 9:05 AM
To: samba-technical@lists.samba.org <samba-technical@lists.samba.org>
Cc: Rowland Penny <rpenny@samba.org>
Subject: Re: getpwuid(13891) failed Failed to finalize nt token

On Thu, 2022-03-24 at 08:32 +0000, capricorn cap via samba-technical
wrote:
> We have another outdate Debian server with samba 3.5.6 with security
> =3D Domain. That was configured really long time ago.
>
> I can understand that its EOL but any clue about why I am getting
> this kind of error?

Lets see if I understand this correctly:

You have an extremely old Debian server running Samba 3.5.6 which
appears to be a member of an NT4-style domain.

Is this correct ?

If it is, what is the Domain Controller ? A Samba PDC or an AD DC ?

Please post the smb.conf from the Samba 3.5.6 machine.

Rowland




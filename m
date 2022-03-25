Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E83704E7AE2
	for <lists+samba-technical@lfdr.de>; Fri, 25 Mar 2022 22:48:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=UU4SA0IsmTy/KA6bR8ba2Ly1NgCp4XlaV6tQpzFPOL4=; b=mOQD/s5eT7n6LSMSZUGU+bOBSV
	0xOp34E8ntsAieLKM7j49OqO+noixCR8df3aslu2U4W6uIDI/laSd+UbpNCiUrgeIZucfIUVojAla
	9u2l/noOVDMkkjTkOYhIDmKQE7wFboPMN/XqSHH6H5lK6hISAq/Apc8Be1NQndlnLY+QSbRHVKggy
	UGmY9k7lFAFsb+JEKxxCfYxSCq7UiOxYB2iD4/1xBgTsuR3fQ1axNEudeaJKuloZyiazcCOSAg9W0
	0c02EGQSVRramcnIgC6HELgqJ/x137hsosm4dgqzUG+5ipqlWX8upqSrDTyOlm27fPJT90Caalsgu
	0+Bhf70g==;
Received: from ip6-localhost ([::1]:38020 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nXrlq-005KC6-20; Fri, 25 Mar 2022 21:46:58 +0000
Received: from mail-oln040092073065.outbound.protection.outlook.com
 ([40.92.73.65]:35406 helo=EUR04-HE1-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1nXrlk-005KBx-FP
 for samba-technical@lists.samba.org; Fri, 25 Mar 2022 21:46:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0OUpvtx5XDkzhw3Lo+H2I36baMN3D+cn8f9Ne0wxoifCoL3aIAsx9TghJqK8f3/oUj/jaNcPV7Yyb06dib2FQZltpjIgR07qz5e6otL8cIfnQ0zQEJ6LchgiWdSRfcFyM4xlU0OGgmpkvF2UNyFxkGHUoJOV3VeBqAs8CoPi178KXjQlqjVaDpaMdEn1M78bY6u5mCbc2thGFog5v1xnEuc17XtrK+i3cnH5/ffo7fGkI1lzsgSEe+bP+CFb2fev0wJaO14vJmBQPT4V3DE6uP8us+Mif0aqx022G29gXomzm+J7OBSMopiaZ7LWur8yOFDwxip7mANnyUIwfu5Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cKFzmhQX+Jhu4O92M8MChEBnQUvx/o/nQ3tlV4XTVkM=;
 b=BWX+pK2+nRUALaGvHqFATnEcHYYO0Tirjx7DHnXD0FmcXFjt2jfdVSdqE30g164++P2fs/8V5pkXxpS3Tc61phfFd6X+KGnBGEwXP/IqZcGiNmljgI8UJDmDG5srsmFRfvzq2Vlg/o6trl1F8lAZdsm6yxCMw1+pJd9u+aVl1X6lw64ZPQoRv2Wr/nn/Rg0TcByamcy18oFhLm2/xvIXT9QEBLeHIfFQkw2OedKABnfok7dCzpY3e91uxmjHvWOhIuL+F9nydenzIwvgwL1SugnaiMQe4Fstc4zCR4ZKZPIikNVkTeK6CLp34xf9G9aOoaWETmW6th3K2zA/ac/82A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cKFzmhQX+Jhu4O92M8MChEBnQUvx/o/nQ3tlV4XTVkM=;
 b=qUUfTs+TazsGBqxiUyXqxF3gD00y5qXOZOGNG9Lvqgj6whbWj1dOY5VopFiUykQDRUGyUTPINMA3B/tE6pWEYTVieCLEIxiI45CK/YemHbrjdg4EkFo8SBeIHx+fS5Ox8Ng2j7VI4jK1Uq1Io5uE+0KiuZ/LEIqJS2nrJeDoR/h51NRfdbZwzZgvUx/WVw67Q6Be9LrcUZsqyejq8lyk2q3C868ToWOPybCnBDesKQvmJEqZHFZ4ZAbJMs6H0xmAYN9bZai+1n/oqF/M55iqwRcsgVUgwzqVzpxMk2Hb6DMipKd+5GX8xeY3XWVx/uD5gh4dmBRG/tSZ3/IIuroUIQ==
Received: from HE1PR06MB3148.eurprd06.prod.outlook.com (2603:10a6:7:1b::19) by
 AM6PR06MB4689.eurprd06.prod.outlook.com (2603:10a6:20b:5f::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.19; Fri, 25 Mar 2022 21:46:39 +0000
Received: from HE1PR06MB3148.eurprd06.prod.outlook.com
 ([fe80::6554:406d:1be3:50dd]) by HE1PR06MB3148.eurprd06.prod.outlook.com
 ([fe80::6554:406d:1be3:50dd%6]) with mapi id 15.20.5102.018; Fri, 25 Mar 2022
 21:46:39 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: Re: getpwuid(13891) failed Failed to finalize nt token
Thread-Topic: getpwuid(13891) failed Failed to finalize nt token
Thread-Index: AQHYPv5LdU7dCTO6eUOwRvAfLDRLZazNgjMAgAAHKHmAAALyAIAAAX8kgACIKgCAAB7UAoAACcIAgABgI6uAAgZXiQ==
Date: Fri, 25 Mar 2022 21:46:39 +0000
Message-ID: <HE1PR06MB314896FC47360E9341A3710CEE1A9@HE1PR06MB3148.eurprd06.prod.outlook.com>
References: <HE1PR06MB314825C38C5FED0EFE6E2B76EE189@HE1PR06MB3148.eurprd06.prod.outlook.com>
 <be695e607739913e530fb1c8a0ccc191ea8eefe0.camel@samba.org>
 <HE1PR06MB31488952C3D608E9374C7FC6EE189@HE1PR06MB3148.eurprd06.prod.outlook.com>
 <007c551a46cbad5f4e8179c156ce647891f519d5.camel@samba.org>
 <HE1PR06MB31486C485C9614D48D1B0FDFEE189@HE1PR06MB3148.eurprd06.prod.outlook.com>
 <798cdbdcc5bb1f59af4d9c7353a569dbb55036d8.camel@samba.org>
 <HE1PR06MB3148D20F5FB86CE01ED06A7BEE199@HE1PR06MB3148.eurprd06.prod.outlook.com>
 <34f8dd3498a8ca684f20291adbcfd2d7350b0283.camel@samba.org>
 <HE1PR06MB3148DC4E562D9D80E4C1C459EE199@HE1PR06MB3148.eurprd06.prod.outlook.com>
In-Reply-To: <HE1PR06MB3148DC4E562D9D80E4C1C459EE199@HE1PR06MB3148.eurprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [fzNuhtnIoOiqllLjTD+4bwfvitJ0wjPY]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 694f465a-d3da-4724-f32b-08da0ea8f185
x-ms-traffictypediagnostic: AM6PR06MB4689:EE_
x-microsoft-antispam-message-info: 5uQdByAlpOo2Baj/tVyrFkwK+FzKnc/apiDP4XrL043fnO0ZOE3WHiH/vr9hrVFHA0V+7EqWM6s2YLdeAjkdYcL6XoRkTJ4hG0UijDDEnh4+wLD+/IkYIrufOOcKDy73lmIvqYTppwT9JLt7ud2ksYwa0H4k/3Ecz+ZwlakQ5Yl+7c2Oo7IJzWyHDAyToEa9mleXqlezoiOntDr1FQnRK7/OCKBhi4sG57foG4oUKZxd7d7rYbWrC0DaOdilnQPrVyJNt84M+V1+HzQxnH6CPHwyYkYK86MhdTRP0CE5uYZGDeuqsyyeeHv4wq9ZnjsVUMaqeVUEASPl7wlgCDhkdNl84UdywD6wmzWhGqERCrZ4/EID8iq2xPJmjhR9oK5vFbHN4M9S7HgYdJBQPIrjzKSE8wMy9W1gZ+ME0uuhpSaxC884rYTCJdKcMMZp1/BvQ7ic4Rg9vDOm6LqJf29oUo9VUaBgGFpR7SOD6VHfUX6MLJ5FxSXZB3Adac9JEprFq27DpTQZ4exou4ymMtnkzoBlXrYeycm3vN28Lm2sHsFcBRth+FabyS7XWgns6zT+PDqAm4SyZfW2MqTqrWC0Yg==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?7qx8FRutrC9GWbITxKyHeXYI/ysfL3uNDaQdMoy919v6ymCSxiqOiZD7OD?=
 =?iso-8859-1?Q?5bOXWTdeWxnAyZlnE+AKU5y6MS/7IG/uej/8bqyOWcJvDctrvwU4dyL7SL?=
 =?iso-8859-1?Q?eIC8mDr4Hmg9YTwj0YXYnar0Igj33ILX0O1UYABF0HykVPv0UveYwVXksn?=
 =?iso-8859-1?Q?qsR17gv3IwrgUyj5m3ULejnxmEQU+iE8uGxZkF8WWJ0Jb5j0jZEwJZl8O7?=
 =?iso-8859-1?Q?hrquweE6dxwvYXdodnZUe93gEwQIQlphtlQ4ig+qmtTmaGdRO2Fw/PzdW5?=
 =?iso-8859-1?Q?VfshMnx+/VwkoI8wv8VfrnN7Kc5jFbqkHwOz0aS1Djp7LRpIykpKBmooJK?=
 =?iso-8859-1?Q?w/+XXEjIHOzNGcdwg6AZP31eLQk+EQBfG4b2KkyOg81L66OSodG1L9GYPq?=
 =?iso-8859-1?Q?BdkIeF6/6QbXIh75pNUkYORs9sVrf35M1ey9bHp260Ul7dA+KvVvc0Pv7J?=
 =?iso-8859-1?Q?XrMI9rPP+nj+xGTQtvUTHfDwbhyBDtbFfGuuGDMb5t4ydhi+c7cOHlA3oV?=
 =?iso-8859-1?Q?CGvMu87x1Z/YsFSwvcXfDMhmfkjjxevMH4AjfNMQVBLixSlym1itVXJcaq?=
 =?iso-8859-1?Q?bvO7n3EaxTJD0+KjGE+CoA+2g38KN25HjhRC0Hd4lnCez2DFxHTOnz0RnX?=
 =?iso-8859-1?Q?yMiMHLMAYcIkEr4JFdpKISNhGRmmV5IHg70XIkVdDFN7N62602zNGEWIQa?=
 =?iso-8859-1?Q?3FbBp2KJYoSSyJ/MTWlOlDhWwdnvKZn4hS6gcKHkv9Yfle44btYfJfT7uB?=
 =?iso-8859-1?Q?FCYI+giq9kbzynt8ySjCikRYJcvpy0K7hVPWZlbYJasqDIjWmnS+lGvi+8?=
 =?iso-8859-1?Q?Kox6vhnEoF51zKgh29bA5NTxMvbtkQTsiqhIfUwSsmA9KPzcr5beTl+3v7?=
 =?iso-8859-1?Q?eW7m29LdaqKZwuqDacmVI2WgdVGJoNccwricyISQK6WQxia7I145Gr1zMb?=
 =?iso-8859-1?Q?DPqccnULLhRqkrEM6pHNCE48cdqyZwZzH0oJkvMFOYv4lbPTX4Or3t4eI+?=
 =?iso-8859-1?Q?XxhfTp7WcgJSgCzWIo0JDc4k2fj3rVpR7Z1WqGEw4q2swmObBS+v+MIFF8?=
 =?iso-8859-1?Q?VDTf8iTxn0QHqw7p0qH2nUP2z/0nqb+HlAc3RoX97Jt3OOgm5x6xGw/QZf?=
 =?iso-8859-1?Q?8XScFHt5HSKmDmi6Ib8LdE/sHTKmbpbxj5CIbGz9/3K1tRM5YJ/hhzlbFv?=
 =?iso-8859-1?Q?iCuTclDC8eeyWLi/HYSyG5pbx2QbzJ3d1IHCHXkDtvaWpCi+OaKVd47kxW?=
 =?iso-8859-1?Q?l9sTbMO70DJ/AMBrJ1CsuzPRlT5lWST4xvlLe9dQFn/DPavnK81zUuERBm?=
 =?iso-8859-1?Q?1T7XZL+lW/Y4qqN3oFyHGVUTjPGbO5HPBLWjyLwlZhqqrBWFk4xFniMWJK?=
 =?iso-8859-1?Q?sHv46hO9x9FwG+ScblLuJg///gt4wcZLHTeMpSoodkVDKKCws0wJ5g6CnJ?=
 =?iso-8859-1?Q?0wvq/c73dAelusLpdcbUHBFIVWFNvC1UxumuhTIZu01BuMtRUZEy/fjf6v?=
 =?iso-8859-1?Q?c=3D?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-6e454.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR06MB3148.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 694f465a-d3da-4724-f32b-08da0ea8f185
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR06MB4689
X-Warn: EHLO/HELO not verified: Remote host 40.92.73.65
 (mail-oln040092073065.outbound.protection.outlook.com) incorrectly presented
 itself as EUR04-HE1-obe.outbound.protection.outlook.com
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

The old server doesn't have winbind in nsswitch.conf but I can see in samba=
 documentation its stating to  have.
passwd: files winbind
group:  files winbind

My old server has

passwd: files nis
group:  files nis

Does this make any difference?

________________________________
From: capricorn cap <cool_capricorn80@hotmail.com>
Sent: Thursday, March 24, 2022 2:56 PM
To: samba-technical@lists.samba.org <samba-technical@lists.samba.org>
Cc: Rowland Penny <rpenny@samba.org>
Subject: Re: getpwuid(13891) failed Failed to finalize nt token

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




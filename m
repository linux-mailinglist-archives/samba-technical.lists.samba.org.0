Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA284E5B2D
	for <lists+samba-technical@lfdr.de>; Wed, 23 Mar 2022 23:18:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=K+BHQo8H5YJQFZssVvDUCuZXp4h/5Zcs+FiHhWEgNsM=; b=GN7eItTfTprAq9iEOQNS7PRtev
	1Iy/T24jF3ihkaE7ogcsTIF0rQzYWUZismXFtWklwMp390cMVMm3vzSdzlPfvGfxC6koXOBNInVWw
	5E63IkiRkUrnGGrc7rVXn9j3pYx8/Pk3dRMR5i8k7Qd7bU4H4BTBREDxDrOsF8RIpw71yriYsJ6wt
	HHJVyuTJ5PyfcxvYOElJX3pYG5gIAPwvU3M2ehs+44gCq0HSD/45ukweKLqswKO7Sp92TZqfejbOG
	PT9RT/VcwA840nVNF9QyM7mbPrt/G3JYuGUIPy5MA+0M6QlLNwcSqs384P3ZH5iDlUGElMU8JW5ty
	LnZ8ZbsA==;
Received: from ip6-localhost ([::1]:62560 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nX9IU-004g8g-4C; Wed, 23 Mar 2022 22:17:42 +0000
Received: from mail-db5eur03olkn081d.outbound.protection.outlook.com
 ([2a01:111:f400:fe0a::81d]:41090
 helo=EUR03-DB5-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1nX9IP-004g8X-N2
 for samba-technical@lists.samba.org; Wed, 23 Mar 2022 22:17:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZtBIYvbAOKYxtSmEmxFL1f+IVSOupTbslY0aB9avy9WXwe5zAzkC1EYlMlw8w/3uiq7SN6NGgTfB0p+dTr1CLXZwYLImwu72jGY/TfFhj7/hlYXulM7VNDAb4YLu4gQG8ulC5kKl0NS/5jhE/2d043YJIs8rpXZce3byPOBmxE474XDZr5E+iU4pB72xb4UsvSHSsE2FMQdO9xVwBUtOu+XwpAWKTqrkz6URcNOQ1FJdtRptc9QVmZzLrlPxfGhvmQQUIip+0W3HbD1X99N2sx3+tap2kaXyg94PU6HIjuHBM8xMNLdNWDVSUId5/r4km3jdVyyX+w1d6P+IXQHR4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mO6OFTZ5nxD5vHFzqeD4bLCrqw2QCZSEpom4SACDKWo=;
 b=n2UU6ivq/iDzF2/Fh6FusfGcTbALgvhX1yQh1/ZzK4/+jkLgBxEBSKppcyvAs+WjXS7HGkMtWZzSn1r1+QwCsDet0G5wTZS2OzGmzuU5GvdRoA/NUxGYE0ZBTwo14AJs82RrlHB4O8EzznE43rpZqLvZCGO9kk4WH2lMUpycSkCmvBBxLzUrqQO27nM7pPtkNP59mh4wllCRV+0PBNTdJuYYq9X/d45NVjIGFwKI+PL6Qxn9FFo5/1zTnJd5FXWzG/pZP+r2q0R7js5rP5ye/XEbs9lna+hSODHVv3psReJqkqdlLHVh77Mg275cpCU/m3+iriMKuAZov7sX5Rd89Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mO6OFTZ5nxD5vHFzqeD4bLCrqw2QCZSEpom4SACDKWo=;
 b=Xf5zzSNWG+crj80bHvykrZFEB9vVnpNB9MegaxP4vpqDYE1N8uWraFB0zefVgImQR5fdH+3qq9LMTJrgPZosQPsWaaIJ5Nh7NyCz74uK+hl+0lE/A0V+PR9qRNLG7hjB1bEmkODtE8a+vIOocqyCncuG9A0qnJVGa9HEq7dwNLUWrrSv7vnqRVAmUorfNsfjb6fzUqLbAY2RoZrzL9sPs6mE4xosD9CV+eBdpMH/G2LJSifRlU1IF3ZMAywbab0kcKEw/G/T48epgo38ArkmIMmDyqwJRkJu90scyfrfGhwX986xrOX1NyOdnPg3w3+U0LN4QNcFFTk2qzVpk5Ni4Q==
Received: from HE1PR06MB3148.eurprd06.prod.outlook.com (2603:10a6:7:1b::19) by
 DBAPR06MB7032.eurprd06.prod.outlook.com (2603:10a6:10:1ab::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.19; Wed, 23 Mar 2022 22:17:25 +0000
Received: from HE1PR06MB3148.eurprd06.prod.outlook.com
 ([fe80::6554:406d:1be3:50dd]) by HE1PR06MB3148.eurprd06.prod.outlook.com
 ([fe80::6554:406d:1be3:50dd%6]) with mapi id 15.20.5102.018; Wed, 23 Mar 2022
 22:17:25 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: Re: getpwuid(13891) failed Failed to finalize nt token
Thread-Topic: getpwuid(13891) failed Failed to finalize nt token
Thread-Index: AQHYPv5LdU7dCTO6eUOwRvAfLDRLZazNgjMAgAAHKHk=
Date: Wed, 23 Mar 2022 22:17:25 +0000
Message-ID: <HE1PR06MB31488952C3D608E9374C7FC6EE189@HE1PR06MB3148.eurprd06.prod.outlook.com>
References: <HE1PR06MB314825C38C5FED0EFE6E2B76EE189@HE1PR06MB3148.eurprd06.prod.outlook.com>
 <be695e607739913e530fb1c8a0ccc191ea8eefe0.camel@samba.org>
In-Reply-To: <be695e607739913e530fb1c8a0ccc191ea8eefe0.camel@samba.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [FQ8XTEoTCwvCD5X+Qe6YNNlxheFDWpfI]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 16980185-b9c7-48c1-1b0b-08da0d1ae8cb
x-ms-traffictypediagnostic: DBAPR06MB7032:EE_
x-microsoft-antispam-message-info: YbZexHugD9oYogdzdpNEuM3VKNIpJgjxl9y31iHd+4PY/UYZf8dUBZ06slwxxvwxyX0sPqNbYRz1skjM+sL0qrMDa60JktGX3aUOmTinemN9FEpR6X2wTKDPMIlNpqHgrLcD1hLwSgCkfiJcM4f2q0/O5d5Esri+ik7Gs4rTTwlZW8HI6Q2LOKXVKzI2TLnCt+2heFhYs1iySp88I+rrbWW/VQjR9tOl1LFWphxDX7v1gkmWZDBkrssd4sdZb791Lga+n0E8kBC7s1/1QVOB9XYASWEm6DrnXeoWMLR3VHkVB+vFhgP5D8AIOenY+8M2D9/0UI6G31d+G4awza5Ia/U+LgnM6aOiBeLSSUNIj5I9L6t9wP2j8YDHjLThinD6PI4SwTZxyR358tnX/ZqztIE3/dvTMYxM4U5tWC9G8qQ1cCu9m+KjAoQ04+dN/3Sf0aqd2EHeGm6A/l/HkOa3qZKfapX2s+MzOnbkBZsUVvVtBriN6G65EuNgKl2B7LkrfTrCkblGxaAPlnpRQKauvFk0aqUN7iQF9NbUWrMfad8kt+7DILsdFYCJL20CI2ByYdK21cFRqXeAtuwbTnTQvQ==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?FxMxy7X+CdZJTsNfSFy2zQCtI9lqoO6o1fM+qMvs+zKDtd8FcWO9aMlWiZ?=
 =?iso-8859-1?Q?MJX/eVNjSAyNt5o3y8ucyYKooBPPNUXDDZ94wZ4Hhenvcd3hy6x8YjuKnO?=
 =?iso-8859-1?Q?ZgoaLJmpeJ5Wlyb0iTxQtjysN0f9CCFe2LRbONt0WxmIpRZ59g7SMg214c?=
 =?iso-8859-1?Q?INE1vZaTOglp/hhLqqmXAxQ3l3Vmk3yAtyhy4djn9dHRanpzmbJomAa+7B?=
 =?iso-8859-1?Q?mWZO9W2nukIUEq0dt7HOwvbxQkBj2iMpSVE5TvG3CQpbcACtJwBOIQ2qZD?=
 =?iso-8859-1?Q?JDxJR1checo1saSpRAGuVRVBFSXwmKVnfkafoSXL8nK8Ew+Vd8tsdC01P4?=
 =?iso-8859-1?Q?uYfnqjuqJDqLK3akEuHf4Ekod61wLfw+weS+4tvscGBYOaE7q/Rg9h8yWL?=
 =?iso-8859-1?Q?wiaLmht+TxnA8hfqEX2WT2wlLEpvyizYybGdU1NEefId6RUHf1POrUtVGa?=
 =?iso-8859-1?Q?Ivlac23EgLd3CzjSTbXbx10UCnojXWH+r2IG0FZ0Ww3duLEVhnciIzQU1G?=
 =?iso-8859-1?Q?CSYtLzlRB1Ty+RI/dUeQzskRfTiSv+iUijmcfwXMXH3j9K6hxNIUwgJ2FE?=
 =?iso-8859-1?Q?/zFBl9c9CdkI3s2j828UxOhGwdJE2x9TU1rbzYsp7yAeVN9ozlTVWA8xqg?=
 =?iso-8859-1?Q?fAZkp51+9TAUKjPe9ESuk0oQQXOsSru5IdbD4zXA+iWV7GmFSVm/U3fsc3?=
 =?iso-8859-1?Q?zudpr/gqFOB7F2Pp5gGGhNrJqTsv66F5JGfOrLrazEzUm1tH8XNKCESYzk?=
 =?iso-8859-1?Q?iAUXEXhPoioJadQN+DmVeY1gOqFvCTtk5kMokoJuCIrSPKx9iXqNxdqrQg?=
 =?iso-8859-1?Q?LtDarls39Xq2fhwLwHCyqhEPubmUDUN9VAjdbEi7JnjXnTUtwnzxsxQYej?=
 =?iso-8859-1?Q?2NtbwvXdNNuZeeZSWRvXm5QfXrsaHUcXfhu5ghpaEO5olTm6Z4deFNsxSX?=
 =?iso-8859-1?Q?NphJd5ezkG7kzRwr2BArBoauaC2t7xAEbDfwj5pJoj51yQrVCu7iTDkcYY?=
 =?iso-8859-1?Q?OEYOidJpqXF5yTAzPQ1f1pZC9faXJOCXbnI2EOgDmmUlqo36cMiKngVFz+?=
 =?iso-8859-1?Q?qYe5EtqBw0FQuO1hAT99lxTYQcNF02h91u/qV0dLrXpjz7YcaoHnkB/z08?=
 =?iso-8859-1?Q?+d5cqZuz+BIMxWcBh8hcD0vJVZZVlHNeypOLE0/rlYbDq6jZu5F9cE6WtY?=
 =?iso-8859-1?Q?4OZVFPArejdmbQ=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-6e454.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR06MB3148.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 16980185-b9c7-48c1-1b0b-08da0d1ae8cb
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR06MB7032
X-Warn: EHLO/HELO not verified: Remote host 2a01:111:f400:fe0a::81d
 (mail-db5eur03olkn081d.outbound.protection.outlook.com) incorrectly presented
 itself as EUR03-DB5-obe.outbound.protection.outlook.com
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

Hi!

We have plane to upgrade but it will take some time and we have to fix this=
 Samba quickly.
Here is the smb.conf
[global]
workgroup =3D NUTI.ME
server string =3D %h server
dns proxy =3D no
log level =3D 3
log file =3D /var/log/samba/log.%m
max log size =3D 1000
logging =3D syslog
panic action =3D /usr/share/samba/panic-action %d
encrypt passwords =3D true
passdb backend =3D tdbsam
obey pam restrictions =3D no
unix password sync =3D no
passwd program =3D /usr/bin/passwd %u
passwd chat =3D *Enter\snew\s*\spassword:* %n\n *Retype\snew\s*\spassword:*=
 %n\n *password\supdated\ssuccessfully* .
pam password change =3D yes
socket options =3D TCP_NODELAY IPTOS_LOWDELAY
guest account =3D nobody
load printers =3D no
disable spoolss =3D yes
printing =3D bsd
printcap name =3D /dev/null
unix extensions =3D yes
wide links =3D no
create mask =3D 0777
directory mask =3D 0777
use sendfile =3D yes
aio read size =3D 16384
aio write size =3D 16384
local master =3D no
time server =3D no
wins support =3D no
wins server =3D 192.168.1.30
netbios name =3D SAMBASERVER1
netbios aliases =3D SMBSERVER1
interfaces =3D 192.168.1.10
security =3D ADS
realm =3D TP.NUTI.LOCAL
auth methods =3D winbind
winbind use default domain =3D Yes
idmap config * : backend        =3D tdb
idmap config * : range          =3D 1000000-1999999
idmap config NUTI.ME : backend     =3D rid
idmap config NUTI.ME : range       =3D 10000 - 49999
invalid users =3D root
#=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Shar=
e Definitions =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
#=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Home=
 Directories =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
[homes]
comment =3D Home directories
browseable =3D no
writable =3D yes
create mask =3D 0600
force create mode =3D 0600
directory mask =3D 0700
force directory mode =3D 0700
valid users =3D %S
hide special files =3D yes
follow symlinks =3D yes
vfs objects =3D

________________________________
From: samba-technical <samba-technical-bounces@lists.samba.org> on behalf o=
f Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Sent: Wednesday, March 23, 2022 9:51 PM
To: samba-technical@lists.samba.org <samba-technical@lists.samba.org>
Cc: Rowland Penny <rpenny@samba.org>
Subject: Re: getpwuid(13891) failed Failed to finalize nt token

On Wed, 2022-03-23 at 21:41 +0000, capricorn cap via samba-technical
wrote:
> Hi!
> I have joined  4.5.16-Debian to AD.
> sudo net ads testjoin
> Join is OK
> getent passwd works
> getent group works
>
> But When I try to browse from windows computer then I get popup to
> enter username and password.
> Below is the log message.
>
> Kerberos ticket principal name is [xyz@TP.NUTI.LOCAL]
> SID S-1-5-21-774976744-1476728229-930774774-3891 -> getpwuid(13891)
> failed
> Failed to map kerberos pac to server info (NT_STATUS_UNSUCCESSFUL)
>
> Can anyone help me that what can be the solution to fix this issue.
>
> Thanks

Is there some reason why you are still using Debian Stretch ?

Please post your smb.conf

Rowland




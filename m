Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5772D64E9
	for <lists+samba-technical@lfdr.de>; Thu, 10 Dec 2020 19:28:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=UUX125J9FzXoOtTvf1F09AY4YEzNPYjhYWxSFQXnSys=; b=D32bKNndkNsFFtoS8iHj+gnmDA
	CLS1KNeP3cWmXr3+keYZ2pJ9HagpS0viJ6hcFXgOnDNwbs9hVzWjMkmLfmFCrVs8FspjbIZk9+liT
	EdxleYuerXBVJRfPahSZOd+8AZG41JlpaBIxY9qJjGjwrEzaHV07pzwIfuEmQsQ5BpM0tC6/4BrdO
	YcfJLWfxL3PyzJ0IZfYCssjWuY9NSUMApdA5Vc34ZGJs/WRAUzQBCy8lnOnr9BPp6mXLrMZnHeWye
	Uev3ZoBaZqhjBtojG1hLyDgtcb3i++GRz3MfBgzQH5LlUvkJSwJmSVIsLyjDl21hREZZ/fAC8Qvg9
	OYHRvlew==;
Received: from ip6-localhost ([::1]:49202 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1knQfb-000RSV-GF; Thu, 10 Dec 2020 18:28:03 +0000
Received: from mail-mw2nam10on2075.outbound.protection.outlook.com
 ([40.107.94.75]:55521 helo=NAM10-MW2-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1knQfV-000RSM-TD
 for samba-technical@lists.samba.org; Thu, 10 Dec 2020 18:28:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jvnaJBt1/SkNkxECOZPQ8IxXwIpjW3jDrTABLoOOm3OutLoezF+W2sPw4zSSXOIH2xeuV8Z6ul8WSDXgaGAUJIuPercERRS1IZ6NfqiSPIC8LS1OBb9JRd2DIXgAKYHjo4n1V3ocQ6mfgB+4bapkBqT/oXWM159u2Ns69qgZIYbrA93o6cDvwcciIKbRIBghLo8LR0krzLCFfRkvFG+owjuQExRDvo2BaC8rvFCM9qE6g1Z+oxWvV5O5Z2yXq3L/l049zZXTfmoPqqzWtbuD5Hc7FlZ3Kk7GWI69g3FkBnliSTYi7QjMPCrXnswuYP/myZTNWLo//pf5ixaBtv7qfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UUX125J9FzXoOtTvf1F09AY4YEzNPYjhYWxSFQXnSys=;
 b=EGkhxtzraJAJBAzgY0K7kIaYKl8laf/2yJM8rv+L9/bRkIfm6wmK99UnLUWlZc3h/E+4+RmQ8uXjWUaZz3rf77lxa9ZS+BXDtmiNOQJSLOf7MuuWuOXskymEwm3HWbgzo335Bs/s2t6rABKyn6Mz/osNOMCIeYpQJd4QrVTeNi9CEV/V/pu5ZpotTqJaQoruI6/SWhYmXD8HS0YZfybMMm8U5m/SiVU44MORqZ/DFIqJkNqYd0kY6ysx8Sjks22A6cZO53hj8tF3ZYypHhvChY2FQ+bqrqMtXi00ofHueXEh0AtiXzqBOnDvhUTkyNAmmnWaGIZI/xrEPgMoUU3E0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=komprise.com; dmarc=pass action=none header.from=komprise.com;
 dkim=pass header.d=komprise.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=komprise.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UUX125J9FzXoOtTvf1F09AY4YEzNPYjhYWxSFQXnSys=;
 b=o1CDsheNE52h2A0VgQ/u+X7ybKnqqScdgVq4fYK9j06vCRyIrmYN9LGBQGplesQqcL3lzAVG+H0TAutjN7q1TobaVOaKuiHqFz2QSFqRrxzQIUpx5pC8lBceje7fn+w41WgWij4n54RVnf6SQ53wqOyfFXLqrdUkM3+Ts0MOnvA=
Received: from BYAPR16MB2615.namprd16.prod.outlook.com (2603:10b6:a03:8f::17)
 by BY5PR16MB3047.namprd16.prod.outlook.com (2603:10b6:a03:183::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Thu, 10 Dec
 2020 18:27:33 +0000
Received: from BYAPR16MB2615.namprd16.prod.outlook.com
 ([fe80::116d:161c:4a50:e9bc]) by BYAPR16MB2615.namprd16.prod.outlook.com
 ([fe80::116d:161c:4a50:e9bc%6]) with mapi id 15.20.3632.021; Thu, 10 Dec 2020
 18:27:33 +0000
To: Steve French <smfrench@gmail.com>
Subject: Re: Merge commits to v4.19 from 4.20 & 5.6 for cifs Backup intent
 flag fixes
Thread-Topic: Merge commits to v4.19 from 4.20 & 5.6 for cifs Backup intent
 flag fixes
Thread-Index: AQHWzmgYMv71PfRbMkOvwLnCUG85Qqnwj0KAgAAXeQM=
Date: Thu, 10 Dec 2020 18:27:33 +0000
Message-ID: <BYAPR16MB26152139C1FB73AEE9119B80E2CB0@BYAPR16MB2615.namprd16.prod.outlook.com>
References: <BYAPR16MB26159527465394F378EB16FDE2CC0@BYAPR16MB2615.namprd16.prod.outlook.com>,
 <CAH2r5mtZo68cjRFOXPxET2D2yr+J8xbAoNto0zx06b1uRwxX4g@mail.gmail.com>
In-Reply-To: <CAH2r5mtZo68cjRFOXPxET2D2yr+J8xbAoNto0zx06b1uRwxX4g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=komprise.com;
x-originating-ip: [24.5.2.128]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9aa0e1a5-2a96-4933-e13b-08d89d394334
x-ms-traffictypediagnostic: BY5PR16MB3047:
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KoJRWLggOT24IG28tHoCDf5QPrS1HoRjeTdpCA9kQNab1eyis3N4Nfkh1H+wzSn9h0i3lNaXzuU/Edlv3r929zjbngMIfZOb4ygpLeAM/LNCDcyVTG64z4gDEU6cOQI5AXJGhsXMbR3Vsqyngt6RmeO+u2W0dBvbmzkb7Bl5iokWRizPOt0JOj+QBFpxok3YnjLgMpoBxmVjUkIJpo2MNVeL2nZASWA+3KRKSo5Pwq7taWeihTLUQaGN2UnRAQ5D4P9kSkJFfTnqfX0K2Uzjpp8c2a2Z3bX2VpGG7mhNJgjXxscUhWGO349mcDRz56P3MDAh3YlXGog0epI+rCSmX3Ip07vRMOr5EKHd+q2hzaf2QjqE8cU8BisKUbvzXyy/Jsi4k4GbL8TC1WNPtmymWg==
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?D6buGC91c9T2Gshk78zDJb7bE762AslGkDVvJP5e+VcCPX1ejKKOYZBKJq?=
 =?iso-8859-1?Q?iqk5IsiCyrjkCaR0OST6okQfGttoyOzjE8/hc9jAGBFnIquGAdbatiBkw6?=
 =?iso-8859-1?Q?3P8+5kqu/p3zvULAO1kpYybBPNmmugiSzJOa730Lj4ui96nReunwupuSXa?=
 =?iso-8859-1?Q?iSJIoJU1sANr4eCfX7ade2dPWEVjnLIDwWimE6PxU8BtweweP3mf0aUMOV?=
 =?iso-8859-1?Q?m52OTNpeG24tg5UC4YvJhbXG5B9ZNR7AB07ygtFwmt5ch3ivL/YTy0nZqa?=
 =?iso-8859-1?Q?ZNPUZtF4sqhDRWGUISAhq0auTAiWCHyQWfVaROO43fx2EzcxH0FVeM9GZt?=
 =?iso-8859-1?Q?668BEXKbpNtd+mIFHLC/8IJDBlJ5JK7M+60mIbocLpqz9kJaQfR8Y8MBOi?=
 =?iso-8859-1?Q?uUQ15KZwruDskAAC6q1wJu16bXDNY3UzJDqZ3+bC9EqqNafhhw77UV3XiE?=
 =?iso-8859-1?Q?4T+npjU61ic6SZhOwZJJ+2nHYlMBCbD73QOgT8syee7holntapFoIOekho?=
 =?iso-8859-1?Q?SdCEgVKUQLSaqkmNwL6O6dUtWv8jx1MjbfBSp53ZgkXv2dL3g52FzMEKFu?=
 =?iso-8859-1?Q?+3bCDycqPhjKuKiW8TBany6IjkdEZSuEq5ecwtVR4JxKNaP0/C2rUr08fD?=
 =?iso-8859-1?Q?mlI7Ny7nAxfipvygvnPkYmfirY3DBP5K8QA/1VggYsDQLvoAekE3ODWAaL?=
 =?iso-8859-1?Q?bI2MvUysnago3P/6WfE3m9FMlNRw19roRBd/NAydbRJrd1UKAX9SbyEf3e?=
 =?iso-8859-1?Q?RxdYWN1LOV3nPWDA6XaAUKDv4Xs/pWfM3+UrgKX+YHaCUFMWC0WqKpFzPX?=
 =?iso-8859-1?Q?sNSYHPkrXir2T/CL7OI0Mx8J6CxsoPuCWbnkhuUdJ1XTq3+Id86J/XzGzo?=
 =?iso-8859-1?Q?iUsFIzziBk6En4m/46hPcGQ8muSpBgtQLZdCdIjt9TMQjyQ5FaTrpny+2o?=
 =?iso-8859-1?Q?PwfV9Icx5n14sK/DBBP7ZMgeBxtVuSKEK5XodJ6TVtZkdMaINaPKRfk2ZC?=
 =?iso-8859-1?Q?sAlfQtfjmULWGmA/Y=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: komprise.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR16MB2615.namprd16.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aa0e1a5-2a96-4933-e13b-08d89d394334
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a5a9d78-0afb-4c20-b729-756d332680db
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2qPVqtmFjjp8FIv+eLi3YsEllYkQzbSAX330MxAuT1SZrHHkafnli5MGaExDz5jp7O5e/g1Y/eHWg7/RsZzNhQpk3Jtu1lo3CuiJgMonbGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR16MB3047
X-Warn: EHLO/HELO not verified: Remote host 40.107.94.75
 (mail-mw2nam10on2075.outbound.protection.outlook.com) incorrectly presented
 itself as NAM10-MW2-obe.outbound.protection.outlook.com
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
From: Vidhesh Ramesh via samba-technical <samba-technical@lists.samba.org>
Reply-To: Vidhesh Ramesh <vidhesh.ramesh@komprise.com>
Cc: Steve French <sfrench@samba.org>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 Chris Dearden <chris.dearden@komprise.com>,
 Nahush Bhanage <nahush.bhanage@komprise.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thanks Steve.=0A=
=0A=
We are not using any distro and building our onprem VM ovas with Centos 7.8=
 and kernel 4.19 (4.19.134). We did try the latest kernel of LTS 4.19 kerne=
l build 160 and still see that the backup intent is not being sent for some=
 of the calls. However, on kernel 5.4 we see the same working as expected.=
=0A=
=0A=
We are currently planning to stay on kernel 4.19 as it is stable and LTS re=
lease & hence wanted to see if the fixes could be backported to kernel 4.19=
.=0A=
=0A=
We see #1 in 4.19 and #1,#2,#3 in 5.4. Since its working with 5.4 and not w=
ith 4.19 was wondering if #2 and #3 are not in 4.19 and hence if it could b=
e backported ?=0A=
=0A=
1.=A0https://github.com/torvalds/linux/commit/5e19697b56a64004e2d0ff1bb952e=
a05493c088f=A0- v4.19.rc1=0A=
2.=A0https://github.com/torvalds/linux/commit/61351d6d54e651ec4098445afa5dd=
c2092c4741a=A0- v4.20.rc1=0A=
3.=A0https://github.com/torvalds/linux/commit/4d5bdf28690a304e089ce750efc8b=
7dd718945c7=A0- v4.20.rc1=0A=
4.=A0https://github.com/torvalds/linux/commit/0f060936e490c6279dfe773d75d52=
6d3d3d77111=A0- v5.6-rc1=0A=
=0A=
Vidhesh Ramesh=0A=
=0A=
From: Steve French <smfrench@gmail.com>=0A=
Sent: Thursday, December 10, 2020 9:01 AM=0A=
To: Vidhesh Ramesh <vidhesh.ramesh@komprise.com>=0A=
Cc: Steve French <sfrench@samba.org>; linux-cifs@vger.kernel.org <linux-cif=
s@vger.kernel.org>; samba-technical@lists.samba.org <samba-technical@lists.=
samba.org>; Nahush Bhanage <nahush.bhanage@komprise.com>; Chris Dearden <ch=
ris.dearden@komprise.com>=0A=
Subject: Re: Merge commits to v4.19 from 4.20 & 5.6 for cifs Backup intent =
flag fixes =0A=
=A0=0A=
You may want to contact the guys that package your custom distro.=0A=
Since some of those patches are marked for stable they would be=0A=
automatically backported but I don't know who provides your custom=0A=
kernel.=A0=A0 AFAIK these are likely to be backported already by Redhat so=
=0A=
if you are using CentOS 8.2 or RHEL8.2 there is a good chance that=0A=
these are already in.=0A=
=0A=
On Wed, Dec 9, 2020 at 2:18 PM Vidhesh Ramesh=0A=
<vidhesh.ramesh@komprise.com> wrote:=0A=
>=0A=
> Hi Steve,=0A=
>=0A=
> We mount cifs shares on our centos machines running kernel v4.19 using ba=
ckupoperator privileges using backupid, however we do not see that the back=
up intent is used for all calls. We did find fixes for them in 4.20 & 5.6 b=
ut not in 4.19. Would it be able to merge these commits to 4.19 as well ?=
=0A=
>=0A=
> Here are the commits of interest.=0A=
> 1. https://github.com/torvalds/linux/commit/5e19697b56a64004e2d0ff1bb952e=
a05493c088f - v4.19.rc1=0A=
> 2. https://github.com/torvalds/linux/commit/61351d6d54e651ec4098445afa5dd=
c2092c4741a - v4.20.rc1=0A=
> 3. https://github.com/torvalds/linux/commit/4d5bdf28690a304e089ce750efc8b=
7dd718945c7 - v4.20.rc1=0A=
> 4. https://github.com/torvalds/linux/commit/0f060936e490c6279dfe773d75d52=
6d3d3d77111 - v5.6-rc1=0A=
>=0A=
> Vidhesh Ramesh=0A=
=0A=
=0A=
=0A=
-- =0A=
Thanks,=0A=
=0A=
Steve=


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E11D41C1D36
	for <lists+samba-technical@lfdr.de>; Fri,  1 May 2020 20:31:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=+wny+a4iYGTMvbwkTHYH3gIAcC/zWcC8obOqC0IdOMA=; b=l7c9MKi61TOKeYDrzR9q96cPyO
	8i4s1PspaKRqJgFwIgSizWqcngfv27R/AkNh0s1iswvjlzHYTF5RlqLBoH5uUo9wPtVhhkKZGMQQB
	tBTzqZfZHjDDpbubvsF+vBwChdGRRW9EhDbFnWozAMirWxBKcxgGozis2i0Vt3ldbCORMjHj7NYAK
	bHsdY370hh/7tAFcCPKi745+9BaGkroSY1N6ZmGYyYSnysveAkJ+IhbbDxCbIcADuJgnKHOlvhVzA
	xjbFtexqMXdYH+sULXfKg9DzbcJX6rNnavWLTWGgYk374uyHK0myIMGmj0MkSYcsdLjDba6QQWi56
	0WHXvH6w==;
Received: from localhost ([::1]:25138 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jUaRL-002Dla-UR; Fri, 01 May 2020 18:31:12 +0000
Received: from mail-co1nam11on20605.outbound.protection.outlook.com
 ([2a01:111:f400:7eab::605]:6241
 helo=NAM11-CO1-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jUaRE-002DlS-2J
 for samba-technical@lists.samba.org; Fri, 01 May 2020 18:31:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pj4I1VTI/RCwk7kEt2RvrybACOo7AeL8UQKRYTGct37ydIH4KRqW7Ji+h6WiYu2cLgYhNgBrPmis6tz1DeEiZYod8VLq8YqtTg1rgEBnxFMTb7IsyTnjPNoLUXw0UGtnFFlXhTAnUAnRO8RtAR2jW+/HO2wsWR+9+cNgOZW0YuTi9jrjxPdQPt3l8PtbO3n8fxA7lRyunqHOaZaQ0rl5PVoZRsu0qXvD3h9ogX7LM43mIGoNmlF1kzZgddoaWEp9k2OFd3kmyyBVLVKq/dfS5bxs0Fuf07S5m/HwzQF/0IzZJiExQheOkY2+HRCOeiVcY2K3ysYSTlLnsjgizyZ73A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wny+a4iYGTMvbwkTHYH3gIAcC/zWcC8obOqC0IdOMA=;
 b=XG94KbiSlFwpmlc6DEZYwo+wpgLQ2GfvOai+fS2e3rrPp2EGrHB2U3Wj6G3BL551XSb7SPZqd/5Xndl3W4HqtQFUvRsR3QvaIs1IPHkTAcgbjYIZ6Pl4S48ZMhASQeh78enIa77jdeyubyLsKyvKktK7ouXWUO8/qFj9XbWgZOdjkJgX8VETvkE6gL+sAcZ61EBOuCvV8mIxNCqW9o3Er8zjV4x2y2TkFxRn7+iBDAmOwbym5/ayKO441fwMm4KghImlhJ/hc66nFBMVGEvRtZwIKC07lTUqWONSfIcci5wdlPaxS71Yt1uLKBZ4Sbu3uD/IPKUfYwVlKseiNXvTVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nasuni.com; dmarc=pass action=none header.from=nasuni.com;
 dkim=pass header.d=nasuni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nasuni.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wny+a4iYGTMvbwkTHYH3gIAcC/zWcC8obOqC0IdOMA=;
 b=UZGeK8dUwNPa9FRbZr6rxgKjCsyvx5yhxdWTCf0EZN57AfCKRT0Fr/duYJqoBamdJHZ8KwXqooanBBCGpP6sfLJF7uG+EIqrKz5xAnyD5PIw8QCcv9L5hLdeoVvwqO+g5XChFm6WmDZcsWvWgYkZyWjON7Co33UbKaYbZkDjL7/PkEbKfdUVme2cItYzH7U1ZW/om8NYVOqZOsfXq4mUIFPpNTIlyBMzseMMEMJ/AP6HyGARHfu0lHss6Gl3nK3EGALfkqzUVNk4HYLlsI79vavBnZFCEOLQFArJD8G7fkmYhslMAhO8Ya5vAQX7BlUy7oEC+WxSJpC6PzSXeB0b+w==
Received: from BN7PR07MB4402.namprd07.prod.outlook.com (2603:10b6:406:b0::10)
 by BN7PR07MB5073.namprd07.prod.outlook.com (2603:10b6:408:2b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Fri, 1 May
 2020 18:30:48 +0000
Received: from BN7PR07MB4402.namprd07.prod.outlook.com
 ([fe80::3993:bf44:ef2c:2c3a]) by BN7PR07MB4402.namprd07.prod.outlook.com
 ([fe80::3993:bf44:ef2c:2c3a%7]) with mapi id 15.20.2937.026; Fri, 1 May 2020
 18:30:48 +0000
To: Jeremy Allison <jra@samba.org>, "samba-technical@lists.samba.org"
 <samba-technical@lists.samba.org>
Subject: RE: [EXTERNAL] Re: Windows 10 client opens a folder as a file and
 asks for SMB2 GetInfo SMB2_FILE_STREAM_INFO
Thread-Topic: [EXTERNAL] Re: Windows 10 client opens a folder as a file and
 asks for SMB2 GetInfo SMB2_FILE_STREAM_INFO
Thread-Index: AdYfzMNTD1cVwy/fSQSYgUoo68/8vAAFVqkAAAAiRgAAAFxgwA==
Date: Fri, 1 May 2020 18:30:48 +0000
Message-ID: <BN7PR07MB44024B8600FDF859C55E405FCFAB0@BN7PR07MB4402.namprd07.prod.outlook.com>
References: <BN7PR07MB44024AA885AAD1881F852A40CFAB0@BN7PR07MB4402.namprd07.prod.outlook.com>
 <20200501175828.GC29166@jeremy-acer> <20200501180218.GD29166@jeremy-acer>
In-Reply-To: <20200501180218.GD29166@jeremy-acer>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: samba.org; dkim=none (message not signed)
 header.d=none;samba.org; dmarc=none action=none header.from=nasuni.com;
x-originating-ip: [99.10.94.169]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 96390083-eef7-428e-60fd-08d7edfdc4f9
x-ms-traffictypediagnostic: BN7PR07MB5073:
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ydI6Z3FyOcpdzs5XVSHmoDltVYIlcTEDmQZ1qB1CVKYI4+XPN9/29uaTuHQ3rngYp35SCE5WSzOLYYORpK61EyUrxe/uhPFyAELHwh/MH91jXdf4y2NeluQWjMKChL2DsC7scOGjPdyd66Ql8KFOQ7nhyTTMRytWWRXkDVMky65nJmvqN3Bi7ug97rGDpWpMYPXCFnWbCHiwmJ1xGQ/oZlaQw3tg8r7kD3KxVTEApK45jQq1qRRcUZN5ufOyKwdaJZyaGJAormkA/DLFshho7JZw2WleOUnUpMg68to4xyvk27HuP6hEnXlW+uh2CnYHedsDBlPC/IbF2XTO4c4iE3rziruXtjYE6G3AVQAugdxngwETAMJd5IFIrXaSZ0rRy7rl3a5N3J+Lh48X6ySxAB4hX45HPBQPz+34cVK2GF7HCCgMmEOaIPj2fUyAd6H0
x-ms-exchange-antispam-messagedata: HG2vnQ5nB+GwgiF6DfS07s19j2CLwP8GoM2HKrDAW/pKkqfyt6zADhyLm210AAROE4T1+USbThVmPYKYGS1GNHF++1CywiaznmM0tJVAkcpMdmOZeiCvOC1OxPTUG8LWXIBhgYcz+FYGDdHaad2P7rnINaM2Z/9q2S4AamVnbEhN6n/VDdqoOyh2YDHZX+wrxWahlVpxZcy5ny62qmPhs1rj624HJm1Fa/gRz2UglO/A3lj8b8nlGDyOtZlVUWdELvGTfa8ns96TAJwOTqYL2oDVPFpU++oIuR8qxIIs7wW7WgvB9LsYsPCOtY20W1G31FZUBPldqrCNmGe/pyzJTm/tNJn4HXJkhQa7IbdpAJCnFfmoejvoGoEb0lEY5JXTW04S3JAj55XdBAea5qk8j2wVhh3T4YpAyzM1h1xHB8n7NDA6KcF+OKN0bFpcX7FpmGPI0sUHJgz88qL+JstCH8nwd2U/SNABZIBHMg0dg/uKFVfxFoElzAlDsXWqQlWCKtFdz/CkXyW2OC4nbpWJze98Ju0QkZk48xh3rwq/3XAycdB7N0V8PE3j98VkGLcVNtWdeqrU8mVruStQKolguJ1ytq8pVk+7GrhrQVnaO19QDhSsO5makqIj1MFQDi6gB6abN7/ycT7rEsWR6sEWsnMJdydCu+TXZSYextT9ub7kpvPXQOjnyV1O347j6qbk7BKX0OAQe5JwDIcxTERmf5DHqM4UAtAkH8JSoSE0W4B1FBcOagSOt8wvIQyw/Fa0J/TKYL/SrXBSRWk1qcNPMHftX995bOub5ukTN4/6kaM=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nasuni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96390083-eef7-428e-60fd-08d7edfdc4f9
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 146173a2-cdda-476f-b6d5-a48c6e6dd0c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fOMV5DAhPHQb7O7CCf1PZkCnl7YNGhsJN+kV8T5aEKy6+g0O2I3ESAzQkeVj4SHN1mLWqAUHlvQ6UXinG2xs/pqUE+sk3fVviFvXAzgGMmY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR07MB5073
X-Warn: EHLO/HELO not verified: Remote host 2a01:111:f400:7eab::605
 (mail-co1nam11on20605.outbound.protection.outlook.com) incorrectly presented
 itself as NAM11-CO1-obe.outbound.protection.outlook.com
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
From: Ashok Ramakrishnan via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ashok Ramakrishnan <aramakrishnan@nasuni.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thanks Jeremy for the tip. Our customer is able to reproduce this readily. =
So, I can try potential patches. One interesting observation I have since y=
ou pointed out the Reparse Point bit... The previous getinfo command was fi=
le network open info. And we (samba) responding with this for the folder...

SMB2_FILE_NETWORK_OPEN_INFO
    Created: Nov  6, 2015 20:22:26.658586900 Eastern Standard Time
    Last Access: Nov  6, 2015 20:22:26.659295100 Eastern Standard Time
    Last Write: Nov  6, 2015 20:22:36.530589900 Eastern Standard Time
    Change: Nov  6, 2015 20:22:36.530589900 Eastern Standard Time
    Allocation Size: 0
    End Of File: 0
    File Attributes: 0x00000010
        .... .... .... .... .... .... .... ...0 =3D Read Only: NOT read onl=
y
        .... .... .... .... .... .... .... ..0. =3D Hidden: NOT hidden
        .... .... .... .... .... .... .... .0.. =3D System: NOT a system fi=
le/dir
        .... .... .... .... .... .... .... 0... =3D Volume ID: NOT a volume=
 ID
        .... .... .... .... .... .... ...1 .... =3D Directory: DIRECTORY
        .... .... .... .... .... .... ..0. .... =3D Archive: Has NOT been m=
odified since last archive
        .... .... .... .... .... .... .0.. .... =3D Device: NOT a device
        .... .... .... .... .... .... 0... .... =3D Normal: Has some attrib=
ute set
        .... .... .... .... .... ...0 .... .... =3D Temporary: NOT a tempor=
ary file
        .... .... .... .... .... ..0. .... .... =3D Sparse: NOT a sparse fi=
le
        .... .... .... .... .... .0.. .... .... =3D Reparse Point: Does NOT=
 have an associated reparse point
        .... .... .... .... .... 0... .... .... =3D Compressed: Uncompresse=
d
        .... .... .... .... ...0 .... .... .... =3D Offline: Online
        .... .... .... .... ..0. .... .... .... =3D Content Indexed: NOT co=
ntent indexed
        .... .... .... .... .0.. .... .... .... =3D Encrypted: This is NOT =
an encrypted file
    Reserved: 00000000

We specifically said that it IS a Directory and NOT a reparse point. But th=
e client still decided to send us a 0x00200020 in the subsequent open of th=
e file. I can play with the response and see if I can get the client to beh=
ave differently...

Thanks,

-----Original Message-----
From: Jeremy Allison <jra@samba.org>
Sent: Friday, May 1, 2020 2:02 PM
To: Ashok Ramakrishnan <aramakrishnan@nasuni.com>; samba-technical@lists.sa=
mba.org
Subject: [EXTERNAL] Re: Windows 10 client opens a folder as a file and asks=
 for SMB2 GetInfo SMB2_FILE_STREAM_INFO

On Fri, May 01, 2020 at 10:58:28AM -0700, Jeremy Allison via samba-technica=
l wrote:
> On Fri, May 01, 2020 at 03:55:49PM +0000, Ashok Ramakrishnan via samba-te=
chnical wrote:
> > Hi:
> > We use 4.9.4 based samba in our product and one of our customers is run=
ning into a strange issue. If they right click on a folder and get the prop=
erties, it reports incorrect size information. When we looked at the networ=
k trace, we see that the client is walking the tree and getting information=
 about files and folders.. Suddenly out of the blue, it opens a folder (whi=
ch it had previous opened and closed as a directory) as a file (Create Opti=
ons 0x00200020) and then issues a getino file stream info call. Samba promp=
tly responds to this with NO_DATA since there is no stream associated with =
this folder. After this, things go downhill.. The client starts requesting =
files with paths without the above folder in the path and rightly gets STAT=
US_OBJECT_NAME_NOT_FOUND. We have requested our customer to open a support =
case with Microsoft to help understand the reason for the client behavior..=
. But hoping someone here has had experience troubleshooting similar issues=
 and can provide some tips/pointers on what to look for. I am primarily try=
ing to figure out what could prompt the client to open a folder it knows is=
 a folder, as a file and ask for the stream info. I have looked through the=
 file ID, QFid, etc for any duplication and could not find any. So, why wou=
ld the client do this? And it does not do this for 99% of the folders in th=
e tree.. Just for a few...
> >
> > Thanks!
> >
> >
> > -----------
> > Frame showing the path being opened as a directory...
> >
> > Frame 65257: 706 bytes on wire (5648 bits), 706 bytes captured (5648
> > bits) on interface \Device\NPF_{B68E32C7-33A6-49BB-BD17-84680A37AE6E}, =
id 0 ...
> >
> > Then the client does a SMB2_FIND_ID_BOTH_DIRECTORY_INFO to list the con=
tents of the directory...followed by this...It opens the same path without =
explicitly asking to open a directory (Neither 0x20 not 0x40 is set in the =
Create Options).
> >
> > ----------------
> > Frame 65263: 682 bytes on wire (5456 bits), 682 bytes captured (5456
> > bits) on interface \Device\NPF_{B68E32C7-33A6-49BB-BD17-84680A37AE6E}, =
id 0 ...
> > Transmission Control Protocol, Src Port: 63880, Dst Port: 445, Seq:
> > 5539052, Ack: 5900825, Len: 628 NetBIOS Session Service
> > SMB2 (Server Message Block Protocol version 2)
> >     SMB2 Header
> >         ProtocolId: 0xfe534d42
> >         Header Length: 64
> >         Credit Charge: 1
> >         Channel Sequence: 0
> >         Reserved: 0000
> >         Command: Create (5)
> >         Credits requested: 0
> >         Flags: 0x00000010, Priority
> >         Chain Offset: 0x00000208
> >         Message ID: Unknown (65656)
> >         Process Id: 0x0000feff
> >         Tree Id: 0x12c24d77
> >         Session Id: 0x00000000771ae25b
> >         Signature: 00000000000000000000000000000000
> >         [Response in: 65264]
> >     Create Request (0x05)
> >         StructureSize: 0x0039
> >         Oplock: No oplock (0x00)
> >         Impersonation level: Impersonation (2)
> >         Create Flags: 0x0000000000000000
> >         Reserved: 0000000000000000
> >         Access Mask: 0x00100080
> >         File Attributes: 0x00000080
> >         Share Access: 0x00000007, Read, Write, Delete
> >         Disposition: Open (if file exists open it, else fail) (1)
> >         Create Options: 0x00200020
>
> This is the key field. It's asking for a reparse point:
>
> FILE_OPEN_REPARSE_POINT 0x00200000
>
> which we're just ignoring. We probably shouldn't.

Or maybe we should :-). MS-SMB2 states:

FILE_OPEN_REPARSE_POINT
0x00200000 If the file or directory being opened is a reparse point, open t=
he reparse point itself rather than the target that the reparse point refer=
ences.

which implies that if it's not a reparse point we should just open the unde=
rlying object, not fail it (which we do).

torture tests against Windows10 needed here I think.
This e-mail message and all attachments transmitted with it may contain pri=
vileged and/or confidential information intended solely for the use of the =
addressee(s). If the reader of this message is not the intended recipient, =
you are hereby notified that any reading, dissemination, distribution, copy=
ing, forwarding or other use of this message or its attachments is strictly=
 prohibited. If you have received this message in error, please notify the =
sender immediately and delete this message, all attachments and all copies =
and backups thereof.


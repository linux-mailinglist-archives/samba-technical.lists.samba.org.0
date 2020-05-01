Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DB21C1C53
	for <lists+samba-technical@lfdr.de>; Fri,  1 May 2020 19:54:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=ecZsXhoIQavIAm4Ilot+2nurbSCEhTnwgzpGA58elTI=; b=Ak71IPDvNPN4LDpNeiLhG4IEpB
	INDDpmA3S5Oslctt+e/DEOuSeqybHPecyCqbayZGVaABxCJQH2x0gCpVfGh+Nt0gvm8VCWCgLusK4
	D+dqMy/3HN2U8zO6MPyxpYpNat8AJsVMd1B48XrLNEOaxmzA8FKTuX44l3LgT4TQEMMc5F8g9NaU1
	jbDuV8kviw6FYv/6fn55QYfqVvKHXHz/nEo4UR3LRPn6ut03AAxO4r2FEISSaIjyFfJATGZkhEciw
	r2eLQM9fZa3mJsCImnsk9qkRujXz7tub5Yy9S318Td+0IfaSQ7Me+khNQUnXrAmtI/bN1cdxE6jfw
	Aa4yEOAw==;
Received: from localhost ([::1]:19064 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jUZr7-002CvX-KK; Fri, 01 May 2020 17:53:45 +0000
Received: from mail-mw2nam10on20600.outbound.protection.outlook.com
 ([2a01:111:f400:7e89::600]:6193
 helo=NAM10-MW2-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jUZqz-002CvQ-Vf
 for samba-technical@lists.samba.org; Fri, 01 May 2020 17:53:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mIhfxCI3Z1qdcrHHtNzgtW++DBJBL7DB9LHT7wk1iqwj16t6PjH+g9/pe182o+214iVBfte7jyHWUGvUBXKG/GE+U20MdyVjVMI9rhj+CApT9JBGnKI5d5AYCD54lQEmubId5Rcho1XxGXVOxeZZo+CEjrGywloAOl3N4DTavxwhXTSazGC9GTK8yysim9cGvcxTTfr32wH5Jrj9g0IvSpEcgwOdubr8gU758XSsTe+cvfQLaZAybp7Ta9qKzI5aMiQS2lO4mVA9FbcaNyCUg1/mnr5qYj+KopsimVo4buTEeIgTzjanlcqsrCA30w+J3BpphAYWWt8g7pf1kbqmhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ecZsXhoIQavIAm4Ilot+2nurbSCEhTnwgzpGA58elTI=;
 b=EL9CwC98dVaTSpG9Xs7fp36kPcwYgZhlY6kNX3Za7UB02o6V/Rhrz7CFaBJZvc5gMnlSQP+G5vFP9zJAxuoU0I4PQW7zdomxAvc/t44MIvFyQBsM047F5GEclK8O8zbEhWmQwru+tGtl2glUSNF7R3yc7UgO1UC7tjQIwV1sbqzJO/LIbUkAQQXaIJkDMJjCUQleeF+J334wwtXfR6cLNAB4h8PMEvjDISbctEmGvs+C4ymrZb05LesZzpoLRiv/EL4qr09qqY4HqqeTasPm2AUxOsjFNmXqoGmrMoZYb0XsXs1EnrCoEtDIKWy5YCHHrRf64L+eR8UQHcS1W9lNow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nasuni.com; dmarc=pass action=none header.from=nasuni.com;
 dkim=pass header.d=nasuni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nasuni.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ecZsXhoIQavIAm4Ilot+2nurbSCEhTnwgzpGA58elTI=;
 b=hiniZMh4pRGL5LZNx0Pk+erU9CO3Mmm1wc0Pbwo+INz6zQKQBx4SxV60d2uotFSdJoX5Rn5liBMCOT7u/aQtD0ElM2hBq1J0KeeMe4Jg/AlY9kksnzJVikykzPb+7as+l78OI2ExAh45wjxS2TT3V2XYG+s8ySsRxaniGYvfpkpKyxP60iW6xNsoiC29ozYqJn0RonAf/jHc1CX0Lx4c/0u4j92BuqimehX03u+1YsjyHvL3FEpf57IViXrY1T1FtXDHjnD0+BPjluvTZ4Of2EWW16HwQ8lBZUhkBnNvTTaS1dbox4+8TdYn3SK/VRxJbl9jScBqF4s6CdnH1nWDfg==
Received: from BN7PR07MB4402.namprd07.prod.outlook.com (2603:10b6:406:b0::10)
 by BN7PR07MB4273.namprd07.prod.outlook.com (2603:10b6:406:b0::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19; Fri, 1 May
 2020 17:53:23 +0000
Received: from BN7PR07MB4402.namprd07.prod.outlook.com
 ([fe80::3993:bf44:ef2c:2c3a]) by BN7PR07MB4402.namprd07.prod.outlook.com
 ([fe80::3993:bf44:ef2c:2c3a%7]) with mapi id 15.20.2937.026; Fri, 1 May 2020
 17:53:22 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: RE: [EXTERNAL] Windows 10 client opens a folder as a file and asks
 for SMB2 GetInfo SMB2_FILE_STREAM_INFO
Thread-Topic: [EXTERNAL] Windows 10 client opens a folder as a file and asks
 for SMB2 GetInfo SMB2_FILE_STREAM_INFO
Thread-Index: AdYfzMNTD1cVwy/fSQSYgUoo68/8vAAFGKtA
Date: Fri, 1 May 2020 17:53:22 +0000
Message-ID: <BN7PR07MB4402A595D5031D621132328CCFAB0@BN7PR07MB4402.namprd07.prod.outlook.com>
References: <BN7PR07MB44024AA885AAD1881F852A40CFAB0@BN7PR07MB4402.namprd07.prod.outlook.com>
In-Reply-To: <BN7PR07MB44024AA885AAD1881F852A40CFAB0@BN7PR07MB4402.namprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.samba.org; dkim=none (message not signed)
 header.d=none; lists.samba.org; dmarc=none action=none header.from=nasuni.com; 
x-originating-ip: [99.10.94.169]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cccd5d74-a109-4c18-fce0-08d7edf88a93
x-ms-traffictypediagnostic: BN7PR07MB4273:
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 34scJqKlUVOZfsvujDNrvUcylBhlTlRpeqyfc2hrj2SD/KrERsMuQE+seKQOGJgHDieawXRlU+ipNKxTR0fXTo0Ud4ib9ZCvCDGw2gX7kH4AQ3kZfj3mOPa3a80QEClkGy5Fxn/gYDZX1zWwWCierGvsQ0y7WlB+PRuaxlX2yDe69DlZOsvR4TQplqTqP4ste+5tTT+G+l63dLFoLcLnUO+cwEQmymvGn9stOX4Ec6VePUP3Y6ZTGTeODp2en3EO/WBmyUlk7eUgYdw1po/MWX3txNlu+LD3/JN07zCd8UC8NjKhnY0RGFXoD0/VefTJhVuubaldj/bmjPXs8SpMUVMQPDZdtGqXGXAkNDIh1TIQbDKiygiC3Ko/NaSO6fxI1lY/QROBLHEL5dgvLeww5mKwL5UyUDyi9fxmoqb6rTr6L1jDa5KESDlNzk/tKJNl
x-ms-exchange-antispam-messagedata: X1q/4E6rp7vjaUZe2aDodH/N0zPiEd+ar/TigshLTI4hSR7o0cvjntg6dTvWv+Fm7bbt4gi/+Fj+P2cmZ4SkfuWG20doJtRSyQGdjY5MCbKR6o7rceOhVC/C3RiCZuKBcA2oZx8BoO3emD4QdR5QAW0Zx2kmSqxV+NSAANuCuOPP1ygXh+Gt0TjtGQD0qsA87BzrJRXA7QG+udDW0bZ5G0E9530cGQ0lKodeOJgds7XVs1NG+YLORbHLLZSXdKKbkFWVw+cf3Nj2/mxsRTCJtTgouHW/BtxSGfHaEVuAqgbnf6WomeumMFKVxNf53lXZy9rV+LVftCz+5MFAmBh2skb5sDeEgbIRCP6JFDIQZiCD/xD+8dFD3AFD2tksv5lobwHrInJYtmiWwIaoBV5OOtlvst3L1hjtKnWlonwwwG0gOZXmHaMsau18WRXMQNxuNBsrt2hda+QbuQk+p7TfW1Q0lHQ0BxA3NA61+s6b12SoIT9E3foodWKU4Qk5uGRLOk9tfyCcTCVHrsPQRCWSvSlG7wUPFE2HgSCQmoInI3zo9r+ivE4i3mWhmaSHUZM6SKSORs2dpiF27IpcDaBU0r3H8DFhv67rMxlJA0Gy6QUZwRm409/vybATakDTLKl/8PTjxmC1jEzj1uWOKCJiugwqBUAecD91eVFBym9HmzavcKjBJLsmbOMczb3eHi4vXhswQrBDsyWN9bkUmXlzpbpnmB4QIe8ExU6J6AhzRmSgiUKsQsWtZbPT1svpIia9JqULGJtwHoN+qAeSt8wfHpKMn7cHDoZoFRPWXQY7V5s=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nasuni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cccd5d74-a109-4c18-fce0-08d7edf88a93
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 146173a2-cdda-476f-b6d5-a48c6e6dd0c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gS5UX04VqMLQ9Wovm9jbHYpbPnHNdrXaCtNjS7NoCbhrXDO3FlUwpwEwGA6esIwMtd0JljPsjup0HKV5PWTlXwhh9AmlHBQv60KrUm48ElI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR07MB4273
X-Warn: EHLO/HELO not verified: Remote host 2a01:111:f400:7e89::600
 (mail-mw2nam10on20600.outbound.protection.outlook.com) incorrectly presented
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
From: Ashok Ramakrishnan via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ashok Ramakrishnan <aramakrishnan@nasuni.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Please ignore. I intended to send this to samba@lists.samba.org. I will sen=
d it there instead. Sorry for the spam.

-Ashok

-----Original Message-----
From: samba-technical <samba-technical-bounces@lists.samba.org> On Behalf O=
f Ashok Ramakrishnan via samba-technical
Sent: Friday, May 1, 2020 11:56 AM
To: samba-technical@lists.samba.org
Subject: [EXTERNAL] Windows 10 client opens a folder as a file and asks for=
 SMB2 GetInfo SMB2_FILE_STREAM_INFO

Hi:
We use 4.9.4 based samba in our product and one of our customers is running=
 into a strange issue. If they right click on a folder and get the properti=
es, it reports incorrect size information. When we looked at the network tr=
ace, we see that the client is walking the tree and getting information abo=
ut files and folders.. Suddenly out of the blue, it opens a folder (which i=
t had previous opened and closed as a directory) as a file (Create Options =
0x00200020) and then issues a getino file stream info call. Samba promptly =
responds to this with NO_DATA since there is no stream associated with this=
 folder. After this, things go downhill.. The client starts requesting file=
s with paths without the above folder in the path and rightly gets STATUS_O=
BJECT_NAME_NOT_FOUND. We have requested our customer to open a support case=
 with Microsoft to help understand the reason for the client behavior... Bu=
t hoping someone here has had experience troubleshooting similar issues and=
 can provide some tips/pointers on what to look for. I am primarily trying =
to figure out what could prompt the client to open a folder it knows is a f=
older, as a file and ask for the stream info. I have looked through the fil=
e ID, QFid, etc for any duplication and could not find any. So, why would t=
he client do this? And it does not do this for 99% of the folders in the tr=
ee.. Just for a few...

Thanks!


-----------
Frame showing the path being opened as a directory...

Frame 65257: 706 bytes on wire (5648 bits), 706 bytes captured (5648 bits) =
on interface \Device\NPF_{B68E32C7-33A6-49BB-BD17-84680A37AE6E}, id 0 ...
Transmission Control Protocol, Src Port: 63880, Dst Port: 445, Seq: 5538194=
, Ack: 5898017, Len: 652 NetBIOS Session Service
SMB2 (Server Message Block Protocol version 2)
    SMB2 Header
        ProtocolId: 0xfe534d42
        Header Length: 64
        Credit Charge: 1
        Channel Sequence: 0
        Reserved: 0000
        Command: Create (5)
        Credits requested: 0
        Flags: 0x00000010, Priority
        Chain Offset: 0x00000220
        Message ID: Unknown (65652)
        Process Id: 0x0000feff
        Tree Id: 0x12c24d77
        Session Id: 0x00000000771ae25b
        Signature: 00000000000000000000000000000000
        [Response in: 65258]
    Create Request (0x05)
        StructureSize: 0x0039
        Oplock: No oplock (0x00)
        Impersonation level: Impersonation (2)
        Create Flags: 0x0000000000000000
        Reserved: 0000000000000000
        Access Mask: 0x00100081
        File Attributes: 0x00000000
        Share Access: 0x00000007, Read, Write, Delete
        Disposition: Open (if file exists open it, else fail) (1)
        Create Options: 0x00000021
        Filename: PathName\Modified\To\Protect\Customer\Sensitive\Data
        Blob Offset: 0x000001f0
        Blob Length: 48
        ExtraInfo SMB2_CREATE_QUERY_MAXIMAL_ACCESS_REQUEST SMB2_CREATE_QUER=
Y_ON_DISK_ID
SMB2 (Server Message Block Protocol version 2)
-----------------

Then the client does a SMB2_FIND_ID_BOTH_DIRECTORY_INFO to list the content=
s of the directory...followed by this...It opens the same path without expl=
icitly asking to open a directory (Neither 0x20 not 0x40 is set in the Crea=
te Options).

----------------
Frame 65263: 682 bytes on wire (5456 bits), 682 bytes captured (5456 bits) =
on interface \Device\NPF_{B68E32C7-33A6-49BB-BD17-84680A37AE6E}, id 0 ...
Transmission Control Protocol, Src Port: 63880, Dst Port: 445, Seq: 5539052=
, Ack: 5900825, Len: 628 NetBIOS Session Service
SMB2 (Server Message Block Protocol version 2)
    SMB2 Header
        ProtocolId: 0xfe534d42
        Header Length: 64
        Credit Charge: 1
        Channel Sequence: 0
        Reserved: 0000
        Command: Create (5)
        Credits requested: 0
        Flags: 0x00000010, Priority
        Chain Offset: 0x00000208
        Message ID: Unknown (65656)
        Process Id: 0x0000feff
        Tree Id: 0x12c24d77
        Session Id: 0x00000000771ae25b
        Signature: 00000000000000000000000000000000
        [Response in: 65264]
    Create Request (0x05)
        StructureSize: 0x0039
        Oplock: No oplock (0x00)
        Impersonation level: Impersonation (2)
        Create Flags: 0x0000000000000000
        Reserved: 0000000000000000
        Access Mask: 0x00100080
        File Attributes: 0x00000080
        Share Access: 0x00000007, Read, Write, Delete
        Disposition: Open (if file exists open it, else fail) (1)
        Create Options: 0x00200020
        Filename: PathName\Modified\To\Protect\Customer\Sensitive\Data
        Blob Offset: 0x000001f0
        Blob Length: 24
        ExtraInfo SMB2_CREATE_QUERY_MAXIMAL_ACCESS_REQUEST
SMB2 (Server Message Block Protocol version 2)
    SMB2 Header
        ProtocolId: 0xfe534d42
        Header Length: 64
        Credit Charge: 1
        Channel Sequence: 0
        Reserved: 0000
       Command: GetInfo (16)
        Credits requested: 0
        Flags: 0x00000034, Chained, Priority
        Chain Offset: 0x00000000
        Message ID: Unknown (65657)
        Process Id: 0x0000feff
        Tree Id: 0x12c24d77
        Session Id: 0x00000000771ae25b
        Signature: 00000000000000000000000000000000
        [Response in: 65264]
    GetInfo Request (0x10)
        StructureSize: 0x0029
        Class: FILE_INFO (0x01)
        InfoLevel: SMB2_FILE_STREAM_INFO (0x16)
        Max Response Size: 1056
        Getinfo Input Offset: 0x0068
        Reserved: 0000
        Getinfo Input Size: 0
        Additional Info: 0x00000000
        Flags: 0x00000000
        GUID handle
            File Id: ffffffff-ffff-ffff-ffff-ffffffffffff
-----------------
This e-mail message and all attachments transmitted with it may contain pri=
vileged and/or confidential information intended solely for the use of the =
addressee(s). If the reader of this message is not the intended recipient, =
you are hereby notified that any reading, dissemination, distribution, copy=
ing, forwarding or other use of this message or its attachments is strictly=
 prohibited. If you have received this message in error, please notify the =
sender immediately and delete this message, all attachments and all copies =
and backups thereof.
This e-mail message and all attachments transmitted with it may contain pri=
vileged and/or confidential information intended solely for the use of the =
addressee(s). If the reader of this message is not the intended recipient, =
you are hereby notified that any reading, dissemination, distribution, copy=
ing, forwarding or other use of this message or its attachments is strictly=
 prohibited. If you have received this message in error, please notify the =
sender immediately and delete this message, all attachments and all copies =
and backups thereof.


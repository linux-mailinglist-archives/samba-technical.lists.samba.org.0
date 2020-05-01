Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB371C1BB4
	for <lists+samba-technical@lfdr.de>; Fri,  1 May 2020 19:31:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=tzYraNdeN8ZNT4z+bcgHaiNFybVWB7KtNi+2J4shgYk=; b=pRxxdSwl57Ocmq2Y86ujSID8vP
	AxvFZ33LMCiLeXv2//L/CgSzCUk3JjJ69jCY8HS1udaGfIKg8S4pDMFmNURhbrEDhkcsdAoDB26FX
	X24kW4INrQPjaxsJEpOL+GF0Pz2TAsBb0CoWXR5VNVQr4HvdsnL6+qo1OJEylj8/+Oh1kAyimX7Zr
	D6Q0HsQNcKUg0mMK/KK8mxoq9bwmle+n+0D2X85Owy3vlOuez67zf8wxqnwGiE2/1ZIAz3M2DKZPp
	/8BCuWt8cQRUGaUNerF1Ka+nbnyfEmjQBZ9np/vqbZlrcE876p5YF+RnUyM6I+mDSO47nMolmoNvB
	qL1iWQeA==;
Received: from localhost ([::1]:18318 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jUZV6-002CoF-VF; Fri, 01 May 2020 17:31:01 +0000
Received: from mail-dm6nam10on20616.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::616]:61647
 helo=NAM10-DM6-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jUZUx-002Co8-RT
 for samba-technical@lists.samba.org; Fri, 01 May 2020 17:30:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DXnOwVvDOIJtNMNjmkO6lem5dJPjXg/74SzVr1hBna884tIxCZeRCEqk28i+uoD8IRfh5/TgkfZqjF6NuHf6EYZYttb/TopmziBSxAWqK7cwYVesBcu85jLPwg37sxDs2BWCEgGrrNx4Q2ao4Av/SCkyP84F5+mdoTUnUFNMj3PH/giTETsn/7F/kcAOXB8KEQjO6dgbb60He03RLubDOTUgLcpqU4fgMZa1lj8HvlhhXSv6Btfq04/fI+g2YBF3pw5eOVywOtLLolFly1x4kZX94wdIW8VlkaVpZDhTjiXPyzBJi5dnkRuag32fWKSSUD0gEKpUpw8MN74rSVDudg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6NGVO3RCdlQOXPNfncQwa2ggdwMp1eCBKVM+8rszRxg=;
 b=YerrRJdopaU42/a5Oq4m3Hc9y1K3hnT+mkJiGk0CZkHsWWiAeeTvzhEqc8CQlYJINDtAUKKQFKXKvm8E1lxtESMjDaGsiS3SFqKND2FP7tGUC2zG61rsIxv5t5UJmlpGlwWdaAiou3QSsF+E+ElBvUw6WsuSSYI9tR9/GsTjZUzns/P8BbVdWpVxCIK8817OJeXMSrpSN3nEXfdBBhLwKdLqM1si3uggq/YT0BytvaAlcLpqmKIYcwZvvk13cfc2/BPtR5KXvcEv6UUbDbNiC3gF7MY4WJDghTOiKDgMygXD90cJztfdiAtBpdS2OIkU2E+yuPZGkYZUFXJyDmLB+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nasuni.com; dmarc=pass action=none header.from=nasuni.com;
 dkim=pass header.d=nasuni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nasuni.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6NGVO3RCdlQOXPNfncQwa2ggdwMp1eCBKVM+8rszRxg=;
 b=q6HcO0MjuZgekUM+He+he0i/yasBOfFCuumx4XDVQD93W3YzykUXM9do7jkNugD2w+UQrgoZk1wpUTt9Wru/DuXr4VTFK/ZsU3X/Y691JmDu+tjlWgTHuFcrHaTC8s+hxtTzq/eyF/Fl6B0kkXTGsnFW2fTmkxlXYDhNjDVJq1TPHHxIeSSyWUQNJ1GrqlrUYWQb0sCXWVGrv2q/4TThEvCHXOPZQD4M2ehJLPJxcFLBV8HHjawl9a+KK8JLFRreEZSUOWgqiTkfiCcVY1Mw/ohzIaZZmPeuQsFpMp3VnfwJVXsxTBQ4skfQH3Or7HPnP6XwGXbS+IOLicV3S1a59Q==
Received: from BN7PR07MB4402.namprd07.prod.outlook.com (2603:10b6:406:b0::10)
 by BN7PR07MB4609.namprd07.prod.outlook.com (2603:10b6:406:f9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Fri, 1 May
 2020 15:55:49 +0000
Received: from BN7PR07MB4402.namprd07.prod.outlook.com
 ([fe80::3993:bf44:ef2c:2c3a]) by BN7PR07MB4402.namprd07.prod.outlook.com
 ([fe80::3993:bf44:ef2c:2c3a%7]) with mapi id 15.20.2937.026; Fri, 1 May 2020
 15:55:49 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: Windows 10 client opens a folder as a file and asks for SMB2 GetInfo
 SMB2_FILE_STREAM_INFO
Thread-Topic: Windows 10 client opens a folder as a file and asks for SMB2
 GetInfo SMB2_FILE_STREAM_INFO
Thread-Index: AdYfzMNTD1cVwy/fSQSYgUoo68/8vA==
Date: Fri, 1 May 2020 15:55:49 +0000
Message-ID: <BN7PR07MB44024AA885AAD1881F852A40CFAB0@BN7PR07MB4402.namprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.samba.org; dkim=none (message not signed)
 header.d=none; lists.samba.org; dmarc=none action=none header.from=nasuni.com; 
x-originating-ip: [99.10.94.169]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f7d9dc79-83e9-47f1-bfda-08d7ede81e78
x-ms-traffictypediagnostic: BN7PR07MB4609:
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OmqM3NNhjPSmUcjXrryfs9p915ISIWay0QdrtiyW9xoF0hK1/0+j2USRUYORcwGpsCrRZ6ykUr76TdHDY9HORbp6Yl/0JDjN/tYj47rQ3TwMvhkKzu4gajByVnbQlDIS2OhmWDwxAC4jaQK++w0UWINfFjbZlhSRIBNd7NSuEDXEmO6DbZx3Ye74XNik6hTZmKTLQNG4djVDxV/2uQ0eYdTkE9ZpXD+XlRSb2x0jNGOWfRyI7j22nTLH8NsyzFZ2OwUk9Kxpo3cIUuAN/ez2hM8xB/CQMFs77MTRdoXPK3U6V34J9lBEUtMrGKn6glTEJsSIHMe0KmaJOrAHgpHXLbVq8jLKP7PR/04mfjFIYj4nP8Vj3sm3IgiJvpjSd+cfTOVH5ng0iBrdVmEz0+43fspaH/2neDft/kMNdYLqoYgnubToj+z9PLPM7UFtME85
x-ms-exchange-antispam-messagedata: BFPWNxdjVsnzDTUOiaEmLUijgIV9Lrwyl5E2TTgx51Uk/AyUESRDvXHCO5/6nRAmSm9whd9ZJZtwu+eb2fF6I1b0pJCkQJFhpTlPAA/CI4kC20hkm0U/lvMzffU8k0HqByQJASoK7ucNExWQlax06jbZ4iQjlfvfgcNx3jfzy2/4EgSuOV45Y5cRP/m8RX091/uEYQezqrwKYdqGAwhVe93Ds0o5+6PTgqIhEotWPUxoud98lbokTkzbk23sddOSKZgKpyC8+pbpTFpyTGbqWmVZJbb6b1Abnr+aAaESL1oISKt1mlBUcR9x4QJ3PhwN2YwXarocQI2kjUGt7P8FNROIfCs/cM71/VkzX+wKWlGQSj7Z/Pz6xZzBGQfnoEiv8JwQ9sf7Vnwz0FknWiWRH5ESuE4XL1TyTLQ7/duBwdxlsEH/qsVGjjlN+okb84USbd6FdbtemdDwr4CSy/HUuO6OFJ9xN8eRCGP0zRfamoXvwA6UeuqxSTjTOTSCOVbn2Z5jYA+WxAp8hdjPtG7tBxs9Exb+vpizissc1XSJsG60ZC3+tK7H60QHfvpxNj8hv2OLhnkwdnVghg9BckQHAjO302VtGGzWm8Y3G3jcUn+w5dXepE/bX3BaCObW7ceBXkwyI8I+8SEe5O38SzPV+KwseyXgc3DFdXP5rAvySh++gBrocpYvUcaATLweG9JxaA/A0UFmrWlDyZvmIcOk+3+mOyo/RTMtMPnikYSb/bwWdH0RI3t2GCWsdxwosqTFhrycygnmMIK1CS8v0IsuEiPJYoPq2n/ecb3MlBGp3RI=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nasuni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7d9dc79-83e9-47f1-bfda-08d7ede81e78
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 146173a2-cdda-476f-b6d5-a48c6e6dd0c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D9eh9qfBkX/zw92aLwnHl0hZt6kYeUCqgnnZIjSqj/FTTfvdg7YywuPIt08iCF7diEhBRxyPLLjICiOK24bJ5GTM3Ja5UYip+W5BR4w9IvQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR07MB4609
X-Warn: EHLO/HELO not verified: Remote host 2a01:111:f400:7e88::616
 (mail-dm6nam10on20616.outbound.protection.outlook.com) incorrectly presented
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
From: Ashok Ramakrishnan via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ashok Ramakrishnan <aramakrishnan@nasuni.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

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
on interface \Device\NPF_{B68E32C7-33A6-49BB-BD17-84680A37AE6E}, id 0
...
Transmission Control Protocol, Src Port: 63880, Dst Port: 445, Seq: 5538194=
, Ack: 5898017, Len: 652
NetBIOS Session Service
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
on interface \Device\NPF_{B68E32C7-33A6-49BB-BD17-84680A37AE6E}, id 0
...
Transmission Control Protocol, Src Port: 63880, Dst Port: 445, Seq: 5539052=
, Ack: 5900825, Len: 628
NetBIOS Session Service
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

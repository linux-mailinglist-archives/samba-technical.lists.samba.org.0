Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C90C320722
	for <lists+samba-technical@lfdr.de>; Sat, 20 Feb 2021 21:45:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=2f68ILsMFtvyQOIZQlpeSOxwltn8a/dETGTimuroH3c=; b=HshTX93e20vZ1BOWIDdHmApZkG
	bEDplDwQx2rilIYw3iRPXIpHvJQWK9+voleGN+9CfFWl1BStIp7m8qOpjZifbfhRoxtUX2W9j8Llb
	Bk6opEXpf2zZsXXyASPoghAE7qoHGA6dQgeujOsELh6ERQwC9i5nPWiHXAvlDKSgUBX1m3odTWDLp
	wwXkvxH/Mxx/DyMEWKItR9lkyd6bzV20CUY3NPWS1cBmaa4UzxuRtHIlgC7CwMOTx+4XBiWggFK1n
	QAgcU0ZapR5Ia9hbZyqli8TRAeNzySHLgnUfNwGseVOpj2DXAG2669L1sTXM+pfHanX+nb5VHDn2v
	MaUB6WYQ==;
Received: from ip6-localhost ([::1]:21132 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lDZ71-000p1M-R7; Sat, 20 Feb 2021 20:44:23 +0000
Received: from mail-eopbgr150083.outbound.protection.outlook.com
 ([40.107.15.83]:21942 helo=EUR01-DB5-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lDZ6v-000p1F-U5
 for samba-technical@lists.samba.org; Sat, 20 Feb 2021 20:44:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WeFp+0H2BN7QG9UrgFFSShY8+GkLlK3Hg9alS7vo/Bp27cnPCZNx++VSFLEoKBIQhfQOvGcLQaI2CN6qdc3wAQIDBU4OL0fYfUU/eAwg3Yk5uw+Yph16kbj1/jvmqCT8N9spw6t7VJnbgze+W7/L5wcHX0H7Oh4ZpF2mhr2aDKUih2KE024E9np1/tAJo6hbEL6OTaXwVTtpdMAY69JA1Zu5lA5CZir1eNOTJxjMuCL+j3XxUMTVbmxOLmGF8sgFeVgDOMoSVbusWXf7ALMs/QtKCXB2CEMYkpOq0eDu5QRyUnxbuBOrtQSFxfFCEB0jOM4C2QUc7XTnQKjtUWX+8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DOgLYDH/NvDZ4UTMoSzwn+fnIhOdWFF/bcD0brb4YT4=;
 b=NmvfUh8HLg0L038aqorjsGo7TZ25VK0beq1ThBtDibddjxHi88GezgxJ9F6iOflbAXR+KD8VfEYTNltlfjGUpQTI+mLXh5xOp0NjiHtb7+BajDCRYHjzOIDiRvg65qHiq6/mtJpH25KQe3EYGMJ5j4WwThjAss/rLyZgTPe0xJsBWLfgzgJ/nQksnEapH3HCBZ3IxgA5j0zHBvSj05MFgE93QbHnR5IEx6x63IJH0189pkyPekBHwioOrZhKngZR6aXE/iP0qnTklZ5jOEgAxnW1CoLXNHirVLm2s3vy9idOaWBD5bZNe6F3PNewFxAg6WaL5KXanIMBAQrwVcl0xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digitx.de; dmarc=pass action=none header.from=digitx.de;
 dkim=pass header.d=digitx.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=digitxgbr.onmicrosoft.com; s=selector2-digitxgbr-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DOgLYDH/NvDZ4UTMoSzwn+fnIhOdWFF/bcD0brb4YT4=;
 b=lRfPGiB0ftYjMgKPPSMc6P3Qd3cx539IW9KRrVgrYu7Ut6rvF3MH1lfhIgGI8rWjJxcRkgt9VcTo13SN2R8k1+S+L0hJAwOLESaVd5BV16DlY3vC1yqxbZFt8GS/kAOspfKXkZfjYShWH+2EJG2GYSC/ZPXmu5Tdgwqv856f0b8=
Received: from AM9PR05MB7636.eurprd05.prod.outlook.com (2603:10a6:20b:2c8::19)
 by AM0PR05MB4516.eurprd05.prod.outlook.com (2603:10a6:208:b2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.38; Sat, 20 Feb
 2021 20:44:04 +0000
Received: from AM9PR05MB7636.eurprd05.prod.outlook.com
 ([fe80::d00d:53da:6d2d:d23b]) by AM9PR05MB7636.eurprd05.prod.outlook.com
 ([fe80::d00d:53da:6d2d:d23b%6]) with mapi id 15.20.3868.032; Sat, 20 Feb 2021
 20:44:03 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: Provisioning an ADDC with vfs_nfs4acl_xattr
Thread-Topic: Provisioning an ADDC with vfs_nfs4acl_xattr
Thread-Index: AdcHun2iwMTUQqs8RQKkd3jDlP7KGw==
Date: Sat, 20 Feb 2021 20:44:03 +0000
Message-ID: <AM9PR05MB76360A339F47095CA02FA87DCF839@AM9PR05MB7636.eurprd05.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.samba.org; dkim=none (message not signed)
 header.d=none;lists.samba.org; dmarc=none action=none header.from=digitx.de;
x-originating-ip: [93.217.247.182]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ac84bed-b98d-4e19-2864-08d8d5e04297
x-ms-traffictypediagnostic: AM0PR05MB4516:
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2H2kA59mFvbqL9ogI9ly663T65Xbf6zD5RA0RLq9CuzPuSPkHMJIEJYuOwLki57cS5JY0xEtgDwhRNeNFPO92CAI/0e2HqSXKXrWt57SIRG5bc+23gCA9SQY0E98P1RhR3GOAOxEX8lVK+MagJeq28I/Khf1hiH6uOL6wjSyNaNNVjIN710IWX8tSSgDxC+rmkOkVswFlxEWLvAPE8T1Kyb1pL3BKXBKd/MRD5axCklvoUg4SZLd3t3T8/jL4X/TmbLL9PLh57VKEnjPRsxX+GsOVznD5FOycAuG4XfRYT7SQA8v2ZeqlOR6rbb312EC+DL4qTgDGwCZfqruF/c1SZsARmHzrcC06fOHKOTS4ItEDYwtiT6J2nHPjeXpCbmnPFf4bIZMZ2xtedvMHCCzblgex/fqDNPcFtEElDFpE8WLvtS/S87aY4wQl0GdgmvNX+sabf98XDkeJ3FSFUCmtHUVNKuERznv+icuCjX8vp+Ge7nscGZ0l9C48CxVzJ1wa4GCXSyopfn/BUSrx/9mZi3JsFNM5CjsvEfAhyfBFZ+aFXW6iVllUK/vm6BU9SPkXQh1HaLOF8NlEEdx141/EhPW+WGXTyqIAhXEjZ/gqoY=
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?ny9Oxhz/UYvmC4CLbGBROUwqDhf5qBhzgXgDaWryWgnb1HSDZSJQOyI1lbRa?=
 =?us-ascii?Q?0jvF7K51mf9EHd/zPyUfn38YUeM/zOlhfjJuAOLhcYSLp8a5K2yiPTMQNnUx?=
 =?us-ascii?Q?ihrYYNwh0r8pcz/7sxESy/sepjyjeIdwNXA9KO58XHUgOy7jzc2VQa+p4ZGQ?=
 =?us-ascii?Q?f9mdfQ3u4lcPlOFLW67WHPt031lwsmpvCjI/+k7PSN9PpEqSjv7QXnmV3UH8?=
 =?us-ascii?Q?T3NlTgpURc+qkns8TTrANc9BLzYnr6QabbVjQwd6oHYrB3N5aMl9PpVIFIzh?=
 =?us-ascii?Q?jbZmqPFkkg1fNF0eCcx75f4MTvrterD3t9Ti6UHXh4mcRv6rmj+4GI4YzP8z?=
 =?us-ascii?Q?0UBK47/Ekf43oWa1qTROxvdmULzxjVRCU4I2RawSSDvUgWKtvhm1WvI0YRfM?=
 =?us-ascii?Q?4//ybD1RU77oXTZShRlcczVIQ/vCWrvFy9GuY8XePOem9VUxPkOPaEi4r0aR?=
 =?us-ascii?Q?Qwtbx2R3BwcXWNwaQ2EAFR6qBl80+xeDEwmqPCLi1z+11AQyZFyrpGVhy0JV?=
 =?us-ascii?Q?9MJAfjYZyd+aghPfBiMTEkkqzxaPQCQszAYzS+IcUzC7w9YN1c7G3QCcSbY+?=
 =?us-ascii?Q?X6QY8p248w2zMjJbPHFp3hcAzOJ6LZz68jQBZT0t5qU+I5eJ0XO5b5uw/iE0?=
 =?us-ascii?Q?MsVbDSilimKg5IlVW0Stji+v2Hgls8qfD8ykeLKtWHYU4VjWumlnpwrqIDdY?=
 =?us-ascii?Q?IPDMRw+ojNJu9zQLTwCIbE87zwPt+vkqeKBLgurcYgyGZ9UnSXfX2TrRWv+x?=
 =?us-ascii?Q?b1eIFRF22CFPbFdzxWhXyh09yh6yWlPiSsk40Ikr5yiGHJl0m6cLvFdQ9n+d?=
 =?us-ascii?Q?eI+YXDJcaYjyxI8pp/qOtN6J2fue/GXlaGorb1Ujf1qoaajQfLP7MtCqjuOm?=
 =?us-ascii?Q?Qx2qy1kijby7Xb45SQbeUcE5o58uCOCrfYcJVQ4x2ZqKSlBzCzhSubR+UApL?=
 =?us-ascii?Q?zNr1Zko09sNkQatvjKXdXfmtqQG9GW4ZvH7zt2CwpVvMHA5nfwXZZmc/BZmL?=
 =?us-ascii?Q?XN/zWEOrSTGFmNqerCeDUQTPrT9j206KrPL2c6Z3MpgwLh294MdPhhJi/RS1?=
 =?us-ascii?Q?FUq5L++fnFYc8Frae8qxDHGXkGfGDnkBhxUQeczv+7bZ89otXvteq2zHdVgu?=
 =?us-ascii?Q?pshyICXgHX2gzbi9ZhHfhq+e3Cgki8Yt6lRwWBNvayXnbwOOFuyuXU6DDtet?=
 =?us-ascii?Q?uh06RpDsw0BcnkSi0+X7lA+zTMn8vyi1oHN9Bs4eO/kZgpbsMG8pfQDZrYeg?=
 =?us-ascii?Q?kscoelDE0qiVZpahv3caAcaztL2Yvk5Bic7VY0AZJf601Celkd724PkwxbHo?=
 =?us-ascii?Q?cikbiXaLeR0EhfXPJzGQ02aq?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: digitx.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR05MB7636.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ac84bed-b98d-4e19-2864-08d8d5e04297
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 545eefb3-8b20-4e2a-bcdb-884c876d0f6c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9bQ5QzdXf/puZAF1iNLpnYPlvg06Wlv4s8rdSR5vUNrC1nHOTRHbdVnZfmpcEZ/lwVrL8cgU10yG987z5MrsyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR05MB4516
X-Warn: EHLO/HELO not verified: Remote host 40.107.15.83
 (mail-eopbgr150083.outbound.protection.outlook.com) incorrectly presented
 itself as EUR01-DB5-obe.outbound.protection.outlook.com
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
From: Thomas via samba-technical <samba-technical@lists.samba.org>
Reply-To: Thomas <tgeppert@digitx.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I got this working up to a point where some of the NT ACLs were not set pro=
perly during provisioning due to an idmapping failure.
This seems to be kind of a chicken and egg problem because the winbind serv=
ice is not running before the ADDC is provisioned but it would be required =
for the mapping.

The general setup is summarized in this post https://lists.samba.org/archiv=
e/samba/2021-February/234326.html
and some details of the idmapping issue are discussed in this thread https:=
//lists.samba.org/archive/samba/2021-February/234364.html

Running 'samba-tool ntacl sysvolreset' after provisioning, when the winbind=
 service is running and configured in nsswitch.conf, did complete without e=
rrors but checking the result with 'samba-tool ntacl sysvolcheck' does thro=
w an exception.
Further investigation seems to indicate that the problem is rooted in pecul=
iarities of the involved ACLs and the fact that they are treated different =
by the standard acl_xattr vfs module and vfs_nfs4acl_xattr.

The ACL that is retrieved from the SAM database for the Group Policy folder=
s and files is this:
O:DA G:DA D:P
(A;OICI;0x001f01ff;;;DA)
(A;OICI;0x001f01ff;;;EA)
(A;OICIIO;0x001f01ff;;;CO)
(A;OICI;0x001f01ff;;;DA)
(A;OICI;0x001f01ff;;;SY)
(A;OICI;0x001200a9;;;AU)
(A;OICI;0x001200a9;;;ED)

The ACL retrieved from the filesystem is compared against the above ACL and=
 if it doesn't match an exception is thrown by the sysvolcheck.

The first issue is related to the fact that the first and fourth ACE in the=
 above ACL are identical.
The nfs4acl_xattr vfs module does merge these ACEs into one ACE in its code=
 path (smbacl4_MergeIgnoreReject() in nfs4_acls.c) when setting the ACL and=
 would also remove a duplicate ACE when reading the ACL (check_for_duplicat=
e_sec_ace() in nfs4_acls.c). Therefore the ACL returned for a directory in =
the sysvol Policy branch by vfs_nfs4acl_xattr has one ACE less than the tar=
get ACL. It looks like the acl_xattr vfs module is not doing this.

For files in the sysvol Policy branch there are additional issues. The nfs4=
acl_xattr vfs module removes all inheritance flags from the ACL on a file (=
nfs4_acl_add_sec_ace() in nfs4_acls.c).
It also removes the Creator/Owner ACE from the file ACL in the same functio=
n. Code comment: /* A non inheriting creator owner entry has no effect. */

In the context of the sysvol Policy folders and files I now have the follow=
ing questions.

Is my understanding correct that for directories the following ACL is equiv=
alent to the above ACL ?
O:DA G:DA D:P
(A;OICI;0x001f01ff;;;DA)
(A;OICI;0x001f01ff;;;EA)
(A;OICIIO;0x001f01ff;;;CO)
(A;OICI;0x001f01ff;;;SY)
(A;OICI;0x001200a9;;;AU)
(A;OICI;0x001200a9;;;ED)

And for files the following ACL is equivalent ?
O:DA G:DA D:P
(A;;0x001f01ff;;;DA)
(A;;0x001f01ff;;;EA)
(A;;0x001f01ff;;;SY)
(A;;0x001200a9;;;AU)
(A;;0x001200a9;;;ED)

After changing the samba-tool code to expect the above ACLs for Policy fold=
ers and files the sysvolcheck does complete without errors.

What tests can I run to check if this vfs_nfs4acl_xattr based ADDC installa=
tion is sane and working properly ?

   ----
Thanks
Thomas


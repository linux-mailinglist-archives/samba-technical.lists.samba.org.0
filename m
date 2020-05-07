Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 344AB1C9D4E
	for <lists+samba-technical@lfdr.de>; Thu,  7 May 2020 23:34:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=MzUKNp3sv2tA/cd9GUjfoe/aTYSvA1/j3rzotHLW/0U=; b=C7ApqKujWGqEUA0QGglmbfae4j
	Lz2bEvZzpR8HOjc+/3cuQv7Fgxf5tZmmFLukjkNKbF0Ba/2gDPxPGdLAgDOREmVc5VqY2ehpXy+9m
	1ywf5DmP4ZmO+HcbMtKdY71H5CVOYg3cB8OKzBqvw5NsREmUa8dj4BrJGkfw+iWQFV2Y9aeh7zK1Y
	6a2D4cRUPMKHZhfb3Luy/iE0VeVqCwaCmu8cbwo+QzrUyosIyPAdZBjRHXIogY/MJlZVGSsOkph9Q
	JKugBP6hxahqXwiQkezjk40gEXK7qZTBKcqezazqjXehMD/x0CWZ8ODud4J7KpKZ6ZmIEueKcF+SZ
	lyL0D4IA==;
Received: from localhost ([::1]:47742 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jWo9u-003BNZ-Ah; Thu, 07 May 2020 21:34:22 +0000
Received: from mail-dm6nam12on20624.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::624]:6126
 helo=NAM12-DM6-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jWo9k-003BNQ-Mp
 for samba-technical@lists.samba.org; Thu, 07 May 2020 21:34:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cF1e8N1GCK6VzEOOToSp86Z57+el9C5PMsQnxRLNgXfYjRLLGHfiR2AjDfxogM7OakMhWv2wK43cvithrCsxd+0/jG5lLW+WXpvO2XGKuPxbb6VLiVCYsXkORkY21B8EVLiJFJHByiAIsioGhtmws4TClPlJ9ayyC7C7SpnPXWzd84eZF2bgaA6z8V+ZBCBSUJ6Kfy9/WI7fiE8FbhiAk5FTOcPLNMUp+WJRd7mQ83io3FIApWh5EHAo6SdGklsY8IewuSuEMf/6UXPC5uCZd6xYpHZYzHFj4bfgXiGjKOjqMA3gtmTMFmCNQGHeESOgFx22lK3vOA+MLjLnkkZNEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MzUKNp3sv2tA/cd9GUjfoe/aTYSvA1/j3rzotHLW/0U=;
 b=cSLlVp1ltlkwA+2ZB7+cLFs5PCP6gB7yJiH2VX9hKsyRQ5RdRJrjxt/8fRTI/gO0v04rgW7FLXh8TtDgZYHBUlytdG0y6szHSGjV0EM2QF4vBKg8Ai4S3vWZuEfHH6RDXW0nSmw9xABQwNUhQpGqPU1V7AfKluRFj9vbK6IpxnfC7GdaYa2xK+2pZTyvMgrZ7c/TdZO0H4U3f9Wf0kz05F2z6NlnFAmxfaggP7ziBCjNxAYy6ZE9JcHO9htH0JMb9lKhxVhtRQKRCMFoLxRSYOLgfb3IX1T9yt3XljFOa+TzzS/aYyhoQ3c/3ML5k9JEtAeQdeG20Ji0vani3yWx7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nasuni.com; dmarc=pass action=none header.from=nasuni.com;
 dkim=pass header.d=nasuni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nasuni.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MzUKNp3sv2tA/cd9GUjfoe/aTYSvA1/j3rzotHLW/0U=;
 b=IeXp0S5Ws0EePRRjI50QTa8LAAQHr4BOe+dWKe19hdOMrDKb3Lfrd39ZTeG114JqL8F7hPrw/7jR4e5W95soPGJDbwq/0NGXRexCe9J/5YGpmSjdwgfvgf2/XxLG4psOnUaAQG2ubafITaVGz1/myEsASJPQEQoOUi2l969H5m0Qa6j6llu2n2VRcTKbD1aNFPhVWXW1YqRogbPJ02VoApLE3EQnqMeOKKNQ0NACUOY29iA0frsLzZFDU5bRXcre6u6RDLqdgW8k4VXQGOT8lHYXSmT/MNa97V+7W/AkeWkW41pbH4Vga8Zk2waerNaYe80n3KfmVaW9TplZfTl9eA==
Received: from BN7PR07MB4402.namprd07.prod.outlook.com (2603:10b6:406:b0::10)
 by BN7PR07MB4385.namprd07.prod.outlook.com (2603:10b6:406:b5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28; Thu, 7 May
 2020 21:33:52 +0000
Received: from BN7PR07MB4402.namprd07.prod.outlook.com
 ([fe80::3993:bf44:ef2c:2c3a]) by BN7PR07MB4402.namprd07.prod.outlook.com
 ([fe80::3993:bf44:ef2c:2c3a%7]) with mapi id 15.20.2958.033; Thu, 7 May 2020
 21:33:52 +0000
To: Jeremy Allison <jra@samba.org>
Subject: RE: [EXTERNAL] Re: Windows 10 client opens a folder as a file and
 asks for SMB2 GetInfo SMB2_FILE_STREAM_INFO
Thread-Topic: [EXTERNAL] Re: Windows 10 client opens a folder as a file and
 asks for SMB2 GetInfo SMB2_FILE_STREAM_INFO
Thread-Index: AdYfzMNTD1cVwy/fSQSYgUoo68/8vAAFVqkAAAAiRgAAAFxgwAABr/+AATLI1JA=
Date: Thu, 7 May 2020 21:33:51 +0000
Message-ID: <BN7PR07MB4402F1447DB39F38F1953B30CFA50@BN7PR07MB4402.namprd07.prod.outlook.com>
References: <BN7PR07MB44024AA885AAD1881F852A40CFAB0@BN7PR07MB4402.namprd07.prod.outlook.com>
 <20200501175828.GC29166@jeremy-acer> <20200501180218.GD29166@jeremy-acer>
 <BN7PR07MB44024B8600FDF859C55E405FCFAB0@BN7PR07MB4402.namprd07.prod.outlook.com>
 <20200501190057.GF29166@jeremy-acer>
In-Reply-To: <20200501190057.GF29166@jeremy-acer>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: samba.org; dkim=none (message not signed)
 header.d=none;samba.org; dmarc=none action=none header.from=nasuni.com;
x-originating-ip: [99.10.94.169]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 366c939d-13f1-4ecb-2205-08d7f2ce5660
x-ms-traffictypediagnostic: BN7PR07MB4385:
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BxYuxLL0KTXdVGhUIGorTyLfv5Bi060zFmmfEhPHFR2tm7Cx516/4CyOrIdqiIxM/NQ+jBPVrr1oe6J1LDPlY/c4pG3yO1AeRfcMkQHVZc6IB1Sgcfu9knkWlBUO+XwBwQ+74iIx7rSRqYOixMRM4j1Qfm9vm8IUzGdA76wvOtx3MPpK1wcYf+Hv2JBGiX+/8BXRCb+giKFXftwUxvNSHIKs5cPzR7lVMNSwXv3BwLd/aTLv1TRWGer6ssQIZZ55PoC4kBzLpk+xdnkXKh6pp1gZ4sKIOG+878ETBobxQ0muv4G7q2dyvGi/n8gLhWOFY9SwD6I68wH/GnFtImxgMn6OoOYDeC+oerVnXvqAo9CYfIV8xDXdny4iCNRKQ9+i0Mk+b7WgRu8jri4JnbYKx57aAK6AT2b2gts5r0bkXM8giUqK+usuPNtz7fOEZlv3pQxPq9UwQneI6zFRkK7i6z/QAyCaBPbWEMZSIWTLWz0ny87hsrVAGXx3HHjLiKfcn6j82eH6Bv4/QJxc3BMJLw==
x-ms-exchange-antispam-messagedata: pyGQb2egUHKiIDJV1a0kEUznsWEXzmIFBNHahx4/n02woKcQN+rJy7RHdjQD+1+4yuGhDGp3j6BX0XyklcPzfLRH55/s+w0bMeHtkeyoQXUcOiY4u0PTVmw+mQMdS1rJJh/McQ1bbmQBnfPxWdsRhAsU79XJ/SVrbA6VIzaoykpTAU3KPSFsZs5Y4DmQ8k2v+mB3ZnFXw4dukQAfbplbQ2Ftr0s0SVXH4d5RSeCkdY6gvLLeZ03dbWkBJAzrJvJ/fO02o0Q3XCIpJh7IWuC5EeNqrOtP9D1FYAVeOdJp4yT61XgyGm0F/T21vIQCTUJFbfkBARXOcT6C0lug4tCZTrnczCLF9TvvNRv/RAfKNJrd/Ss6yuCvg/ZRQ7+jmYeZQ/n1Si2j1Li/HupqAWqDAspXSA/ePJ4+7xuwQzoOvuPCk69viWo89UJ+OnGlGTB3ekwy+OClmp04DQMKRL2g7Ucvrn+nAgW6SXKctkL+KCcdZ7Dl+r/ZhX5DAdie52PawQ4GCRQJzWvVQ6CuGd33Xak5Mke2ilsg0jVeWyZ9ssxU3tA1jo6yy/S8KicF2Rooww+3q4ne+/9WGakJHLhdyJOnYv0y4VS9uvp2ymxjQRncFBhHEDTF/2IXcLz8oMqP3D5Dowfl1PZmO5eGT03/40D+r9UxVvX+ZJxzWnppfpZj+2Fm204SKgC15ME6dJl6Fg0vOS9cWyQpciz02dLc5fh8AEQ0pgW80wJEm/rH0c0FYHXaQ522q1JkqRYhHLnwJs/3IPUBIJhQt3Z8Bw+Nshq+E/Vm9p1h7nLZlhP1BLI=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nasuni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 366c939d-13f1-4ecb-2205-08d7f2ce5660
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 146173a2-cdda-476f-b6d5-a48c6e6dd0c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RU5bErRxdz3FXdhxmxKB9RBfdHXsVI/0+oPniU7LpPbN7NTUMBOXaSRXINtlK6DivxCeVkypnnHeFQPVsPQQH+L34bN9oEnJq6LYeQceldc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR07MB4385
X-Warn: EHLO/HELO not verified: Remote host 2a01:111:f400:fe59::624
 (mail-dm6nam12on20624.outbound.protection.outlook.com) incorrectly presented
 itself as NAM12-DM6-obe.outbound.protection.outlook.com
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
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thanks Jeremy, Roland and Ralph for your responses. Just wanted to loop bac=
k and update you all on the progress we made. It turned out to be that the =
path length of the next file the client was going to open was > 256 charact=
ers, and the client (windows 10 -> file explorer -> right click on folder -=
> properties) silently drops a path component when this happens... It wasn'=
t obvious to me since the client did not truncate the file at the end, inst=
ead decided to drop a component from the path. In my attempt to model the c=
lient behavior, I recreated the directory structure (by extracting the path=
 and filenames from the pcap) and was able to reproduce it myself.



-----Original Message-----
From: Jeremy Allison [mailto:jra@samba.org]
Sent: Friday, May 1, 2020 3:01 PM
To: Ashok Ramakrishnan <aramakrishnan@nasuni.com>
Cc: samba-technical@lists.samba.org
Subject: Re: [EXTERNAL] Re: Windows 10 client opens a folder as a file and =
asks for SMB2 GetInfo SMB2_FILE_STREAM_INFO

On Fri, May 01, 2020 at 06:30:48PM +0000, Ashok Ramakrishnan wrote:
> Thanks Jeremy for the tip. Our customer is able to reproduce this readily=
. So, I can try potential patches. One interesting observation I have since=
 you pointed out the Reparse Point bit... The previous getinfo command was =
file network open info. And we (samba) responding with this for the folder.=
..
>
> SMB2_FILE_NETWORK_OPEN_INFO
>     Created: Nov  6, 2015 20:22:26.658586900 Eastern Standard Time
>     Last Access: Nov  6, 2015 20:22:26.659295100 Eastern Standard Time
>     Last Write: Nov  6, 2015 20:22:36.530589900 Eastern Standard Time
>     Change: Nov  6, 2015 20:22:36.530589900 Eastern Standard Time
>     Allocation Size: 0
>     End Of File: 0
>     File Attributes: 0x00000010
>         .... .... .... .... .... .... .... ...0 =3D Read Only: NOT read o=
nly
>         .... .... .... .... .... .... .... ..0. =3D Hidden: NOT hidden
>         .... .... .... .... .... .... .... .0.. =3D System: NOT a system =
file/dir
>         .... .... .... .... .... .... .... 0... =3D Volume ID: NOT a volu=
me ID
>         .... .... .... .... .... .... ...1 .... =3D Directory: DIRECTORY
>         .... .... .... .... .... .... ..0. .... =3D Archive: Has NOT been=
 modified since last archive
>         .... .... .... .... .... .... .0.. .... =3D Device: NOT a device
>         .... .... .... .... .... .... 0... .... =3D Normal: Has some attr=
ibute set
>         .... .... .... .... .... ...0 .... .... =3D Temporary: NOT a temp=
orary file
>         .... .... .... .... .... ..0. .... .... =3D Sparse: NOT a sparse =
file
>         .... .... .... .... .... .0.. .... .... =3D Reparse Point: Does N=
OT have an associated reparse point
>         .... .... .... .... .... 0... .... .... =3D Compressed: Uncompres=
sed
>         .... .... .... .... ...0 .... .... .... =3D Offline: Online
>         .... .... .... .... ..0. .... .... .... =3D Content Indexed: NOT =
content indexed
>         .... .... .... .... .0.. .... .... .... =3D Encrypted: This is NO=
T an encrypted file
>     Reserved: 00000000
>
> We specifically said that it IS a Directory and NOT a reparse point. But =
the client still decided to send us a 0x00200020 in the subsequent open of =
the file. I can play with the response and see if I can get the client to b=
ehave differently...

Yeah, I just checked with test code against Windows10 and the server just i=
gnores a request to open a reparse point if the object is just a regular fi=
le/directory.

So this may be a red herring. Would be interesting to see a trace of this a=
pplication at the same point against a Windows server.
This e-mail message and all attachments transmitted with it may contain pri=
vileged and/or confidential information intended solely for the use of the =
addressee(s). If the reader of this message is not the intended recipient, =
you are hereby notified that any reading, dissemination, distribution, copy=
ing, forwarding or other use of this message or its attachments is strictly=
 prohibited. If you have received this message in error, please notify the =
sender immediately and delete this message, all attachments and all copies =
and backups thereof.


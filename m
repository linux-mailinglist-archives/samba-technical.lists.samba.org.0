Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F34211C1C82
	for <lists+samba-technical@lfdr.de>; Fri,  1 May 2020 20:02:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=gkMGIMuKhh0i061ZoqiqyesoaDwUWPEGc+iaeGkB/zc=; b=nDz9RynpjYCLTSpMzldlIBspPC
	8YZuKYC4il2Y0EeZcMINnnSvieoFkK/zWnVYD/lTJswdaM7zwcudYmp/yzDUw0Lkdtj1AVvHWCiWh
	DhyQQdRIXWZMcE1QNaroX8U/G3UY47SGrmkKV0FB8RSwlZFuuO+E/rw43yYDzEwg4geMnNonBxnEP
	2OQZ4e86uDv36qMf7Ilp0iK9N54vRB3FjGn0tDZlNjTDqzJgOQ5gFiqRD53jk0NSkyK7qyUjO9FL2
	CGisYO2nEhIOVT3kVkVXw2ZdIfoJ1dT8J4rLGImyF54S3qTfiDCxtPWeEdTl6++85j+v7dJa7Yxgb
	iJXGt5Mw==;
Received: from localhost ([::1]:21282 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jUZzd-002DDr-4w; Fri, 01 May 2020 18:02:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20256) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jUZzW-002DDk-4Q
 for samba-technical@lists.samba.org; Fri, 01 May 2020 18:02:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=gkMGIMuKhh0i061ZoqiqyesoaDwUWPEGc+iaeGkB/zc=; b=wezlQLnQ+sZxXmM4h4CE4y1EEr
 1V+SV9Mi/b3Yt3hVgPg3g7XpyF0SzW6J+JE2/2wXK0GOmayfqhzGQyPSPO592TxloUKOwsQ9TCoX8
 +8Z4FqN6gemRLR/pLpMH88QpaFN/Lk3RVOCmb/q6bS2cNcVN7uA8CSJ8XehR6PgKOzE28vezT/DJv
 Dw3Cy1g7189vA3GsqoGk8y6kC6f+IFuMGuLRw1EHVGYKmU0p2ZNjEDUHerLlFOWG0yM7SwgybCdjr
 FktPHOSfObS/0GusrfupR6IqL4v50l+jvc2wnKMvOxZ/z2PNqZeOKZsp27F9sch/XclYSQmDMHWKd
 1tfTjF1RJ4+KBhvN8T0wojBNpGd0XBylVDAqP8fyCuhzZnTqJnqjYu7GnTQ5BR3oDq3m6IGvz1kpB
 28ruseLbiOiyuCscGdNvMsX3/AfrrjsHpBfsyTs4T+yrwQoPoXbB5CU2Tz4ZmyRBvAdsbYroz9HrA
 bzgKrStsse+7985fcZUxkPoh;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jUZzU-0003cE-BK; Fri, 01 May 2020 18:02:24 +0000
Date: Fri, 1 May 2020 11:02:18 -0700
To: Ashok Ramakrishnan <aramakrishnan@nasuni.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: Re: Windows 10 client opens a folder as a file and asks for SMB2
 GetInfo SMB2_FILE_STREAM_INFO
Message-ID: <20200501180218.GD29166@jeremy-acer>
References: <BN7PR07MB44024AA885AAD1881F852A40CFAB0@BN7PR07MB4402.namprd07.prod.outlook.com>
 <20200501175828.GC29166@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200501175828.GC29166@jeremy-acer>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

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
=2E But hoping someone here has had experience troubleshooting similar issu=
es and can provide some tips/pointers on what to look for. I am primarily t=
rying to figure out what could prompt the client to open a folder it knows =
is a folder, as a file and ask for the stream info. I have looked through t=
he file ID, QFid, etc for any duplication and could not find any. So, why w=
ould the client do this? And it does not do this for 99% of the folders in =
the tree.. Just for a few...
> >=20
> > Thanks!
> >=20
> >=20
> > -----------
> > Frame showing the path being opened as a directory...
> >=20
> > Frame 65257: 706 bytes on wire (5648 bits), 706 bytes captured (5648 bi=
ts) on interface \Device\NPF_{B68E32C7-33A6-49BB-BD17-84680A37AE6E}, id 0
> > ...
> >=20
> > Then the client does a SMB2_FIND_ID_BOTH_DIRECTORY_INFO to list the con=
tents of the directory...followed by this...It opens the same path without =
explicitly asking to open a directory (Neither 0x20 not 0x40 is set in the =
Create Options).
> >=20
> > ----------------
> > Frame 65263: 682 bytes on wire (5456 bits), 682 bytes captured (5456 bi=
ts) on interface \Device\NPF_{B68E32C7-33A6-49BB-BD17-84680A37AE6E}, id 0
> > ...
> > Transmission Control Protocol, Src Port: 63880, Dst Port: 445, Seq: 553=
9052, Ack: 5900825, Len: 628
> > NetBIOS Session Service
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
>=20
> This is the key field. It's asking for a reparse point:
>=20
> FILE_OPEN_REPARSE_POINT 0x00200000
>=20
> which we're just ignoring. We probably shouldn't.

Or maybe we should :-). MS-SMB2 states:

FILE_OPEN_REPARSE_POINT
0x00200000 If the file or directory being opened is a reparse point,
open the reparse point itself rather than the target that
the reparse point references.

which implies that if it's not a reparse
point we should just open the underlying
object, not fail it (which we do).

torture tests against Windows10 needed here
I think.


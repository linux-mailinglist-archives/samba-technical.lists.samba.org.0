Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9396E1C1C64
	for <lists+samba-technical@lfdr.de>; Fri,  1 May 2020 19:58:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=41SGx7y4zSasIG1EdPPI+pFoBiGOxVXLC/llFGbOPoU=; b=dhKS/hhHDwKozDNre50LvssqTr
	eDl++ZzRp9dlbpTSs8RC/RyKtRz2pOS5cwH/en4fybHAVqohXU8XmNN5aK5Don9LVhokda2Uxugpg
	DLwOrwMwqAx7gsr3SoXNuav4sPXXuHYbWLWkxMl5RhaF4x8luzb3lg/kJyzXr9xjIvoibYKh94wa1
	nN29QJsqtZh3QDtrGjNZODhmFWBN4aGgX7kJAADxs6k7qS35z/AXT74UCxqJwjoY6Xop2KXQqNfXq
	J2CQ68YRJQHOmxsG/I4QCscS5u8xZIrZy/TttHqAFDhIMDfurfS+9QE1PRhJOUuj4OsV4BZ8K3u3C
	zHWX2qZA==;
Received: from localhost ([::1]:19802 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jUZvv-002D1g-Fg; Fri, 01 May 2020 17:58:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18756) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jUZvo-002D1Z-7F
 for samba-technical@lists.samba.org; Fri, 01 May 2020 17:58:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=41SGx7y4zSasIG1EdPPI+pFoBiGOxVXLC/llFGbOPoU=; b=WiZs9CRzsuFUQy/puVrKdLCYkZ
 lUAhO9zE5Ms2P4I5NL85Q/56oyuej0NnGPdV4wjYHHb0DAWh4ykerxr1cYKro11RrFpV722/O/9Av
 slWMw3cvgQEniKjgAicTUNtVm6FrDbNG8TCcf/cKpGnGd3H0emC9KDYaDE9eWnKEpLXaIuGvdfS2W
 zKTCbLSjexfR8tDw+ZeIulLMSiPaxuD4SgIkoK9dZK1rEQy77YsoUhV3b5GkCqk5ByVgLBOv38NtG
 Hb/ZaGKaVSS7Czhqewv692Ly3feKM3eEgzR3dUeR4V14ie/IMKWQiB9tHAXc5zP1RGUyt7gSctHF0
 GlxpFNc5vBb+78i1ehtbTpc4gn6KUsokt8cTQL3S6WLlXqHxmdac4BWnPB9YlsnaXNf1BxxfVhBSG
 L+q2+zsckevgJGq9tXiilcXHXolMQ7B+8vjEQD5nGzlyw6jXB9CKLz+1CL1+UXjdSCP4hcjxUxwZW
 NP6SHuc+KGq/Vu11KpKTm9zA;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jUZvm-0003Xy-BX; Fri, 01 May 2020 17:58:34 +0000
Date: Fri, 1 May 2020 10:58:28 -0700
To: Ashok Ramakrishnan <aramakrishnan@nasuni.com>
Subject: Re: Windows 10 client opens a folder as a file and asks for SMB2
 GetInfo SMB2_FILE_STREAM_INFO
Message-ID: <20200501175828.GC29166@jeremy-acer>
References: <BN7PR07MB44024AA885AAD1881F852A40CFAB0@BN7PR07MB4402.namprd07.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <BN7PR07MB44024AA885AAD1881F852A40CFAB0@BN7PR07MB4402.namprd07.prod.outlook.com>
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
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, May 01, 2020 at 03:55:49PM +0000, Ashok Ramakrishnan via samba-tech=
nical wrote:
> Hi:
> We use 4.9.4 based samba in our product and one of our customers is runni=
ng into a strange issue. If they right click on a folder and get the proper=
ties, it reports incorrect size information. When we looked at the network =
trace, we see that the client is walking the tree and getting information a=
bout files and folders.. Suddenly out of the blue, it opens a folder (which=
 it had previous opened and closed as a directory) as a file (Create Option=
s 0x00200020) and then issues a getino file stream info call. Samba promptl=
y responds to this with NO_DATA since there is no stream associated with th=
is folder. After this, things go downhill.. The client starts requesting fi=
les with paths without the above folder in the path and rightly gets STATUS=
_OBJECT_NAME_NOT_FOUND. We have requested our customer to open a support ca=
se with Microsoft to help understand the reason for the client behavior... =
But hoping someone here has had experience troubleshooting similar issues a=
nd can provide some tips/pointers on what to look for. I am primarily tryin=
g to figure out what could prompt the client to open a folder it knows is a=
 folder, as a file and ask for the stream info. I have looked through the f=
ile ID, QFid, etc for any duplication and could not find any. So, why would=
 the client do this? And it does not do this for 99% of the folders in the =
tree.. Just for a few...
>=20
> Thanks!
>=20
>=20
> -----------
> Frame showing the path being opened as a directory...
>=20
> Frame 65257: 706 bytes on wire (5648 bits), 706 bytes captured (5648 bits=
) on interface \Device\NPF_{B68E32C7-33A6-49BB-BD17-84680A37AE6E}, id 0
> ...
>=20
> Then the client does a SMB2_FIND_ID_BOTH_DIRECTORY_INFO to list the conte=
nts of the directory...followed by this...It opens the same path without ex=
plicitly asking to open a directory (Neither 0x20 not 0x40 is set in the Cr=
eate Options).
>=20
> ----------------
> Frame 65263: 682 bytes on wire (5456 bits), 682 bytes captured (5456 bits=
) on interface \Device\NPF_{B68E32C7-33A6-49BB-BD17-84680A37AE6E}, id 0
> ...
> Transmission Control Protocol, Src Port: 63880, Dst Port: 445, Seq: 55390=
52, Ack: 5900825, Len: 628
> NetBIOS Session Service
> SMB2 (Server Message Block Protocol version 2)
>     SMB2 Header
>         ProtocolId: 0xfe534d42
>         Header Length: 64
>         Credit Charge: 1
>         Channel Sequence: 0
>         Reserved: 0000
>         Command: Create (5)
>         Credits requested: 0
>         Flags: 0x00000010, Priority
>         Chain Offset: 0x00000208
>         Message ID: Unknown (65656)
>         Process Id: 0x0000feff
>         Tree Id: 0x12c24d77
>         Session Id: 0x00000000771ae25b
>         Signature: 00000000000000000000000000000000
>         [Response in: 65264]
>     Create Request (0x05)
>         StructureSize: 0x0039
>         Oplock: No oplock (0x00)
>         Impersonation level: Impersonation (2)
>         Create Flags: 0x0000000000000000
>         Reserved: 0000000000000000
>         Access Mask: 0x00100080
>         File Attributes: 0x00000080
>         Share Access: 0x00000007, Read, Write, Delete
>         Disposition: Open (if file exists open it, else fail) (1)
>         Create Options: 0x00200020

This is the key field. It's asking for a reparse point:

FILE_OPEN_REPARSE_POINT 0x00200000

which we're just ignoring. We probably shouldn't.

Reparse points can exist on both files and directories,
but we don't (currently) support them and just ignore
requests for them in the server.

Note we didn't return the FILE_ATTRIBUTE_REPARSE_POINT 0x0400
value in the attributes, so the client shouldn't be doing
that.

We should probably return NT_STATUS_NOT_A_REPARSE_POINT
on the create request here. Note if specifically asked
FSCTL_GET_REPARSE_POINT we do already return NT_STATUS_NOT_A_REPARSE_POINT.

Let me know if you can reproduce this, at will, I
can send you a test patch.

Jeremy.


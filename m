Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C85A1C1C75
	for <lists+samba-technical@lfdr.de>; Fri,  1 May 2020 20:00:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=1+ntKNJz3vDAY/SpXRMYhDQzjxQSzXSZWFti/plPu5Y=; b=koqmR0IDovpj4PA+c6MeHifJAN
	0w4M5diqY4GJGVSS7oAmVqcWtAEu2oSBWTcMxU5Xsp8nnS/JprYVil2/TyzSnOWDdN9F9BsOFCNB7
	gSiO801g0k6Jbi6YT+ic2z2uHSPAWwsicienWH95e/K3Jx0XbsVY5KO1sQWyfjvSC02UOqyhRFceX
	GQFQO6oBNyORZ1SeH6yiCin1NnxS5HODN4yyK5JjRWdPuBwsZSJv1JTktWPS5SxWHtYhO+NB+fda/
	ig574NZtGkBaJnXBjYWhqAl6798d109TT9IVe2td0qLkjgtzUWhy1hCmNtpctYtyVMMIHR7qEG0fK
	AvgWSRyw==;
Received: from localhost ([::1]:20544 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jUZxm-002D7s-NG; Fri, 01 May 2020 18:00:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:19464) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jUZxf-002D7k-Dr
 for samba-technical@lists.samba.org; Fri, 01 May 2020 18:00:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=1+ntKNJz3vDAY/SpXRMYhDQzjxQSzXSZWFti/plPu5Y=; b=wcQ8u3eKQwSsrDe49ab8xzLJ/M
 zPvrvQbAcOUNnP453uLsDOQUelAjlQ4ClYKfaDTuGBC9/+0NrMAbZiKAHBggZjzbwDHm5zYCsl8Uj
 sFQD3ZIiPaVVcPOIUiEye/miy0YV9gil7n0ZgIYwF2alrdfpvAnoh6UJY5H6OYavHb83Tr25Vvllo
 Nqt9C1Moz5nq7wZaR5FT+tRAQC2kU7Ja9d5B26upthhTSQgOnMAS9BmdeQnaaYvNiLmWM0nxZl1Mu
 h211i1PZQWRIWtltquaY0NuZkAKtr6MFjySXBdqODb9CQQwkecCAjR75d/nc6St+RnhvQRAytA2du
 0Vtqe+q3QC45GmLlh8BCCrUNCa2/D1exUmwblAWpvSty5Qo7LzPl4BITrntFEZPWQZllWkSh3/DRM
 bDnpsoDbsCeR9G0cv3FkjPc8lJM3iA1aTl/gL5Ix/1Pc2XkfY1MTTgPwdgYeM7Ld0E7NUxf2Zgcx9
 xZUl4VRGxqn6DGP1C7OcVnKZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jUZxe-0003aA-CU
 for samba-technical@lists.samba.org; Fri, 01 May 2020 18:00:30 +0000
Subject: Re: Windows 10 client opens a folder as a file and asks for SMB2
 GetInfo SMB2_FILE_STREAM_INFO
To: samba-technical@lists.samba.org
References: <BN7PR07MB44024AA885AAD1881F852A40CFAB0@BN7PR07MB4402.namprd07.prod.outlook.com>
 <20200501175828.GC29166@jeremy-acer>
Message-ID: <bfc78e2b-09d9-1e38-1e73-700969f50919@samba.org>
Date: Fri, 1 May 2020 19:00:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200501175828.GC29166@jeremy-acer>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 01/05/2020 18:58, Jeremy Allison via samba-technical wrote:
> On Fri, May 01, 2020 at 03:55:49PM +0000, Ashok Ramakrishnan via samba-=
technical wrote:
>> Hi:
>> We use 4.9.4 based samba in our product and one of our customers is ru=
nning into a strange issue. If they right click on a folder and get the p=
roperties, it reports incorrect size information. When we looked at the n=
etwork trace, we see that the client is walking the tree and getting info=
rmation about files and folders.. Suddenly out of the blue, it opens a fo=
lder (which it had previous opened and closed as a directory) as a file (=
Create Options 0x00200020) and then issues a getino file stream info call=
=2E Samba promptly responds to this with NO_DATA since there is no stream=
 associated with this folder. After this, things go downhill.. The client=
 starts requesting files with paths without the above folder in the path =
and rightly gets STATUS_OBJECT_NAME_NOT_FOUND. We have requested our cust=
omer to open a support case with Microsoft to help understand the reason =
for the client behavior... But hoping someone here has had experience tro=
ubleshooting similar issues and can provide some tips/pointers on what to=
 look for. I am primarily trying to figure out what could prompt the clie=
nt to open a folder it knows is a folder, as a file and ask for the strea=
m info. I have looked through the file ID, QFid, etc for any duplication =
and could not find any. So, why would the client do this? And it does not=
 do this for 99% of the folders in the tree.. Just for a few...
>>
>> Thanks!
>>
>>
>> -----------
>> Frame showing the path being opened as a directory...
>>
>> Frame 65257: 706 bytes on wire (5648 bits), 706 bytes captured (5648 b=
its) on interface \Device\NPF_{B68E32C7-33A6-49BB-BD17-84680A37AE6E}, id =
0
>> ...
>>
>> Then the client does a SMB2_FIND_ID_BOTH_DIRECTORY_INFO to list the co=
ntents of the directory...followed by this...It opens the same path witho=
ut explicitly asking to open a directory (Neither 0x20 not 0x40 is set in=
 the Create Options).
>>
>> ----------------
>> Frame 65263: 682 bytes on wire (5456 bits), 682 bytes captured (5456 b=
its) on interface \Device\NPF_{B68E32C7-33A6-49BB-BD17-84680A37AE6E}, id =
0
>> ...
>> Transmission Control Protocol, Src Port: 63880, Dst Port: 445, Seq: 55=
39052, Ack: 5900825, Len: 628
>> NetBIOS Session Service
>> SMB2 (Server Message Block Protocol version 2)
>>      SMB2 Header
>>          ProtocolId: 0xfe534d42
>>          Header Length: 64
>>          Credit Charge: 1
>>          Channel Sequence: 0
>>          Reserved: 0000
>>          Command: Create (5)
>>          Credits requested: 0
>>          Flags: 0x00000010, Priority
>>          Chain Offset: 0x00000208
>>          Message ID: Unknown (65656)
>>          Process Id: 0x0000feff
>>          Tree Id: 0x12c24d77
>>          Session Id: 0x00000000771ae25b
>>          Signature: 00000000000000000000000000000000
>>          [Response in: 65264]
>>      Create Request (0x05)
>>          StructureSize: 0x0039
>>          Oplock: No oplock (0x00)
>>          Impersonation level: Impersonation (2)
>>          Create Flags: 0x0000000000000000
>>          Reserved: 0000000000000000
>>          Access Mask: 0x00100080
>>          File Attributes: 0x00000080
>>          Share Access: 0x00000007, Read, Write, Delete
>>          Disposition: Open (if file exists open it, else fail) (1)
>>          Create Options: 0x00200020
> This is the key field. It's asking for a reparse point:
>
> FILE_OPEN_REPARSE_POINT 0x00200000
>
> which we're just ignoring. We probably shouldn't.
>
> Reparse points can exist on both files and directories,
> but we don't (currently) support them and just ignore
> requests for them in the server.
>
> Note we didn't return the FILE_ATTRIBUTE_REPARSE_POINT 0x0400
> value in the attributes, so the client shouldn't be doing
> that.
>
> We should probably return NT_STATUS_NOT_A_REPARSE_POINT
> on the create request here. Note if specifically asked
> FSCTL_GET_REPARSE_POINT we do already return NT_STATUS_NOT_A_REPARSE_PO=
INT.
>
> Let me know if you can reproduce this, at will, I
> can send you a test patch.
>
> Jeremy.
>
Hi Jeremy, could it have anything to do with this:

https://bugzilla.samba.org/show_bug.cgi?id=3D14101

Rowland





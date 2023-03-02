Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 991AE6A78B7
	for <lists+samba-technical@lfdr.de>; Thu,  2 Mar 2023 02:11:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=tkfFAt3Uzj4OgaaHVXXSt4nx8F/Jz1k/e4PiIp48KPo=; b=tP4M5/XDHTZsfoD3b2sbWtDUua
	zzpOEm01Xit0cjQGVdEQ8MFicvAqUKLu5Y0zGMsbXtk90Uczdqv9HqtlA2zOfFyfUTa6YHeBwPtpi
	WXzmJ82PHzBsO33Zjf7C+9fFDtPNNp/3lVoc6e/6luTq6TmhaUNqY0h+Ysa+mS8psWVHyHoGo7h/c
	YiQjwtELMIKkhjDf5MHYfgh8KrBh70EMx/LFti4l5g5iLEr+CTSQvkA5b+z9IekHUvk97nLSrsIsC
	jRB/o8C3qQ3ImeJuNVOMziAvkqKGimsbmWo8NqVX/KYi7ITyVLZWuet/uYLROX/1lrBLv7K0ON66z
	0PBkxIaw==;
Received: from ip6-localhost ([::1]:50474 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pXXSr-00Gn03-FZ; Thu, 02 Mar 2023 01:10:33 +0000
Received: from postal1.et.byu.edu ([128.187.48.31]:52708) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pXXSl-00Gmzt-5h
 for samba-technical@lists.samba.org; Thu, 02 Mar 2023 01:10:30 +0000
Received: from localhost (localhost [127.0.0.1])
 by postal1.et.byu.edu (Postfix) with ESMTP id 95FCF5EE9D
 for <samba-technical@lists.samba.org>; Wed,  1 Mar 2023 17:51:55 -0700 (MST)
Received: from postal1.et.byu.edu ([127.0.0.1])
 by localhost (postal1.et.byu.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DgN1nwdj6L3W for <samba-technical@lists.samba.org>;
 Wed,  1 Mar 2023 17:51:55 -0700 (MST)
Received: from [10.35.115.17] (magrathea.et.byu.edu [10.35.115.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by postal1.et.byu.edu (Postfix) with ESMTPSA id 12D6B5EE9B
 for <samba-technical@lists.samba.org>; Wed,  1 Mar 2023 17:51:55 -0700 (MST)
Message-ID: <a594f91e-6dc9-79ca-8e88-32531668aa18@byu.edu>
Date: Wed, 1 Mar 2023 17:51:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: filesystems mounted within an SMB share and
 REPARSE_TAG_MOUNT_POINT
Content-Language: en-US
To: samba-technical@lists.samba.org
References: <CAB5c7xqGsk9sVE-VH7=Q_A3eCntO-0BDDs1+f_+gQbtxfLU2wQ@mail.gmail.com>
 <Y/+iwsLNkXEzLzu8@jeremy-acer>
In-Reply-To: <Y/+iwsLNkXEzLzu8@jeremy-acer>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
From: Daniel Fussell via samba-technical <samba-technical@lists.samba.org>
Reply-To: Daniel Fussell <dfussell@byu.edu>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 3/1/23 12:08, Jeremy Allison via samba-technical wrote:
> On Wed, Feb 22, 2023 at 03:30:04PM -0600, Andrew Walker via 
> samba-technical wrote:
>> I was recently reviewing fileid behavior in Samba for ZFS datasets 
>> mounted
>> within an SMB share and decided to see how a Windows server handles 
>> such a
>> situation (by mounting a separate NTFS volume within an SMB share on 
>> Server
>> 2022 and poking around at it). I can provide pcaps for the morbidly 
>> curious.
>>
>> SUBDS on Windows Server:
>> ```
>> PS C:\SHARE> Get-Item .\SUBDS | format-list
>>
>>
>>    Directory: C:\SHARE
>>
>>
>>
>> Name           : SUBDS
>> CreationTime   : 2/22/2023 10:45:52 AM
>> LastWriteTime  : 2/22/2023 10:45:52 AM
>> LastAccessTime : 2/22/2023 10:45:52 AM
>> Mode           : d----l
>> LinkType       : Junction
>> Target         : {Volume{5afcf2e4-f78f-4931-bfb1-a657a2577d06}\}
>> ```
>>
>> SMB2 QUERY_DIRECTORY with FileIdBothDirectoryInfo has
>> FILE_ATTRIBUTE_REPARSE_POINT set as well as REPARSE_TAG_MOUNT_POINT.
>> ```
>> FileIdBothDirectoryInfo: SUBDS
>>    Next Offset: 0
>>    File Index: 0x00000000
>>    Create: Feb 22, 2023 10:45:52.500407200 Pacific Standard Time
>>    Last Access: Feb 22, 2023 10:45:52.500407200 Pacific Standard Time
>>    Last Write: Feb 22, 2023 10:45:52.500407200 Pacific Standard Time
>>    Last Change: Feb 22, 2023 10:45:56.880741900 Pacific Standard Time
>>    End Of File: 0
>>    Allocation Size: 0
>>    File Attributes: 0x00000410
>>    Filename Length: 10
>>    Reparse Tag: REPARSE_TAG_MOUNT_POINT (0xa0000003)
>>    Short Name Length: 0
>>    Reserved: 00
>>    Reserved: 0000
>>    File Id: 0x001e00000000b590
>>    Filename: SUBS
>> ```
>>
>> FILE_ATTRIBUTE_REPARSE_POINT is also set in File Attributes on SMB2 
>> CREATE
>> response.
>>
>> Samba currently uses the device ID and inode number to generate 
>> 64-bit file
>> ids in subordinate filesystems within an SMB share, but it seems like 
>> this
>> can lead to potential collisions. Windows, for instance, appears to 
>> make no
>> change to the 64-bit file IDs returned for NTFS volumes mounted 
>> within an
>> SMB share.
>>
>> So this is a long way of asking, should we be flagging mounted 
>> filesystems
>> as reparse points and not altering the inode numbers?
>>
>> The advantages of this are:
>> 1. Windows File Explorer GUI clearly labels as a mounted filesystem 
>> and not
>> a directory
>> 2. Windows File Explorer GUI clearly shows size of the filesystem
>> separately from one being shared.
>> 3. REPARSE_TAG_MOUNT_POINT can be used by SMB clients to judge 
>> whether the
>> particular fileid should maybe be treated differently (since it may 
>> collide
>> with other volume mountpoints). (not sure if any non-MS clients do 
>> this).
>
> Very interesting findings Andrew, thanks !
>
> This does indeed look like the correct way forward to cope
> with traversing mount points, but the devil (as always) is
> in the details.
>
> Prototype code for this would be the next step IMHO.
>
> Jeremy.
>

I've got a new student employee forward-porting our patch from late 
2018/early 2019 for mountpoint detection and setting 
REPARSE_TAG_MOUNT_POINT.

Our first porting attempt didn't seem to work, I'm guessing because of 
the rewite to use *at() and different code paths.  We'd love to work 
with you on this.

Daniel


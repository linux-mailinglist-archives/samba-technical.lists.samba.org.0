Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 808366A7410
	for <lists+samba-technical@lfdr.de>; Wed,  1 Mar 2023 20:09:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=66ZAOLDf9rBo07IWLRJxTZ4A1KirocI3N4MCMr+HZ6U=; b=ajfDxc808jEWz/lbQqeXSrBO0+
	sU3PCq7h5GGISc1eMAGBUVT08FPQxXgiYUI2mLGrYOkzw0M0XZsOULqwxsx68LbOvCXa+8M4OBTyV
	vPbSeqcpuwpVeSRMexcIVR8oDdMbUMsa/XcQPs3Ug7LClMqH0H0/cZ/YobzRbBMT7v/DxX6QqGgCU
	z/up7TYGthFWbnoFzGeuAp5rx3/o4DeyVeCv4LjLPikttft4c+X44//0Iz3rfdsXR9cLV80ZVUkff
	j47rEyXROEFVSMZt7NWhT2EVI6gvpSieVqhxMm1gjN5HSfiGCIPJ/l4jjcNSsBcUXXnv+mxGBXHMi
	N4/13dPA==;
Received: from ip6-localhost ([::1]:57750 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pXRow-00Ghvg-Sc; Wed, 01 Mar 2023 19:08:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38368) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pXRos-00GhvW-Fw
 for samba-technical@lists.samba.org; Wed, 01 Mar 2023 19:08:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=66ZAOLDf9rBo07IWLRJxTZ4A1KirocI3N4MCMr+HZ6U=; b=fA+BzoFrk5yY7ed+GU5kcg2gNM
 f0wDQf5lVDOAZRhYPdhr3+WY7akqQjF1+oG+Z2jhe6sYmJKUop/38V3JSOV3bY3u77J92HnwEISK3
 gI2qQV77oweKw7W6NSO8jnsrH+iiLWBSTeC6Med/Ma2wuSN+PRhS45dnxPaJpPikEqBMZlnK15Ku5
 kFjQ99iP06ejjpNN0JUDzM69XZHIK/0Zc8qn9XZKYwsVG1wHaPTfiVd/L263xVmSsukjzS96gfK4z
 ZK1mFeB92iTX8RDul0nHn9bMK++HRl20HI8l3WatW+lTPWhJLcN5iACcIHz9WKhHcZ9ZKYnGzTigw
 D+zpC4UuHcLn9JXwAshuUhndZa78vWPck8F449lwMnroRcn5HM014jRhc1QjqnwbmodP13k8y7bxG
 Uj/c487ZOPGdVnEM/fx+oNoprjH+LCNpRKnfwzWCl+WnchsXGIg8qM7/Svf/r/WbQmMd3d3WtnVvt
 ZoHGvYhZFSlms1zH5YSn34ni;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pXRoq-00HGIr-Ig; Wed, 01 Mar 2023 19:08:52 +0000
Date: Wed, 1 Mar 2023 11:08:50 -0800
To: Andrew Walker <awalker@ixsystems.com>
Subject: Re: filesystems mounted within an SMB share and
 REPARSE_TAG_MOUNT_POINT
Message-ID: <Y/+iwsLNkXEzLzu8@jeremy-acer>
References: <CAB5c7xqGsk9sVE-VH7=Q_A3eCntO-0BDDs1+f_+gQbtxfLU2wQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAB5c7xqGsk9sVE-VH7=Q_A3eCntO-0BDDs1+f_+gQbtxfLU2wQ@mail.gmail.com>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Feb 22, 2023 at 03:30:04PM -0600, Andrew Walker via samba-technical wrote:
>I was recently reviewing fileid behavior in Samba for ZFS datasets mounted
>within an SMB share and decided to see how a Windows server handles such a
>situation (by mounting a separate NTFS volume within an SMB share on Server
>2022 and poking around at it). I can provide pcaps for the morbidly curious.
>
>SUBDS on Windows Server:
>```
>PS C:\SHARE> Get-Item .\SUBDS | format-list
>
>
>    Directory: C:\SHARE
>
>
>
>Name           : SUBDS
>CreationTime   : 2/22/2023 10:45:52 AM
>LastWriteTime  : 2/22/2023 10:45:52 AM
>LastAccessTime : 2/22/2023 10:45:52 AM
>Mode           : d----l
>LinkType       : Junction
>Target         : {Volume{5afcf2e4-f78f-4931-bfb1-a657a2577d06}\}
>```
>
>SMB2 QUERY_DIRECTORY with FileIdBothDirectoryInfo has
>FILE_ATTRIBUTE_REPARSE_POINT set as well as REPARSE_TAG_MOUNT_POINT.
>```
>FileIdBothDirectoryInfo: SUBDS
>    Next Offset: 0
>    File Index: 0x00000000
>    Create: Feb 22, 2023 10:45:52.500407200 Pacific Standard Time
>    Last Access: Feb 22, 2023 10:45:52.500407200 Pacific Standard Time
>    Last Write: Feb 22, 2023 10:45:52.500407200 Pacific Standard Time
>    Last Change: Feb 22, 2023 10:45:56.880741900 Pacific Standard Time
>    End Of File: 0
>    Allocation Size: 0
>    File Attributes: 0x00000410
>    Filename Length: 10
>    Reparse Tag: REPARSE_TAG_MOUNT_POINT (0xa0000003)
>    Short Name Length: 0
>    Reserved: 00
>    Reserved: 0000
>    File Id: 0x001e00000000b590
>    Filename: SUBS
>```
>
>FILE_ATTRIBUTE_REPARSE_POINT is also set in File Attributes on SMB2 CREATE
>response.
>
>Samba currently uses the device ID and inode number to generate 64-bit file
>ids in subordinate filesystems within an SMB share, but it seems like this
>can lead to potential collisions. Windows, for instance, appears to make no
>change to the 64-bit file IDs returned for NTFS volumes mounted within an
>SMB share.
>
>So this is a long way of asking, should we be flagging mounted filesystems
>as reparse points and not altering the inode numbers?
>
>The advantages of this are:
>1. Windows File Explorer GUI clearly labels as a mounted filesystem and not
>a directory
>2. Windows File Explorer GUI clearly shows size of the filesystem
>separately from one being shared.
>3. REPARSE_TAG_MOUNT_POINT can be used by SMB clients to judge whether the
>particular fileid should maybe be treated differently (since it may collide
>with other volume mountpoints). (not sure if any non-MS clients do this).

Very interesting findings Andrew, thanks !

This does indeed look like the correct way forward to cope
with traversing mount points, but the devil (as always) is
in the details.

Prototype code for this would be the next step IMHO.

Jeremy.


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B206A7651
	for <lists+samba-technical@lfdr.de>; Wed,  1 Mar 2023 22:46:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=0tqus9qzaroeRLqYnfohVEP4lGrK6nI740dYx8Lc/7o=; b=J+ncqff9Q5+JOy84JXMi9c/ocP
	7pvmCVsJEk3duignbySEd41Jq6WecnrDchOPzi8M8F5FxebUC6uvJOCYvJF7Ll5Je/5aQTZMlN5T3
	fHrp6eZHd014qTcgyXzmJku1ts94zlqYOHB35gGtD7o1dG7lBQYw5xAY3sUYH4uY09OOepOcaQdo1
	LHk9wAAj75zXM1cr8bHJYLHug4YJKTSPTLlvX+D8836y0GYoe8u9NeoUpAFcB0xgU5HXjRbSRg/a0
	m9OkZtOjCqmE5jSb0rf45Qo6ALL+jSGLCQJE0lWacnVOCkqL+KLEseg18VLyDRcoxm4hLfhHdPiqD
	ANGJ3amw==;
Received: from ip6-localhost ([::1]:65448 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pXUHJ-00GkBs-57; Wed, 01 Mar 2023 21:46:25 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:35798) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pXUHD-00GkAh-FE
 for samba-technical@lists.samba.org; Wed, 01 Mar 2023 21:46:22 +0000
Received: by mail-pf1-x431.google.com with SMTP id ay18so8906742pfb.2
 for <samba-technical@lists.samba.org>; Wed, 01 Mar 2023 13:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google; t=1677707177;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xAh2p/XFdXV4cr/o3UU3DSVkz1tpzcAm8zBQ1UUIvJQ=;
 b=BSAJcyq3p4pdyKVVUGkejTklBXzWJETbcXC5H/rMkybFS2bkPRwrFpdPv0FeWN9V5C
 +956nkj/N0eZp1/BTUG7/TU5hf0UcwvFTWw8i1x74xqDb16d20N7+ciLFhfjkBgDHVkK
 3meRJgowliZAgNHFdYlcQ+sTUbo1TIgQuvJkpxvzQRLHWtR2vMdl0XvrcJ5/lYipU7DA
 XYpb8v6h0PdnTmMkxIjCaR/JUx9tqd7McSg8XpwAULEDNwPN1UBDnXZwcM43aqUzCLci
 2ztqShXDAcVrzrH5Oxk/axNWDnoK3DGsejkMGXpFISMoNH6kZxWNeny4d1d8RA+dBVst
 K9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677707177;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xAh2p/XFdXV4cr/o3UU3DSVkz1tpzcAm8zBQ1UUIvJQ=;
 b=gzWwBh2i9L1bDbnoaBSyQjaY9jie0Jjl+8PqQ6mRkPoNs3euyHaUer747k/c3Nlzno
 AdXb2j6XOjnwaYqJw3y2pmbQ0sZOWnYCLg3QhCzY4e/hrsac8UKpyeDD5OcsbrmTi2tw
 nCGi+9NZvreAvmyZlcaMkgnlm5VnncqDun2ec9C48HwSYwT2I1zSR2EeXtv7i5Mp639E
 rgHKfUFIxoIld48sSnz0kC3W4oo7eOQjGYKg5+vGdfuIDtUx/NmwJZ+yTFPuOX/zmX3z
 sY0qsStTHtRRWszKAbcxV2SU3ib6FwLej6WTu8ZqlJdXIOZJCBkHirqB78SE3IISaMul
 TSdg==
X-Gm-Message-State: AO0yUKXLjH1w3Iqk5DFDOoMlSVI8Ezt9hNCfUzYgrhob60JGWTa8RE1H
 WbuQukS5UDUmSiShJqfoMZlNfkdbrChmYH2K1E2lHAFOdiupHTzHpvI=
X-Google-Smtp-Source: AK7set93ffFuWlXTG4bCTlJFaLW7HIOvZTbWKaJoosUaIUIq38v3x3z+6aMPA52jBIxg59DXZAjrf51VorkzonbOads=
X-Received: by 2002:a05:6a00:1715:b0:593:da6f:fb1c with SMTP id
 h21-20020a056a00171500b00593da6ffb1cmr2992664pfc.4.1677707176902; Wed, 01 Mar
 2023 13:46:16 -0800 (PST)
MIME-Version: 1.0
References: <CAB5c7xqGsk9sVE-VH7=Q_A3eCntO-0BDDs1+f_+gQbtxfLU2wQ@mail.gmail.com>
 <Y/+iwsLNkXEzLzu8@jeremy-acer>
In-Reply-To: <Y/+iwsLNkXEzLzu8@jeremy-acer>
Date: Wed, 1 Mar 2023 16:46:06 -0500
Message-ID: <CAB5c7xqQZXPFN_-+AR6+kAVO=2b8+sUMTSiZh6O9thOn82FVTg@mail.gmail.com>
Subject: Re: filesystems mounted within an SMB share and
 REPARSE_TAG_MOUNT_POINT
To: Jeremy Allison <jra@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Mar 1, 2023 at 2:08=E2=80=AFPM Jeremy Allison <jra@samba.org> wrote=
:

> On Wed, Feb 22, 2023 at 03:30:04PM -0600, Andrew Walker via
> samba-technical wrote:
> >I was recently reviewing fileid behavior in Samba for ZFS datasets mount=
ed
> >within an SMB share and decided to see how a Windows server handles such=
 a
> >situation (by mounting a separate NTFS volume within an SMB share on
> Server
> >2022 and poking around at it). I can provide pcaps for the morbidly
> curious.
> >
> >SUBDS on Windows Server:
> >```
> >PS C:\SHARE> Get-Item .\SUBDS | format-list
> >
> >
> >    Directory: C:\SHARE
> >
> >
> >
> >Name           : SUBDS
> >CreationTime   : 2/22/2023 10:45:52 AM
> >LastWriteTime  : 2/22/2023 10:45:52 AM
> >LastAccessTime : 2/22/2023 10:45:52 AM
> >Mode           : d----l
> >LinkType       : Junction
> >Target         : {Volume{5afcf2e4-f78f-4931-bfb1-a657a2577d06}\}
> >```
> >
> >SMB2 QUERY_DIRECTORY with FileIdBothDirectoryInfo has
> >FILE_ATTRIBUTE_REPARSE_POINT set as well as REPARSE_TAG_MOUNT_POINT.
> >```
> >FileIdBothDirectoryInfo: SUBDS
> >    Next Offset: 0
> >    File Index: 0x00000000
> >    Create: Feb 22, 2023 10:45:52.500407200 Pacific Standard Time
> >    Last Access: Feb 22, 2023 10:45:52.500407200 Pacific Standard Time
> >    Last Write: Feb 22, 2023 10:45:52.500407200 Pacific Standard Time
> >    Last Change: Feb 22, 2023 10:45:56.880741900 Pacific Standard Time
> >    End Of File: 0
> >    Allocation Size: 0
> >    File Attributes: 0x00000410
> >    Filename Length: 10
> >    Reparse Tag: REPARSE_TAG_MOUNT_POINT (0xa0000003)
> >    Short Name Length: 0
> >    Reserved: 00
> >    Reserved: 0000
> >    File Id: 0x001e00000000b590
> >    Filename: SUBS
> >```
> >
> >FILE_ATTRIBUTE_REPARSE_POINT is also set in File Attributes on SMB2 CREA=
TE
> >response.
> >
> >Samba currently uses the device ID and inode number to generate 64-bit
> file
> >ids in subordinate filesystems within an SMB share, but it seems like th=
is
> >can lead to potential collisions. Windows, for instance, appears to make
> no
> >change to the 64-bit file IDs returned for NTFS volumes mounted within a=
n
> >SMB share.
> >
> >So this is a long way of asking, should we be flagging mounted filesyste=
ms
> >as reparse points and not altering the inode numbers?
> >
> >The advantages of this are:
> >1. Windows File Explorer GUI clearly labels as a mounted filesystem and
> not
> >a directory
> >2. Windows File Explorer GUI clearly shows size of the filesystem
> >separately from one being shared.
> >3. REPARSE_TAG_MOUNT_POINT can be used by SMB clients to judge whether t=
he
> >particular fileid should maybe be treated differently (since it may
> collide
> >with other volume mountpoints). (not sure if any non-MS clients do this)=
.
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

I'm still slowly investigating things related to this, but it's pretty
clear that nesting submounts in Windows Server can cause problems for the
Linux SMB client

 ```
PS C:\SHARE> fsutil file queryFileID SUBDS/foo
File ID is 0x00000000000000000001000000000026
PS C:\SHARE> fsutil file queryFileID .\SUBDS3\TESTFOLDER\
File ID is 0x00000000000000000001000000000026
```

I generated directories with duplicate file ids (SHARE\SUBDS\foo and
SHARE\SUBDS3\TESTFOLDER) within the SMB share in Windows. The Linux SMB
client gives them the same inode number.

```
root@truenas[/tmpcifs]# stat SUBDS/foo
  File: SUBDS/foo
  Size: 0         Blocks: 0          IO Block: 1048576 directory
Device: 5eh/94d Inode: 281474976710694  Links: 2
Access: (0755/drwxr-xr-x)  Uid: (    0/    root)   Gid: (    0/    root)
Access: 2023-03-01 13:13:42.425159200 -0800
Modify: 2023-03-01 13:13:42.425159200 -0800
Change: 2023-03-01 13:13:42.425159200 -0800
 Birth: 2023-02-22 10:49:37.331907600 -0800

root@truenas[/tmpcifs]# stat SUBDS3/TESTFOLDER
  File: SUBDS3/TESTFOLDER
  Size: 0         Blocks: 0          IO Block: 1048576 directory
Device: 5eh/94d Inode: 281474976710694  Links: 2
Access: (0755/drwxr-xr-x)  Uid: (    0/    root)   Gid: (    0/    root)
Access: 2023-03-01 12:25:56.283589300 -0800
Modify: 2023-03-01 12:25:56.268165700 -0800
Change: 2023-03-01 12:25:56.268165700 -0800
 Birth: 2023-03-01 11:48:09.617084100 -0800
```

I think handling for submounts will probably need to be fixed in Linux
clients as well.

Andrew

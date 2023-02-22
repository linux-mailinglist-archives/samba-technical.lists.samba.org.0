Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 057AC69FDBA
	for <lists+samba-technical@lfdr.de>; Wed, 22 Feb 2023 22:31:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=nNTIFi6MhlBIuQ8mIq64g+uGOz53+1EkouB5Q4G/LJA=; b=BfXWEidzU2dktjoi/p27zN5E9I
	AKk4CaFvyM9ldRQxqtxcbI16Wo/4tLtwtTn1yGpebDB4iHratnNKMKYMa2Y2pQM6+a04ww1Q+hSV+
	tirE0krrJ2R9OwFuqa0fl++IHtq1tht9XVlW0orsFVrxmXss4ltykDwTY8EJBNjn9kpHehup1rlQT
	G3dPaKnUxe3yujf2flnUVIR4AGBn5O+f9DS00j5oP/Fg92uj7NgjXa2o+G9Ph2yflZy7ew+ibGa/U
	RTmqMOaVgoN9GpwErouUQLJ9KLDVgMR99YfDvxm6bYxzkMqTBNls4mtiy4w9IoZvcCnJdLd6GefrJ
	4iTzZO/Q==;
Received: from ip6-localhost ([::1]:39816 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pUwgz-00DfUR-0J; Wed, 22 Feb 2023 21:30:25 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:38844) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pUwgs-00DfUH-4W
 for samba-technical@lists.samba.org; Wed, 22 Feb 2023 21:30:22 +0000
Received: by mail-pl1-x634.google.com with SMTP id q11so10792952plx.5
 for <samba-technical@lists.samba.org>; Wed, 22 Feb 2023 13:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=7waWVqs0bkd//JO4zF236ieA6spG+YarLhEyB4R+8Mk=;
 b=buc4QFSeCTpGTQzlELLcJpp4wh8XcNDON2KtGuNRHMhPrCMfPJwjvs16VveEIWqA2r
 QlT4SnEnslX6w0Cu+xy9gNQY/5gC3MT1aQQfLzGQMWiNqn6y6CPGeAje9+SSQimme/ZI
 M9xBKf2fHKJrfH+YX1OUm10j6OZ/naOVLk5+7Udx5UD34wfaSrTONYt04PODoHkMAN1G
 6tv8gmTs+qbfrdiOrPSNW66TOzAZSzUJklfNsABc/Ew1OMl7QoZWUCDe7kaXV71ZM2yD
 lrw6uIp32PpZ4vaPgRX0QXQhj3H/2orPuIdDxWVf8bCbBtwq6tdwgMT2foGJ/5PF4pAT
 xffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7waWVqs0bkd//JO4zF236ieA6spG+YarLhEyB4R+8Mk=;
 b=V34osKI6/0OCqJfICliRCWycRK2AnT9n7JyFsYbFH7BVS8u2Ls2ATjs3fS4GSMS0AB
 +SClGK85ANNZCjIEd2zlkShQpvNjaf3vj/Bb1SYwWj2NNPCGVWmeqxLUTSiBEwKFkth5
 KoXKEX9d+YOrosJtdWJXSunEcrW1IwQwlgQSO1qOnjWwFm+xl/1xDEDpQyXwLnemdnBx
 x5w01GJQCa3NWAyV4j11YcvHYpWjmq55XC9ZgmouTsiGGSzRY+hpDYo/m4V/3GmiVQBL
 dHnmGJzGk5sBLc0f7inb45jwFtUG1q7JL0eHH767dUlyPsKbgFoVwE0GqQr2vrsNCosA
 Z5fw==
X-Gm-Message-State: AO0yUKUujhc71DR3cxKLVQ6xEOtMc7mUr+ifyvHjanskvKt00uuXakow
 /dklUdruV/yPgS908axGFJPXjt63f+//P49xVHKiqkTObuOz/m2RQG8=
X-Google-Smtp-Source: AK7set+F+kws22zJT5UB6kbxFkqG13xPW8tPsUJpozlGHkWKFfmSP6G3udTssj7c1+Y/Tjp03AVEN3O2ezybpjc5Wqk=
X-Received: by 2002:a17:90b:1c8c:b0:237:3d0c:89b1 with SMTP id
 oo12-20020a17090b1c8c00b002373d0c89b1mr943090pjb.77.1677101414934; Wed, 22
 Feb 2023 13:30:14 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 22 Feb 2023 15:30:04 -0600
Message-ID: <CAB5c7xqGsk9sVE-VH7=Q_A3eCntO-0BDDs1+f_+gQbtxfLU2wQ@mail.gmail.com>
Subject: filesystems mounted within an SMB share and REPARSE_TAG_MOUNT_POINT
To: samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I was recently reviewing fileid behavior in Samba for ZFS datasets mounted
within an SMB share and decided to see how a Windows server handles such a
situation (by mounting a separate NTFS volume within an SMB share on Server
2022 and poking around at it). I can provide pcaps for the morbidly curious.

SUBDS on Windows Server:
```
PS C:\SHARE> Get-Item .\SUBDS | format-list


    Directory: C:\SHARE



Name           : SUBDS
CreationTime   : 2/22/2023 10:45:52 AM
LastWriteTime  : 2/22/2023 10:45:52 AM
LastAccessTime : 2/22/2023 10:45:52 AM
Mode           : d----l
LinkType       : Junction
Target         : {Volume{5afcf2e4-f78f-4931-bfb1-a657a2577d06}\}
```

SMB2 QUERY_DIRECTORY with FileIdBothDirectoryInfo has
FILE_ATTRIBUTE_REPARSE_POINT set as well as REPARSE_TAG_MOUNT_POINT.
```
FileIdBothDirectoryInfo: SUBDS
    Next Offset: 0
    File Index: 0x00000000
    Create: Feb 22, 2023 10:45:52.500407200 Pacific Standard Time
    Last Access: Feb 22, 2023 10:45:52.500407200 Pacific Standard Time
    Last Write: Feb 22, 2023 10:45:52.500407200 Pacific Standard Time
    Last Change: Feb 22, 2023 10:45:56.880741900 Pacific Standard Time
    End Of File: 0
    Allocation Size: 0
    File Attributes: 0x00000410
    Filename Length: 10
    Reparse Tag: REPARSE_TAG_MOUNT_POINT (0xa0000003)
    Short Name Length: 0
    Reserved: 00
    Reserved: 0000
    File Id: 0x001e00000000b590
    Filename: SUBS
```

FILE_ATTRIBUTE_REPARSE_POINT is also set in File Attributes on SMB2 CREATE
response.

Samba currently uses the device ID and inode number to generate 64-bit file
ids in subordinate filesystems within an SMB share, but it seems like this
can lead to potential collisions. Windows, for instance, appears to make no
change to the 64-bit file IDs returned for NTFS volumes mounted within an
SMB share.

So this is a long way of asking, should we be flagging mounted filesystems
as reparse points and not altering the inode numbers?

The advantages of this are:
1. Windows File Explorer GUI clearly labels as a mounted filesystem and not
a directory
2. Windows File Explorer GUI clearly shows size of the filesystem
separately from one being shared.
3. REPARSE_TAG_MOUNT_POINT can be used by SMB clients to judge whether the
particular fileid should maybe be treated differently (since it may collide
with other volume mountpoints). (not sure if any non-MS clients do this).

Andrew

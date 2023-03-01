Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6776A7726
	for <lists+samba-technical@lfdr.de>; Wed,  1 Mar 2023 23:59:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=AT9MjNWRaS8btcFj8anwFPHqpyD9J01utD/Bmbif0lk=; b=SkBBfjB53UCJtSSJD2IlHNXxgA
	JY4c41mjvDuWNzrwLL3DBEAO7kFmzmAeGTPmIaQSdMmgUkarujfX3EQxNQ/81AVy3cOQwoJ29avoz
	SeAuX4SNq5B1Pd1oBTJH2yk2md5/WUdC6JXZrniwFYmMKuJZUybsXZ0r8KeFr2ZR6LQ6oF/ErgG8v
	DLiMcJ9jtpvTBtXOMRpT7tIxikd6fY8YDCTj5ycqutX0j7FBC5jk8rjBsVKm2AcZ/BN/eCI/2qEga
	xoL/zxiRburz67DT2iJTXSa2G4vu+CYeS6RetkhUIZNuDaOtp/nwe3bitIfsKKgIQjO5BVEpCf+Oh
	dHrDW/6A==;
Received: from ip6-localhost ([::1]:41120 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pXVPV-00GmOB-Mp; Wed, 01 Mar 2023 22:58:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26406) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pXVPQ-00GmO2-Oq
 for samba-technical@lists.samba.org; Wed, 01 Mar 2023 22:58:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=AT9MjNWRaS8btcFj8anwFPHqpyD9J01utD/Bmbif0lk=; b=t9xhpnAjbSAVjALwWw8ISqQClc
 Mgh3+LwtFqUNemsMf0Qx/3QuwmrSw9G4HqZhV1lVRps5sYtSQoYh6KBbGffUL1V29anFQxyuxKrp8
 ry9vWj/7GS1MOEClKnn0Ua2mEkxy7ekHDbWv8qf1f77IWKgxoj1iE1AK+qE1gTVqdiNqJb6HyWL0P
 RP52bjYOxMdFnLg2cMPLwJEgd3ppUaEzw0OM4wmTiiT1j57b6gxelvt+KeRcbtgbgPAeycnkV/eau
 8Fp0lb7ylF/klgGUhW6th7mjEiEl+NCjo1x4bWs6gBS+AwlcuBHeB8HK5Yr2EUnxSMxCQE+2KG7nF
 mwDxYmsJdJBwclyKXIP1gTsNXSOjjDGuvucx3ONZ1PMLqaGJxZP9wKf63Zqnrgb8pMkVlQul0/Lcu
 +zYqsdg44q9pbjnxwbWf/TLclUqviJ0oXpBlC3J7BtdVzcSHgOqQICxPOuf3mHETo/8XrBxaGq2Hb
 I4S4TSxAPTGZ5rRIoGj8eG+C;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pXVPP-00HJ1f-PY; Wed, 01 Mar 2023 22:58:52 +0000
Date: Wed, 1 Mar 2023 14:58:49 -0800
To: Andrew Walker <awalker@ixsystems.com>
Subject: Re: filesystems mounted within an SMB share and
 REPARSE_TAG_MOUNT_POINT
Message-ID: <Y//YqUpNatg71C/j@jeremy-acer>
References: <CAB5c7xqGsk9sVE-VH7=Q_A3eCntO-0BDDs1+f_+gQbtxfLU2wQ@mail.gmail.com>
 <Y/+iwsLNkXEzLzu8@jeremy-acer>
 <CAB5c7xqQZXPFN_-+AR6+kAVO=2b8+sUMTSiZh6O9thOn82FVTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAB5c7xqQZXPFN_-+AR6+kAVO=2b8+sUMTSiZh6O9thOn82FVTg@mail.gmail.com>
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

On Wed, Mar 01, 2023 at 04:46:06PM -0500, Andrew Walker via samba-technical wrote:
>
>I'm still slowly investigating things related to this, but it's pretty
>clear that nesting submounts in Windows Server can cause problems for the
>Linux SMB client
>
> ```
>PS C:\SHARE> fsutil file queryFileID SUBDS/foo
>File ID is 0x00000000000000000001000000000026
>PS C:\SHARE> fsutil file queryFileID .\SUBDS3\TESTFOLDER\
>File ID is 0x00000000000000000001000000000026
>```
>
>I generated directories with duplicate file ids (SHARE\SUBDS\foo and
>SHARE\SUBDS3\TESTFOLDER) within the SMB share in Windows. The Linux SMB
>client gives them the same inode number.
>
>```
>root@truenas[/tmpcifs]# stat SUBDS/foo
>  File: SUBDS/foo
>  Size: 0         Blocks: 0          IO Block: 1048576 directory
>Device: 5eh/94d Inode: 281474976710694  Links: 2
>Access: (0755/drwxr-xr-x)  Uid: (    0/    root)   Gid: (    0/    root)
>Access: 2023-03-01 13:13:42.425159200 -0800
>Modify: 2023-03-01 13:13:42.425159200 -0800
>Change: 2023-03-01 13:13:42.425159200 -0800
> Birth: 2023-02-22 10:49:37.331907600 -0800
>
>root@truenas[/tmpcifs]# stat SUBDS3/TESTFOLDER
>  File: SUBDS3/TESTFOLDER
>  Size: 0         Blocks: 0          IO Block: 1048576 directory
>Device: 5eh/94d Inode: 281474976710694  Links: 2
>Access: (0755/drwxr-xr-x)  Uid: (    0/    root)   Gid: (    0/    root)
>Access: 2023-03-01 12:25:56.283589300 -0800
>Modify: 2023-03-01 12:25:56.268165700 -0800
>Change: 2023-03-01 12:25:56.268165700 -0800
> Birth: 2023-03-01 11:48:09.617084100 -0800
>```
>
>I think handling for submounts will probably need to be fixed in Linux
>clients as well.

Great catch ! Thanks for forwarding that to the Linux client lists.


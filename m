Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 664CE5F7D7D
	for <lists+samba-technical@lfdr.de>; Fri,  7 Oct 2022 20:46:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=y0qJdBpFRY8u6oxcJ7SPkZ95xrVdgpG091ue8oeu4E8=; b=x/h3Mf3O7QO29Xi1qIPyZAuZS/
	RUjm377JuHCq31o7UlfmYSoIVrOqKYVLuZijPv7s/7EQzQGFN41mTCERh4FmGlrJGt3TDWC7scvJN
	y7h1kRDdXgiIqsDRBGCa0KsPiPoNzeDUz93NI81S/s1/IE79NRSjlU49peIZsOfqixX9XjVykDxj7
	U2ePp/GzOj0hIHjqrXQTfigHR2WweeMyTQ5Z6BAAGLkTp7BZR2ugHkj/jP/cxanum2fKdmJ7cxG4V
	/+FBLvuS22Ke+4FkPy3V/NgnnCbkNpAQV80ATbLIcCZ/W9lnCTDPSbzklGRb0bP4dZHcjR5u/qE/T
	tlYk0/0Q==;
Received: from ip6-localhost ([::1]:46280 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ogsMQ-000hJX-Iu; Fri, 07 Oct 2022 18:46:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55188) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ogsMK-000hJO-2N
 for samba-technical@lists.samba.org; Fri, 07 Oct 2022 18:46:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=y0qJdBpFRY8u6oxcJ7SPkZ95xrVdgpG091ue8oeu4E8=; b=lDomCSg5N+uO28dyHpcmlopcEx
 1g+WuloCEN7PQ7dzKEGluA+qZJJQ9X0+q4u+iXM8h2CEI4clOGnwaowoGIelcH4Aipn4buY2O8vgY
 aOGtTemNT//m4luF862nEj4qOAv8hQvkyAautsHxGMsUDV/0tCq2SNx24fCWD29skD9369/S1DJwV
 247taLHZNpvLJsPmNF15gTXU0oXPrnzv4BupwrgTcrzATLbSwZ8E4wpC1xBN8SzdGZ+QD28591V5c
 9otdgPoO9Vf1VJ3ZjnHpqPfcFiSlyY4vrhkvkPN5EGgmbhaCmAwoApxtVKlQkEdoUK8vZefkOmB31
 YU+Yuo3o/jhaSsPv3hOeOwFG2UeCUQ9IPX1q3UEPvMxUInWDdaB1X1FfazL7eDE/lquq42iSYeL9T
 rxXBwDhxAvLQXPD5tO8LQh5FdMy6UbRFtO0AarRBTMq35AtlwRFJxW4rSChvk2wZ9y+leXPoP9+R4
 KfK/+L1twub+HUvir5SN0WGV;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ogsMI-003Pvt-GU; Fri, 07 Oct 2022 18:46:06 +0000
Message-ID: <2e568231-998e-1399-9873-ccda8d79385d@samba.org>
Date: Fri, 7 Oct 2022 20:46:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: vfs_crossrename not working in samba-4.15.*
Content-Language: en-US
To: Jeremy Allison <jra@samba.org>
References: <8fbdc4c2-09db-3032-38c4-1608aae5e7f9@samba.org>
 <CAB5c7xrru41LZs76Qy9wdT6gXbWkWsEi9oyzKMY_Ux_eqw+LgQ@mail.gmail.com>
 <Yz8WfqhSldLLC7RX@jeremy-acer>
 <a27d14e4-ba5d-901a-60b9-2e2b7c7350ca@samba.org>
 <5f314f80-e29a-323b-b349-ed806d5f3bb7@samba.org>
 <533a1bb4-706e-6839-cf14-5db3a183aca8@samba.org>
 <Y0BeQaOAji8jXhgc@jeremy-acer>
In-Reply-To: <Y0BeQaOAji8jXhgc@jeremy-acer>
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
From: =?utf-8?q?Pavel_Filipensk=C3=BD_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Pavel_Filipensk=c3=bd?= <pfilipensky@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


On 10/7/22 19:13, Jeremy Allison wrote:
> On Fri, Oct 07, 2022 at 04:25:19PM +0200, Pavel Filipenský via 
> samba-technical wrote:
>> I believe that the bug was introduced in
>>
>> 5c18f07 2021-06-16 21:01 -0700 Jeremy Allison     o s3: VFS: 
>> crossrename. Use real dirfsp for SMB_VFS_RENAMEAT()
>>
>>
>> which removes
>>
>> -       if (unlink (dest) && errno != ENOENT) {
>>
>> and adss
>>
>>
>> +       ret = SMB_VFS_NEXT_UNLINKAT(handle,..
>> +       if (ret == -1) {
>
> Well calling "unlink()" directly is (a) symlink-unsafe,
> and (b) means this module is completely unstackable
> and not usable on anything other than a local filesystem.
>
> So I stand by the change :-). We just need to figure
> out the locking issues.


I was not proposing to remove SMB_VFS_NEXT_UNLINKAT()  ;-) I just hoped 
that adding the removed  errno != ENOENT check will help. But it does 
not work neither with the master nor with e.g. v4-16-test . Adding errno 
!= ENOENT check in v4-16-test  leads to a different panic than in 
master. It panics in get_share_mode_lock():


#6  0x00007fa642dd4057 in smb_panic (why=0x7fa6431a2f80 
"../../source3/locking/share_mode_lock.c:891") at ../../lib/util/fault.c:197
#7  0x00007fa643058e67 in get_share_mode_lock (mem_ctx=0x556e157b56c0, 
id=..., servicepath=0x556e157b1270 
"/home/pfilipen/workspace/projects/samba/2571/st/ad_member/share", 
smb_fname=0x556e1582cb70,
     old_write_time=0x7ffdba282cf0) at 
../../source3/locking/share_mode_lock.c:891
#8  0x00007fa6430f3cc1 in open_file_ntcreate (conn=0x556e158176b0, 
req=0x0, access_mask=274, share_access=7, create_disposition=2, 
create_options=0, new_dos_attributes=0, oplock_request=8, lease=0x0,
     private_flags=0, parent_dir_fname=0x556e1582ce00, 
smb_fname_atname=0x556e1582b170, pinfo=0x7ffdba282eec, 
fsp=0x556e15737f70) at ../../source3/smbd/open.c:3940
#9  0x00007fa6430f8c6c in create_file_unixpath (conn=0x556e158176b0, 
req=0x0, smb_fname=0x556e15830cc0, access_mask=274, share_access=7, 
create_disposition=2, create_options=0, file_attributes=128,
     oplock_request=8, lease=0x0, allocation_size=0, private_flags=0, 
sd=0x0, ea_list=0x0, result=0x7ffdba2830b0, pinfo=0x7ffdba2830bc) at 
../../source3/smbd/open.c:5959
#10 0x00007fa6430f9870 in create_file_default (conn=0x556e158176b0, 
req=0x0, smb_fname=0x556e15830cc0, access_mask=274, share_access=7, 
create_disposition=2, create_options=0, file_attributes=128,
     oplock_request=0, lease=0x0, allocation_size=0, private_flags=0, 
sd=0x0, ea_list=0x0, result=0x7ffdba2832e0, pinfo=0x7ffdba2832dc, 
in_context_blobs=0x0, out_context_blobs=0x0)
     at ../../source3/smbd/open.c:6277
#11 0x00007fa64306966f in vfswrap_create_file (handle=0x556e1581d100, 
req=0x0, smb_fname=0x556e15830cc0, access_mask=274, share_access=7, 
create_disposition=2, create_options=0, file_attributes=128,
     oplock_request=0, lease=0x0, allocation_size=0, private_flags=0, 
sd=0x0, ea_list=0x0, result=0x7ffdba2832e0, pinfo=0x7ffdba2832dc, 
in_context_blobs=0x0, out_context_blobs=0x0)
     at ../../source3/modules/vfs_default.c:750
#12 0x00007fa64310590d in smb_vfs_call_create_file 
(handle=0x556e1581d100, req=0x0, smb_fname=0x556e15830cc0, 
access_mask=274, share_access=7, create_disposition=2, create_options=0, 
file_attributes=128,
     oplock_request=0, lease=0x0, allocation_size=0, private_flags=0, 
sd=0x0, ea_list=0x0, result=0x7ffdba2832e0, pinfo=0x7ffdba2832dc, 
in_context_blobs=0x0, out_context_blobs=0x0)
     at ../../source3/smbd/vfs.c:1763
#13 0x00007fa64309c7a2 in copy_internals (ctx=0x556e157b56c0, 
conn=0x556e158176b0, req=0x0, smb_fname_src=0x556e158309c0, 
smb_fname_dst=0x556e15830cc0, attrs=6) at ../../source3/smbd/nttrans.c:1630
#14 0x00007fa62e4ed05a in copy_reg (handle=0x556e157b02a0, 
srcfsp=0x556e15813650, source=0x556e1582ad30, dstfsp=0x556e157bb980, 
dest=0x556e1582be70) at ../../source3/modules/vfs_crossrename.c:115
#15 0x00007fa62e4ed1a0 in crossrename_renameat (handle=0x556e157b02a0, 
srcfsp=0x556e15813650, smb_fname_src=0x556e1582ad30, 
dstfsp=0x556e157bb980, smb_fname_dst=0x556e1582be70)
     at ../../source3/modules/vfs_crossrename.c:164
#16 0x00007fa64310615d in smb_vfs_call_renameat (handle=0x556e157b02a0, 
srcfsp=0x556e15813650, smb_fname_src=0x556e1582ad30, 
dstfsp=0x556e157bb980, smb_fname_dst=0x556e1582be70) at 
../../source3/smbd/vfs.c:1962
#17 0x00007fa6430b8090 in rename_internals_fsp (conn=0x556e158176b0, 
fsp=0x556e157c1050, smb_fname_dst_in=0x556e157b5970, 
dst_original_lcomp=0x556e157b76a0 "Q8", attrs=6, replace_if_exists=false)
     at ../../source3/smbd/reply.c:7486
#18 0x00007fa6430d7c85 in smb2_file_rename_information 
(conn=0x556e158176b0, req=0x556e15810930, pdata=0x556e15799ad0 "", 
total_data=32, fsp=0x556e157c1050, smb_fname_src=0x556e15813350)
     at ../../source3/smbd/trans2.c:7140


I have spotted this commit, that deals with something related. It uses 
as a fix a change from SMB_VFS_CREATE_FILE() to create_internal_fsp(). 
The analogy would be to change SMB_VFS_NEXT_UNLINKAT() to unlink(), but 
as you explained, this is not the way.


commit 1052314dcd05738f29d1ae85a5a4b8eaa4babe3d
Author: Stefan Metzmacher <metze@samba.org>
Date:   Wed Dec 23 11:58:08 2020 +0100

     s3:adouble: rewrite ad_open_rsrc() as adouble_open_rsrc_fsp() using 
create_internal_fsp()

     "._" AppleDouble files are hidden by vfs_fruit by default, so 
there's no
     need to go through a full SMB_VFS_CREATE_FILE() for them.

     They don't need an smbXsrv_open_global.tdb entry nor a locking.tdb
     entry, so we just open them with fd_openat().

     This avoids a recursion deadlock in get_share_mode_lock() when closing
     the ':AFP_Resource' stream.


So any suggestions how to approach the locking issues are more than welcome.



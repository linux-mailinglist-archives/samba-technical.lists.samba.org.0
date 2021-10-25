Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E8561439BA3
	for <lists+samba-technical@lfdr.de>; Mon, 25 Oct 2021 18:35:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=S5CFowcQb/GAGvuq1KXtNlhSj7P585N1fm1EYALk6Og=; b=hfUDk7MGw3gD2PKtKaC90upfkw
	hyINI6DK77k8Fxkecn8W621t8lno9sCV/1SRv6gQQ900BL/fQ857pscUcpI77Szg0roGvmoOLwUiH
	TBPMdZ5glp/0I9JU3RqM7SQNUJvm6k9E33V80G+6Yn9K3lNoeoarzhQwbzXM0w/qEAOlx/Lfpx946
	6nxXVEaQU0tGEGTLY0I67HHC0TYaBjns4cxp3yaPigx54/RRQyW8rc/CEwLmEXVj/pbNgISo0Cbsn
	72Ih1yiqYuSoyc645BFw2IXvfiWo9A955/G17WH7dOZh1T5F2mx1rRcv3Py8HGX4TdPpwBNANM52D
	MQRx2vxA==;
Received: from ip6-localhost ([::1]:21120 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mf2vu-00ChjP-0q; Mon, 25 Oct 2021 16:34:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56688) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mf2vo-00ChjG-OO
 for samba-technical@lists.samba.org; Mon, 25 Oct 2021 16:34:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=S5CFowcQb/GAGvuq1KXtNlhSj7P585N1fm1EYALk6Og=; b=qCuath5X4S9xzIhAWPHFX3WEXS
 1p2PJR7Df1QbJ9jzVbpAvWKrJi076n28WUMBoojB479qc+7HCQUyxGB1i2CoK/i0tf14P2NxLj7ge
 p5EivnpfdTIXfPqvB6LHjoQvtkFS2Vp9ykNMlpdCEDUz3k/IC43JZxMxMsEOhIH1xdTCrvYQ02B3C
 Gd+CvBrqjiOv5mqyhb1Guojf4j6kBCa+JzuHHkFmNm1sSmM89aZuHvD87nlnHjdkZMi2HbHP6YTRE
 WWhRj3mWqOsGIautDG+Jc/4g3XT2x8F0tZFY7eS/S1jzshvZmtEFg5KDr3pmsx1cvJfI+q+kAzRrM
 nFlCh7iYT45YXGXLx8RFi28IehqUu6SYk3dJMHSRiArhLYRlhBImd72Wcv1XL1rT5QXDyiHLoA3eg
 wqxauFhZubP/OuF4frgfRXXqgaRK19hK41+5dK0M7imz+9U39KKHgGcmQChHKTrFcOBM7W3vB5T5c
 eGpyMk/XJqmiptKuALAOYUBQ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mf2vn-0038N0-Nw; Mon, 25 Oct 2021 16:34:40 +0000
Date: Mon, 25 Oct 2021 09:34:37 -0700
To: Pavel Filipensky <pfilipen@redhat.com>
Subject: Re: directory with a symlink pointing to non-existing file
Message-ID: <YXbcnQJl78LG9txV@jeremy-acer>
References: <CAEcb10tdLGRKeBs-D+n=JMFGbtNMk6815TA09QQyWXUcnSAsEw@mail.gmail.com>
 <YXGd6x6nxD4pHj6l@jeremy-acer> <YXGh+Mp1s/oMnHzU@jeremy-acer>
 <YXGyEPiGNwaXyPln@jeremy-acer> <YXG0WUXsDFpmFVZr@jeremy-acer>
 <CAEcb10sPbR1eDzQCyGt4c7A12MTPhf7QTmR_R5oDnMDvMOJTJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEcb10sPbR1eDzQCyGt4c7A12MTPhf7QTmR_R5oDnMDvMOJTJQ@mail.gmail.com>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Oct 25, 2021 at 06:21:00PM +0200, Pavel Filipensky via samba-technical wrote:
>Hi Jeremy,
>
>thanks for looking into this and providing the fix. I was trying to test
>the fix attached to https://bugzilla.samba.org/show_bug.cgi?id=14879 but
>still doesn't work.
>I am using this env:
>
>make -j8 testenv SELFTEST_TESTENV=ad_member_idmap_rid:local SCREEN=1
> SMBD_OPTIONS=-d100
>mkdir st/ad_member_idmap_rid/share/test1
>ln -s st/ad_member_idmap_rid/share/test1/l1
>st/ad_member_idmap_rid/share/test1/l2
>
>smb.conf has "delete veto files = yes"
>
>then I run "rmdir test1" in
>
>bin/smbclient //$SERVER/tmp -U$DC_USERNAME%$DC_PASSWORD
>
>
>The point where it all  fails is here:
>
>(gdb) bt 6
>#0  xattr_tdb_unlinkat (handle=0x557646d5cd30, dirfsp=0x557646d69fc0,
>smb_fname=0x557646d70a50, flags=0) at
>../../source3/modules/vfs_xattr_tdb.c:524
>#1  0x00007f84d2fd73ce in smb_vfs_call_unlinkat (handle=0x557646d5cd30,
>dirfsp=0x557646d69fc0, smb_fname=0x557646d70a50, flags=0) at
>../../source3/smbd/vfs.c:2218
>#2  0x00007f84d31141ca in unlink_acl_common (handle=0x557646d54170,
>dirfsp=0x557646d69fc0, smb_fname=0x557646d70a50, flags=0) at
>../../source3/modules/vfs_acl_common.c:1146
>#3  0x00007f84bdb0ed06 in acl_xattr_unlinkat (handle=0x557646d54170,
>dirfsp=0x557646d69fc0, smb_fname=0x557646d70a50, flags=0) at
>../../source3/modules/vfs_acl_xattr.c:265
>#4  0x00007f84d2fd73ce in smb_vfs_call_unlinkat (handle=0x557646d54170,
>dirfsp=0x557646d69fc0, smb_fname=0x557646d70a50, flags=0) at
>../../source3/smbd/vfs.c:2218
>#5  0x00007f84d2fcdb5a in rmdir_internals (ctx=0x557646c91760,
>fsp=0x557646d628f0) at ../../source3/smbd/close.c:1285
>
>On line 522 SMB_VFS_NEXT_STAT() returns -1 with errno 2:
>
>
>  519 »·······if (full_fname->flags & SMB_FILENAME_POSIX_PATH) {
>
>  520 »·······»·······ret = SMB_VFS_NEXT_LSTAT(handle, full_fname);
>
>  521 »·······} else {
>
>  522 »·······»·······ret = SMB_VFS_NEXT_STAT(handle, full_fname);
>
>                                            523 »·······}
>
>  524 »·······if (ret == -1) {
>
>  525 »·······»·······goto out;
>
>  526 »·······}
>
>==============
>
>If it helps I can prepare some regression test.

That's probably expected when you have xattr_tdb loaded.
That's an unusual configuration to be running with dangling
symlinks and I don't expect any normal fileserver to be
doing that.

Don't do that (ie. don't run the regression test against
ad_member_idmap_rid :-).

I have a regression test that works against the "fileserver"
environment. I'm planning on fixing this up and submitting
to Ralph for review this week.

Once it's in, if you really want to make it work against
an AD-DC config with xattr_tdb loaded then we'll log a
separate bug and deal with it there, but to be honest
it's unlikely anyone would care.

Jeremy.




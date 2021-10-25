Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F794439CEB
	for <lists+samba-technical@lfdr.de>; Mon, 25 Oct 2021 19:06:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=rQssMtYHQd/UscShRfV5XY3a/dld3qv47owm2c8gEXI=; b=0kHJeuBJ801/T5QzvmjvfSWiau
	r35gf3LmkJTEuX4YOgSzGOsGZxXVdcwWI9Nq8Z0xw4anoH/0k7xol2FH2IwHyP5Kc8lKjS3FBAq6H
	nhQ3EMo3Vl7yJfvXVg6z1HRIjMqp+mRe0Epj8rw/MLSQBAJfVjzOAPzoUqoueKMtAvBFdcWARHoIP
	2r2pREc0UB1CJByRLsbmy2XoR8sgxQgT8BYZoqhg1eIWj8PLbDdGTsOipUvJVFR7i1McUll2R5nSx
	//ggY3yozpJ7iix2jlIQYh72AyTdDIp/zlV3xpRj+5XP67XV6xD8GLoO7F0RO/p8D0u0yOzqZWZ2H
	3V3pp2kg==;
Received: from ip6-localhost ([::1]:31850 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mf3Qf-00Cm8X-Jl; Mon, 25 Oct 2021 17:06:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58090) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1mf3Qa-00Cm8N-8t
 for samba-technical@lists.samba.org; Mon, 25 Oct 2021 17:06:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635181584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oWkNyR1HjcwqjrTN9CUqEzQMyPVcVjFtgVd/YYh0oec=;
 b=gqH231IZzoB8fxKZfwAq8F9vhZBIUvGBbs7+UPXhxfY96mvT2NlBNz5/Xs2TU34qnqz6sQ
 aOLv3GgDKnGVcOrQ/2SUgBh8pQnsF6LruBnhM+gK4Z5RcvhWNpzVsBbI0SLIb7z2U+GITV
 hHPaMBs11cRc3lKW8Z5gbVsnt5lxduM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635181584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oWkNyR1HjcwqjrTN9CUqEzQMyPVcVjFtgVd/YYh0oec=;
 b=gqH231IZzoB8fxKZfwAq8F9vhZBIUvGBbs7+UPXhxfY96mvT2NlBNz5/Xs2TU34qnqz6sQ
 aOLv3GgDKnGVcOrQ/2SUgBh8pQnsF6LruBnhM+gK4Z5RcvhWNpzVsBbI0SLIb7z2U+GITV
 hHPaMBs11cRc3lKW8Z5gbVsnt5lxduM=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-k7wvAq93OtCZco1x6dt2SQ-1; Mon, 25 Oct 2021 12:50:21 -0400
X-MC-Unique: k7wvAq93OtCZco1x6dt2SQ-1
Received: by mail-pf1-f199.google.com with SMTP id
 h2-20020aa796c2000000b0047bded559faso3173001pfq.12
 for <samba-technical@lists.samba.org>; Mon, 25 Oct 2021 09:50:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oWkNyR1HjcwqjrTN9CUqEzQMyPVcVjFtgVd/YYh0oec=;
 b=SVYFoJIrCLPm+fE3W1ebB8mMRkj5zVeF4RDd4Aqte/HHnhCn28WXp8PRxPiAmKGySG
 t2LpDIu/Ut0m8nGqqZRq2gtucy+bDSAZRjC9uxDxyBM8XzDaNt414AG+2tVYJ9yNN+GN
 l5KGg6F+3gaWP6I/i/XoG+rpvrYKLcCpjyulD5ZDzyB7z1JrLySc4b/m7Rfcl6Koe5GD
 kjdsyMZO3pItD7X4vDp8GM9wGwQoFBhG32zP0kLPS4J1ULkG77NDQ3E60wsGVKjwKVPh
 FAEh5QSNnSY9hBwtZYJAHzoxmapGMAlkv/2is/VxKBXUs06orVE7oPW08FUEuZUjkk2L
 39mg==
X-Gm-Message-State: AOAM532eDW4YSR7EWyybbD3tOK9p0J8dCkMIQkSWfcPnxViWKT4liVrl
 FP4/BlsGSK3Q6FFgdZVHS+b8fzS/zxUHV0wH4YUNZ46pumcskLeoLzTMC5utAUQYlsB+EcVwHBa
 0HnDb5VOnRJgxzHm1oLDZPodRU0Ye/legtRIagRdO70+m
X-Received: by 2002:a63:8f5a:: with SMTP id r26mr7972832pgn.50.1635180620083; 
 Mon, 25 Oct 2021 09:50:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGrrUKy7iushAd9W1ery5nrWW2qTivkDZtcm+M0fGXC4h/dijoq5aVmuUzNSv2tpjn+nzWIva6+jwWH0sHlws=
X-Received: by 2002:a63:8f5a:: with SMTP id r26mr7972804pgn.50.1635180619726; 
 Mon, 25 Oct 2021 09:50:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAEcb10tdLGRKeBs-D+n=JMFGbtNMk6815TA09QQyWXUcnSAsEw@mail.gmail.com>
 <YXGd6x6nxD4pHj6l@jeremy-acer> <YXGh+Mp1s/oMnHzU@jeremy-acer>
 <YXGyEPiGNwaXyPln@jeremy-acer> <YXG0WUXsDFpmFVZr@jeremy-acer>
 <CAEcb10sPbR1eDzQCyGt4c7A12MTPhf7QTmR_R5oDnMDvMOJTJQ@mail.gmail.com>
 <YXbcnQJl78LG9txV@jeremy-acer>
In-Reply-To: <YXbcnQJl78LG9txV@jeremy-acer>
Date: Mon, 25 Oct 2021 18:50:08 +0200
Message-ID: <CAEcb10twxsCBi-jno5V0fh5c6ubZ307tOKPEjDOcueCs=7-Tag@mail.gmail.com>
Subject: Re: directory with a symlink pointing to non-existing file
To: Jeremy Allison <jra@samba.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pfilipen@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Warn: TLS-SNI hr1.samba.org
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
From: Pavel Filipensky via samba-technical <samba-technical@lists.samba.org>
Reply-To: Pavel Filipensky <pfilipen@redhat.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I was not aware of xatrr_tdb, thx for pointing that out. I do not care
about config with xattr_tdb, it was more or less a coincidence.

However, it does not work with "fileserver" environment for me. What
exactly is your regression test doing?

some grep for "fileserver" environment :

$ grep test1 st/fileserver/logs/log.smbd

  synthetic_pathref: stat [test1/l2] failed: No such file or directory
  streams_depot_stat called for [test1/l2]
  streams_depot_stat called for [test1]
  streams_depot_rmdir_internal: called for test1
  rmdir_acl_common: unlink of test1 failed Directory not empty
  rmdir_internals: couldn't remove directory test1 : Directory not empty
  close_directory: test1. Delete on close was set - deleting directory
returned NT_STATUS_DIRECTORY_NOT_EMPTY.
  smbd_smb2_close: close_file[test1]: NT_STATUS_DIRECTORY_NOT_EMPTY




On Mon, Oct 25, 2021 at 6:34 PM Jeremy Allison <jra@samba.org> wrote:

> On Mon, Oct 25, 2021 at 06:21:00PM +0200, Pavel Filipensky via
> samba-technical wrote:
> >Hi Jeremy,
> >
> >thanks for looking into this and providing the fix. I was trying to test
> >the fix attached to https://bugzilla.samba.org/show_bug.cgi?id=3D14879 b=
ut
> >still doesn't work.
> >I am using this env:
> >
> >make -j8 testenv SELFTEST_TESTENV=3Dad_member_idmap_rid:local SCREEN=3D1
> > SMBD_OPTIONS=3D-d100
> >mkdir st/ad_member_idmap_rid/share/test1
> >ln -s st/ad_member_idmap_rid/share/test1/l1
> >st/ad_member_idmap_rid/share/test1/l2
> >
> >smb.conf has "delete veto files =3D yes"
> >
> >then I run "rmdir test1" in
> >
> >bin/smbclient //$SERVER/tmp -U$DC_USERNAME%$DC_PASSWORD
> >
> >
> >The point where it all  fails is here:
> >
> >(gdb) bt 6
> >#0  xattr_tdb_unlinkat (handle=3D0x557646d5cd30, dirfsp=3D0x557646d69fc0=
,
> >smb_fname=3D0x557646d70a50, flags=3D0) at
> >../../source3/modules/vfs_xattr_tdb.c:524
> >#1  0x00007f84d2fd73ce in smb_vfs_call_unlinkat (handle=3D0x557646d5cd30=
,
> >dirfsp=3D0x557646d69fc0, smb_fname=3D0x557646d70a50, flags=3D0) at
> >../../source3/smbd/vfs.c:2218
> >#2  0x00007f84d31141ca in unlink_acl_common (handle=3D0x557646d54170,
> >dirfsp=3D0x557646d69fc0, smb_fname=3D0x557646d70a50, flags=3D0) at
> >../../source3/modules/vfs_acl_common.c:1146
> >#3  0x00007f84bdb0ed06 in acl_xattr_unlinkat (handle=3D0x557646d54170,
> >dirfsp=3D0x557646d69fc0, smb_fname=3D0x557646d70a50, flags=3D0) at
> >../../source3/modules/vfs_acl_xattr.c:265
> >#4  0x00007f84d2fd73ce in smb_vfs_call_unlinkat (handle=3D0x557646d54170=
,
> >dirfsp=3D0x557646d69fc0, smb_fname=3D0x557646d70a50, flags=3D0) at
> >../../source3/smbd/vfs.c:2218
> >#5  0x00007f84d2fcdb5a in rmdir_internals (ctx=3D0x557646c91760,
> >fsp=3D0x557646d628f0) at ../../source3/smbd/close.c:1285
> >
> >On line 522 SMB_VFS_NEXT_STAT() returns -1 with errno 2:
> >
> >
> >  519 =C2=BB=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7if (full_fname->fl=
ags & SMB_FILENAME_POSIX_PATH) {
> >
> >  520 =C2=BB=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=BB=C2=B7=C2=B7=
=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7ret =3D SMB_VFS_NEXT_LSTAT(handle, full_fname=
);
> >
> >  521 =C2=BB=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7} else {
> >
> >  522 =C2=BB=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=BB=C2=B7=C2=B7=
=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7ret =3D SMB_VFS_NEXT_STAT(handle, full_fname)=
;
> >
> >                                            523 =C2=BB=C2=B7=C2=B7=C2=B7=
=C2=B7=C2=B7=C2=B7=C2=B7}
> >
> >  524 =C2=BB=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7if (ret =3D=3D -1)=
 {
> >
> >  525 =C2=BB=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=BB=C2=B7=C2=B7=
=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7goto out;
> >
> >  526 =C2=BB=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7}
> >
> >=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> >If it helps I can prepare some regression test.
>
> That's probably expected when you have xattr_tdb loaded.
> That's an unusual configuration to be running with dangling
> symlinks and I don't expect any normal fileserver to be
> doing that.
>
> Don't do that (ie. don't run the regression test against
> ad_member_idmap_rid :-).
>
> I have a regression test that works against the "fileserver"
> environment. I'm planning on fixing this up and submitting
> to Ralph for review this week.
>
> Once it's in, if you really want to make it work against
> an AD-DC config with xattr_tdb loaded then we'll log a
> separate bug and deal with it there, but to be honest
> it's unlikely anyone would care.
>
> Jeremy.
>
>
>

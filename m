Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DB4439B68
	for <lists+samba-technical@lfdr.de>; Mon, 25 Oct 2021 18:21:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Ihxoz8sW5yktTEu4vuIhXbd76Jiz9xFr6Viu8HQzQCM=; b=v597ABbEtcnyC3fAFgesMyqVAz
	Gi2KgZj4DfJrD6mfYlw5IlVLQb97rmiYRdm2sjWRbQjQTckEpT6kyNL+cE2Tg4CZ8G5oqcx/gj8NM
	nyWsCnmZR9fqEtqfyw/3UUkUu5WBW2OPqdQZ01/AWjsR9hQZuXFdXTnO0Tod6MxtH92S5nSVO+bnZ
	lj3sWc6dNEwAqtkq3xUwh33rwIzbA2qnJ2wDyFcYk4afjtM2XIaY4DywvsIGf4xs6dx3e9CM129Y0
	uY9+OcZ1qcPxn9GE/oTYwLpxd/SP3QI9N433vL1kSW/YjBMKA/u9b867JSMHkQYXrMd4boK45C2/w
	zFN6YciQ==;
Received: from ip6-localhost ([::1]:19870 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mf2j2-00Ch36-9W; Mon, 25 Oct 2021 16:21:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41653) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1mf2iv-00Cgxu-Qx
 for samba-technical@lists.samba.org; Mon, 25 Oct 2021 16:21:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635178877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c3Dhm3My+SkEIqhthg8IbOfJXEZwu7o1NYZBEx9vJuk=;
 b=Dhfl7n0eHqgGO3GTqJznBn2tL3FRl7iwLc9Y4GMH4J8xXI/B4+O0gDRTDQnjPCLEELTRqC
 z3IHfVREuC+lJ4eOPlyCSMqz1nD4WcA/qnGPLzAY7Q11o2MPf3Lh+GTkk8aqcKdvL/RJdg
 cRhfpjBr2au1rX0wmp7npaF6LJ3AcWQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635178878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c3Dhm3My+SkEIqhthg8IbOfJXEZwu7o1NYZBEx9vJuk=;
 b=X0Jl6Rp53FD4oenqkDEFK1E9Tl4+hhnPHnlMUy2BsrLOaeiWhhucL24E0iwnM9fDL2UB7R
 pQFFAAi7G6DJTcmt0DASd45jycjGdoz3cc3Hn1nadu9kXBxCh1L0JmSVQXdZ9PKR3UAyq/
 UlGf628X+Fodh9o+20tewoN41YxQpik=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-uxC06sLqPKuZ3kRPMXHSjg-1; Mon, 25 Oct 2021 12:21:13 -0400
X-MC-Unique: uxC06sLqPKuZ3kRPMXHSjg-1
Received: by mail-pg1-f199.google.com with SMTP id
 m74-20020a633f4d000000b0029fed7e61f9so6544891pga.16
 for <samba-technical@lists.samba.org>; Mon, 25 Oct 2021 09:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c3Dhm3My+SkEIqhthg8IbOfJXEZwu7o1NYZBEx9vJuk=;
 b=jslZna9ESftjZQUMEleB0KjERG1v3RRdKEi+FSjl5hhu9v6IW44xypTn2sc5PdI0LL
 kvgPdmYroj6XYMFqGl9nrpoZvrHBpip4LmiFaabKviizBOj3stB0tdOb1iq8vdl7qPh5
 sPUnIXdYFk9qQ/j0JOuThAMVLg1OMNN1zXM3zoyNA60Q5VnkDjbhEoRmATU8QdNjUOUr
 ZaYEFL8qeSEkeXEIaAzvAdyIQfPrxVJm4giLUPFY/NZCesPYZdfNWpFv6/2b73Bc11hp
 SveSFO3PVeAjudUgXOl3EEiYfznRTpkEnJ7sOZ9kVYiQXp8gpacDkekyUUo7t4bIKGSI
 ++4Q==
X-Gm-Message-State: AOAM533u96b1B+SQjcYsUKWcD6kdaUK3tZBDy2rMNf+2YtsMsgzKnleN
 Pp9KC47a3QX5PTclb1movHDCWouPIYDS7eiYFbBPLhtsGaRpfgt9sJR2YLXl7w04M2yCTD4wbL0
 lVniygQ7zKNdY9kn6K18uKa3VNeeiysj/NhUFJmSRHADD
X-Received: by 2002:a17:902:6b48:b0:13f:903c:bc2e with SMTP id
 g8-20020a1709026b4800b0013f903cbc2emr17032256plt.68.1635178872117; 
 Mon, 25 Oct 2021 09:21:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXDoaa/M9kZrJ6IA7A2SSlz7P13kpviyX4Yv01yxMPPnPSd3wnnFCdHgWTecu7koY0O0wCPnkaKUi+7wMDsjY=
X-Received: by 2002:a17:902:6b48:b0:13f:903c:bc2e with SMTP id
 g8-20020a1709026b4800b0013f903cbc2emr17032204plt.68.1635178871538; Mon, 25
 Oct 2021 09:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAEcb10tdLGRKeBs-D+n=JMFGbtNMk6815TA09QQyWXUcnSAsEw@mail.gmail.com>
 <YXGd6x6nxD4pHj6l@jeremy-acer> <YXGh+Mp1s/oMnHzU@jeremy-acer>
 <YXGyEPiGNwaXyPln@jeremy-acer> <YXG0WUXsDFpmFVZr@jeremy-acer>
In-Reply-To: <YXG0WUXsDFpmFVZr@jeremy-acer>
Date: Mon, 25 Oct 2021 18:21:00 +0200
Message-ID: <CAEcb10sPbR1eDzQCyGt4c7A12MTPhf7QTmR_R5oDnMDvMOJTJQ@mail.gmail.com>
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

Hi Jeremy,

thanks for looking into this and providing the fix. I was trying to test
the fix attached to https://bugzilla.samba.org/show_bug.cgi?id=3D14879 but
still doesn't work.
I am using this env:

make -j8 testenv SELFTEST_TESTENV=3Dad_member_idmap_rid:local SCREEN=3D1
 SMBD_OPTIONS=3D-d100
mkdir st/ad_member_idmap_rid/share/test1
ln -s st/ad_member_idmap_rid/share/test1/l1
st/ad_member_idmap_rid/share/test1/l2

smb.conf has "delete veto files =3D yes"

then I run "rmdir test1" in

bin/smbclient //$SERVER/tmp -U$DC_USERNAME%$DC_PASSWORD


The point where it all  fails is here:

(gdb) bt 6
#0  xattr_tdb_unlinkat (handle=3D0x557646d5cd30, dirfsp=3D0x557646d69fc0,
smb_fname=3D0x557646d70a50, flags=3D0) at
../../source3/modules/vfs_xattr_tdb.c:524
#1  0x00007f84d2fd73ce in smb_vfs_call_unlinkat (handle=3D0x557646d5cd30,
dirfsp=3D0x557646d69fc0, smb_fname=3D0x557646d70a50, flags=3D0) at
../../source3/smbd/vfs.c:2218
#2  0x00007f84d31141ca in unlink_acl_common (handle=3D0x557646d54170,
dirfsp=3D0x557646d69fc0, smb_fname=3D0x557646d70a50, flags=3D0) at
../../source3/modules/vfs_acl_common.c:1146
#3  0x00007f84bdb0ed06 in acl_xattr_unlinkat (handle=3D0x557646d54170,
dirfsp=3D0x557646d69fc0, smb_fname=3D0x557646d70a50, flags=3D0) at
../../source3/modules/vfs_acl_xattr.c:265
#4  0x00007f84d2fd73ce in smb_vfs_call_unlinkat (handle=3D0x557646d54170,
dirfsp=3D0x557646d69fc0, smb_fname=3D0x557646d70a50, flags=3D0) at
../../source3/smbd/vfs.c:2218
#5  0x00007f84d2fcdb5a in rmdir_internals (ctx=3D0x557646c91760,
fsp=3D0x557646d628f0) at ../../source3/smbd/close.c:1285

On line 522 SMB_VFS_NEXT_STAT() returns -1 with errno 2:


  519 =C2=BB=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7if (full_fname->flags=
 & SMB_FILENAME_POSIX_PATH) {

  520 =C2=BB=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=BB=C2=B7=C2=B7=C2=
=B7=C2=B7=C2=B7=C2=B7=C2=B7ret =3D SMB_VFS_NEXT_LSTAT(handle, full_fname);

  521 =C2=BB=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7} else {

  522 =C2=BB=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=BB=C2=B7=C2=B7=C2=
=B7=C2=B7=C2=B7=C2=B7=C2=B7ret =3D SMB_VFS_NEXT_STAT(handle, full_fname);

                                            523 =C2=BB=C2=B7=C2=B7=C2=B7=C2=
=B7=C2=B7=C2=B7=C2=B7}

  524 =C2=BB=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7if (ret =3D=3D -1) {

  525 =C2=BB=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=BB=C2=B7=C2=B7=C2=
=B7=C2=B7=C2=B7=C2=B7=C2=B7goto out;

  526 =C2=BB=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7}

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

If it helps I can prepare some regression test.

Pavel



On Thu, Oct 21, 2021 at 8:41 PM Jeremy Allison <jra@samba.org> wrote:

> On Thu, Oct 21, 2021 at 11:31:44AM -0700, Jeremy Allison via
> samba-technical wrote:
> >
> >Done lots more investigation on this, and it looks like
> >recursive directory deletion with veto files is broken in 4.15.0.
> >
> >I'll log a bug and fix..
>
> The second bug here is that when "delete veto files" is
> set that you can't delete a directory with dangling symlinks
> as a dangling symlink is an implicit vetoed file (it's
> never shown to Windows clients).
>
> That's a second bug, which I also have a fix for, but
> I need a regression test first.
>
>

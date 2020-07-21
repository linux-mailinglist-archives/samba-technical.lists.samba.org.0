Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7952E228C85
	for <lists+samba-technical@lfdr.de>; Wed, 22 Jul 2020 01:12:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=8bvKB9VH/fywhPcoVWTA5S5sozlipU5wLHV2w6iYvEU=; b=niO4zAUIc1AJTQuGmPNfUpY/1a
	tJSFavtxPYZ/t3BarV5cTWmd4JOlAolEk8JOFfLB3A9u33pwo4qXXDZ1aDFbcIZHtuFbTvGygzqfu
	4z6POX3tTY5p9sVJ8DxcDOAq3zhsIq8NFPTjqYLi9zqTsnIi5nJOdvrYzVrFQfd/jJcPHPrzFMMSB
	Cvp17D7jaFv/xCeAE9ttES9lE//xt/ohEcJQEJ70LdsQzF4POGC4/4IDOx5ym/W7cMsCy81/uoIRW
	2BV/4wOB+hR4WycTwm4TNa0nZvahPAkXKAUbThbD5wkSKt8nFLs/F1+p1d3FSmQpPuJbY6Z+niurz
	un3+GK5Q==;
Received: from localhost ([::1]:39960 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jy1Po-00954k-Oy; Tue, 21 Jul 2020 23:11:16 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:46738) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jy1Pg-00954d-Sr
 for samba-technical@lists.samba.org; Tue, 21 Jul 2020 23:11:12 +0000
Received: by mail-io1-xd43.google.com with SMTP id a12so159218ion.13
 for <samba-technical@lists.samba.org>; Tue, 21 Jul 2020 16:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8bvKB9VH/fywhPcoVWTA5S5sozlipU5wLHV2w6iYvEU=;
 b=QugQk0rJzFIrB2qkI+dTDZLu5rLbVcOGO1BleQWMotHyg+hsVFH3/gKXvKEnMI/Bjo
 HJhgYvXvDEFMBYvZU/AtTFpmkFlgQorXVBN4NV0EzTMmFPknCc82uSdKCX/2leFZkxBQ
 wga/KIZ4LgOyr06JW0IYic2aWh32uinWiRTd+Q03mpEdSFGtLSbdbmL69/E5pvRKRYRp
 cO/egtQggUluDXc7R595F2XG6/1EOAqZ8XrrCcp34Ps81idev+BbUAXf8tL8MRlD2l8F
 721vbPl7cVE3lpa9JSersb5SDu7IfIFrSvYUM9qiCEq4c8xB2IQyQk4pgajtvlatFg9R
 yQMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8bvKB9VH/fywhPcoVWTA5S5sozlipU5wLHV2w6iYvEU=;
 b=V67V/wONBB2I2G1eNkHzuALHk0/ifE/JM/etZhMo3Kx+xK3L5YAxPK+KZLC2/EcKoK
 dMDzPabHoBB0JxVaqjHPE5AdX8nAt/RSvMoGHN5tisuKvd+Gj3a9K5TjsNFMZ/yntPNG
 J2ky2Q8ZpybZd3KAkkKlw/ef+Y7zato6zS/0hma+eE0rhKVgswcqOmcFUUY7qlP6pQEt
 huGA127myopxupIROkjk3NhjiSbjEhn5Pxiy833rLNOz/saTFXCUrA1wNXw0teTmwbxU
 Q6qelTIONqu8nJL2lGfucgeai6ipYfpC2N30qbxRKNwU/KWicosPOz1nN9GKSQGlwqkM
 zkhw==
X-Gm-Message-State: AOAM530XhOXtWL6mzIGu346/YZoKHdE24ugdHpHDESQ3own1yy2yXNi2
 amXUI1EQYlIlnhkkvPtX6Hgu76rtGlyigH5W7wY=
X-Google-Smtp-Source: ABdhPJzhag+KQrWpd/AapO6Tpei06ifjCy2BPWGhJDlUS90bTSoC0zfX3kRN5EK+DJxnB1ELXTGi2W+tTNQXProMuJY=
X-Received: by 2002:a5e:d80e:: with SMTP id l14mr25332489iok.65.1595373065905; 
 Tue, 21 Jul 2020 16:11:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAD737DGhAiRUb6WZz_RQ6GwfXwH3CFB_5iOmzvnJwSPoncXdLg@mail.gmail.com>
 <d8dbaf42-0f81-f25e-ea47-28b29c44fcd1@huawei.com>
In-Reply-To: <d8dbaf42-0f81-f25e-ea47-28b29c44fcd1@huawei.com>
Date: Tue, 21 Jul 2020 18:10:54 -0500
Message-ID: <CAH2r5mucBQ8cYCdahhv2i6nMhotyUS3PcuEi5hsonP5DL7pNug@mail.gmail.com>
Subject: Re: PROBLEM: mv command fails: "File exists" on cifs mount on
 kernel>=5.7.8
To: "zhangxiaoxu (A)" <zhangxiaoxu5@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: Steve French <sfrench@samba.org>, CIFS <linux-cifs@vger.kernel.org>,
 Patrick Fernie <patrick.fernie@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

By the way - I am unable to reproduce this on smb3 or later.  It only
seems to be an smb1 regression.

Any additional updates or information?

On Tue, Jul 21, 2020 at 8:52 AM zhangxiaoxu (A) <zhangxiaoxu5@huawei.com> w=
rote:
>
> Thanks for your report.
>
> Since commit 9ffad9263b46 ("cifs: Fix the target file was deleted
> when rename failed.") want to fix the problem when rename(file1, file2)
> with file2 exist, the server return -EACESS, then cifs client will
> delete the file2 and rename it again, but 2nd rename on server also
> return -EACESS, then the file2 was deleted.
>
> It can be reproduce by xfstests generic/035.
> When 't_rename_overwrite file1 file2':
>    open(file2)
>    rename(file1, file2)
>    fstat(file2).st_nlink should be 0.
>
> The solution on commit 9ffad9263b46 ("cifs: Fix the target file was
> deleted when rename failed.") was wrong. we should revert it.
>
> The root cause of the file2 deleted maybe the file2 was opened
> when rename(file1, file2), I will re-debug it.
>
> =E5=9C=A8 2020/7/21 1:09, Patrick Fernie =E5=86=99=E9=81=93:
> > # One line summary of the problem:
> >
> > mv command fails: "File exists" on cifs mount on kernel>=3D5.7.8
> >
> > # Full description of the problem/report:
> >
> > Since v5.7.8 (v5.4.51 for -lts), there appears to be a regression with
> > cifs mounts; mv commands fail with a "File exists" when attempting to
> > overwrite a file. Similarly, rsync commands which create a temporary
> > file during transfer and then attempt to move it into place after
> > copying fail ("File Exists (17)"). I believe this is related to this
> > commit: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.gi=
t/commit/fs/cifs/inode.c?id=3D9ffad9263b467efd8f8dc7ae1941a0a655a2bab2
> >
> > The mount in question is from a Drobo FS NAS device, and is forced to
> > SMB1 (`vers=3D1.0` specified).
> >
> > Running v5.7.7 or 5.4.50 does not exhibit this behavior, behavior was
> > confirmed on 5.7.8, 5.7.9, 5.4.51 and 5.4.52.
> >
> > These users appear to be experiencing the same issue:
> > 1) https://serverfault.com/questions/1025734/cifs-automounts-suddenly-s=
topped-working
> > 2) https://unix.stackexchange.com/questions/599281/cifs-mount-is-return=
ing-errors-when-operating-on-remote-files-file-exists-inte
> >
> > # Most recent kernel version which did not have the bug:
> >
> > 5.7.7 / 5.4.50
> >
> > # A small shell script or example program which triggers the problem
> > (if possible):
> >
> > [vagrant@archlinux ~]$ uname -a
> > Linux archlinux 5.7.9-arch1-1 #1 SMP PREEMPT Thu, 16 Jul 2020 19:34:49
> > +0000 x86_64 GNU/Linux
> > # Same behavior seen on Linux archlinux 5.4.52-1-lts #1 SMP Thu, 16
> > Jul 2020 19:35:06 +0000 x86_64 GNU/Linux
> > [vagrant@archlinux ~]$ cd /mnt/drobo/Share/cifs-test/
> > [vagrant@archlinux cifs-test]$ touch a b
> > [vagrant@archlinux cifs-test]$ mv a b
> > mv: cannot move 'a' to 'b': File exists
> > [vagrant@archlinux cifs-test]$ mkdir -p /tmp/sync_dir
> > [vagrant@archlinux cifs-test]$ touch /tmp/sync_dir/foo
> > [vagrant@archlinux cifs-test]$ rsync -rap /tmp/sync_dir .
> > [vagrant@archlinux cifs-test]$ touch /tmp/sync_dir/foo
> > [vagrant@archlinux cifs-test]$ rsync -rap /tmp/sync_dir .
> > rsync: [receiver] rename
> > "/mnt/drobo/Share/cifs-test/sync_dir/.foo.FQiit5" -> "sync_dir/foo":
> > File exists (17)
> > rsync error: some files/attrs were not transferred (see previous
> > errors) (code 23) at main.c(1287) [sender=3D3.2.2]
> >
> > ## Behavior as expected on older kernel:
> >
> > [vagrant@archlinux ~]$ uname -a
> > Linux archlinux 5.7.7-arch1-1 #1 SMP PREEMPT Wed, 01 Jul 2020 14:53:16
> > +0000 x86_64 GNU/Linux
> > # Same behavior seen on Linux archlinux 5.4.50-1-lts #1 SMP Wed, 01
> > Jul 2020 14:53:03 +0000 x86_64 GNU/Linux
> > [vagrant@archlinux ~]$ cd /mnt/drobo/Share/cifs-test/
> > [vagrant@archlinux cifs-test]$ touch a b
> > [vagrant@archlinux cifs-test]$ mv a b
> > [vagrant@archlinux cifs-test]$ mkdir -p /tmp/sync_dir
> > [vagrant@archlinux cifs-test]$ touch /tmp/sync_dir/foo
> > [vagrant@archlinux cifs-test]$ rsync -rap /tmp/sync_dir .
> > [vagrant@archlinux cifs-test]$ touch /tmp/sync_dir/foo
> > [vagrant@archlinux cifs-test]$ rsync -rap /tmp/sync_dir .
> > [vagrant@archlinux cifs-test]$
> >
> > # Environment:
> >
> > Arch Linux
> >
> > CIFS mount (vers=3D1.0) from Drobo FS NAS device
> >
> > CIFS share mount information:
> >
> > systemd-1 on /mnt/drobo/Share type autofs
> > (rw,relatime,fd=3D44,pgrp=3D1,timeout=3D0,minproto=3D5,maxproto=3D5,dir=
ect,pipe_ino=3D12139)
> > //10.76.9.11/Share on /mnt/drobo/Share type cifs
> > (rw,relatime,vers=3D1.0,cache=3Dstrict,username=3DXXXXXXX,uid=3D0,nofor=
ceuid,gid=3D0,noforcegid,addr=3D10.76.9.11,file_mode=3D0775,dir_mode=3D0775=
,nocase,soft,nounix,serverino,mapposix,nobrl,noperm,rsize=3D61440,wsize=3D6=
5536,bsize=3D1048576,echo_interval=3D60,actimeo=3D1,x-systemd.automount)
> >
> > Regards,
> > Patrick Fernie
> >
> > .
> >
>


--=20
Thanks,

Steve


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED5F22B701
	for <lists+samba-technical@lfdr.de>; Thu, 23 Jul 2020 21:55:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=au/KI04BzEMMzHNo8EdTR2muZRy1qvYooaiEGXtDifI=; b=VTPYrpASDap22V3yvV5Ao5qno0
	AIHz4Z61/PGROQl0KzUKXofIKUsdrrDvY8BlhdduL7SaO0/zu8Aj4nQvrBD0RzDfUIDRhiNUFFN5t
	1MOcv3xaYnoCIZspSFCZB69Hyc6KmK9RBILuxkGUVlTiPc/sVuApvrdi4sKTUPGIaYF7ByeI2g9vM
	ZJWiVr+VybTD1HeixRadGZVNvyJV8i0in6Pp6vJ740XWFoFGZoafqkCte8NPSG0MTTRnXs+UD/fAy
	Fdcxp/LsaO8vVBXxAMO6umfjKk99pN5O6z+YhAihbKLAIcWUDgDuTeLhOzZmu/kNV0Hj4dOoBCTlN
	se6dtTtg==;
Received: from localhost ([::1]:47918 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jyhJY-009Yna-Kh; Thu, 23 Jul 2020 19:55:36 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:35732) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jyhJL-009YnK-8d
 for samba-technical@lists.samba.org; Thu, 23 Jul 2020 19:55:30 +0000
Received: by mail-il1-x142.google.com with SMTP id t18so5396728ilh.2
 for <samba-technical@lists.samba.org>; Thu, 23 Jul 2020 12:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=au/KI04BzEMMzHNo8EdTR2muZRy1qvYooaiEGXtDifI=;
 b=bEgqr0yIqTDgqZY1HwSOt4Q27ebAuKSpiPn/rh6rfSDA8n2o4XPTiunqYIp8jzoC1w
 NtsevFdmusUNebgVitEhG1fjqiXN785HVu5slRqfB8j3+Yts++kf1ErhW3/sxkylX/Dg
 5xH5o/r3nlDnhoT0sylaXWJu1H1bZu51xQ8R9nm/CE5X0f+iUh7toyOEGRWX4tjL8wos
 vJwIplIhP9LKoW+GDSSl4QfxaAw+0GV8J8hQtJ/wVgabfb6D/o/SC0pR5E2Udcst6j8R
 pNUgtSmVOnldXYBwZUOROd9k1BQr3YJUZZhIjNmb34vYALFBGb8nBZdtfDHm7e1FVLrs
 mRHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=au/KI04BzEMMzHNo8EdTR2muZRy1qvYooaiEGXtDifI=;
 b=oBxsHhDf+K/wDdtgaHD6dQXj052GZTbSA6EbFQr38qSSj/edfsfMdtW4W6A65GyLcO
 k69o+F4BKX9bm5rDa/FXGbSBIEPnHIhLIOigs5z9wgeLpzX2my0Gn+Jo1I5EiZN7PuST
 W8pgP8zogsLBpkQBnSyEhrg6JXnYrd4CMzOpLKeVIE1G269IujOsjvFRFTxYjSxkZ3g4
 NwTfAZONldTF4Z2raK1q8CBqGrx1aO/0to6v8GQwWBKPNUGcbrtklWtSF9NsDUavVSQ+
 /p75+GCng9oaLwqS14HCl3wTFkrRp2GOYjVY/Z2yVrd2DR6DRbXZqRc7MVwUC5ofjkp6
 hLfg==
X-Gm-Message-State: AOAM532kEahZ+7JRodu/CxbOz33aPxKIW3+FgPX1GK84XCI6NM868s8E
 9KwrXWYAOnlQnG7Q5Arj4t6t4c580whqkvJUjGo=
X-Google-Smtp-Source: ABdhPJzs4PbRaCPRcgfRPZBeio1quZo1MWjzIOpdEAl/6LXYkZpdfPCUDYVX8KoXGuGwA5IRjBteBXJz3W8L2ChvrJI=
X-Received: by 2002:a92:7309:: with SMTP id o9mr6235220ilc.5.1595534121360;
 Thu, 23 Jul 2020 12:55:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAD737DGhAiRUb6WZz_RQ6GwfXwH3CFB_5iOmzvnJwSPoncXdLg@mail.gmail.com>
 <d8dbaf42-0f81-f25e-ea47-28b29c44fcd1@huawei.com>
In-Reply-To: <d8dbaf42-0f81-f25e-ea47-28b29c44fcd1@huawei.com>
Date: Thu, 23 Jul 2020 14:55:10 -0500
Message-ID: <CAH2r5mtmuCH5offu-rv1-Kvf_oiQYmHx1rTONe2mEW5JgbXcdQ@mail.gmail.com>
Subject: Re: PROBLEM: mv command fails: "File exists" on cifs mount on
 kernel>=5.7.8
To: "zhangxiaoxu (A)" <zhangxiaoxu5@huawei.com>
Content-Type: multipart/mixed; boundary="00000000000088060a05ab213c67"
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

--00000000000088060a05ab213c67
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

patch reverted


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

--00000000000088060a05ab213c67
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-Revert-cifs-Fix-the-target-file-was-deleted-when-ren.patch"
Content-Disposition: attachment; 
	filename="0001-Revert-cifs-Fix-the-target-file-was-deleted-when-ren.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kcz7sjcu0>
X-Attachment-Id: f_kcz7sjcu0

RnJvbSBmYTFmZDJkOGVlZjg5YmIxNjk2YzY0YjgxYTkxMWMxZjdhMTIyMjJkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFRodSwgMjMgSnVsIDIwMjAgMTQ6NDE6MjkgLTA1MDAKU3ViamVjdDogW1BBVENIXSBS
ZXZlcnQgImNpZnM6IEZpeCB0aGUgdGFyZ2V0IGZpbGUgd2FzIGRlbGV0ZWQgd2hlbiByZW5hbWUK
IGZhaWxlZC4iCgpUaGlzIHJldmVydHMgY29tbWl0IDlmZmFkOTI2M2I0NjdlZmQ4ZjhkYzdhZTE5
NDFhMGE2NTVhMmJhYjIuCgpVcG9uIGFkZGl0aW9uYWwgdGVzdGluZyB3aXRoIG9sZGVyIHNlcnZl
cnMsIGl0IHdhcyBmb3VuZCB0aGF0CnRoZSBvcmlnaW5hbCBjb21taXQgaW50cm9kdWNlZCBhIHJl
Z3Jlc3Npb24gd2hlbiB1c2luZyB0aGUgb2xkIFNNQjEKZGlhbGVjdCBhbmQgcnN5bmNpbmcgb3Zl
ciBhbiBleGlzdGluZyBmaWxlLgoKVGhlIHBhdGNoIHdpbGwgbmVlZCB0byBiZSByZXNwdW4gdG8g
YWRkcmVzcyB0aGlzLCBsaWtlbHkgaW5jbHVkaW5nCmEgbGFyZ2VyIHJlZmFjdG9yaW5nIG9mIHRo
ZSBTTUIxIGFuZCBTTUIzIHJlbmFtZSBjb2RlIHBhdGhzIHRvIG1ha2UKaXQgbGVzcyBjb25mdXNp
bmcgYW5kIGFsc28gdG8gYWRkcmVzcyBzb21lIGFkZGl0aW9uYWwgcmVuYW1lIGVycm9yCmNhc2Vz
IHRoYXQgU01CMyBtYXkgYmUgYWJsZSB0byB3b3JrYXJvdW5kLgoKU2lnbmVkLW9mZi1ieTogU3Rl
dmUgRnJlbmNoIDxzdGZyZW5jaEBtaWNyb3NvZnQuY29tPgpSZXBvcnRlZC1ieTogUGF0cmljayBG
ZXJuaWUgPHBhdHJpY2suZmVybmllQGdtYWlsLmNvbT4KQ0M6IFN0YWJsZSA8c3RhYmxlQHZnZXIu
a2VybmVsLm9yZz4KQWNrZWQtYnk6IFBhdmVsIFNoaWxvdnNreSA8cHNoaWxvdkBtaWNyb3NvZnQu
Y29tPgpBY2tlZC1ieTogWmhhbmcgWGlhb3h1IDx6aGFuZ3hpYW94dTVAaHVhd2VpLmNvbT4KLS0t
CiBmcy9jaWZzL2lub2RlLmMgfCAxMCArKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ZzL2NpZnMvaW5vZGUuYyBi
L2ZzL2NpZnMvaW5vZGUuYwppbmRleCA0OWMzZWE4YWE4NDUuLmNlOTU4MDFlOWI2NiAxMDA2NDQK
LS0tIGEvZnMvY2lmcy9pbm9kZS5jCisrKyBiL2ZzL2NpZnMvaW5vZGUuYwpAQCAtMjA0NCw3ICsy
MDQ0LDYgQEAgY2lmc19yZW5hbWUyKHN0cnVjdCBpbm9kZSAqc291cmNlX2Rpciwgc3RydWN0IGRl
bnRyeSAqc291cmNlX2RlbnRyeSwKIAlGSUxFX1VOSVhfQkFTSUNfSU5GTyAqaW5mb19idWZfdGFy
Z2V0OwogCXVuc2lnbmVkIGludCB4aWQ7CiAJaW50IHJjLCB0bXByYzsKLQlib29sIG5ld190YXJn
ZXQgPSBkX3JlYWxseV9pc19uZWdhdGl2ZSh0YXJnZXRfZGVudHJ5KTsKIAogCWlmIChmbGFncyAm
IH5SRU5BTUVfTk9SRVBMQUNFKQogCQlyZXR1cm4gLUVJTlZBTDsKQEAgLTIxMjEsMTMgKzIxMjAs
OCBAQCBjaWZzX3JlbmFtZTIoc3RydWN0IGlub2RlICpzb3VyY2VfZGlyLCBzdHJ1Y3QgZGVudHJ5
ICpzb3VyY2VfZGVudHJ5LAogCSAqLwogCiB1bmxpbmtfdGFyZ2V0OgotCS8qCi0JICogSWYgdGhl
IHRhcmdldCBkZW50cnkgd2FzIGNyZWF0ZWQgZHVyaW5nIHRoZSByZW5hbWUsIHRyeQotCSAqIHVu
bGlua2luZyBpdCBpZiBpdCdzIG5vdCBuZWdhdGl2ZQotCSAqLwotCWlmIChuZXdfdGFyZ2V0ICYm
Ci0JICAgIGRfcmVhbGx5X2lzX3Bvc2l0aXZlKHRhcmdldF9kZW50cnkpICYmCi0JICAgIChyYyA9
PSAtRUFDQ0VTIHx8IHJjID09IC1FRVhJU1QpKSB7CisJLyogVHJ5IHVubGlua2luZyB0aGUgdGFy
Z2V0IGRlbnRyeSBpZiBpdCdzIG5vdCBuZWdhdGl2ZSAqLworCWlmIChkX3JlYWxseV9pc19wb3Np
dGl2ZSh0YXJnZXRfZGVudHJ5KSAmJiAocmMgPT0gLUVBQ0NFUyB8fCByYyA9PSAtRUVYSVNUKSkg
ewogCQlpZiAoZF9pc19kaXIodGFyZ2V0X2RlbnRyeSkpCiAJCQl0bXByYyA9IGNpZnNfcm1kaXIo
dGFyZ2V0X2RpciwgdGFyZ2V0X2RlbnRyeSk7CiAJCWVsc2UKLS0gCjIuMjUuMQoK
--00000000000088060a05ab213c67--


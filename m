Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EC81C716D0A
	for <lists+samba-technical@lfdr.de>; Tue, 30 May 2023 21:03:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Date:Subject;
	bh=OWUSJ/hZZAO7uMydvXnkQnz6KcFjAw0JgWiRPiSNIxQ=; b=Hr93SwlFXFkB9E3jif+XZw5lei
	VFH/LjxzSjR+hmwg/IrnxilABOTRHMYY+OInoHc3593w0pZY9XfdRKJPOVHbrMM3ahLCuwjgX1ZpR
	apTfqOkakCCZIqjFjWqhlg23u4URpa2xxB/wQQOcplR8Scw6roLYgYr608Zo7olACf8GjrS1doWHH
	KAgdq1nlz/Zk5wKRs0vi7cqn6JtilP22yYD72Iiqlo9cjNIbyN5HCKKPM9EqoBhLa5IbtQF2NoRcW
	l49RQNtRQMD5CT1nuOqssPkOSXEVyHkbdqS2os5S4mAzAVflnX3AMckUPHFEjPefcxS39Nx6KO8Tl
	MoACFkqw==;
Received: from ip6-localhost ([::1]:34392 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q44cV-00DJch-5H; Tue, 30 May 2023 19:02:59 +0000
Received: from mail.lysator.liu.se ([2001:6b0:17:f0a0::3]:55349) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q44cP-00DJcY-9e
 for samba-technical@lists.samba.org; Tue, 30 May 2023 19:02:55 +0000
Received: from mail.lysator.liu.se (localhost [127.0.0.1])
 by mail.lysator.liu.se (Postfix) with ESMTP id 886191BCE2
 for <samba-technical@lists.samba.org>; Tue, 30 May 2023 20:45:31 +0200 (CEST)
Received: by mail.lysator.liu.se (Postfix, from userid 1004)
 id 750111C1A1; Tue, 30 May 2023 20:45:31 +0200 (CEST)
X-Spam-Score: -1.0
Received: from smtpclient.apple (unknown
 [IPv6:2001:9b1:28fa:7900:2d81:de93:4e14:4055])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.lysator.liu.se (Postfix) with ESMTPSA id 74E101BF51;
 Tue, 30 May 2023 20:45:30 +0200 (CEST)
Message-Id: <2B15BE8F-0B54-4448-AB5C-00214ACEE3DA@lysator.liu.se>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: Re: [Samba] O_PATH, FreeBSD & acl_xx_fd
Date: Tue, 30 May 2023 20:45:20 +0200
In-Reply-To: <ZHY3ZwgXSqaYAFLe@jeremy-rocky-laptop>
To: samba-technical@lists.samba.org
References: <8A7A544D-F684-4D16-B8C1-102232284BE1@lysator.liu.se>
 <ZHYwZRcPKnVGp+uM@jeremy-rocky-laptop>
 <3BB0DDBD-E0E6-40BE-AD09-0B314F78E355@lysator.liu.se>
 <ZHY3ZwgXSqaYAFLe@jeremy-rocky-laptop>
X-Mailer: Apple Mail (2.3731.600.7)
Content-Type: text/plain;
	charset=utf-8
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
From: Peter Eriksson via samba-technical <samba-technical@lists.samba.org>
Reply-To: Peter Eriksson <pen@lysator.liu.se>
Cc: Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



> On 30 May 2023, at 19:50, Jeremy Allison <jra@samba.org> wrote:
>=20
> On Tue, May 30, 2023 at 07:40:41PM +0200, Peter Eriksson via samba =
wrote:
>> Urgh=E2=80=A6
>>=20
>> I modified the FreeBSD kernel to allow all_xx_fd() calls on O_PATH =
descriptors and that seems make vfs_zfsacl to work fine. Not 100% tested =
but I could atleast view and modify the ACL on some stuff from a Windows =
client via Samba that way.
>>=20
>> I=E2=80=99m not sure I=E2=80=99ll be able to get them to implement =
this =E2=80=9Cofficially=E2=80=9D though. Reading ACLs via an =
O_PATH-opened descriptor seems to be on the way of being added though. I =
can always use my custom kernel but=E2=80=A6 :-)
>>=20
>> Regarding that Linux hack - I wonder if on FreeBSD one might use this =
to do something similar:
>>=20
>>>  A file descriptor created with the O_PATH flag can be opened into =
normal
>>>    (operable) file descriptor by specifying it as the fd argument to
>>>    openat() with empty path and flag O_EMPTY_PATH.  Such an open =
behaves as
>>>    if the current path of the file referenced by fd is passed, =
except that
>>>    the path walk permissions are not checked.  See also the =
description of
>>>    AT_EMPTY_PATH flag for fstatat(2) and related syscalls.
>>=20
>> Hmm=E2=80=A6 I=E2=80=99ll have to test it. Yes, this seems to work - =
after this I can read & write ACLs and stuff:
>>=20
>>  fd =3D openat(fd, =E2=80=9C=E2=80=9D, O_EMPTY_PATH);
>=20
> Excellent ! These are the current places where the
> horrid hack is used:
>=20
> git grep sys_proc_fd_path
> source3/include/proto.h:const char *sys_proc_fd_path(int fd, char =
*buf, size_t bufsize);
> source3/lib/system.c:const char *sys_proc_fd_path(int fd, char *buf, =
size_t bufsize)
> source3/modules/vfs_btrfs.c:    p =3D sys_proc_fd_path(fsp_fd, buf, =
sizeof(buf));
> source3/modules/vfs_default.c:          p =3D sys_proc_fd_path(fd, =
buf, sizeof(buf));
> source3/modules/vfs_default.c:          p =3D sys_proc_fd_path(fd, =
buf, sizeof(buf));
> source3/modules/vfs_default.c:          p =3D sys_proc_fd_path(fd, =
buf, sizeof(buf));
> source3/modules/vfs_default.c:          p =3D sys_proc_fd_path(fd, =
buf, sizeof(buf));
> source3/modules/vfs_default.c:          p =3D sys_proc_fd_path(fd, =
buf, sizeof(buf));
> source3/modules/vfs_default.c:          p =3D sys_proc_fd_path(fd, =
buf, sizeof(buf));
> source3/modules/vfs_default.c:          p =3D sys_proc_fd_path(fd, =
buf, sizeof(buf));
> source3/modules/vfs_default.c:          p =3D sys_proc_fd_path(fd, =
buf, sizeof(buf));
> source3/modules/vfs_gpfs.c:                     p =3D =
sys_proc_fd_path(fd, buf, sizeof(buf));
> source3/modules/vfs_gpfs.c:             p =3D sys_proc_fd_path(fd, =
buf, sizeof(buf));
> source3/modules/vfs_gpfs.c:             p =3D sys_proc_fd_path(fd, =
buf, sizeof(buf));
> source3/modules/vfs_gpfs.c:             p =3D sys_proc_fd_path(fd, =
buf, sizeof(buf));
> source3/modules/vfs_posixacl.c:         proc_fd_path =3D =
sys_proc_fd_path(fd, buf, sizeof(buf));
> source3/modules/vfs_posixacl.c:         proc_fd_path =3D =
sys_proc_fd_path(fd, buf, sizeof(buf));
> source3/modules/vfs_posixacl.c:         proc_fd_path =3D =
sys_proc_fd_path(fd, buf, sizeof(buf));
> source3/smbd/open.c:    p =3D sys_proc_fd_path(old_fd, buf, =
sizeof(buf));
>=20
> So these are all the places you're going to run into the
> same problem with O_PATH opened fd's.
>=20

If I=E2=80=99m reading that code correctly most of those places seems to =
(fchown used as an example):

1. If fsp is not a pathref then: fchown(fsp_get_io_fd(fsp)=E2=80=A6)
2. If have_proc_fds is true, then use sys_proc_fd_path to operate on a =
path (chown)
3. Then as a last fallback get the path from fsp->fsp_name->base_name) =
and operate on a path (chown)

That is probably why things seems to work for most stuff for me - except =
the vfs_zfsacl module that doesn=E2=80=99t try to use the #3).=20

Hmm. Use openat() or the last fallback? Decisions decisions :-) openat() =
feels like a better solution but I=E2=80=99m not sure=E2=80=A6=20

- Peter


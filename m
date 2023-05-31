Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF9D717675
	for <lists+samba-technical@lfdr.de>; Wed, 31 May 2023 08:00:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Date:Subject;
	bh=y4sfVYii0Sj51wldLf1q5P1W69G9B/VZksOTKmi0VVE=; b=RfOQ8APzczNAEucWFNGwbnqlCZ
	N4ZnVTq+dSrdOm3R6VprmyMtO6POQPv0b2HamemLAoEpCB7NkIzxo3B/L8jrMwtMmQxfTefAu3jXm
	z37Xtkpwmu/YnzT0j4Te3fNldDH7ny0IQPYLPs437+Xl5mS+h4d/fXdZWTMZZqvedz/uQfwiR/ALF
	WXG5ictMRRQ4HaWiBvRaCqGfIx/BpLGfyTTp+Pc7e1q8S3rkwwdCXv95l7qDQfqbWU/xN/KUu+pg/
	RVJbt7pK1YZOcoScHRg9GLLC25ol74IFJgCyJ05JZMwHLkoq7l2b2+3jZ4jY+R4v73DHXLuD6EVhF
	dkSzQOog==;
Received: from ip6-localhost ([::1]:42764 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q4Erc-00DPU2-4x; Wed, 31 May 2023 05:59:16 +0000
Received: from mail.lysator.liu.se ([2001:6b0:17:f0a0::3]:36973) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q4ErW-00DPTt-SO
 for samba-technical@lists.samba.org; Wed, 31 May 2023 05:59:13 +0000
Received: from mail.lysator.liu.se (localhost [127.0.0.1])
 by mail.lysator.liu.se (Postfix) with ESMTP id D33341C97D
 for <samba-technical@lists.samba.org>; Wed, 31 May 2023 07:59:05 +0200 (CEST)
Received: by mail.lysator.liu.se (Postfix, from userid 1004)
 id D1C551C97C; Wed, 31 May 2023 07:59:05 +0200 (CEST)
X-Spam-Score: -1.0
Received: from smtpclient.apple (unknown [IPv6:2001:6b0:17:f002:1000::4f9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.lysator.liu.se (Postfix) with ESMTPSA id CC69C1CEAB;
 Wed, 31 May 2023 07:59:04 +0200 (CEST)
Message-Id: <E949EFCA-E478-41F2-8DA0-7BB7B5220431@lysator.liu.se>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [Samba] O_PATH, FreeBSD & acl_xx_fd
Date: Wed, 31 May 2023 07:58:54 +0200
In-Reply-To: <ZHZKnEOy9zVDVvhw@jeremy-rocky-laptop>
To: samba-technical@lists.samba.org
References: <8A7A544D-F684-4D16-B8C1-102232284BE1@lysator.liu.se>
 <ZHYwZRcPKnVGp+uM@jeremy-rocky-laptop>
 <3BB0DDBD-E0E6-40BE-AD09-0B314F78E355@lysator.liu.se>
 <ZHY3ZwgXSqaYAFLe@jeremy-rocky-laptop>
 <2B15BE8F-0B54-4448-AB5C-00214ACEE3DA@lysator.liu.se>
 <ZHZKnEOy9zVDVvhw@jeremy-rocky-laptop>
X-Mailer: Apple Mail (2.3731.500.231)
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



> On 30 May 2023, at 21:12, Jeremy Allison via samba-technical =
<samba-technical@lists.samba.org> wrote:
>=20
> On Tue, May 30, 2023 at 08:45:20PM +0200, Peter Eriksson via =
samba-technical wrote:
>>> On 30 May 2023, at 19:50, Jeremy Allison <jra@samba.org> wrote:
>>>=20
>>> Excellent ! These are the current places where the
>>> horrid hack is used:
>>>=20
>>> git grep sys_proc_fd_path
>>> source3/include/proto.h:const char *sys_proc_fd_path(int fd, char =
*buf, size_t bufsize);
>>> source3/lib/system.c:const char *sys_proc_fd_path(int fd, char *buf, =
size_t bufsize)
>>> source3/modules/vfs_btrfs.c:    p =3D sys_proc_fd_path(fsp_fd, buf, =
sizeof(buf));
>>> source3/modules/vfs_default.c:          p =3D sys_proc_fd_path(fd, =
buf, sizeof(buf));
>>> source3/modules/vfs_default.c:          p =3D sys_proc_fd_path(fd, =
buf, sizeof(buf));
>>> source3/modules/vfs_default.c:          p =3D sys_proc_fd_path(fd, =
buf, sizeof(buf));
>>> source3/modules/vfs_default.c:          p =3D sys_proc_fd_path(fd, =
buf, sizeof(buf));
>>> source3/modules/vfs_default.c:          p =3D sys_proc_fd_path(fd, =
buf, sizeof(buf));
>>> source3/modules/vfs_default.c:          p =3D sys_proc_fd_path(fd, =
buf, sizeof(buf));
>>> source3/modules/vfs_default.c:          p =3D sys_proc_fd_path(fd, =
buf, sizeof(buf));
>>> source3/modules/vfs_default.c:          p =3D sys_proc_fd_path(fd, =
buf, sizeof(buf));
>>> source3/modules/vfs_gpfs.c:                     p =3D =
sys_proc_fd_path(fd, buf, sizeof(buf));
>>> source3/modules/vfs_gpfs.c:             p =3D sys_proc_fd_path(fd, =
buf, sizeof(buf));
>>> source3/modules/vfs_gpfs.c:             p =3D sys_proc_fd_path(fd, =
buf, sizeof(buf));
>>> source3/modules/vfs_gpfs.c:             p =3D sys_proc_fd_path(fd, =
buf, sizeof(buf));
>>> source3/modules/vfs_posixacl.c:         proc_fd_path =3D =
sys_proc_fd_path(fd, buf, sizeof(buf));
>>> source3/modules/vfs_posixacl.c:         proc_fd_path =3D =
sys_proc_fd_path(fd, buf, sizeof(buf));
>>> source3/modules/vfs_posixacl.c:         proc_fd_path =3D =
sys_proc_fd_path(fd, buf, sizeof(buf));
>>> source3/smbd/open.c:    p =3D sys_proc_fd_path(old_fd, buf, =
sizeof(buf));
>>>=20
>>> So these are all the places you're going to run into the
>>> same problem with O_PATH opened fd's.
>>>=20
>>=20
>> If I=E2=80=99m reading that code correctly most of those places seems =
to (fchown used as an example):
>>=20
>> 1. If fsp is not a pathref then: fchown(fsp_get_io_fd(fsp)=E2=80=A6)
>> 2. If have_proc_fds is true, then use sys_proc_fd_path to operate on =
a path (chown)
>> 3. Then as a last fallback get the path from =
fsp->fsp_name->base_name) and operate on a path (chown)
>>=20
>> That is probably why things seems to work for most stuff for me - =
except the vfs_zfsacl module that doesn=E2=80=99t try to use the #3).
>>=20
>> Hmm. Use openat() or the last fallback? Decisions decisions :-) =
openat() feels like a better solution but I=E2=80=99m not sure=E2=80=A6
>=20
> Use openat() - DO NOT USE THE LAST FALLBACK. It is insecure, and
> only there for old systems that have no O_PATH.
>=20
> It might be worth your while to refactor this code so
> that the FreeBSD openat(fd, "", O_EMPTY_PATH) thing is
> an option instead of (2).

Ok :-)

Uploaded a new patch to bug 15376 that implements the openat() fix for =
vfs_zfsacl.c, vfs_default.c and smbd/open.c and it seems to work. Needs =
a bit more testing/verification though to make sure I=E2=80=99m not =
doing something stupid=E2=80=A6 :-)

https://bugzilla.samba.org/show_bug.cgi?id=3D15376=EF=BF=BC

- Peter



Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA60716B94
	for <lists+samba-technical@lfdr.de>; Tue, 30 May 2023 19:51:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=vrUDmwwu1wMWJ+p1OyVXGSVl6dqMSh4TMySnKMRNr5E=; b=ALCv6JHA3rC/5bn0EqLJ/6zLrN
	9sBPyQZUjyAgzZ89Ch7zk5OQDRyIuir+NjZYLvZTCq7YGiom3/nTJD45rZDtlJvcFsHii6s6/Mlbi
	U7765fLBAnNWXYa8a3AElFrj/pe4O2K9eEVmdgnmO5uYGwekcSxsEwCld15YTLjEM2R+gIIPpkmPy
	L/RDAQDC04DbZGu0TB/FblXApIHMfBEd/usW7rES7GIa6dV/7T5Dy2O69SdZegVh+KfTuLMSPZSvc
	rWGi8kBKb9QzrQvLs1b1/kUp6hgzNrtBPDnb4IVmEeMP8nUQvBEj0hKqpZsKjX0zMyIKw6EL0LuNR
	CDOq37bQ==;
Received: from ip6-localhost ([::1]:40258 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q43UZ-00DHYq-6L; Tue, 30 May 2023 17:50:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13682) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q43UR-00DHYI-2U; Tue, 30 May 2023 17:50:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=vrUDmwwu1wMWJ+p1OyVXGSVl6dqMSh4TMySnKMRNr5E=; b=EHZz2y1HpCUsh4js8v0l3faBsI
 t9INOsxmPLnvBPMC7aOdUlbwCONrXH/TbH9dHNSn90Ns16pvApeemFn+2m3/jtpYq0vbCjTGuYj12
 c907MBxwN6E5AQPMXSjyui0fHCk76Cl2FCMwTy/C3xdUyGD690nbSAtxmIWGZ7fgcJPTsMn/P/skp
 i3Bl+YD31nGtKRN41RV8lgKTxKWap27sR/f2nWD19+rCeXtfeYWw5d2YKubn7n7TFHZPELYDGxSJK
 EN4Ieyl8qUaElahaiB1faYFmTDkytLb9Tg3yYMmOyGWIZAZReS4A2RD38QOt3BLV1XCgY6Sn8T6oH
 moD0ZlrpoGAwAuuaaHFQMb4NHrmc6jrVmDjq57Xk397iEcfeAgJpkf5BEepR3NQ5xiBujBEI8/5Km
 o3Vd4W4Y/Zk8MHvuxD3BjBZ+QBNfmpR1enClARNN0p+rSnMqQ1Na6fQNElysKUMqoynTwuuyk8P02
 RJRbq7CsEgkKBfD/umsvPuJx;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1q43UQ-000euG-0b; Tue, 30 May 2023 17:50:34 +0000
Date: Tue, 30 May 2023 10:50:31 -0700
To: Peter Eriksson <pen@lysator.liu.se>
Subject: Re: [Samba] O_PATH, FreeBSD & acl_xx_fd
Message-ID: <ZHY3ZwgXSqaYAFLe@jeremy-rocky-laptop>
References: <8A7A544D-F684-4D16-B8C1-102232284BE1@lysator.liu.se>
 <ZHYwZRcPKnVGp+uM@jeremy-rocky-laptop>
 <3BB0DDBD-E0E6-40BE-AD09-0B314F78E355@lysator.liu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3BB0DDBD-E0E6-40BE-AD09-0B314F78E355@lysator.liu.se>
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
Cc: SAMBA Mailing List <samba@lists.samba.org>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, May 30, 2023 at 07:40:41PM +0200, Peter Eriksson via samba wrote:
>Urgh…
>
>I modified the FreeBSD kernel to allow all_xx_fd() calls on O_PATH descriptors and that seems make vfs_zfsacl to work fine. Not 100% tested but I could atleast view and modify the ACL on some stuff from a Windows client via Samba that way.
>
>I’m not sure I’ll be able to get them to implement this “officially” though. Reading ACLs via an O_PATH-opened descriptor seems to be on the way of being added though. I can always use my custom kernel but… :-)
>
>Regarding that Linux hack - I wonder if on FreeBSD one might use this to do something similar:
>
>>   A file descriptor created with the O_PATH flag can be opened into normal
>>     (operable) file descriptor by specifying it as the fd argument to
>>     openat() with empty path and flag O_EMPTY_PATH.  Such an open behaves as
>>     if the current path of the file referenced by fd is passed, except that
>>     the path walk permissions are not checked.  See also the description of
>>     AT_EMPTY_PATH flag for fstatat(2) and related syscalls.
>
>Hmm… I’ll have to test it. Yes, this seems to work - after this I can read & write ACLs and stuff:
>
>   fd = openat(fd, “”, O_EMPTY_PATH);

Excellent ! These are the current places where the
horrid hack is used:

git grep sys_proc_fd_path
source3/include/proto.h:const char *sys_proc_fd_path(int fd, char *buf, size_t bufsize);
source3/lib/system.c:const char *sys_proc_fd_path(int fd, char *buf, size_t bufsize)
source3/modules/vfs_btrfs.c:    p = sys_proc_fd_path(fsp_fd, buf, sizeof(buf));
source3/modules/vfs_default.c:          p = sys_proc_fd_path(fd, buf, sizeof(buf));
source3/modules/vfs_default.c:          p = sys_proc_fd_path(fd, buf, sizeof(buf));
source3/modules/vfs_default.c:          p = sys_proc_fd_path(fd, buf, sizeof(buf));
source3/modules/vfs_default.c:          p = sys_proc_fd_path(fd, buf, sizeof(buf));
source3/modules/vfs_default.c:          p = sys_proc_fd_path(fd, buf, sizeof(buf));
source3/modules/vfs_default.c:          p = sys_proc_fd_path(fd, buf, sizeof(buf));
source3/modules/vfs_default.c:          p = sys_proc_fd_path(fd, buf, sizeof(buf));
source3/modules/vfs_default.c:          p = sys_proc_fd_path(fd, buf, sizeof(buf));
source3/modules/vfs_gpfs.c:                     p = sys_proc_fd_path(fd, buf, sizeof(buf));
source3/modules/vfs_gpfs.c:             p = sys_proc_fd_path(fd, buf, sizeof(buf));
source3/modules/vfs_gpfs.c:             p = sys_proc_fd_path(fd, buf, sizeof(buf));
source3/modules/vfs_gpfs.c:             p = sys_proc_fd_path(fd, buf, sizeof(buf));
source3/modules/vfs_posixacl.c:         proc_fd_path = sys_proc_fd_path(fd, buf, sizeof(buf));
source3/modules/vfs_posixacl.c:         proc_fd_path = sys_proc_fd_path(fd, buf, sizeof(buf));
source3/modules/vfs_posixacl.c:         proc_fd_path = sys_proc_fd_path(fd, buf, sizeof(buf));
source3/smbd/open.c:    p = sys_proc_fd_path(old_fd, buf, sizeof(buf));

So these are all the places you're going to run into the
same problem with O_PATH opened fd's.

FYI, this really belongs on samba-technical, not samba.


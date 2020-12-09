Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F30E02D4FC1
	for <lists+samba-technical@lfdr.de>; Thu, 10 Dec 2020 01:47:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=ytTUAkXXtpnSsUKGOApyaccHV4bkuqFAg2N1kDZUQac=; b=k47nqFGcsRpb63PnO5+jmclqx5
	mdM+ai4coSpHkYbwrXBogdh0XPvE0A/j5/rNmB+oQyTaaOP+SIh1xbdMQkmD6H90R9lBxe4E6Ba8H
	bvkvyVSVf1Yi7DFAWsEKI9LJ58DJagYqg2bHkw4cyo19xJe7+PGByrN5naQDeoroNhx1C4uUqBJix
	rYUSc/rCYmWlbsGbcwzX7aFTcKx0u3cDOwxcSpdm3Jr8aUcKieERzhY58FWw4VuDuE2MmnxO+GPSW
	mHiHrDJsk779fNyMausAY2x7QNiAFDdUSQWQ/baFMZrd5t6ACq7ixgJqPjas+olbx6CqhOPBSupsH
	NjHc338g==;
Received: from ip6-localhost ([::1]:30332 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1knA7F-000MrJ-RQ; Thu, 10 Dec 2020 00:47:29 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:43935) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1knA7A-000MrB-8c
 for samba-technical@lists.samba.org; Thu, 10 Dec 2020 00:47:27 +0000
Received: by mail-pf1-x433.google.com with SMTP id c12so2389764pfo.10
 for <samba-technical@lists.samba.org>; Wed, 09 Dec 2020 16:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=edu.singelland.nl; s=leerlingen;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=iWJo7vlBgJv4pypEpCZWz147BMPtdcJJ4276BxBDHVk=;
 b=YEyEppsrGmvFu5Si4f3qjt/A2njZE0UwHvLaqvtgOAt403IkrBPErDg6UdzaOtaXnQ
 X+jBbiFrwTTtHmZh8gjTkFkGOcLQnRT0MIiaNxnKZbLujL0LuOFk3M6Ofvxm44EVuFb7
 PAqwPahwFEZ3Y5ybvK5Dz7caFVOUhRGysfH2GXO7Hh9IrWH5vx8OBmoqBdnYfpHvhJa4
 K/qoGnYlvKKkdtsbSdrAQd6/X5qvo5N+IZKqM5/xcT49HGrXW2CGHDrYjGytOZ6heWOb
 cTryKOAI4TkYIaNt9IfJoPG50XH/PqGRjK71Ygou1oQ6Z1xmYp/ZsPj51n//xMdckzZM
 WcjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=iWJo7vlBgJv4pypEpCZWz147BMPtdcJJ4276BxBDHVk=;
 b=lCRPrgvjPeVnoYjwYwpIWJG3p7BsUf5ntbbG3PzGoO5aw+Xz+yAy5aWD8JbHIBzVgj
 SzOTyCWuwmzs9CMkJhI52N9rWoJ3flxBj8UXA4YFJXpwpNyAOYxn2T3EBmTWhwY+E85O
 dGIM+4ys8xuJJ/8narIX6SBsNEX6DNzDIx2mIOnB+cLZ+/nyg7oW6HR5PzeK+YS4AQUh
 48Ck3lSFHLL5/DhMlBd0IYHUfHKqp47qytNtyRYm0vp3J+oBgf+wnYce2wLS93pSrR9r
 Pf1RS/wuzfp3XLkyIA04L9CaIXcfjmXxyBBZd5MK9uhitOt+oFpLcfj7Ta55z/UlzknC
 GH/Q==
X-Gm-Message-State: AOAM532mexQdINYMuQa7jTXTrIOG9zrs/NKa0ozS6eaAJKBFmFfulirR
 5QpyJ67C/qIcA2aVT9gXbbd8ZDkJMlV4ZfmibMLEA28nLJht
X-Google-Smtp-Source: ABdhPJzWUtbodUIrh66nr/g2sFUnOWieWdfR48ECwsjhsTlZ/C9SIdkzvKEGDgzd7c4mui6XbO8JBaaWQKaQe1Tkq90=
X-Received: by 2002:a63:1c63:: with SMTP id c35mr2096759pgm.14.1607521491858; 
 Wed, 09 Dec 2020 05:44:51 -0800 (PST)
MIME-Version: 1.0
References: <E1kmMnh-00CJLG-R0@hrx0.samba.org>
In-Reply-To: <E1kmMnh-00CJLG-R0@hrx0.samba.org>
Date: Wed, 9 Dec 2020 14:44:39 +0100
Message-ID: <CAAr6HVVLryfXkQZ6gKN_EM7Skyn3myD58j4ZpU9uRj4XNrCQyg@mail.gmail.com>
Subject: Re: [SCM] Samba Shared Repository - branch master updated
To: samba-technical@lists.samba.org
Content-Type: text/plain; charset="UTF-8"
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
From: Bo Bosma via samba-technical <samba-technical@lists.samba.org>
Reply-To: Bo Bosma <130273@edu.singelland.nl>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hai Steve or sum like that,
STOP FUCKING E MAILING ME IDK WHO YOU ARE
thank very much,
bye bitch

Op ma 7 dec. 2020 om 21:08 schreef Jeremy Allison <jra@samba.org>:

> The branch, master has been updated
>        via  14768d0d544 s4:torture:smb2: remove unused fallback defines in
> oplock.c
>        via  30c1c153650 s3:smbd: remove unused fallback defines in
> oplock_linux.c
>        via  6d4ce53ecdc s3/wscript: only check for F_SETLEASE being
> available at compile time
>        via  1b2e67641f2 s3/wscript: remove unused check for F_NOTIFY
>       from  058f96f4c4e s4/samba: call force_check_log_size() in
> standard_new_task()
>
> https://git.samba.org/?p=samba.git;a=shortlog;h=master
>
>
> - Log -----------------------------------------------------------------
> commit 14768d0d54420fe19d914fe4e507cbbf5cb84434
> Author: Stefan Metzmacher <metze@samba.org>
> Date:   Mon Dec 7 12:06:11 2020 +0100
>
>     s4:torture:smb2: remove unused fallback defines in oplock.c
>
>     F_SETLEASE/F_SETSIG were all included in the kernel
>     and glibc in 2002, there's no need to have fallbacks 18 years later.
>
>     Signed-off-by: Stefan Metzmacher <metze@samba.org>
>     Reviewed-by: Jeremy Allison <jra@samba.org>
>
>     Autobuild-User(master): Jeremy Allison <jra@samba.org>
>     Autobuild-Date(master): Mon Dec  7 20:07:18 UTC 2020 on sn-devel-184
>
> commit 30c1c153650ec23860b59bbcd86bb8e6a1460c42
> Author: Stefan Metzmacher <metze@samba.org>
> Date:   Mon Dec 7 12:06:11 2020 +0100
>
>     s3:smbd: remove unused fallback defines in oplock_linux.c
>
>     F_GETLEASE/F_SETLEASE/F_SETSIG were all included in the kernel
>     and glibc in 2002, there's no need to have fallbacks 18 years later.
>
>     Signed-off-by: Stefan Metzmacher <metze@samba.org>
>     Reviewed-by: Jeremy Allison <jra@samba.org>
>
> commit 6d4ce53ecdc92cd9693b8e63166ec672209b7268
> Author: Stefan Metzmacher <metze@samba.org>
> Date:   Mon Dec 7 11:38:59 2020 +0100
>
>     s3/wscript: only check for F_SETLEASE being available at compile time
>
>     F_GETLEASE/F_SETLEASE are available (at least) since Linux 2.4.0 from
>     2002.
>
>     We also should not have the configure check depend on the filesystem
>     we find at build time. It's very common that the build-environment is
>     much more restricted than the runtime-environment will be.
>
>     As a history we had this check on Samba 3.6:
>
>      AC_CACHE_CHECK([for Linux kernel
> oplocks],samba_cv_HAVE_KERNEL_OPLOCKS_LINUX,[
>      AC_TRY_RUN([
>      #include <sys/types.h>
>      #include <fcntl.h>
>      #ifndef F_GETLEASE
>      #define F_GETLEASE 1025
>      #endif
>      main() {
>             int fd = open("/dev/null", O_RDONLY);
>             return fcntl(fd, F_GETLEASE, 0) == -1;
>      }
>      ],
>
>  samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=yes,samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=no,samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=cross)])
>      if test x"$samba_cv_HAVE_KERNEL_OPLOCKS_LINUX" = x"yes"; then
>         AC_DEFINE(HAVE_KERNEL_OPLOCKS_LINUX,1,[Whether to use linux kernel
> oplocks])
>      fi
>
>     which didn't depend on the filesystem.
>
>     Then we got a broken check introduced in Samba 4.0 (a copy of the
>     F_NOTIFY check):
>
>      # Check for Linux kernel oplocks
>      conf.CHECK_CODE('''
>      #include <sys/types.h>
>      #include <fcntl.h>
>      #include <signal.h>
>      #ifndef F_NOTIFY
>      #define F_NOTIFY 1026
>      #endif
>      main() {
>              exit(fcntl(open("/tmp", O_RDONLY), F_NOTIFY, 0) == -1 ?  1 :
> 0);
>      }''', 'HAVE_KERNEL_OPLOCKS_LINUX', addmain=False, execute=True,
>             msg="Checking for Linux kernel oplocks")
>
>     this got "fixed" in Samba 4.7 (and backports to 4.6, 4.5 and 4.4) into
>
>      # Check for Linux kernel oplocks
>      conf.CHECK_CODE('''
>      #include <sys/types.h>
>      #include <fcntl.h>
>      #include <signal.h>
>      #ifndef F_GETLEASE
>      #define F_GETLEASE 1025
>      #endif
>      main() {
>              exit(fcntl(open("/tmp", O_RDONLY), F_GETLEASE, 0) == -1 ?  1
> : 0);
>      }''', 'HAVE_KERNEL_OPLOCKS_LINUX', addmain=False, execute=True,
>             msg="Checking for Linux kernel oplocks")
>
>     Lately it became dependend on the filesystem in the build-environment:
>
>      # Check for Linux kernel oplocks
>      conf.CHECK_CODE('''
>      #include <sys/types.h>
>      #include <fcntl.h>
>      #include <signal.h>
>      #ifndef F_GETLEASE
>      #define F_GETLEASE 1025
>      #endif
>      main() {
>            const char *fname="/tmp/oplock-test.txt";
>            int fd = open(fname, O_RDWR|O_CREAT, 0644);
>            int ret = fcntl(fd, F_SETLEASE, F_WRLCK);
>            unlink(fname);
>            return (ret == -1) ? 1 : 0;
>      }''', 'HAVE_KERNEL_OPLOCKS_LINUX', addmain=False, execute=True,
>             msg="Checking for Linux kernel oplocks")
>
>     Now we just check for F_SETLEASE being available in linux/fcntl.h.
>
>     Signed-off-by: Stefan Metzmacher <metze@samba.org>
>     Reviewed-by: Jeremy Allison <jra@samba.org>
>
> commit 1b2e67641f2df766d099696a11e7b5122f5851cf
> Author: Stefan Metzmacher <metze@samba.org>
> Date:   Mon Dec 7 11:24:43 2020 +0100
>
>     s3/wscript: remove unused check for F_NOTIFY
>
>     There're no references to F_NOTIFY nor HAVE_KERNEL_CHANGE_NOTIFY in the
>     code, so the configure check is not needed at all.
>
>     We only use the inotify or fam abstractions.
>
>     Signed-off-by: Stefan Metzmacher <metze@samba.org>
>     Reviewed-by: Jeremy Allison <jra@samba.org>
>
> -----------------------------------------------------------------------
>
> Summary of changes:
>  source3/smbd/oplock_linux.c            | 12 ------------
>  source3/wscript                        | 28 ++--------------------------
>  source4/ntvfs/sysdep/wscript_configure |  1 -
>  source4/torture/smb2/oplock.c          |  8 --------
>  4 files changed, 2 insertions(+), 47 deletions(-)
>
>
> Changeset truncated at 500 lines:
>
> diff --git a/source3/smbd/oplock_linux.c b/source3/smbd/oplock_linux.c
> index 44ed976b92c..a4f79297abd 100644
> --- a/source3/smbd/oplock_linux.c
> +++ b/source3/smbd/oplock_linux.c
> @@ -25,22 +25,10 @@
>
>  #ifdef HAVE_KERNEL_OPLOCKS_LINUX
>
> -#ifndef F_SETLEASE
> -#define F_SETLEASE     1024
> -#endif
> -
> -#ifndef F_GETLEASE
> -#define F_GETLEASE     1025
> -#endif
> -
>  #ifndef RT_SIGNAL_LEASE
>  #define RT_SIGNAL_LEASE (SIGRTMIN+1)
>  #endif
>
> -#ifndef F_SETSIG
> -#define F_SETSIG 10
> -#endif
> -
>  /*
>   * Call to set the kernel lease signal handler
>   */
> diff --git a/source3/wscript b/source3/wscript
> index a370fae667f..ba02a3586b9 100644
> --- a/source3/wscript
> +++ b/source3/wscript
> @@ -165,33 +165,9 @@ long ret = splice(0,0,1,0,400,SPLICE_F_MOVE);
>          if conf.env.HAVE_SYS_INOTIFY_H:
>             conf.DEFINE('HAVE_INOTIFY', 1)
>
> -    # Check for kernel change notify support
> -    conf.CHECK_CODE('''
> -#ifndef F_NOTIFY
> -#define F_NOTIFY 1026
> -#endif
> -main() {
> -        exit(fcntl(open("/tmp", O_RDONLY), F_NOTIFY, 0) == -1 ?  1 : 0);
> -}''', 'HAVE_KERNEL_CHANGE_NOTIFY', addmain=False, execute=True,
> -        headers='fcntl.h signal.h',
> -        msg="Checking for kernel change notify support")
> -
>      # Check for Linux kernel oplocks
> -    conf.CHECK_CODE('''
> -#include <sys/types.h>
> -#include <fcntl.h>
> -#include <signal.h>
> -#ifndef F_GETLEASE
> -#define F_GETLEASE 1025
> -#endif
> -int main() {
> -       const char *fname="/tmp/oplock-test.txt";
> -       int fd = open(fname, O_RDWR|O_CREAT, 0644);
> -       int ret = fcntl(fd, F_SETLEASE, F_WRLCK);
> -       unlink(fname);
> -       return (ret == -1) ? 1 : 0;
> -}''', 'HAVE_KERNEL_OPLOCKS_LINUX', addmain=False, execute=True,
> -        msg="Checking for Linux kernel oplocks")
> +    if conf.CHECK_DECLS('F_SETLEASE', headers='linux/fcntl.h',
> reverse=True):
> +        conf.DEFINE('HAVE_KERNEL_OPLOCKS_LINUX', 1)
>
>      # Check for kernel share modes
>      conf.CHECK_CODE('''
> diff --git a/source4/ntvfs/sysdep/wscript_configure
> b/source4/ntvfs/sysdep/wscript_configure
> index 274fc08b581..20358848cd3 100644
> --- a/source4/ntvfs/sysdep/wscript_configure
> +++ b/source4/ntvfs/sysdep/wscript_configure
> @@ -10,5 +10,4 @@ if host_os.rfind('sunos') == -1:
>      if (conf.CONFIG_SET('HAVE_SYS_INOTIFY_H')):
>          conf.DEFINE('HAVE_LINUX_INOTIFY', 1)
>
> -conf.CHECK_DECLS('F_SETLEASE', headers='linux/fcntl.h', reverse=True)
>  conf.CHECK_DECLS('SA_SIGINFO', headers='signal.h', reverse=True)
> diff --git a/source4/torture/smb2/oplock.c b/source4/torture/smb2/oplock.c
> index a30657ef596..ad9ef625a5a 100644
> --- a/source4/torture/smb2/oplock.c
> +++ b/source4/torture/smb2/oplock.c
> @@ -5079,18 +5079,10 @@ done:
>
>  #ifdef HAVE_KERNEL_OPLOCKS_LINUX
>
> -#ifndef F_SETLEASE
> -#define F_SETLEASE      1024
> -#endif
> -
>  #ifndef RT_SIGNAL_LEASE
>  #define RT_SIGNAL_LEASE (SIGRTMIN+1)
>  #endif
>
> -#ifndef F_SETSIG
> -#define F_SETSIG 10
> -#endif
> -
>  static int got_break;
>
>  /*
>
>
> --
> Samba Shared Repository
>
>

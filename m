Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B663C95D3
	for <lists+samba-technical@lfdr.de>; Thu, 15 Jul 2021 04:13:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=45B8FijnVSvsUYpRsvfCTK7qEUgAUuhZ472sIPExTk0=; b=pz5h5LA6AFzS82vA5HokwbJLbU
	YKcuBwqAq3y/jZgc28QBsARnQ8X8LjVMCgKlo176LBmkc0r5mrnuK+x1f3+chfW/qNF5GkV/3ktnZ
	XTdQMvG63sxFnumO59CTzdc2VpOu4v+YJv6V6lhFMfV5NIXhTdp1OYtQ940hkHPIdXnPWxXjXVAl8
	r6xzHkxOjBR2GuEiyq5f17SFQeTcm8Hn0b4xP8cLETjjdApE7GBY5VBSPIUE8CryTKebs5BNYoMJA
	uXvxvdKrQ0+R1vVoGviX6JqRyWY1wyxCnFqNg33+QdTbGDhcO05MpkuobopRQbhCdFjT9dmdA35ol
	7OhXolDQ==;
Received: from ip6-localhost ([::1]:53222 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m3qs7-00DgCd-33; Thu, 15 Jul 2021 02:13:07 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:56159) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m3qs2-00DgB7-6A
 for samba-technical@lists.samba.org; Thu, 15 Jul 2021 02:13:05 +0000
Received: by mail-pj1-x1035.google.com with SMTP id l11so2793513pji.5
 for <samba-technical@lists.samba.org>; Wed, 14 Jul 2021 19:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=45B8FijnVSvsUYpRsvfCTK7qEUgAUuhZ472sIPExTk0=;
 b=AQZYUQ7VsenItqsgVM7wPazJVc3Cddy2b5JsNMlpnEkncS6Dw3sABfAY1yTDdL2n/Q
 nNHljmLrUoPLiWG9jz6f9Lhyd+rPDKGHXqG98Ah4aShjo+H5PLJIdpWTUxBHzzVDjE1d
 AhVEXjMyht+S94JDxOw2IF0noxJEi9CA+0ErLphqc7x/AnqFZ4VwjEpkj4Pz7xN2NI3s
 oGvqEW6QNPe552ZBiAWLbDH9ifP8xkI1c9myTMWpe5ERK+pAwR5ewhKu4bbYSZAB3zeH
 18s71ML13hwXCf3mofAdvjfCxunTFm2qYedU417+OgdhiffW122gDGCLCY4F5rzwnSZQ
 nZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=45B8FijnVSvsUYpRsvfCTK7qEUgAUuhZ472sIPExTk0=;
 b=V9J9k8nDtGQ62sTKYESU89AnspsUCxabC3pLIPJsnUj+RfsfaMNNO+er4rcAWDCZAo
 Pva4+eczfdF/Z5i54D5AvvDMc5aW+2CAF/Wk7joknNsrvwKR3QaXWfxYKSEQ8j6gdnlL
 lyNYCluuDkXHFDJwWeVbmHLb3Sh0MsVrMCLlMr4zWPAIT6s1K3zuH89D5NJ7oWuP3KLx
 /dTm5bE/36ZQeggvrnNkd1dE1+1Q7mefeRgsn5gRDoTD8li8XYYIeN+rU9+spbRCxb/M
 6FHKU6HxXnP9dTt9utxZhS50djDMeKnaWmYv1heZsv+xLgE576Xf1KlG7/HvdyPBoJBQ
 xpew==
X-Gm-Message-State: AOAM530Fiuvolw5seA0K4Gljm4zGIa1La7rmZ28+5Mw+WFKF94qRqhXY
 LRaTVIzkhxOHFjujxnamluQ90bYPYZpCCGlcMK2FSW+t
X-Google-Smtp-Source: ABdhPJyxfSedzayCFR/XAzNdPQTccM4pjVufxWjzb9mW0TfPEH3kNThYELaiGQtzvGMYt+T0Fo5DtnW0/Urt2gDfl7I=
X-Received: by 2002:a17:90a:ae0c:: with SMTP id
 t12mr6686707pjq.149.1626315177858; 
 Wed, 14 Jul 2021 19:12:57 -0700 (PDT)
MIME-Version: 1.0
References: <2450252.vFx2qVVIhK@edfu>
 <CAJ+X7mSHG_OUyNF2EiuvEtCQYJ4vOEH67kW0+1rOsLNp4BqaaQ@mail.gmail.com>
In-Reply-To: <CAJ+X7mSHG_OUyNF2EiuvEtCQYJ4vOEH67kW0+1rOsLNp4BqaaQ@mail.gmail.com>
Date: Thu, 15 Jul 2021 12:12:46 +1000
Message-ID: <CAJ+X7mTSNvN=6v0-WSz_89Gjkg5rCf-AmDcVLo=LLmOhSWkyMw@mail.gmail.com>
Subject: Fwd: CTDB Segfault in a container-based env - Looking for pointers
To: Samba Technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Amitay Isaacs via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amitay Isaacs <amitay@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi John,

There are certain assumptions made in CTDB assuming it's running on a
normal system. When running CTDB in a container, those assumptions are
not valid any more and you might get unexpected behaviour.

One such assumption is that init (in some form) has the pid of 1 and
CTDB daemon will never have PID of 1.  Obviously this is not true in
your case.  From the logs you can see that the CTDB daemon is started
as PID 1. In general, CTDB relies on init (in some form) to start/stop
various file services (smb, nfs, etc.) via the event scripts.  So,
working init is a requirement for normal operation of CTDB.

What are you trying to do exactly?  You cannot put CTDB in a container
on its own without Samba daemons.

Amitay.

On Thu, Jul 15, 2021 at 3:43 AM John Mulligan via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Hi Team,
>
> I'm currently experimenting with running CTDB as a component in a container
> based environment (OCI/docker style).
> Unlike smbd and winbind, which were fairly easy to containerize, CTDB is
> proving a bit more tricky. Specifically, I'm seeing a segfault that I can not
> trace to something obvious. I'm reaching out to the list for thoughts and
> suggestions.
>
> First, here's the logging leading up to the segfault:
>
> ctdbd[1]: CTDB starting on node
> ctdbd[1]: Starting CTDBD (Version 4.13.9) as PID: 1
> ctdbd[1]: Created PID file /var/run/ctdb/ctdbd.pid
> ctdbd[1]: Listening to ctdb socket /var/run/ctdb/ctdbd.socket
> ctdbd[1]: Set real-time scheduler priority
> ctdbd[1]: Starting event daemon /usr/libexec/ctdb/ctdb-eventd -P 1 -S 9
> ctdb-eventd[7]: daemon started, pid=7
> ctdb-eventd[7]: startup completed successfully
> ctdb-eventd[7]: listening on /var/run/ctdb/eventd.socket
> ctdbd[1]: Set runstate to INIT (1)
> ctdbd[1]: ../../ctdb/server/eventscript.c:654 Running event init with
> arguments (null)
> ctdbd[1]: ctdb chose network address 10.88.0.5:4379
> ctdbd[1]: PNN is 0
> ctdbd[1]: Not loading public addresses, no file /etc/ctdb/public_addresses
> OH COME ON init
> ctdbd[1]: Vacuuming is disabled for non-volatile database ctdb.tdb
> ctdbd[1]: Attached to database '/var/lib/ctdb/persistent/ctdb.tdb.0' with
> flags 0x400
> ctdbd[1]: Attached to persistent database ctdb.tdb
> ctdbd[1]: Freeze db: ctdb.tdb
> ctdbd[1]: Set lock helper to "/usr/libexec/ctdb/ctdb_lock_helper"
> ctdbd[1]: SIGCHLD from 20 process:20
> ctdbd[1]: Set runstate to SETUP (2)
> ctdbd[1]: ../../ctdb/server/eventscript.c:654 Running event setup with
> arguments
> ctdbd[1]: SIGCHLD from 22 process:22
> ctdbd[1]: ===============================================================
> ctdbd[1]: INTERNAL ERROR: Signal 11: Segmentation fault in pid 1 (4.13.9)
> ctdbd[1]: If you are running a recent Samba version, and if you think this
> problem is not yet fixed in the latest versions, please consider reporting
> this bug, see https://wiki.samba.org/index.php/Bug_Reporting
> ctdbd[1]: ===============================================================
> ctdbd[1]: PANIC (pid 1): Signal 11: Segmentation fault in 4.13.9
> ctdbd[1]: BACKTRACE: 15 stack frames:
> ctdbd[1]:  #0 /lib64/libsamba-util.so.0(log_stack_trace+0x34) [0x7ff1fbf77254]
> ctdbd[1]:  #1 /lib64/libsamba-util.so.0(smb_panic+0x2a) [0x7ff1fbf7c05a]
> ctdbd[1]:  #2 /lib64/libsamba-util.so.0(+0x1c348) [0x7ff1fbf7c348]
> ctdbd[1]:  #3 /lib64/libpthread.so.0(+0x141e0) [0x7ff1fbeff1e0]
> ctdbd[1]:  #4 /usr/sbin/ctdbd(+0x62d94) [0x55fac130fd94]
> ctdbd[1]:  #5 /lib64/libtevent.so.0(tevent_common_invoke_fd_handler+0x7d)
> [0x7ff1fbedfa4d]
> ctdbd[1]:  #6 /lib64/libtevent.so.0(+0xd4e7) [0x7ff1fbee34e7]
> ctdbd[1]:  #7 /lib64/libtevent.so.0(+0x5f57) [0x7ff1fbedbf57]
> ctdbd[1]:  #8 /lib64/libtevent.so.0(_tevent_loop_once+0x94) [0x7ff1fbedf414]
> ctdbd[1]:  #9 /lib64/libtevent.so.0(tevent_common_loop_wait+0x1b)
> [0x7ff1fbedf50b]
> ctdbd[1]:  #10 /lib64/libtevent.so.0(+0x5fc7) [0x7ff1fbedbfc7]
> ctdbd[1]:  #11 /usr/sbin/ctdbd(ctdb_start_daemon+0x6f6) [0x55fac12e34b6]
> ctdbd[1]:  #12 /usr/sbin/ctdbd(main+0x4f9) [0x55fac12c2679]
> ctdbd[1]:  #13 /lib64/libc.so.6(__libc_start_main+0xf2) [0x7ff1fbd331e2]
> ctdbd[1]:  #14 /usr/sbin/ctdbd(_start+0x2e) [0x55fac12c2d3e]
>
>
> And a backtrace from gdb:
>
> (gdb) bt
> #0  process_callbacks (locked=<optimized out>, lock_ctx=0x5605e32977f0)
>     at ../../ctdb/server/ctdb_lock.c:271
> #1  ctdb_lock_handler (ev=<optimized out>, tfd=<optimized out>,
>     flags=<optimized out>, private_data=<optimized out>)
>     at ../../ctdb/server/ctdb_lock.c:372
> #2  0x00007f09fdbe2a4d in tevent_common_invoke_fd_handler (
>     fde=fde@entry=0x5605e3290f50, flags=1, removed=removed@entry=0x0)
>     at ../../tevent_fd.c:138
> #3  0x00007f09fdbe64e7 in epoll_event_loop (tvalp=0x7ffd3e7e5e60,
>     epoll_ev=0x5605e329c930) at ../../tevent_epoll.c:736
> #4  epoll_event_loop_once (ev=<optimized out>, location=<optimized out>)
>     at ../../tevent_epoll.c:937
> #5  0x00007f09fdbdef57 in std_event_loop_once (ev=0x5605e329a110,
>     location=0x5605e1d94d00 "../../ctdb/server/ctdb_daemon.c:1647")
>     at ../../tevent_standard.c:110
> #6  0x00007f09fdbe2414 in _tevent_loop_once (ev=ev@entry=0x5605e329a110,
>     location=location@entry=0x5605e1d94d00 "../../ctdb/server/ctdb_daemon.c:
> 1647") at ../../tevent.c:772
> #7  0x00007f09fdbe250b in tevent_common_loop_wait (ev=0x5605e329a110,
>     location=0x5605e1d94d00 "../../ctdb/server/ctdb_daemon.c:1647")
>     at ../../tevent.c:895
> #8  0x00007f09fdbdefc7 in std_event_loop_wait (ev=0x5605e329a110,
>     location=0x5605e1d94d00 "../../ctdb/server/ctdb_daemon.c:1647")
>     at ../../tevent_standard.c:141
> #9  0x00005605e1d4b4b6 in ctdb_start_daemon (ctdb=0x5605e327e4f0,
>     interactive=<optimized out>, test_mode_enabled=<optimized out>)
>     at ../../ctdb/server/ctdb_daemon.c:1647
> #10 0x00005605e1d2a679 in main (argc=<optimized out>, argv=<optimized out>)
>     at ../../ctdb/server/ctdbd.c:398
> (gdb) list
> 266             }
> 267
> 268             /* Since request may be freed in the callback, unset the
> request */
> 269             lock_ctx->request = NULL;
> 270
> 271             request->callback(request->private_data, locked);
> 272
> 273             if (!auto_mark) {
> 274                     return;
> 275             }
> (gdb) p request
> $1 = (struct lock_request *) 0x0
>
> In order to not go too far into "wall of text" mode, with lots more gdb and
> strace output, I'll try to summarize my other findings so far. I can produce
> much more additional detail at request. Also, please let me know if you think
> this is better handled in bugzilla. Because this is an experimental setup I
> thought the list was a better place to begin.
>
> I have a minimal set of configuration files. Specifically, I've only set up
> one event script, "events/legacy/00.ctdb.script". I also have a custom
> notify.sh but I don't think it made a difference when we tried it with a
> standard one from ctdb packages. I have only one single instance running with
> a nodes file containing only the local IP of the container. I have tried this
> using both an unprivileged container and a privileged container with the same
> result. I also attempted to use this same "minimal" configuration on a VM, in
> that environment I was not able to reproduce the segfault.
>
> This crash only occurs if a tdb file exists in the persistent dir. If no tdb
> files are present then ctdb starts up.
>
> When ctdb starts up with pre-existing tdb files it creates a pipe and forks off
> a child "lock_helper" process, and then uses tevent to add a handler function
> "ctdb_lock_handler". In my case this function "ctdb_lock_handler" gets called
> twice. Once when the child process writes a null byte to the pipe. But it gets
> called again when epoll returns with an EPOLLHUP type. Despite this not being
> a true read the same callback is called. However, the first time the callback
> is called it NULLs out lock_ctx->request. When the function is called the 2nd
> time it dereferences the null lock_ctx->request.
>
>
> I've reproduced this issue using packages from Fedora 33 as well as Fedora 34.
> I skimmed the commits and didn't see anything that might fix this in newer
> samba but if you feel it's still worth trying a more recent build, let me
> know.
>
>
> What puzzles me is why don't normal CTDB configurations hit this error. I
> suppose that in some cases the pipe's fd could be getting removed from tevent
> before EPOLLHUP is returned. To me, that implies a possible race. As an
> additional experiment I found that setting a breakpoint in gdb right after
> 'send_result' was run to completion, if I waited a second or two to resume the
> lock helper process it did not hit the segfault. This deepened my suspicion
> this might be a race condition. But it's one that only seems to surface when
> run within a container.
>
>
> In summary, if those on the samba team who are familiar with CTDB (or tevent)
> can think on this a little and offer any thoughts or suggestions on things I
> could try, I'd greatly appreciate it. I don't assume a lot of container
> experience and am happy to answer questions about the peculiarity there.
> Perhaps a simple question might reveal something we've overlooked so far.
> In a worst case scenario I suppose I could also propose a patch that has `if
> (lock_ctx->request == NULL) return;` added to
> `process_callbacks`, but I'm concerned that might be papering over a real
> problem.
> So here I am.
>
> Thanks for your time!
>
>
> --
> --John M.
>
>
>


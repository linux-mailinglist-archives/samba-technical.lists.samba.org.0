Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AFB3C9F4F
	for <lists+samba-technical@lfdr.de>; Thu, 15 Jul 2021 15:17:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=s3UrPvu2FZeDGWDCajO44SDeJTsiDknRJsJiM5kxL9Y=; b=xYKDLG4FMvk4pRNuRnV/uTpxn6
	vF4mWL1kMtnR7Gu+vNLGvS9pqH1vvU5hWYWuQrL1asEtkR9Ong/BxuaQpBmILf+homaSJPh++JB64
	8NO+NcZlBxSdrqoFrAysUM/xgHB4ZcoFVoTNBcsJ/4PqkZbt2RkoxrQ6RdnQv4Oc1OCKscRGqNAed
	rxONDbcvAMnWf/S1k3BLPBRqMTxUWCQJbBfu3XBcgOb2Q+xp3Bg+n20hrOnCmb8ETOps8r5o606fz
	Bp5TjuSjfVuTKorbLUImg/SAVGhWLaqHvZkIq9zLFO5Oq6RXcj9pTNFUdtVQs5Bra8qWGK0ug+IwT
	WJ4Vq7rA==;
Received: from ip6-localhost ([::1]:19716 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m41Ea-00Dn8u-5N; Thu, 15 Jul 2021 13:17:00 +0000
Received: from [104.200.28.160] (port=46582 helo=dup2.asynchrono.us) 
 by hr1.samba.org with esmtp (Exim) id 1m41ET-00Dn8l-Qx
 for samba-technical@lists.samba.org; Thu, 15 Jul 2021 13:16:57 +0000
Received: from edfu.localnet (c-73-114-31-46.hsd1.ma.comcast.net
 [73.114.31.46])
 by dup2.asynchrono.us (Postfix) with ESMTPSA id 9934E1159;
 Thu, 15 Jul 2021 13:16:50 +0000 (UTC)
To: Samba Technical <samba-technical@lists.samba.org>
Subject: Re: Fwd: CTDB Segfault in a container-based env - Looking for pointers
Date: Thu, 15 Jul 2021 09:16:50 -0400
Message-ID: <2917630.lGaqSPkdTl@edfu>
In-Reply-To: <CAJ+X7mTSNvN=6v0-WSz_89Gjkg5rCf-AmDcVLo=LLmOhSWkyMw@mail.gmail.com>
References: <2450252.vFx2qVVIhK@edfu>
 <CAJ+X7mSHG_OUyNF2EiuvEtCQYJ4vOEH67kW0+1rOsLNp4BqaaQ@mail.gmail.com>
 <CAJ+X7mTSNvN=6v0-WSz_89Gjkg5rCf-AmDcVLo=LLmOhSWkyMw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: John Mulligan via samba-technical <samba-technical@lists.samba.org>
Reply-To: John Mulligan <phlogistonjohn@asynchrono.us>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wednesday, July 14, 2021 10:12:46 PM EDT Amitay Isaacs via samba-technical 
wrote:
> Hi John,
> 
> There are certain assumptions made in CTDB assuming it's running on a
> normal system. When running CTDB in a container, those assumptions are
> not valid any more and you might get unexpected behaviour.
> 

First, thanks for replying!

Sure, I fully expect that. It was similar for smbd/winbind but in those cases 
I was able to tune the environment sufficiently - for example they need to run 
within the same pid namespace to function properly. The issue I'm having now 
is that the segfault isn't mapping to anything obvious (yet) that I can change 
in the environment.

> One such assumption is that init (in some form) has the pid of 1 and
> CTDB daemon will never have PID of 1.  Obviously this is not true in
> your case.  From the logs you can see that the CTDB daemon is started
> as PID 1. In general, CTDB relies on init (in some form) to start/stop
> various file services (smb, nfs, etc.) via the event scripts.  So,
> working init is a requirement for normal operation of CTDB.

Good point. I'll experiment with giving ctdb a parent process.

> 
> What are you trying to do exactly?  You cannot put CTDB in a container
> on its own without Samba daemons.

I'm not clear on what you mean by that. My longer term goal is to investigate 
CTDB as part of the HA story for samba in containers (see our general effort 
here [1]). Short term, I just want to run ctdb on its own with very few (or 
none) event scripts just to get tdb replication working across multiple nodes 
in a container based environment. Based on my reading of the docs and a tiny 
bit of the code, bringing up smbd/etc is the responsibility of the event 
scripts so I think it should be possible to run ctdb on its own like that.

Any thoughts on adding code to specifically handle the case where the callback 
has already been called, but tevent calls it again?

Again, thanks a bunch for your time!


PS. Re-sending to the list with the correct from address. Apologies for any 
duplicates.

> 
> Amitay.
> 
> On Thu, Jul 15, 2021 at 3:43 AM John Mulligan via samba-technical
> 
> <samba-technical@lists.samba.org> wrote:
> > Hi Team,
> > 
> > I'm currently experimenting with running CTDB as a component in a
> > container
> > based environment (OCI/docker style).
> > Unlike smbd and winbind, which were fairly easy to containerize, CTDB is
> > proving a bit more tricky. Specifically, I'm seeing a segfault that I can
> > not trace to something obvious. I'm reaching out to the list for thoughts
> > and suggestions.
> > 
> > First, here's the logging leading up to the segfault:
> > 
> > ctdbd[1]: CTDB starting on node
> > ctdbd[1]: Starting CTDBD (Version 4.13.9) as PID: 1
> > ctdbd[1]: Created PID file /var/run/ctdb/ctdbd.pid
> > ctdbd[1]: Listening to ctdb socket /var/run/ctdb/ctdbd.socket
> > ctdbd[1]: Set real-time scheduler priority
> > ctdbd[1]: Starting event daemon /usr/libexec/ctdb/ctdb-eventd -P 1 -S 9
> > ctdb-eventd[7]: daemon started, pid=7
> > ctdb-eventd[7]: startup completed successfully
> > ctdb-eventd[7]: listening on /var/run/ctdb/eventd.socket
> > ctdbd[1]: Set runstate to INIT (1)
> > ctdbd[1]: ../../ctdb/server/eventscript.c:654 Running event init with
> > arguments (null)
> > ctdbd[1]: ctdb chose network address 10.88.0.5:4379
> > ctdbd[1]: PNN is 0
> > ctdbd[1]: Not loading public addresses, no file /etc/ctdb/public_addresses
> > OH COME ON init
> > ctdbd[1]: Vacuuming is disabled for non-volatile database ctdb.tdb
> > ctdbd[1]: Attached to database '/var/lib/ctdb/persistent/ctdb.tdb.0' with
> > flags 0x400
> > ctdbd[1]: Attached to persistent database ctdb.tdb
> > ctdbd[1]: Freeze db: ctdb.tdb
> > ctdbd[1]: Set lock helper to "/usr/libexec/ctdb/ctdb_lock_helper"
> > ctdbd[1]: SIGCHLD from 20 process:20
> > ctdbd[1]: Set runstate to SETUP (2)
> > ctdbd[1]: ../../ctdb/server/eventscript.c:654 Running event setup with
> > arguments
> > ctdbd[1]: SIGCHLD from 22 process:22
> > ctdbd[1]: ===============================================================
> > ctdbd[1]: INTERNAL ERROR: Signal 11: Segmentation fault in pid 1 (4.13.9)
> > ctdbd[1]: If you are running a recent Samba version, and if you think this
> > problem is not yet fixed in the latest versions, please consider reporting
> > this bug, see https://wiki.samba.org/index.php/Bug_Reporting
> > ctdbd[1]: ===============================================================
> > ctdbd[1]: PANIC (pid 1): Signal 11: Segmentation fault in 4.13.9
> > ctdbd[1]: BACKTRACE: 15 stack frames:
> > ctdbd[1]:  #0 /lib64/libsamba-util.so.0(log_stack_trace+0x34)
> > [0x7ff1fbf77254] ctdbd[1]:  #1 /lib64/libsamba-util.so.0(smb_panic+0x2a)
> > [0x7ff1fbf7c05a] ctdbd[1]:  #2 /lib64/libsamba-util.so.0(+0x1c348)
> > [0x7ff1fbf7c348] ctdbd[1]:  #3 /lib64/libpthread.so.0(+0x141e0)
> > [0x7ff1fbeff1e0]
> > ctdbd[1]:  #4 /usr/sbin/ctdbd(+0x62d94) [0x55fac130fd94]
> > ctdbd[1]:  #5 /lib64/libtevent.so.0(tevent_common_invoke_fd_handler+0x7d)
> > [0x7ff1fbedfa4d]
> > ctdbd[1]:  #6 /lib64/libtevent.so.0(+0xd4e7) [0x7ff1fbee34e7]
> > ctdbd[1]:  #7 /lib64/libtevent.so.0(+0x5f57) [0x7ff1fbedbf57]
> > ctdbd[1]:  #8 /lib64/libtevent.so.0(_tevent_loop_once+0x94)
> > [0x7ff1fbedf414] ctdbd[1]:  #9
> > /lib64/libtevent.so.0(tevent_common_loop_wait+0x1b)
> > [0x7ff1fbedf50b]
> > ctdbd[1]:  #10 /lib64/libtevent.so.0(+0x5fc7) [0x7ff1fbedbfc7]
> > ctdbd[1]:  #11 /usr/sbin/ctdbd(ctdb_start_daemon+0x6f6) [0x55fac12e34b6]
> > ctdbd[1]:  #12 /usr/sbin/ctdbd(main+0x4f9) [0x55fac12c2679]
> > ctdbd[1]:  #13 /lib64/libc.so.6(__libc_start_main+0xf2) [0x7ff1fbd331e2]
> > ctdbd[1]:  #14 /usr/sbin/ctdbd(_start+0x2e) [0x55fac12c2d3e]
> > 
> > 
> > And a backtrace from gdb:
> > 
> > (gdb) bt
> > #0  process_callbacks (locked=<optimized out>, lock_ctx=0x5605e32977f0)
> > 
> >     at ../../ctdb/server/ctdb_lock.c:271
> > 
> > #1  ctdb_lock_handler (ev=<optimized out>, tfd=<optimized out>,
> > 
> >     flags=<optimized out>, private_data=<optimized out>)
> >     at ../../ctdb/server/ctdb_lock.c:372
> > 
> > #2  0x00007f09fdbe2a4d in tevent_common_invoke_fd_handler (
> > 
> >     fde=fde@entry=0x5605e3290f50, flags=1, removed=removed@entry=0x0)
> >     at ../../tevent_fd.c:138
> > 
> > #3  0x00007f09fdbe64e7 in epoll_event_loop (tvalp=0x7ffd3e7e5e60,
> > 
> >     epoll_ev=0x5605e329c930) at ../../tevent_epoll.c:736
> > 
> > #4  epoll_event_loop_once (ev=<optimized out>, location=<optimized out>)
> > 
> >     at ../../tevent_epoll.c:937
> > 
> > #5  0x00007f09fdbdef57 in std_event_loop_once (ev=0x5605e329a110,
> > 
> >     location=0x5605e1d94d00 "../../ctdb/server/ctdb_daemon.c:1647")
> >     at ../../tevent_standard.c:110
> > 
> > #6  0x00007f09fdbe2414 in _tevent_loop_once (ev=ev@entry=0x5605e329a110,
> > 
> >     location=location@entry=0x5605e1d94d00 "../../ctdb/server/
ctdb_daemon.c:
> > 1647") at ../../tevent.c:772
> > #7  0x00007f09fdbe250b in tevent_common_loop_wait (ev=0x5605e329a110,
> > 
> >     location=0x5605e1d94d00 "../../ctdb/server/ctdb_daemon.c:1647")
> >     at ../../tevent.c:895
> > 
> > #8  0x00007f09fdbdefc7 in std_event_loop_wait (ev=0x5605e329a110,
> > 
> >     location=0x5605e1d94d00 "../../ctdb/server/ctdb_daemon.c:1647")
> >     at ../../tevent_standard.c:141
> > 
> > #9  0x00005605e1d4b4b6 in ctdb_start_daemon (ctdb=0x5605e327e4f0,
> > 
> >     interactive=<optimized out>, test_mode_enabled=<optimized out>)
> >     at ../../ctdb/server/ctdb_daemon.c:1647
> > 
> > #10 0x00005605e1d2a679 in main (argc=<optimized out>, argv=<optimized
> > out>)
> > 
> >     at ../../ctdb/server/ctdbd.c:398
> > 
> > (gdb) list
> > 266             }
> > 267
> > 268             /* Since request may be freed in the callback, unset the
> > request */
> > 269             lock_ctx->request = NULL;
> > 270
> > 271             request->callback(request->private_data, locked);
> > 272
> > 273             if (!auto_mark) {
> > 274                     return;
> > 275             }
> > (gdb) p request
> > $1 = (struct lock_request *) 0x0
> > 
> > In order to not go too far into "wall of text" mode, with lots more gdb
> > and
> > strace output, I'll try to summarize my other findings so far. I can
> > produce much more additional detail at request. Also, please let me know
> > if you think this is better handled in bugzilla. Because this is an
> > experimental setup I thought the list was a better place to begin.
> > 
> > I have a minimal set of configuration files. Specifically, I've only set
> > up
> > one event script, "events/legacy/00.ctdb.script". I also have a custom
> > notify.sh but I don't think it made a difference when we tried it with a
> > standard one from ctdb packages. I have only one single instance running
> > with a nodes file containing only the local IP of the container. I have
> > tried this using both an unprivileged container and a privileged
> > container with the same result. I also attempted to use this same
> > "minimal" configuration on a VM, in that environment I was not able to
> > reproduce the segfault.
> > 
> > This crash only occurs if a tdb file exists in the persistent dir. If no
> > tdb files are present then ctdb starts up.
> > 
> > When ctdb starts up with pre-existing tdb files it creates a pipe and
> > forks off a child "lock_helper" process, and then uses tevent to add a
> > handler function "ctdb_lock_handler". In my case this function
> > "ctdb_lock_handler" gets called twice. Once when the child process writes
> > a null byte to the pipe. But it gets called again when epoll returns with
> > an EPOLLHUP type. Despite this not being a true read the same callback is
> > called. However, the first time the callback is called it NULLs out
> > lock_ctx->request. When the function is called the 2nd time it
> > dereferences the null lock_ctx->request.
> > 
> > 
> > I've reproduced this issue using packages from Fedora 33 as well as Fedora
> > 34. I skimmed the commits and didn't see anything that might fix this in
> > newer samba but if you feel it's still worth trying a more recent build,
> > let me know.
> > 
> > 
> > What puzzles me is why don't normal CTDB configurations hit this error. I
> > suppose that in some cases the pipe's fd could be getting removed from
> > tevent before EPOLLHUP is returned. To me, that implies a possible race.
> > As an additional experiment I found that setting a breakpoint in gdb
> > right after 'send_result' was run to completion, if I waited a second or
> > two to resume the lock helper process it did not hit the segfault. This
> > deepened my suspicion this might be a race condition. But it's one that
> > only seems to surface when run within a container.
> > 
> > 
> > In summary, if those on the samba team who are familiar with CTDB (or
> > tevent) can think on this a little and offer any thoughts or suggestions
> > on things I could try, I'd greatly appreciate it. I don't assume a lot of
> > container experience and am happy to answer questions about the
> > peculiarity there. Perhaps a simple question might reveal something we've
> > overlooked so far. In a worst case scenario I suppose I could also
> > propose a patch that has `if (lock_ctx->request == NULL) return;` added
> > to
> > `process_callbacks`, but I'm concerned that might be papering over a real
> > problem.
> > So here I am.
> > 
> > Thanks for your time!
> > 
> > 
> > --
> > --John M.






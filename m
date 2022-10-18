Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F4D602EB4
	for <lists+samba-technical@lfdr.de>; Tue, 18 Oct 2022 16:43:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=FeMpMpKEwZZoOySPZv9Z9tp9CCoHdBGcy4kTMvMFrnA=; b=deZhFuVf0+x+0+TMoNFYq6vqtG
	TWswR4uG/52GdqCPYw6cw7kKsDkIod95paxLEKP43vZvgaCuVs+9Ji08X1JCAwz9HGLF0UZa0kWoA
	fmf07jSEjiSGA74R0N7JwWW0vHqogtqV2F0i+7kQNnJs+T2DnpLyLamNaeGRLFa6Jx9kW1H4oPoj9
	2tKH6m7gC6B7VglfPWPMm4fXxJK2CuHWibjOeLjhIcf1odBKMMzKeTvHwJ65N2aibsPqTXnSL/7gQ
	tYK3A2SKRNaPy9tDxbW9aGdD248cFz2+1mLyusJNzOY3m0+F7aweWbDVMdElMLX+rerNV+uEBcf9f
	7d+0ZK+Q==;
Received: from ip6-localhost ([::1]:59160 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1okno3-003MWj-Ef; Tue, 18 Oct 2022 14:42:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58132) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oknnx-003MWa-Rs
 for samba-technical@lists.samba.org; Tue, 18 Oct 2022 14:42:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=FeMpMpKEwZZoOySPZv9Z9tp9CCoHdBGcy4kTMvMFrnA=; b=m8vmg7oWKKHg2Sqv3hPrs6545o
 RmMgSrzmFrAHqXUYTcgzQSRj4h5ALZ1JuFVXCizHW1SQ2KZqxCUP3U9gPlvaBWNClmYUhJaisBbLE
 BPIUQCikSkvhnDcoDcqwzGXncml40zGsTDaANJ+DNz4NrZeLkoBdxH5fcCF1udjaTbRSQhdyffQ1s
 Pwnz6q0UPMtTOcgKfnBimvfgCmlgvMlrOrRIYxR5aVfCD1d0pFnYC31TPKJx049aG15+XKHPtpWQ4
 jG6YjPKTN93B4KCBxrITT1Z/pD9o1q2ey4D2+Fsw3EjZmXQqQW2RjRXjlXZfAM7SLzs/VAR2+FreJ
 T1Oyk8V+ud1BYoQ/0CSP3jKWUOvoqUxzuHHF+sKl02j7ijP8rLBaksbRzvBfr+yBgrDeUfTeemjca
 kevHkJRFeiqZBbHLIcxwTlypImw2FL8ubgd4UFHuO0rRJPbUqh+RkbyYFdSrczCoj6jBKev+PqnFv
 1ZYr3vcii1dRliUUeCE0u+HA;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oknnw-004kYx-SK; Tue, 18 Oct 2022 14:42:53 +0000
Message-ID: <c01f72ac-b2f1-0b1c-6757-26769ee071e2@samba.org>
Date: Tue, 18 Oct 2022 16:42:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Jens Axboe <axboe@kernel.dk>
Subject: Problems replacing epoll with io_uring in tevent
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: Samba Technical <samba-technical@lists.samba.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Jens,

here's first summary of the problems I hit when trying to
add an io_uring backend to Samba's libtevent.

BTW: It would be nice to get some feedback to my mail from August 16th 2022:
"Deprecation of IORING_OP_EPOLL_CTL (Re: [GIT PULL] io_uring updates for 5.18-rc1)"
https://lore.kernel.org/io-uring/a05f7831-92c2-0eb6-0088-73bbdd4acb89@samba.org/
@Linus, that's basically the reason I cc'ed you...

First an overview of what features tevent needs from the os and
provides for its consumers, then how I tried to use io_uring, followed by the problems I hit):
(skip to 9. if you just want to see the problems)

1. tevent is basically looping around a tevent_loop_once() function,
    which will use epoll_wait() or poll() as blocking function in the backend.
    It only invokes a single event handler, which is very important for us
    as it avoids a whole class of use after free problem we had in the earlier days.

    There's a tevent_loop_wait() wrapper, which will typically called
    by main() in order to have an endless server loop.

2. tevent has support for the following event handlers:
    - 'immediate': It's a way to call something directly in the next
                   tevent_loop_once() iteration.
    - 'timer':     It's a way to call something at a specific time
    - 'signal':    It's a way to call something when a signal e.g. SIGHUP arrived
    - 'fd':        It's a way to get notified with TEVENT_FD_READ and/or TEVENT_FD_WRITE
                   on a given file descriptor

    'immediate', 'timer' and 'signal' events are handled in the core tevent code
    and only if none of them is ready the backend is called to wait for fd events
    to get ready. The backend is passed the timeout for the next timer.

3. 'fd' events operate with the following properties:
    a) level triggering mode: TEVENT_FD_READ/TEVENT_FD_WRITE are delivered over and over again,
       if the handler doesn't consume or send data, you would get 100% cpu spinning, but you can't
       miss any event (which could happen with edge triggering)
    b) all registered fd handlers are called in a fair fashion, they are part of a linked list
       and rotated to the end after each invocation.
    c) as written above only a single fd event is reported per tevent_loop_once()
    d) when the file descriptor is closed using close() the event handler will no longer trigger
    e) we allow separate handlers for TEVENT_FD_READ and TEVENT_FD_WRITE for the same file descriptor
    f) there's a hook into the backend to set/clear the TEVENT_FD_READ/TEVENT_FD_WRITE on
       an existing event handler state (tevent_fd_get/set_flags())

4. A single process may have more than a single central/global tevent context instance.
    a) Separate instances might be allocated and may registered the same file descriptors as
       other instances.
    b) The individual instances might be used just temporary or never while
       they may be allocated for a long time. It means that tevent_loop_once() may not be called
       for a long time.

5. On linux we use epoll:
    a) We use epoll_wait() with maxevents=1, in order to avoid stale epoll_event.user_data,
       as the fd event handler for one fd may change/remove the state of another one.

    b) When we get EEXIST from EPOLL_CTL_ADD, we merge/dispatch multiple events for the same
       file descriptor in user space.

    c) Without epoll, we use poll() generating the pollfd array and dispatch based on the
       sorted/rotated list.

With that background I created an io_uring based backend. I modeled it like this:

6. Data model:
    a) Per tevent_context I have private struct samba_io_uring, wrapping struct io_uring and a list of
       samba_io_uring_submission structures.

    b) struct samba_io_uring_completion basically maps 'uint64_t user_data' by using its own pointer
       address to a callback function pointer and a private callback argument.

    c) struct samba_io_uring_submission basically wraps struct io_uring_sqe and has a pointer
       a struct samba_io_uring_completion in order to fill sqe.user_data.

7. The core tevent_loop_once() logic is this:

    a) loop over the queued samba_io_uring->submissions and move them into lowlevel
       kernel ring based on io_uring_sq_space_left/io_uring_get_sqe
       (we also call samba_io_uring_submission->submission_fn() in order to
       have a way to capture a timestamp for profiling or have a last chance
       to cancel the submission)

    b) call io_uring_submit_and_wait_timeout() waiting for 1 cqe or a timeout

    c) for the resulting cqe we lookup the samba_io_uring_completion and call
       samba_io_uring_completion->completion_fn()

    This loop will also allow generic io_uring operations like IORING_OP_SENDMSG
    and others (unrelated to what tevent normally provides). This will be used
    in order to improve the performance is performance critical code with io_uring
    aware code.

8. The mapping of fd events to IORING_OP_POLL_ADD/REMOVE

    By default we won't have io_uring aware code as most of
    it is not performance critical and we want to be portable also
    to non linux environments. So as a first step everything still needs
    to function while just exchanging the tevent backend.

    a) In order to represent what all kernels provide I only
       used the basic IORING_OP_POLL_ADD/REMOVE (without any update)

    b) In order to provide the level triggered behavior outlined in (3.a above)
       we need to loop over IORING_OP_POLL_ADD operations.
       If the requested poll mask is already ready, IORING_OP_POLL_ADD returns
       immediately. If it's not ready edge triggering (EPOLLET) will trigger a single
       (EPOLLONESHOT) completion. But as we call IORING_OP_POLL_ADD again,
       we'll get the effective level triggering, which we need.

    c) IORING_OP_POLL_ADD is queued into samba_io_uring->submissions
       while 7.a will construct the final sqe via the submission_fn
       reflecting the current POLLIN/OUT flags.

    d) When the TEVENT_FD_READ/WRITE flags change (via tevent_fd_set_flags()
       we may change the pending submission (before submission_fn() was called)

    e) If IORING_OP_POLL_ADD is already pending in the kernel
       we use IORING_OP_POLL_REMOVE to remove it hard linked
       with a new IORING_OP_POLL_ADD representing the current POLLIN/OUT flags.
       For that to work reliable I toggle between 2 IORING_OP_POLL_ADD completions.

9. The above works mostly, but manual testing and our massive automated regression tests
    found the following problems:

    a) Related to https://github.com/axboe/liburing/issues/684 I was also wondering
       about the return value of io_uring_submit_and_wait_timeout(),
       but in addition I noticed that the timeout parameter doesn't work
       as expected, the function will wait for two times of the timeout value.
       I hacked a fix here:
       https://git.samba.org/?p=metze/samba/wip.git;a=commitdiff;h=06fec644dd9f5748952c8b875878e0e1b0000d33

    b) The major show stopper is that IORING_OP_POLL_ADD calls fget(), while
       it's pending. Which means that a close() on the related file descriptor
       is not able to remove the last reference! This is a problem for points 3.d,
       4.a and 4.b from above.

       I doubt IORING_ASYNC_CANCEL_FD would be able to be used as there's not always
       code being triggered around a raw close() syscall, which could do a sync cancel.

       For now I plan to epoll_ctl (or IORING_OP_EPOLL_CTL) and only
       register the fd from epoll_create() with IORING_OP_POLL_ADD
       or I keep epoll_wait() as blocking call and register the io_uring fd
       with epoll.

       I looked at the related epoll code and found that it uses
       a list in struct file->f_ep to keep the reference, which gets
       detached also via eventpoll_release_file() called from __fput()

       Would it be possible move IORING_OP_POLL_ADD to use a similar model
       so that close() will causes a cqe with -ECANCELED?

    c) A simple pipe based performance test shows the following numbers:
       - 'poll':               Got 232387.31 pipe events/sec
       - 'epoll':              Got 251125.25 pipe events/sec
       - 'samba_io_uring_ev':  Got 210998.77 pipe events/sec
       So the io_uring backend is even slower than the 'poll' backend.
       I guess the reason is the constant re-submission of IORING_OP_POLL_ADD.
       My hope would be that IORING_POLL_ADD_MULTI + IORING_POLL_ADD_LEVEL
       would be able to avoid the performance problem with samba_io_uring_ev
       compared to epoll.

       I looked at how epoll implements level triggered notifications:
       The key is that is maintains two logical lists:
       - interest list with all registered file descriptor in the "epoll set"
         each registration is also registered into the file's waitqueue via
         init_poll_funcptr() -> vfs_poll() -> [sock_]poll_wait()
       - ready list, this is filled by the callback passed to init_poll_funcptr(),
         which is triggered when there's an "edge"/state change on the fd.
       The thing is that epoll_wait() fills the passed epoll_event array
       by traversing the ready list. For each element in the ready list
       we call vfs_poll() to re-check the most recent state before putting
       in the result array. For level triggered registrations the entry is move
       to the end of the ready list in order to provide fair results, otherwise
       the entry is remove from the ready list, for one shot entries it's also
       removed from the interest list.

       In order to implement level triggering in io_uring
       we would need to have some kind of ready list and have a way
       to let the caller configure a number of cqe's which should be generated
       during a single io_uring_enter() syscall based on the ready list,
       without such a value we'd constantly overflow the cqe array.

       As a site note the problem with your IORING_POLL_ADD_LEVEL was this:
       - IORING_OP_POLL_ADD does check the current value with vfs_poll,
         but it never triggers the io_poll_can_finish_inline case,
         so it will *always* wait for the next edge triggering to happen
         in the background.

         So it means it's move a deferred edge triggering and has nothing to
         do with level triggering (see 3.a).

         Even if I allow the io_poll_can_finish_inline case, I don't get
         level triggering, I tried it with there commits:
         https://git.samba.org/?p=metze/linux/wip.git;a=commitdiff;h=4f89a3fb02c1e4ea4650ea6f9fa9fd642453d2b2
         https://git.samba.org/?p=metze/linux/wip.git;a=commitdiff;h=4d10a69d9925f546214f9437aef424bade9c5aaa
         https://git.samba.org/?p=metze/linux/wip.git;a=commitdiff;h=306e743af055fea105df792c2756a0a81a95871a
         setting the io_uring_poll_always_finish_now option to true...


As summary I think 9.a (io_uring_submit_and_wait_timeout) should be trivial to fix.

In order to get the best performance it would be great to get 9.b and (most likely) 9.c
addressed.

Sorry for the long mail, but I hope we can figure out how to move forward.

Thanks!
metze


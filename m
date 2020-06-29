Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A4620CEEC
	for <lists+samba-technical@lfdr.de>; Mon, 29 Jun 2020 15:56:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=rGNaj60mSTeaxMC9hVDKcypo1ZsPMgOImv3sdYjkG3c=; b=yRmT3oIkYR+tJXsms9cCCiObsn
	f5Ow+ynlOGQHXaaRkMxZV9Q3hNYrbHI3+N3afWfutIZi+I21BKJHEHjiSgt8v+SIurLxHH9uTaT19
	vVvVeyxtGWaQA4VvYZ0EDuO7tDJ0LSLvd9ypg2bVSUEdrUcNIHRF9jQ30JAkZtPphC+TxkSVVIeQE
	GnyG/ISr5X+2Vt9/74RFzttBYd+Gz7SysYhKXI4UUuuIu0vS5u4xyh2s1O3xdAMHoGapLfjogYeLq
	oZY7esPnM4C2qUuUxIvdz0kvAWuJ5TA+RX6FZJQfl7Fb5xjcT83K3Ap4b1NiX3UwbktZhgwq+Z+AZ
	M6FUWoqg==;
Received: from localhost ([::1]:54614 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jpuGE-002YeE-Bm; Mon, 29 Jun 2020 13:55:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59366) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jpuG7-002Ye7-Pb
 for samba-technical@lists.samba.org; Mon, 29 Jun 2020 13:55:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=rGNaj60mSTeaxMC9hVDKcypo1ZsPMgOImv3sdYjkG3c=; b=PN/RsL9WFsuab3+6i2zIMEccBA
 FT1+9/LoNjcsEAbFPbanUravkEz0yjUIG/vTW3wuwKkmLcDtF7vLlvt+oyf7x6JmreaVD/+CduD0c
 lhKl/UkofSgRMdjDmr0KXwuzaaAMu/yhEis4FTrau5QHxzWfAs+gNs+wr2F02p7NuNkRPbpWMKSmL
 f3s4q/riALKqlES7Fm0phlxiFJsdjEkv3zFGMLBTOAvmCQK9BmrcaHQSjvJxzzRwxTSJrNhGtrxu6
 VGbBMSvqNyrUtOXd7twlGFnk4LPmKeyB7norBA9IGC6INV2nBZVRijE3HZpYNJTSJLIgYnsE/S59O
 GcpPvv1a7bE7dUawu02A5ZLpFG3cTpJpG5NI+wmMhEAaYWUer+tE9IvmyQ50onkvSatXyiYFA/ajS
 /mXZtMA7iX1Q4kkHdAZ8S4IutoUQoZz9uJep+rW3AkoakZUwM/ic6GIR5fh0py9JGfuU51I1sje9D
 2KrZyzhAl5IFtTpLMWQQ8FQt;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jpuG6-0004dE-2L; Mon, 29 Jun 2020 13:55:42 +0000
Message-ID: <86481a324b2b5068dfa438bedd6b7205fbe0ccf5.camel@samba.org>
Subject: Re: socket-wrapper fd-passing
To: Stefan Metzmacher <metze@samba.org>
Date: Mon, 29 Jun 2020 19:25:38 +0530
In-Reply-To: <35bfe7ee-5c75-c785-8648-4c8191a9974a@samba.org>
References: <35bfe7ee-5c75-c785-8648-4c8191a9974a@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
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
From: Anoop C S via samba-technical <samba-technical@lists.samba.org>
Reply-To: Anoop C S <anoopcs@samba.org>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2020-06-24 at 23:14 +0200, Stefan Metzmacher via samba-
technical wrote:
> Hi Anoop,
> 
> I rebased your fd-passing patches on top of socket_wrapper master.
> 
> See https://gitlab.com/metze/socket_wrapper/-/commits/fd-passing/

Thanks and sorry for my late reply.

See my comments below:
(WIP branch: 
https://git.samba.org/?p=anoopcs/socket_wrapper.git;a=shortlog;h=refs/heads/fd-passing-final
)

> Please also notice my commit on top where I added some more hints
> on a better design:
> 
>   - We need to maintain a small file using mmap and protected
>     by pthread robust mutexes. E.g. one file per local ip address.

My current set of patches operate out of a single file(as db) shared
using mmap() protected by pthread robust mutexes. Do you foresee any
complications with just one file as common db?

>   - The path specified in SOCKET_WRAPPER_FD_PASSING_DB will
>     be used as the file name, if this is not specified we'll
>     use malloc'ed and fd-passing is not enabled.

As of now I have a hard coded db name SOCKET_INFO_DB defined as
/tmp/socket-info.db to hold socket_info structures, free list pointers
and mutex. But the fall back mechanism is not yet present.

>   - The file contains a header (with magic, unique id, size and
> free-list pointer)
>     followed by an array of socket_info structures.

More or less similar format has been used so far. But remember,
version/magic, size etc are still marked as TODO.

>   - The socket_info_fd structures will only maintain the index
>     into the mmap'ed array.

socket_info_fd is now an array of integer pointers containing indexes
to mmaped area of socket_info structures.

>   - fd-passing is limited to fixed number (~ 127), this should be
>     more than enough for typical caller (Samba would just use 1).

Ok.

>   - In order to do fd-passing of tcp/udp sockets, we'll create
>     a pipe (or similar) where we write an array of with indexes
>     into the mmap'ed array into the write end of the pipe.
>     We would also pass the device/inode and a unique identifier
>     for the file.
>     The read end of the pipe is then passed as the last fd to
>     the destination process. The destination process can rebuild
>     the socket_info_fd structures by reading the array indexes.
>     out of the read end of the pipe.
>   - A tricky part will be the reference counting in the database
>     entries. The sender needs to write the data into the pipe
>     and increment the refcounts in the db file before calling
>     sendmsg(). The sender may hold a mutex for each socket
>     during sendmsg().

I hope this is based on your suggestion to have one file per ip
address. My WIP branch contains changes based on a similar design from 
https://git.samba.org/?p=anoopcs/socket_wrapper.git;a=blob;f=TODO.fd-passing;h=95f5107c0601720d9a6df81159976363adf7b52b;hb=refs/heads/fd-passing-final

final implementation of real fd-passing is still at an infant stage :-/

>   - In order to allow multiple threads (or processes) to share a
> single
>     socket we need to add mutex protection in quite a few places.

yes..yes, we have decent amount of pthread mutexes now :-)

>     In the most common cases there won't be any contention on the
> mutexes,
>     but it will garantee correctness for the corner cases which
> happens
>     for fd-passing.

Sure.

In short, I could successfully run `make test` with changes to work out
of a common shared file. Still there is one
test(test_thread_echo_tcp_sendmsg_recvmsg, which I added) failing
almost consistently on my local system and not on GitLab CI. I have
been trying to root cause this failure for quite sometime now(as and
when time allows me) without any luck in fixing it. I would love to see
another pair of eyes reviewing the changes.

> An additional idea would be using temporary anonymous files (maybe
> memfd_create() or an similation for it) for shared structures for
> passed
> sockets. In sendmsg() the sender would move the
> socket_info[_container]
> structures from malloc'ed memory to an temporary memory file.
> This will replace the pipe fd of the original design.
> If multiple fd's are passed, the memory file contains an array of
> socket_info[_container] structures.
> int *socket_fds_idx would be changed to an array of structures
> or we have an additional array to store possible fd for the temporary
> files and have the destructing code lock at it and select between
> free() and munmap()/close().
> This design would not require a named file, like the one specified
> by SOCKET_WRAPPER_FD_PASSING_DB.

Hm.. this is new to me. I will think about it.

> Do you have comments on these additions?
> 
> Thanks!
> metze
> 



Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F011FAC77B2
	for <lists+samba-technical@lfdr.de>; Thu, 29 May 2025 07:32:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=cLQWvwU19bA2cts+TOjg/oWDLFosaQTOb+qAS0BIjbI=; b=3TjFTmwCQ/m6hYo9pvC8+no54D
	LDaTV8I2LTqNwqbYkU1CKjbuVXYZwqGecPPoMS8C6RJWqTPYbIHSxL6YDICRLPKnEvSL3Lh4kPtXr
	czCMclysBhiZisDcqmtpZ6mjOHinI6LiDhArulxyk8Y90qwq1WEuFVZHQX0AQDShoGZxHkEs87LbO
	6f3PleFPk1L2YVWL4P3bNp2wUE/dM5WyptIxmIuLTgHcXnSsrgpSjSZzSJlpYWCrizK43rbOjFmpO
	7NKTDujPjRFfNW6BuZ4dfaRo3fJ1U8eLOkGqmC9lNLP+vnjJlQ4kW5Zc87c9mHFe+0KYs/7DzgQIx
	lDQOdz2A==;
Received: from ip6-localhost ([::1]:39152 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uKVsP-004Ppb-7z; Thu, 29 May 2025 05:32:25 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76]:56501 helo=mail.ozlabs.org)
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uKVsJ-004PpU-Pf
 for samba-technical@lists.samba.org; Thu, 29 May 2025 05:32:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meltin.net;
 s=202409; t=1748496733;
 bh=cLQWvwU19bA2cts+TOjg/oWDLFosaQTOb+qAS0BIjbI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cOtyNq7mJxwWPcw8/tubvpOADKhG5PiJydaqWGSk3Tuc/Eev4/qB+M7ity6VvsHqX
 IWKQ+Hg2hmSocrhnsfn10TxjH9FCAiAeDtjMSOc7hysF+z3e2lmFYgV0t+yaS0CKvB
 XEc26CP5usDM6973sGB8wuOLA/8dlybSQ+kOig9X4HyGa1EOsyhRarUAGxk//IRYRx
 a2RO5QC1U7B6SqmxW3RY/l2hHWxooB+kDeEPM49wlNwdo7x5FhJQepMWwwqIx77Qf4
 IQptYboyzggAgrubUf8TWE0Don2UzaKk2RRSi5ERssX/uSYFzd+A1rDT6J6+BqxdHE
 8/JqH2opDHnkg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4b7FP92gDPz4x8P;
 Thu, 29 May 2025 15:32:13 +1000 (AEST)
Date: Thu, 29 May 2025 15:32:18 +1000
To: Xavi Hernandez <xhernandez@gmail.com>
Subject: Re: CTDB performance issue
Message-ID: <20250529153218.3d7ac905@martins.ozlabs.org>
In-Reply-To: <CAO9H7P8ix7ntc2Xtdowyv5mvBCKAZp+gOsCRdMoMAZqhnCH2tQ@mail.gmail.com>
References: <CAO9H7P8386LOjJPbxSicuDFO-yQ+ofZyFv+Vz_28JnntkMrkcQ@mail.gmail.com>
 <20250525145257.1ff80548@martins.ozlabs.org>
 <CAO9H7P8ix7ntc2Xtdowyv5mvBCKAZp+gOsCRdMoMAZqhnCH2tQ@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Cc: gd@samba.org, Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Xavi,

On Mon, 26 May 2025 11:46:05 +0200, Xavi Hernandez
<xhernandez@gmail.com> wrote:

> The recovery process can only make the problem worse, but it's not what
> initially triggers the problem itself. Even without the recovery in the
> picture, CTDB is already running slowly and requests accumulate big delays
> (including the leader broadcast which arrives too late). I also think that
> a workload where there's a lot of lock contention (forcing CTDB to start
> the lock helper processes even in normal cases without vacuuming or other
> operations) will make CTDB go slower and accumulate latencies. In any case
> that's another issue and I don't have conclusive data yet.
> 
> Probably avoiding recovery would help, but I think we should try to
> understand and fix the initial issue.

Definitely true.

> I can't tell for sure what the users are doing, but from a network traffic
> analysis, I can say that there are many open/close requests (in the order
> of 1000 per second), and read and write operations mostly. The open/close
> requests need to check/update the share mode, which requires TDB locked
> access.
> 
> This happens on a 3 node CTDB cluster.

Is ctdbd logging any messages like the following?

  WARNING: CPU utilisation X% >= threshold (90%)

I know a lot of the load seems to be coming from lock helpers.
However, when there is a lot of lock contention then ctdbd sometimes
gets close to saturation.

Also, there is always the possibility that some directories, usually at
the top of a share, are generating a lot of lock contention, because
they are common to a lot of users.  One simple example is a share that
contains home directories under /home.  Although none of the users are
able to modify /home, there is still a lot of locking.tdb traffic
related to this directory.  To work around this you can break lock
coherency in this directory using features of:

  https://www.samba.org/samba/docs/current/man-html/vfs_fileid.8.html

In particular, see the fileid:nolock_paths option.  This can have a
surprising effect on overall lock contention.

If admins use SMB clients to create directories for users then you can
always have them use an admin version of the share that has lock
coherency.

Yes, more workarounds, no really addressing the underlying problem.  :-)


> I would say that without these issues, nodes are pretty stable. We thought
> about increasing the leader broadcast timeout, but without understanding
> exactly why the broadcast was lost in the first place, it was not so clear
> it could help (we thought that the broadcast was actually lost, not just
> delayed).

Makes sense.

> [...]

> Yes, we will definitely try to reproduce it, but from past experience,
> sometimes it's hard to generate the same load from a limited test
> environment. We'll try it anyway and experiment with other values for the
> tunable.

> [...]

> "realtime scheduling" is enabled, but note that even with this, all lock
> helpers started by CTDB also have the same priority. So, even if running
> with high priority, the main CTDB process is just one of many competing for
> CPU.

The WIP patches include an option to run the lock helpers at a lower
priority than ctdbd.  Could help...

> I think it's also important to note that, in this particular case, lock
> contention seems very low before the global lock is taken, so I expect that
> most of the helpers will run without actually waiting for the mutex (it
> will be granted immediately).

Hmmm... OK.

> My idea is a bit more radical. The motivation is that starting a new
> process and communicating with it asynchronously is in the order of a few
> milliseconds (even tens or hundreds of milliseconds if we have a high
> number of context switches and CPU competition). On the other hand, trying
> to acquire a mutex is in the order of a few nanoseconds. This means a
> difference of at least 6 orders of magnitude. So my raw idea is based on:
> 
> 1. Add support in tevent to manage locks.
> 2. Instead of spawning a lock helper, just send a lock attempt to tevent,
> with a callback that will be executed when the lock is acquired.
> 3. If the lock cannot be acquired immediately, it will be added to the
> pending list.
> 4. In each loop, and before handling immediates, tevent will check the list
> of pending locks and will try to acquire them.
> 5. If a lock is acquired, post its callback as an immediate.
> 6. When tevent processes the immediates, the callbacks of all acquired
> locks will be executed.
> 
> This is a very high level idea. This will be faster as long as we don't
> attempt to get each lock a million times. I'm also thinking about how to
> prevent having to check each single pending lock in each iteration, which
> will heavily reduce the overhead, and how to prevent starvation in the
> worst case. I think there are ways to avoid these problems, but first I
> need to know if this idea makes sense to you.

I doubt that support for locks will be added to tevent - ctdbd would be
the only user.

However, you could do something very similar by using tevent to process
a queue when you add to it and also on a timer.  The only problem is,
as you say, "as long as we don't attempt to get each lock a million
times".  You end up with a queue that you need to manage.  You might
place a limit on the number of locks you retry in each run.  Then you
need to decide whether you're doing to be fair and always retry the
oldest queue members first (and they might be stubborn), or move those
that have been tried to the end of the queue, since others may be more
likely.  So, it is likely to get complicated.

At the moment, by using blocking locks, we're delegating the queuing
to the kernel.

Quite a few years ago TDB switched from fcntl() locks to mutexes, due
to the thundering herd problem.  Now, the fcntl() lock thundering herd
problem seems to be elegantly solved in the Linux kernel.  I don't know
what else we would lose, but perhaps it is time to try fcntl() lock
again?

Interesting problems... good times...  :-)

peace & happiness,
martin


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 35914AC3D37
	for <lists+samba-technical@lfdr.de>; Mon, 26 May 2025 11:47:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=C+Lhcmvg+c8DuVexeX9GrNWeSXuSPNOQauhybTDN0cc=; b=XC0+C2E4zVOpidEiRPx4yLWkQY
	WePK8mRLPz1E/HeaTlaaTLOCu6LJTr38dV473vnAJcm57XUSfmtKo2scwlPCl0XHNVyMC7xmrYHJj
	DDHZZDpliH1s2fwI8FqGXscKg3/rjLPombOX6gT6bqzMudCnbeA5i9gsatEHKJYqZ3/MEwIhCq1R7
	zVYR7qvf4gMqn5+R3zBlWRiV/OLSa7EtA7im+0tCaiQ1oDLXmG6KvA4tJ7HfpqmavberP3x4dM9tR
	lcSpKg4NEFRn4zaLwurNbPO8wD+R4LDhR5Q+mAeEwTo+U0SmAYziNqkF+i35/sICGgInaMPhM2/9d
	MVmCKZOA==;
Received: from ip6-localhost ([::1]:29310 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uJUPY-004E71-0D; Mon, 26 May 2025 09:46:24 +0000
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29]:59781) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uJUPS-004E6u-Tp
 for samba-technical@lists.samba.org; Mon, 26 May 2025 09:46:22 +0000
Received: by mail-vk1-xa29.google.com with SMTP id
 71dfb90a1353d-527b70bd90dso502890e0c.3
 for <samba-technical@lists.samba.org>; Mon, 26 May 2025 02:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748252777; x=1748857577; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5L8m1guBREndO5RpaZBvVhGorSKuSDZZE/eex40MP14=;
 b=hzxVe3L7GK7LBjuKLS4w17ke9XKX+aWkiC2cO5x6v24TWhC2aaV/ndNsZbCanQQaSX
 BYtn2Gbe+N0NOxO9whRpLSLFN0WILWjJP7DZ+oGESOfCt/bErLADsiUkPkIGOT6R25EI
 mGIfSVhFLvYkkNq7w2lB/RzZnM5QGpKspKgPgQWVxaXOfHGho9yXpGFG9QmP4wXw7moq
 l6A3t7EnpYP2EzafeCDlkMVjPxabtvxGbnxEdnPt4ui3tSkjQBenolUZTKfb10EtZE9p
 CH6OW/dGFrG7E54oJuKQC8lS2l8djqaa4GjK40KcwDX2kTO2lvMxnCmavtOV0Qz1jQUG
 LaQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748252777; x=1748857577;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5L8m1guBREndO5RpaZBvVhGorSKuSDZZE/eex40MP14=;
 b=kh8IKANjx0/2fRlMmlkem6dMdEwXGJ3c5XhD9J2vX5XO8m8289p0WYr3FBscTKR+Pi
 jupOjhsTngLalBvJSYIS7eeZ+s1ZjW0wKZrc3p3iMC6hm1zRZgPRQWuKB1ySwovjOxsE
 DNxOBT+zlJqpqySHUiOwgZxvVLuJl2EVhLUhKLe7vmPJzb+4virVX++gfnoMflj8/oy0
 yPVH9yYvk6Xq/FZ4Le63QuZ1gKIoLTHRNhr/e1JyJKWgNUprt+ozuUNuGhdMvPLpEfJm
 Xm+zoFHpTv9zEZ8jfoWq+RNXMAFwfuIvuZLuli4WNkrldj9DYReqcwV4lEfswo8HeopG
 NwUw==
X-Gm-Message-State: AOJu0YzcylqeMtNLAkX3cNb9zONpSl06aZBY6ty1KEtrCEcsEw5c2ckK
 FLVppT5LFFvju4/1GsLHLrRYdfO6hliXm56jOxq1J5ZZHg4gR3G8QkXW90a6gRb6Tve8TX09q/I
 QS8jw8wAoseL2JNGZ889fzhuSetm99YU=
X-Gm-Gg: ASbGncu4ydUIXMw2YNoyKUvcrnAsLbX5oPHzyMHIxMx0G2G1lXGb0sy1G+P5Z+RokqZ
 eBEjwL8sWw9eUfonAo3S3sfWuSt00sUFTqTuCnfmY0Z3ue791jYLXY1I3/s/kv0ASbrMo9sIbBp
 A1EMYQQqanPBcxRtboo3Re0ivR56DxembB
X-Google-Smtp-Source: AGHT+IFNftme6RKHq8ZEfzbQx4Q1pjXT9hD4KS7fFAPOraoXuc/HkqOjU2MEzjRH6OK4yRnoGdRcSG4HBN3MdS7p3b8=
X-Received: by 2002:a05:6122:81d4:b0:530:5082:7266 with SMTP id
 71dfb90a1353d-53050827339mr23022e0c.3.1748252776547; Mon, 26 May 2025
 02:46:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAO9H7P8386LOjJPbxSicuDFO-yQ+ofZyFv+Vz_28JnntkMrkcQ@mail.gmail.com>
 <20250525145257.1ff80548@martins.ozlabs.org>
In-Reply-To: <20250525145257.1ff80548@martins.ozlabs.org>
Date: Mon, 26 May 2025 11:46:05 +0200
X-Gm-Features: AX0GCFsS6H_34Y82B5M06SwsdV4fbbSuKFHlX-BRtIQMdDiwREW6KC3kjjHXmGk
Message-ID: <CAO9H7P8ix7ntc2Xtdowyv5mvBCKAZp+gOsCRdMoMAZqhnCH2tQ@mail.gmail.com>
Subject: Re: CTDB performance issue
To: Martin Schwenke <martin@meltin.net>
Content-Type: text/plain; charset="UTF-8"
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
From: Xavi Hernandez via samba-technical <samba-technical@lists.samba.org>
Reply-To: Xavi Hernandez <xhernandez@gmail.com>
Cc: gd@samba.org, Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Martin,

Thanks for your comments.

On Sun, May 25, 2025 at 6:52=E2=80=AFAM Martin Schwenke <martin@meltin.net>=
 wrote:

> Hi Xavi,
>
> On Wed, 21 May 2025 13:14:24 +0200, Xavi Hernandez
> <xhernandez@gmail.com> wrote:
>
> > I've been analyzing a problem where CTDB does many leader reelections
> > because it loses the leader broadcast messages.
> >
> > It's not always the same node that loses the broadcast, and it has been
> > confirmed with a network capture that the leader is actually sending th=
e
> > broadcasts, and the nodes are receiving them.
> >
> > Based on the data we have collected, I think the problem is caused by t=
he
> > lock helper processes that CTDB starts to wait for a mutex in case of
> > contention. The data shows that there's a lot of requests requiring TDB
> > access (mostly create and close), in the order of 1000 per second.
> However
> > we have seen that under normal circumstances, very few lock helpers are
> > started, which means that there's little contention and most of the
> mutexes
> > can be acquired immediately.
> >
> > The problem starts when a global operation, like vacuuming, is started.
> It
> > acquires the global lock of the TDB, causing all requests to contend.
> This
> > triggers the execution of many lock helpers, which get blocked. When 20=
0
> > (default value for tunable LockProcessesPerDB) lock helpers are started=
,
> > CTDB stops creating new processes, but queues them in a list.
> >
> > Meanwhile the vacuuming operation is running. It could take a few
> seconds,
> > but every second ~1000 new requests are queued to run a lock helper. On=
ce
> > vacuuming completes, the global lock is released and all 200 lock helpe=
rs
> > are unblocked at the same time.
> >
> > This seems to cause a lot of context switches. CTDB needs to handle the
> > termination of each process and starting a new one from the queue.
> > Additionally, there are many smbd processes doing work. During this tim=
e,
> > it looks like CTDB is not able to process the incoming queue fast enoug=
h,
> > and even though the leader broadcast message is present in the socket's
> > kernel buffer, CTDB doesn't see it for several seconds. This triggers t=
he
> > timeout and forces a reelection. The reelection itself also takes the
> > global lock (TDBs are frozen), which could cause the problem to repeat.
> >
> > We are still collecting data to try to find more evidence, but right no=
w
> > this seems to be what's happening.
> >
> > Does this make sense ?
> > Any recommendations to fix (or at least minimize) this problem in the
> > short-term ?
>
> It makes excellent sense.  Thanks for the excellent analysis!
>
> The best change I can think of would be to not start a recovery at the
> beginning of an election and to not bother with a recovery at the end
> of an election if the leader is unchanged.
>
> Basically, a recovery isn't needed unless the set of active nodes
> changes.  It is nice to have a leader, but in CTDB the leader is only
> really needed to do the things that a leader needs to do (recovery,
> failover, ...).
>
> I started some work in this area a few years ago but got spooked when I
> saw unexpected behaviour.  I need to take another look.
>

The recovery process can only make the problem worse, but it's not what
initially triggers the problem itself. Even without the recovery in the
picture, CTDB is already running slowly and requests accumulate big delays
(including the leader broadcast which arrives too late). I also think that
a workload where there's a lot of lock contention (forcing CTDB to start
the lock helper processes even in normal cases without vacuuming or other
operations) will make CTDB go slower and accumulate latencies. In any case
that's another issue and I don't have conclusive data yet.

Probably avoiding recovery would help, but I think we should try to
understand and fix the initial issue.



> However, I'm not sure this is short-term enough for you.  :-(
>
> I'm interested in a couple of things:
>
> * What sort of workload hammers CTDB hard enough that this problem
>   occurs?  Can you please give me some idea of the scale here?
>

I can't tell for sure what the users are doing, but from a network traffic
analysis, I can say that there are many open/close requests (in the order
of 1000 per second), and read and write operations mostly. The open/close
requests need to check/update the share mode, which requires TDB locked
access.

This happens on a 3 node CTDB cluster.



> * Apart from this, how stable is the cluster?  Is it a static group of
>   nodes that is generally rock solid?  In that case, you could just try
>   increasing the leader broadcast timeout.  However, if it were that
>   easy, I'm guessing you wouldn't have needed to do all of this
>   analysis.  ;-)
>

I would say that without these issues, nodes are pretty stable. We thought
about increasing the leader broadcast timeout, but without understanding
exactly why the broadcast was lost in the first place, it was not so clear
it could help (we thought that the broadcast was actually lost, not just
delayed).



>
> > Besides tweaking some parameters to reduce the frequency of operations
> that
> > require the global lock, could it help to reduce the LockProcessesPerDB=
 ?
> > It looks like less processes would cause less context switches and less
> > overhead to ctdb, so it would be able to process the queue faster. Does
> > that make sense or this could cause slowness in other cases ?
>
> The current defaults are based on some performance work that was
> done >10 years ago.  If you have a test setup where you can generate
> similar load to your productions setup, then I would encourage you to
> try things out and report back.  Reducing the size of a thundering herd
> might be good.  However, I wonder if reducing LockProcessesPerDB means
> you might increase the latency for taking lock.
>

Yes, we will definitely try to reproduce it, but from past experience,
sometimes it's hard to generate the same load from a limited test
environment. We'll try it anyway and experiment with other values for the
tunable.



>
> Sorry, I'm having trouble swapping all of this back into my brain
> today.  :-(
>
> > If this issue is really caused by the execution of the lock helpers, I'=
m
> > wondering if we couldn't get rid of them. I have an idea on that side,
> but
> > first I prefer to be sure that what we have seen is valid and I haven't
> > missed something else that could explain the problem.
>
> Just out of interest, do you have the "realtime scheduling" option
> switched off?  That would certainly impact on ctdbd's ability to stay
> ahead of other processes.  If this is the case, and you have a good
> reason for doing this, then perhaps we need to look at finishing and
> merging some patches to use regular scheduling priorities instead of
> real-time.  Those have been around for a long time - we were
> experimenting with this 10 years ago but never had the courage to
> listen to our test results and just go with it...
>

"realtime scheduling" is enabled, but note that even with this, all lock
helpers started by CTDB also have the same priority. So, even if running
with high priority, the main CTDB process is just one of many competing for
CPU.

I think it's also important to note that, in this particular case, lock
contention seems very low before the global lock is taken, so I expect that
most of the helpers will run without actually waiting for the mutex (it
will be granted immediately).



>
> Also interested in your idea for getting rid of lock helpers...
>

My idea is a bit more radical. The motivation is that starting a new
process and communicating with it asynchronously is in the order of a few
milliseconds (even tens or hundreds of milliseconds if we have a high
number of context switches and CPU competition). On the other hand, trying
to acquire a mutex is in the order of a few nanoseconds. This means a
difference of at least 6 orders of magnitude. So my raw idea is based on:

1. Add support in tevent to manage locks.
2. Instead of spawning a lock helper, just send a lock attempt to tevent,
with a callback that will be executed when the lock is acquired.
3. If the lock cannot be acquired immediately, it will be added to the
pending list.
4. In each loop, and before handling immediates, tevent will check the list
of pending locks and will try to acquire them.
5. If a lock is acquired, post its callback as an immediate.
6. When tevent processes the immediates, the callbacks of all acquired
locks will be executed.

This is a very high level idea. This will be faster as long as we don't
attempt to get each lock a million times. I'm also thinking about how to
prevent having to check each single pending lock in each iteration, which
will heavily reduce the overhead, and how to prevent starvation in the
worst case. I think there are ways to avoid these problems, but first I
need to know if this idea makes sense to you.

Best regards,

Xavi

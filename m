Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACA0AC326E
	for <lists+samba-technical@lfdr.de>; Sun, 25 May 2025 07:11:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=PdtuXqB8Pirsjpx0uTd3TlUQZMP0eqP3ryfvG7DcTPU=; b=kOUFwSCEVrgJDjg84FMzHLI1m/
	eP7SrHSrm4VOfwoozPjtoRL/eEd9r7O6em+jx7WanhhM/cAo/wyR4bqlG62ByTiw94390kkQJ9Wqf
	83rKN2Re47K+efHMRH1keyq3/KiiD/Rje56Yxp9ifVO2FnSA3G2WXcvg43RxbLdpTaCImD9TehbpG
	1WxmdK1PuIBkkJh+1v4/xaxh7QlMvIJEhFkT1aG+YJ5uItSRMDZDnsnE1dlQFqYR6ZqZ55PjJzdI7
	PltYY+rbcMxXXLI5ilSw4vQXnylLmYuJ961i/9G+ShL7PG2RhT+GCMUMy4vWbWqJBJSPVQ7Mjg7hM
	m0MsYDXw==;
Received: from ip6-localhost ([::1]:25884 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uJ3d7-004Ako-6l; Sun, 25 May 2025 05:10:37 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76]:32869 helo=mail.ozlabs.org)
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uJ3d1-004Akh-Sq
 for samba-technical@lists.samba.org; Sun, 25 May 2025 05:10:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meltin.net;
 s=202409; t=1748148773;
 bh=PdtuXqB8Pirsjpx0uTd3TlUQZMP0eqP3ryfvG7DcTPU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nCsvo2OtAF42KjqvbvwNW01KItFs3EWczGeDeQ2Za89WqVDHrmqplVnuAlAJwlbm7
 v+XcP7ohykZ1JbMPwKmrHJK8DBtNrrvBm6xR2L2r4hqDjhvq6aNsAkc4yJHtF+KfqD
 rA1EmCLhwiPS5LQrWGY1RQC9q7FCdF0xmV0tnLbdnO0AlUx36GbrbqF9OvEoA8SR/E
 QM94ANvBaQ8vO4lrHyiH0sX95PymuENRCaLxc5a7c7sxYG43iCtIzn42GReDsb7yDB
 vDOx3Fwnr/74m1uldJX8gDONpXCaQlyw/B30nC2ooUM8FHFm8z3+8lDzYjfjTFfR9C
 5Oigd5m+T/biw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4b4mjd69MCz4x0t;
 Sun, 25 May 2025 14:52:53 +1000 (AEST)
Date: Sun, 25 May 2025 14:52:57 +1000
To: Xavi Hernandez <xhernandez@gmail.com>
Subject: Re: CTDB performance issue
Message-ID: <20250525145257.1ff80548@martins.ozlabs.org>
In-Reply-To: <CAO9H7P8386LOjJPbxSicuDFO-yQ+ofZyFv+Vz_28JnntkMrkcQ@mail.gmail.com>
References: <CAO9H7P8386LOjJPbxSicuDFO-yQ+ofZyFv+Vz_28JnntkMrkcQ@mail.gmail.com>
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

On Wed, 21 May 2025 13:14:24 +0200, Xavi Hernandez
<xhernandez@gmail.com> wrote:

> I've been analyzing a problem where CTDB does many leader reelections
> because it loses the leader broadcast messages.
> 
> It's not always the same node that loses the broadcast, and it has been
> confirmed with a network capture that the leader is actually sending the
> broadcasts, and the nodes are receiving them.
> 
> Based on the data we have collected, I think the problem is caused by the
> lock helper processes that CTDB starts to wait for a mutex in case of
> contention. The data shows that there's a lot of requests requiring TDB
> access (mostly create and close), in the order of 1000 per second. However
> we have seen that under normal circumstances, very few lock helpers are
> started, which means that there's little contention and most of the mutexes
> can be acquired immediately.
> 
> The problem starts when a global operation, like vacuuming, is started. It
> acquires the global lock of the TDB, causing all requests to contend. This
> triggers the execution of many lock helpers, which get blocked. When 200
> (default value for tunable LockProcessesPerDB) lock helpers are started,
> CTDB stops creating new processes, but queues them in a list.
> 
> Meanwhile the vacuuming operation is running. It could take a few seconds,
> but every second ~1000 new requests are queued to run a lock helper. Once
> vacuuming completes, the global lock is released and all 200 lock helpers
> are unblocked at the same time.
> 
> This seems to cause a lot of context switches. CTDB needs to handle the
> termination of each process and starting a new one from the queue.
> Additionally, there are many smbd processes doing work. During this time,
> it looks like CTDB is not able to process the incoming queue fast enough,
> and even though the leader broadcast message is present in the socket's
> kernel buffer, CTDB doesn't see it for several seconds. This triggers the
> timeout and forces a reelection. The reelection itself also takes the
> global lock (TDBs are frozen), which could cause the problem to repeat.
> 
> We are still collecting data to try to find more evidence, but right now
> this seems to be what's happening.
> 
> Does this make sense ?
> Any recommendations to fix (or at least minimize) this problem in the
> short-term ?

It makes excellent sense.  Thanks for the excellent analysis!

The best change I can think of would be to not start a recovery at the
beginning of an election and to not bother with a recovery at the end
of an election if the leader is unchanged.

Basically, a recovery isn't needed unless the set of active nodes
changes.  It is nice to have a leader, but in CTDB the leader is only
really needed to do the things that a leader needs to do (recovery,
failover, ...).

I started some work in this area a few years ago but got spooked when I
saw unexpected behaviour.  I need to take another look.

However, I'm not sure this is short-term enough for you.  :-(

I'm interested in a couple of things:

* What sort of workload hammers CTDB hard enough that this problem
  occurs?  Can you please give me some idea of the scale here?

* Apart from this, how stable is the cluster?  Is it a static group of
  nodes that is generally rock solid?  In that case, you could just try
  increasing the leader broadcast timeout.  However, if it were that
  easy, I'm guessing you wouldn't have needed to do all of this
  analysis.  ;-)

> Besides tweaking some parameters to reduce the frequency of operations that
> require the global lock, could it help to reduce the LockProcessesPerDB ?
> It looks like less processes would cause less context switches and less
> overhead to ctdb, so it would be able to process the queue faster. Does
> that make sense or this could cause slowness in other cases ?

The current defaults are based on some performance work that was
done >10 years ago.  If you have a test setup where you can generate
similar load to your productions setup, then I would encourage you to
try things out and report back.  Reducing the size of a thundering herd
might be good.  However, I wonder if reducing LockProcessesPerDB means
you might increase the latency for taking lock.

Sorry, I'm having trouble swapping all of this back into my brain
today.  :-(

> If this issue is really caused by the execution of the lock helpers, I'm
> wondering if we couldn't get rid of them. I have an idea on that side, but
> first I prefer to be sure that what we have seen is valid and I haven't
> missed something else that could explain the problem.

Just out of interest, do you have the "realtime scheduling" option
switched off?  That would certainly impact on ctdbd's ability to stay
ahead of other processes.  If this is the case, and you have a good
reason for doing this, then perhaps we need to look at finishing and
merging some patches to use regular scheduling priorities instead of
real-time.  Those have been around for a long time - we were
experimenting with this 10 years ago but never had the courage to
listen to our test results and just go with it...

Also interested in your idea for getting rid of lock helpers...

Thanks!

peace & happiness,
martin


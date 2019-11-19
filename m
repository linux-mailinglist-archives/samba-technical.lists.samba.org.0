Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 409D5102D88
	for <lists+samba-technical@lfdr.de>; Tue, 19 Nov 2019 21:26:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=vbROuMtHuOSUUFqaRXUm7mGwfEOBj0kIORbA5xL8hz8=; b=aR3v67Q4bh8v2qG8FiTJThAAoh
	T7+V4weV+MXHwtoTaIOnFpSolMoGT3EuTPOfb5BQAHq6ihv3Sxq8j09bdfILF4jDhy0GKt2Imuc/w
	gOYhR80TJpmK4f17CXcMq6+Ajww7l8fODDuJh1lonS3H4rXwEOf3j9lKDwNaQCxhmCW8Z6ATQ6qw0
	BbPwe7D5p76dUhRiSThedi5qHvCElgni9bSagpzHk5w8ZeJ3DBWsCCXejglm/1mSgXWJFLk9YEi0j
	8XY+KgW4BBYnGs5plvGPFzQgBBB/Vao4czfrPjSZrcGXuZ1R2d2reHZglFWpvSJdYjPl+/8Vk9J4k
	LkjRns+g==;
Received: from localhost ([::1]:24142 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iXA4E-001f3v-Jx; Tue, 19 Nov 2019 20:25:42 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25018) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iXA49-001f3o-1F
 for samba-technical@lists.samba.org; Tue, 19 Nov 2019 20:25:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=vbROuMtHuOSUUFqaRXUm7mGwfEOBj0kIORbA5xL8hz8=; b=WhZFoXXZDeoS9MPFCOlzKUleQc
 lvynLekI6v4EcrngLqS79iKCAb/1jBnunA2GbSGYxO3GGMUzpQ/ltB1E7pVZyOtwBYxp44er0LbKS
 3rA2Bx8zlrkf0VvM7OwdnO2ZgqNzALXXg7qTE9monCg2DveLXGybraOP+LdvdQyEfXob5g9GrYj8C
 qhlO7r0zKsdS/7z7JUwjoA18OTYLL5cgWctZcuatvTVO4R74bDwiPZmLEEjjYU10R0+WiVjDSbb3w
 TI2Mp3x5ve6B6DmLICeev9AmzwmtpruX0nVUQhwGN+N6kJ4TNv2tWHS6iE0FQUZhRdzR838V4w+jf
 qFul/Up/Lvv34oQ6Gp+zyds6ALh2Fk9MGE8fE5tXe00pQP7657Gs5+MX5K4d5QdzGk9Htpg7FSvRv
 ngn/2gLmw3Zivy3wmYkV5/3ZxHaxT3AkrZ5b2araYzrHIHfVLUNjseaT81Qv/hhvNKjplwf+JhRaX
 PMjEUbPbFwi93nsgQ28N7hB0;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iXA46-0000HC-Mi; Tue, 19 Nov 2019 20:25:35 +0000
Message-ID: <6d01a1c1ce4d79aff60db993e084cb1fe4697351.camel@samba.org>
Subject: Re: feedback on ldap improvement in samba 4.11
To: Gary Lockyer <gary@catalyst.net.nz>, samba-technical@lists.samba.org
Date: Wed, 20 Nov 2019 09:25:31 +1300
In-Reply-To: <230ee6a4-d875-d749-cb60-80eb8ecd25d0@catalyst.net.nz>
References: <4ac9eeeb-211b-ca35-d234-6648c612ce3d@tranquil.it>
 <9dc8dc485f6bdf08823c5a86043c459c51ffd173.camel@samba.org>
 <230ee6a4-d875-d749-cb60-80eb8ecd25d0@catalyst.net.nz>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

We can't ignore SIGKILL, which is why the OOM killer uses it.

What is being asked for is to add SIGKILL to the list of signals
eligible for a restart in prefork_child_pipe_handler. 

Andrew Bartlett

On Wed, 2019-11-20 at 09:10 +1300, Gary Lockyer via samba-technical
wrote:
> Yeah still a little reluctant about having processes ignoring
> SIGKILL,
> but given that we use the control pipes to shut down it should
> probably
> be ok.  It's just going to require a bit of thought to make sure
> things
> can be shut down.
> 
> Ngā mihi
> Gary
> On 20/11/19 08:53, Andrew Bartlett via samba-technical wrote:
> > On Wed, 2019-11-13 at 11:24 +0100, Denis Cardon via samba-technical
> > wrote:
> > > Hi everyone,
> > > 
> > > I just wanted to say how impressed I was with the improvement in
> > > memory 
> > > handling in ldap server in samba 4.11 that were announced in the
> > > changelog.
> > > 
> > > I was doing some debug on OOMKiller issues on a Samba-AD 4.9 with
> > > a 
> > > large database in production. There are some buggy softwares that
> > > make 
> > > queries for all users (the most peculiar one I have seen is a
> > > print 
> > > driver...) and Samba 4.9 properly handles the query but allocate
> > > around 
> > > 2GiB RAM for the query while the client downloads the result.
> > > With a 
> > > handfull of such queries piling up it can quickly run the server
> > > out
> > > of 
> > > memory.
> > > 
> > > On the other hand with Samba-4.11 memory is allocated in a much
> > > more 
> > > frugal way and it can handle hundred of such buggy queries
> > > without 
> > > crashing (it may be slow but it does not crash). So kudos the
> > > Catalyst 
> > > dev team for that great piece of work!
> > 
> > Thank you so much!  This work started long, long ago when Simo (at
> > the
> > time controversially) made ldb async, so it was really nice to be
> > able
> > to finish the job and see the end result finally show in something
> > so
> > valuable. 
> > 
> > When we did it, we were not sure that it would help outside our
> > synthetic benchmarks, so to hear the difference it makes in the
> > real
> > world is wonderful!
> > 
> > > About the prefork model, the master ldap process is properly
> > > restarting 
> > > the child process after a SIGTERM but it is not restarting after
> > > a 
> > > SIGKILL. Is it normal?
> > 
> > I get Gary's view about a manual kill -9 respawing perhaps being
> > unwanted, but I agree, a re-spawn system that doesn't cope with the
> > OOM
> > killer is less than ideal, I would have expected such a process to
> > be
> > restarted (perhaps after a bit longer wait). 
> > 
> > Andrew Bartlett
> > 
> 
> 
-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT   
https://catalyst.net.nz/services/samba







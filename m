Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4754F3CB22D
	for <lists+samba-technical@lfdr.de>; Fri, 16 Jul 2021 08:03:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=IQPl1sz0P8Bob0uXxs8CqG+Y0zjHlbGn6kBY7lZcbdE=; b=YaSRBtsjIqf5zmuO3vpFRYgtPI
	K6R5MzkGm8ZFgnLelC6PLsUtV5hjrM/GoBDEVWxFzoeYjD+oFAf3zTzHxV/L3krMvGxgNDW/DSlfl
	N5o0JUNCSuGCgULS9lJOvpKNjDs06iP+8NxHvnFBcL2Rhd8pVYrDqZQVDTbs+nZzbfs5jsy44lhtM
	jj2lNkIaZGEstjy0nisZZXrBEe+vaWnxtJ4X8DqGmvGH5nD+QQA8i9ROu7h20QAcDT+VsQ7VSt0LI
	JbR+YaYXxiDf1w7l1CPzI/qf9e/mcuWnNICjRU9G4rbn6lfNYoFgBk9zKV3wvbxOgo+Qi+QL2yjbp
	R2rp1Wzg==;
Received: from ip6-localhost ([::1]:36058 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m4Gvr-00DvwN-8y; Fri, 16 Jul 2021 06:02:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:22420) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m4Gvk-00DvwE-0R
 for samba-technical@lists.samba.org; Fri, 16 Jul 2021 06:02:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=IQPl1sz0P8Bob0uXxs8CqG+Y0zjHlbGn6kBY7lZcbdE=; b=Aqhxb6EJzG9EJp9a0DbPs9be1D
 agpv45DBLrzmbtjfx9SvW77PSD1oVrvzF0GZV+VJXBpy80PXvw6ypWYWnltSKFRL8ijnzOqHxr53n
 YeNcrQVCpprToe+idauCAZ6mIgZjZON+vDzeyL91s7N9TSMQtt6WOjNVk93A0A/JAFJKzwykKFd/o
 cPpO/GNukJMEcFIaWa/+kMmKhWZu0DpjqIUiT44dI9frGxbkMawUoSUK2iVwpelTgkk0+8t1Ge6iV
 +rxkcwpdvpWCG/aFe35qZKpQSCYDoZxyZb/gWzhaOAJORtqBE8FHEPxVORU/yfWrxHBQkSfmfObYs
 SywzRt28ohOvt//KEmYldw5HmASwemyIHTh7Gt2U8AT7zhgHi0MQWNs4iqkFA9ZX13NJbnM88KRgR
 3BlXRmXDNFWZXjWTdWqnufWjcF9HYYhttuEfAfOidxsA1n+qLKd8pAZyr5v4nzVkNpWgqJiCreNaO
 KgTLfprwU+w1AyQ2057jKVXd;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m4Gvi-00079k-CP; Fri, 16 Jul 2021 06:02:34 +0000
Date: Fri, 16 Jul 2021 09:02:31 +0300
To: Amitay Isaacs <amitay@gmail.com>
Subject: Re: CTDB Segfault in a container-based env - Looking for pointers
Message-ID: <YPEg9+WzpGKaUjpX@pinega.vda.li>
References: <2450252.vFx2qVVIhK@edfu>
 <CAJ+X7mSHG_OUyNF2EiuvEtCQYJ4vOEH67kW0+1rOsLNp4BqaaQ@mail.gmail.com>
 <CAJ+X7mTSNvN=6v0-WSz_89Gjkg5rCf-AmDcVLo=LLmOhSWkyMw@mail.gmail.com>
 <2917630.lGaqSPkdTl@edfu>
 <2D9E704E-CBB4-4F27-94DD-5AFF80EE9482@samba.org>
 <CAJ+X7mS8WZnsimhonxEBjrwCjj8X=3Cmq=-tc1Xuv+0htoLk9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+X7mS8WZnsimhonxEBjrwCjj8X=3Cmq=-tc1Xuv+0htoLk9A@mail.gmail.com>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: John Mulligan <phlogistonjohn@asynchrono.us>,
 Samba Technical <samba-technical@lists.samba.org>,
 Michael Adam <obnox@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On pe, 16 heinä 2021, Amitay Isaacs via samba-technical wrote:
> On Fri, Jul 16, 2021 at 2:13 AM Michael Adam via samba-technical
> <samba-technical@lists.samba.org> wrote:
> >
> >
> >
> > > On 15. Jul 2021, at 15:16, John Mulligan via samba-technical <samba-technical@lists.samba.org> wrote:
> > >
> > > On Wednesday, July 14, 2021 10:12:46 PM EDT Amitay Isaacs via samba-technical
> > > wrote:
> > >> Hi John,
> > >>
> > >> There are certain assumptions made in CTDB assuming it's running on a
> > >> normal system. When running CTDB in a container, those assumptions are
> > >> not valid any more and you might get unexpected behaviour.
> > >>
> > >
> > > First, thanks for replying!
> > >
> > > Sure, I fully expect that. It was similar for smbd/winbind but in those cases
> > > I was able to tune the environment sufficiently - for example they need to run
> > > within the same pid namespace to function properly. The issue I'm having now
> > > is that the segfault isn't mapping to anything obvious (yet) that I can change
> > > in the environment.
> > >
> > >> One such assumption is that init (in some form) has the pid of 1 and
> > >> CTDB daemon will never have PID of 1.  Obviously this is not true in
> > >> your case.  From the logs you can see that the CTDB daemon is started
> > >> as PID 1. In general, CTDB relies on init (in some form) to start/stop
> > >> various file services (smb, nfs, etc.) via the event scripts.  So,
> > >> working init is a requirement for normal operation of CTDB.
> > >
> > > Good point. I'll experiment with giving ctdb a parent process.
> >
> > Right, if we want to avoid systemd or other beefier systems that are not made for containers, we can consider “tini”: E.g. rook is using this.
> >
> > >> What are you trying to do exactly?  You cannot put CTDB in a container
> > >> on its own without Samba daemons.
> >
> > Hmm, at least last I checked you can even run ctdb in a
> > “traditional” non-containerized cluster without any samba daemons.
> > :-)
> 
> Of course you can.  But that doesn't serve any useful purpose. :-)
> 
> > Maybe you are saying that if you want to run smbd/winbindd on top of
> > ctdb, then they must run in the same container? I don’t think this
> > is true either:
> >
> > We usually have multiple containers in one pod, and the containers
> > within the pod can communicate just as normal. At least that’s what
> > we did with the smbd and windbindd daemons: separate containers in
> > one pod.
> >
> 
> My understanding of containers is limited here, so I don't understand
> how you can run ctdb and smbd in different containers.  Does mutex
> locking on shared databases work across containers (or different
> namespaces)?  How about unix datagram messaging using pids?
> If mutex locking on shared databases works across containers, then
> obviously you can run ctdb and smbd in different containers.
> If unix datagram messaging works across containers, then obviously you
> can run smbd and winbindd in different containers.

Container is a collection of namespaces on top of the same Linux kernel.
Two containers may share some namespaces but not the others. For a
collection of containers on the same physical system it is possible to
define shared properties if they run in the same 'pod'. So you can have
UNIX domain sockets shared across different containers on the same host.
It needs a good coordination, of course.

> 
> > > I'm not clear on what you mean by that. My longer term goal is to investigate
> > > CTDB as part of the HA story for samba in containers (see our general effort
> > > here [1]). Short term, I just want to run ctdb on its own with very few (or
> > > none) event scripts just to get tdb replication working across multiple nodes
> > > in a container based environment. Based on my reading of the docs and a tiny
> > > bit of the code, bringing up smbd/etc is the responsibility of the event
> > > scripts
> >
> > This is not quite true:
> >
> > Ctdb logically consists of two layers:
> >
> > (1) the mandatory core is the distributed tab database and messaging channel for smbd
> > (2) the optional upper layer is about resource management (public IPs, services like smbd, winbindd, etc)
> >
> > Ctdb and samba can run together perfectly without #2 as long as
> > someone takes care of the service management. E.g it has been done
> > with pacemaker. In our case, Kubernetes / operators, etc, would
> > provide this role and we would run ctdb without
> > “CTDB_MANAGES_SAMBA=yes” etc...
> >
> > > so I think it should be possible to run ctdb on its own like that.
> > >
> > > Any thoughts on adding code to specifically handle the case where the callback
> > > has already been called, but tevent calls it again?
> >
> > Right the crux here seems to be the question whether the
> > tevent-using code in ctdb is not prepared for the situation that
> > EPOLLHUP is issued, and if  it would be appropriate to just catch
> > that condition (of being called again).
> 
> Well that's not really the crux here.  I know what the real issue is
> (I did write that code), but I still don't understand the motivation
> behind running ctdb and smbd in different containers.

I would say it is an independent question. Containerized environments
have been developed with the focus on microservices, where most
container instances only run a handful of processes; overall
architecture is to decompose your solution into a set of independently
running 'microservices' that can be spawned according to the scale
needs.

This does not always fly with domain controller-like setups where you
cannot have a microservices architecture in a natural way. However, for
serving files, for example, it would scale well if each individual
'microserviced' Samba file share represented with a single container
instance serving a single consumer.

You absolutely can run a 'heavy' solution in a single container with
traditional init system in it. We do so for FreeIPA in a container,
which relies on systemd services in more areas than Samba does (socket
activation, resource protection, ...). In most situations a request to
run in a microservice-like way is rather an organizational than a
technical requirement.

-- 
/ Alexander Bokovoy


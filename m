Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4249220F30D
	for <lists+samba-technical@lfdr.de>; Tue, 30 Jun 2020 12:48:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=wdFgy1bxmDaBuJn5SRpIPSql1/LuWQt7fjOBFnQ8YGE=; b=CsBX5RYa19gEU63rhKJWEKkx6T
	F4AZcIsRkml5b7kVmO1fSpfBFZajZGgQkbSVcirzSMEwZruLR/jwe43/NhNsTwP5TwRMRAK+U5lfl
	Du8gr2Z9HR+W3BuuoBmDVV3wf9e5SmemAQi4CTdUYhYEgezpMkcenq9Bs08dfJfrtWTQLaRKaSqdU
	zpPB/iWQvvKzZombz5FBHPyha6S2kgby2JJ8xpt8cK9FtT8nXeJnSH9I/pAG0UqJ7dSH4gPlbLjBL
	l5FQTISuQe1U93a4YjG+oSw1BTX4M2dwkigHrdpGeBuBr5umLjACyp4OOX43xOker8F2WRxQ0TvWj
	rAS2D5/Q==;
Received: from localhost ([::1]:55330 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jqDo2-002gfv-Hh; Tue, 30 Jun 2020 10:48:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27106) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jqDnw-002gfo-FZ
 for samba-technical@lists.samba.org; Tue, 30 Jun 2020 10:47:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=wdFgy1bxmDaBuJn5SRpIPSql1/LuWQt7fjOBFnQ8YGE=; b=xtM68wv00p/AH0r8FrgsSqQccV
 AQwei5wkDXUluEGXeKnG0MeLyCAbu85RWz2KytCJBeqplmhLeguRQgq+q0pjAL3lMDjZHqXQWssdN
 f+xsYfxxhejkX2ijRBF/dqjQACrh/b0ropUmhKhbhL1HfAp1pobFXPLD+w8NK/vGvoRDcAXATaR5u
 5Mubd5QXqF5vLuz3Hxk4SOxZqNDrx1DRs30SNXVLOB0+kqVzEus56lWPzUJUDrYGC/ryMqxAmNMRn
 qLjsQ9yA6pJIX2y9BsJkedlTJex3/8I499wGZKBeBZrqsQ769xVw4Z3Gsc3ZyvsC5NXOmX4C0vUBM
 IfM2Y1pQ1gwqjqdW745/Fs2S84DHLOFfk6rzUfRLiOWZgeY+pnKzeiL/OX0MXI4kxBIs0Ve8u+tUr
 3vkYF97huNspsGE3cnLLSPlpen0KmGGC8gS+XYzS0wx3U1u/o/PA+Er/IBFaV6LGhOiZsKCsOXTj4
 eMmIdGNz1DpLFir2YCJlnnqu;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jqDnu-0007Q9-PW; Tue, 30 Jun 2020 10:47:55 +0000
Message-ID: <e0441676a67f6a10c1e5d4fdbd8fa0463c668c89.camel@samba.org>
Subject: Re: socket-wrapper fd-passing
To: Stefan Metzmacher <metze@samba.org>
Date: Tue, 30 Jun 2020 16:17:46 +0530
In-Reply-To: <a5d29d28-c692-e9bc-f7a7-b3a0d2070849@samba.org>
References: <35bfe7ee-5c75-c785-8648-4c8191a9974a@samba.org>
 <86481a324b2b5068dfa438bedd6b7205fbe0ccf5.camel@samba.org>
 <56f956ce-98f4-6f51-960b-91ba7af19da3@samba.org>
 <a5d29d28-c692-e9bc-f7a7-b3a0d2070849@samba.org>
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

On Tue, 2020-06-30 at 07:33 +0200, Stefan Metzmacher via samba-
technical wrote:
> Hi Anoop,
> 
> > > In short, I could successfully run `make test` with changes to
> > > work out
> > > of a common shared file. Still there is one
> > > test(test_thread_echo_tcp_sendmsg_recvmsg, which I added) failing
> > > almost consistently on my local system and not on GitLab CI. I
> > > have
> > > been trying to root cause this failure for quite sometime now(as
> > > and
> > > when time allows me) without any luck in fixing it. I would love
> > > to see
> > > another pair of eyes reviewing the changes.
> > 
> > I guess the problem I described above and the code that tries to
> > construct the updated SCM_RIGHTS fd array, seems wrong, as far as I
> > can
> > see it only tries to pass the tmp pipe read end, but not the actual
> > fd
> > array passed from the caller.
> > 
> > I tried to get the SCM_RIGHTS passing working here:
> > https://gitlab.com/metze/socket_wrapper/-/tree/fd-passing-unix
> > 
> > Once I got this working I'll try to integrate this with the rest of
> > your
> > patches.
> 
> I got the basics working. I took your shared space patches on top,
> but
> that just fails immediately in Samba's make test.

Ok. I think I haven't tried it yet. I will check locally on my system.

> > > > An additional idea would be using temporary anonymous files
> > > > (maybe
> > > > memfd_create() or an similation for it) for shared structures
> > > > for
> > > > passed
> > > > sockets. In sendmsg() the sender would move the
> > > > socket_info[_container]
> > > > structures from malloc'ed memory to an temporary memory file.
> > > > This will replace the pipe fd of the original design.
> > > > If multiple fd's are passed, the memory file contains an array
> > > > of
> > > > socket_info[_container] structures.
> > > > int *socket_fds_idx would be changed to an array of structures
> > > > or we have an additional array to store possible fd for the
> > > > temporary
> > > > files and have the destructing code lock at it and select
> > > > between
> > > > free() and munmap()/close().
> > > > This design would not require a named file, like the one
> > > > specified
> > > > by SOCKET_WRAPPER_FD_PASSING_DB.
> > > 
> > > Hm.. this is new to me. I will think about it.
> > 
> > I guess it means we would need to undo some of the changes we made
> > to one array of socket_info structures.
> > 
> > I'll let you know if I get the basic passing of information via the
> > tmp
> > pipe working...
> 
> As Samba does not require that the socket is usable from two
> processes
> at the same time, I guess we can take a short cut and just pass
> the socket_info structure (an array of them) through the pipe.
> That would allow us to have multichannel tested in gitlab/autobuild.

I am looking through your changes and will let you know in case I need
more clarifications.

> I'll see if I can get this to work. Once we have these basics,
> we can try to improve the design to be more generic with shared
> structures, when we really need it.

Fine.




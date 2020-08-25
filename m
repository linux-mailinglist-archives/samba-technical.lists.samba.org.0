Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E05125127A
	for <lists+samba-technical@lfdr.de>; Tue, 25 Aug 2020 08:59:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=T3QH6epr0zILO0x8lVd+NnaJi5mYfAGbxQhLzAjTfbo=; b=PZr2L8JbD0iYhN1FaJWR1o90OK
	wGXSyhjRUa8Uu71gr8yfjnB09DxkfdXTt0NYi/kncSveqkBeYAsgojUE44N1m/UajyxWP90wzVqwM
	m61KeXcb2Ef5NHr4Sb/aDRMjxpMMaFsk8NI9un14iScdBbASn7gxkqPQl4uaCwbWS1qtve5euL2yc
	XrppMCTk55Y9nuK7xv/fdvlrn5i07KVKTePzt2R/TbmR4E/tjLJz7st3+fbU5p3EvohqcN9XNoyvN
	8EIOQk8jrkZrTPN0dUbTy+IEdSkUeYydLPdvdQlWrJYrINeZ1cAQVdrmJ4HA9xKC/skFJbxmX7KsR
	QLcP0vuQ==;
Received: from localhost ([::1]:38670 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kASuh-000MyF-5z; Tue, 25 Aug 2020 06:58:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20668) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kASuS-000My8-Nh
 for samba-technical@lists.samba.org; Tue, 25 Aug 2020 06:58:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=T3QH6epr0zILO0x8lVd+NnaJi5mYfAGbxQhLzAjTfbo=; b=qHbRnf63g0zTX2sRDXlxsvbTAQ
 wOCshwnbv02MEtDA7kTSMJbrxOpM0nkmuNQdX0hTfpRM0+M9WHLyU2ojFn8FX7Br+MYaxe/hUCtV+
 6IAtuIqz/J85q2ouYPZlcefD+EidT7jqmIWcR86K7qr1VYEMnJB6unZZW+AI9XNoucfYvJc3Yotzo
 Ndbbhiz91GmqRWnZ7Kmp6FBvu3SgE6h3J5f84KdFAv0/VzIcRk0iZd5lNGtumI4akFLr1sMvRXT7I
 GxNKSKYTwLMjCoiGpUIP0ftvyG6NmS08BOE1f8xf58vZS0KZeCaSN5lsjRiFBU06Kbho/xelbX04o
 ZpMbqi09twoet8ptCtVurvcMO7oP1XUFRAJD/QJzvfjIhwacUXbMF23f10ZlmmxFgRSzd2SvMRLjA
 jHAdiYPc9TgyYwS8blqt75tnmcO9xuO8Tx0mzHR3O+p1uuBiKKr0AtkAVO0f6BnNtbHb10s+ldgn3
 hBz7r3vjkaBzNVeM64GMeVtv;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kASuP-0000nb-6k; Tue, 25 Aug 2020 06:58:18 +0000
Message-ID: <9208357e5cb0d33ef1a4e6e021341edb41ce6c80.camel@samba.org>
Subject: Re: socket-wrapper fd-passing
To: Stefan Metzmacher <metze@samba.org>
Date: Tue, 25 Aug 2020 12:28:12 +0530
In-Reply-To: <f5c3e252-2783-d96c-8e89-1fd51bc6fa38@samba.org>
References: <35bfe7ee-5c75-c785-8648-4c8191a9974a@samba.org>
 <86481a324b2b5068dfa438bedd6b7205fbe0ccf5.camel@samba.org>
 <56f956ce-98f4-6f51-960b-91ba7af19da3@samba.org>
 <a5d29d28-c692-e9bc-f7a7-b3a0d2070849@samba.org>
 <e0441676a67f6a10c1e5d4fdbd8fa0463c668c89.camel@samba.org>
 <f5c3e252-2783-d96c-8e89-1fd51bc6fa38@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
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

On Tue, 2020-06-30 at 18:28 +0200, Stefan Metzmacher via samba-
technical wrote:
> Hi Anoop,
> 
> > > > I guess it means we would need to undo some of the changes we
> > > > made
> > > > to one array of socket_info structures.
> > > > 
> > > > I'll let you know if I get the basic passing of information via
> > > > the
> > > > tmp
> > > > pipe working...
> > > 
> > > As Samba does not require that the socket is usable from two
> > > processes
> > > at the same time, I guess we can take a short cut and just pass
> > > the socket_info structure (an array of them) through the pipe.
> > > That would allow us to have multichannel tested in
> > > gitlab/autobuild.
> > 
> > I am looking through your changes and will let you know in case I
> > need
> > more clarifications.
> > 
> > > I'll see if I can get this to work. Once we have these basics,
> > > we can try to improve the design to be more generic with shared
> > > structures, when we really need it.
> 
> I made good progress, see
> https://gitlab.com/metze/socket_wrapper/-/commits/fd-passing-unix
> https://gitlab.com/metze/socket_wrapper/-/pipelines/161689331
> 
> And for Samba:
> https://git.samba.org/?p=metze/samba/wip.git;a=shortlog;h=refs/heads/master-multichannel

Is this still the up-to-date branch with socket_wrapper changes pulled
in along with multichannel tests enabled?

> https://gitlab.com/samba-team/devel/samba/-/pipelines/161691424
> https://gitlab.com/samba-team/devel/samba/-/pipelines/161691541
> I'll add some more tests tomorrow and debug why some samba tests are
> failing...

Were you able to complete a successful Samba CI run with fd-passing
changes?



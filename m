Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFED1CBA63
	for <lists+samba-technical@lfdr.de>; Sat,  9 May 2020 00:03:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=13nz29wbGmjEvXg6bRoXX4TeRgpkSaQrzw+yPFgGaDw=; b=Z4gW6LqlwjlFiqS5bBUK3hvJFP
	rCQwTy/+b/YX9OL0NKUB0iWC1JoUinmVMfABAS1/a+SwPPOKeSAxXqnZekFn0ZT7Aa6CJWK1eSd2t
	p0ND6apIWhLn8spUeuTkHBWnHDASMtZEr9SsGx7ogMvIwBYQkwwsVikvgXXWP93dUNCJV5cJvHFvW
	DLteAlnDxUsNoP8cPOBpx8I6xc6ArVRO+tfVBcbOIJ2/6D0GP1O2J0wf/cfNrqWH56dhub2dfqu/v
	NdOVbHbeEknRDVKCOmp83BI0FDZ1FYD32uCBVVtBWWqMxk2MqR5aFRMclAe/pgxpdFokIjGR1g9Bw
	mxjjNmSg==;
Received: from localhost ([::1]:35726 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jXB5T-003Iel-FU; Fri, 08 May 2020 22:03:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44184) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jXB5O-003Iee-97
 for samba-technical@lists.samba.org; Fri, 08 May 2020 22:03:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=13nz29wbGmjEvXg6bRoXX4TeRgpkSaQrzw+yPFgGaDw=; b=a59xFL4epBNik1Yiwgv5uGhIXc
 gTI7yx/CT8zurD+PHOrXfcJsebvI1iufCivNXVUtfQX83rYEoeaWVrJqjkikHn03s6K3wPcwKV26+
 hR4Knoa1LNDileU94GKvfJtY6KJqi++wOMoPGU3qxfiJQrjFKPoql1MYuma61HeyFV/P+3aBtdEmX
 qbm4sbcKD1B9fzNNAiC+NYUhnagYwt0YsQ/xOPObWq52tOyOUfqh+TPHBYgcbYOptTRxS1WvBpoD3
 XTwe2DZKgYm/rXBPhQF9iAup8tazRCWXCFpPPjYybaY+FZOk5aMJSbEGbfD/NQyRUmwUMr93BlO7b
 ERXKvjoKGbwVPRGUiMwMVz2vWK8t/kUOL5CheGZrUehWb0tyuxJylvhjuiXazdjzQi3/fu500NyHh
 2fpReGIYbq6gqu3eul9Ajbd2eIgiUMQ9cYcFKkttZ9aAm5KHqzaxpeSmhN3S1HLE5xCa4fVrfco1c
 XjabFrl0Pxx2xEz5M5JnRb2U;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jXB5N-0001A7-2Q; Fri, 08 May 2020 22:03:13 +0000
Date: Fri, 8 May 2020 15:03:06 -0700
To: Stefan Metzmacher <metze@samba.org>
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
Message-ID: <20200508220306.GC2912@jeremy-acer>
References: <20200508062725.GB28687@jeremy-acer>
 <3c150c7ef40086ccb392e2911e954386f8c2bd0a.camel@cryptolab.net>
 <6e4d9002-6887-5c01-e992-1d893b3e6d63@samba.org>
 <ebdfdcd6d3ceab5f43172b3323589a5bcfcd957f.camel@cryptolab.net>
 <20200508185339.GD26399@jeremy-acer>
 <8e7d4319-a919-a364-8337-29308926f509@samba.org>
 <20200508204709.GG26399@jeremy-acer>
 <20200508205140.GH26399@jeremy-acer>
 <4e66af50-d900-3ed1-7d27-8b399cf63143@samba.org>
 <20200508215055.GA2912@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200508215055.GA2912@jeremy-acer>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Anoop C S <anoopcs@cryptolab.net>,
 Samba Technical <samba-technical@lists.samba.org>, jra@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, May 08, 2020 at 02:50:55PM -0700, Jeremy Allison wrote:
> On Fri, May 08, 2020 at 11:40:30PM +0200, Stefan Metzmacher wrote:
> > Am 08.05.20 um 22:51 schrieb Jeremy Allison:
> > > On Fri, May 08, 2020 at 01:47:09PM -0700, Jeremy Allison via samba-te=
chnical wrote:
> > >> On Fri, May 08, 2020 at 09:35:31PM +0200, Stefan Metzmacher via samb=
a-technical wrote:
> > >>>
> > >>> Thanks very much Jeremy! I didn't noticed that.
> > >>>
> > >>> I guess the attached patch should be able to fix the recursion.
> > >>
> > >> Oh Metze that's *really* ugly :-). I thought about
> > >> doing that in my code and decided it was in too bad
> > >> taste to live :-).
> > >>
> > >> Is there a cleaner way than putting "busy" and "retry"
> > >> variables in the config struct ?
> > >=20
> > > And a "Goto again" as well :-(. Bleegh.
> >=20
> > This version would actually work and looks a bit similar to
> > your version.
> >=20
> > Can you life with that version?
>=20
> Yes I can live with that :-). It at least moves the horror
> to the wrapper function where you can at least concentrate
> all your attention as to why it's doing what it's doing :-).
>=20
> RB+ from me if you add a comment header above the function
> as well as in the commit so it explains what it's doing.
>=20
> Feel free to crib my ascii art to explain in the header
> comment too :-).

There's just one final comment I want to make before
my version goes quietly into that good night... :-).

I will grant that your version leaves a cleaner set of code
paths throughout the io_uring pread/pwrite code and deals with
the short read/write issues in a more "natural" way
without my extra logic branches dealing with "short read"
return etc.

But the fact that you missed the recursion might make
you consider if indeed it's a simpler fix than having
all the extra logic made explicit. Sometimes explicit
is good to draw people's attention to complexity.

Having said that, I'll go with whatever you decide
on this one :-). I already gave me RB+ for the fix,
so I'll support whichever one you pick. But it would
be good to get the fix pushed and back-ported into
4.12 asap to cover the data corruption.

Thanks for working on this with me. I do learn things
=66rom the elegance of your code (usually :-).

Jeremy.


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A415F0B0C
	for <lists+samba-technical@lfdr.de>; Fri, 30 Sep 2022 13:51:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=AaZVB9huea584EM6mwMfFoIInW+/LVIYEyT/osPrT8k=; b=sR42ydRI4HwMZUqO3jKLbnr73E
	N1dpNXKGm1UsXl9ZnfoClmIRU77dKqI2/+qkUCwF8CgZAI+F33lxxVmRS7WdAqEfN9jwwnmazXMj5
	zHxLv/2sxWE3JjSxR1sz8nqcn7FpNDnk1fIspB93gVOHRU+cfEOqmPzT3ll6jSFfQPKHrFph+21Va
	ou3X/dkUBzA6kzVhPyfU92/aFYiQdM3h6PyYLLW0yuE7cbfQSTfCFaecW8psA1hnVRTfqPNAli+ZR
	gGQT01A+xvDdfIfJB9O8dduKNUNa987gyI/Nrh7SmlPQZVk+KF1QXXkkMnS4cCzzlCVxuAzYFLLdI
	iahB4eGA==;
Received: from ip6-localhost ([::1]:43282 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oeEXx-00537k-9r; Fri, 30 Sep 2022 11:51:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46038) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oeEXt-00537b-90
 for samba-technical@lists.samba.org; Fri, 30 Sep 2022 11:51:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=AaZVB9huea584EM6mwMfFoIInW+/LVIYEyT/osPrT8k=; b=dD7H6HW2ICi57dlr7Gq7P42Lta
 J3qEA+0DkU+dC0jgwe8nYSmbmecyEX6pLWutemGXgR3e12jNn94RNeR2ARll3NvS9Hz1uS4T1jzUh
 JijsoO6+ehmHfrpiRjFTUaksItMoU53V0yhPozk9j3MtufLmMYMmgJAw2THHbkW5EHscfzW4ZoziF
 nCYZOEQIcrQoJRHUUoe/TSr0UKH2Bk9lSIQJQjJGTRkMV/lqUZAmp7pEb972eTbigQfu0dCMAHaif
 tDKKiIhVPqxBUwXgmrO0DhPiIMck5EgtrXBo/CMHmP4GWqHz5a/xP4L0VTOWMsxkt67SmOJOD/9Zh
 o463ErPBDYvVQLqPYlJUW2DPLLZik00T/WF74QdqQ1E1P/E9FCjqaSuA0AizQweHq7pimapBCy1Ni
 PpbKqiEXzgbB/zdKJg22ZUQICH/1YIHVdNPoCaJCiF7cSoCpM3lQMp6B1rGxlZTnA1NcI8Q5MPC3M
 6LQFzRY3Fr8ZNJ0FfDg/KNaQ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oeEXr-002UQv-M7; Fri, 30 Sep 2022 11:51:08 +0000
Message-ID: <5e2d2a14ba002abcda0c7db1df0efa83ae9cdf4e.camel@samba.org>
Subject: Re: How to detect a client-closed connection during a write from
 our LDAP server?
To: ronnie sahlberg <ronniesahlberg@gmail.com>
Date: Fri, 30 Sep 2022 14:51:05 +0300
In-Reply-To: <CAN05THTFo3rKAahxaK9U44NO8K4YNROFUmHS3WyQ7QqwXeeZFw@mail.gmail.com>
References: <d0c713564b3c9f848bab99ba74f3ce79a5add2f6.camel@samba.org>
 <0fdfd28f916f5260e99c7b6463eb37080e129fa6.camel@samba.org>
 <CAN05THTFo3rKAahxaK9U44NO8K4YNROFUmHS3WyQ7QqwXeeZFw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2022-09-30 at 21:31 +1000, ronnie sahlberg via samba-technical
wrote:
> On Fri, 30 Sept 2022 at 21:12, Isaac Boukris via samba-technical
> <samba-technical@lists.samba.org> wrote:
> >=20
> > On Fri, 2022-09-30 at 14:26 +1300, Andrew Bartlett via samba-
> > technical
> > wrote:
> > > I've been trying to chase down the CPU spins reported by our
> > > users in
> > > the writev() codepath from our LDAP server.
> > >=20
> > > A private mail the the strace output shows the sockets are in
> > > CLOSE_WAIT state, returning EAGAIN over and over (after a call to
> > > epoll() each time).=C2=A0 That alone would be enough to keep things
> > > spinning.
> > >=20
> > > But they are being shut down, however our LDAP server won't be
> > > triggering a read any time soon, it is waiting to flush the
> > > response
> > > out.
> >=20
> > Why wouldn't it? I mean why does the read waits for the write? if
> > epoll
> > says so then we should read, then we may detect that the client
> > closed
> > it end and may decide to give up the writes.
> >=20
> > Technically, I think there is no problem to write to a socket after
> > the
> > peer sent us FIN,
>=20
> I think possibly the problem is that IF the tcp tx buffer is full,
> you
> might get -EAGAIN instead of a better error
> if the socket is only half-closed.

Yeah the EAGAIN is probably due to tx buffer full, since in this case
the client probably stopped reading, but otherwise you should be able
to write and the client should be able to read, since the socket is
only half-closed. I wonder what are the events reported by epoll..

> > it just mean he closed its end and won't write no
> > more, but we can still write until we close or he/we reset (as is
> > the
> > case with HTTP 1.0).
> >=20
>=20



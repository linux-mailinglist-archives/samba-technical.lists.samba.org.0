Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F303E1403
	for <lists+samba-technical@lfdr.de>; Thu,  5 Aug 2021 13:38:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=mBOakMlzNCGXs2ywMULB+tUtjLgqaSCecIuYRiOpFz8=; b=co/mBju++ux/rIdH+jlz1zIpts
	oDmfu6/oxxhFULyW954EdFiePyyTbiBn/is53UN+2j6X1FwlKIKACtzvTx14UqBYBbEniiZHygFnx
	P1qve/5PN174QcB8lSdWhGxZFNwGOoL9B1nFMAIK44yIEf74AApkkvIE+5YyTZqwGONRKuDYtUQwG
	47wJxBOv/VifixQ0Mrs6uC6+7RUYm1kt9y9Q4PuJa/iblPAciYWHGvA9eQlHCadMjcxnFxxMLuGSf
	Ltb0/+6ogcKhvbYn/PVVfcQkJX0LQ60+WXTxcK5RVzXx8rrU2v6m8j8E1WGXndFg4cn2NvEYaVzS2
	5c0d2uIQ==;
Received: from ip6-localhost ([::1]:39960 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mBbgh-004obA-5d; Thu, 05 Aug 2021 11:37:23 +0000
Received: from [104.200.28.160] (port=46782 helo=dup2.asynchrono.us) 
 by hr1.samba.org with esmtp (Exim) id 1mBbgc-004ob1-IC
 for samba-technical@lists.samba.org; Thu, 05 Aug 2021 11:37:20 +0000
Received: from edfu.localnet (c-73-114-31-46.hsd1.ma.comcast.net
 [73.114.31.46])
 by dup2.asynchrono.us (Postfix) with ESMTPSA id 953BD150C;
 Thu,  5 Aug 2021 11:37:13 +0000 (UTC)
To: samba-technical@lists.samba.org, Martin Schwenke <martin@meltin.net>
Subject: Re: CTDB Segfault in a container-based env - Looking for pointers
Date: Thu, 05 Aug 2021 07:37:12 -0400
Message-ID: <5719386.LZWGnKmheA@edfu>
In-Reply-To: <20210804141837.45723a29@martins.ozlabs.org>
References: <2450252.vFx2qVVIhK@edfu>
 <CAJ+X7mTdkF4+52wCfMC1SrmyzJ2Xq4VKKBkJ=qFPgOwiekG2Kw@mail.gmail.com>
 <20210804141837.45723a29@martins.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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
From: John Mulligan via samba-technical <samba-technical@lists.samba.org>
Reply-To: John Mulligan <phlogistonjohn@asynchrono.us>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wednesday, August 4, 2021 12:18:37 AM EDT Martin Schwenke via samba-
technical wrote:
> On Tue, 20 Jul 2021 15:59:02 +1000, Amitay Isaacs via samba-technical
>=20
> <samba-technical@lists.samba.org> wrote:
> > On Fri, Jul 16, 2021 at 5:47 PM Michael Adam <obnox@samba.org> wrote:
> >=20
> > The issue is that CTDB makes assumptions about the orphan processes.
> > On most unix systems, an orphan process gets re-parented to init which
> > traditionally has pid =3D 1.  This assumption is built into the code to
> > avoid runaway orhan processes in CTDB.
>=20

Would it be worthwhile to have ctdbd explicitly reject running as pid 1? Fo=
r=20
example, it could get the pid and if equal to 1 log an error (and exit=20
nonzero?). I felt a little foolish not having determined this rule on my ow=
n,=20
but had this been part of ctdbd already, it would have saved time. I don't=
=20
know if I'll be the last person to try it either :-)

If you are in agreement that this is a good, small, improvement to ctdb sho=
uld=20
I file a bug?

> Yes, we explicitly check if the parent process is 1 in the lock helper
> before continuing.  As discussed offline, we should try something with a
> file descriptor event to try to determine whether the parent has gone
> away.
>=20
> > In the container world, what happens to orphan processes?
>=20
> Everything I can find says they are re-parented to process 1 in the
> container.
>=20

Agreed. However to add some additional detail - it's parented to PID 1 of t=
he=20
current pid namespace. So, even with multiple "containers" if they share th=
e=20
same pid namespace it's the PID 1 of whatever process from whatever contain=
er=20
was started first for that namespace.

> > > Even if you don=E2=80=99t see a real benefit of this containerized la=
yout
> > > just yet, it might still be beneficial for the code to consider
> > > some modifications to make ctdb more =E2=80=9Ccontainer-ready=E2=80=
=9D...
> >=20
> > Provided it makes sense. ;-)
>=20
> Yep!  If there is no sane re-parenting of orphan processes inside
> containers then we should recommended that CTDB is always run via a
> minimal init.  CTDB launches a lot of processes and if it goes away
> then something needs to look after them.
>=20

The good thing is that I have found that the container runtimes docker and=
=20
podman come bundled with such a minimal init. This can be started by provid=
ing=20
the "--init" option to the `{docker,podman} run` command.

If you are using the "pod" approach to running containers - where some of t=
he=20
namespaces are shared between the containers (as in kubernetes or podman)=20
there will be a "pause" container started first. When the pid namespace is=
=20
shared this pause process also reaps processes, serving as the minimal init=
=20
needed (AFAICT).

(It's amazing all the things you can find when you know what to look for!)

> As we discussed offline, at the moment the current crash reminds us we
> have a problem to solve, so we shouldn't just "fix" it to avoid the
> crash.  We should find a better solution for detecting that the parent
> has gone away, use that and then fix the crash that may still occur.
> We might also be doing a similar thing elsewhere...
>=20
> peace & happiness,
> martin

Sounds good to me. To circle back to my first suggestion in this message, h=
ad=20
the crash been more obviously linked back to ctdb as pid 1 I probably would=
=20
have not started this thread. :-)
I was concerned it was something more subtle than just being run as PID 1. =
Now=20
that I know that it's well known that ctdbd can't be PID 1 I think that=20
putting that knowledge into the code to act as a "wrong way" sign could be=
=20
useful for future travelers.






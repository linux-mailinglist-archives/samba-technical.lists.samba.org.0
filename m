Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACAA3CB385
	for <lists+samba-technical@lfdr.de>; Fri, 16 Jul 2021 09:48:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Date:Subject;
	bh=3UPC0JL/pMB94UiJm6EEDnrGgBuVdkZhVJhUnAfIV3w=; b=eKcO4H5muhFyf9c6UfhAd1O//F
	R3Yjuwt31Rm7gzuuACboUvpa575J0Pq2kFauInozDSQFwS7VZ4N002jkNvVDDZEvpu2JW0kcdKoOK
	pgDKOCLnX60uTKFrKN4+1sBPfYldtTkhV/2clUSBz/HQhi0QPE9ZNw5KWAX72ow+TUHE7ZxxlfDLu
	aHk7knymnm+VeAfuIPBkcozm6eFTBcO+RHE+Y2+UW66+ac/8Txyn8aB59StA19zFwk05SsJsZi7IW
	qtJ9NVmBc01MMNBcfUtjDDiVqxP55oPoolJB7GDtFeG+RRrEQ0cvYCBZKY16sbx+ix08BDQvOY4Mh
	Lr2AYjDA==;
Received: from ip6-localhost ([::1]:43462 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m4IZl-00DzEc-PJ; Fri, 16 Jul 2021 07:48:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48464) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m4IZe-00DzET-3M
 for samba-technical@lists.samba.org; Fri, 16 Jul 2021 07:47:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=To:Cc:Date:Message-Id:From;
 bh=Yja5kQKlWP+03+IXuHdtDeL0yozRUM/g10fb4PQxh5k=; b=qPGeXq5NRX3dcCzHULQBXZNHT4
 4CELfCelHhsLj226KPxhKhGvGmQ2PicX0cV15GQSEDVOJ1TyJTgjDYGSu95MmT9JucYoyJDM7dxMc
 mYtZ+BRJq4AzwpffReBEBzkGmY6qM7plhk8Kw8/WRpUS54nTPprvde5r9nsiYJoystm8l5n++Ovyq
 UDYmYknV81wjsOIgK4fce1+AXUbtqGCXLVO1NwxrZKJXeJYOwgk1bkQnTWxhdxI4nE031ClYWyZer
 OOzX46w1YkNpWUwNWnKgP8LEyMnYjdQK1J1S5rbXo5g7mVFJW/rOR/jwPa9Ww5CfYN0B83OipBzSO
 J7LrKTUFhISRDhY5u7EithXNKyZAr5lWreDmJ+xdPZ/ohb6bmZ28It5MEFbmlzgT3zl6PRF/N3Rq3
 lOewedpgRKR0ydZCM0IJJBzOY7b9cB1rP2S1D/cZh1Au8JF8F0XzFua2sEu9l2LfoAK0qyMqSWxe0
 Cw4FGtvlGdi6uqop3Yp+MMNO;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1m4IZd-00015b-6r; Fri, 16 Jul 2021 07:47:53 +0000
Message-Id: <88C43F2E-84D1-4065-969F-D3572DBCDF58@samba.org>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: Re: CTDB Segfault in a container-based env - Looking for pointers
Date: Fri, 16 Jul 2021 09:47:52 +0200
In-Reply-To: <CAJ+X7mS8WZnsimhonxEBjrwCjj8X=3Cmq=-tc1Xuv+0htoLk9A@mail.gmail.com>
To: Amitay Isaacs <amitay@gmail.com>
References: <2450252.vFx2qVVIhK@edfu>
 <CAJ+X7mSHG_OUyNF2EiuvEtCQYJ4vOEH67kW0+1rOsLNp4BqaaQ@mail.gmail.com>
 <CAJ+X7mTSNvN=6v0-WSz_89Gjkg5rCf-AmDcVLo=LLmOhSWkyMw@mail.gmail.com>
 <2917630.lGaqSPkdTl@edfu> <2D9E704E-CBB4-4F27-94DD-5AFF80EE9482@samba.org>
 <CAJ+X7mS8WZnsimhonxEBjrwCjj8X=3Cmq=-tc1Xuv+0htoLk9A@mail.gmail.com>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
Content-Type: text/plain;
	charset=utf-8
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
From: Michael Adam via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Adam <obnox@samba.org>
Cc: John Mulligan <phlogistonjohn@asynchrono.us>,
 Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



> On 16. Jul 2021, at 04:43, Amitay Isaacs <amitay@gmail.com> wrote:
>=20
> On Fri, Jul 16, 2021 at 2:13 AM Michael Adam via samba-technical
> <samba-technical@lists.samba.org =
<mailto:samba-technical@lists.samba.org>> wrote:
>>=20
>>=20
>>=20
>>> On 15. Jul 2021, at 15:16, John Mulligan via samba-technical =
<samba-technical@lists.samba.org> wrote:
>>>=20
>>> On Wednesday, July 14, 2021 10:12:46 PM EDT Amitay Isaacs via =
samba-technical
>>> wrote:
>>>> Hi John,
>>>>=20
>>>> There are certain assumptions made in CTDB assuming it's running on =
a
>>>> normal system. When running CTDB in a container, those assumptions =
are
>>>> not valid any more and you might get unexpected behaviour.
>>>>=20
>>>=20
>>> First, thanks for replying!
>>>=20
>>> Sure, I fully expect that. It was similar for smbd/winbind but in =
those cases
>>> I was able to tune the environment sufficiently - for example they =
need to run
>>> within the same pid namespace to function properly. The issue I'm =
having now
>>> is that the segfault isn't mapping to anything obvious (yet) that I =
can change
>>> in the environment.
>>>=20
>>>> One such assumption is that init (in some form) has the pid of 1 =
and
>>>> CTDB daemon will never have PID of 1.  Obviously this is not true =
in
>>>> your case.  =46rom the logs you can see that the CTDB daemon is =
started
>>>> as PID 1. In general, CTDB relies on init (in some form) to =
start/stop
>>>> various file services (smb, nfs, etc.) via the event scripts.  So,
>>>> working init is a requirement for normal operation of CTDB.
>>>=20
>>> Good point. I'll experiment with giving ctdb a parent process.
>>=20
>> Right, if we want to avoid systemd or other beefier systems that are =
not made for containers, we can consider =E2=80=9Ctini=E2=80=9D: E.g. =
rook is using this.
>>=20
>>>> What are you trying to do exactly?  You cannot put CTDB in a =
container
>>>> on its own without Samba daemons.
>>=20
>> Hmm, at least last I checked you can even run ctdb in a =
=E2=80=9Ctraditional=E2=80=9D non-containerized cluster without any =
samba daemons. :-)
>=20
> Of course you can.  But that doesn't serve any useful purpose. :-)

That=E2=80=99s a different topic. You wrote that =E2=80=9Cyou cannot=E2=80=
=9D, and I said yes, you can. :-)

>=20
>> Maybe you are saying that if you want to run smbd/winbindd on top of =
ctdb, then they must run in the same container? I don=E2=80=99t think =
this is true either:
>>=20
>> We usually have multiple containers in one pod, and the containers =
within the pod can communicate just as normal. At least that=E2=80=99s =
what we did with the smbd and windbindd daemons: separate containers in =
one pod.
>>=20
>=20
> My understanding of containers is limited here, so I don't understand
> how you can run ctdb and smbd in different containers.  Does mutex
> locking on shared databases work across containers (or different
> namespaces)?  How about unix datagram messaging using pids?

You are right, in that normally containers do not share these kinds of =
things automatically, but as mentioned by me and in Alexander=E2=80=99s =
mail, the =E2=80=9Cpod=E2=80=9D is the smallest unit that is deployed =
together in kubernetes. A pod is a collection of one or more containers =
that are seen as a unit on one host system. (podman can also directly =
work on pods, even without Kubernetes.) The containers within a pod =
share the same pid-space, and can easily access common files, devices, =
sockets, etc.=20

> If mutex locking on shared databases works across containers, then
> obviously you can run ctdb and smbd in different containers.
> If unix datagram messaging works across containers, then obviously you
> can run smbd and winbindd in different containers.

Yes, as John and I have demonstrated in our sambaXP presentation,=20

=
https://sambaxp.org/fileadmin/user_upload/sambaxp2021-slides/Mulligan_Adam=
_samba_operator.pdf
https://www.youtube.com/watch?v=3DmG-Jxaf8_gw

this was already working. The next step was to add ctdb into the =
picture, where John hit additional problems.

(Spoiler alert: following my suggesting with using tini as an init =
process in the container, John has been able to make ctdb + samba work =
in the container yesterday. He will follow up with detail.)

>=20
>>> I'm not clear on what you mean by that. My longer term goal is to =
investigate
>>> CTDB as part of the HA story for samba in containers (see our =
general effort
>>> here [1]). Short term, I just want to run ctdb on its own with very =
few (or
>>> none) event scripts just to get tdb replication working across =
multiple nodes
>>> in a container based environment. Based on my reading of the docs =
and a tiny
>>> bit of the code, bringing up smbd/etc is the responsibility of the =
event
>>> scripts
>>=20
>> This is not quite true:
>>=20
>> Ctdb logically consists of two layers:
>>=20
>> (1) the mandatory core is the distributed tab database and messaging =
channel for smbd
>> (2) the optional upper layer is about resource management (public =
IPs, services like smbd, winbindd, etc)
>>=20
>> Ctdb and samba can run together perfectly without #2 as long as =
someone takes care of the service management. E.g it has been done with =
pacemaker. In our case, Kubernetes / operators, etc, would provide this =
role and we would run ctdb without =E2=80=9CCTDB_MANAGES_SAMBA=3Dyes=E2=80=
=9D etc...
>>=20
>>> so I think it should be possible to run ctdb on its own like that.
>>>=20
>>> Any thoughts on adding code to specifically handle the case where =
the callback
>>> has already been called, but tevent calls it again?
>>=20
>> Right the crux here seems to be the question whether the tevent-using =
code in ctdb is not prepared for the situation that EPOLLHUP is issued, =
and if  it would be appropriate to just catch that condition (of being =
called again).
>=20
> Well that's not really the crux here.  I know what the real issue is
> (I did write that code), but I still don't understand the motivation
> behind running ctdb and smbd in different containers.

As Alexander explained in his mail, the =E2=80=9Cmicroservice=E2=80=9D =
approach is a paradigm by which each container should be as simple as =
possible, ideally just encapsulating a single process, and containers =
interacting with each other over network and other interfaces, possible =
multiple containers bundled into a pod if needed and appropriate. One =
fundamental idea behind this is this: if the application / service is =
comprised of multiple components, and each component is isolated in a =
container image that is as minimal as possible, the whole management of =
the application like scaling of individual components etc can all be =
done by a generic container orchestration system, in our case =
kubernetes. This just works best if each container is minimal. =
Rescheduling a more complex, heavyweight container multiple server =
components in that same container is possibly much more disruptive and =
problematic.

Since we are looking at managing samba as much as possible in a =
kubernetes/container-native way here (see the sambaXP preso), it is =
natural to aim at as much a micro-service approach as possible. We will =
certainly have to do some modifications to Samba / ctdb itself at some =
point to go the last mile, and I am convinced that this will be =
beneficial to the software as such, but of course the first approach is =
to see how far we can get without any modifications.

But since you know what the real issue is, would you please enlighten =
us? :-)

Even if you don=E2=80=99t see a real benefit of this containerized =
layout just yet, it might still be beneficial for the code to consider =
some modifications to make ctdb more =E2=80=9Ccontainer-ready=E2=80=9D...

Cheers - Michael

>=20
>>=20
>> But it is of course good and correct to weed out any higher level =
config issues before diving into this.
>>=20
>> Cheers - Michael
>>=20
>>>=20
>=20
> Amitay.


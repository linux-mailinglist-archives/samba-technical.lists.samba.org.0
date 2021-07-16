Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC453CB7EE
	for <lists+samba-technical@lfdr.de>; Fri, 16 Jul 2021 15:36:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=ytlzJp0E5/ZUfVOyFP2yuwhtEeH0FNalau9PFuu8dlY=; b=Z5EAa7R570WMpcMaNb/hIQOE1Y
	kuh1xpZgJX+P2JQfxsXpjR/Taud1s+hsVXt7MBW/LubCs7P/Jqq1W4wKktgSk9K0CA3gnpLo3NVmx
	ZX8Y4ic7uSP8RlrJSS4YaLEWEHNsINDHSV0oyoJiBr/ea4S81wk9Rz+SLqPFyLXPIriUJT0suzqO7
	/xiC8+aYXc3YaO9y869+3RqKmYEcn8GfmZPT5R20kHWeZuOLPJ5GxrlOf0tGqXPg/679u3i8MAWpx
	1koWa+KgqoA7hQ/kehRr8DoGMN3A94chvzIcscMy0u2qYyym0QyEDWcqps0FlfhQyUKGE9Gss8qh7
	1ldLK/Hg==;
Received: from ip6-localhost ([::1]:55754 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m4O0P-00E4pU-Bu; Fri, 16 Jul 2021 13:35:53 +0000
Received: from [104.200.28.160] (port=46592 helo=dup2.asynchrono.us) 
 by hr1.samba.org with esmtp (Exim) id 1m4O0C-00E4hf-5W
 for samba-technical@lists.samba.org; Fri, 16 Jul 2021 13:35:45 +0000
Received: from edfu.localnet (c-73-114-31-46.hsd1.ma.comcast.net
 [73.114.31.46])
 by dup2.asynchrono.us (Postfix) with ESMTPSA id DCA161169;
 Fri, 16 Jul 2021 13:35:35 +0000 (UTC)
To: Samba Technical <samba-technical@lists.samba.org>
Subject: Re: CTDB Segfault in a container-based env - Looking for pointers
Date: Fri, 16 Jul 2021 09:35:35 -0400
Message-ID: <7076119.9J7NaK4W3v@edfu>
In-Reply-To: <88C43F2E-84D1-4065-969F-D3572DBCDF58@samba.org>
References: <2450252.vFx2qVVIhK@edfu>
 <CAJ+X7mS8WZnsimhonxEBjrwCjj8X=3Cmq=-tc1Xuv+0htoLk9A@mail.gmail.com>
 <88C43F2E-84D1-4065-969F-D3572DBCDF58@samba.org>
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
Cc: Michael Adam <obnox@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Friday, July 16, 2021 3:47:52 AM EDT Michael Adam wrote:
> > On 16. Jul 2021, at 04:43, Amitay Isaacs <amitay@gmail.com> wrote:
> >=20
> > On Fri, Jul 16, 2021 at 2:13 AM Michael Adam via samba-technical
> >=20
> > <samba-technical@lists.samba.org <mailto:samba-technical@lists.samba.or=
g>>=20
wrote:
> >>> On 15. Jul 2021, at 15:16, John Mulligan via samba-technical
> >>> <samba-technical@lists.samba.org> wrote:
> >>>=20
> >>> On Wednesday, July 14, 2021 10:12:46 PM EDT Amitay Isaacs via
> >>> samba-technical>>>=20
> >>> wrote:
> >>>> Hi John,
> >>>>=20
> >>>> There are certain assumptions made in CTDB assuming it's running on a
> >>>> normal system. When running CTDB in a container, those assumptions a=
re
> >>>> not valid any more and you might get unexpected behaviour.
> >>>=20
> >>> First, thanks for replying!
> >>>=20
> >>> Sure, I fully expect that. It was similar for smbd/winbind but in tho=
se
> >>> cases I was able to tune the environment sufficiently - for example
> >>> they need to run within the same pid namespace to function properly.
> >>> The issue I'm having now is that the segfault isn't mapping to anythi=
ng
> >>> obvious (yet) that I can change in the environment.
> >>>=20
> >>>> One such assumption is that init (in some form) has the pid of 1 and
> >>>> CTDB daemon will never have PID of 1.  Obviously this is not true in
> >>>> your case.  From the logs you can see that the CTDB daemon is started
> >>>> as PID 1. In general, CTDB relies on init (in some form) to start/st=
op
> >>>> various file services (smb, nfs, etc.) via the event scripts.  So,
> >>>> working init is a requirement for normal operation of CTDB.
> >>>=20
> >>> Good point. I'll experiment with giving ctdb a parent process.
> >>=20
> >> Right, if we want to avoid systemd or other beefier systems that are n=
ot
> >> made for containers, we can consider =E2=80=9Ctini=E2=80=9D: E.g. rook=
 is using this.>>=20
> >>>> What are you trying to do exactly?  You cannot put CTDB in a contain=
er
> >>>> on its own without Samba daemons.
> >>=20
> >> Hmm, at least last I checked you can even run ctdb in a =E2=80=9Ctradi=
tional=E2=80=9D
> >> non-containerized cluster without any samba daemons. :-)>=20
> > Of course you can.  But that doesn't serve any useful purpose. :-)
>=20
> That=E2=80=99s a different topic. You wrote that =E2=80=9Cyou cannot=E2=
=80=9D, and I said yes, you
> can. :-)
> >> Maybe you are saying that if you want to run smbd/winbindd on top of
> >> ctdb, then they must run in the same container? I don=E2=80=99t think =
this is
> >> true either:
> >>=20
> >> We usually have multiple containers in one pod, and the containers wit=
hin
> >> the pod can communicate just as normal. At least that=E2=80=99s what w=
e did with
> >> the smbd and windbindd daemons: separate containers in one pod.>=20
> > My understanding of containers is limited here, so I don't understand
> > how you can run ctdb and smbd in different containers.  Does mutex
> > locking on shared databases work across containers (or different
> > namespaces)?  How about unix datagram messaging using pids?
>=20
> You are right, in that normally containers do not share these kinds of
> things automatically, but as mentioned by me and in Alexander=E2=80=99s m=
ail, the
> =E2=80=9Cpod=E2=80=9D is the smallest unit that is deployed together in k=
ubernetes. A pod
> is a collection of one or more containers that are seen as a unit on one
> host system. (podman can also directly work on pods, even without
> Kubernetes.) The containers within a pod share the same pid-space, and can
> easily access common files, devices, sockets, etc.
> > If mutex locking on shared databases works across containers, then
> > obviously you can run ctdb and smbd in different containers.
> > If unix datagram messaging works across containers, then obviously you
> > can run smbd and winbindd in different containers.
>=20
> Yes, as John and I have demonstrated in our sambaXP presentation,
>=20
> https://sambaxp.org/fileadmin/user_upload/sambaxp2021-slides/Mulligan_Ada=
m_s
> amba_operator.pdf https://www.youtube.com/watch?v=3DmG-Jxaf8_gw
>=20
> this was already working. The next step was to add ctdb into the picture,
> where John hit additional problems.

Indeed. FWIW when running smbd plus winbind we need to enable a shared PID=
=20
namespace. Similarly, when CTDB is added to the mix the PID namespace will=
=20
also be shared among smbd, winbind, and ctdbd containers.

Unix domain sockets work by sharing parts of the file system across multipl=
e=20
containers. For example, when using winbind we share /run/samba/winbindd.


>=20
> (Spoiler alert: following my suggesting with using tini as an init process
> in the container, John has been able to make ctdb + samba work in the
> container yesterday. He will follow up with detail.)

Yes, I was planning on updating the list today, but you scooped me. Using a=
=20
minimal init process such as "tini" avoids triggering this problem. I wish =
I=20
had tried it sooner, but I guess that what these threads are for -- pointin=
g=20
out that thing one overlooked. :-)

I also experimented with sharing PID namespace between a "pause container" =
as=20
pid 1, and ctdb. That also appeared to avoid the segfault, but I did see=20
zombie processes after terminating ctbdd. Thus I'm planning on using tini f=
or=20
now and do addition investigation of the "optimal" way to start ctdbd later=
=2E=20
Perhaps gathering additional feedback from this thread.


> >>> I'm not clear on what you mean by that. My longer term goal is to
> >>> investigate CTDB as part of the HA story for samba in containers (see
> >>> our general effort here [1]). Short term, I just want to run ctdb on
> >>> its own with very few (or none) event scripts just to get tdb
> >>> replication working across multiple nodes in a container based
> >>> environment. Based on my reading of the docs and a tiny bit of the
> >>> code, bringing up smbd/etc is the responsibility of the event scripts
> >>=20
> >> This is not quite true:
> >>=20
> >> Ctdb logically consists of two layers:
> >>=20
> >> (1) the mandatory core is the distributed tab database and messaging
> >> channel for smbd (2) the optional upper layer is about resource
> >> management (public IPs, services like smbd, winbindd, etc)
> >>=20
> >> Ctdb and samba can run together perfectly without #2 as long as someone
> >> takes care of the service management. E.g it has been done with
> >> pacemaker. In our case, Kubernetes / operators, etc, would provide this
> >> role and we would run ctdb without =E2=80=9CCTDB_MANAGES_SAMBA=3Dyes=
=E2=80=9D etc...>>=20
> >>> so I think it should be possible to run ctdb on its own like that.
> >>>=20
> >>> Any thoughts on adding code to specifically handle the case where the
> >>> callback has already been called, but tevent calls it again?
> >>=20
> >> Right the crux here seems to be the question whether the tevent-using
> >> code in ctdb is not prepared for the situation that EPOLLHUP is issued,
> >> and if  it would be appropriate to just catch that condition (of being
> >> called again).>=20
> > Well that's not really the crux here.  I know what the real issue is
> > (I did write that code), but I still don't understand the motivation
> > behind running ctdb and smbd in different containers.
>=20
> As Alexander explained in his mail, the =E2=80=9Cmicroservice=E2=80=9D ap=
proach is a
> paradigm by which each container should be as simple as possible, ideally
> just encapsulating a single process, and containers interacting with each
> other over network and other interfaces, possible multiple containers
> bundled into a pod if needed and appropriate. One fundamental idea behind
> this is this: if the application / service is comprised of multiple
> components, and each component is isolated in a container image that is as
> minimal as possible, the whole management of the application like scaling
> of individual components etc can all be done by a generic container
> orchestration system, in our case kubernetes. This just works best if each
> container is minimal. Rescheduling a more complex, heavyweight container
> multiple server components in that same container is possibly much more
> disruptive and problematic.
>=20
> Since we are looking at managing samba as much as possible in a
> kubernetes/container-native way here (see the sambaXP preso), it is natur=
al
> to aim at as much a micro-service approach as possible. We will certainly
> have to do some modifications to Samba / ctdb itself at some point to go
> the last mile, and I am convinced that this will be beneficial to the
> software as such, but of course the first approach is to see how far we c=
an
> get without any modifications.


We mentioned that in the presentation but didn't elaborate on it much as we=
=20
were already pressed for time. :-)

In addition to the benefits that isolated-by-default provide, we've been tr=
ying=20
to treat the container image like a single application with various=20
subcommands (think "net" or "samba-tool" or "git" subcommand style). Leavin=
g=20
aside the long running daemons, we have functionality like populate the sam=
ba=20
config registry from a JSON file, and update AD DNS from a JSON file, and s=
o on.=20
At the risk of repeating myself we're striving to keep the containers=20
independent of the orchestration layer so that they can be reused by others.

Yet, at a very high level, this is all driven by the desire to use containe=
r=20
orchestration as a general substrate controlling clusters of physical/virtu=
al=20
machines. In that orchestration specific use-cases are deployed: your=20
webservers, or your nosql db, or distributed file system, or - as in our ca=
se - =20
your NAS protocol heads.

>=20
> But since you know what the real issue is, would you please enlighten us?
> :-)
>=20
> Even if you don=E2=80=99t see a real benefit of this containerized layout=
 just yet,
> it might still be beneficial for the code to consider some modifications =
to
> make ctdb more =E2=80=9Ccontainer-ready=E2=80=9D...
>=20
> Cheers - Michael
>=20
> >> But it is of course good and correct to weed out any higher level conf=
ig
> >> issues before diving into this.
> >>=20
> >> Cheers - Michael
> >=20
> > Amitay.






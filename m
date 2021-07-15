Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2873CA208
	for <lists+samba-technical@lfdr.de>; Thu, 15 Jul 2021 18:13:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Date:Subject;
	bh=JPpR1NOCnZRkQumhl7V2AJoKzB5+2U7HrYPsyM4TV5Q=; b=Rpsdrpz4q8X8dSF62+T2QJoQNW
	az1M+l4FnkA84kOHZF5zUGV8i2UIjucbn7dQMSNzMPu+hDhrtkry9ofQhAd6LF4ATQrLSMHqXG69v
	em4bXqRtlBIUVJOuczlwUyryW8N+/w8VLi/to8VqIXf5BVbf6od0jNkBCg2ReeRDbUWNrOdxtU2Gi
	J2b9rOQuPhB0AZMOi0UvTFJ0dikc6GVj1Ga5ntzjaOVnQpS2RZod7ERt6cxjqoa9Ng5zE0r2H8U5C
	niADT1Y1a9QsvPEdqhtEDJgZ46ODSD9nMXYvEqr1hZTXfLyRVkEh0Dp4btPLQ4XQJlpIEUJ4q1/cT
	LXu8xgsQ==;
Received: from ip6-localhost ([::1]:31394 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m43yT-00DsEM-8v; Thu, 15 Jul 2021 16:12:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59576) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m43yM-00DsEC-VY
 for samba-technical@lists.samba.org; Thu, 15 Jul 2021 16:12:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=To:Message-Id:Cc:Date:From;
 bh=JPpR1NOCnZRkQumhl7V2AJoKzB5+2U7HrYPsyM4TV5Q=; b=TO200BPCFpCrsOwY6Z3pwUOogE
 ELM/VvACnILXZDm6Y8gf7nq7sIz1OBG1VqNr3kAGfajtnifdH3nzUSmqcJ+uHYKRTqWEwevWJ6jwH
 Oo5nnd4ewH+e4mJbM5jvBHm7xcjxYPZn/SllriSyEG0JxonbsTAo9U6+T+Qur2fWWDtR+W3K5o+Id
 kKKis6hdeBInusAvdT1OmjXYraWDmwCbl/6FqrQVDFc1hbSC/pVM89BZiv5KneVMJ1pwOmRToDnpP
 DtxXcMcLuI4y7UUcE3VRXln2b9mqYO69znvz9LzLlYsoH8hCimqkW6VhojZvEFfBrc8vZ3shRHBS8
 M9KCgcYc/fLrU1AzE4ippPzPkvrr02zKTBHVYHElP0UJiRIL42pBEE9neKmwa0DPDjOhrCKfusL4w
 plDHV3sMj1TWIJJhg7d11DaN3dgFo5i3E8U6sdUE1avTgXDICWlb5qhVBYvJkCWmfVCo3zaPoxiDP
 u/D7qtdqKoNUEe/Lox9Vx4s/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1m43yM-0001JW-J2; Thu, 15 Jul 2021 16:12:26 +0000
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: Re: CTDB Segfault in a container-based env - Looking for pointers
In-Reply-To: <2917630.lGaqSPkdTl@edfu>
Date: Thu, 15 Jul 2021 18:12:25 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <2D9E704E-CBB4-4F27-94DD-5AFF80EE9482@samba.org>
References: <2450252.vFx2qVVIhK@edfu>
 <CAJ+X7mSHG_OUyNF2EiuvEtCQYJ4vOEH67kW0+1rOsLNp4BqaaQ@mail.gmail.com>
 <CAJ+X7mTSNvN=6v0-WSz_89Gjkg5rCf-AmDcVLo=LLmOhSWkyMw@mail.gmail.com>
 <2917630.lGaqSPkdTl@edfu>
To: John Mulligan <phlogistonjohn@asynchrono.us>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
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
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



> On 15. Jul 2021, at 15:16, John Mulligan via samba-technical =
<samba-technical@lists.samba.org> wrote:
>=20
> On Wednesday, July 14, 2021 10:12:46 PM EDT Amitay Isaacs via =
samba-technical=20
> wrote:
>> Hi John,
>>=20
>> There are certain assumptions made in CTDB assuming it's running on a
>> normal system. When running CTDB in a container, those assumptions =
are
>> not valid any more and you might get unexpected behaviour.
>>=20
>=20
> First, thanks for replying!
>=20
> Sure, I fully expect that. It was similar for smbd/winbind but in =
those cases=20
> I was able to tune the environment sufficiently - for example they =
need to run=20
> within the same pid namespace to function properly. The issue I'm =
having now=20
> is that the segfault isn't mapping to anything obvious (yet) that I =
can change=20
> in the environment.
>=20
>> One such assumption is that init (in some form) has the pid of 1 and
>> CTDB daemon will never have PID of 1.  Obviously this is not true in
>> your case.  =46rom the logs you can see that the CTDB daemon is =
started
>> as PID 1. In general, CTDB relies on init (in some form) to =
start/stop
>> various file services (smb, nfs, etc.) via the event scripts.  So,
>> working init is a requirement for normal operation of CTDB.
>=20
> Good point. I'll experiment with giving ctdb a parent process.

Right, if we want to avoid systemd or other beefier systems that are not =
made for containers, we can consider =E2=80=9Ctini=E2=80=9D: E.g. rook =
is using this.

>> What are you trying to do exactly?  You cannot put CTDB in a =
container
>> on its own without Samba daemons.

Hmm, at least last I checked you can even run ctdb in a =
=E2=80=9Ctraditional=E2=80=9D non-containerized cluster without any =
samba daemons. :-)

Maybe you are saying that if you want to run smbd/winbindd on top of =
ctdb, then they must run in the same container? I don=E2=80=99t think =
this is true either:

We usually have multiple containers in one pod, and the containers =
within the pod can communicate just as normal. At least that=E2=80=99s =
what we did with the smbd and windbindd daemons: separate containers in =
one pod.

> I'm not clear on what you mean by that. My longer term goal is to =
investigate=20
> CTDB as part of the HA story for samba in containers (see our general =
effort=20
> here [1]). Short term, I just want to run ctdb on its own with very =
few (or=20
> none) event scripts just to get tdb replication working across =
multiple nodes=20
> in a container based environment. Based on my reading of the docs and =
a tiny=20
> bit of the code, bringing up smbd/etc is the responsibility of the =
event=20
> scripts

This is not quite true:

Ctdb logically consists of two layers:

(1) the mandatory core is the distributed tab database and messaging =
channel for smbd
(2) the optional upper layer is about resource management (public IPs, =
services like smbd, winbindd, etc)

Ctdb and samba can run together perfectly without #2 as long as someone =
takes care of the service management. E.g it has been done with =
pacemaker. In our case, Kubernetes / operators, etc, would provide this =
role and we would run ctdb without =E2=80=9CCTDB_MANAGES_SAMBA=3Dyes=E2=80=
=9D etc...

> so I think it should be possible to run ctdb on its own like that.
>=20
> Any thoughts on adding code to specifically handle the case where the =
callback=20
> has already been called, but tevent calls it again?

Right the crux here seems to be the question whether the tevent-using =
code in ctdb is not prepared for the situation that EPOLLHUP is issued, =
and if  it would be appropriate to just catch that condition (of being =
called again).

But it is of course good and correct to weed out any higher level config =
issues before diving into this.

Cheers - Michael

>=20
> Again, thanks a bunch for your time!
>=20
>=20
> PS. Re-sending to the list with the correct from address. Apologies =
for any=20
> duplicates.
>=20
>>=20
>> Amitay.
>>=20
>> On Thu, Jul 15, 2021 at 3:43 AM John Mulligan via samba-technical
>>=20
>> <samba-technical@lists.samba.org> wrote:
>>> Hi Team,
>>>=20
>>> I'm currently experimenting with running CTDB as a component in a
>>> container
>>> based environment (OCI/docker style).
>>> Unlike smbd and winbind, which were fairly easy to containerize, =
CTDB is
>>> proving a bit more tricky. Specifically, I'm seeing a segfault that =
I can
>>> not trace to something obvious. I'm reaching out to the list for =
thoughts
>>> and suggestions.
>>>=20
>>> First, here's the logging leading up to the segfault:
>>>=20
>>> ctdbd[1]: CTDB starting on node
>>> ctdbd[1]: Starting CTDBD (Version 4.13.9) as PID: 1
>>> ctdbd[1]: Created PID file /var/run/ctdb/ctdbd.pid
>>> ctdbd[1]: Listening to ctdb socket /var/run/ctdb/ctdbd.socket
>>> ctdbd[1]: Set real-time scheduler priority
>>> ctdbd[1]: Starting event daemon /usr/libexec/ctdb/ctdb-eventd -P 1 =
-S 9
>>> ctdb-eventd[7]: daemon started, pid=3D7
>>> ctdb-eventd[7]: startup completed successfully
>>> ctdb-eventd[7]: listening on /var/run/ctdb/eventd.socket
>>> ctdbd[1]: Set runstate to INIT (1)
>>> ctdbd[1]: ../../ctdb/server/eventscript.c:654 Running event init =
with
>>> arguments (null)
>>> ctdbd[1]: ctdb chose network address 10.88.0.5:4379
>>> ctdbd[1]: PNN is 0
>>> ctdbd[1]: Not loading public addresses, no file =
/etc/ctdb/public_addresses
>>> OH COME ON init
>>> ctdbd[1]: Vacuuming is disabled for non-volatile database ctdb.tdb
>>> ctdbd[1]: Attached to database '/var/lib/ctdb/persistent/ctdb.tdb.0' =
with
>>> flags 0x400
>>> ctdbd[1]: Attached to persistent database ctdb.tdb
>>> ctdbd[1]: Freeze db: ctdb.tdb
>>> ctdbd[1]: Set lock helper to "/usr/libexec/ctdb/ctdb_lock_helper"
>>> ctdbd[1]: SIGCHLD from 20 process:20
>>> ctdbd[1]: Set runstate to SETUP (2)
>>> ctdbd[1]: ../../ctdb/server/eventscript.c:654 Running event setup =
with
>>> arguments
>>> ctdbd[1]: SIGCHLD from 22 process:22
>>> ctdbd[1]: =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> ctdbd[1]: INTERNAL ERROR: Signal 11: Segmentation fault in pid 1 =
(4.13.9)
>>> ctdbd[1]: If you are running a recent Samba version, and if you =
think this
>>> problem is not yet fixed in the latest versions, please consider =
reporting
>>> this bug, see https://wiki.samba.org/index.php/Bug_Reporting
>>> ctdbd[1]: =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> ctdbd[1]: PANIC (pid 1): Signal 11: Segmentation fault in 4.13.9
>>> ctdbd[1]: BACKTRACE: 15 stack frames:
>>> ctdbd[1]:  #0 /lib64/libsamba-util.so.0(log_stack_trace+0x34)
>>> [0x7ff1fbf77254] ctdbd[1]:  #1 =
/lib64/libsamba-util.so.0(smb_panic+0x2a)
>>> [0x7ff1fbf7c05a] ctdbd[1]:  #2 /lib64/libsamba-util.so.0(+0x1c348)
>>> [0x7ff1fbf7c348] ctdbd[1]:  #3 /lib64/libpthread.so.0(+0x141e0)
>>> [0x7ff1fbeff1e0]
>>> ctdbd[1]:  #4 /usr/sbin/ctdbd(+0x62d94) [0x55fac130fd94]
>>> ctdbd[1]:  #5 =
/lib64/libtevent.so.0(tevent_common_invoke_fd_handler+0x7d)
>>> [0x7ff1fbedfa4d]
>>> ctdbd[1]:  #6 /lib64/libtevent.so.0(+0xd4e7) [0x7ff1fbee34e7]
>>> ctdbd[1]:  #7 /lib64/libtevent.so.0(+0x5f57) [0x7ff1fbedbf57]
>>> ctdbd[1]:  #8 /lib64/libtevent.so.0(_tevent_loop_once+0x94)
>>> [0x7ff1fbedf414] ctdbd[1]:  #9
>>> /lib64/libtevent.so.0(tevent_common_loop_wait+0x1b)
>>> [0x7ff1fbedf50b]
>>> ctdbd[1]:  #10 /lib64/libtevent.so.0(+0x5fc7) [0x7ff1fbedbfc7]
>>> ctdbd[1]:  #11 /usr/sbin/ctdbd(ctdb_start_daemon+0x6f6) =
[0x55fac12e34b6]
>>> ctdbd[1]:  #12 /usr/sbin/ctdbd(main+0x4f9) [0x55fac12c2679]
>>> ctdbd[1]:  #13 /lib64/libc.so.6(__libc_start_main+0xf2) =
[0x7ff1fbd331e2]
>>> ctdbd[1]:  #14 /usr/sbin/ctdbd(_start+0x2e) [0x55fac12c2d3e]
>>>=20
>>>=20
>>> And a backtrace from gdb:
>>>=20
>>> (gdb) bt
>>> #0  process_callbacks (locked=3D<optimized out>, =
lock_ctx=3D0x5605e32977f0)
>>>=20
>>>    at ../../ctdb/server/ctdb_lock.c:271
>>>=20
>>> #1  ctdb_lock_handler (ev=3D<optimized out>, tfd=3D<optimized out>,
>>>=20
>>>    flags=3D<optimized out>, private_data=3D<optimized out>)
>>>    at ../../ctdb/server/ctdb_lock.c:372
>>>=20
>>> #2  0x00007f09fdbe2a4d in tevent_common_invoke_fd_handler (
>>>=20
>>>    fde=3Dfde@entry=3D0x5605e3290f50, flags=3D1, =
removed=3Dremoved@entry=3D0x0)
>>>    at ../../tevent_fd.c:138
>>>=20
>>> #3  0x00007f09fdbe64e7 in epoll_event_loop (tvalp=3D0x7ffd3e7e5e60,
>>>=20
>>>    epoll_ev=3D0x5605e329c930) at ../../tevent_epoll.c:736
>>>=20
>>> #4  epoll_event_loop_once (ev=3D<optimized out>, location=3D<optimized=
 out>)
>>>=20
>>>    at ../../tevent_epoll.c:937
>>>=20
>>> #5  0x00007f09fdbdef57 in std_event_loop_once (ev=3D0x5605e329a110,
>>>=20
>>>    location=3D0x5605e1d94d00 "../../ctdb/server/ctdb_daemon.c:1647")
>>>    at ../../tevent_standard.c:110
>>>=20
>>> #6  0x00007f09fdbe2414 in _tevent_loop_once =
(ev=3Dev@entry=3D0x5605e329a110,
>>>=20
>>>    location=3Dlocation@entry=3D0x5605e1d94d00 "../../ctdb/server/
> ctdb_daemon.c:
>>> 1647") at ../../tevent.c:772
>>> #7  0x00007f09fdbe250b in tevent_common_loop_wait =
(ev=3D0x5605e329a110,
>>>=20
>>>    location=3D0x5605e1d94d00 "../../ctdb/server/ctdb_daemon.c:1647")
>>>    at ../../tevent.c:895
>>>=20
>>> #8  0x00007f09fdbdefc7 in std_event_loop_wait (ev=3D0x5605e329a110,
>>>=20
>>>    location=3D0x5605e1d94d00 "../../ctdb/server/ctdb_daemon.c:1647")
>>>    at ../../tevent_standard.c:141
>>>=20
>>> #9  0x00005605e1d4b4b6 in ctdb_start_daemon (ctdb=3D0x5605e327e4f0,
>>>=20
>>>    interactive=3D<optimized out>, test_mode_enabled=3D<optimized =
out>)
>>>    at ../../ctdb/server/ctdb_daemon.c:1647
>>>=20
>>> #10 0x00005605e1d2a679 in main (argc=3D<optimized out>, =
argv=3D<optimized
>>> out>)
>>>=20
>>>    at ../../ctdb/server/ctdbd.c:398
>>>=20
>>> (gdb) list
>>> 266             }
>>> 267
>>> 268             /* Since request may be freed in the callback, unset =
the
>>> request */
>>> 269             lock_ctx->request =3D NULL;
>>> 270
>>> 271             request->callback(request->private_data, locked);
>>> 272
>>> 273             if (!auto_mark) {
>>> 274                     return;
>>> 275             }
>>> (gdb) p request
>>> $1 =3D (struct lock_request *) 0x0
>>>=20
>>> In order to not go too far into "wall of text" mode, with lots more =
gdb
>>> and
>>> strace output, I'll try to summarize my other findings so far. I can
>>> produce much more additional detail at request. Also, please let me =
know
>>> if you think this is better handled in bugzilla. Because this is an
>>> experimental setup I thought the list was a better place to begin.
>>>=20
>>> I have a minimal set of configuration files. Specifically, I've only =
set
>>> up
>>> one event script, "events/legacy/00.ctdb.script". I also have a =
custom
>>> notify.sh but I don't think it made a difference when we tried it =
with a
>>> standard one from ctdb packages. I have only one single instance =
running
>>> with a nodes file containing only the local IP of the container. I =
have
>>> tried this using both an unprivileged container and a privileged
>>> container with the same result. I also attempted to use this same
>>> "minimal" configuration on a VM, in that environment I was not able =
to
>>> reproduce the segfault.
>>>=20
>>> This crash only occurs if a tdb file exists in the persistent dir. =
If no
>>> tdb files are present then ctdb starts up.
>>>=20
>>> When ctdb starts up with pre-existing tdb files it creates a pipe =
and
>>> forks off a child "lock_helper" process, and then uses tevent to add =
a
>>> handler function "ctdb_lock_handler". In my case this function
>>> "ctdb_lock_handler" gets called twice. Once when the child process =
writes
>>> a null byte to the pipe. But it gets called again when epoll returns =
with
>>> an EPOLLHUP type. Despite this not being a true read the same =
callback is
>>> called. However, the first time the callback is called it NULLs out
>>> lock_ctx->request. When the function is called the 2nd time it
>>> dereferences the null lock_ctx->request.
>>>=20
>>>=20
>>> I've reproduced this issue using packages from Fedora 33 as well as =
Fedora
>>> 34. I skimmed the commits and didn't see anything that might fix =
this in
>>> newer samba but if you feel it's still worth trying a more recent =
build,
>>> let me know.
>>>=20
>>>=20
>>> What puzzles me is why don't normal CTDB configurations hit this =
error. I
>>> suppose that in some cases the pipe's fd could be getting removed =
from
>>> tevent before EPOLLHUP is returned. To me, that implies a possible =
race.
>>> As an additional experiment I found that setting a breakpoint in gdb
>>> right after 'send_result' was run to completion, if I waited a =
second or
>>> two to resume the lock helper process it did not hit the segfault. =
This
>>> deepened my suspicion this might be a race condition. But it's one =
that
>>> only seems to surface when run within a container.
>>>=20
>>>=20
>>> In summary, if those on the samba team who are familiar with CTDB =
(or
>>> tevent) can think on this a little and offer any thoughts or =
suggestions
>>> on things I could try, I'd greatly appreciate it. I don't assume a =
lot of
>>> container experience and am happy to answer questions about the
>>> peculiarity there. Perhaps a simple question might reveal something =
we've
>>> overlooked so far. In a worst case scenario I suppose I could also
>>> propose a patch that has `if (lock_ctx->request =3D=3D NULL) =
return;` added
>>> to
>>> `process_callbacks`, but I'm concerned that might be papering over a =
real
>>> problem.
>>> So here I am.
>>>=20
>>> Thanks for your time!
>>>=20
>>>=20
>>> --
>>> --John M.
>=20
>=20
>=20
>=20
>=20



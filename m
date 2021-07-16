Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2143CB0D4
	for <lists+samba-technical@lfdr.de>; Fri, 16 Jul 2021 04:45:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=0d9sSB6065Hpi4xVJKn2MwH50UVNM982tlA1uqWQ4Ws=; b=X+960xJ8X785gUFHVh8C+Ox/x1
	SQyzBYfbVBpko9EWM+d74iG5dpMqlKc9Oliv2oxD745chGksapAFLOgtDbgtrl8ucBaVxgNwt4zZc
	aaHcR87rdqfYbu0zIohCIBrdZUEHrJov1ilVrgOveC6x55URV9AAUrYHZZR7P9NeHQhsKVomqdYAW
	E1ojqADqGut9QadKOVYJABvBwEctpRJpXkCDCNQS82NqmjwdHXqyOwdWIStNmtQu4QDCoGElbam/O
	Qu7TBtwUvQVlXggacRTscnll6/GABKCyJXQ0eue87JcPirTx2pCVbUAmMXELXVa+4XAHF1MScxyE+
	yOuzafEg==;
Received: from ip6-localhost ([::1]:32842 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m4Dpb-00DuGJ-OQ; Fri, 16 Jul 2021 02:44:03 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:46048) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m4DpT-00DuGA-AP
 for samba-technical@lists.samba.org; Fri, 16 Jul 2021 02:43:57 +0000
Received: by mail-pl1-x62c.google.com with SMTP id p17so4569420plf.12
 for <samba-technical@lists.samba.org>; Thu, 15 Jul 2021 19:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0d9sSB6065Hpi4xVJKn2MwH50UVNM982tlA1uqWQ4Ws=;
 b=kBDem8qSEvI7gh51HWls4Xu+V+X8i/Oz64bu1/Qrz3TIJ0iUaz8A4vFq4pTlCE+C+d
 kvPboheMM/cbtAFYMIex8uJUBxdiPQeB1BpKYGwYmLK9ncekBLJmvjxGmI+H2s7EekMT
 m02isVDrBVk0ul9paO8o7EqDl0qAN8xzMGTFjpIL30mWZ5HjSfmEtGOqkGR9vc7x6L42
 iyVvqWg7mAU/M3+tIMsc92Rfn6Kn8GgrYIC23aSetuRNN9Ndu0Xa34DXY44pasWA72w5
 iARzIFgPXdufY5ZmJA2SV2KIEhdqkb8upYgI6TbCSsJPpaBrvQTvOAdt18p0OQ5HlZC1
 f0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0d9sSB6065Hpi4xVJKn2MwH50UVNM982tlA1uqWQ4Ws=;
 b=pL98Ld0B4z/ztzeYZLLZdFZOO3aPt/tHDW6yn4bX/RCLdDMm0GWU5boiSif31/yMxG
 q0I/l2Q45apMQpxMAWH9quCbR4rr1SmkK5iAzqVMIyrZa63vo6hQs24N4og7gbB41m0J
 NGckqvvUUDq/9WWAukhLzLJLnd3qI7bXnirR1pdCgi3qhIgtv6IatR5P68WbTgZOyOC5
 +2WIOup2MA9mb5/D+6/7GUMzgab+pPjopMbx0i4IzuiCh7eljkVoCiuCda2DrXUuapOq
 L58uf95Z2V7QeTcGyGi60gcSd1S20+kWKlSIEwq36RUGKaticMsHsrtGQbLHzEHpWR20
 ivaA==
X-Gm-Message-State: AOAM532NuPEFCrOF0e923ziP+D5RS5EhCd0igqFJwE+oRnzPRj7vy+5q
 pWF9v3/AZ+q5Kv7USTpcHaBkdVmJmL/l9WPbrT4=
X-Google-Smtp-Source: ABdhPJw8bn4FyjPm7m2vySGDaBRmUWIZspX0id4mqoYFzj9eaz8HgR+cNWd53Ex2j+Ll16dDSFfyHSXk+N+epQ7HGgk=
X-Received: by 2002:a17:902:f282:b029:12b:2b93:fbdd with SMTP id
 k2-20020a170902f282b029012b2b93fbddmr5951067plc.35.1626403431781; Thu, 15 Jul
 2021 19:43:51 -0700 (PDT)
MIME-Version: 1.0
References: <2450252.vFx2qVVIhK@edfu>
 <CAJ+X7mSHG_OUyNF2EiuvEtCQYJ4vOEH67kW0+1rOsLNp4BqaaQ@mail.gmail.com>
 <CAJ+X7mTSNvN=6v0-WSz_89Gjkg5rCf-AmDcVLo=LLmOhSWkyMw@mail.gmail.com>
 <2917630.lGaqSPkdTl@edfu> <2D9E704E-CBB4-4F27-94DD-5AFF80EE9482@samba.org>
In-Reply-To: <2D9E704E-CBB4-4F27-94DD-5AFF80EE9482@samba.org>
Date: Fri, 16 Jul 2021 12:43:40 +1000
Message-ID: <CAJ+X7mS8WZnsimhonxEBjrwCjj8X=3Cmq=-tc1Xuv+0htoLk9A@mail.gmail.com>
Subject: Re: CTDB Segfault in a container-based env - Looking for pointers
To: Michael Adam <obnox@samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Amitay Isaacs via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amitay Isaacs <amitay@gmail.com>
Cc: John Mulligan <phlogistonjohn@asynchrono.us>,
 Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Jul 16, 2021 at 2:13 AM Michael Adam via samba-technical
<samba-technical@lists.samba.org> wrote:
>
>
>
> > On 15. Jul 2021, at 15:16, John Mulligan via samba-technical <samba-tec=
hnical@lists.samba.org> wrote:
> >
> > On Wednesday, July 14, 2021 10:12:46 PM EDT Amitay Isaacs via samba-tec=
hnical
> > wrote:
> >> Hi John,
> >>
> >> There are certain assumptions made in CTDB assuming it's running on a
> >> normal system. When running CTDB in a container, those assumptions are
> >> not valid any more and you might get unexpected behaviour.
> >>
> >
> > First, thanks for replying!
> >
> > Sure, I fully expect that. It was similar for smbd/winbind but in those=
 cases
> > I was able to tune the environment sufficiently - for example they need=
 to run
> > within the same pid namespace to function properly. The issue I'm havin=
g now
> > is that the segfault isn't mapping to anything obvious (yet) that I can=
 change
> > in the environment.
> >
> >> One such assumption is that init (in some form) has the pid of 1 and
> >> CTDB daemon will never have PID of 1.  Obviously this is not true in
> >> your case.  From the logs you can see that the CTDB daemon is started
> >> as PID 1. In general, CTDB relies on init (in some form) to start/stop
> >> various file services (smb, nfs, etc.) via the event scripts.  So,
> >> working init is a requirement for normal operation of CTDB.
> >
> > Good point. I'll experiment with giving ctdb a parent process.
>
> Right, if we want to avoid systemd or other beefier systems that are not =
made for containers, we can consider =E2=80=9Ctini=E2=80=9D: E.g. rook is u=
sing this.
>
> >> What are you trying to do exactly?  You cannot put CTDB in a container
> >> on its own without Samba daemons.
>
> Hmm, at least last I checked you can even run ctdb in a =E2=80=9Ctraditio=
nal=E2=80=9D non-containerized cluster without any samba daemons. :-)

Of course you can.  But that doesn't serve any useful purpose. :-)

> Maybe you are saying that if you want to run smbd/winbindd on top of ctdb=
, then they must run in the same container? I don=E2=80=99t think this is t=
rue either:
>
> We usually have multiple containers in one pod, and the containers within=
 the pod can communicate just as normal. At least that=E2=80=99s what we di=
d with the smbd and windbindd daemons: separate containers in one pod.
>

My understanding of containers is limited here, so I don't understand
how you can run ctdb and smbd in different containers.  Does mutex
locking on shared databases work across containers (or different
namespaces)?  How about unix datagram messaging using pids?
If mutex locking on shared databases works across containers, then
obviously you can run ctdb and smbd in different containers.
If unix datagram messaging works across containers, then obviously you
can run smbd and winbindd in different containers.

> > I'm not clear on what you mean by that. My longer term goal is to inves=
tigate
> > CTDB as part of the HA story for samba in containers (see our general e=
ffort
> > here [1]). Short term, I just want to run ctdb on its own with very few=
 (or
> > none) event scripts just to get tdb replication working across multiple=
 nodes
> > in a container based environment. Based on my reading of the docs and a=
 tiny
> > bit of the code, bringing up smbd/etc is the responsibility of the even=
t
> > scripts
>
> This is not quite true:
>
> Ctdb logically consists of two layers:
>
> (1) the mandatory core is the distributed tab database and messaging chan=
nel for smbd
> (2) the optional upper layer is about resource management (public IPs, se=
rvices like smbd, winbindd, etc)
>
> Ctdb and samba can run together perfectly without #2 as long as someone t=
akes care of the service management. E.g it has been done with pacemaker. I=
n our case, Kubernetes / operators, etc, would provide this role and we wou=
ld run ctdb without =E2=80=9CCTDB_MANAGES_SAMBA=3Dyes=E2=80=9D etc...
>
> > so I think it should be possible to run ctdb on its own like that.
> >
> > Any thoughts on adding code to specifically handle the case where the c=
allback
> > has already been called, but tevent calls it again?
>
> Right the crux here seems to be the question whether the tevent-using cod=
e in ctdb is not prepared for the situation that EPOLLHUP is issued, and if=
  it would be appropriate to just catch that condition (of being called aga=
in).

Well that's not really the crux here.  I know what the real issue is
(I did write that code), but I still don't understand the motivation
behind running ctdb and smbd in different containers.

>
> But it is of course good and correct to weed out any higher level config =
issues before diving into this.
>
> Cheers - Michael
>
> >

Amitay.


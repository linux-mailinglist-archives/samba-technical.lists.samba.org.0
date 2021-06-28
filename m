Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA903B6AEC
	for <lists+samba-technical@lfdr.de>; Tue, 29 Jun 2021 00:18:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=QThlPC5yyfPivbr7LJDizTlLh4na63SMg4E0NsyMhNI=; b=dRZI5/Qw7UHCXQFAH8bbTds+/F
	82StNgxwKQO8veCx89mOTRnW5L8DzG15vOnEQd3q3Ded/KEFwONIJSEgEk4jNBgSOZFUT4bN6SWtr
	spPvgQmTyNjNIill5WgTrvZRiO27J+PHFl2v47qNiiLM2l1bkJr9Us7Obit86ng7My6nvayWKT7sz
	8vUO4/KxE68GSNyAe74Aht9r9oHMv6Tf+rLrmTlvird1t0IM9HzCMNpLkxyiAoItGKUdPakNr+1Md
	mhZ5xDczPQN65YW2LGKkSTbixpFItR9a/EHzBRFRTEIUNWd9PnaUBYVAYuMRRsZZwLo2axDFuRV68
	nzhvj48w==;
Received: from ip6-localhost ([::1]:25354 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lxzZZ-008ovT-EC; Mon, 28 Jun 2021 22:17:45 +0000
Received: from [104.200.28.160] (port=45900 helo=dup2.asynchrono.us) 
 by hr1.samba.org with esmtp (Exim) id 1lxzZT-008ovI-Fs
 for samba-technical@lists.samba.org; Mon, 28 Jun 2021 22:17:42 +0000
Received: from edfu.localnet (c-73-114-31-46.hsd1.ma.comcast.net
 [73.114.31.46])
 by dup2.asynchrono.us (Postfix) with ESMTPSA id 8141A1161;
 Mon, 28 Jun 2021 22:17:34 +0000 (UTC)
To: Abhidnya Joshi <abhidnyachirmule@gmail.com>,
 samba-technical@lists.samba.org
Subject: Re: Implementing Samba in Containers
Date: Mon, 28 Jun 2021 18:17:33 -0400
Message-ID: <8152977.OV4Wx5bFTl@edfu>
In-Reply-To: <CALmqtCWLgc6ePq0p2kO0aOe3P8=a-e_ScLd6nN5Rj8V9=j8rEA@mail.gmail.com>
References: <5826213.lGaqSPkdTl@edfu>
 <CALmqtCWLgc6ePq0p2kO0aOe3P8=a-e_ScLd6nN5Rj8V9=j8rEA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

On Monday, June 28, 2021 4:41:13 AM EDT Abhidnya Joshi wrote:
> Hi John,
> 
> This is very interesting stuff! I would be interested to know, as part of
> this:
> 1. Any goal to reduce /limit resource consumption done by Samba file
> server, e.g. open file limits, max memory used, etc

I think that would be up to the container runtime or orchestration system. 
That said I'd be open to hearing more feedback about this. It's not something 
I've looked into much as of yet.

> 2. Is there any reduced functionality due to Samba running in a container?

There are a few gotchas that I've found but nothing insurmountable. As noted 
in the linked thread, the container needs CAP_SYS_ADMIN (aka a privileged 
container) if you want to use the acl xattr vfs module. I also found that to 
use winbind for active directory users the containers must share the pid 
namespace. I collect most of the issues I've found at the issues of the 
project on github.

> 3. Is the idea here also to make winbind available as a separate
> container in order to support only authentication related stuff?
> 

When I run winbind in our k8s based approach, it is running in a separate 
container from smbd (see the namespace caveat above). I could imagine that the 
container running winbind could be used for other purposes as well -  the 
trick would be making sure the sockets, files, and dbs that are needed to be 
shared outside the container are available. 

Note that above, I'm talking about the running container. We build one image 
for the file server stuff.

> Thanks and Regards
> Abhidnya Joshi


Thank you!

PS. I'm re-adding the list to the To: line. I hope you don't mind.

> 
> On Mon, Jun 28, 2021 at 5:11 AM John Mulligan via samba-technical
> 
> <samba-technical@lists.samba.org> wrote:
> > Hi List,
> > 
> > I wanted to follow up on something that I learned from a thread on the
> > user's list [1] recently.  Specifically, that I'm not the only one
> > working on "containerizing" samba components.  Some readers may be aware
> > of my container efforts if you attended our talk at sambaxp, or saw the
> > recording [2]. While we focused quite a bit on the Kubernetes parts there
> > I want to skip over Kubernetes in this mail and focus on the (OCI)
> > container images.
> > 
> > Michael Adam started a project [3] to build container images for Samba. We
> > publish our images on quay.io [4]. I have
> > been involved there for a little under a year now. We mainly have been
> > focused on our immediate needs but I wanted to reach out and see who may
> > be interested in collaborating on containerizing Samba.
> > 
> > In the samba-containers project we have three images that are built:
> > * A file server image
> > * A client image (smbclient)
> > * An AD DC image
> > 
> > The file server is my main focus for our Kubernetes efforts. The other two
> > images we are generally using only for test and are currently very
> > simplistic. But I'd like to see all the images become generally useful,
> > so that's why I'm writing this - to seek out any parties in the wider
> > Samba community who may be interesting collaborating on this effort - or
> > even just discussing containerization of Samba.  I would also like to
> > re-emphasize that despite the name of the Org in the project url, none of
> > it is meant to be Kubernetes specific. I'd personally be thrilled to see
> > it get used in other contexts, with other orchestration systems,
> > docker-compose, or direct docker & podman. More eyes on the project from
> > others who aren't focused on k8s can help keep us honest. :-)
> > 
> > In conclusion, I'd like to hear from anyone reading this if you're
> > interested in samba in containers, even if you're not so interested in
> > our particular efforts - but especially if you are :-). I'm curious if
> > anyone wants to know more about the nuts-and-bolts of how we're designing
> > the current containers and if you have feedback. In addition, if you are
> > already running samba in containers or have your own images, I'd love to
> > hear about them and any challenges or successes you've had.
> > 
> > Thanks for your time!
> > 
> > 
> > [1] - Thread Parent: https://lists.samba.org/archive/samba/2021-June/
> > 236451.html
> > [2] - https://www.youtube.com/watch?v=mG-Jxaf8_gw
> > [3] - https://github.com/samba-in-kubernetes/samba-container
> > [4] - https://quay.io/samba.org
> > 
> > -- John M.






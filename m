Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFC13B6AF0
	for <lists+samba-technical@lfdr.de>; Tue, 29 Jun 2021 00:22:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=wx4L97/TmplzR4XdmjV/rbbYJWSIvemCJaycO2v/Ka0=; b=qDO5nSGWqyuRZ6w4IfWdg0tDvj
	7OJY/9no9qKAXht2aAOTIN60ZPgza+TaS7Y50SbMVNhbFkx9DHwiFI8zGvj0vnLBT3s7/LFNvUyJt
	Mj/yIvuM5VTiwizeYzglOFylMHDJQkSSFa0o/Ck/f8aCgt9D1orgVSoBGo3WoVEswRWfFOK7iDj8b
	BWNL247g6zBqIkM2RX77EIpgU9BbiNOCMFw6lQtPKzmVhs7cjhl0CG6i8kH3/7u+NdJ9MoQsbotFW
	yGKDNGHrrpq2IcFTzMIGOME/x6hFFKPXE3CtUHzyBD1Vi3/KPWT+0aKvRmtVRNbIIjHPDNP/1+D9D
	zG59DTuA==;
Received: from ip6-localhost ([::1]:26058 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lxzeL-008pDx-GF; Mon, 28 Jun 2021 22:22:41 +0000
Received: from [104.200.28.160] (port=45904 helo=dup2.asynchrono.us) 
 by hr1.samba.org with esmtp (Exim) id 1lxzeG-008pDo-Su
 for samba-technical@lists.samba.org; Mon, 28 Jun 2021 22:22:39 +0000
Received: from edfu.localnet (c-73-114-31-46.hsd1.ma.comcast.net
 [73.114.31.46])
 by dup2.asynchrono.us (Postfix) with ESMTPSA id 36E431161;
 Mon, 28 Jun 2021 22:22:34 +0000 (UTC)
To: samba-technical@lists.samba.org
Subject: Re: Implementing Samba in Containers
Date: Mon, 28 Jun 2021 18:22:33 -0400
Message-ID: <5915047.XAFRqVoOGU@edfu>
In-Reply-To: <d42dc27e-41d6-a63c-0079-f6bf7c0947f9@basealt.ru>
References: <5826213.lGaqSPkdTl@edfu>
 <d42dc27e-41d6-a63c-0079-f6bf7c0947f9@basealt.ru>
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
Cc: Igor Chudov <nir@basealt.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Monday, June 28, 2021 9:17:22 AM EDT Igor Chudov via samba-technical wrote:
> Hi!
> 
> At BaseALT we're interested in running Samba in containers for testing
> purposes but mostly locally, in Docker or Podman, not in Kubernetes. We
> will be glad to join the project but I'm not sure how we can help.
> 

That's great to hear! Personally, I'd love it if a few more people simply want 
to "kick the tires" - try out the builds, read the docs, and give any and all 
feedback that comes to mind. :-)


> Have you any experience in running Samba containers orchestrated by
> OpenNebula?

Nope, this is the first I'm hearing of it. I'll read up some more about it. If 
it supports running OCI containers in a manner similar to docker I think it 
could work.

> 
> On 28.06.2021 3:20, John Mulligan via samba-technical wrote:
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






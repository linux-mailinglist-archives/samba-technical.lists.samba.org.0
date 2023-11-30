Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6127FF883
	for <lists+samba-technical@lfdr.de>; Thu, 30 Nov 2023 18:40:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=vxeOS7ahxqlVBXgM8U0X8If5HNDM6lCy50RTwo4xKVY=; b=AN+WY370/YvMzQenWczePLqkw3
	tcj2Us35Kec2fIEILOyNegGEyEfOBvYSWADLcactWKiaMqHEGqt4IY+U7KOYl/oMwAh7px1l3IckM
	xezf1yP7Yv/DKcIsJVHcJ9Kk0oATM/Ow63gEY7wHXM/MUs/YN85wCKPtzY0UOnQZ8XURjIDcJ0k9X
	tCt3Gy14EtO07f6iD6Irt6IGbiBju6Hg3vc5v5qMsIFP1xdxyH5EzsOIXALG/CwRqe64qumVx+39Q
	506tPNA4n4d4nxWtu+AGIU4EA3c+wt55yZgTMX1yi1hNnkdcolATefHoYRCJmBbwxtmwk9r/9cBmL
	SJU0eTfQ==;
Received: from ip6-localhost ([::1]:36606 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r8l1Q-001kmF-VP; Thu, 30 Nov 2023 17:40:21 +0000
Received: from [104.200.28.160] (port=45142 helo=dup2.asynchrono.us) 
 by hr1.samba.org with esmtp (Exim) id 1r8l1F-001km5-KX
 for samba-technical@lists.samba.org; Thu, 30 Nov 2023 17:40:13 +0000
Received: from li-241d88cc-27c5-11b2-a85c-c640472b3c85.ibm.com
 (c-73-114-43-44.hsd1.ma.comcast.net [73.114.43.44])
 by dup2.asynchrono.us (Postfix) with ESMTPSA id 5AE721146;
 Thu, 30 Nov 2023 17:40:06 +0000 (UTC)
To: samba-technical@lists.samba.org
Subject: Re: Samba in Kubernetes (and Containers) - Release v0.4
Date: Thu, 30 Nov 2023 12:40:05 -0500
Message-ID: <3190298.irdbgypaU6@li-241d88cc-27c5-11b2-a85c-c640472b3c85.ibm.com>
In-Reply-To: <95f29b05-f994-464f-9b2d-639c78eed650@samba.org>
References: <5903408.31r3eYUQgx@li-241d88cc-27c5-11b2-a85c-c640472b3c85.ibm.com>
 <95f29b05-f994-464f-9b2d-639c78eed650@samba.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thursday, November 30, 2023 11:51:28 AM EST Ralph Boehme via samba-
technical wrote:
> Hi John,
> 
> thanks to you and anyone else working on this!
> 
> Any highlights of what's new in 0.4?

I probably should have copied some of them into the email. The features are 
mostly in sambacc (which is the tool the drives the startup/automation of 
samba-container server images).
We added 
* Support for custom global options in AD DC configurations
* Preliminary support for configurations fetched via HTTP/HTTPS or Ceph RADOS

The samba-container release takes the new sambacc as well as newer samba 
versions.

The samba-operator build includes a newer version of Go and is updated to make 
use of the new samba-operator build. It also gets a fixed version of the 
'kustomize' configuration files for deployment on kubernetes.


Thank you for asking!


> 
> 
> On 11/30/23 16:03, John Mulligan via samba-technical wrote:
> 
> > The team behind the "Samba in Kubernetes" organization is happy to
> > announce
 our third batch of releases. Release v0.4 includes both
> > features and fixes across three of our five publicly-consumable projects.
> > These are the samba- operator, samba-container, and sambacc projects.
> > These releases are part of our plan to make releases twice a year, or
> > approximately every 6 months. 
> > Our little organization may be called "Samba in Kubernetes" but the
> > projects
 go beyond just Kubernetes. The images built using the
> > samba-container project are standard OCI container images, so they can
> > work just as well on Docker or Podman as on Kubernetes or another
> > compatible container orchestration system. The smbmetrics project can
> > export Samba metrics as a Prometheus
> > endpoint even if you don't have a container in sight.
> > 
> > As previously mentioned, this is a batch of related projects. URLs for
> > each
 new release are available below:
> > 
> > * https://github.com/samba-in-kubernetes/samba-operator/releases/tag/v0.4
> > *
> > https://github.com/samba-in-kubernetes/samba-container/releases/tag/v0.4
> > * https://github.com/samba-in-kubernetes/sambacc/releases/tag/v0.4
> > 
> > Other projects in our organization either had no changes since the last
> > release or are not ready/intended for wide consumption.
> > 
> > We'd love to hear your feedback. We have the github discussions
> > (web-forum
> > style) feature enabled on many of the repos. We also routinely read the
> > samba
 project mailing lists, so feel free to reply here as well.
> > 
> > 
> > Thank you for your time.
> > 
> > 
> > 
> > 
> 
> 






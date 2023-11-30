Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B07C47FF37C
	for <lists+samba-technical@lfdr.de>; Thu, 30 Nov 2023 16:22:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=jCmdwRH6o5owCx+nq5kgNbkwu2QbA9BPu+BV1dYkstk=; b=PH2q9yTmxcTIjwJLVJKiAvsJy7
	ztnsrf4dY751+xT1+tNaTdohvLZ8nn6aRAKJyhrFboGUbh/XH714mYH3fJsMuXUKTZSk9aDHytGoy
	Ga/V7Od2oStbxC1U4HhtpvnhtMkop/r4QgjCwJ2sBgyXBP6KIrlkfh0AwbxrkwlZh47/8kknEjd9N
	Y1RFKZNSbI1ny+eaOLV12DDhjl13HCBfrrt/h0RnvgAi+patFDWpzwQm8AvZfO8PHxUa7EBhZZtYe
	FnhZH9Dp3iMVlcv5wvmDO3+xyI66fzfl3fDPj4JfaUWgcWAdkhdJ7iD5bAlcQgeiavouCIR5UZqUj
	rS2JJWyA==;
Received: from ip6-localhost ([::1]:34268 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r8irn-001hNU-Pw; Thu, 30 Nov 2023 15:22:15 +0000
Received: from [104.200.28.160] (port=45140 helo=dup2.asynchrono.us) 
 by hr1.samba.org with esmtp (Exim)
 id 1r8iri-001hL4-7v; Thu, 30 Nov 2023 15:22:13 +0000
Received: from li-241d88cc-27c5-11b2-a85c-c640472b3c85.ibm.com
 (c-73-114-43-44.hsd1.ma.comcast.net [73.114.43.44])
 by dup2.asynchrono.us (Postfix) with ESMTPSA id DAD871146;
 Thu, 30 Nov 2023 15:03:48 +0000 (UTC)
To: samba-technical@lists.samba.org, samba@lists.samba.org
Subject: Samba in Kubernetes (and Containers) - Release v0.4
Date: Thu, 30 Nov 2023 10:03:48 -0500
Message-ID: <5903408.31r3eYUQgx@li-241d88cc-27c5-11b2-a85c-c640472b3c85.ibm.com>
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

The team behind the "Samba in Kubernetes" organization is happy to announce 
our third batch of releases. Release v0.4 includes both features and fixes 
across three of our five publicly-consumable projects. These are the samba-
operator, samba-container, and sambacc projects. These releases are part of 
our plan to make releases twice a year, or approximately every 6 months.

Our little organization may be called "Samba in Kubernetes" but the projects 
go beyond just Kubernetes. The images built using the samba-container project 
are standard OCI container images, so they can work just as well on Docker or 
Podman as on Kubernetes or another compatible container orchestration system. 
The smbmetrics project can export Samba metrics as a Prometheus 
endpoint even if you don't have a container in sight.

As previously mentioned, this is a batch of related projects. URLs for each 
new release are available below:

* https://github.com/samba-in-kubernetes/samba-operator/releases/tag/v0.4
* https://github.com/samba-in-kubernetes/samba-container/releases/tag/v0.4
* https://github.com/samba-in-kubernetes/sambacc/releases/tag/v0.4

Other projects in our organization either had no changes since the last 
release or are not ready/intended for wide consumption.

We'd love to hear your feedback. We have the github discussions (web-forum 
style) feature enabled on many of the repos. We also routinely read the samba 
project mailing lists, so feel free to reply here as well.


Thank you for your time.





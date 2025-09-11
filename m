Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 48721B53F01
	for <lists+samba-technical@lfdr.de>; Fri, 12 Sep 2025 01:14:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=rbsEEvA4bZ+RW6DnyZMamBAgFxHA0hUvKFfz0jQ1ap8=; b=t8zT2aCFk4pikJbpMjc2fYFHON
	uS4ZlsC8HWHi7UkhCATRxw1LS+U4zLwyXTIYuQ6KWcZSTv0nRC/nLCujU51hXzPA9YOcL4Fy02Gw4
	+ULVuQ0kqtRa4FltA2HDnIdrGTZnGICrT/4R/qRaIvtMM49mPytAtqAO7llhFcIymvKUJXUnBJNwb
	hNJ65k05qVvdIgXzWzUxk/OQit+P+MqnugU3EXMd9Sw9JaGT4QQxL7SRw4KyFcnZeWiEJ71VnY9Ab
	DCHmG8VYZC9JTcmDuyBxFp+3XrwCXtfBKvXRiieHnhEVrhfG+JjjHi1bh8y+0EDmCsTLSjJns9KGa
	cHceGEOw==;
Received: from ip6-localhost ([::1]:63236 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uwqUh-003aDh-Dn; Thu, 11 Sep 2025 23:14:23 +0000
Received: from li777-160.members.linode.com ([104.200.28.160]:56816
 helo=dup2.asynchrono.us) by hr1.samba.org with esmtp (Exim)
 id 1uwqUd-003aDY-Nm; Thu, 11 Sep 2025 23:14:22 +0000
Received: from edfu.localnet (c-73-186-160-43.hsd1.ma.comcast.net
 [73.186.160.43])
 by dup2.asynchrono.us (Postfix) with ESMTPSA id 217FE150D;
 Thu, 11 Sep 2025 22:54:53 +0000 (UTC)
To: samba-technical@lists.samba.org, samba@lists.samba.org
Subject: Samba in Kubernetes / Containers - Release v0.7
Date: Thu, 11 Sep 2025 18:54:52 -0400
Message-ID: <7112930.vXUDI8C0e8@edfu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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
our third batch of releases. Release v0.7  includes both features and fixes 
across three of our five publicly-consumable projects. These are the samba-
container smbmetrics, and sambacc projects. These releases were unfortunately 
delayed, but we finally managed to get them done.

Our little organization may be called "Samba in Kubernetes" but the projects 
go beyond just Kubernetes. The images built using the samba-container project 
are standard OCI container images, so they can work just as well on Docker or 
Podman as on Kubernetes or another compatible container orchestration system. 
The smbmetrics project can export Samba metrics as a Prometheus 
endpoint even if you don't have a container in sight.  In fact, our continued 
focus during this cycle was integrating with the Ceph project and using 
container images produced by the samba-container project within Ceph 
orchestration.

As previously mentioned, this is a batch of related projects. URLs for each 
new release are available below:

* https://github.com/samba-in-kubernetes/samba-container/releases/tag/v0.7
* https://github.com/samba-in-kubernetes/smbmetrics/releases/tag/v0.7
* https://github.com/samba-in-kubernetes/sambacc/releases/tag/v0.7


Making these releases was a group effort and I'm pleased to thank everyone who 
helped make these releases happen!

Other projects in our organization either had little-to-no changes since the 
last release or are not ready/intended for wide consumption.

We'd love to hear your feedback. We have the github discussions (web-forum 
style) feature enabled on many of the repos. We also routinely read the Samba 
project mailing lists, so feel free to reply here as well.


Thank you for your time.









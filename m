Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D76742AF8
	for <lists+samba-technical@lfdr.de>; Thu, 29 Jun 2023 19:00:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=A1O2fI7mdgWjmfI3/6/MGymsq9lWTb8GmUvXzhoKHoY=; b=EeVO4DBYiqA++OCkOPV4SriO/q
	rzebaSas0R512N/EzL+uYisWzz7V3c1KgZ0aNJlV0j5VSoEkUsrQUYEREbL6ksf9ixrFBVeVU/WcB
	LrGruEklunaDSagWOzkRCqdTd2wL9tDIA0E3A6FsiEZwpulasgVpc5tUTnxTXHK4lfApORI5I5r4z
	6DnDtvxXJrwaWXcvF8jFqKCQ0zpbd4x5IRek0SZi5Cu1lqeU+J/95npm8XGcbZH+xusc+dg8t0PCF
	8+b7xYz2sGjonYGIeqKvFxLGlswo1vkRDDOz7Z+mnSgnc6im2xc08uWREhYKLdM/IXMtVRdlNRJUw
	d5uOP5vQ==;
Received: from ip6-localhost ([::1]:47082 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qEv0B-005GU0-EN; Thu, 29 Jun 2023 17:00:15 +0000
Received: from [104.200.28.160] (port=45130 helo=dup2.asynchrono.us) 
 by hr1.samba.org with esmtp (Exim)
 id 1qEv00-005GTo-QF; Thu, 29 Jun 2023 17:00:07 +0000
Received: from li-241d88cc-27c5-11b2-a85c-c640472b3c85.ibm.com
 (c-73-114-43-44.hsd1.ma.comcast.net [73.114.43.44])
 by dup2.asynchrono.us (Postfix) with ESMTPSA id 4CB611172;
 Thu, 29 Jun 2023 16:41:19 +0000 (UTC)
To: samba-technical@lists.samba.org, samba@lists.samba.org
Subject: Samba in Kubernetes (and Containers) - Release v0.3
Date: Thu, 29 Jun 2023 12:41:18 -0400
Message-ID: <13593130.uLZWGnKmhe@li-241d88cc-27c5-11b2-a85c-c640472b3c85.ibm.com>
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

The team behind the "Samba in Kubernetes" project is happy to announce our 
second batch of releases. Release v0.3 includes both features and fixes across 
our set of five release-ready repositories. These are the samba-operator, 
samba-container, smbmetrics, svcwatch, and sambacc projects.

Our little organization may be called "Samba in Kubernetes" but the projects 
go beyond just Kubernetes. The images built using the samba-container project 
are standard OCI container images, so they can work just as well on Docker or 
Podman as on Kubernetes or another compatible container orchestration system. 
[1] The smbmetrics project can export Samba metrics as a Prometheus 
endpoint even if you don't have a container in sight.

As previously mentioned, this is a batch of related projects. URLs for each 
project's release are available below:

* https://github.com/samba-in-kubernetes/samba-operator/releases/tag/v0.3
* https://github.com/samba-in-kubernetes/samba-container/releases/tag/v0.3
* https://github.com/samba-in-kubernetes/smbmetrics/releases/tag/v0.3
* https://github.com/samba-in-kubernetes/svcwatch/releases/tag/v0.3
* https://github.com/samba-in-kubernetes/sambacc/releases/tag/v0.3


Starting with this release we plan on adhering to a more regular release 
cadence. We intend to make use of a six-month schedule. So look for the next 
release in near the fall/winter of 2023!


We'd love to hear your feedback. We have the github discussions (web-forum 
style) feature enabled on many of the repos. We also routinely read the samba 
project mailing lists, so feel free to reply here as well.


Thank you for your time.

[1] - A topic for which I created demos to be shown at this year's sambaXP. 
See: https://github.com/samba-in-kubernetes/samba-container/discussions/129  
and https://github.com/samba-in-kubernetes/samba-container/discussions/130  
for more details




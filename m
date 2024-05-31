Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB538D68AD
	for <lists+samba-technical@lfdr.de>; Fri, 31 May 2024 20:05:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=PRGdzcKN/IgrykqfY4nF3gXC38fW0IvkyUND/o68JBI=; b=rMrtLVm8zF4xQ8OwgTiCE6tSbc
	6pRg09BnuLRJOUj4LNEN302zb585R5ghWW5dlbz43TPnhRRh+/Tnws/KAp/96vEl0bQT3q6VkUjOg
	PSidMnUaIC3nVvy7RFT1cinzIfPkCpI6h/8LWXosSDQAXoL6C3E9Ba/nXdWlSeaUGKz0FF/Zk97dh
	ADYKqvw2qz3iS4HmXEASFrdAqvp/r0oj7LTulxc2szBqW9O/MboAwHPaJkezQXO1/g11Qqxkc3y13
	GX46Wb6ps8WOfgLHh9LEqO/v/gIhdWmQRbS0F6wFeyL7Mr+ddk62vl9vki2XPjSfjxguj9zHZn8hb
	rwv5rqMg==;
Received: from ip6-localhost ([::1]:63282 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sD6cv-00ARrw-Qp; Fri, 31 May 2024 18:05:18 +0000
Received: from li777-160.members.linode.com ([104.200.28.160]:45158
 helo=dup2.asynchrono.us) by hr1.samba.org with esmtp (Exim)
 id 1sD6cm-00ARre-84; Fri, 31 May 2024 18:05:11 +0000
Received: from li-241d88cc-27c5-11b2-a85c-c640472b3c85.ibm.com
 (c-73-114-43-44.hsd1.ma.comcast.net [73.114.43.44])
 by dup2.asynchrono.us (Postfix) with ESMTPSA id B6B9E1169;
 Fri, 31 May 2024 17:46:28 +0000 (UTC)
To: samba-technical@lists.samba.org, samba@lists.samba.org
Subject: Samba in Kubernetes / Containers - Release v0.5
Date: Fri, 31 May 2024 13:46:28 -0400
Message-ID: <2792223.ElGaqSPkdT@li-241d88cc-27c5-11b2-a85c-c640472b3c85.ibm.com>
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
our third batch of releases. Release v0.5  includes both features and fixes 
across four of our five publicly-consumable projects. These are the samba-
operator, smbmetrics, samba-container, and sambacc projects. These releases 
are part of our plan to make releases twice a year, or approximately every 6 
months.

Our little organization may be called "Samba in Kubernetes" but the projects 
go beyond just Kubernetes. The images built using the samba-container project 
are standard OCI container images, so they can work just as well on Docker or 
Podman as on Kubernetes or another compatible container orchestration system. 
The smbmetrics project can export Samba metrics as a Prometheus 
endpoint even if you don't have a container in sight.

As previously mentioned, this is a batch of related projects. URLs for each 
new release are available below:

* https://github.com/samba-in-kubernetes/samba-operator/releases/tag/v0.5
* https://github.com/samba-in-kubernetes/smbmetrics/releases/tag/v0.5
* https://github.com/samba-in-kubernetes/samba-container/releases/tag/v0.5
* https://github.com/samba-in-kubernetes/sambacc/releases/tag/v0.5

A few select highlights follow:

* [Operator] Use latest samba-server and samba-metrics v0.5 release
* [Operator] Restrict deployments to amd64 nodes
* [smbmetrics] Change to exclusively getting metrics from smbstatus JSON 
output
* [Container] Update base image versions & dependencies
* [sambacc] Improve support for fetching configuration from Ceph RADOS APIs
* [sambacc] Organizational Unit support for AD DC configuration
* [sambacc] Dynamic interface filtering for provisioning AD DC

Other projects in our organization either had no changes since the last 
release or are not ready/intended for wide consumption.

We'd love to hear your feedback. We have the github discussions (web-forum 
style) feature enabled on many of the repos. We also routinely read the samba 
project mailing lists, so feel free to reply here as well.


Thank you for your time.




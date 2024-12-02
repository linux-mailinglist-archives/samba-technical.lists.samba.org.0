Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 520709DFCD0
	for <lists+samba-technical@lfdr.de>; Mon,  2 Dec 2024 10:11:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=IN0GUce2eeYKS+6X2K9+INB1LVo+Aj9EmebEslicnUU=; b=VUrOWa1b25TiUbSv55orfd0hJS
	MzQJ1SePdhVbVhnz6kMuPB89QzjDKE+tl83TTg9p4aFQE+8YvSSYRGDEa3n412/psv7kwvd8DUrv2
	SVqertgzViVyoYlhUo97RAW9iPE3w43kS3mRNj/hAcFdJtHaURZBUBuCFWEmn8GXhkIAawYpKrXke
	JEuRBoSLJ/MuesxlehXGNXUumVrNgzeLimQlvBj7NzmgyQ6LOdasWnvE1YDKkgPUdngt5y/fvWWQV
	wFxkRi7m7XC6udJVO7BDDcAuf9ix7kLP3UTYK7eZ6sk3tCnD0aJExKlYuiPkU83otVMCv3FHT+Sx8
	Lp97iM/w==;
Received: from ip6-localhost ([::1]:22236 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tI2S2-003EYm-1w; Mon, 02 Dec 2024 09:10:42 +0000
Received: from li777-160.members.linode.com ([104.200.28.160]:45164
 helo=dup2.asynchrono.us) by hr1.samba.org with esmtp (Exim)
 id 1tI2Rx-003EYO-Ht; Mon, 02 Dec 2024 09:10:39 +0000
Received: from li-241d88cc-27c5-11b2-a85c-c640472b3c85.ibm.com
 (lfbn-ann-1-383-165.w86-200.abo.wanadoo.fr [86.200.98.165])
 by dup2.asynchrono.us (Postfix) with ESMTPSA id D5FF62BC;
 Mon,  2 Dec 2024 08:54:02 +0000 (UTC)
To: samba-technical@lists.samba.org, samba@lists.samba.org
Subject: Samba in Kubernetes / Containers - Release v0.6
Date: Mon, 02 Dec 2024 03:54:00 -0500
Message-ID: <4965169.OV4Wx5bFTl@li-241d88cc-27c5-11b2-a85c-c640472b3c85.ibm.com>
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
our third batch of releases. Release v0.6  includes both features and fixes 
across four of our five publicly-consumable projects. These are the samba-
operator, smbmetrics, samba-container, and sambacc projects. These releases 
are part of our plan to make releases twice a year, or approximately every 6 
months.

Our little organization may be called "Samba in Kubernetes" but the projects 
go beyond just Kubernetes. The images built using the samba-container project 
are standard OCI container images, so they can work just as well on Docker or 
Podman as on Kubernetes or another compatible container orchestration system. 
The smbmetrics project can export Samba metrics as a Prometheus 
endpoint even if you don't have a container in sight.  In fact, our focus 
during this cycle was integrating with the Ceph project and using container 
images produced by the samba-container project within Ceph orchestration.

As previously mentioned, this is a batch of related projects. URLs for each 
new release are available below:

* https://github.com/samba-in-kubernetes/samba-container/releases/tag/v0.6
* https://github.com/samba-in-kubernetes/samba-operator/releases/tag/v0.6
* https://github.com/samba-in-kubernetes/smbmetrics/releases/tag/v0.6
* https://github.com/samba-in-kubernetes/sambacc/releases/tag/v0.6


Making these releases was a group effort and I'm pleased to thank everyone who 
helped make these releases happen!

Other projects in our organization either had no changes since the last 
release or are not ready/intended for wide consumption.

We'd love to hear your feedback. We have the github discussions (web-forum 
style) feature enabled on many of the repos. We also routinely read the Samba 
project mailing lists, so feel free to reply here as well.


Thank you for your time.








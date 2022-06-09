Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE6D54532F
	for <lists+samba-technical@lfdr.de>; Thu,  9 Jun 2022 19:41:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=lxWtUIUMsjDaw1A1rtFLOj9h2SYOn80PmqRlqdK8MwQ=; b=2RPxsobtVXm6QKipj6bnWNx60y
	nLW1Cc2LqSYVeQJ8DOSpgPl6J4fl7GHLJH32mFQp5oOA5iezmF6pxcn+7b36iDCNnXtwQm68JY3Qj
	dngCUBZ5eyZSRO5BApFXPVHEotGDh55Tmc9vDgY/1YRZOZ9O4ERcDUNVDrBGCTIrsgWZWqypgP4bi
	vF0/ZWpuiOCufWbnFY5VCNwPmT2qWy8n1ez+ZXhEf1mVMR3U3mlEgmy/Ko4c1M7nwyTmiVjBXZ9dO
	z+gapClRb8fRWZuEl5zSBoJJvmrHGMlFXwzLtxim4G/SLsIi96jtelOIKhP5DeSMIaJ1OraZk80K3
	iz8VsNWw==;
Received: from ip6-localhost ([::1]:35876 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nzM9N-008sxv-8t; Thu, 09 Jun 2022 17:40:53 +0000
Received: from [104.200.28.160] (port=45096 helo=dup2.asynchrono.us) 
 by hr1.samba.org with esmtp (Exim)
 id 1nzM9E-008sxj-At; Thu, 09 Jun 2022 17:40:50 +0000
Received: from pretzel.localnet (nat-pool-bos-t.redhat.com [66.187.233.206])
 by dup2.asynchrono.us (Postfix) with ESMTPSA id 3DF651517;
 Thu,  9 Jun 2022 17:40:32 +0000 (UTC)
To: samba-technical@lists.samba.org
Subject: Samba in Kubernetes (and Containers) - Release v0.2
Date: Thu, 09 Jun 2022 13:40:30 -0400
Message-ID: <3245098.9o76ZdvQCi@pretzel>
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
Cc: samba@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

The team behind the "Samba in Kubernetes" project is happy to announce our 
first set of releases. Release v0.2 means we're confident that more people can 
use the samba-operator, the samba-container images, or any of our many other 
projects without having to be a developer deeply involved with these code 
bases.

Our little organization may be called "Samba in Kubernetes" but the projects 
go beyond just Kubernetes too. The samba-container images are standard OCI 
container images, so they can work just as well on Docker or Podman as on 
Kubernetes. The smbmetrics project can export Samba metrics as a Prometheus 
endpoint even if you don't have a container in sight.

As previously mentioned, this is a batch of related projects. URLs for each 
project's release are available below:

* https://github.com/samba-in-kubernetes/samba-operator/releases/tag/v0.2
* https://github.com/samba-in-kubernetes/samba-container/releases/tag/v0.2
* https://github.com/samba-in-kubernetes/smbmetrics/releases/tag/v0.2
* https://github.com/samba-in-kubernetes/svcwatch/releases/tag/v0.2
* https://github.com/samba-in-kubernetes/sambacc/releases/tag/v0.2


We'd love to hear your feedback. We have the github discussions (web-forum 
style) feature enabled on many of the repos. We also routinely read the samba 
project mailing lists.




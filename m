Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1845E48CB70
	for <lists+samba-technical@lfdr.de>; Wed, 12 Jan 2022 20:02:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=vMub7EWCfBMfbU8fJbIuTTIBKzwGI+xV4lRJYtKgTuQ=; b=QjDC/Ao9OOQXopb9C9kn1IrGOa
	BwDbU7myEX0Ltqm6GyQ1ewwJ2x50DEquDaWIhUAC5vzoOQRxtwkyPGtGceojAnV8URC+KuD83z4iM
	/ZMt2wUvRNB0ro3LXuhLNKOwhS/R2rOpec7N8VhouFxL4Ybd9I5ythx4cYl61lODsptDJ4fCIOS+T
	Dg4wncp6PPNh/4KDU5hai8ZSfDa1CJlT0McEG/FPCGKyuQh9QJNKv3I8JPiU+PRY1ILgILIVc0ndi
	txajtENMaU+twxqDm6ftdtBozXlxPigwARkDdhYZ7tOzzvTz08/Zu+Pb0Humtfa4+mU5GTwLubql1
	uedN1pHQ==;
Received: from ip6-localhost ([::1]:28336 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1n7ish-007gnF-Db; Wed, 12 Jan 2022 19:01:59 +0000
Received: from [104.200.28.160] (port=45068 helo=dup2.asynchrono.us) 
 by hr1.samba.org with esmtp (Exim) id 1n7isc-007gn6-5C
 for samba-technical@lists.samba.org; Wed, 12 Jan 2022 19:01:56 +0000
Received: from edfu.localnet (c-73-114-31-46.hsd1.ma.comcast.net
 [73.114.31.46])
 by dup2.asynchrono.us (Postfix) with ESMTPSA id A82DD3CB;
 Wed, 12 Jan 2022 18:42:12 +0000 (UTC)
To: samba-technical@lists.samba.org
Subject: Samba in Containers/Kubernetes Status Update 2
Date: Wed, 12 Jan 2022 13:42:12 -0500
Message-ID: <2815519.vuYhMxLoTh@edfu>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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


Samba in Containers/Kubernetes Status Update vol. 2
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

I had hoped to update the wider Samba community with another status report
in December but I missed that boat. So January will have to do. This message
is part of an ongoing effort to summarize what we've been up to as we
work on integration for Samba in containers and Kubernetes [1].

As a reminder: our focus is to enable Samba based services running within
Kubernetes clusters, however our container work should be completely
independent of the orchestration layer, so you can use docker, podman, or=20
other OCI container based orchestration systems.


Clustering/CTDB
=2D----------------

We have continued working on making clustered smbd instances with CTDB a=20
viable option for users. The low level work has not been changing a lot=20
recently, and we've focused on improving the operator and how we create and=
=20
manage clustered instances. The feature is still experimental but the workf=
low=20
should not be changing much in the near future. Largely, you just need to=20
create "SmbShare" resources that indicate they should be clustered and the=
=20
minimum size of the cluster. We've improved our testing coverage but need t=
o=20
improve our infrastructure before we can stabilize the feature. We also hav=
e=20
some plans to revisit how we configure the CTDB cluster as the nodes file i=
s a=20
bit of a challenge.

Like I mentioned in my previous message, we want to look into improving
behavior with regards to node and container failover. We have not been able=
 to
spend much time on this yet, so we are unclear if we can combine CTDB's nat=
ive
IP failover with Kubernetes networking.

We're nearly done adding support for the vfs fileid module to the operator.
Sachin Prabhu has a PR open on this topic [2]. This change will ensure that=
=20
the file system we're targeting (cephfs) will not depend on external factor=
s=20
like what order file systems were mounted by the kernel. For now, this is=20
always enabled but we can make it configurable in the future.


ACL Xattr
=2D---------

We still want to run our containers without privileges and therefore being=
=20
able to store NTACLs outside of "security.NTACL" continues to be a goal. In=
=20
order to get this functionality, G=FCnther Deschner is continuing work on t=
he=20
open Samba project merge request [3]. G=FCnther is working to improve the h=
ooks=20
into the VFS layer to handle performance and layering concerns raised in th=
at=20
PR.


CI and Testing Infrastructure
=2D------------------------------

Currently, all our projects rely entirely on the github actions CI. However,
we've hit some limitations with this infrastructure, especially with the=20
ability to run integration tests on multi-node clusters for CTDB Clustered=
=20
instances. Anoop C S has been working on arranging a new testing=20
infrastructure using the CentOS CI [4]. This system will allow us to run VM=
s=20
in our tests and support virtual multi-node clusters. In addition to settin=
g=20
up this infrastructure for our Samba-in-Containers work, the plan is to als=
o=20
use this for the gluster/samba integration tests, and perhaps other samba=20
integration tests in the future.


AD DC Containers
=2D----------------

The samba-containers project generates images for client, server, and AD (D=
C)
servers.  However, the AD DC server images today produce containers that can
only act as a single DC in a hard-coded domain with hard-coded users and
groups. This has been working fine for our team for a while because our nee=
ds
for the Samba AD is limited: we use it as part of our integration tests and=
=20
not much else. As part of a general effort to make the samba-containers=20
project more generally useful, I spent some time over the holidays working =
on=20
making the AD DC container image work with custom settings [5]. The new ima=
ge=20
will be based on the sambacc project, just like the file server image has b=
een=20
for a while. Soon, the image will be configurable, support provisioning a n=
ew=20
domain, as well as joining a new DC to an existing domain.

Running an AD DC container continues to require executing the container with
SYS_ADMIN capabilities.


Wrap Up
=2D--------

Work continues on many of the projects living under the samba-in-kubernetes
umbrella.  We're hoping that these (semi-)regular updates help create some
additional interest in these efforts. Feel free to reply with
questions/comments/concerns. We'd also love it if you drop by our github
projects as well. Even feature requests are welcome. :-)


Thanks for reading!


[1] - https://github.com/samba-in-kubernetes

[2] - https://github.com/samba-in-kubernetes/samba-operator/pull/129

[3] - https://gitlab.com/samba-team/samba/-/merge_requests/1908

[4] - https://jenkins-samba.apps.ocp.ci.centos.org/

[5] - https://github.com/samba-in-kubernetes/sambacc/pull/28





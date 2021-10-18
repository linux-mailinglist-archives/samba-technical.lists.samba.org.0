Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBEB432761
	for <lists+samba-technical@lfdr.de>; Mon, 18 Oct 2021 21:17:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=AOaxnsf/PBRwqAt8wR8ZXQZVZCTkfFBUzr4lO2utnFY=; b=T+BCt8UQf0d0Q78DiBnnmmpg3t
	tVwUg30MmQML8gmEIUupQ/piRxnx5Afk615CuK9coZmsgf2F70YdEPcWJ0q87mRlAU7LxEuYsbOPG
	8f5u0t1pGxOVtS/+OSuFkjt4mmo44XglSmJBe8AG9NmeSIMIp/AdaBM80DsnuWGWiQ7cn9exW/K8j
	ZBlNwLQV8kzh2NOV+QiAuFuhkh4n1BEUV2Jt152xl/OIRiYnFgLG3sMm7dxT1L1g97Ey43ZmiDF92
	2XGNGI0pTdUpl0CZ7BGkuVcuLdvma0HRUWuCVEj6FZTSqHZFOFv6Q8n3p3V5YpNeLCwQaxzBssmYm
	sWJyKBcA==;
Received: from ip6-localhost ([::1]:62078 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mcY7a-009zfL-90; Mon, 18 Oct 2021 19:16:30 +0000
Received: from [104.200.28.160] (port=45048 helo=dup2.asynchrono.us) 
 by hr1.samba.org with esmtp (Exim)
 id 1mcY7T-009zf8-Pn; Mon, 18 Oct 2021 19:16:26 +0000
Received: from edfu.localnet (c-73-114-31-46.hsd1.ma.comcast.net
 [73.114.31.46])
 by dup2.asynchrono.us (Postfix) with ESMTPSA id AF9AD1512;
 Mon, 18 Oct 2021 18:57:14 +0000 (UTC)
To: samba-technical@lists.samba.org
Subject: Samba in Containers/Kubernetes Status Update 1
Date: Mon, 18 Oct 2021 14:57:14 -0400
Message-ID: <2614892.8bAqQVQ4q2@edfu>
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

Samba in Containers & Kubernetes Status Update vol. 1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D

As some of you may remember, I've been working on an effort to include SMB,
via Samba, in the container ecosystem [1] and Kubernetes. It's been a while
since I wrote anything about these projects. I want to give an update on our
work to keep others informed, and possibly get others interested in what
we've been doing. I hope to make this a regular thing (unless you get
annoyed and tell me to stop ;-) ).

We gave a presentation on these projects at sambaXP [2] and also have had a
few posts on the samba mailing list about them. Since then we've been doing
a lot of varied work and below is a small slice of it.

CTDB
=2D----

I took on the task of trying to "containerize" CTDB-enabled Samba over this
summer. With assistance of the samba-technical mailing list we successfully
started running CTDB in a containerized environment. I proceeded to automate
parts of the CTDB configuration in our sambacc library [3]. Finally, we
created new example YAML files in samba-containers [4] that demonstrate a
clustered instance of Samba running under Kubernetes orchestration.

There were a lot of challenges getting CTDB working automatically in a
container and there's still a lot to do. For example, the code I wrote to h=
elp
manage the CTDB nodes file isn't as robust as I'd like it to be and is still
generally immature. We'd like to discuss ways we might update CTDB to make =
the
nodes easier to manage through automation (in our environment) and hope such
discussions could improve things for other use cases as well.

At the moment, we've been using a Kubernetes based mechanism [5] for getting
clients running outside of the cluster access to the shares. Without plungi=
ng
deep into the particulars of Kubernetes networking; the method works well
enough but does not use the CTDB public address mechanism. As such, we feel=
 the
failover behavior we have right now may not be as nice at getting clients to
quickly fail-over when compared to CTDB's tickle-ack. This is an area we're
going to be actively investigating and would like to hear additional feedba=
ck
on this topic.

We're also adding support for the CTDB enabled Samba instances to the
Kubernetes operator code. The plan is to continue to use the single SMB
instance by default but add an experimental mode for running a StatefulSet =
of
Pods that include CTDB for clustering across multiple nodes.

We are also discussing the need for using the fileid vfs module on top the
clustered file system we intend to use (cephfs). However, we don't want to
require a PVC to be any particular file system and so we have been discussi=
ng
ways to enable the fileid module, and how to configure it, only in cases th=
at
we need it in an easy-to-use manner.

ACL Xattr
=2D---------

We are very interested in being able to use NTACLs on the shares that we ho=
st
in containerized Samba servers. Today, the acl_xattr module stores the NTACL
metadata in an xattr named "security.NTACL". The "security" namespaces on L=
inux
requires the use of the CAP_SYS_ADMIN capability - basically the "root user=
" of
Linux capabilities. This would require running the containers with escalated
privileges; something we would prefer not to do. So, G=FCnther Deschner, wi=
th
feedback from Ralph B=F6hme and Michael Adam and others, has been working o=
n the
patches in MR#1908 [6].

With these changes in place, we'd be able to configure Samba with a custom
xattr for our containerized Samba instances and thus avoid needing to run a
privileged container while still supporting NTACLs.

Nightly Builds
=2D--------------

We've been looking in an easy way to try out the latest code in Samba and a=
re
planning on adding support for building container images based on nightly
package builds. Anoop C S has already added support to the sambacc layer in
order to support the newer CLI options present in Samba 4.15. Next we plan =
to
add new build rules to the samba-containers project that will create new bu=
ild
tags in our container registry repo(s). Soon we should be able to more easi=
ly
test and experiment with the latest versions Samba has to offer!

Metrics
=2D-------

In the slightly longer term, we would like to add metrics support to our
pods running in Kubernetes. Our plan is to follow the de-facto standard
in this space and export Prometheus metrics. In order to do this we need
to get the data out of our Samba stack and rather than try and directly
scrape the output of a tool like smbstatus we are very interested in the
effort to add JSON output support to samba tools. In our case, we want JSON
output from smbstatus. As such we're very interested in MR#1269 [7].
We'll probably be getting more involved here in the near future.

Offline Domain Join
=2D-------------------

One new feature that landed in Samba 4.15 is the new Offline Domain Join (O=
DJ)
support. Currently, to connect our containers with Active Directory we're
asking users to store a username/password in a Kubernetes secret [8]. We are
aware that storing a password (even within a secret) isn't the best thing
to do, so we're looking forward to trying to integrate the ODJ feature
into our projects so that users never have to store a password.
Watch this space! :-)

Wrap Up
=2D-------

If you have any questions or comments feel free to ask! I'm hoping this
update both serves to inform you of what we're up to as well as serving as
a prompt for you to give us feedback.

Thanks for reading!

[1] - Specifically OCI/Docker style containers.

[2] - https://sambaxp.org/fileadmin/user_upload/sambaxp2021-slides/Mulligan=
_Adam_samba_operator.pdf

[3] - https://github.com/samba-in-kubernetes/sambacc/

[4] - https://github.com/samba-in-kubernetes/samba-container/

[5] - https://kubernetes.io/docs/tasks/access-application-cluster/create-ex=
ternal-load-balancer/

[6] - https://gitlab.com/samba-team/samba/-/merge_requests/1908

[7] - https://gitlab.com/samba-team/samba/-/merge_requests/1269

[8] - Not strictly true, as you can leave out the secret and then run
 a command in the container to complete the join. However, this
 runs counter to the level of automation we'd like to provide, but
 is an option.

=2D- John M.






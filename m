Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CDF2D2A92
	for <lists+samba-technical@lfdr.de>; Tue,  8 Dec 2020 13:19:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=dPuvNjRKiJJn0HBvpEfkbdYHLSguPT4lJjcpxmS13wA=; b=5fOUwmPMrsEs73+VHhCAV8HQ+Y
	umtI8X+RMAQjhEIBy1Oe83l11m2M7UFBpfPdomrSxmXMrnnY6efyr98Dx2wXtd16gRnbE7oRkL3a3
	k90gX4YqNSjmqV/o7Om71Bv0TX3ERdyS0sT3HrUr3ahBCReKBiXthpbZjYJKv3vnssa0sSGwi8cZ6
	vFpVuvApQ36L7ADQT3nZx5ejlAVodC+SasNkPQc2Sr8bQBheUNAHwD3LKvEmPKl7mOO5O5ZJ4dYUj
	DPexhSatkaiIVUmC1vy4sRbodgWisDg2fsDWOgMpa++55nJ9+4r8uRX6xdQOeKdg8AhOcSl1zfFz1
	b6esE1yw==;
Received: from ip6-localhost ([::1]:31736 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kmbwm-000CEe-0L; Tue, 08 Dec 2020 12:18:24 +0000
Received: from ozlabs.org ([203.11.71.1]:36045) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kmbwg-000CEW-7U
 for samba-technical@lists.samba.org; Tue, 08 Dec 2020 12:18:21 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cqzhs3b9Zz9sWQ;
 Tue,  8 Dec 2020 23:17:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=202004;
 t=1607429869; bh=pc5M8ewbAmqQWcKJPrUx46tdOIYT1VsqoOUa5CFRqyk=;
 h=Date:From:To:Subject:From;
 b=R11GWegHxW0uDrVIXOoL90dpGbmYkKghYlz96nC87Hkuj5CqS4LQAOYRIvdQPiVDz
 WxqLN2luAuStUf+gYPd2HsKRDm36Z/0WOmnLMwlIPR/QtCZ6TagT5CT2/lrkcMNIQ6
 3N/R9NiMRRBUoFv0KfWUw6PaR6TjjzyvNb6V1HY+J4pbN+bUWwoh152IqYIevFjmS/
 /c75+M1sCkWmQckmAtFG1Ad6lj2Qbyj9nKzxFgmLpco8cJADdIw22pJxqXPpC5laOY
 rxCnk0MpYMHPRXtefos6T0cChACVtqKpd8EvaQ7yIP3jFXjJKhXXsnsQW4xfBsecqh
 zm7J4Kctke2wA==
Date: Tue, 8 Dec 2020 23:17:46 +1100
To: Samba Technical <samba-technical@lists.samba.org>
Subject: Samba testing on CentOS 8
Message-ID: <20201208231746.3c15f5b0@martins.ozlabs.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

We've been doing our CTDB and Samba testing using autocluster, based on
the official CentOS-8.2 vagrant image.  This depends on using
bootstrap/generated-dists/centos8/bootstrap.sh from the Samba source
tree.

Until recently this has worked just fine:

+ yum -v repolist all
...
Repo-id            : PowerTools
Repo-name          : CentOS-8 - PowerTools
Repo-status        : enabled
Repo-revision      : 8.2.2004
Repo-distro-tags      : [cpe:/o:centos:centos:8]:  , 8, C, O, S, e, n, t
Repo-updated       : Sat 31 Oct 2020 04:58:49 AEDT
Repo-pkgs          : 2,010
Repo-available-pkgs: 1,444
Repo-size          : 1.0 G
Repo-mirrors       : http://mirrorlist.centos.org/?release=8&arch=x86_64&repo=PowerTools&infra=vag
Repo-baseurl       : http://mirror.realcompute.io/centos/8.2.2004/PowerTools/x86_64/os/ (9 more)
Repo-expire        : 172,800 second(s) (last: Thu 03 Dec 2020 22:30:57 AEDT)
Repo-filename      : /etc/yum.repos.d/CentOS-PowerTools.repo
...
Repo-id            : Devel
Repo-name          : CentOS-8 - Devel WARNING! FOR BUILDROOT USE ONLY!
Repo-status        : disabled
Repo-mirrors       : http://mirrorlist.centos.org/?release=8&arch=x86_64&repo=Devel&infra=vag
Repo-expire        : 172,800 second(s) (last: unknown)
Repo-filename      : /etc/yum.repos.d/CentOS-Devel.repo
...
+ yum config-manager --set-enabled PowerTools -y
+ yum config-manager --set-enabled Devel -y
+ yum update -y
...

However, now:

+ yum -v repolist all
...
Repo-id            : devel
Repo-name          : CentOS Linux 8 - Devel WARNING! FOR BUILDROOT USE ONLY!
Repo-status        : disabled
Repo-mirrors       : http://mirrorlist.centos.org/?release=8&arch=x86_64&repo=Devel&infra=vag
Repo-expire        : 172,800 second(s) (last: unknown)
Repo-filename      : /etc/yum.repos.d/CentOS-Linux-Devel.repo
...
Repo-id            : powertools
Repo-name          : CentOS Linux 8 - PowerTools
Repo-status        : disabled
Repo-mirrors       : http://mirrorlist.centos.org/?release=8&arch=x86_64&repo=PowerTools&infra=vag
Repo-expire        : 172,800 second(s) (last: unknown)
Repo-filename      : /etc/yum.repos.d/CentOS-Linux-PowerTools.repo
Total packages: 14,251
+ yum config-manager --set-enabled PowerTools -y
Error: No matching repo to modify: PowerTools.

The whole thing falls in a heap because it appears that the Repo-id's
are case-sensitive and that "PowerTools" and "Devel" have changed to
lowercase in CentOS-8.3.

I'm still using the CentOS-8.2 Vagrant image, so I'm a little confused
about why the repos are now referring to 8.3 (not shown above for
brevity, but definitely the case).  I'd certainly like to understand
this... but I doubt that will solve the problem.  :-(

I'm wondering how we fix bootstrap/config.py to copy with this change.
Does it have to be something horrible like the following patch?

diff --git a/bootstrap/config.py b/bootstrap/config.py
index 982ebae1cd1..8383aeb392d 100644
--- a/bootstrap/config.py
+++ b/bootstrap/config.py
@@ -235,8 +235,10 @@ yum install -y dnf-plugins-core
 yum install -y epel-release
 
 yum -v repolist all
-yum config-manager --set-enabled PowerTools -y
-yum config-manager --set-enabled Devel -y
+yum config-manager --set-enabled PowerTools -y || \
+    yum config-manager --set-enabled powertools -y
+yum config-manager --set-enabled Devel -y || \
+    yum config-manager --set-enabled devel -y
 yum update -y
 
 yum install -y \


Or is there a better way?

Thanks...

peace & happiness,
martin


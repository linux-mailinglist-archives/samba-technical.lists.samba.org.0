Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1FB2DD045
	for <lists+samba-technical@lfdr.de>; Thu, 17 Dec 2020 12:24:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=MJTliayy9sDn/JqFJGe5MiqVxFD+o19eOrpGajhUN9w=; b=iy8qJwIDuMyItwCpO0GwSuyaBD
	ucZNVmn0n1RexTurl8/JQp93wrhapq940qA2fEWy8P0148nQ7SQZEeVStPX8/j4ZbQ1FXOu7TyT+2
	vJnjft3t2tMFxfDyKFOVp02vFXc/i+xhtNzuRQeL78qKcHR8ZIsdrQoOtaFACUKhzwhyQoBXbTljt
	DVmnglRxDm8oj0Ge3m1m4JLKFD/EytroRjwbV8JNStNFLcX55aF5CGdoAth9ClT6Uk7/j0fhMHT3f
	YXxS+L29WPxhoiA+5WFIgsN3xC7yR/74bzyB2hLvPDRyDdeJca7PqL+tV2CuUuJokNQ17y8WK03Fp
	kw39kmqw==;
Received: from ip6-localhost ([::1]:63454 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kprO9-001nLF-Is; Thu, 17 Dec 2020 11:24:05 +0000
Received: from bilbo.ozlabs.org ([203.11.71.1]:53717 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kprNw-001nL4-FL
 for samba-technical@lists.samba.org; Thu, 17 Dec 2020 11:24:02 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CxV3w0Frfz9sTK;
 Thu, 17 Dec 2020 22:23:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=202004;
 t=1608204204; bh=ZBHH5voMyocKJAlVpA2vv3iVTJJtkpeSs0YtqssDPqU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ehqJT3LSaC1zlOtY3H5eA/QM/2OKbEoEKcC/FKB6g0quvV73hVo4zP0pMEpU0FnPq
 gTThXEYJPa2tBKGaClVF680mBmcyGGApD445IZwL5qqJi+PYTFBeQVJgh2JH1MzZlc
 V0w7Yz/+3J/0SUCzIHJr2nQS7MGLSApfCpI+ZgzDfrz15kIdxIWTjLifTDvIM+5/vm
 Mywtw8iMXcXgmN3sLMba9JTxkgmEC84rqVoLD7jzaYRNKUaeHu6KQ0YDHa8pn29TE5
 EPXIINOwpwTAc34KJfOCOR4UOvPYdvbrD6d5J+i1m1ZRw/L5MecvEqchJO71uSvYqZ
 gpV8v8mv9Fsng==
Date: Thu, 17 Dec 2020 22:23:20 +1100
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Help wanted: converting our GitLab CI scripts to modern Ansible
Message-ID: <20201217222320.268c9f38@martins.ozlabs.org>
In-Reply-To: <d7aa190742ae7838e501325b4a2e7c1fef6c71c4.camel@samba.org>
References: <d7aa190742ae7838e501325b4a2e7c1fef6c71c4.camel@samba.org>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 17 Dec 2020 23:26:30 +1300, Andrew Bartlett via samba-technical
<samba-technical@lists.samba.org> wrote:

> The Samba GitLab CI bastian system (where gitlab-runner runs, spawning
> new VMs per job) is built with Ansible.
> 
> However the Openstack module we are using, which is compatible with the
> Catalyst Cloud and Rackspace (where it runs in productions), is not
> compatible with the Oregen State University Open Source Lab (OSU OSL)
> cloud that we want to move to.  This is despite this also running
> Openstack.
> 
> The current sticking point appears to be that we create a volume (to
> back to root hard disk of the server) which is not marked bootable.
> 
> MSG:
> 
> BadRequestException: 400: Client Error for url: 
> http://oprod-controller1.osuosl.org:8774/v2.1/4917f5faae154a619dddd437eeb053b8/os-volumes_boot
> , Block Device b22d6488-9a5f-4c54-864d-e567ae5fda9d is not bootable.
> 
> We use
> https://docs.ansible.com/ansible/2.4/os_volume_module.html
> but we need to be using
> https://docs.ansible.com/ansible/latest/collections/openstack/cloud/volume_module.html
> 
> If someone has the time and expertise to port our scripts over this
> would be most helpful.
> 
> The scripts are at:
> 
> https://gitlab.com/catalyst-samba/samba-cloud-autobuild/-/tree/master/gitlab-ci
> and the roles we pull in here:
> https://gitlab.com/catalyst-samba/samba-cloud-autobuild/-/blob/master/ansible-roles-clone-or-update.yml

As far as I can tell the following 2 modules are identical:

  https://docs.ansible.com/ansible/latest/collections/openstack/cloud/os_volume_module.html#ansible-collections-openstack-cloud-os-volume-module

  https://docs.ansible.com/ansible/latest/collections/openstack/cloud/volume_module.html#ansible-collections-openstack-cloud-volume-module

However, the bootable parameter appears to be relatively new and
defaults to "no".  So, this should fix it:

diff --git a/tasks/servers_create.yml b/tasks/servers_create.yml
index e4d0582..c2857a0 100644
--- a/tasks/servers_create.yml
+++ b/tasks/servers_create.yml
@@ -5,6 +5,7 @@
     size: "{{ item.volume_size|int }}"
     volume_type: "{{ item.volume_type }}"
     image: "{{ item.image }}"
+    bootable: yes
   when: 'item.volume_size|int > 0'
   loop: "{{ _OS_SERVERS|default([]) }}"
 
Have you tried that?

peace & happiness,
martin


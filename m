Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB702DD81D
	for <lists+samba-technical@lfdr.de>; Thu, 17 Dec 2020 19:20:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=Nk7DG417wPa+HLdLFfKEwzr2w4h1SaNr27qcz4Ekgtk=; b=4XZFOA37JFScNuXzn93vyZMMEw
	ffZrIxGkqi8cVzeFClAB4F4gCNBTdfIEurMxhARVYaWxb87NEXitkqdg2LD7JFvrjYbNB8TEYt9xT
	rcZpan7Q2q5iZGN0w5eSSORtYxueno2b2tszrx5gmTyTJ9n+onuEInP7UuLqxWMHv4en0P2E0txw8
	IkZB73sskpRBEVTo65kGfYv05URZxYPVdNQLPx0B7ke/OauFoitNtefjhk5+YqAmFgI30GBDdxjTo
	H4y2PanFFi7r1qpTcT49TNP57dZl+ShY4L4yj+LfbHn/sC27wtVf6cKaZ2gk4Wwfyer4fL7jFaWWw
	0HIefw7Q==;
Received: from ip6-localhost ([::1]:45872 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kpxsd-001s9a-26; Thu, 17 Dec 2020 18:19:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40334) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kpxsX-001s9T-PO
 for samba-technical@lists.samba.org; Thu, 17 Dec 2020 18:19:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=Nk7DG417wPa+HLdLFfKEwzr2w4h1SaNr27qcz4Ekgtk=; b=NPFxENmDkDLg4CBditgWg0huHp
 sIo8S+P5C+pcilSXORNziigLgNkA4mVLANCFUpWPIgQND8SKrq7GBF1EUPAVUJv0iNcpp14emzI8f
 3e2ApNcugLrhJfjvMsyYwPIg8oOgpJNbQtILRnkRdq9olIvIBM8nLdksQhOU3fMs0jkc8yGgwv04x
 QP5UIvFNL8C6ZvzutKuv+jDfQ49vs66xZs8gEl1JZFhMajwEfBxJ8NDTbCTBoQdZmUBral+EN8Q84
 +hfP63eLONVWVrxGxyHMlb/g9TklrFA2ww00RIG57A7OO9rtEHi4g78DxDYGfpGu8HUqpza7VLI3k
 bIvMgXICXaAz47XW8VtwadOetGhKmUiSFE0TXhMONbAXWJJndgaF+0AFm1benIcUUuwzvwfMoNdPS
 RiQzYfVPArwqr4RgSRq7xPa710GTfrk4YGfbAEn7JSiINoPEpQe7YK7ELp0c8h/HJFoMdmz+U++el
 wD5OHLiDVHOSEcys5wUUCCG7;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kpxsW-0004bl-4m; Thu, 17 Dec 2020 18:19:53 +0000
Message-ID: <4211a7b2e7e356e79705f6e74d6041fce4846f8a.camel@samba.org>
Subject: Re: Help wanted: converting our GitLab CI scripts to modern Ansible
To: Martin Schwenke <martin@meltin.net>
Date: Fri, 18 Dec 2020 07:19:45 +1300
In-Reply-To: <20201217222320.268c9f38@martins.ozlabs.org>
References: <d7aa190742ae7838e501325b4a2e7c1fef6c71c4.camel@samba.org>
 <20201217222320.268c9f38@martins.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2020-12-17 at 22:23 +1100, Martin Schwenke via samba-technical
wrote:
> On Thu, 17 Dec 2020 23:26:30 +1300, Andrew Bartlett via samba-
> technical
> <samba-technical@lists.samba.org> wrote:

> As far as I can tell the following 2 modules are identical:
> 
>   
> https://docs.ansible.com/ansible/latest/collections/openstack/cloud/os_volume_module.html#ansible-collections-openstack-cloud-os-volume-module
> 
>   
> https://docs.ansible.com/ansible/latest/collections/openstack/cloud/volume_module.html#ansible-collections-openstack-cloud-volume-module
> 
> However, the bootable parameter appears to be relatively new and
> defaults to "no".  So, this should fix it:
> 
> diff --git a/tasks/servers_create.yml b/tasks/servers_create.yml
> index e4d0582..c2857a0 100644
> --- a/tasks/servers_create.yml
> +++ b/tasks/servers_create.yml
> @@ -5,6 +5,7 @@
>      size: "{{ item.volume_size|int }}"
>      volume_type: "{{ item.volume_type }}"
>      image: "{{ item.image }}"
> +    bootable: yes
>    when: 'item.volume_size|int > 0'
>    loop: "{{ _OS_SERVERS|default([]) }}"
>  
> Have you tried that?

I hadn't, and I really appreciate your looking at this for me because
yes, that worked.  (I claimed this worked on Catalyst Cloud, but that
was historically, I've not built it there recently).  

Late nights might be good for some un-interrupted time, but they come
with downsides!

Thank you so much!

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba




Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AA65B2DCF77
	for <lists+samba-technical@lfdr.de>; Thu, 17 Dec 2020 11:27:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=HcstO0lmVbbEPaJ5lhJS6i8JYcQzp/weKTu9vN3hUH4=; b=B0Y9QfW3eahb++BT5sH0SGI5a5
	ROWI/DJBzqFqu4NRDWMUkbz/36FhAvTNIBBYevuv2hn9j8DdLsMKG89aJkGKmWOhbMoM9jsPNNrqE
	3yFl5cKwkuoKkX+Fb0J2qWUl1By1M4L3Ut3clBxw8EpVHjXF+oojlwagIAIOQENIrSwglxAq5cFTQ
	QDKd2W4E/yuzFvWjYtLi3hENzPQoYuPmNQ8vg9O/ymjAk2UcYGQ31+X0N2IyVNlhyM05swIWznHNW
	TrHhjXT5pNdU5JuZAfPOsemuZjv4itCsL2D/S6bH3WFHxC3ffsf4+rvLQwGaOfWkcTxcqGog76XZW
	0QgCuujg==;
Received: from ip6-localhost ([::1]:60610 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kpqUg-001mnm-Tx; Thu, 17 Dec 2020 10:26:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23732) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kpqUb-001mnf-8Q
 for samba-technical@lists.samba.org; Thu, 17 Dec 2020 10:26:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=HcstO0lmVbbEPaJ5lhJS6i8JYcQzp/weKTu9vN3hUH4=; b=WGo0Hx/np2l0tixl8eLOENeMRv
 nHmOqbLXmLPshv344pGo1JtY6KLGlFXtLGe1PoENaiCrNyNk0j4d0dCebVW29zjUISxsZXw8+W3jl
 9veOz6QPU87Bb3yl/EFSz/tj9VtHNGeiaQWmhVHH3k6UOmgQ0CMaBqU6in5XKU+I0ntc+Y6WWFsMX
 5RF8JaGIoAmA4voe7eookqwpUU+jwy4zUEWha4C40nWPEf6V4HgGex1YeM5f/4wR8L3qVGyEVQ7Wo
 Uc/nfDRd/D+F4ctD58p4c9NWnffdqoLS06Mk8DZJMBltK9uAzsEcWFYg+G3krZW/mr8FZ9aDj45g+
 1s3Jm6A9SAISSqozZwLA/TnCzI6TsayDNdbey150vBayfpa0Zna/kvZPCOgXfAId08J/5BhP/5DHj
 EXa+bdlHcHElvAzC3qUUpJzdyIxBhem9khKOTYL85UnbMihtB7SYtcCe7CqKImZQKQk63lLICPJMo
 TJU2BEgDE55UeBG2FLi9STjC;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kpqUV-0000xE-PZ
 for samba-technical@lists.samba.org; Thu, 17 Dec 2020 10:26:36 +0000
Message-ID: <d7aa190742ae7838e501325b4a2e7c1fef6c71c4.camel@samba.org>
Subject: Help wanted: converting our GitLab CI scripts to modern Ansible
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Thu, 17 Dec 2020 23:26:30 +1300
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

The Samba GitLab CI bastian system (where gitlab-runner runs, spawning
new VMs per job) is built with Ansible.

However the Openstack module we are using, which is compatible with the
Catalyst Cloud and Rackspace (where it runs in productions), is not
compatible with the Oregen State University Open Source Lab (OSU OSL)
cloud that we want to move to.  This is despite this also running
Openstack.

The current sticking point appears to be that we create a volume (to
back to root hard disk of the server) which is not marked bootable.

MSG:

BadRequestException: 400: Client Error for url: 
http://oprod-controller1.osuosl.org:8774/v2.1/4917f5faae154a619dddd437eeb053b8/os-volumes_boot
, Block Device b22d6488-9a5f-4c54-864d-e567ae5fda9d is not bootable.

We use
https://docs.ansible.com/ansible/2.4/os_volume_module.html
but we need to be using
https://docs.ansible.com/ansible/latest/collections/openstack/cloud/volume_module.html

If someone has the time and expertise to port our scripts over this
would be most helpful.

The scripts are at:

https://gitlab.com/catalyst-samba/samba-cloud-autobuild/-/tree/master/gitlab-ci
and the roles we pull in here:
https://gitlab.com/catalyst-samba/samba-cloud-autobuild/-/blob/master/ansible-roles-clone-or-update.yml

Thanks for any assistance you can give.

Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba




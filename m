Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD577934CB
	for <lists+samba-technical@lfdr.de>; Wed,  6 Sep 2023 07:18:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=mTo5Y6Ox71qgYUUwxwgGZiPbzWWx0gxZIWdsri1QFqQ=; b=RjJgs2WW31klceMnvXUqg9Lz9J
	QG+ozOuHK2P2RdMqcmyd6YP4OKM9hEnPhrOfhONpxhl62gqZrJo7l/1nS5W3ohvvd32EmhOQXlYiN
	Bg2lPUAwcfPyhV2g2868fEg181PctxwYv3f7GjkcYmqdc2ujmVzVnE7sejOfxMfIrqPgnqeREXipU
	l8NxYV9TCEYyyFbeYoTUO/YSC6TvZPaBEqFxGIeR/edyj+W+Ky6iWTcUDihVGOIRaeIGngX36tP27
	0m/zFOpGVhPEBn2BE53CQiHhOt9A0vkuUFtoUm8aLfRnOQEx+xulBN0K8fJsh5ziVinQu7sdph3Pv
	mtJD/YDQ==;
Received: from ip6-localhost ([::1]:37068 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qdkvd-0016HP-UW; Wed, 06 Sep 2023 05:18:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50078) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qdkvV-0016HG-Qu
 for samba-technical@lists.samba.org; Wed, 06 Sep 2023 05:18:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=nPT86JFUZdV7hd0OO5fBTN+3Z1eDLaKyzBOZfbtbv4o=; b=in+C5kTUw8heCriJDruTgzFcXS
 eMpXUJvQ+mkGkzmf9NSLWLzmxlUTu2Skk6uja4BsF12p3Y01fUIhe3nrrd7cpmRl970/YOzdstVcM
 SLWcJ8C6mRZfme2d0ro3ArWEovtc44Se9SdiJDXhkypEeq7GoHFIUbIMJmxgs+mnC3GiTHnCU5wa0
 Zf3HkHkl0tytNu2aMh+DYj8evQGglIuz4WoFejrjuRRUgDEKzKikSsp9T6fPImWZXapVLYeuMJ+en
 R3gfCST8J+WR58pkDa8KE2ydxxCtpIRwFbz59qojUpDB8RGSM1TlxHyITLeD1T+I+siuM4laehkJU
 cn3kIcn3i5BVOH0z8dB7l1Srm1Vt2mM74j61jzWFSB94E2OtQe00B1y5G144DOEFUs91pTLk96QRo
 5SplEirfbpd/aXdncRx5OiDYyfih1TYEVgwgO2X1QQeP8B6X0gmjUUfI3G6BrVoRlfFXVeJGDiLle
 eJV5udGIRRrKOZ4OSUDIAseR;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qdkvU-00C0OE-0h; Wed, 06 Sep 2023 05:18:04 +0000
Message-ID: <285a87bc5f7d2377d8aedbe296e21bfd82536f9a.camel@samba.org>
Subject: Re: GitLab runner update - fix samba-fips on Rackspace runners
To: Stefan Metzmacher <metze@samba.org>, Upstream Samba Technical Mailing
 list <samba-technical@lists.samba.org>
Date: Wed, 06 Sep 2023 17:18:01 +1200
In-Reply-To: <6ba496d3-05b2-3fdc-fcc0-782e6b452db2@samba.org>
References: <38e471b78bcb1e2584adb304bafa7090c18616b2.camel@samba.org>
 <6ba496d3-05b2-3fdc-fcc0-782e6b452db2@samba.org>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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

On Wed, 2023-09-06 at 07:09 +0200, Stefan Metzmacher wrote:
> Hi Andrew,
> > The old kernels were  4.15.0-159-generic from Ubuntu 18.04
> > The Kernel under our CI images is now 5.15.0-41-generic from
> > Ubuntu22.04
> 
> Can we use the hwe kernels there (linux-generic-hwe-22.04),it would
> mean we would get 6.2.0-31-generic, and even morerecent ones once
> ubuntu 23.10 get stable.
> It would mean we could do io_uring tests with the latestzero copy
> features available with kernels >= 6.1

To do that we would need to build a new CI image, eg with packer from a
Ubuntu minimal image.  We can't at runtime change the kernel image as
(of course) we need to reboot. 
A new minimal CI image would be a really good thing, because currently
it spends way to long upgrading all the packages that we don't use, and
installing docker before the CI can start.
The ideal would be to build and upload that each time we rebuild the
bastion host, and have that process automatically remember the image
ID.  
But currently, no, we can't, sorry!
> > The shared runners are 5.4.109+  BTW.
> > This seems to fix a persistent failure in the samba-fips test, eg
> > asseen here: 
> > https://gitlab.com/samba-team/devel/samba/-/jobs/4840635606
> > 
> > I've also taken the opportunity to set the maximum job timeout in
> > theRackspace side to 4 hours - within 5 hours a VM will be
> > terminated bycloud-checker.py, as script running on the bastion
> > host, and to make itnot block.  (Blocking deleting hosts is bad,
> > sometimes the calls stalland fail to complete, preventing other VMs
> > from being killed off).This should help keep our CI bill under
> > control.
> > Also of interest is a MR to only use shared runners
> > https://gitlab.com/samba-team/samba/-/merge_requests/3255
> > 
> > I'm shocked to see this all green!
> > This would mean we could save our private runners for security
> > workonly.
> > Finally, I've noticed that GitLab upstream has removed their
> > relianceon Docker Hub, so the limitation (an aggressive rate limit)
> > thatblocked our move to OSU OSL a while back no longer applies.  If
> > wechose to go the other direction (move more CI to OSU OSL, say if
> > GitLabchanges their CI terms/fees) that should now be entirely
> > practical.
> 
> Thanks for all the work!

Thanks,
Andrew-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead                https://catalyst.net.nz/services/samba
Catalyst.Net Ltd


Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company

Samba Development and Support: https://catalyst.net.nz/services/samba

Catalyst IT - Expert Open Source Solutions




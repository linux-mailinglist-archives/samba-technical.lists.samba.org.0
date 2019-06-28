Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A86597E4
	for <lists+samba-technical@lfdr.de>; Fri, 28 Jun 2019 11:51:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=hDjAI2FCzzJ1s0l00XgoB+JZY60aTEua1RDE/CYWXiw=; b=AI8mI5aR77MgK6CVxus8fxsxgy
	iNbWu4OdAFegoH5dnYLGK8MiEs2JKq/hn/NiOOMrVMJJ4HxBoED807LsgxRDtGA739mLu3HANXB3t
	vTT8p0TS29TNGLQjNJYO+yQPJSXHRhke2XYhcotkZqaQo/vPP9cAmkJDyICF95rONVM1+8nIehNCC
	zdyuJ7W0JVlpzz4BT3Y3isutLMPCMxutAZlSU2TOr3s3o4WVhHIWvpLwtVjTAfCyRx/ij3zhrhxUN
	qcyin61Rb1DvXGza+nxbpaqzKX3ZvmNngTym/ZftV6ODy96DPF69JlMkJg3QeiaO66eimPFML2DM9
	+b/iTZkg==;
Received: from localhost ([::1]:37964 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hgnWf-002KMa-1k; Fri, 28 Jun 2019 09:50:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56844) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgnWb-002KMT-Iw
 for samba-technical@lists.samba.org; Fri, 28 Jun 2019 09:50:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:To:From:Message-ID:CC;
 bh=hDjAI2FCzzJ1s0l00XgoB+JZY60aTEua1RDE/CYWXiw=; b=h6RD/EEm/4QFk5SjuTIQnO54bJ
 yTMOSIpmM+Oiylwt6xDH+AoJSolw5ai5i+XDpLVzitDOQhWZJ4g/prgjyYkb8zwb9qadJ6Dwf/Nm8
 9vdarf81cW+ROPiL5BXE0M/q7xGJ1wp8NAR+OYnrnk/e4jiZiosCY0QuwsrT7E8SFHC8=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgnWa-0007lp-IU; Fri, 28 Jun 2019 09:50:33 +0000
Message-ID: <9166911b2411a10754758a3d9df4016a61b29185.camel@samba.org>
Subject: Re: Pipeline failing on samba-ad-dc-backup
 [https://gitlab.com/amitkuma/samba/-/jobs/241734878]
To: Amit Kumar <amitkuma@redhat.com>, samba-technical@lists.samba.org
Date: Fri, 28 Jun 2019 21:50:28 +1200
In-Reply-To: <ce517e87-73cb-e018-5d66-9eb8b21a350c@redhat.com>
References: <ce517e87-73cb-e018-5d66-9eb8b21a350c@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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

On Fri, 2019-06-28 at 13:50 +0530, Amit Kumar via samba-technical
wrote:
> Hello,
> 
> Not able to find why pipeline is failing
> 
> test failed in 42 minutes, while runner timeout is 3h.

Just press retry for now.  We will get onto a fix a soon as we can, it
is clearly breaking for too many folks.  Jeremy asked about this
earlier in the week also.

Sorry for the frustration,

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba





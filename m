Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EA713585
	for <lists+samba-technical@lfdr.de>; Sat,  4 May 2019 00:28:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=sI54XgNFpR4c/it7ECQyVTE1oYSOqGgOyAq91OXa/Sw=; b=nkHDSdn+rTJUHFD6Wt6Oukob3w
	HsKQ0wjzK1njh1rOH6hCNWAUhnVkccsVjiIWNyna0fbU/ZPBvXhWEp5KMNXoHHJ8QTd3NNf72VPp8
	MK+sN/nv6INtPQKeTKl2RszvLvEA7+zs6kLFjViFCDxpFoUWM06CTWkeng9MtfbUytL33kiLHoov6
	QgQeLutU4Z6H73/Xj0x/1Lk2AvqxfL55R59XjMa9QzaFeQbVPXnNagIZIc06tHKZhPqjNwK0q4I9y
	43hpG8mG7fqgtAlCaG8v1JiJcfprUCMsLC19EdRW/b192ftRWMwXE0MC4bKHt0TnVVD7LzGRNcZ7o
	q0f/xS0A==;
Received: from localhost ([::1]:35108 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hMgeO-002KAq-KM; Fri, 03 May 2019 22:27:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:64438) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hMgeK-002KAj-0B
 for samba-technical@lists.samba.org; Fri, 03 May 2019 22:27:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:To:From:Message-ID:CC;
 bh=sI54XgNFpR4c/it7ECQyVTE1oYSOqGgOyAq91OXa/Sw=; b=bESh8yHsrqFpcePIPZ9fb3VcKd
 jml/QzJ1EYbL90Es6xQgeNChvzKKVlsGMRhYNxu286vZ9/HtTFnre5SAMQI5cn9fZnUlYxhpIEojv
 H76WEVT9WhznL8ALnV9sXJfK4HYLRWN8XloS/aL0Q7Dgy1n/cXbyGh0kRrSBGK/SvJWc=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hMgeJ-0001PV-0s; Fri, 03 May 2019 22:27:23 +0000
Message-ID: <1556922439.2951.90.camel@samba.org>
Subject: Re: [PROPOSAL] Evict zlib
To: Simo <simo@samba.org>, samba-technical@lists.samba.org
Date: Sat, 04 May 2019 10:27:19 +1200
In-Reply-To: <38fcada0745ba8dd4517ceb541cbac768652f844.camel@samba.org>
References: <1556868232.2951.47.camel@samba.org>
 <38fcada0745ba8dd4517ceb541cbac768652f844.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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

On Fri, 2019-05-03 at 13:28 -0400, Simo wrote:
> If by removing you mean unbundling then that's a big +1
> 
> Simo.

That's what I mean, remove third_party/zlib after moving the wscript
test somewhere sensible.  I'll prepare a MR next week.

Thanks!

Andrew Bartlett
-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba





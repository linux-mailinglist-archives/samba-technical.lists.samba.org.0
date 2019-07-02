Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 34ACC5D66B
	for <lists+samba-technical@lfdr.de>; Tue,  2 Jul 2019 20:51:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=ThDiAEAKeQZvC3AvQuBaTiu4SaHjFNuWwWoctIdN+7U=; b=XjBItDy50FEzRiTqUG0N7OllRN
	uKuiJgkWPhXxcCmLOhkqv1GoNi1vqMQUd67bVHoSAmhlJNByNHrTtHgYEaC8bm/7SPHj+dNPxmiEF
	G2SgKOH3RlIsEwT5tNFldcYRxEJLBfeeucuZPZSuFrr+vi34xJ/I/FQRZLgWR9FmJzele+Kr77ZeD
	XOUh+ct2OxtWbuuAW9pRliApu+Ni4jUGKDGVLiNca5PJ0H4o+t4LxpiMNNd8ulMkmthgwx6ZGqsaF
	b+KcjQ//TgGAKE3uLdOy7ehuidPm0IlxinjJvbNzSVGfJDvpUSE1pKpSiCj5odmbsuIImGqxnGqFt
	m8PiecPA==;
Received: from localhost ([::1]:33322 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hiNre-004g3V-Ff; Tue, 02 Jul 2019 18:50:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:65140) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hiNrY-004g35-Px
 for samba-technical@lists.samba.org; Tue, 02 Jul 2019 18:50:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=ThDiAEAKeQZvC3AvQuBaTiu4SaHjFNuWwWoctIdN+7U=; b=ABAGwu4Q/rKAN7XBm+9PXc0Ozr
 IVGkH1Mu26oksXNGPCCOmvL7DQ0jwTE03Lzgvi+nPFhPtSeR2uKlMDhjhEP6byGOcI0MohhjioRU9
 CkU0v9FPbSlGQdxB/IJhfVTKXycq51z3hOySftp/VNmU23DhWj7ehBg9gZJ00Mzf8gAU=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hiNrX-0003QD-Ch; Tue, 02 Jul 2019 18:50:43 +0000
Message-ID: <0c94f9e179d667f98424868ccfdaaca56d9761c7.camel@samba.org>
Subject: Re: An even better GitLab CI (was: Re: Document GitLab as the only
 way to contribute to Samba?)
To: Michael Adam <obnox@samba.org>
Date: Wed, 03 Jul 2019 06:50:38 +1200
In-Reply-To: <20190628210226.GD5892@samba.org>
References: <1561079117.28284.21.camel@samba.org>
 <20190628104624.GF32415@samba.org>
 <62bc808700dca7a08f3a61c6d7e676119c301843.camel@samba.org>
 <20190628114651.GB5892@samba.org>
 <d2f00126-4507-23de-df51-d41ee28b639a@samba.org>
 <20190628124010.GC5892@samba.org>
 <2bf77950a3762982c3f8b2666f906656a1a64e42.camel@samba.org>
 <20190628210226.GD5892@samba.org>
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
Cc: Uri Simchoni <uri@samba.org>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2019-06-28 at 23:02 +0200, Michael Adam wrote:
> 
> Just (thinking out of the current gitlab-ci) box (but inside my
> area of experience): Is it possible to add some other CI runs in
> gitlabl that would trigger via some web-hooks? Those could be
> used for real cluster tests with multiple VMs, or tests that have
> other special requirements that the free CI runners can not
> satisfy (like ext4 ...). Alternatively, could we integrate other
> external runners with the existing CI?
> Just checking the conceptual possibilities.
> (Maybe we need to have a video call and you can walk me thorough
> how it is working in the backend, Andrew, so I can understand
> better...)

I've not explored the other potential integrations, mostly out of a
desire to deliver what we have done so far without distraction, but I'm
always happy to chat and keen to learn about what others can bring to
the table.

There are web hooks:

https://docs.gitlab.com/ee/user/project/integrations/webhooks.html

Thanks,

Andrew Bartlett
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba





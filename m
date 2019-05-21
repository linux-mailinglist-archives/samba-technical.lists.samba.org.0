Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (unknown [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3D4245AB
	for <lists+samba-technical@lfdr.de>; Tue, 21 May 2019 03:37:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=E3PDmo/5AHlvbOgef9oLoYaOMjhDpQJHeqCmAS4HUNU=; b=sXpmHjo0rIDZiGKZVwKWW8CPMA
	uZtwGBp58UalO1kefsMgMdXw2LOEb1EOVJfdnopL2yjpHM5eFE3ZCWLuyyydpQpCKRlfoJvCuZJWm
	hKtZNiwgcXExhsNEAHzaxlHCiZgy6RjnUSrECvUKrNqLc5PDcTAQaLK0N0F5BsQ/+DafIyFt7BRwl
	4ddNRbsruKfM90QLe5+JwfIYqtXpDONqUiWlZUxyvoRK1h7pCWw63cqXzh17BNKjNKFe9czr9ubV2
	mhhXy3wD5KMYnibkHT1Buy6vII0yZ5XpLDSASPovZJNp1oc2L4KcZMYq+4PIUyGGUPTg2RditmACC
	JzC9s7kA==;
Received: from localhost ([::1]:25824 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hSthW-000scV-Es; Tue, 21 May 2019 01:36:22 +0000
Received: from bilbo.ozlabs.org ([203.11.71.1]:40743 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hSthQ-000scO-CJ
 for samba-technical@lists.samba.org; Tue, 21 May 2019 01:36:19 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 457JJ810vjz9s6w;
 Tue, 21 May 2019 11:36:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1558402568; bh=rM/zU+H/8U1w2NDx3AV2X+WYJ1x3zWJwmfVh6i72Dww=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=F4OAGAABW8f7vP5EMfRdiXEKxO6dUu9F4xnxlpCSV2DA9rGtr5RuR087q/tdOnk35
 4RxTGmz96/KswEW/9aPxVBUWL7QI2FgK3A6j4KhiMr66mKzTZI7WMm3L5iWseRW4I8
 I4WfoouCPzxU4uBH3tVc+NJbAfEtbKkUWBh01pyoG5UvXCmzguhxriqJUfJuZxNRGo
 Q6EmSbl/8ZtmK6L3OLeeeb7d31sZv1I90i5EnAlDIw33gd2hUsTSdagdL23ofxgZDJ
 n93HJlVcj6KEk6tpR1K10CE630TUhllPPzlSSTtkUsUfv2c2pDC5w9z2Mu9iEOAdTq
 y9lR06M/T4RaQ==
Date: Tue, 21 May 2019 11:36:07 +1000
To: Andreas Schneider <asn@samba.org>
Subject: Re: New csbuild run
Message-ID: <20190521113607.55e693da@martins.ozlabs.org>
In-Reply-To: <1902926.C4UlyRiazf@magrathea.fritz.box>
References: <1902926.C4UlyRiazf@magrathea.fritz.box>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Andreas,

On Fri, 17 May 2019 16:34:42 +0200, Andreas Schneider via
samba-technical <samba-technical@lists.samba.org> wrote:

> I've started a new csbuild run with ctdb included:
> 
> https://gitlab.com/samba-team/devel/samba/-/jobs/214444970
> 
> csbuild normally checks a commit range for added errors. With a force push it 
> will check the last 20 commits. This means it will go back 20 commits, compile 
> everything, then checkout what you pushed and compare the diff of the output. 
> If there are newly added errors, it will fail.
> 
> However it reports a huge amount of problems so that the log exceeds the 
> allowed size of 8MB. However we should try to address the issues it finds to 
> get to a smaller size.
> 
> I normally try to fix a few of those issues form time to time because it finds 
> a lot of valid once. It will lead to a much better and cleaner codebase in the 
> end!
> 
> Please help fixing those bugs.

How can I run this locally on my laptop?

peace & happiness,
martin


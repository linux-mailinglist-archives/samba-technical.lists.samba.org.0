Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D2115F84E
	for <lists+samba-technical@lfdr.de>; Fri, 14 Feb 2020 21:58:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=ll8ypFcvSzKgZSKmdBDAROhovxXC4Pozg7QHNrEsqC4=; b=bsxyEfNdbEOZE6veyLvEGnMHLB
	JRhJrh8+ZDmVxJqkT2eSHwe1K84FqIN6eqMhRMLFF18enpPB7WL5gX0q0zVrt6kHzmotyoX/C22en
	Rlfq9TXHX3bZGjRQGru/Ou7yCsp8oRcJ54z4hBAHqVLQGNmBwfcPfEip0wuHJTHSFytCBfKUhZfNq
	LOwAtEbxLWLq2C+PzRabcqavkN7nHO/yPsXi5Irbx7+qcJyw9erhdh5yNqwTLQjl31c3Cpa+iiuOz
	z0h5ofht3zAd0M24cjVu2fphh5loK6VrKV/vPKF0aGRwPNLse89pe1ghKjKAK9o0dSyDHYG4YjHCH
	8Z7aOFvQ==;
Received: from localhost ([::1]:49012 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j2i2I-009xF1-RJ; Fri, 14 Feb 2020 20:58:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26572) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j2i2E-009xEu-3t
 for samba-technical@lists.samba.org; Fri, 14 Feb 2020 20:58:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=ll8ypFcvSzKgZSKmdBDAROhovxXC4Pozg7QHNrEsqC4=; b=s/7zoUgRbF1ZTQsx5LullnnDZs
 zZY5oOSTZ9SuY1WAz3ZtEr1P87Pk4Kc9z9AbXNmlZGHlaJpjhdq6WUhXKAXOV6C3mqcou/XSVVhdw
 Mtyvkmp8dodcwJ/wNPN/lpIJ6eBv4ZgPrQv359aHfsEq9MnbEvexvgTHpzpqBtDpmvAT1SE2xQ5bl
 Mw2e1mcNMu7qKPAB3S9P2TaF6CuBTJuOnSfJ3ni2tm9SR3VX6Ih5JMevU2xcCrOnc08woiuS0uMaz
 HQMwIG0hhoLIbtSW8NGyuN9IIyq6P0j3mpQtv7Zd2enwRFtxib5QESAjEt6beGFH54O+sUbFdEqFv
 ec8HipbLHMrJK4f1Hyb49p6NvHqCXC8JPEP6Ul4IqsjRMcRIsrq/TMsPQY/irqgEG1tqy4qFJKG/4
 U7rU4aZvu8lOUd8zopVD2C4XpxSN+UncFlOBZoAiuMzgWKk6BTTi0uj1UcyWcSKRZCi3dHE9f0huN
 bHUvGaZ19psBM8w1CisB20YH;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j2i2D-00045g-1Y; Fri, 14 Feb 2020 20:58:01 +0000
Message-ID: <ffbb3c2912a79ca4c32232280b0ce689597aa99c.camel@samba.org>
Subject: DFS/VFS failures in GitLab CI
To: Jeremy Allison <jra@samba.org>
Date: Sat, 15 Feb 2020 09:57:58 +1300
In-Reply-To: <20200214205049.GA51881@jra4>
References: <1f5483b6c7349f261b79990f3daea501d7636ffe.camel@samba.org>
 <20200214205049.GA51881@jra4>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2020-02-14 at 12:50 -0800, Jeremy Allison wrote:
> keep getting (for example):
> 
> https://gitlab.com/samba-team/devel/samba/-/jobs/438181318
> 
> Failed to start up environment 'ad_member' at /tmp/samba-testbase/b21/samba-admem/selftest/target/Samba.pm line 125.
> 7206 samba can't start up known environment 'ad_member' at /tmp/samba-testbase/b21/samba-admem/selftest/selftest.pl line 840.
> 7207 ==> /builds/samba-team/devel/samba/samba-admem.stdout <==
> 7208 [1(0)/138 at 0s] samba.tests.pam_winbind(local+krb5)(ad_member)
> 7209 ERROR: Testsuite[samba.tests.pam_winbind(local+krb5)(ad_member)]
> 7210 REASON: unable to set up environment ad_member - exiting
> 
> The code changes I'm making (DFS/VFS stuff) aren't anything
> to do with this.
> 
> Any ideas on what might be going wrong ?

I'm pretty sure it is your changes.  This looks generic enough to
reproduce locally, so try that to get good logs. 

make test FAIL_IMMEDIATELY=1 TESTS='--include-env=ad_member --include-env=ad_member_idmap_rid --include-env=ad_member_idmap_ad --include-env=ad_member_rfc2307'

It does say this a lot earlier, which does look like DFS/VFS stuff:

checking for winbindd
wait for smbd
tree connect failed: NT_STATUS_CONNECTION_DISCONNECTED
tree connect failed: NT_STATUS_CONNECTION_DISCONNECTED
tree connect failed: NT_STATUS_CONNECTION_DISCONNECTED

Sorry,

Andrew Bartlett

-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba




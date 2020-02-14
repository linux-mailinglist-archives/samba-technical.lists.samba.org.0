Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 392DD15F8E4
	for <lists+samba-technical@lfdr.de>; Fri, 14 Feb 2020 22:46:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=gNaabr8jjmhmmaYOEwq0EcE5BcNUFpNwxAfB1gJJp20=; b=uOIOzg9IM7fxT09f/EEP5O+jFR
	Vhig0/ACAC4fuPXsfVCCp2dOqoKJm8gsJbStgysN+hZoUXwjuBu1EelEn5llw8z/TyPiHVODbXglx
	TEhcQw5c08Wvs91KLTGMHMxnEeMbJSB6ZeOjDr4DKO8x/KkE7nJE8Z4OtMkyrMONCmuHvzvPqkt2l
	g8wCNqdOqGUHPdSqNcGAIkLokA4i5eenvP3ZQ1eVZkA2yg2bfUKNqttvqla2eRZt85K1WWeZknkMg
	wLR+8uCDnZ+su3yjXl5ghotS2UGstMOgVLaW4cu90eX0W0jg/CcGQt3xe/9iQ8tTnO0sGdMSJvu8A
	7fkfXQdQ==;
Received: from localhost ([::1]:53966 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j2imo-009xvB-Id; Fri, 14 Feb 2020 21:46:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39050) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j2imh-009xv3-9i
 for samba-technical@lists.samba.org; Fri, 14 Feb 2020 21:46:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=gNaabr8jjmhmmaYOEwq0EcE5BcNUFpNwxAfB1gJJp20=; b=qOPlm8sn0y2sD3B7mIHqlZShFE
 QxhMqWLpmqU9VKWHlCFKIc87oTbp2Zhg1CFMw4CsJfBumanHGIaZy48ibGb1nei2sGGJS7h7RGgAN
 39f4XSwf70JJkzM2oAyJpKQtDxdtK9rwhZ/ADk+sVMtTIeQVpc0uf9zM67Ery10Kc5fr/xbfhDOMK
 rTYze0STkmefZ16CNJUfGi1M2YA4l26XqZNktPoVhOWVPrXPIsxf6VlEwOFoBf37mmBsxTUXc/1KQ
 IIz82m8x9g6WwWgWE1wVLroTf0nTcfzHT59v42TlSzW6gh6dZuuMo+fHLaqMVptdTfodG3jXB2oSA
 cJSdzYbntCWV+AWrXzfhmA3W4PqaIu/OsZ9XEhdBuA3j1EoOwlC/gqf9GJcmdnt0xJU8sM4R2jbKs
 OKUjh1WBMitdhcHfdlXmUi3I8C/Hso7Ufi9CZcggJTtWKWpQ7ij2GOxs5FqhFhu6xFIblSH54sYWD
 bE15pfUB7VTtWFIZ/nBGa04+;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j2imc-0004Qs-CK; Fri, 14 Feb 2020 21:45:59 +0000
Message-ID: <d5ecfe8e74ddd8d62ef76203fd8784d3cd7aee5e.camel@samba.org>
Subject: too many layers in selftest
To: Jeremy Allison <jra@samba.org>
Date: Sat, 15 Feb 2020 10:45:54 +1300
In-Reply-To: <20200214210210.GB56355@jra4>
References: <1f5483b6c7349f261b79990f3daea501d7636ffe.camel@samba.org>
 <20200214205049.GA51881@jra4>
 <ffbb3c2912a79ca4c32232280b0ce689597aa99c.camel@samba.org>
 <20200214210210.GB56355@jra4>
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

On Fri, 2020-02-14 at 13:02 -0800, Jeremy Allison via samba-technical
wrote:
> On Sat, Feb 15, 2020 at 09:57:58AM +1300, Andrew Bartlett wrote:
> > On Fri, 2020-02-14 at 12:50 -0800, Jeremy Allison wrote:
> > > keep getting (for example):
> > > 
> > > https://gitlab.com/samba-team/devel/samba/-/jobs/438181318
> > > 
> > > Failed to start up environment 'ad_member' at /tmp/samba-testbase/b21/samba-admem/selftest/target/Samba.pm line 125.
> > > 7206 samba can't start up known environment 'ad_member' at /tmp/samba-testbase/b21/samba-admem/selftest/selftest.pl line 840.
> > > 7207 ==> /builds/samba-team/devel/samba/samba-admem.stdout <==
> > > 7208 [1(0)/138 at 0s] samba.tests.pam_winbind(local+krb5)(ad_member)
> > > 7209 ERROR: Testsuite[samba.tests.pam_winbind(local+krb5)(ad_member)]
> > > 7210 REASON: unable to set up environment ad_member - exiting
> > > 
> > > The code changes I'm making (DFS/VFS stuff) aren't anything
> > > to do with this.
> > > 
> > > Any ideas on what might be going wrong ?
> > 
> > I'm pretty sure it is your changes.  This looks generic enough to
> > reproduce locally, so try that to get good logs. 
> > 
> > make test FAIL_IMMEDIATELY=1 TESTS='--include-env=ad_member --include-env=ad_member_idmap_rid --include-env=ad_member_idmap_ad --include-env=ad_member_rfc2307'
> > 
> > It does say this a lot earlier, which does look like DFS/VFS stuff:
> > 
> > checking for winbindd
> > wait for smbd
> > tree connect failed: NT_STATUS_CONNECTION_DISCONNECTED
> > tree connect failed: NT_STATUS_CONNECTION_DISCONNECTED
> > tree connect failed: NT_STATUS_CONNECTION_DISCONNECTED
> > 
> > Sorry,
> 
> Don't be sorry, that's really helpful info to help
> track stuff down - thanks ! :-).
> 
> The way the test environments are set up and
> invoked is still a mystery to me unfortunately :-(.

There are two many layers:
 - GitLab CI
 - The bootstrap docker image
 - autobuild.py
 - make test (selftest/wscript)
 - selftest.pl
 - selftest/targets/Samba*.pm
 - selftest/*/tests.py

We got to this because each layer was added without harming the layers
below, because incremental change is how we do things in Samba.  But we
have built quite the contraption!

It would involve a closer commitment to GitLab CI (which might not be
popular this week), but long term we could bid autobuild.py a fond
farewell and distribute the data it contains between .gitlab-ci.yml
(which also does the task of running scripts in order) and selftest
(which could be told about which environments run in which job). 

Andrew Bartlett

-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba




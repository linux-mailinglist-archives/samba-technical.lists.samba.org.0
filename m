Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7170715F86D
	for <lists+samba-technical@lfdr.de>; Fri, 14 Feb 2020 22:06:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=DakOQq6EyaABKgbNRl8SizrTrah5Xs/2l79qvaN+YRE=; b=F+GcJNVFj6G8J1x/D3M8D1sSqU
	x82M5JCpdJ0Iq0L9p+s6MXcdC6PHooraRNlnjDy4EfRfjzmLfITMlRRi3vdE7rImsn6ynNKjYGi+f
	d0ULMEEW6VIvBAPnLV/WcPzuzKZ5j5iOyq/oUMJUEWULgWXXqRiwTQ18vY3e0EdWrLTLq+gUm/GAX
	z3iAPOYDeMZ/RlfaZMSquvH1SA7Otp5ZlKuf/iNCTECNhJkqnE9ZT8G7Kx7XYF4P3wchDutlB7LdG
	Ybm5X9pZeiT5rs8E9GAU3gfZpEiA++tmuyX1H7mkJLFOqM/ibjYY0LWBayOlOk5OH7BoRuRZhNJSu
	NJAItqlA==;
Received: from localhost ([::1]:50508 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j2iAK-009xRI-9q; Fri, 14 Feb 2020 21:06:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29032) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j2iAE-009xRB-SB
 for samba-technical@lists.samba.org; Fri, 14 Feb 2020 21:06:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=DakOQq6EyaABKgbNRl8SizrTrah5Xs/2l79qvaN+YRE=; b=Qdq4ZtYEDp5AP0TDXgBIajfXnq
 ZlR6I1pRj0svsxu6RL4Om50gavvnUJ+VCply5//DrUWzUYau7xwl702mV1FhltDqIcTSANQ1c5v/Y
 9AtG88V4KOjBT7WSU0prBqjY107l1Yw24Ckk1ySvQX+2Qi4QeHHvA1XzDdO5ge53eqnfDqQb7OzvD
 Ny4TEKDDGyCO291ODJU9ZMVrfJ895i4cf1cLDwD7iY8zAV2ZOIAQl8jDoo4QvjIoSvTakchnyiPcd
 advGzMH//3IpixbnqkOqC3jVM4I60A9qrtBKPi5Yvw8Ru79AUE6mix3CdpS4XzX9ZyYTwXc427HSt
 n4tLvisvWlvAyQfhqz8c2bIHnXUa3ilkLQsyH+8MGLctjiCHiKgJpbnfm35QW7fpnQMF6cIvEg2N/
 A/xEv10FhjncP/FJKtahaAjSCAJQ8ib72HFD1hJ03cc0qN5WXwuZgfTNZkCfHm8aeIg+LAT1fWCkx
 8VIBC5mrREMCzCamuhwbxfaC;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j2iAE-0004C2-20; Fri, 14 Feb 2020 21:06:18 +0000
Date: Fri, 14 Feb 2020 13:06:15 -0800
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: DFS/VFS failures in GitLab CI
Message-ID: <20200214210615.GC56355@jra4>
References: <1f5483b6c7349f261b79990f3daea501d7636ffe.camel@samba.org>
 <20200214205049.GA51881@jra4>
 <ffbb3c2912a79ca4c32232280b0ce689597aa99c.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ffbb3c2912a79ca4c32232280b0ce689597aa99c.camel@samba.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, Feb 15, 2020 at 09:57:58AM +1300, Andrew Bartlett wrote:
> On Fri, 2020-02-14 at 12:50 -0800, Jeremy Allison wrote:
> > keep getting (for example):
> > 
> > https://gitlab.com/samba-team/devel/samba/-/jobs/438181318
> > 
> > Failed to start up environment 'ad_member' at /tmp/samba-testbase/b21/samba-admem/selftest/target/Samba.pm line 125.
> > 7206 samba can't start up known environment 'ad_member' at /tmp/samba-testbase/b21/samba-admem/selftest/selftest.pl line 840.
> > 7207 ==> /builds/samba-team/devel/samba/samba-admem.stdout <==
> > 7208 [1(0)/138 at 0s] samba.tests.pam_winbind(local+krb5)(ad_member)
> > 7209 ERROR: Testsuite[samba.tests.pam_winbind(local+krb5)(ad_member)]
> > 7210 REASON: unable to set up environment ad_member - exiting
> > 
> > The code changes I'm making (DFS/VFS stuff) aren't anything
> > to do with this.
> > 
> > Any ideas on what might be going wrong ?
> 
> I'm pretty sure it is your changes.  This looks generic enough to
> reproduce locally, so try that to get good logs. 
> 
> make test FAIL_IMMEDIATELY=1 TESTS='--include-env=ad_member --include-env=ad_member_idmap_rid --include-env=ad_member_idmap_ad --include-env=ad_member_rfc2307'
> 
> It does say this a lot earlier, which does look like DFS/VFS stuff:
> 
> checking for winbindd
> wait for smbd
> tree connect failed: NT_STATUS_CONNECTION_DISCONNECTED
> tree connect failed: NT_STATUS_CONNECTION_DISCONNECTED
> tree connect failed: NT_STATUS_CONNECTION_DISCONNECTED
> 
> Sorry,

Found it. Easy when you know how :-) :-).

Thanks a *LOT* for that hint !


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F4A4F936D
	for <lists+samba-technical@lfdr.de>; Fri,  8 Apr 2022 13:00:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=BRzMH9qzfq3m2DMpP0VDam3FVfzH1sD7oto8BxpREac=; b=c7S4bu3pZBIzeJdVUnergnkTZc
	YLUmQCKQibq3eVMgobu+rt/a6c6cGjFMceiKBlmaVcj4q8iv3Xzu16dl6Q9RrpdbXNvhzfdQ8m84N
	K5v+IKTGVdKBaa8Yb7H55hfY32L1r47jQIvisBKKQvkvXG4upIo6kk6owGexlSA5JwUUUfTJNijQk
	K3555flXQcCJTU0c65iQP2mGEhEy4HcPNtUlm1ELsynmt9YVhlt6e1rPemIfaYiapbZUCCgJI6hYv
	WMDkNhYAB+tYy4MPENnmr2jexJGRVFyNIj5c3uE6h2jNH9mYEADNEtfGV95jkTZ76pAK6YtHUWwWS
	/EdBy0bQ==;
Received: from ip6-localhost ([::1]:65010 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ncmLV-00B7fd-3Z; Fri, 08 Apr 2022 11:00:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38260) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ncmLQ-00B7fU-3y
 for samba-technical@lists.samba.org; Fri, 08 Apr 2022 11:00:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=BRzMH9qzfq3m2DMpP0VDam3FVfzH1sD7oto8BxpREac=; b=ax8IoEv5f55PbdHiDmwRG5rHSn
 h70zYPAjTw0j2OzXHiKwGCFcFOayf9MqcN5pTK0jIHMTY/Vg7FhKsH+c1HQj15kvgI6Zm3aXC9YTU
 SG4iaT7cX+VA1W2+QO0Hi2e7l0oWRFXedq4xNvxCFS/aCRJ9Twc4BvRD8B63rVSJ9b55VnljT+7TS
 OY8iXOQKoiqClHH5ZzijO6dDZkROoqnTuPelAs9vp5Bnk/uWBTEkSZtTI8QzuW+WOTbWgsHaROzLe
 ZiSHqMM+BzgDzA4KuQIcE90dIrY9EkI7XqdX6GcNg8NwR+5NXATN+53I8EzJMuq+r+Mcn3ShpnqCY
 3EMcXx2Umjn20eRRTTT7rdvzR4h3tyZPWvW11iseRglHqEesz/C/Agnu3vfBVnQqqKZJqsaEoH4hA
 sCe7jqI6LUOEQvj5/2/0tWw/JbJdNlMQj2GeFEyu4/cDbYLhOOkkhM8gnFDHq9sKX6ehG/sq1sJfU
 CSXSuc419nO5v/RqGOfHNaIh;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ncmLO-0060hR-LL; Fri, 08 Apr 2022 10:59:59 +0000
Message-ID: <b96e3d94078ce9751af25856e2be985951c384c1.camel@samba.org>
Subject: Re: downstream packaging of smbtorture and other testing tools
To: Michael Tokarev <mjt@tls.msk.ru>, samba-technical
 <samba-technical@lists.samba.org>
Date: Fri, 08 Apr 2022 22:59:55 +1200
In-Reply-To: <237b5bea-9cf2-6f77-211d-908810d97953@msgid.tls.msk.ru>
References: <237b5bea-9cf2-6f77-211d-908810d97953@msgid.tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35) 
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

On Fri, 2022-04-08 at 11:25 +0300, Michael Tokarev via samba-technical
wrote:
> Hi!
> 
> In Debian, for a long time we ship samba-testsuite package which includes
> smbtorture binary (the main part) and a few other similar tools, --
> gentest locktest masktest ndrdump.  Apparently fedora/redhat also ships
> a similar package.
> 
> I found no good usage examples for these (smbtorture manpage does not
> make it clearly), so I asked a (seemingly simple) question about what
> it is and how to use it.

I find the ratio between samba and samba-testsuite enlightening.  I'm
also pretty sure the 500 users who have installed it just installed
everything samba-*.

https://qa.debian.org/popcon-graph.php?packages=samba-testsuite+samba&show_installed=on&want_legend=on&want_ticks=on&from_date=&to_date=&hlght_date=&date_fmt=%25Y-%25m&beenhere=1

> Is this tool set useful for a linux distribution somehow?  Or maybe it
> should be built in -enable-selftest mode only, for internal usage?

That is my suggestion, but I would love to hear from the RH folks about
their use of the samba-test package.

Andrew Bartlett


-- 
Andrew Bartlett (he/him)        https://samba.org/~abartlet/
Samba Team Member (since 2001)  https://samba.org
Samba Developer, Catalyst IT    https://catalyst.net.nz/services/samba



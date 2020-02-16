Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DC15216015F
	for <lists+samba-technical@lfdr.de>; Sun, 16 Feb 2020 02:33:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=JS6jJCJeTQ6vSCqLJCcOpp11D1m1PUDV6Kn7oSS9IfU=; b=aBXc/euUgWUjHXWFTtLj/QknBU
	Hmd+5lmQ88+ocQAogQWbITbEJJZ8Vnqb8wvwEMFXCjTZerjy5Ldv4shIPtHV4ICBKXixVGdeeKqXf
	asdHw0lfAu477RD7KvTvF7A47iDQ5zYx9HStRv+ZK1MnaDiHID0lPAit0KsqNZhGzBa8TXp2cl/nB
	KHdlcNbbGhYfwDAQk2o0iWv9T3kbE7XY1U82SuUGbw2IFxZrqOMgHUL2rONSD8G97E5zInf+VLAcZ
	s5OOcizQ2EaRFzi7tT6sgNXHDWDMGg+BETod2DXysJ6RIq/lLasd3XzxuD5OFi1h5BdjMkI/8LKR6
	yDE9VEzw==;
Received: from localhost ([::1]:38486 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j38nC-00A3sq-SG; Sun, 16 Feb 2020 01:32:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10754) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j38n1-00A3sj-O1
 for samba-technical@lists.samba.org; Sun, 16 Feb 2020 01:32:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=JS6jJCJeTQ6vSCqLJCcOpp11D1m1PUDV6Kn7oSS9IfU=; b=KRBiHW70JACce7ni36ToVSXIME
 7s3h33uIR/GM3paQg5fDcA9wWRUCrThh6j7Y/sZMMcSnW1YHidfsUT10a7D3u5WQQElazRNJL5RRK
 rOFtiIdPHXztz+PEfkj17Cw2vL5wIoYSMAlDX1vEY5bcft8eSQ1upC/y133ZsKr3KDTKoeY4EY8q0
 BrDifUVSrefUY8/gtk/CqX3k1zZHcjhgXthFVi9nja+XWzwsi0RgKVHfKmxBcLX6214SGNP5KDNrD
 8swAXVawk7FRKu4CpwFdggpELVi1ZlAVb7v9CbgJhfzuPiZKKZKgT35xDxZhmGsDQ4p3vbbN7BT77
 2Lc9IxoIWNY9jEc7BBc0nKJakxQhYoyRiemWCz5D07LmaMm4/YtMldAj7AI+6WTz3EIR3M6UVi1EJ
 eOBEfEJYbPRa1rT038sV//wQrOjffWsFYrv5zxnOmhxcBIMPVxPKBmo0+nePQbF7dfmHRhpZlDGFg
 VTHB145QjBGt6N5q2z/jtfBT;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j38mx-0002nV-At; Sun, 16 Feb 2020 01:32:03 +0000
Date: Sat, 15 Feb 2020 17:31:45 -0800
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Subject: Re: too many layers in selftest
Message-ID: <20200216013145.GB13472@jeremy-acer>
References: <1f5483b6c7349f261b79990f3daea501d7636ffe.camel@samba.org>
 <20200214205049.GA51881@jra4>
 <ffbb3c2912a79ca4c32232280b0ce689597aa99c.camel@samba.org>
 <20200214210210.GB56355@jra4>
 <d5ecfe8e74ddd8d62ef76203fd8784d3cd7aee5e.camel@samba.org>
 <7f8c06ad-11f5-52bd-2319-30f2cc081df3@catalyst.net.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f8c06ad-11f5-52bd-2319-30f2cc081df3@catalyst.net.nz>
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, Feb 16, 2020 at 12:10:07PM +1300, Douglas Bagnall wrote:
> On 15/02/20 10:45 am, Andrew Bartlett via samba-technical wrote:
> 
> >> The way the test environments are set up and
> >> invoked is still a mystery to me unfortunately :-(.
> > 
> > There are two many layers:
> >  - GitLab CI
> >  - The bootstrap docker image
> >  - autobuild.py
> >  - make test (selftest/wscript)
> >  - selftest.pl
> >  - selftest/targets/Samba*.pm
> >  - selftest/*/tests.py
> 
> You are forgetting or subsuming format-subunit and filter-subunit.
> 
> Samba's test infrastructure is a psychedelic fractal -- if you
> stare for too long at any part, intricate detail oozes out of the
> cracks.

Hmmm. Does you end up seeing dog faces everywhere in the
code ? That's a strong argument for us living in a simulation :-).


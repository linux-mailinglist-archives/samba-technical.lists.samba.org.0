Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DA17CC21
	for <lists+samba-technical@lfdr.de>; Wed, 31 Jul 2019 20:39:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=kf6lpYnfT1qV8lWoUon8aeSLXYXI6PwUoiDjlM8GNtg=; b=1Q1wlQ/L5G6YJ5qew3ahyKVhcW
	8BoVKi3gM+UYoqVcSvSl4FxHZHGaG7cOPdivhB4hk/ZsK7LXyqPov14reOOtoidvsMwWjtbNB3MBT
	R/AWfZzR2TJcuzVrm5DbgLqWYMU7x0tR80yROaepsYJ69zzO22+nyzLTT4C34VoQ8PNDNrXq8R62H
	4HyapBeVu7PhCqaALeFZxGWQKJvMejRmxt5BV0FayGNfdlfEkiFBHZbVz2SeqL71U3/jrac1AlRYB
	ZqAF6TdyK0B7PPfaB1a3c6czKqSB1uVRmTG5Ulcb9ZaiqdnKh3MOB5Q0o42xONCSLosZrHAV/tuyr
	a4pKbkaA==;
Received: from localhost ([::1]:32144 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hstVI-001akG-IG; Wed, 31 Jul 2019 18:39:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13442) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hstVD-001ak9-RN
 for samba-technical@lists.samba.org; Wed, 31 Jul 2019 18:39:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=kf6lpYnfT1qV8lWoUon8aeSLXYXI6PwUoiDjlM8GNtg=; b=DsreZRuhPtacusFgyLNv60xa/o
 zEX6ylLIq45pi6Gcg8LffWhtXngV/95FOBsWkAxzR8iQzw5wRP9OuL5ImK32s7p9mK6SdFyJtumC7
 O6ngYf3YRB3OWAcFLRHdVWMsS/wBWyjQ2vVYcjvY8k4aO5NbRxZ8x07AwuR/wFdbusoE=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hstVC-0003jB-Ob; Wed, 31 Jul 2019 18:39:07 +0000
Date: Wed, 31 Jul 2019 11:39:04 -0700
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Require GnuTLS 3.4.7 for Samba 4.12 in March 2020?
Message-ID: <20190731183904.GF234347@jra4>
References: <1564547155.4261.48.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1564547155.4261.48.camel@samba.org>
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
Cc: asn@samba.org,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Jul 31, 2019 at 04:25:55PM +1200, Andrew Bartlett via samba-technical wrote:
> I'm reviewing "Use GnuTLS AES ciphers if supported by the installed
> GnuTLS version" for Andreas.
> 
> https://gitlab.com/samba-team/samba/merge_requests/669
> 
> The one thing I really don't like is the #ifdef on HAVE_GNUTLS_AEAD.  I
> would prefer we just chose to rely on GnuTLS. [1]
> 
> Duplicated code is bad, duplicated crypto code is particularly bad and
> I would really like to remove our existing duplicates rather than add
> more.  
> 
> Not only are we short on maintainece resources, we would also need to
> restructure our testuite to force a non-GnuTLS build to ensure we
> actually test this at all. 
> 
> In doing so I know many folks really like running current Samba (both
> as an AD DC and fileserver) on older enterprise distributions. 
> 
> In this case, RHEL 8, Ubuntu 16.04 and current debian stable 
> all have GnuTLS versions later than 3.4.7.
> 
> So, what do folks think?  This would be for Samba 4.12 to be released
> in March 2020.
> 
> To see how much can be removed, I'm exploring the idea in this WIP MR:
> https://gitlab.com/samba-team/samba/merge_requests/676
> 
> Note, for CentOS 7 and earlier it may be possible to use
> https://github.com/nkadel/compat-gnutls34-3.x-srpm
> 
> Andrew Bartlett
> 
> [1] Sadly we couldn't totally remove the Samba AES code, as SMB 2.24
> requires AES-CMAC-128, but the impact would be far more constrained.

+1 from me. Moving to fewer Samba-supported crypto implementations
is a big win for long-term security and maintainability IMHO.

Jeremy.


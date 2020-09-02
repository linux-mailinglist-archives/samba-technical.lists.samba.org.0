Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CE625B5BC
	for <lists+samba-technical@lfdr.de>; Wed,  2 Sep 2020 23:17:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=iJKyYZ7chGgfQQXkL6cDhzOfGZP9UgTokK+mSyVJbeg=; b=dPEwavaDQare7KRbSvUjBvlMcw
	0e2clyZAsk96fFSoOSsN9giPScAi1G51Y1tCi8G9RlhNFY7vjHzQ6VGzn1pLolIX480MMQR0GVXZO
	wS67GNEsRxxAQVW9YXisIPrkwUlDKdCFmI73INrCajqAttAcTGbhczKKQcxfD0bIKSb4vT6FC4waB
	yeDPyrfQkHt00HLiR0PNZdPT02r4IE501DQicAo7NDQUf4bGPjJRzGPCWcBiOwUfR4KSdK2jfouX/
	BMDDnVQH00hnOYD0FxYARIcdRqbpbZ5qAfo+SMgVz0v+7o070bkdJ7tRU2gxfvF0cua4+JO6AyoKh
	8/s5jPuA==;
Received: from localhost ([::1]:54026 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kDa7i-003dSF-Ss; Wed, 02 Sep 2020 21:16:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15938) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kDa7e-003dS8-V6
 for samba-technical@lists.samba.org; Wed, 02 Sep 2020 21:16:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=iJKyYZ7chGgfQQXkL6cDhzOfGZP9UgTokK+mSyVJbeg=; b=hrDyUbfpVuVHbbDNFNmvDsC1JI
 bEHpYb2luEOSkUW8Zj6HK/LKTBfbs9EkmamYHLSBUqmcSJElXihfytsysucHXtff72NdwuXQe+WGj
 NHf4Mqw62f1dISQBXcPRfbCMSmHMPO2OwAYdtashvvtJq5ysAR8VeOJzUBEsLLH1s37d+1D+zYlVM
 +gRWFX5drm+wcPIW4pdvkZ60K/EIfslmo+g1n/kDcW7DZ7loJCWuf900MHXzk8o/Gwmi7PQ/o14nr
 xR7xtwZQylvQCZSYCg9wjhYftE4U7cigJADZ26uo6vvwkR5CcGOphZdFQbA30+7yMmzFtnOB5e6gh
 VEPiUbhBTCCXgvvTm4isgiD6N2e13Bbjdr86nUY4ELFWKoM0HbUq3wsciXP4mit4LHl6BBoSCaWEK
 4h093z2tshCHqzyfxTK36N5sz8wlNEAAJj2QUMmWZs57/pnFE481CermNcus/HLetaoBc+2cq7KE0
 KLMXjJzZosAua7SzEZs8IfcI;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kDa7e-0007VJ-2X; Wed, 02 Sep 2020 21:16:50 +0000
Date: Wed, 2 Sep 2020 14:16:44 -0700
To: Tom Talpey <tom@talpey.com>
Subject: Re: Directory Leasing feature in Samba smbd
Message-ID: <20200902211644.GF26967@jeremy-acer>
References: <20BEBF93-262E-4877-B659-AFA0BC9C932E@storagecraft.com>
 <20200826173216.GC16382@jeremy-acer>
 <AE3B2AEB-2208-4840-B88F-103DEF54BFA6@storagecraft.com>
 <20200902192054.GD26967@jeremy-acer>
 <52d72e81-a811-3297-2e35-0556e3ab3673@talpey.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52d72e81-a811-3297-2e35-0556e3ab3673@talpey.com>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Sep 02, 2020 at 04:27:54PM -0400, Tom Talpey via samba-technical wrote:
> On 9/2/2020 3:20 PM, Jeremy Allison via samba-technical wrote:
> > On Wed, Sep 02, 2020 at 05:18:05PM +0000, Krishna Harathi wrote:
> > > Jeremy,
> > > 
> > > Thanks for the insightful response on how to start on directory leasing feature.
> > > 
> > > After reading more into Microsoft SMB2/3 directory leasing, in our customer case, looks like the windows client is taking advantage of the granted directory lease and maintaining a directory cache.
> > > 
> > > I am attempting to setup the following even before writing test cases.
> > > 
> > >    1. Using directory lease capable Windows Server 2012R2 (or later), setup a shared folder/directory with a set of files/folders in it.
> > >    2. On a Windows client capable of using directory lease , map the shared folder to a local drive letter.
> > >    3.  Start capturing tcpip packets on either client or server.
> > >    4. Browse the shared folder on the client multiple times.
> > >    5. The tcpip dump should show only a single directory scan set (SMB2_FIND_BOTH_DIRECTORY_INFO requests/responses)
> > > 
> > > Is my assumption and approach correct? Is there a better/direct way to monitor the directory lease and cache in the client?
> > > 
> > > Only information I found on Windows is the global configuration values of "DirectoryCacheEntriesMax" and "DirectoryCacheEntrySizeMax" shown with powershell "get-smbclientconfiguration". Are there any stats to monitor to determine that the directory cache is active with entries from the mapped drive that has the directory leased?
> > > 
> > > Once this setup is done and confirmed working, I will have a better understanding on what to expect and I will start adding test cases to smb torture.
> > 
> > Hi Krishna,
> > 
> > That would seem to be a good way to explore
> > how the Windows client behaves. I don't have
> > good insights into how the Windows client
> > manages its cache I'm afraid.
> 
> I think it's a very risky thing to assert that any particular caching
> occurs. There is no protocol requirement for caching, so the behavior
> of the client is purely an implementation choice.
> 
> It's great to explore but "adding test cases to smb torture" is my
> concern. What kind of test cases?

The same kind of test cases we used to determine the behavior
of leases on files.

a). Open a directory with lease, different varients of RWH etc.
b). Try opening a directory with an oplock (does that work?)
c). Try creating a file in the directory via a second connection,
watch for the break traffic on the handle etc.

We're not planning to test the client caching, as you say that's
a client policy decision.


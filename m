Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2F8F22CD
	for <lists+samba-technical@lfdr.de>; Thu,  7 Nov 2019 00:47:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=QecUKOOS24TrjseZOlB+r/BVajGMqFzDoIsCdDEeOpo=; b=zQDV+QAxkeRey+qf8MTqqc5JoU
	DFKBx991K2ci19kAogwyxRBqseM2bj/oXXRwBSnxhjq5zbIXDT7rBmvvZc6oCttYH9QPpC/h1ifZ+
	RCsrS95rTpinz6E5igYJZyhO2yUP84KZv+dTbfFAkyNGKRvmEvc5xzQFGvR7UuQelCIX5yxhFdPNt
	lGWV7TWPZFWPIsbaNDPcMFYV1W7U8p9Ppwuez8FC5hbz7Aht9npBdJmRacBp+R4X8LdZ6JuMnTEsP
	zxS6bF/OhFK4wyDHBHtY2+M5Sa/rJoUP4QmqjA6SBT/A+PPvhuNFsyW5oALTcrkkuGB6uP1Gj8EnM
	1x9k1Y7g==;
Received: from localhost ([::1]:23518 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iSV0Q-007Bkk-0u; Wed, 06 Nov 2019 23:46:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58796) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iSV0M-007Bkd-1B
 for samba-technical@lists.samba.org; Wed, 06 Nov 2019 23:46:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=QecUKOOS24TrjseZOlB+r/BVajGMqFzDoIsCdDEeOpo=; b=QdS2ysGBYYFzqXBOHW+JjwBNY/
 1cfz5hasO3kURYAaui1Du3wlNUI+wvMa+/O+WJrebbqpymzira1ykEuMPuq/8u/LLnrigXd58Cmkd
 VS8ZQWSnxhJxsGfr2FUnWnQg7HXHL/v3U4Mzdtp92imzvWn+YpWPWxBRZz7i/fJja+zqwla8ZlwIu
 jMy2NYrHpEo/v0ZY63SKzjBc9bpUJ4how+ibF3SIyR1S4984YyoqpmsD1ojE/kRBI0oyUhgQUqxMb
 kvPbcjJwOfwlVbXi5tflggipdQBgqINqyajmosCMRSSoO2pL+8bI1HO7UQ1q1gMtyQJeUexwLLit9
 DA8FKXCVYOKPTmF+vQRAG9Cqsl7RqDV07OHVObOd2v8guvZUVQNkyTtPw5ESUZFkJdea2FJ96DfF8
 TCt46/btgJNR5gi0SrxmMudAdr/YCRhohfKucTPEf8XMBBWnMwxKziplEDoY8tMuoynhnSdaFY0yM
 TYqM7dnnQkXgsIVLMWgIkYu9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iSV0J-0002iu-2S; Wed, 06 Nov 2019 23:46:23 +0000
Date: Wed, 6 Nov 2019 16:46:19 -0700
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: bootstrap: Fix centos7 image creation
Message-ID: <20191106234619.GA21747@samba.org>
References: <20191106133603.2F5431404C0@sn.samba.org>
 <343cb710c4bb9936e0d6c75f82c81ab0f3d35bf9.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <343cb710c4bb9936e0d6c75f82c81ab0f3d35bf9.camel@samba.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
From: Christof Schmitt via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christof Schmitt <cs@samba.org>
Cc: asn@samba.org, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Nov 07, 2019 at 06:34:38AM +1300, Andrew Bartlett wrote:
> On Wed, 2019-11-06 at 14:36 +0100, Andreas Schneider wrote:
> > The branch, master has been updated
> >        via  35bb734d638 bootstrap: Fix centos7 image creation
> >        via  6a3b19fb170 bootstrap: Add Fedora 31
> >        via  1ba0a32e707 bootstrap: Remove Fedora 28 which is already EOL
> >       from  bf99f820778 ctdb-tests: Make process exists test more resilient
> > 
> > https://git.samba.org/?p=samba.git;a=shortlog;h=master
> > 
> > 
> > - Log -----------------------------------------------------------------
> > commit 35bb734d638e273f2fd1a19220db5f200d3e7489
> > Author: Andreas Schneider <asn@samba.org>
> > Date:   Wed Nov 6 08:43:05 2019 +0100
> > 
> >     bootstrap: Fix centos7 image creation
> >     
> >     Signed-off-by: Andreas Schneider <asn@samba.org>
> >     Reviewed-by: Alexander Bokovoy <ab@samba.org>
> >     
> >     Autobuild-User(master): Andreas Schneider <asn@cryptomilk.org>
> >     Autobuild-Date(master): Wed Nov  6 13:35:17 UTC 2019 on sn-devel-184
> 
> G'Day Andreas,
> 
> I actually think we should remove nettle entirely, it is incorrectly
> listed as a dependency.  It came about due to some work we did for the
> encrypted passwords support (which metze then changed to use our
> internal AES, now removed in favour of pure GnuTLS).  
> 
> I picked this this when Christof proposed the same patch here:
> https://gitlab.com/samba-team/samba/merge_requests/875#note_239077036
> 
> He was able to successfully drop the nettle dep.
> 
> Sadly he had trouble with the ktest environment I also asked him to add
> so it hasn't merged yet. 

Yes, i can confirm that nettle-dev can be removed, as it will be pulled
in as a gnutls dependency. I just got distracted by customer work and
still need to debug the ktest issue.

Christof


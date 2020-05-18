Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0C01D8AFE
	for <lists+samba-technical@lfdr.de>; Tue, 19 May 2020 00:34:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=fiFweYXfck471QFWpGmONV7H2jiGcUEd8IhSuASMbDE=; b=IL83v7qXM4XoOKNjggWKORx6Z7
	U2o+7iRRG3iYAwBsU6KU4qKeX6ZLWmT1TEj8PytDY4/XZRdtS9VTtBkbfVZNvAcOSBPbur0aq6AcM
	ZbDFyKPWiDatwvJIXxB+gSIc2rxTg+EI1Q/WnA7tV9DWHX9vavikTdeFpfMKLJ/8EA1lg4oAZ8M2Z
	6pi9KunGw09seB30XHFGEO3KQmRck222yswLqfZti0Saj8F1VVv3/IJWGF+N36g6ivMj8Stk7wQZn
	s7REPRzd/04aVrxdRge+lKZMg4xCMf3QTyn1JKS1rV6OHlWPDfg/szJLSiqwtHYnTmpmS6dOewU63
	29tmTxEw==;
Received: from localhost ([::1]:52408 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jaoLE-0052A8-Kh; Mon, 18 May 2020 22:34:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41624) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jaoL4-0052A1-3A
 for samba-technical@lists.samba.org; Mon, 18 May 2020 22:34:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=fiFweYXfck471QFWpGmONV7H2jiGcUEd8IhSuASMbDE=; b=Nmg3lV7mxb6I7IgHxUKSAVPeWc
 0MuKKYNWSk2VQON/6eD6sEZ59rPIBgsug+Kdk7Ir1DiYxlAyqAZUlW9Uuy/2+5/DPkeu/kytD0eBb
 aHZ5fvlAdtCmBh+36GPSoPcGtJjMPHMUjGS9Xa6egaqWiUISdRcw8WYJ60Pshr4A5dgi/xW4NpM4v
 AlhWXXkG7h/4/tU7CxwuDEu/rKJ2EpfRgnDOhaFuKXxsHsPCtt8/by/SWEa9uee1C4OEb2NlAvkBq
 puTsEm2TntfOMnACJN1mkik0I4J3uy8trmMPZHPVFShLnfT1wfv/nouhiJjOPFsjXB8E9gSGy83GP
 ywfVgi50AzVX8we9D4gSqvGIDbQruRYteCrn/nWYGeHOeXNus2dBYr2+0yiCsoeBkmVuPfXyLexH5
 zfaqTp3Yr7OW8uMh+Dqe6UqFuVrkuERHdM0NRjkILVCECVyESEenUgQSQT4wJtijLBmUcLIsUCjQT
 cO/DdXIyu90vJHDOMgcg2huh;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jaoL3-0006d3-5C; Mon, 18 May 2020 22:34:25 +0000
Date: Mon, 18 May 2020 15:34:18 -0700
To: Ralph Boehme <slow@samba.org>
Subject: Re: [PATCH] SMB2 Compound related chain handling when generation of
 FileId has failed
Message-ID: <20200518223418.GG30317@jeremy-acer>
References: <CAGuNez4rgOrtf_jEX1TC-D-bjaFVRr46=WmMi5N1hdqoYBP1ig@mail.gmail.com>
 <2161e53c-ccd5-864c-8b4c-ceeb8cf120ea@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2161e53c-ccd5-864c-8b4c-ceeb8cf120ea@samba.org>
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
Cc: Anubhav Rakshit <anubhav.rakshit@gmail.com>,
 "samba-technical@lists.samba.org \(samba-technical@lists.samba.org\)"
 <samba-technical@lists.samba.org>, hemanth.thummala@nutanix.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, May 18, 2020 at 12:49:35PM +0200, Ralph Boehme via samba-technical wrote:
> Am 5/15/20 um 11:29 PM schrieb Anubhav Rakshit via samba-technical:
> > Please review the following patches.They consist of:
> > 1. Smbtorture test case to verify the expected behaviour in case of
> > Create failure in a compound related chain.
> > 2. Implement the behaviour in Samba Fileserver code.
> > 
> > I have attached the patches.
> > The changes are also staged in github.
> > https://github.com/anubhavrakshit/samba/commit/a0e7d6196b259038342569d371ff67ed30c9b6b8
> > https://github.com/anubhavrakshit/samba/commit/4637b6108f188c1a2df7cce94165b621294942a1
> 
> https://gitlab.com/samba-team/samba/-/merge_requests/1350

FYI. I've pushed a new version here containing the pointer checks,
and the fix for the (actually related :-) compound
test fails.

https://gitlab.com/samba-team/samba/-/merge_requests/1350


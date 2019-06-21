Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3B04ED56
	for <lists+samba-technical@lfdr.de>; Fri, 21 Jun 2019 18:44:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=uDfVC9CXj6To81Md55wNMZz9owH5xvPtd8lzgvHvzRw=; b=SMGzDfmC4xcM3cn8dcfND8APzo
	9lCUclfQyEfUe7KIX/jPiQn9P1g8IAqleEcOhLTaH8wyofkRAfOn80GCyDnX01QTw0M7Kg2xe9Fje
	XnGOKfb0cL/hLgnbZEvwlkYhMinux3sUWpG1aFmGp6E+bv6nlZgadxvGU8/KPPfdJOo5j/I2NlGWG
	XgslDa3MMAtd35pA4+B04DaSPr7UyexPuvXEzRCf1ECQr5ZCmE8ursjN1+9XZW5/ysrFDVYl4EALM
	azJCRxLY8/Uqv8CkXbtSiMMQOWSjCUjMVyZ+EEhA4FOkxwECCflJ9pIKP+Fox2ICSRQEnLywJWtgx
	9AV+9uhQ==;
Received: from localhost ([::1]:35638 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1heMe0-0013jP-A8; Fri, 21 Jun 2019 16:44:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25256) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1heMdw-0013jI-1I
 for samba-technical@lists.samba.org; Fri, 21 Jun 2019 16:44:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=uDfVC9CXj6To81Md55wNMZz9owH5xvPtd8lzgvHvzRw=; b=DIcKZcc+ls6HUxFN6aG0k0DEu1
 QFl3E/bhqMFhBR0Q6tyLYz7t9kWU8hT9P+Mp162iCaN3JvvuSJW7gaIACa2R/MMb3NSnb7ViY5jnR
 3sN7+aqR43NGyMZPtRWCs9CDL+Kyc3/kcradCI1VXVaMFf7oF42T5zKDCyJAhWq8kIgA=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1heMdv-0006fU-0u; Fri, 21 Jun 2019 16:44:03 +0000
Date: Fri, 21 Jun 2019 09:43:58 -0700
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Document GitLab as the only way to contribute to Samba?
Message-ID: <20190621164357.GA10488@samba.org>
References: <1561079117.28284.21.camel@samba.org>
 <20190621111436.342f713e@martins.ozlabs.org>
 <1561082290.28284.28.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1561082290.28284.28.camel@samba.org>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Jun 21, 2019 at 01:58:10PM +1200, Andrew Bartlett via samba-technical wrote:
> Christof,
> 
> You are the other person I still using samba-technical much at all to
> submit patches.  Is there anything I can do to help you make the move
> to GitLab, or is there anything stopping you?
> 
> Thanks,
> 
> Andrew Bartlett
> 
> [1] Attached is the histogram of patches on samba-technical from April
> -> June, for the curious.  

Hi Andrew,

i might have been slow in adapting to gitlab, but my last patches went
only through gitlab. The quicker feedback on the autobuild results and
the verification across different Linux distributions is very helpful.
Right now i don't see a reason not to use gitlab.

Christof


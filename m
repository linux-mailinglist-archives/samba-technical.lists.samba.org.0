Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D664979300B
	for <lists+samba-technical@lfdr.de>; Tue,  5 Sep 2023 22:32:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=9y7FSzkqmh6TXNDiZ6Nwcbui86SU0yOexhVxOFOql4Y=; b=MVGqiiucK9q7d1AnWT8EbxJ5o8
	RrnqYbhPjaJmsU6qNeg1V8QyjguaY2XzovGix/hOMG29rYBzfpR95poIm1WCp1ordPqc3ZCwP0OUB
	owNFq2TsIyHdTc+of2L8uD3ANFn4+qH4AhZFM4+1wLZJV79rW+gr5ZudfZOkg2jvif9NihQpbpnxL
	SgYkL39TQl+yIaS28QWsboTp7A+LHiw4E4rnBFUoN7KKtdntDlpAPyBsBSikDzgiKa7wH/CcISoSe
	1pxBEwE6joB1vfTBOruxRYlqDCP3z/wG/YxhzDdHHADa7kHb5YdC32Ynd9XaxsHUp//YqnajXxdIP
	Hm1AYyEg==;
Received: from ip6-localhost ([::1]:56236 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qdciK-0011qT-80; Tue, 05 Sep 2023 20:31:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44516) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qdciD-0011qJ-Bd
 for samba-technical@lists.samba.org; Tue, 05 Sep 2023 20:31:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=Uuk9/groSwepyZAp1HHTvj+FZPiRDG9KLwxCdP2/fEE=; b=To0kdxIgMnVk+EvCoEwrG6Tfb1
 L4lLm+T5Sfk4HddyHtMH6x3lMCQGE7I57l/LPjmXr4wsJGMixVJ+kUf4K/vquToMDqtgLO8aCML2p
 9f9qYb9mXL+nlwmZFtLJI813FURaKicZJl6BmVsn2bV9ljqdBAJvCOYbVT6RiLHXRTu0vz9ZEEP82
 7PXeTX5KHZGEl26taHNH8ZbjAEL6b+rCPuJrLSE86wmOO8aNNbzm3tWPM9vsXMOIwKBklIFFd4EZ4
 +fswiki+Y/GZDPpASZUO7EiU/TF4pbcO0/2urMhMTBk9cAdjEp3gwFXAR1AdAe5gxE0TemseuelTL
 24NBxkuPMsSGj1lBwHJRXjjuhvfwv0oo1iQinmQ4sytbBIsN3adE5JpsQDOgsHoUvobSlbJc8+pxn
 CV7VIMbTgfqAHi66WgDTLre+w6TvEZiAquUgXiVg9YPuwJ7mRzwAjELoopEKpxc5yP4Xq6CF45USV
 Fp1sutIf0LCvfxN9O27NNVxg;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qdciB-00BxH9-2z; Tue, 05 Sep 2023 20:31:48 +0000
Message-ID: <b82092c20e8946836b382ecf625d8d2af3c0b444.camel@samba.org>
Subject: Re: Failed to join domain with un-interpolated string ...
To: Richard Sharpe <realrichardsharpe@gmail.com>, samba-technical
 <samba-technical@lists.samba.org>
Date: Wed, 06 Sep 2023 08:31:43 +1200
In-Reply-To: <CACyXjPwergRhYMWViO=xH4y8a44BU02PxEd1UEZk-DLm_ZR6qw@mail.gmail.com>
References: <CACyXjPwergRhYMWViO=xH4y8a44BU02PxEd1UEZk-DLm_ZR6qw@mail.gmail.com>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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

On Tue, 2023-09-05 at 10:37 -0700, Richard Sharpe via samba-technical
wrote:
> Hi folks,
> I am seeing the following errors when I inject delays into
> certainSAMR functions during domain join:
> "Failed to join domain: failed to join domain 'test.qa' over
> rpc:{Device Timeout} The specified I/O operation on %hs was not
> completedbefore the time-out period expired."
> However, the '%hs' is not being replaced with an actual message.
> Is this expected?

Yes, this is.  The error strings come from an MS doc, but we don't have
the logic to fill the the format specifiers.
Andrew,

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/Samba Team Member (since 2001) https://samba.orgSamba Team Lead                https://catalyst.net.nz/services/sambaCatalyst.Net Ltd
Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company
Samba Development and Support: https://catalyst.net.nz/services/samba
Catalyst IT - Expert Open Source Solutions

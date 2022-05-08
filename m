Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB1951F1AE
	for <lists+samba-technical@lfdr.de>; Sun,  8 May 2022 22:46:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=/FGZR/dGHZx297fn10r4QZcUv8M/2kC3i2sSp5bD+lA=; b=TYFCkUI0kKQI5yocXAF/YDs7i2
	dSvZH6GCayo1ThEMro+/swbSi10aup2AFaNxPMxpp7ZkbKy3uB1R8qE0Bxvy9Gg87XorraC5ocwdh
	CQDpIA7sz1SW6pJ1ACFpH936Pc+TOH5Sh374HnznFXvmrV9dGtNa9/fgnGYVf+J7K6mi3jUf4RoL3
	RNjEhcm8xiD26F1LJugHvWr8DUxfPCvNbvPcrjIEmy9QYWlX7SOhqXNCSqr2rnOQx/R3mDbyLM+q4
	bT1UfJ6e2WljGqZpgE6PpRZTBOp1DBk/pGqsVJzViNFWyM7UtuXg6YAjbyR1cxKdSVWD7DAWE/9bj
	5OBPZFTg==;
Received: from ip6-localhost ([::1]:27214 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nnnlq-006oVt-KJ; Sun, 08 May 2022 20:44:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27698) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nnnli-006oVk-35
 for samba-technical@lists.samba.org; Sun, 08 May 2022 20:44:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=/FGZR/dGHZx297fn10r4QZcUv8M/2kC3i2sSp5bD+lA=; b=pjqvQw1PttBTobiUHc3aBkvDir
 06WqiSBpz71BiM4sldoAcu5kJGQ/0xTDuK1LNuzkCVpX0ur4MA6XtyQEQfTJq7N+c3uRiV47b5mXQ
 WfcbAq9WlyHRxSmxvXSJpj5P4lIcvy6WiWDu/+pzXvdg3J1PEnhVq8ubjZ5XcppfWdZNbuNsHrSx5
 fBlq4u+SViI5Iw8ZHtcwc8Qi62c9XZnYT2r04zjylixt8w30rRFJTFAe56Nq9K3Teca7cgyMsTKmZ
 RSbjb/VY3G1pQutcdReNX/tUSxK6yV6An5MwfhR2oS8v5oMqdyDXESPRNjk/rJpY0UHjvFOC2s2DK
 qZcRfQl0GGrHT3wv0BQcpVYo9t8VAPveCdFGZEe9BJJdqU/mkB0sjxRLx0/T38gYEYlZ9cTof20o6
 wDC0JpYzr1/SpjtsJ+XB9Z5QvLEcaI1OaBPq9Sk9kcS3OPci7kNfRJRh+ZteB1PH7Lem7NiM8+Zyk
 abKa3SVTLpEJj5dpt23STJeg;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nnnlg-004xxr-CQ; Sun, 08 May 2022 20:44:41 +0000
Message-ID: <03188a6319e0a0049e1c75ac5603fee43fbbfdb0.camel@samba.org>
Subject: Re: submitting a fix/patch
To: Michael Tokarev <mjt@tls.msk.ru>, samba-technical
 <samba-technical@lists.samba.org>
Date: Mon, 09 May 2022 08:44:36 +1200
In-Reply-To: <93ff600b-e2e5-1bb1-7f7d-e32ed4cda438@msgid.tls.msk.ru>
References: <93ff600b-e2e5-1bb1-7f7d-e32ed4cda438@msgid.tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
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

On Fri, 2022-04-01 at 21:23 +0300, Michael Tokarev via samba-technical
wrote:
> Hi.
> 
> Samba wiki describes how to submit a patch to samba,
> and it shows gitlab way of doing things. Is it the
> only way? I mean, for small things like spelling
> fixes, one-liners, is it really necessary to create
> a gitlab account?
> 
> I created a bug, https://bugzilla.samba.org/show_bug.cgi?id=15039 ,
> with a patch in it, - should I create a gitlab account
> instead and send an MR as outlined in the wiki?
> 
> I really hate creating accounts everywhere just for
> some small things. I already have 3 accounts on
> samba (wiki, bugzilla and mailman), - thought it
> will be enough, - but it was before I read the
> "contributing" page...

I had hoped our Contribute page was clear enough on this point, but I'm
more than happy to expand on it.

The bit you ask about is here, at the bottom:
https://wiki.samba.org/index.php/Contribute#Mailing_patches_to_samba-technical

In short, patches here and in Bugzilla get lost, whereas a number of
developers keep an active watch on outstanding MRs at 
https://gitlab.com/samba-team/samba/-/merge_requests/

I hope this clarifies things,

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions



Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 318D95420D2
	for <lists+samba-technical@lfdr.de>; Wed,  8 Jun 2022 05:24:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=HnvTyM7qYnQVks1+jysJ0AuMHo4SnF9NcvFKqBTv6z8=; b=ga04S2jR45bbpJ9YXBuYP1Gc29
	S4ZupGezd/MIzFpZ2kKoTllniAivgqk19gupSKQ/6MX9tJFg1B3kiDVTQjh2dixJHozv2mw1TwvdT
	Xfa2B0gifuKggFsMyzJLMvb5T6NPLCcjoqxuTLVFTbv4qftgbdwzWOZO+Ln/zpG6aTZ95ZPO995oo
	7BkerZtSVZGbdK9y3t7ndqDdlIrMBXzB0mYSEXpfxC0ChdpBqr0yok06XLS2gJ4BE97mVaPjHzXlh
	KlaNlna+hPhEtDEnryZC3IsQUTzYr/Hkpcj0m/0f3QXTvs8vogj53K2I1SVT+ofsx136gxrlhKi5e
	Oprwz+hg==;
Received: from ip6-localhost ([::1]:45536 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nymI3-007whW-Qr; Wed, 08 Jun 2022 03:23:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62118) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nymHz-007whN-5B
 for samba-technical@lists.samba.org; Wed, 08 Jun 2022 03:23:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=HnvTyM7qYnQVks1+jysJ0AuMHo4SnF9NcvFKqBTv6z8=; b=OcfPEPfu8lRkJq1/8+lz/kbAqE
 tJALr2CeRlJbS9X6fLM5n7baQQTZ9o6eYG3Kmie1TEPu7XlyAmTGM7ffa0DkVAcciHT9rsoJ2bwDX
 4qvgydeIjIaZdrMT85epaYqPc2fVRLIVs+CV2qjtVBUhig0RIxJ1EC588tw2L1FGXPovrFpYKa9HN
 qVasvzTOdMpPPCpdrVrtAcptCjX+wdgbsfaz4ivzwQjKjaktIeghNn3Zmi0LsrzWEB6gDFmz2powL
 lqAJ6E0tiExfTLSnFjhwLOJmnImHD155Hl6dWAZ7eGCrjL8/4VLRohDS9PU6Hu8kzZ7a5DTbi4SvA
 lm5aLb4ydkhYVrN0XJEHFdbG7d07qv7J3iJyuCIJiSXFqjAHsQgl6xXEn8H/kGAd7Shu5BdQGK1CT
 q/lg6rGOwhAL+x3Og1KNBqIopkABAEFr5U5ZifOwcpmiPiOr6LfGOLEjTgEDqg/XpLWxUaZo59uNj
 tcAsK3BQtoPDp6pjoT1kg5Pu;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nymHp-004UYM-Tw; Wed, 08 Jun 2022 03:23:14 +0000
Message-ID: <55008d104d4efc5c286e790836e1a6d4a01ea525.camel@samba.org>
Subject: More Podman work needed
To: Uri Simchoni <uri@samba.org>
Date: Wed, 08 Jun 2022 15:23:09 +1200
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Kia Ora Uri,

Thanks so much for the podman work, this was awesome!

We have had a couple of niggles on the CI recently, and one was
that quay.io/podman/stable is following Fedora images fairly closely,
and 'diff' got dropped from fedora 36 by default.  Ouch!

I considered rewriting diff in bash, and that is one option, or the
natural option of installing it with 'dnf', but the reason for writing
to you (and the list) is:

I wonder if it would be possible for this to use CentOS 8 as a base
instead?  Is the current or at least a working podman there?

I guess I'm trying to find a way that we have an image base that is a
little less volatile and if possible more trusted (thinking about
supply chain attacks and the risks of a :latest tag).

If you have any time to think about this, let me know.  In the meantime
I've locked us to the last working image in my most recent update to
https://gitlab.com/samba-team/samba/-/merge_requests/2551

Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions







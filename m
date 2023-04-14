Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 278986E29D8
	for <lists+samba-technical@lfdr.de>; Fri, 14 Apr 2023 20:12:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=uvP2VPFw0JMxs4qQ42ZcoEdTggOZz0cIlHbIPCsBJJo=; b=wHt9HfV3KoOurQozF0dT9uBaFP
	+7kW8TzbaEsaFmLdXgIjUlItNkrN8qwpkOglHzhmdGtAXTtnpU3D5BpxgmjYNPceTVl0rZ1MVnRH1
	rSRtjJWZLJ6KhrtxaajxOGlKYIjQvxxERr2wCat5GhUMF5aFoZepZGVdwoznxRHot3SMdrMhW+Sgq
	AsGqjLaaq1YcTwCHDj5aIsUYx41gwLbQpHff41LCTH+FZSirtWCmmBi7xw6MZR13zBwwTJtXWIlHq
	lhMkkM3baOMrs0mC/n+khAAvSkSqxNZIzNxnpZgVzM3667frBce3zTreHBM/FRQ/2d/+mR/1qwI7X
	DrtE7nxw==;
Received: from ip6-localhost ([::1]:32290 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pnNto-001rkh-69; Fri, 14 Apr 2023 18:11:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25706) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pnNtj-001rkY-QZ
 for samba-technical@lists.samba.org; Fri, 14 Apr 2023 18:11:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=uvP2VPFw0JMxs4qQ42ZcoEdTggOZz0cIlHbIPCsBJJo=; b=N08BIdNY0c3hiJk8xtpK8+B+6O
 0UD4t3mLP9AkYnI1CgZbzOkr4HgSasjfs87SUJDgz4rVvEABv/UrivYaiNtY2sp/6B3Ruj4D3gopo
 6hN98OZhOxw0voYT7ECPj9vEAiGP1h3UnAT+2NcMT33gGdSK0DS3v98aBn1IENKVc3Xoh8BEhfkVZ
 SomhMypvWE2uh+bRH1KPHX7twqqdI6+PaFkkp2OxIxpzM2XDakrGxaF/+Tfp7NYEYfzglS2MZPJWF
 xt2Rt4+4vHMocjgE0s93f6wEOXdVGRjD67ZNZXeg8GIOhViJRLVi2GM6bxker8s0VjL0fFWn5P2jO
 Ku7pmJBdKlrlLmlap4MDaA1+D20H6OmM46yAGeSF1+IbdMvrRYyNSIwKl2hKIwACS+S+mG9I29NVe
 fTiBXcYqrpRGfhBwEWf1uDprTSkKHq/Y/9pGTw8v/dBi+QEG8yqQO1YgCk7i3CZrB1CUgcBfl6j6K
 9togeilWukZX9vpr8+Wx1kR3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pnNtj-001BvY-4f; Fri, 14 Apr 2023 18:11:47 +0000
To: samba-technical@lists.samba.org
Subject: talloc vs malloc speed
Date: Fri, 14 Apr 2023 20:11:46 +0200
Message-ID: <3161922.5fSG56mABF@magrathea>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: fweimer@redhat.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Florian Weimer implemented hwcaps support in glibc. This allows you to drop 
optimized libraries.

The support for this is enabled in openSUSE Tumbleweed right now [1]. I've 
enabled it for libtalloc as you want to to be as fast as possible.


Here are the results from my AMD Ryzen 9 3900X 12-Core processor.

talloc x86_64_v1 (testsuite compiled with -O0)

test: speed
# TALLOC VS MALLOC SPEED
talloc:       46623469 ops/sec
talloc_pool:  74121933 ops/sec
malloc:       66443400 ops/sec
success: speed

=> talloc is 30% slower



talloc x86_64_v3 (testsuite compiled with -O0)

test: speed
# TALLOC VS MALLOC SPEED
talloc:       47783809 ops/sec
talloc_pool:  75068595 ops/sec
malloc:       68073710 ops/sec
success: speed

=> talloc is 30% slower



talloc x86_64_v3 (testsuite compiled with -O2)
test: speed
# TALLOC VS MALLOC SPEED
talloc:       50633005 ops/sec
talloc_pool:  74245533 ops/sec
malloc:      219259200 ops/sec
success: speed

=> talloc is 77% slower


It looks like the optimizer is able to optimize the code a lot more if malloc 
is used.

I wonder if it would be possible to give the optimizer more hints. Maybe 
Florian has some ideas :-)


Best regards


	Andreas


P.S. The talloc website states it is 4% slower than malloc. This was probably 
a long long time ago ;-)


[1] https://www.phoronix.com/news/glibc-hwcaps-RFC
[2] https://news.opensuse.org/2023/03/02/tw-gains-optional-optimizations/

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D




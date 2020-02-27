Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F84A170E49
	for <lists+samba-technical@lfdr.de>; Thu, 27 Feb 2020 03:12:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=5uE8d1KtF1pAkwb4LxhX8OdHwYl5qSUWHSs4ee8FNMU=; b=Nx1KHd6v7iayxrwRxLxFqOHuBw
	bZMRnfW1FRdX1C6KruA1kR2DPTyvpIOsPZKEjPW54AUITAQzASIEXV5lWybLZOlIT3jjGeNukG9S6
	rAjDksC7VREL1CPQhoQMg1G4npqif5v9jf4sRJ72cYlGRJ/g53Ub40i+Bj6HdATn/oCLzI+GBeZBD
	pnoHoZEyc4OMG4nuUCDHbiW92jqYq7CQh8V5kejrrL+I4R6mwwNcrCp6NQajtaYs2RnvXB+FXlsfJ
	AjttLgVnc1QxJSn71IR+VWBB1ql/EPfKD4zI2S0wV8ihyNRr0AG8vRH0kIpC7HSJX2mCvvT7iefIT
	x53n3tAQ==;
Received: from localhost ([::1]:36138 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j78eX-00BsH8-Uz; Thu, 27 Feb 2020 02:11:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44814) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j78eS-00BsH1-0q
 for samba-technical@lists.samba.org; Thu, 27 Feb 2020 02:11:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=5uE8d1KtF1pAkwb4LxhX8OdHwYl5qSUWHSs4ee8FNMU=; b=EahR/92Ic9VOkgGKCJ43xtYClZ
 vwVqyMBmckN00sw265KlM5CHF64+4X5cAuCM1BfJG9QZJ9SbqM2pbZr7vI6/KYwkzuPYG6egPx0L7
 ubcLP0LJIgxaqcCuC14O2bznySo+fN4fOzFEevKAfGlKvZGaXktwr1EtCjAEpXI3VmSFvGfeNeUg5
 pvvyZ2JvdlJJ8K+2GVwMv8H+ZFE3nNOfFZ0O2yR/yfeaKMF/R1KorfQZzuOeuyu8Gw4dXQh8bXSnu
 EDiYFDY2WdZxbdXm+6jhZgkJKDEBrwmhrDr3zxeo/YKOWNqdsg0LW2ykueID9FhIHWO+LyXA5HKcj
 JdMAr2P21/6cACdHjEymwM2217+s1+BePOz7t8DSFsdDCNaiL6wrrLllGUoZjKOPUY6UFmZK20eHk
 9vDzvhs/Z/cFneOkRlV96hFzbqPY//F9LsLeSvE1fKysfuDROaHlEJnHkOxZIuJMXMs8wOND3Wf0s
 Rb6Puu2NjqCgV5wV68Q3YeMc;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1j78eQ-000549-Hj; Thu, 27 Feb 2020 02:11:47 +0000
Message-ID: <49d4d99c814983f7f075a8d70c5030350bf30810.camel@samba.org>
Subject: Getting seeds into oss-fuzz
To: gary@samba.org
Date: Thu, 27 Feb 2020 15:11:42 +1300
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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

G'Day Gary,

We discussed in person a long-delayed task for the fuzzing effort,
which is to provide oss-fuzz with good seeds for each of our fuzz
targets.  It would be awesome if you can slow-burn at this when you get
some cycles.

For the NDR targets, we do have a source of good seeds, because we
changed make test to save them.  We need to provide some for the other
fuzzers, like LDIF examples, LDAP packets, DNs and ini files etc.

The specification for how the zip file should be constructed is here:
https://google.github.io/oss-fuzz/getting-started/new-project-guide/#seed-corpus

The script to be modified is lib/fuzzing/oss-fuzz/build_samba.sh

This needs to be extended to prepare the zip files of seeds. 

The zip file needs to be along-side the binary in $OUT named
$fuzzer_seed_corpus.zip, with each file being the SHA1 of its contents
(many of our existing seeds are not named this way).. 

See for example this from nss:
https://hg.mozilla.org/projects/nss/file/tip/automation/ossfuzz/build.sh
and tor:
https://github.com/google/oss-fuzz/blob/2d5e2ef84f281e6ab789055aa735606d3122fda9/projects/tor/build.sh

The seeds should be in their own git repo, with a specific revision
checked out over https:// at build time: I've just created 
https://gitlab.com/samba-team/samba-fuzz-seeds

We should grab a copy of Google's Corpara:

https://google.github.io/oss-fuzz/advanced-topics/corpora/#downloading-the-corpus


https://google.github.io/oss-fuzz/faq/#are-there-any-restrictions-on-using-test-cases--corpora-generated-by-oss-fuzz

Then add in the seeds from Douglas (just ask him in person), both from
a 'make test' and hongfuzz on the make test seeds, which he can share
with you.  Some of these will need to be split up into _IN, _OUT and
_STRUCT as the 'make test' system created one directory per pipe, and
we split the fuzzers up later.

Finally, we should run our fuzzers against the zip files (unzipped) in 
lib/fuzzing/oss-fuzz/check_build.sh, to show that this all works.

All in all a lot of work, but we can chip away at it.

To test, clone https://github.com/google/oss-fuzz

./infra/helper.py build_image samba
./infra/helper.py shell samba

Run 'compile' in the shell after changing code and pulling into the
checkout there.

To run end-to-end you can change projects/samba/Dockerfile to point at
your repo and run

./infra/helper.py build_image samba

./infra/helper.py build_fuzzers samba

./infra/helper.py run_fuzzers samba $fuzzer_name

Andrew Bartlett
-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT - Expert Open Source
Solutions
https://catalyst.net.nz/services/samba








Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7D63AE0CC
	for <lists+samba-technical@lfdr.de>; Sun, 20 Jun 2021 23:59:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=ydPR8EXLyk3FRbL0X21X3a/8TSgtPgrfAEuUPghjZ6A=; b=NzsceppkG5DMjaHFTLtaGgIAHn
	igqAWuOvevfl5DlLwdSe8VdgfoWu6rxnCmMu8fI5VnsYvjRsHrxKU5mH/7kVnFb/XgY4w3Qe/9oHF
	LgtQL9spyyP6AE+1nknSXpV4AYMRSb2d/fJkXM05AV5ggfZBj275cnhMTKmQXvYLM4fqW2zhfOyOL
	99zgjy84Q8urM5KoePdhF+wEne49vyZVlxULO9Ptnr55tT7fObf88HPVeXFpUex2zavjLTpV0i6kW
	hhAPUP2iK232hY+evKsfn+TEpmuJMBc9MvL4FyrDJaKfte0vdDekFM2dJ+fySNJxP6PuIypw/qU9F
	daaVRsYA==;
Received: from ip6-localhost ([::1]:45678 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lv5Rx-007HaA-HT; Sun, 20 Jun 2021 21:57:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45372) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lv5Rq-007Ha1-BS
 for samba-technical@lists.samba.org; Sun, 20 Jun 2021 21:57:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=ydPR8EXLyk3FRbL0X21X3a/8TSgtPgrfAEuUPghjZ6A=; b=A9fe3dxH1XnLZkhQLQ5mQ/bU+A
 3oF9ldr3M8+CI/kPd8MdzS5lcB30TzeKUf7eTSeIFNhioyhWHQ7ubc//kua09rIxllEVbQScWsK+Y
 Gsb5zzAMZHMHtesY0JsZMcxXJvywfkl2SURVcLsV9ZIu8UjjqKWmL7r8DstDli128/nTWj8z4Fv3B
 sI2UAxeLg6GvHJDW4B2tu7n678e7yAMtgajHcklxvj6hJ5X9i/DtlXR1kWoOqhMujOP81vHDD72b/
 YN02dp8IFyv/BpVuIB6AKXMAPGhPQ4YAUch2WUyXTwIyGkV03Ft5DirRwmSMwBP8hA8btsAGScM7U
 oDM4bOCaFj6qcPJsM0wnFoBxf/K4RumUiFJQEQQr+f1KvysWXn24Ycw0ryn4A7tGskG4alJBKIiuT
 FjUNQuAv/MLVXRcHyRVLVcbKUpE6qStnpdQton1shHrvMuIESo3Un6+sGgVr8MtBAJ/a0rTm+mav1
 8N5FgnJ7hhuKPYe2zKvRRqIG;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lv5Ro-0005gA-Kl
 for samba-technical@lists.samba.org; Sun, 20 Jun 2021 21:57:45 +0000
Message-ID: <21982f254683b61ee5a93a449b402e80f9df9554.camel@samba.org>
Subject: (again) Ship ldb like libndr and ldbwbclient?  As a Samba public
 library!
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Mon, 21 Jun 2021 09:57:36 +1200
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

I've asked this a few times before, and I'm hesitant to ask again, but
I feel quite strongly on this and want to try one last time to make
this easier for our release management and packaging. 

I really thing that, while ldb had noble aims to be as popular as tdb
and talloc, that ldb should be integrated back into Samba as a Samba
public library, but not an independent release. 

Rationale
=========

I ask this for the following reasons:

Samba-enforced lockstep
-----------------------

Fundamentally, ldb is generously provided to the world, and used in
sssd in particular, but is developed by and for Samba.  I'm aware that
there were early contributions with broader goals, but without wanting
to hurt any feelings, this this a Samba effort these days.

Samba strictly requires the version included in the Samba release.  Any
other version is untested, and Samba uses an unstable ABI (the modules
ABI) and relies on specific behaviours (we fix bugs and rely on those
fixes). 

There is significant build rule complexity to enforce this requirement,
yet for some reason this isn't as strict as our runtime rule (release
version can float at build time, but not at runtime)!

LDB Selftest
------------

Because ldb does not use the full Samba selftest system, we can't do
knownfail on tests.  This means our standard practice of having a
failing test first in the commit stream, with a knownfail entry,
followed by the revert when the fix can't work.

While of course I trust my fellow developers to always test that their
tests show the bug, I've certainly found our main-Samba pattern helpful
in ensuring this is the case, as 'make test TESTS=foo' can be run on
each commit.

Samba Selftest
--------------

We also introduce untested (in autobuild) complexity to the Samba
selftest system, eg 
python:tests: Fix running tests with system libldb
https://gitlab.com/samba-team/samba/-/merge_requests/2026

I'll merge that patch, but I wish we didn't need this.

(security) Release time
-----------------------

The need to, at the last moment, make a ldb release (because someone
like myself has forgotten to include that in the patches) is a extra
stress on our release management.  While ABI versions should be bumped,
a missing ABI bump is not as catastrophic as a whole missing release.

The same applies to our distributors, who for every LDB security
release need to ship ldb, but also deal with the fact that Samba is
strictly building against the bundled ldb version.  This brings
additional complexity and makes it harder to track LDB CVEs, as they
are issued against Samba bug apply to ldb.

see eg
https://security-tracker.debian.org/tracker/CVE-2019-3824


My proposal
===========

LDB would remain LGPL, but would be built akin to libwbclient,
libsmbclient, libndr and other things that broader system packages rely
on.  We would not search for or use a 'system' ldb, we would only use
the one we shipped with.

A user wishing only ldb can install the ldb package from a distributor,
who can continue to package the ldb libraries and binaries separately,
just as they can install libndr for sssd use via samba-common. 

The independent ldb build would be removed to reduce the complexity for
developers.  A user building from source wishing to build only ldb
would build Samba - spending some CPU time - and select to remove other
than libldb and the modules if they really want.  Samba is developer-
resource constrained, so we need to make choices to maintain simplicity
in our project.


Next steps
==========

I recognise this has been a controversial issue in the past, so as to
be effort-efficient I'm not going wait for a seconder for the proposal
to ensure I'm on the right track, then make a MR.

Likewise if you have significant concerns from real-world use cases
please see if we can work something out, but avoid 'straw-man' examples
please:  LDB is over a decade old, if a use case is needed it would
have come up by now.

Conclusion
==========

LDB is used outside Samba, by sssd, but has not flourished in the
current sate as a semi-independent project, is very unlikely to become
fully independent and should now be fully folded back into main-Samba. 

Thanks,

Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions



Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDA9410182
	for <lists+samba-technical@lfdr.de>; Sat, 18 Sep 2021 00:54:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=WtPnmoeB3oYPT7zoR6FO0YTgbnJmS2RucljrOS9OWWw=; b=cO5sM6gYmc5WTDI7k3E1AsS2sU
	waZk/70YnKgMpEjryRYdM6/jp1T/RBjgd7BmMj4gbYvL69IpdcU2G4Vt1N4dJ8O0EgUv7DfjhTbO9
	DBbKjUKocEB6vv0thGr+p1uk3BpR8+9NqeDyD/pRwwkMpZO7pLi7QJLEunmo8c9s4Djrom6JVD4x6
	h3+0Gpk65BDDTVuyvDBXgFZ+J2TDfBIVYEATB2BSg93e2iQ61mB/dyAyBaPwQkaAaaS9ffK8tqqP9
	LxgKoUGbuuBmkw4F1S5RMJ+2yA5yc7YzvRo8VfntuwTk3PItRdjPlRQuv0hpWYw9uuaz0tqnBAIRF
	4/qL1Lsg==;
Received: from ip6-localhost ([::1]:54494 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mRMje-00Fi2E-R4; Fri, 17 Sep 2021 22:53:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18908) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mRMjY-00Fi25-Je
 for samba-technical@lists.samba.org; Fri, 17 Sep 2021 22:53:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=WtPnmoeB3oYPT7zoR6FO0YTgbnJmS2RucljrOS9OWWw=; b=DVAE+nKB/iVXLLt8fvTIzxV259
 sDHHa6Q+E6OoZXZT9evVyt+tyc1A3WcB2+ZHGaLvp6pmPJkFkBXvCTb0vFa65+ePOKU1LQ+Y724Gn
 5YD9S79ZAFzlR3JJvhQjhEN+UN4JDlf0YcVJ8Rzsgmr7XE7Vm0S+MW+97UVNgRvtpwqggOg576+up
 2y/J+zorqow34ciDYRNnnovxCTHWrtxkP6FRNG5WtLq4kqnwstv9e7y59eaa6Tfj7EQlYz8DGZqzi
 QvulIARIFgwhN+8VVlUg1NZZkdJAAz3OlcxIJsoEm2AWosS8FnHPs+v+n0NcAAZ/uVVAeEIgKIKrT
 wB2RrhcIlzBgUEujdfDXBnfp2G+HszAOcsOeyc+cLyUszo6rZ1EiVEymUGeWrGFjXEztGAz3Zm4/c
 VgDwPV0YUWTTCvZBsQ7Fq1fTwvemqJVq70ZhgDCbrQA6ymeXdwPEkZP46vghdOUDpc8va5NMnqACU
 AEFWFLSIeeu+FkdJ070ARYc3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mRMjV-006g1i-8i
 for samba-technical@lists.samba.org; Fri, 17 Sep 2021 22:53:26 +0000
Message-ID: <75a0dddc580feabc6e51b31346338951b1bd1bf3.camel@samba.org>
Subject: Medium sized job: map autobuild and selftest envs inside selftest
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Sat, 18 Sep 2021 10:53:21 +1200
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

I recently posted about work needed on our oss-fuzz code, and I was so
pleased when Uri picked that up. 

In thanking him we got talking about the challenge with making a small
contribution to Samba - so many changes either require you to know a
lot about much of the codebase, or are potentially long.

So I wanted to start a theme (which should be a wiki page eventually)
on Samba tasks that like the oss-fuzz task don't have too many
dependencies and which have a clear finish.  

Even the oss-fuzz issue had a couple of tidy-ups still needed, but
essentially it was all done in just a week, with nothing more still
needed. 

"Samba tasks without fish-hooks"

On that theme:

Mapping autobuild jobs to selftest jobs and gitlab-ci jobs

We have spilt up 'make test' to make it parallel, but the mechanism has
become over-burdened.  At the start, the '--exclude-envs' and '
--include-envs' was a simple hack, with only a couple of environments
split out.

Now we have a massive list in autobuild.py, and we have had jobs go
'missing' with copy-and-paste errors.

What I would like is that --include-envs and --exclude-envs be replaced
with --autobuild-task.  

And then put that mapping (mapping a list of autobuild jobs to a list
of selftest envrionments) in selftest.pl, along with an assertion that
all environments need to be in that list (abort if a test is declared
without an autobuild_task for it to go with, and abort if an autobuild
task is called that isn't in the list).

That would allow make_test() in script/autobuild.pl to instead output
 
--exclude-env=${NAME}

instead of the --include-env/--exclude-env pair, and so ensure that
every test always runs in some autobuild environment (well, a whole
environment could be missed/typos, but it will be harder.

I'm very happy to help/advise, but can't jump into this right now.  

(The main downside is the need to wrangle the Perl in selftest).

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions



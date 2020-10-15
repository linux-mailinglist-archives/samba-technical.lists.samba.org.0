Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8BD28F946
	for <lists+samba-technical@lfdr.de>; Thu, 15 Oct 2020 21:11:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Y8Bs2YY59t4smaX1PkOG5ahbL7gy9V0keLaCUUSCOE4=; b=PViuOY0sPhmRsWJIifuyy1hLo3
	TAnzU90adrKaA01pC7hhf7xZV7SEWpU97+D5RImi5+s31DIcoU0BexNxuSjs/1Li1NrRQFMoZDKKF
	X9vWu9DDT9IvVByWdN/IenDbD8ODH77ZghA8vTJeuITV72AJLXuo4wPn7bZFcygK+OdwnY4uPI4rv
	7qCwQrdcnDfXJ1KbYKBC4zHLiILHi228yBSNR3rpbbZIT+BAzG7uOAaS6GUCjhvI6w5yiWoWBIP1q
	xkSV3ylOP3Ke0ZpsubIb2/bOyYNOLPafuPO8/o59Knp7n6hSyMx3dktsssSmUeMG7cFnKrJNtZPGM
	qiwzLZQQ==;
Received: from ip6-localhost ([::1]:59450 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kT8eg-00CJA0-1X; Thu, 15 Oct 2020 19:11:14 +0000
Received: from pine.sfconservancy.org
 ([2001:4801:7822:103:be76:4eff:fe10:7c55]:52160) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kT8eZ-00CJ9t-TX
 for samba-technical@lists.samba.org; Thu, 15 Oct 2020 19:11:10 +0000
Received: from localhost (unknown [216.161.86.19])
 (Authenticated sender: bkuhn)
 by pine.sfconservancy.org (Postfix) with ESMTPSA id BF179E9C8;
 Thu, 15 Oct 2020 19:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=sfconservancy.org;
 s=pine; t=1602789064;
 bh=n7aQFroAv+CvotnsOhTAJ/iFIg2gd1FzzMPNVpMTQSc=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=jdGmK540ETBIQFJjWRQIvDdRRCwSekcP117KvPw7yuPfgzNKIstuIxOlC/kf5gRCh
 IIVlpR9FnpXUj8Xy+/FtoelkrAHCF+UwcIQq8zPYF2JC+xPfvnGW63uHgvd7aABmXX
 OZthVwHqQfsdpUnxUooWRZOXAjMmr3kiazJODS+UQN90okQ2nJ2agJnpFi5XfoOzPH
 OZCtqEqF1YC+i/2P2eO5rBlr561/rNAcMneIycH36IsSg4DTfHKKJ+DSh1YpnqXw1l
 z7pRaqQ6DZq7EssW3/7IClV+cNMNw4FLmltMcJZ0Di0EwYKdwqdjcEihDIdzUj7c0i
 2J0G4wsMQApqw==
To: Jeremy Allison <jra@samba.org>
Subject: Re: [PATCH] Documentation: Rename Samba's DCO to Samba Contributor
 Representation
Organization: Opinions expressed in this email are my own and are not
 necessarily those of any organization with which I have an affiliation.
References: <87mu0nidll.fsf@ebb.org> <20201015180510.GE3769001@jeremy-acer>
 <2231b5de-fa06-db61-feb0-08ad0374673e@samba.org>
 <20201015183632.GB3840862@jeremy-acer>
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwBAMAAAClLOS0AAAABGdBTUEAALGPC/xhBQAAABVQ
 TFRFAAAAWjotvpiH/PHt27Sj7sq8lXFeBchlBgAAAAFiS0dEAIgFHUgAAAAJcEhZcwAACxMAAAsT
 AQCanBgAAAAHdElNRQfiCx4VFw6omMmeAAACAklEQVQ4y43UPZPbIBAGYGdu0puzQ51bI+qMdXId
 r0F1RoLrwfb+/5+QF307VVR4PDxiF14h7Xa7t3q8LJGjavj7a1euCYiZnaPnv9DF4FyMLKdXOPs4
 XM7KKzzKaF83gem+hUuF8QYUg7Fb4LEQAK1OG3hu4bbC3LpUC87+B9AMfQOg0yv0owEOK4x1+gnu
 M3yaV3jOMGxvKoXEKC9gAoabJtZYlXO8wJcb1hMHQClZgSj7cbzsY4a2vSqltIlz8nMpZnMkEmVw
 N4DtcYJo3AMPXFIMRMax/BjhOxZi2CpKKpWSZCd4C8aZ4CpzjR+Cint9WEp5H12IbbySEpHdaYVh
 OY9onf0Qq9//zDCFEW0MbFjUz7mHD1UdO4B3iErk9whdKdWVRuW5YLl5KnU2rjTBDyPmQImm5mec
 WQx7X3fBNwAzQ9kvBTKR0BwR3Bewhisn2mpkhea3BZwBcdorRlQk9QKecyZukRPeHTmuEL1FdjlJ
 tmTlvoAJPnRaMnKinNICn4QthNaKlNAlLae9sc5UODaelVh+l345u7ZMIY89GNdmWV8cIaTFlLGm
 QKLrzQykh/Aw02WsdoE2l1g7JIPdyWGFL6Hy1uJZsEjavLUXkVyeIdrbpPoXQHxDG0l68wEoW8vG
 BLI6qc2XoUEWCUI26aQfK1wypuwV7v6mtMhtgL8avOP/pBCiigAAAABJRU5ErkJggg==
X-Disclaimer: Opinions expressed in this email are my own and are not
 necessarily those of any organization with which I have an affiliation.
Date: Thu, 15 Oct 2020 12:10:16 -0700
In-Reply-To: <20201015183632.GB3840862@jeremy-acer> (Jeremy Allison's message
 of "Thu, 15 Oct 2020 11:36:32 -0700")
Message-ID: <87v9fbgvaf.fsf@ebb.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
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
From: "Bradley M. Kuhn via samba-technical" <samba-technical@lists.samba.org>
Reply-To: "Bradley M. Kuhn" <bkuhn@sfconservancy.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

>> On 15/10/2020 19:05, Jeremy Allison via samba-technical wrote:
>> > I guess I screwed up in calling our Samba contributor agreement a "DCO"
>> > as that's what Linux uses, but ours is different from theirs.
>> >=20
>> > In my defense I just thought that's what such things were supposed to
>> > be called.

On Thu, Oct 15, 2020 at 07:14:07PM +0100, Rowland penny wrote:
>> Hang on, what is wrong with calling it a 'DCO' ?

I don't know if a name change is strictly necessary or not, but I think it's
worth doing (as my commit message says) just to be nice (if for no other
reason).

Jeremy Allison wrote at 11:36 (PDT):
> Let's discuss on the list if we want to change it, and if so what we'd
> call it. =E2=80=A6 Bradley, do you have any alternative names you conside=
red ?

The only other name we at Conservancy considered was "Contributor
Attestation" which sounded too legalese, and why we stuck with
"Representation".

I don't have any other specific name ideas, but I have at least one to
suggest that you *don't* use: "Contributor Licensing Agreement". The entire
DCO idea, as discussed in this Conservancy blog post =E2=80=A6=20
    https://sfconservancy.org/blog/2014/jun/09/do-not-need-cla/
=E2=80=A6 is to point out that a DCO-style structure should be a very light=
weight
assurance on top of the "inbound=3Doutbound", and *not* a heavy-weight CLA.
It's good that Samba's document is *not* a heavy-weight CLA and you should
pick a name that communicates it's a lightweight document.

>> On 15/10/2020 19:05, Jeremy Allison via samba-technical wrote further:
>> > Plus I didn't notice the original text was copyrighted and under a
>> > CC-By-SA license, so we should certainly fix that.

Meanwhile, we definitely do need to update the license notice since the
CC-BY-SA has requirements and the copyrighted portions of that text are
licensed that way.  I'll split my pull requests into two as I think it's
important to merge the CC-BY-SA stuff sooner rather than later and the
issues really are separate.  I made a separate merge request for that and
attached the patch as well:
       https://gitlab.com/samba-team/samba/-/merge_requests/1610

I've also updated my original 1609 merge request to *just* execute the name
change, and I'll update it to rebase off of 1610 if 1610 gets merged first,
and/or when a consensus on a different name gets reached on this thread.

Thanks to the Samba Team for working through this issue!

Current state of both patches attached for completeness:


--=-=-=
Content-Type: text/x-diff
Content-Disposition: inline;
 filename=0001-Update-DCO-for-CC-BY-SA-compliance-1610.patch

From 8f0c8ee5fd6a91dc113e876dd98e29c1b3549c00 Mon Sep 17 00:00:00 2001
From: "Bradley M. Kuhn" <bkuhn@sfconservancy.org>
Date: Thu, 15 Oct 2020 11:55:13 -0700
Subject: [PATCH] Update Samba's DCO license in compliance with CC-BY-SA 4.0

The text of "Samba's Developer Certificate of Origin" is copyrighted
and licensed CC-BY-SA.  Add notice for compliance with CC-BY-SA 4.0.

Signed-off-by: Bradley M. Kuhn <bkuhn@sfconservancy.org>
---
 README.contributing | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/README.contributing b/README.contributing
index 2a44e37f9e8..836ccec5936 100644
--- a/README.contributing
+++ b/README.contributing
@@ -113,3 +113,12 @@ Have fun and happy Samba hacking !
 
 The Samba Team.
 
+
+The "Samba Developer's Certificate of Origin. Version 1.0" is:
+  (C) 2013 Software Freedom Conservancy, Inc.
+  (C) 2005 Open Source Development Labs, Inc.
+
+licensed under Creative Commons Attribution-ShareAlike 4.0 License as found
+at https://creativecommons.org/licenses/by-sa/4.0/legalcode and based on
+"Developer's Certificate of Origin 1.1" as found at
+http://web.archive.org/web/20070306195036/http://osdlab.org/newsroom/press_releases/2004/2004_05_24_dco.html
-- 
2.26.1


--=-=-=
Content-Type: text/x-diff
Content-Disposition: inline; filename=0001-Rename-DCO-1609.patch

From 9192d00494f6645684d0852d228963cfa49b65b0 Mon Sep 17 00:00:00 2001
From: "Bradley M. Kuhn" <bkuhn@sfconservancy.org>
Date: Thu, 15 Oct 2020 07:52:21 -0700
Subject: [PATCH] Rename Samba's DCO to Samba Contributor Representation

In an effort to reduce perceived confusion about the quite necessary
differences between the Samba DCO and the Linux DCO, and as a favor
to the Linux community, rename the Samba DCO to the Samba Contributor
Representation.

Signed-off-by: Bradley M. Kuhn <bkuhn@sfconservancy.org>
---
 README.contributing | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/README.contributing b/README.contributing
index 2a44e37f9e8..26cf8f97756 100644
--- a/README.contributing
+++ b/README.contributing
@@ -48,7 +48,7 @@ your employer, simply email a copy of the following text
 from your corporate email address to contributing@samba.org
 
 ------------------------------------------------------------
-Samba Developer's Certificate of Origin. Version 1.0
+Samba Contributor Representation, Version 1.0
 
 By making a contribution to this project, I certify that:
 
@@ -95,7 +95,7 @@ above, add a line that states:
 Signed-off-by: Random J Developer <random@developer.example.org>
 
 using your real name and the email address you sent the original email
-you used to send the Samba Developer's Certificate of Origin to us
+you used to send the Samba Contributor Representation to us
 (sorry, no pseudonyms or anonymous contributions.)
 
 That's it ! Such code can then quite happily contain changes that have
-- 
2.26.1


--=-=-=
Content-Type: text/plain

-- 

Bradley M. Kuhn - he/him

Pls. support the charity where I work, Software Freedom Conservancy:
https://sfconservancy.org/supporter/

--=-=-=--


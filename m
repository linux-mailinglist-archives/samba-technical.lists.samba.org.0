Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBED28F80B
	for <lists+samba-technical@lfdr.de>; Thu, 15 Oct 2020 20:00:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=XVSl4OpxdnOSd2W8Tmno26A6Xuq0wrGoT4D6y0jqGbU=; b=R+Atn84KaWFb/BqdoTzzoVHvYG
	NhhimXFVi70bkTcJ+a7o60OcSnYg1+Lf/Na1Q7XsYA/XjkIPQzqsGlBbZSKZtfeKz78TnleXvj03u
	kovihdcaMUrh38JReV4m1AvlJjFncZ6d8P5YV4dyJtf+lZf4aVt0EQ0DcF7xKJFa+qndAed2svyfC
	qgvfj8pQ7x4/VLya1nG5EO65R55VvyeRe3r8JFBm9frodlaiVA8vdwFvD/dhkfaQYVnrKK17EVvOg
	txqpTjlnVI7ZtmKOxbowpxboJxemgVE4vaXtctKI+LmIuTmvimcIPoOUcdpesmzLg0l5KeoZTCGzR
	woDpQOCw==;
Received: from ip6-localhost ([::1]:52912 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kT7Y8-00CIAa-NG; Thu, 15 Oct 2020 18:00:24 +0000
Received: from pine.sfconservancy.org
 ([2001:4801:7822:103:be76:4eff:fe10:7c55]:50730) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kT7Xv-00CIAT-AP
 for samba-technical@lists.samba.org; Thu, 15 Oct 2020 18:00:15 +0000
Received: from localhost (unknown [216.161.86.19])
 (Authenticated sender: bkuhn)
 by pine.sfconservancy.org (Postfix) with ESMTPSA id EAC3FE9BE;
 Thu, 15 Oct 2020 17:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=sfconservancy.org;
 s=pine; t=1602784197;
 bh=8AOoYYdNvlHxKddmf4Vcp7YfoJQPy14L3gySPsB7Pls=;
 h=From:To:Subject:Date:From;
 b=ogZGLwzUkGL0NWsRUWY5xGQdYyPZzPGc8ltq3MmkJyZAh6ez5DEqef3s5L9exvWc0
 +5Gb5EIGlqrpSE3Ld8xjyp3h+GanEtV8As6h1OP2DOACe58CW251W3/y7oOOhhr75s
 v7lynhQ8+j9Qz9U4urnbdV+auKJaebRl1W6ngGYTKY9Ej0LCEnHI8yc4zr9ejwSpC1
 fviOQAh/uEbLN4kfwbEMlBk7kWshWe5ZJvN8pPm4iysdt2nUZ2PKHw3Cvp6SHG4ZY7
 JScLl4yO66trIxcQ+xLmD3WJ1X30a95rcYk3Lx0RtkGXFh1WvqAJwF4M0Ts+Hrxn+o
 YBlELBJyfgEQg==
To: samba-technical@lists.samba.org
Subject: [PATCH] Documentation: Rename Samba's DCO to Samba Contributor
 Representation
Organization: Software Freedom Conservancy
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
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
Date: Thu, 15 Oct 2020 10:49:26 -0700
Message-ID: <87mu0nidll.fsf@ebb.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--=-=-=
Content-Type: text/plain

Samba Developers,

As you know, it's rare that Conservancy offers specific patches upstream to
our projects, but I've submitted a merge request here:
        https://gitlab.com/samba-team/samba/-/merge_requests/1609
and I've also attached the patch here.

As many of you may know, Jeremy Allison originally requested that the
Samba's Contributor Representation be named DCO as a tribute to Linux and
its DCO.

But, for a variety of reasons, I (with this patch) recommend to change the
name.  Also included is some cleanup work regarding the copyright and
license on the DCO text itself.


--=-=-=
Content-Type: text/x-diff
Content-Disposition: inline;
 filename=0001-Rename-Samba-s-DCO-to-Samba-Contributor-Representati.patch

From 2f011583294626e9919db7d8ddc7961a2f177f4a Mon Sep 17 00:00:00 2001
From: "Bradley M. Kuhn" <bkuhn@sfconservancy.org>
Date: Thu, 15 Oct 2020 07:52:21 -0700
Subject: [PATCH] Rename Samba's DCO to Samba Contributor Representation

In an effort to reduce perceived confusion about the quite necessary
differences between the Samba DCO and the Linux DCO, and as a favor
to the Linux community, rename the Samba DCO to the Samba Contributor
Representation.

Additionally, note that the text is copyrighted and add notice for
compliance with the text's license, CC-By-SA.

Signed-off-by: Bradley M. Kuhn <bkuhn@sfconservancy.org>
---
 README.contributing | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/README.contributing b/README.contributing
index 2a44e37f9e8..c4a0c7f4bc9 100644
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
@@ -113,3 +113,12 @@ Have fun and happy Samba hacking !
 
 The Samba Team.
 
+
+The "Samba Contributor Representation, Version 1.0" is:
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
Content-Type: text/plain


-- 
Bradley M. Kuhn - he/him
Policy Fellow & Hacker-in-Residence at Software Freedom Conservancy
========================================================================
Become a Conservancy Supporter today: https://sfconservancy.org/supporter

--=-=-=--


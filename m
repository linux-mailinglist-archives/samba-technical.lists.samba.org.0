Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A67F715D14F
	for <lists+samba-technical@lfdr.de>; Fri, 14 Feb 2020 06:02:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=DvMA+fe03BnoDyFOKki9oft3XoTVKpanP9u0TxWbWYM=; b=u6i0UccJCFIRPXvXwq4ubjzF/m
	RnKdDSIELdxZ2hLM2g+ZzG6LhVcpTd8lfO33peufRQacCU+uKiqp4K+yBbjRae/Oxb8AbmKHyvTe/
	3D1j6rmPf4Z7KadF359jS3ory7UCAs/Chs9enuaEvoTmq5Q6GwEZlFHwgOwHZsZ5jAw+KwQCt3rNy
	Z490SZ2WX7XyfaMMiqE0o8+/Wbwtvri9obyrCZmzYsJGYFKeelDvXUbIKEWqcX/JAsXCl33RBdFxh
	qhN3ZyGWEAHMXU1n9qYq8WXBMaOa9Yhr7JHsv7u37XibF/peLF0y9N4XdrFAxUkA2gIPsuGR0KMp8
	3L2ZzRQQ==;
Received: from localhost ([::1]:46048 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j2T6Z-009pL3-SK; Fri, 14 Feb 2020 05:01:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:51354) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j2T6T-009pKw-19
 for samba-technical@lists.samba.org; Fri, 14 Feb 2020 05:01:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=DvMA+fe03BnoDyFOKki9oft3XoTVKpanP9u0TxWbWYM=; b=wfQ89zMzRfOBXbJHS+Ku0WL41e
 eOlaJ/MyrhO7d4xMs3PVJc1RfYme/vSP+H66vkWwwo4kpE/VvHQCrpmf5ZVQMI8koijf5gHnaLxIb
 b8AW+U9n1rtUGOJ5djcw6V4VktuUpDSnAqidE6p1J/ddJzRfAuocuafUY7PIt8Eby8kszt5Et/svL
 MNHH//ONWjwWI7wKfnf1Q7zUcN6Eg8HHhwRuaWSX9aUJd/tafB0e/BvrXjmCd5fMaXBF4BJOcx3GF
 k51fhY1HGukRZg60SG5lLK3k5cf7LTOgUJ2GDmRufWY2iJbLP4PCR5GF+yi0Doi7AUTVO2QkOogNV
 K7mvs3bPKvs2nncoJX50IyiFysVXKTMvzlpG/sDLOJB2wGh86wfMBmMjFinJmAJ3mkolggJ0QvdOc
 GUe6snHkerReupSu5jPiYRRQozbBEDt6/SZapa1ClgFG1XqznMvPu9RDY5UGi1rmjFBcA0uDrCX6x
 +lLx4wSedvrxzc+QGGE22/kO;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1j2T6P-0004z4-Q0
 for samba-technical@lists.samba.org; Fri, 14 Feb 2020 05:01:22 +0000
Message-ID: <1f5483b6c7349f261b79990f3daea501d7636ffe.camel@samba.org>
Subject: GitLab CI back
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Fri, 14 Feb 2020 18:01:16 +1300
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

G'Day,

A big thank you to everyone for their patience, the GitLab CI private
runners are back now.

There are still things I would like to do:
 - ensure the alternate configuration for really old Samba versions
still works (I think that image ID also changed)
 - decouple the system from the catalyst_samba key and use an ephemeral
key instead
 - provide a top-to-bottom script that pulls a docker image, installs
the required software and runs ansible that only needs the credentials
as input

But for now, it is back, and the bastian host is now running a 2020 set
of updates, which is a good thing regardless. 

Let me know if you have any further problems, otherwise please just
restart the failed jobs.

Finally, I would plea that some other interested team members learn how
all this works, so as to avoid having a single point of failure in
myself.

Thanks!

Andrew Bartlett
-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT - Expert Open Source
Solutions
https://catalyst.net.nz/services/samba








Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF861D2C8A
	for <lists+samba-technical@lfdr.de>; Thu, 14 May 2020 12:23:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=ZcSjYPWabqn38JyOFVoOM2BmrsGHyEs9Lhi7bYeKa9M=; b=GXah8iiXanrazADZ3ElgcxFWgq
	TRjDEk6ONVMspkNp+CwaiWpudFHHNnhFzNKic9L7a3MFpC3dIwVxLYLxEMDrkjV4D+0gPg8S8YNwy
	+px4juj6aFq/dNWaQ8j+/zjd5FfBJQUDXZf/w5T4d0qp0SqVB5FgPPK+/cLf9BSZbfIE8s2arlxjZ
	15kjhAhPSLhacZOFUlCq12jzqc3/6YUn6RsNv9Mna0tTUOzF5UNbVxvkOXB/fyzjDnUIxceVFvq9o
	hdUds0GGNl8s4wxs5PB6mNQpO/By9wP/UlGAfCPiyY0VhezuncstbFEFqJok3W52iG7fdn60plMoD
	d2FYtuEQ==;
Received: from localhost ([::1]:59748 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jZB0X-004Imu-Is; Thu, 14 May 2020 10:22:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62028) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jZB0N-004Imm-Oj
 for samba-technical@lists.samba.org; Thu, 14 May 2020 10:22:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=ZcSjYPWabqn38JyOFVoOM2BmrsGHyEs9Lhi7bYeKa9M=; b=g9ql55Gn4JwMocS7WC7euTG2LI
 BCa2epytpXiyghvL/htV7xsk0hOWr9saz30hXPvLIZkOh78tNqynCFqYj12citXZWOV3BiGYRlCTF
 wvrvdIdM5/h7Ze1W/pP3+u6bMvifrE2irlUZXudelOoEu/iUSqWqjYqWddtbfwPrYkfW/hCnGmo3J
 e+choFVwtztX5AUbARgiib5qFxEe/oc4lh7NyjWp80pLwCtC/MiILUGFZHulLGnxGXeDGdXNnAZ+k
 DKVYK4Q3md3S/GjsdTAxTOIKYk9sJXT8G4H4FJCTmy9Aa6l5AZoG5qOJ+CrIjYDOA9nuzOz7f93uD
 Qaw7eLtBpJ27hMD9gm/piGo9OOVJGE8DSkhIGFqGvPWxACdPIWhMxBk+Qu5jR4PK0D3t6m9O88gal
 eezqhzYkaLprcj9sJjCBcMdgwbdbRkht86rnStgBNQG5N7HS3mhIb85GwsUk5bcvrcS24pnChUUj8
 iHr+tr4R9+8+rcS8qz/Nze19;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jZB0L-0001yO-K5; Thu, 14 May 2020 10:22:18 +0000
Message-ID: <e245b5e81ba6066da467f371bc917d6a052ccb8b.camel@samba.org>
Subject: Heimdal upgrade tasks
To: Stefan Metzmacher <metze@samba.org>
Date: Thu, 14 May 2020 22:22:13 +1200
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
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

G'Day metze,

I've had a customer offer to commission some of the work towards Samba
being a 2012 FL DC, and I've suggested that the Heimdal work you are
doing might be something I could help out with.

Do you have any suggestions about how I can best help you?  I don't
have a big budget, but if you have some ideas on what I could do in a
week or so effort that would be awesome.

I'm well aware of your tree at
https://git.samba.org/?p=metze/samba/wip.git;a=shortlog;h=refs/heads/master4-heimdal

What is and isn't working with that so far?

Sadly I find your WIP trees rather intimidating so some clues on how
best to start, or if instead you would prefer me to take on review for
example would be great.  

A specific failing test or some other self-contained element would also
be most welcome.

Thanks!

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba





Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4098F404192
	for <lists+samba-technical@lfdr.de>; Thu,  9 Sep 2021 01:07:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=yD7+j2YF9adF1H1D+B1vNydjY7ckpBAWfMJeODdLKnk=; b=Fx12oQPcZPJbcPlm5FotAIpS6H
	kEAVmlTmUaj76HldZklKsIDtkazQ97S6dRt7JyNMS4mjJgdCAdGe6mliWK+ifyfmsGZq+TE3e+Meb
	WbGe2mu27dQO2nrUfnAGm4/IwgIVcrtsl7lfe2Cx48h9ZSkfF3EmssnJfoh42iZaKEHbXaWz1mc4N
	cDV0NRiYDXLUpwTb0d45PA4xXOY8FK/zA4LMnJbZ4fzjuXbvghMHCyYdbWzHDj/BS7RzU2LSCFSya
	0bNT5NTPJOBkBUJlO5BKcg0TEg6hS0zIqZXVjfKA9B/oFYacWrdQh7apzXIyvHYNfAbhaTv7fSWTA
	AFDsOP/g==;
Received: from ip6-localhost ([::1]:51088 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mO6di-00DvID-Jx; Wed, 08 Sep 2021 23:05:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30506) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mO6db-00DvI4-Bu
 for samba-technical@lists.samba.org; Wed, 08 Sep 2021 23:05:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=yD7+j2YF9adF1H1D+B1vNydjY7ckpBAWfMJeODdLKnk=; b=sTcEbf1fykyJl264OWnpZaZGiy
 bdzgGWiCnwgAVoNEhMpxpBUoirmIRWKG5EB0JVgDQuq/FWtfDmi6hUrZ6dsBRQTfkoi2hQGMO6lci
 1feq6DtUk+pBjAwBWWRbX37E9FDlYLndoPiIGg5JpepGRpU79Os1+pVhgMsVF1Hdq/4u5IjxbPeqA
 BqilDzDsiWyXNgDELqQaxjnsRrGKzrOmOa/lXBmy09rG+FaU5ewUVgTtVN1PLTz1dJQvOWyVxpaDS
 Q9VX5HnqRyEYwVE5BTZQzuT7hDac5V0lmkGACGg9PmdBz+07qrtbyW5kLI7yGUz9qadU9WTJlu/AK
 bVCAfNUHh7x8H1d+yrmjxgyAgkmwoFra+vDcQX3fHVGWfrQYSmLDoTiS527VeqWPlNJWU0/D9qJDQ
 A2wAe9r9gKp8C+UX4UvouWLKHvUIL9IjdUdnTZkOhCxzTnQyRqwWkxNksnr3sIZw9VX76XIwOD7oW
 iXGA0gvlw4THPPoa54wh3/XF;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mO6dZ-005IPY-TN
 for samba-technical@lists.samba.org; Wed, 08 Sep 2021 23:05:50 +0000
Message-ID: <1fda50e96d3e1fe3a0f57f23e29ea7fca3941624.camel@samba.org>
Subject: Re: autobuild[master] failure on sn-devel-184 for task
 samba-no-opath1 during test
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Thu, 09 Sep 2021 11:05:47 +1200
In-Reply-To: <E1mNuYv-009jQZ-FT@sn-devel-184>
References: <E1mNuYv-009jQZ-FT@sn-devel-184>
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

G'Day Team,

I'm wondering if someone can look into this for me.

I'm trying to push Uri's oss-fuzz changes, and I keep getting a failure
here, in what I honestly hope is unrelated code.

Has anybody got any ideas what might be going on here?

Thanks,

Andrew Bartlett

On Wed, 2021-09-08 at 10:12 +0000, autobuild wrote:
> [280(1397)/771 at 16m8s] samba3.smb2.notify(nt4_dc)
> TESTING CHANGE NOTIFY ON DIRECTORIES
> Testing notify cancel
> Testing notify mkdir
> Testing notify rmdir
> Testing notify mkdir - rmdir - mkdir - rmdir
> Testing buffered notify on create of 10 files
> Testing notify on unlink for the first file
> UNEXPECTED(failure): samba3.smb2.notify.dir(nt4_dc)
> REASON: Exception: Exception:
> (../../source4/torture/smb2/notify.c:398) wrong value for
> notify.smb2.out.num_changes  0x9 should be 0xa
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions







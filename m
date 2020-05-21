Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7A01DD941
	for <lists+samba-technical@lfdr.de>; Thu, 21 May 2020 23:18:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=/BQmGu2TBReZvZ+PAdyA2ONTFBquFcFDGn09IUvSX/E=; b=toqD9ZccB/fJOL48RQB6H3zxkz
	uyzGet3V1hDwIsvL7rZ8nKbsvDhyi6xWx2QRTYH6/XZIhywip5OGQJzYgMKWfIkvRds5zTcTXDvKD
	MJ/8ZUOIiorRYSF9ZUNMH7v0IVjfImPpKE4M65TfePsFCjlpZuWY0W2VrAMNulax97prEsfVb+M70
	tSwjGcODsZ/5dcSed8HQiVjQwgD8DBggPvIyoP9Z4TkPMmoWfwczznbGQ28kqu7JsZ+UhIJsvhCBT
	vatAugJ/uMDacCHAsBR4l9oALPxWYdlmQ2F+/HLFY7ehEh+5RXpFGRWiEuj66KJW2IXXRyh0B8FbV
	HKl4rw2g==;
Received: from localhost ([::1]:47898 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jbsZW-005PFH-KJ; Thu, 21 May 2020 21:17:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33730) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jbsZR-005PFA-B7
 for samba-technical@lists.samba.org; Thu, 21 May 2020 21:17:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=/BQmGu2TBReZvZ+PAdyA2ONTFBquFcFDGn09IUvSX/E=; b=02yETrloDTAfzNP2iLRvNga4IZ
 +itjuBkLW1PtDHufP2l4lWEFv1H/0Cet6nDMYZ5S1AVQlYPgIE+CyJn3Ehy/3VFOxOA9jX7emp6/H
 Fw1h7UQh71e1BlYyWG7CIS8t+HzubCMuKkMBuSDFgAT+6y3A9+HmuzWFtB5BKBL7trMk2JfjkYhnI
 pJK8eXDpR7MwgNljphXaBfj4vBrYVezacU90sJXhDbhbch3pkEFALuQxWYgiDlT09BLbXweAw0q7Q
 KE3tZ0KK0bM7lLWVVyCv5ao+KfQXnjxo9Bszin1jDPSRjj2hJdsO05o62VaDh+ghtXV+skoxcDIO+
 wMj+eMm0a/sZW4p91QcRKIFAYkwOJrhlS2DUYu15rzN42X/ChdVpU/dnTIwOnEeS7h3N3LEfclLLA
 9ZLhZvsmMi8W717l5EnaWGEA8DqYN9z2g3jUovny2YhFXF6/HUXlsLvhspSqbidcgzxEx6tSzXOeX
 nXwlG8QngGoAfk0gBxfwUVHy;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jbsZO-0000nJ-V8; Thu, 21 May 2020 21:17:39 +0000
Message-ID: <b5a5df35dbba7c49e19283745e7d65e45c1a1ef8.camel@samba.org>
Subject: Re: Avoiding further (LDAP) stack proliferation in Samba
To: Uri Simchoni <uri@samba.org>, Upstream Samba Technical Mailing list
 <samba-technical@lists.samba.org>
Date: Fri, 22 May 2020 09:17:33 +1200
In-Reply-To: <530356a1-a074-9cc8-ddf2-92a79b98dae8@samba.org>
References: <7f08ecb52a4a94d95e39af436e94ab852cf0da55.camel@samba.org>
 <530356a1-a074-9cc8-ddf2-92a79b98dae8@samba.org>
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
Cc: swen@linux.ibm.com, cs@samba.org, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2020-05-21 at 08:17 +0300, Uri Simchoni wrote:
> Does LDB (as client) have the full AD integration (Kerberos, sasl
> wrapping)? IIRC Only libads had that and then in 2015 the mentioned
> winbindd change added that to tldap.

Yes, since the very earliest days of LDB, because that is what it was
built for.  Since 2005 or so, eg a decade prior:

commit 03b0f279ed7d1ed7083e0c2301af94ff39f0e8a4
Author: Andrew Tridgell <tridge@samba.org>
Date:   Fri Jun 17 02:47:26 2005 +0000

    r7667: added a ldb ildap backend, using our internal ldap client
library. Next step is to
    remove the check for the ldap libraries in configure
    (This used to be commit 74841dbb2a86bb1c584b5c26c4cd24a818a65a34)

We have come a long way since then and we are doing much better now at
being a single project.

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba





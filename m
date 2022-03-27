Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CE94E8B25
	for <lists+samba-technical@lfdr.de>; Mon, 28 Mar 2022 01:57:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=yIhyXVq/mgK2Mq1GrImUDC0rs6Yu+Hh7MwpHII2pkrg=; b=2z2mTT7fuyZu4l10bSQDmWsZaj
	hfjZxdXvRJ9y3FsvIZo2FdHDVT8J/IZ1loIJ4+8MjSfOTZbR5WP4ghzn0swn8Mi5zPp8Rut5HY11D
	y6QUzyuqQPe2Sua7IGxp+u9ewKwybVWH6d7Zj/35BaCVbJYUmRsI/i7D+cDiL1sXafWmFq6hyXW1J
	YdzKUEfA2AL/lpZyy+XDYAKOFzA9sY8CIldwibx33aofdfnE+0x/YCWm/EbKXfpiR0e0RRgignNEY
	sFxxoelmPrHYN/GKlDtGSExxh1hrtdMQhJvUDOukUPrFaVuSj4nKexWITYni00NncbxtIB9i6nChj
	5j2HKjUw==;
Received: from ip6-localhost ([::1]:27272 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nYclC-005mpR-5S; Sun, 27 Mar 2022 23:57:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37918) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nYcl6-005mpI-U6
 for samba-technical@lists.samba.org; Sun, 27 Mar 2022 23:57:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=yIhyXVq/mgK2Mq1GrImUDC0rs6Yu+Hh7MwpHII2pkrg=; b=dRZv6IyI4SgBVtk4CM5ChFuAN5
 r8qIrlY1TBhy+5REeWl05wQlx3YhlCSmnZXMqZ3LyAnm4lYSlrYPJCdSqmxOoVNdITftZGNYmzKOg
 ++Kpd9H1vF87xClJsiSBwUeRi6fZQh8iCGkFGl7EQMuxvOVR66KVkSYLCb2XaQeaXPUhxi68hAMCz
 gSxrPxuRRZ09gkj75/z4RH+XZDPxx0QYW/XrCvCB64p27JJWyUSQuu2BLYFKNaL7eqtHCEn0BzZSK
 bHROYJjnJrAzLwaWhQIJdD3dYjR/+kO1Uc+5Pjd741cxSMU7wLZ9AJeZycfMFEHThHMwhnL7E8K3g
 6hJLIyKmZAk+Khx7L9ilakWGg3VGB64eDqXQ+4OvsOtYIhEKXbDBExfome/h+XsejHAK8qxL+Mo3i
 GY/fY6OhhH1hafYJ5wOaXbeRBWvnmcO2NNpnPJvZHu6IDYU90UDkX0pgvMUBulrD2MU0XWOFK7we6
 3t5Iu+aDwDw8dPiZOvO0wCzQ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nYcl4-003sCA-In; Sun, 27 Mar 2022 23:57:19 +0000
Message-ID: <7aae8b97cedd704ebc9d6355f4fa2f814753f385.camel@samba.org>
Subject: _PUBLIC_ in installed tdb/talloc headers used by Samba build
To: Michael Tokarev <mjt@tls.msk.ru>, Debian Samba Maintainers
 <pkg-samba-maint@lists.alioth.debian.org>, Upstream Samba Technical
 Mailing list <samba-technical@lists.samba.org>
Date: Mon, 28 Mar 2022 12:57:14 +1300
In-Reply-To: <02f1ba57-9c70-bc3e-c294-cf25ae0e0d1e@msgid.tls.msk.ru>
References: <d46fcec0-1ed1-bafe-9506-518f53c6ff06@msgid.tls.msk.ru>
 <02f1ba57-9c70-bc3e-c294-cf25ae0e0d1e@msgid.tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Sat, 2022-03-26 at 18:22 +0300, Michael Tokarev wrote:
> I got it finally. 3 days (but with only minor work ;) )
> 
> tdb.h, talloc.h etc now has _PUBLIC_ definition near every
> symbol they declare.  By default it defines to something
> reasonable. But samba defines it to attribute(visibility(hidden)).
> Which does not work when *importing* these symbols from a
> shared library..
> 
> I think we'll have to patch tdb.h to remove these _PUBLIC_
> marks. Or else it will be difficult to deal with.
> 
> This happened in the few latest versions of samba.

I think this might mean we need to extend the work to pre-process these
files before we install them.  See
buildtools/wafsamba/samba_headers.py.

The original work was justified as:

commit aacd3ecb45ab04cb2f8a38a385a45bdca6d88cd2
Author: Günther Deschner <gd@samba.org>
Date:   Fri Jul 16 17:29:40 2021 +0200

    tdb: Fix invalid syntax in tdb.h
    
    Defining _PUBLIC_ in the same way as in talloc.h resolves an issue
with
    a previous fix for Solaris Studio compiler 12.4 that prefixed all
calls
    in tdb.h with _PUBLIC_.  Thanks to Lukas Slebodnik
    <lslebodn@redhat.com>.
    
    Bug: https://bugzilla.samba.org/show_bug.cgi?id=14762
    
    Guenther
    
    Signed-off-by: Günther Deschner <gd@samba.org>
    Reviewed-by: Stefan Metzmacher <metze@samba.org>

commit 3c1013caf4b57c6af5a5d210df232c08a1227a17
Author: Björn Jacke <bj@sernet.de>
Date:   Thu Mar 7 12:50:29 2019 +0100

    tdb: fix studio compiler build
    
    Solaris Studio compiler 12.4 is pedantic about prototypes in
headers having
    the external visibility declarations too. It throws errors like:
    
    redeclaration must have the same or more restrictive linker
scoping: ...
    
    Signed-off-by: Bjoern Jacke <bjacke@samba.org>
    Reviewed-by: Andrew Bartlett <abartlet@samba.org>


Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions



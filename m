Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E5D67FB0C
	for <lists+samba-technical@lfdr.de>; Sat, 28 Jan 2023 22:01:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=VsNHcqXa/ErXNtYJK1YFzfKFCAzV7KSYX7W9IT1bXf4=; b=Yp68NnarkJDLKlQbBHFRDjhz5c
	BLcCa6Uoc1QoulhjC/T0TPyXyKf2MkVpT8fAPtgg+SXcFEZLP1mnXM+I/s9fLyMxYvHUqUi/7dw9a
	u9MHhMfkRNSsq/9FaneTepyTzaxV7j/nU73okwc+voJJei45rWE/3uK2URmOGG1HT1XQt709CPCHM
	GqWG2EZhq2snLT2XRqI71XeSz5xZn4+TY9/0JoceWp/DixLp6yBhHvA/8kAblD74OyugfgbxLBwIZ
	G74xFdK9DVIyOnwdJPAquggApF5/fZyP5k6VT5ySdmZrjS9qq2D7bhebf+UlyUprGycq7sU3UxlM7
	rFpYb5GA==;
Received: from ip6-localhost ([::1]:60866 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pLsJZ-0044lK-FI; Sat, 28 Jan 2023 21:00:45 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:44981) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pLsJV-0044lA-ET
 for samba-technical@lists.samba.org; Sat, 28 Jan 2023 21:00:43 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 5895440186;
 Sun, 29 Jan 2023 00:00:39 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 4BCE8DD;
 Sun, 29 Jan 2023 00:00:37 +0300 (MSK)
Received: (nullmailer pid 759999 invoked by uid 1000);
 Sat, 28 Jan 2023 21:00:37 -0000
To: samba-technical@lists.samba.org
Subject: [PATCH] pidl: actually allow "include" directive usage
Date: Sun, 29 Jan 2023 00:00:31 +0300
Message-Id: <20230128210031.759949-1-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Jelmer=20Vernoo=C4=B3?= <jelmer@samba.org>,
 Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

pidl used to have non-standard helper() and depends()
attributes. Commit d8ecabe452f36302105c6412ae5ab93cabfe5cf2
(in Nov 2006) implemented the standard include and import
directives, but it had a tiny omission: the "include" has
never been actually pushed to the list to be processed
later.  This commit adds implementation of type-IMPORT
typle and type-INCLUDE typle into a few places, and it
adds type-IMPORT typle to the list to process, but it
does not add the type-INCLUDE tuple to that list to be
processed later by the type-INCLUDE implementations.

This one-line omission lasted for 18+ years together with
the ton of warnings telling that helpe() is deprecated
and include should be used instead.

This tiny fix finally allows to convert helper() to the
standard include and get rid of this warning finally.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 pidl/lib/Parse/Pidl/NDR.pm | 1 +
 1 file changed, 1 insertion(+)

diff --git a/pidl/lib/Parse/Pidl/NDR.pm b/pidl/lib/Parse/Pidl/NDR.pm
index d17d0b404ed..52c0383f169 100644
--- a/pidl/lib/Parse/Pidl/NDR.pm
+++ b/pidl/lib/Parse/Pidl/NDR.pm
@@ -939,6 +939,7 @@ sub Parse($)
 		($_->{TYPE} eq "CPP_QUOTE") && push(@ndr, $_);
 		($_->{TYPE} eq "INTERFACE") && push(@ndr, ParseInterface($_));
 		($_->{TYPE} eq "IMPORT") && push(@ndr, $_);
+		($_->{TYPE} eq "INCLUDE") && push(@ndr, $_);
 	}
 
 	return \@ndr;
-- 
2.30.2



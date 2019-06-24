Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A12506B5
	for <lists+samba-technical@lfdr.de>; Mon, 24 Jun 2019 12:01:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=E30BnhYl8GBUTx8dOmLZXYJrdOpHNp+o81PnzsDlwt8=; b=mYQfvqUJwl4cqEmHk/B+vGFOhN
	GNt9zVl2JAX+hNnvzVJ+zrM+BfdVcvZJP0jHX88Ij9a0QriZ+XEJ3bsDYfwq+rqsFcMAb9hzaLLYO
	PceU5F2iygGmelzAXuB0sqFtfhTzbGw8PCgFrMAUHa/LEUAtXYW+Hkvaw/OM6V5wBDGuVndi8iNdf
	7wKI7vksoOoLkIv6PFhvM8cOs4y7rqjboFRrqbAZazi/VVxXJYdY63WbY3ACS2OEaHPkuyTScwIVI
	tNRQEC59jq+/UsdSRsJ4bDrqAvwNMHWpQjhJtXZNV9Do6UpW5at+8s5XiALQJGeeDyVroVBKSBJei
	MutRGACA==;
Received: from localhost ([::1]:51118 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hfLmr-001RJi-Gx; Mon, 24 Jun 2019 10:01:21 +0000
Received: from mo6-p05-ob.smtp.rzone.de ([2a01:238:20a:202:5305::8]:14474) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hfLmn-001RJZ-SW
 for samba-technical@lists.samba.org; Mon, 24 Jun 2019 10:01:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1561370477;
 s=strato-dkim-0002; d=habacker.de;
 h=In-Reply-To:Date:Message-ID:From:References:To:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=E30BnhYl8GBUTx8dOmLZXYJrdOpHNp+o81PnzsDlwt8=;
 b=sbztt3CQXCj7s/AOzcf4Ikt3eeEjS7a6cAD/Tbtd70nVxvO1PU8EM9y4l4sJXkLsni
 J9BNsSqWGShg6+4HaEK0iBXROm3nR1u6cwcZncdU4Ne7h3ZuqLlowJBYGfJyhlOq7qTO
 5ExAqWHLRFiOvqvwtwAwD+7GrFqggi3Nq5lQBySvvykc8RrOLDqIwyxtCRT4ypRzWT59
 EGut+0sonp4Sw0WNoq4dF28/I+hjCKKNGRyYQwf4XNniQBdCrysAcaQdpUM22Vjqtq/S
 jtARsf8yoclQC5qc+CoawVZWpTXaB9vBBsT9d1IiRahMxZD120TcLzaPzz9IIuDw64sF
 7kXw==
X-RZG-AUTH: ":Pm0Ic2Cgev01OMJUmdKKi4d4uwm4tenjFH72zyJC3kFMwckWOLT4go9HRj1ypvI="
X-RZG-CLASS-ID: mo05
Received: from [10.68.28.95] by smtp.strato.de (RZmta 44.24 AUTH)
 with ESMTPSA id w0847cv5OA1EW7P
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Mon, 24 Jun 2019 12:01:14 +0200 (CEST)
Subject: Re: [PATCH] winbind: fix crash in fill_domain_username_talloc() if,
 specified username is NULL
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
References: <b8d53d4b-0b73-4c70-5bc6-3c5e6f7d8a6a@freenet.de>
 <4843149.z4PxEiurGn@magrathea.fritz.box>
Openpgp: preference=signencrypt
Message-ID: <2844b045-daeb-c6ca-e05b-3ea16c8dbd8a@freenet.de>
Date: Mon, 24 Jun 2019 12:01:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <4843149.z4PxEiurGn@magrathea.fritz.box>
Content-Type: multipart/mixed; boundary="------------F9CFD485B6CCCA111073D119"
Content-Language: en-US
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
From: Ralf Habacker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralf Habacker <ralf.habacker@freenet.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.
--------------F9CFD485B6CCCA111073D119
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Am 24.06.19 um 11:44 schrieb Andreas Schneider:

> Hi Ralf,
> 
> could you please use:
> 
> if (user == NULL)
> 
Sure, see updated patch

Ralf

--------------F9CFD485B6CCCA111073D119
Content-Type: text/x-patch;
 name="0001-winbind-fix-crash-in-fill_domain_username_talloc-if-.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-winbind-fix-crash-in-fill_domain_username_talloc-if-.pa";
 filename*1="tch"

From cb550d3a9b5dd543b0a0d51fb78422d707d523d3 Mon Sep 17 00:00:00 2001
From: Ralf Habacker <ralf.habacker@freenet.de>
Date: Mon, 24 Jun 2019 09:25:48 +0200
Subject: [PATCH] winbind: fix crash in fill_domain_username_talloc() if
 specified username is NULL

Signed-off-by: Ralf Habacker <ralf.habacker@freenet.de>
---
 source3/winbindd/winbindd_util.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/source3/winbindd/winbindd_util.c b/source3/winbindd/winbindd_util.c
index 91a2f6ef197..5cabafa078c 100644
--- a/source3/winbindd/winbindd_util.c
+++ b/source3/winbindd/winbindd_util.c
@@ -1681,6 +1681,10 @@ char *fill_domain_username_talloc(TALLOC_CTX *mem_ctx,
 		can_assume = false;
 	}
 
+	if (user == NULL) {
+		return NULL;
+	}
+
 	tmp_user = talloc_strdup(mem_ctx, user);
 	if (!strlower_m(tmp_user)) {
 		TALLOC_FREE(tmp_user);
-- 
2.13.7


--------------F9CFD485B6CCCA111073D119--


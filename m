Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 296518FD212
	for <lists+samba-technical@lfdr.de>; Wed,  5 Jun 2024 17:50:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=ZshQW5+Yvs77RkOVYkLPSbsx9CYwtI4IqjJZpAsDy5I=; b=dJoKuNNqz7kEeKv4QLRE/wFjT2
	RA8I0qH0QrJq4zP7Xs+Og4tx/sLzgg5idHYlX5x6lN3rFiOwXAypWqrB4hGqcwDy59fFiEAlQbkp+
	PD5qEnAzjN9JD73rK/fDy8zBbL74W+W8sZ3CRUURvnpj8o3G6zr+NX2O9UyVTVKe0AK77cqziIKR5
	XM7uNnOyC70SVv0AghLH4k8RGUDp/prX5tTBKfrxLkljLb+ZEQXlG57thHBq8i+4lLnmHSk9DuFYd
	/9dxd56PcuQyvwn+xNS7gCr1u1iWfasKHAJObZQAjPwT0Lv6dflPkt28F4UihFCkrkDe1vMxoc00Y
	8VIZukFQ==;
Received: from ip6-localhost ([::1]:49422 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sEsuD-00Ck2B-NO; Wed, 05 Jun 2024 15:50:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59340) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sEsuA-00Ck23-2M
 for samba-technical@lists.samba.org; Wed, 05 Jun 2024 15:50:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=ZshQW5+Yvs77RkOVYkLPSbsx9CYwtI4IqjJZpAsDy5I=; b=VqYZzUNwWnv5MkidZztIKzYuSW
 i5wNNeB9wkNj9QH4siF/YC4WiAGN2NTzq65mpOyqlduZYNXIZ7phqHimaCaFVjR7znRK3FmyTbiAq
 EnqA3+x7KubMsVMoUSN6FqWs6Jhxkp6I12AaAOSV2VpMdNfafV7KlFdDyQjHwtwW5OJ+pCyStxVmp
 KCzRZ9RS001ts4ZFJzOdkEzQR2Syr9ub84ljC68SQj+WyCB97y8iZ0Yl3gyh76XFIcWz2weL9jSKX
 nTJBKf5BejNHOqkkanZ5MDLEBbsHwQ3bidY7dB+RXxNo/Zlx+KyWEJNMEgk1rd1d17WPxvtHYLc1S
 7t0IV2wUljtuZHcfcLdjI0syPHc/En9/lbgyIhZRul+xWOrcWy8/aHeIeyKw+7DpRVYYIh22RgmMz
 u80DWXznMHFGro6RB/OgzoC4dR2gKWT9PPQbB/jIfZUGLJUfAwUELb3EwuNoCSKmabfcp6CkQKZcC
 1/bkq2fg0FlQNy7D1c2JZgqz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sEsu8-00F89b-2j; Wed, 05 Jun 2024 15:50:24 +0000
Message-ID: <1ea6c4d8-b062-4619-87b9-ca7c2064aed0@samba.org>
Date: Wed, 5 Jun 2024 17:50:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: missing krb5 dependencies after recent changes in nightly bits
To: Vita Batrla <vitezslav.batrla@oracle.com>, samba-technical@lists.samba.org
References: <Zl4Dh9XZ2XsQWROD@ultra> <ZmCG254bAl-mvxIt@ultra>
Content-Language: en-US, de-DE
In-Reply-To: <ZmCG254bAl-mvxIt@ultra>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 05.06.24 um 17:40 schrieb Vita Batrla via samba-technical:
> I found the changeset that introduced the regression.
> The git bisect command says the culprit is:
> 
> $ git bisect bad
 >
> I suspect this change in lib/addns/wscript_build:
> 
> @@ -11,6 +11,6 @@ bld.SAMBA_LIBRARY('addns',
>                         error.c
>                         dnsquery_srv.c
>                     ''',
>                     public_deps='samba-util gssapi ndr resolv dns_lookup',
>                     public_deps='samba-util gensec ndr resolv dns_lookup',

Sorry for breaking it, I missed this:

 From 67f686a9495649cc2c201c051aaa35d5d8c64133 Mon Sep 17 00:00:00 2001
From: Stefan Metzmacher <metze@samba.org>
Date: Wed, 5 Jun 2024 17:46:53 +0200
Subject: [PATCH] lib/addns: remove unused kerberos/gssapi includes in dns.h

Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
  lib/addns/dns.h | 2 --
  1 file changed, 2 deletions(-)

diff --git a/lib/addns/dns.h b/lib/addns/dns.h
index abf0906fdabe..6e605cbec2eb 100644
--- a/lib/addns/dns.h
+++ b/lib/addns/dns.h
@@ -27,8 +27,6 @@

  #include "../replace/replace.h"
  #include "system/network.h"
-#include "system/kerberos.h"
-#include "system/gssapi.h"

  /* make sure we have included the correct config.h */
  #ifndef NO_CONFIG_H /* for some tests */
-- 
2.34.1



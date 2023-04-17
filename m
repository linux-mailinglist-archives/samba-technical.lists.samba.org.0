Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B5E6E4F36
	for <lists+samba-technical@lfdr.de>; Mon, 17 Apr 2023 19:29:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=mKEGRGfz8IBOlnKTw1z6NbzgK12PQsHMZ/s31Gf0+c4=; b=iAaUdQ0SoOAowMlVSDcKcgVIW9
	PndmG/QZvqPxKE+jSIzi/U1wBhjzz2vtpxl+A1FATxkg9R4cw2GTHvB7+g7sYqDUBk5ZoFLFBff2C
	DKekIos+JGwKPCirMNAyBfaU4N2uoKND37ZxUjNvH+vJeJg7vTy8pxdPB34c8rK8+kEeDnPYOGBwW
	jscvbqbeoyuoDsh+vewk+mWu1xwFs8LVNq19xtu2XwwHpiLr0UT4hdlmN4J/3I031bWt68+tsegti
	m8Ra3ytaDibhdgQqrYeOwgDtG2+gQjFXIF6LFR57IBQY4nQYXfeHVtrRBUbmH//G7O2FI4tQutaC+
	1KDKq0IA==;
Received: from ip6-localhost ([::1]:45106 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1poSfS-002Ltx-NC; Mon, 17 Apr 2023 17:29:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56502) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1poSfO-002Lto-Lu
 for samba-technical@lists.samba.org; Mon, 17 Apr 2023 17:29:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=mKEGRGfz8IBOlnKTw1z6NbzgK12PQsHMZ/s31Gf0+c4=; b=CdQn4OMuuVtXIl6QMmm1zh+7Zp
 kmUj8y7eN/I8OF/YCNTM/6i4gWCsopSJ5g/baIyiT4gNiMzLiAs79RqNA9My505gvdNDzZKpunuhc
 jh/NRXlUfIVlZpDNI4Mm89LX3Zf29si8Va9F4e/6uM1bv1VUsyIfof6Lf08CvAZEA3UCZTkEVFi/p
 PAvtSwxEkhSi86DyQ/8I9g5IAJH1wVHFMLEf2kzmheiY8UG1u/0ZN+zBY389jhedczYRpxr/nk097
 rMh0usTxFFRK/JSmPGZzGK9GsAMVPffuHBVpVxMulhvnlxs6Rg5GrRQqxqOlEFxFm1sHvDdQksafa
 9ZK96byBBLRN1M+F9nZKvd7BRIKRZxdCyr5IcYgF8PuJ59cKEiuXjKZSqcf0PwE3DVTjgDELaVybc
 2vuFAez94tY2m87+gjvP/+vOLuvUkIHywkBijTVWy4diufd7EKv3pywQeDjY1wzGQPOkdUv/IkmI/
 2qZ8c1A+O8Al+yqcZlODIRh6;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1poSfN-001gLZ-SF
 for samba-technical@lists.samba.org; Mon, 17 Apr 2023 17:29:25 +0000
To: samba-technical@lists.samba.org
Subject: talloc_fill
Date: Mon, 17 Apr 2023 19:29:25 +0200
Message-ID: <1934821.PYKUYFuaPT@magrathea>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

we have a way to set fill memory with a given value for debugging double frees 
using the talloc_fill feature. This was added because valgrind is slow and we 
didn't have AddressSanitizer. However we have AddressSanitzer and other nice 
tools now. So I think we could drop talloc_fill.

Any concerns?


I someone wants to really keep it, we could at least make it not a runtime 
option.


	Andreas


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D




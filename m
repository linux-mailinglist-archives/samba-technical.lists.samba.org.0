Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE1FB255DA
	for <lists+samba-technical@lfdr.de>; Wed, 13 Aug 2025 23:48:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=E5GjYwVFc1DJk0sFX2qSg8PTb300W3AbB3iMBsE0RRU=; b=cqka27+xcxI8LHpC62Lt3vZALS
	F7CEXuDzsn4llFZFd/5Ueut+PI7wtmEMKTYJ3z3rsj7tuYN10ic1M5ikPRjc5gVgyAt1JjptbC4vf
	VwNvTj7NnUI0TNXkT+ajFQBdReeoOIdzx9TjoVviEFs4Sxn7OOipbeaoIXCITMth9boRgo31I5pu4
	EjB0vCkS4GJ06AtWWwybZvoBKyYwmX4AkkzRKoM6jvXqZz67RXIlsNU/4NFstGXFtnD56QNDEOlXL
	MFCi0td9zr9eGX4NAhlUqv7m1EV3iXTy7AuRdpAMJsgUCb7aK+YQT6av2WcubFo1citr9B/Nva4Rh
	EmajANWA==;
Received: from ip6-localhost ([::1]:36724 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1umJKK-00Ez2d-Dw; Wed, 13 Aug 2025 21:48:08 +0000
Received: from cat-hlzsim-prod-mail1.catalyst.net.nz ([103.250.242.12]:60174) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1umJKE-00Ez2W-6c
 for samba-technical@lists.samba.org; Wed, 13 Aug 2025 21:48:05 +0000
Received: from [192.168.68.52] (unknown [114.23.145.136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: gary@catalyst.net.nz)
 by cat-hlzsim-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id BA32342A31
 for <samba-technical@lists.samba.org>; Thu, 14 Aug 2025 09:31:27 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1755120688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
 bh=E5GjYwVFc1DJk0sFX2qSg8PTb300W3AbB3iMBsE0RRU=;
 b=bQZRE6V1RsdtCqXeu8zBiPPv4/4JSGnW9/p+WMr5OfW0/6mDynqpAQLXwNVBHxVgqF0yP3
 wXFWyp5UAPSZi1ETEEpH82Rkwi84AOKxuhGESnG1jyr08tl40VgOxaP9rGByN0SpjNbIES
 4LPN4FBIkSNNBPJhKbFit866LzVBAXVoqxLsntRJ2EPgiqovFSXa82b8DSafr18DhaGLRc
 jhKWJ4WFX4+nD4lotuPDWMYnUqBIyojbvww8vHt+YNJe5r1VYrWL2uHFROORUFB6aH0NhP
 umrxortfwa5v2vYYJ4fz2NlbOLVBDTyBVcGqR7L/rGDPOcxbYcuaLXHpqaOnmQ==
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=gary@catalyst.net.nz smtp.mailfrom=gary@catalyst.net.nz
Message-ID: <c8670964-a318-429e-a73d-da6cf132f32f@catalyst.net.nz>
Date: Thu, 14 Aug 2025 09:31:26 +1200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: third_party/quic_ko_wrapper/quic_ko_wrapper.c uses vla in struct
To: samba-technical <samba-technical@lists.samba.org>
Content-Language: en-NZ, mi-NZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.10 / 15.00]; MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[catalyst.net.nz:s=default]; ARC_NA(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[];
 ASN(0.00)[asn:56030, ipnet:114.23.0.0/16, country:NZ];
 MIME_TRACE(0.00)[0:+]
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
From: Gary Lockyer via samba-technical <samba-technical@lists.samba.org>
Reply-To: Gary Lockyer <gary@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

When I try and build current master with clang-20 I get the following error.

../../third_party/quic_ko_wrapper/quic_ko_wrapper.c:3523:11: error: 
fields must have a constant size: 'variable length
array in structure' extension will never be supported
  3523 |                 uint8_t cmbuf[cmspace];
       |                         ^
1 error generated.

I believe this is a non-standard extension that GCC supports, is this 
something we should try to get fixed upstream?

Ngā mihi

Gary

-- 
Gary Lockyer
Catalyst.Net Limited - Expert Open Source Solutions

Catalyst.Net Ltd - a Catalyst IT group company
DDI: +64 4 123 4567 | Mob: +64 21 123 4567 | Tel: +64 4 123 4567 | www.catalyst.net.nz

CONFIDENTIALITY NOTICE: This email is intended for the named recipients only. It may contain privileged, confidential or copyright information. If you are not the named recipient, any use, reliance upon, disclosure or copying of this email or its attachments is unauthorised. If you have received this email in error, please reply via email or call +64 4 499 2267.



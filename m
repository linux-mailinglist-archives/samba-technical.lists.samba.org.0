Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B4B80484D
	for <lists+samba-technical@lfdr.de>; Tue,  5 Dec 2023 04:48:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=AnbsJDLwNdp5ER0p6mnpYqzDLXzmxMvL2Sk7Z6OUSh0=; b=jCkl6S51qL8N92+IaGPdL/2J6e
	aJNWN2ZP7SAQScjN0xPYt4siwCvi4eCXRIAgN4odKR1BQPlhEs1eWve6MIB/jpcmOU6/5l64lMMoT
	FZyNUyNExIhoTaIdUIEpZUaGtcNFk48qaNBrPjzcKfzo4CWF8HJ1ihLl/Tx33JhEi7zgUh27FBn2x
	mg6UQdZ8b6Qq+9jL15i9HY5/gUWX1KlB0PSiT5fE2HOvSdITpbdUXAIyCzyX/BBfenzUF4PFU6niQ
	tzWFP879+qXFlUzJPZhYjtW2JcuYmXt6slupevNiUO+nMm5MblZObou6QMnnPonr3JV2tGJ+EZokt
	1igfMxaQ==;
Received: from ip6-localhost ([::1]:36294 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rAMPo-004FlL-36; Tue, 05 Dec 2023 03:48:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13772) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1rAMPi-004FlC-AU
 for samba-technical@lists.samba.org; Tue, 05 Dec 2023 03:48:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=QfhS/17Xqzqz+VY/yb8qWn6lbYe898FfyUPZCRPFjXM=; b=V9GSn9IeJ7ruoTsDYk7ikGjRiY
 dHzlgTmiFPMi908fu+BATECRG9me1wEpUesC8pYrS7Z83FpKZbjcEKNPFnjyB8HEEHdPjA5h3jzKa
 HccZDOO3nNM3za/ugt6b34w5NvchX1kVLUlLwy0qxZdc5DSnlDj6D13LyatAaprfEsmxooQM0mJqx
 8XsGKzFwMAIhoXoWplWiDacuu0VJqw+Hs0w1ySVsGqiqv4RazH0s1q0X1AMYRWjttmG2PXL9iM7T5
 RgAYV99cYBKJWsCjjU7z6hLl0Ti+g36iQ148WAhe44WKqK65uYe/3QHl/ghNboIqHNxrsiItSfFuW
 Xng0M/FN9wOWjfQgkNikQ6/oN+M06i7oDiOP/cMlzvcu8zDcIWcxaAEgtci8XTncALErsFRkB96j6
 R8Hs5n1sMaqyNuNm8tyD7pXn+7gax5RWJ9JnrerAYEFmVw9K9IV7JkrEUAzNt3dNYEyKEJ+2UI+wL
 8L3aCyRHR1TktKnw0BlB83/l;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rAMPh-001wfT-0B for samba-technical@lists.samba.org;
 Tue, 05 Dec 2023 03:48:01 +0000
Message-ID: <7fb8e63cdc9de2c284cffc792c458df3b017c392.camel@samba.org>
Subject: Looking to once again re-bundle LDB
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Tue, 05 Dec 2023 16:47:56 +1300
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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

Just a heads up that I'm still keen to reduce the burden of an LDB
release at Samba security release time.

The rough consensus at the end of 
https://gitlab.com/samba-team/samba/-/merge_requests/374 seems to be to
make ldb:
 - for public consumers behave like any other Samba public library (eg
libwbclient), by removing the independent tarball and build system.
 - for Samba builds by default, to install ldb as a private library. 

The version numbers would remain, but could then diverge between ldb
and pyldb-util for example (they would no longer be the tarball number,
so would move just like other SO numbers do).

We would change the ldb modules dir to have the version string in it,
so that modules are not installed for the wrong version.

My current motivation comes from working on a pyldb change that would
change pyldb-util, but also a long-running desire to make this simpler.

Debian currently has this patch: 
https://sources.debian.org/src/samba/2%3A4.19.3%2Bdfsg-1/debian/patches/Force-LDB-as-standalone.patch/

This makes Samba public libldb as a public library, but from the main
Samba build, so that the ldb build system is no longer used.

Andrew Bartlett


-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/Samba Team Member (since 2001) https://samba.orgSamba Team Lead                https://catalyst.net.nz/services/sambaCatalyst.Net Ltd
Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company
Samba Development and Support: https://catalyst.net.nz/services/samba
Catalyst IT - Expert Open Source Solutions

Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E789361469C
	for <lists+samba-technical@lfdr.de>; Tue,  1 Nov 2022 10:27:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=doz+40P2yljcOXGjY5uf9AZNvK9L/vDANNKoLLa5Z28=; b=t1Jh0E/tpI9aM2xnaD58wTyBWG
	m763Gen09cf0ovQIDywItvH15ieKlMFXxSm5cpnOCYMdGD2vFbHMvx3g623ZlGL15ZBPP6jc+yWKJ
	qBqPIKp0iR5H7vn0qlkwwZ4I3xZP5ZIpUgVkQfZW03IovWnEhDZK3fvsqvmkiCvaNwDlJkHzembcw
	iVFG9sxigbCZ9+9RQi3KnRFT8ij1E8ewfSsDf5xD0xV3WjMxWfh2Czk2xxxth6CC+0dwFFMGWe/t+
	zs3xA0qtWS+aw15y1w8Qw0qqIm3TNSN30KH+3jn/zEr2f7CRDKk3bMt/Dt3WA+i9MvliGuKXdeWJU
	4VWJNWgQ==;
Received: from ip6-localhost ([::1]:36574 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1opnYL-009mZr-7C; Tue, 01 Nov 2022 09:27:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41384) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1opnYG-009mZg-34
 for samba-technical@lists.samba.org; Tue, 01 Nov 2022 09:27:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=jnY8FZUTuRZ1YzYS5bpg5DtiK5yv2lx7oidGLSRIEjQ=; b=Cxr21solrN1QWPy4A8xYGBgjnM
 eBxywfanoeuQ3XX1C7CpgK6hrxpU0xAKq2t3Frso6M6sDXlhugh97w9K0U2d2jISFcVGpsJ0mHvmj
 YvqTZjlAnTgr0LEopx7IIY7R8Cn+kNAxsWk5ppJyw7TwQaG9GACegbohobjrsyHTs/B+1uWo6aiUM
 dXXnpWD8zAT26foYXnggIyNMU5q3V4lY1tGmLX550/Ytv9CdQXsqAYYOebeRktkt5TgmGzIH27O7F
 wTZ4x+Zlo82hQAY4OagexT7JsPZKIUvXRd6LbzU9snNieK5xvE7ba+/3BrISQglZxbivZqhDCgvNq
 1iMbd/N3eYrCqbNE8THbVx3UkGrbu43zOBlN7oD1kYTLSKAvHhtQkqBxHFAnZb9RU62HnhSPUzF8T
 Ar6fR+jtf8SvX50nsCl7LiRv4luDOdW+Cf9UHiM61DsyUv4z7Hqk6Oo8T6rSxXWcTC0kKQWVD00X/
 vi7SrKmwzinyhK+njDShKO/g;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1opnYE-006iDs-Am; Tue, 01 Nov 2022 09:27:18 +0000
Message-ID: <2e31fd859d3244ca1424c658407e9e32564dbe8b.camel@samba.org>
Subject: Re: [PATCH 1/2] ndr: restore libndr.so.2 ABI compatibility:
 ndr_print_debug
To: Michael Tokarev <mjt@tls.msk.ru>, samba-technical@lists.samba.org
Date: Tue, 01 Nov 2022 22:27:14 +1300
In-Reply-To: <20221101092113.2691975-1-mjt@msgid.tls.msk.ru>
References: <20221101092113.2691975-1-mjt@msgid.tls.msk.ru>
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Andreas Schneider <asn@samba.org>,
 Pavel =?ISO-8859-1?Q?Filipensk=FD?= <pfilipen@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Please submit this via GitLab. =C2=A0 In particular git-send-email is
specifically called out as not being a suitable way to submit patches
to samba, as the From header is munged by the lsit.

Yes, I know the CI is a problem in your situation, but we can trigger
those if pushed to the shared development repo.

Andrew Bartlett

--=20
Andrew Bartlett (he/him) https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Developer, Catalyst IT https://catalyst.net.nz/services/samba


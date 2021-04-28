Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CEC36D130
	for <lists+samba-technical@lfdr.de>; Wed, 28 Apr 2021 06:19:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=1Z4vfa+ZtZqSg79U0tz8w+mD9UzAe4Gwbz49Kcuqo3E=; b=Br3yZ90RNdziu/Zox4f6ZLUkqL
	H7xB8HciXzXfdTDZ1DV+LNxjKdqlPTJiRDz/FSCOklFucup4ZCyX347MAmPeXbrHRO5yp5e9HhaVM
	+uRItuhdMg0JWGfrhjToqMbZzLn9YZu2GGRjEquxN5LEwhCAOAFvjpfWGyecjNwFqoeT/sHSPDD5O
	as9SnCfd6hAkaEmSRYEwkgzQ3JlsbIPTO8V71G6WQoyTgPnqcg+aGF82+SZy34UdludfYnSSt1GCV
	/Smw2DcGcpeKsmXgpwIHUx1kBUoP1pa9WX/e60odlbEVLlqPX1TwcsjC8XuPwpJ7AaU4e+LQNnJCf
	vJb7rxqA==;
Received: from ip6-localhost ([::1]:47506 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lbbe8-00Cljv-7r; Wed, 28 Apr 2021 04:17:56 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:43602) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lbbe3-00Cljo-8B
 for samba-technical@lists.samba.org; Wed, 28 Apr 2021 04:17:53 +0000
Received: by mail-lj1-x229.google.com with SMTP id m7so59861476ljp.10
 for <samba-technical@lists.samba.org>; Tue, 27 Apr 2021 21:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=1Z4vfa+ZtZqSg79U0tz8w+mD9UzAe4Gwbz49Kcuqo3E=;
 b=Gd0qS5m0IlBomU+nWrQRLcU5LJ5m7aXcV4gmBCUplZhvY8TiQ5CCzVHRjRwvh9pAer
 ku+wqLWHHkii3kynsLX/JrrdUhJq2cOnGnL/QQ/A5EmEq9mQGN4aqfnHOOdaTCfi4Iph
 F81wpAmtaBMDwL6EC/ToMpJequ9+QrRNxoNL1vmv5sFcGt1cHOghsetFdIwoN51JgfIi
 ur0o6d0ZWxzGXB+iJ/DNS0edk17tPUS7SXEr6Zq2oeBu0VJbKPRefne8U6MnLhRbTMmc
 oLtFEZSgNmau3L4bPh8Eg/62c0WsQMckCMwzQm6zFX1F8Zpg9CTpwuMCeG2Gm9USb3Ks
 kzRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=1Z4vfa+ZtZqSg79U0tz8w+mD9UzAe4Gwbz49Kcuqo3E=;
 b=EYweXoxWaCiwJGYLJjkJNPtrTNZZGwYWDDdhIFTdwr696Mskgj7gg19ZcAQ26vng4r
 UP3thvPxvrlKvqv4lYNcDaJXDNQWqbBXP9hoXzf6DU8xr2N0YIfpi++oiYLQ8T+4TZS+
 4+Vf+X1kHGX3hJKsvuZ9LkzwvNkC7DRuWQ9PLFGs00YEBlVUpcRIBoY5wP2vZ0QOTW9U
 bXIhtXhFSAUVaPdLXQDMtceFuOnMGdovT8FMOwdwtXfgOHhIF9pVHsYIyv6GNAhxOJZK
 O9Ap6y3Akap2rU/r8yBFI5btsIlbDtVuaNL4bJn3dknQsjghqLgKD+PtfLUgf8z0fAXQ
 Q97A==
X-Gm-Message-State: AOAM532Z6yd+JfaKYeRoUCC8UxPJTpbGkmgI7q0+MKewJcZFHsmoiBTC
 h0XySttRjpt6UugUTyonmQd+IeAP4DP7v9dMuCE=
X-Google-Smtp-Source: ABdhPJy5nCZeAM4goOEpylC6mO2PX9VvT/IZY5LJTfGVrcU61ZD1vZTGbL33bPjTm6Kp6cIF6cku8vTA0euL6DBnKVk=
X-Received: by 2002:a2e:6e03:: with SMTP id j3mr18748254ljc.218.1619583469596; 
 Tue, 27 Apr 2021 21:17:49 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 27 Apr 2021 23:17:38 -0500
Message-ID: <CAH2r5muZOD+d-x4ci=z2Ebi3mkyCUBj286aX+u17SQZ-XDpgMg@mail.gmail.com>
Subject: [PATCH] smb3.1.1: enable negotiating stronger encryption by default
To: CIFS <linux-cifs@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: samba-technical <samba-technical@lists.samba.org>,
 linux-cifsd-devel@lists.sourceforge.net
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Now that stronger encryption (gcm256) has been more broadly
tested, and confirmed to work with multiple servers (Windows
and Azure for example), enable it by default.  Although gcm256 is
the second choice we offer (after gcm128 which should be faster),
this change allows mounts to server which are configured to
require the strongest encryption to work (without changing a module
load parameter).

Signed-off-by: Steve French <stfrench@microsoft.com>
Suggested-by: Ronnie Sahlberg <lsahlber@redhat.com>
Reviewed-by: Ronnie Sahlberg <lsahlber@redhat.com>
---
 fs/cifs/cifsfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cifs/cifsfs.c b/fs/cifs/cifsfs.c
index 4a3867a7cc5b..8a6894577697 100644
--- a/fs/cifs/cifsfs.c
+++ b/fs/cifs/cifsfs.c
@@ -75,7 +75,7 @@ bool enable_oplocks = true;
 bool linuxExtEnabled = true;
 bool lookupCacheEnabled = true;
 bool disable_legacy_dialects; /* false by default */
-bool enable_gcm_256;  /* false by default, change when more servers
support it */
+bool enable_gcm_256 = true;
 bool require_gcm_256; /* false by default */
 unsigned int global_secflags = CIFSSEC_DEF;
 /* unsigned int ntlmv2_support = 0; */

-- 
Thanks,

Steve


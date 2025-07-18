Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D76FB09A6D
	for <lists+samba-technical@lfdr.de>; Fri, 18 Jul 2025 06:08:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=7u7PuI8e8MoaiFGfxTPRTE+KFsuIEbSKe5QQLRuKvL0=; b=OG9/7Qx07DUoOzkyuHt0hiEbo7
	Rcy54BnnlNpH18TZ6iK5nUVNgy7wAneBV+q7HtabWVaUlMyOhIXKZWCGHtj7Ibv6dOHHCpAv74cDO
	5kai4LK2IG1BVfOKxL9IaniGNiFAuAjiZbnDhoIvxNzvux7narXQziIDRQNYqHnTDmvaRnw/ID3+f
	WYb/aoPLPwd3rp+OrTORzpY0pwGaT0dTcniPHuYh4qjtDlOVl9iSIJWDsgyG4oz0fAivoLhRrJd2M
	rgP6K8817Gg4pL+yq7MYqdW1doJOXpFGBizr4pzmfQbTWk2gVHVe5zx/yIWeTI9gKAE/YMyR/xfog
	9N3uuA0Q==;
Received: from ip6-localhost ([::1]:48972 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uccNi-00BQ1h-Bb; Fri, 18 Jul 2025 04:07:34 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:58496) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uccNa-00BQ1a-Is
 for samba-technical@lists.samba.org; Fri, 18 Jul 2025 04:07:29 +0000
Received: by mail-qt1-x836.google.com with SMTP id
 d75a77b69052e-4ab63f8fb91so15651461cf.0
 for <samba-technical@lists.samba.org>; Thu, 17 Jul 2025 21:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752811644; x=1753416444; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=7u7PuI8e8MoaiFGfxTPRTE+KFsuIEbSKe5QQLRuKvL0=;
 b=bACVSo40So4YpycxuB7uxRIeNS45qHMyda14mq8jYaU8VrFs0G7rRer3zfcBFweXmh
 LkrCltJf3ZObCkzLnLJfP0UYNrrSvXw/jaamcARgSdlw2vHQaEafvd+vxmeKv/Igs6Vh
 FAILyt7CS33cdwGbf/JvF7iVi4D0iZCWarPuSnNz3q3UMvVZAYVVcFeuStNYmc+CXk62
 Jz5LmT2awLndW3jkTh7kYuv6iTV9eta9vubhvanbphNxPSpC68NRonKsu+0KkaEkr4k3
 RoM+TVk+c+21FlCO50ntiu7eIXZmx1pnb88ZdnCZYDLVerznSe5HJQppnqcGvIwZ+kRw
 e0gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752811644; x=1753416444;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7u7PuI8e8MoaiFGfxTPRTE+KFsuIEbSKe5QQLRuKvL0=;
 b=qC3gt33iycl4oIlQJAcxrM2LZVW7r+KPRY/keAjM9Y7rCcvoNm2iMl7tQklZ9Mmhit
 QkwZMtPc1tMOfPHJpsr0xXB/7ivb/E1V5ubJV9wfFEOCeqwrl0cHxogdmywU3Gi502bE
 UtGv/xCzzs+KOuy2WR6m72qcvN/6n1kbTJ7PekWW63UJdGYd+IZJlfwmLWbzR64/sYcS
 Y1WPXeEu1nAhCX39uv8hYFhpbaY5OtzGRDsFmvb662aJdjpoImzej9Tbe1I7aOiCnoAa
 upcEvAuxKhHuSLOVKNW3vIAEk0j4uaeAKvG8C8utJ4qCpW2QI+HC8MIE7Nqi9g2mjywc
 3tNA==
X-Gm-Message-State: AOJu0YzvGZfruF3b6P3veNM1qcMFDFt3svBC49nT3jl0LnAcHJnP3tgG
 KV59X23R6ijRdnDqJ5EV3wqV4ZJ+EzjHn1dfv5SVGo44D4nq8JwcGl0FteQTG33CoE4KV9W9FgE
 7sUpgM5w5IssHx8FDkLnzxmWnY2a/6JpVyje98JM=
X-Gm-Gg: ASbGnctdP4AJyCi6T7wcF1bdW0ueTByzjMP4kX9Cfa4/n0PIEYSgurGDyNX8lD0PdP4
 jIGWXSGHdBGHvhri1HfiY0ZUWfYIq30pg0WkEvjAeu2r7lG1fgcWrXvX2D/yCL3XNhl5xauu3VB
 Xrljzlxznn2wEW+6benQoQWe9BPNDhd7X77NWHLrcm4Un6hqbKmA9mNzMlc6Qo4rczEONkmc2vi
 JF5/8H8Z0ZtRBGyvufG3Lpg9bvNCjfzGGpKKbEv
X-Google-Smtp-Source: AGHT+IFwZbOi1gEoQz4VgkUNCzg2hbfaS2P4CJYuTHkfMM5Hla3encwAcg+kuJV3MQn43SwQ5B/L2MGpgiELlw0I9UQ=
X-Received: by 2002:a05:6214:2b8d:b0:705:1175:6165 with SMTP id
 6a1803df08f44-70511756168mr60275066d6.37.1752811644124; Thu, 17 Jul 2025
 21:07:24 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 17 Jul 2025 23:07:12 -0500
X-Gm-Features: Ac12FXyAEhW1rPj00V9u9r5Dx8jB_Cy_lPKM5LxmTO4wwGqsSmD0H8YhYYFM_bY
Message-ID: <CAH2r5msVdabcDudGyR47StT_VoKazD_A0kdAaGMRh+UD060PhQ@mail.gmail.com>
Subject: Updated SMB3.1.1 POSIX testing results to Samba
To: samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Content-Type: multipart/mixed; boundary="0000000000006817cb063a2c4343"
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--0000000000006817cb063a2c4343
Content-Type: text/plain; charset="UTF-8"

I have done a detailed update of the passing and failing and skipped
(e.g. when test only relevant to local filesystems) tests, and updated
the wiki page so others can add their observations etc.  See below:

    https://wiki.samba.org/index.php/Xfstest-results-Samba-Linux

There are 231 currently passing xfstests from current Linux client to
current Samba which is very good news.

Attached is a script ("run-smb311-linux-tests) which will run all 231
passing tests.

The failing tests are listed clearly in the wiki, and likely many of
them are going to be easy fixes (especially those failing with
incorrect mode bits or unexpected access denied).  Fixes welcome,
since there are about 140 tests to dig into more (many of which may
eventually turn out not to be relevant).

As we fix additional of these, I plan to remove the "experimental"
warning that log during mount with "linux" (or "posix") for smb3.1.1
client mounts, since I am seeing huge benefits with the SMB3.1.1
Linux/POSIX extensions already.

-- 
Thanks,

Steve

--0000000000006817cb063a2c4343
Content-Type: application/octet-stream; name=run-smb311-linux-tests
Content-Disposition: attachment; filename=run-smb311-linux-tests
Content-Transfer-Encoding: base64
Content-ID: <f_md8anti60>
X-Attachment-Id: f_md8anti60

Li9jaGVjayAtY2lmcyBjaWZzLzAwMSBnZW5lcmljLzAwMSBnZW5lcmljLzAwMiBnZW5lcmljLzAw
NSBnZW5lcmljLzAwNiBnZW5lcmljLzAwNyBnZW5lcmljLzAwOCBnZW5lcmljLzAxMCBnZW5lcmlj
LzAxMSBnZW5lcmljLzAxMiBnZW5lcmljLzAxMyBnZW5lcmljLzAxNCBnZW5lcmljLzAxNiBnZW5l
cmljLzAyMCBnZW5lcmljLzAyMSBnZW5lcmljLzAyMiBnZW5lcmljLzAyMyBnZW5lcmljLzAyNCBn
ZW5lcmljLzAyOCBnZW5lcmljLzAyOSBnZW5lcmljLzAzMCBnZW5lcmljLzAzMSBnZW5lcmljLzAz
MiBnZW5lcmljLzAzMyBnZW5lcmljLzAzNiBnZW5lcmljLzAzNyBnZW5lcmljLzA0MyBnZW5lcmlj
LzA0NCBnZW5lcmljLzA0NSBnZW5lcmljLzA0NiBnZW5lcmljLzA0NyBnZW5lcmljLzA0OCBnZW5l
cmljLzA0OSBnZW5lcmljLzA1MSBnZW5lcmljLzA2NCBnZW5lcmljLzA2OCBnZW5lcmljLzA2OSBn
ZW5lcmljLzA3MCBnZW5lcmljLzA3MSBnZW5lcmljLzA3MiBnZW5lcmljLzA3NCBnZW5lcmljLzA3
NSBnZW5lcmljLzA4MCBnZW5lcmljLzA4NCBnZW5lcmljLzA4NiBnZW5lcmljLzA5MSBnZW5lcmlj
LzA5NSBnZW5lcmljLzA5OCBnZW5lcmljLzEwMCBnZW5lcmljLzEwMyBnZW5lcmljLzEwOSBnZW5l
cmljLzExMCBnZW5lcmljLzExMSBnZW5lcmljLzExMiBnZW5lcmljLzExMyBnZW5lcmljLzExNSBn
ZW5lcmljLzExNiBnZW5lcmljLzExNyBnZW5lcmljLzExOCBnZW5lcmljLzExOSBnZW5lcmljLzEy
NCBnZW5lcmljLzEyNSBnZW5lcmljLzEyNyBnZW5lcmljLzEyOSBnZW5lcmljLzEzMCBnZW5lcmlj
LzEzMiBnZW5lcmljLzEzMyBnZW5lcmljLzEzNCBnZW5lcmljLzEzNSBnZW5lcmljLzEzOCBnZW5l
cmljLzEzOSBnZW5lcmljLzE0MCBnZW5lcmljLzE0MSBnZW5lcmljLzE0MiBnZW5lcmljLzE0MyBn
ZW5lcmljLzE0NCBnZW5lcmljLzE0NSBnZW5lcmljLzE0NiBnZW5lcmljLzE0NyBnZW5lcmljLzE0
OCBnZW5lcmljLzE0OSBnZW5lcmljLzE1MCBnZW5lcmljLzE1MSBnZW5lcmljLzE1MiBnZW5lcmlj
LzE1MyBnZW5lcmljLzE1NCBnZW5lcmljLzE1NSBnZW5lcmljLzE2OSBnZW5lcmljLzE3OCBnZW5l
cmljLzE3OSBnZW5lcmljLzE4MCBnZW5lcmljLzE4MSBnZW5lcmljLzE4NCBnZW5lcmljLzE5OCBn
ZW5lcmljLzIwNyBnZW5lcmljLzIwOCBnZW5lcmljLzIwOSBnZW5lcmljLzIxMCBnZW5lcmljLzIx
MiBnZW5lcmljLzIxNCBnZW5lcmljLzIxNSBnZW5lcmljLzIyMSBnZW5lcmljLzIyNSBnZW5lcmlj
LzIyOCBnZW5lcmljLzIzNiBnZW5lcmljLzIzOSBnZW5lcmljLzI0MSBnZW5lcmljLzI0NSBnZW5l
cmljLzI0NiBnZW5lcmljLzI0NyBnZW5lcmljLzI0OCBnZW5lcmljLzI0OSBnZW5lcmljLzI1NSBn
ZW5lcmljLzI1NyBnZW5lcmljLzI1OCBnZW5lcmljLzI2MyBnZW5lcmljLzI5NCBnZW5lcmljLzMw
NiBnZW5lcmljLzMwOCBnZW5lcmljLzMwOSBnZW5lcmljLzMxMCBnZW5lcmljLzMxMyBnZW5lcmlj
LzMxNSBnZW5lcmljLzMxNiBnZW5lcmljLzMyMyBnZW5lcmljLzMzNyBnZW5lcmljLzMzOSBnZW5l
cmljLzM0MCBnZW5lcmljLzM0NCBnZW5lcmljLzM0NSBnZW5lcmljLzM0NiBnZW5lcmljLzM1NCBn
ZW5lcmljLzM2MCBnZW5lcmljLzM2MiBnZW5lcmljLzM2NCBnZW5lcmljLzM2NiBnZW5lcmljLzM3
NyBnZW5lcmljLzM5MCBnZW5lcmljLzM5MSBnZW5lcmljLzM5MiBnZW5lcmljLzM5MyBnZW5lcmlj
LzM5NCBnZW5lcmljLzQwNiBnZW5lcmljLzQwNyBnZW5lcmljLzQxMiBnZW5lcmljLzQxNyBnZW5l
cmljLzQyMCBnZW5lcmljLzQyMiBnZW5lcmljLzQyMyBnZW5lcmljLzQyOCBnZW5lcmljLzQzMCBn
ZW5lcmljLzQzMSBnZW5lcmljLzQzMiBnZW5lcmljLzQzMyBnZW5lcmljLzQzNCBnZW5lcmljLzQz
NiBnZW5lcmljLzQzNyBnZW5lcmljLzQzOCBnZW5lcmljLzQzOSBnZW5lcmljLzQ0MyBnZW5lcmlj
LzQ0NSBnZW5lcmljLzQ0NiBnZW5lcmljLzQ0OCBnZW5lcmljLzQ1MSBnZW5lcmljLzQ1MiBnZW5l
cmljLzQ2MCBnZW5lcmljLzQ2MSBnZW5lcmljLzQ2MyBnZW5lcmljLzQ2NCBnZW5lcmljLzQ2NSBn
ZW5lcmljLzQ2OSBnZW5lcmljLzQ3MSBnZW5lcmljLzQ3NCBnZW5lcmljLzQ3NiBnZW5lcmljLzQ5
MSBnZW5lcmljLzQ5OSBnZW5lcmljLzUwNCBnZW5lcmljLzUyMyBnZW5lcmljLzUyNCBnZW5lcmlj
LzUyNSBnZW5lcmljLzUyOCBnZW5lcmljLzUzMiBnZW5lcmljLzUzMyBnZW5lcmljLzU1MSBnZW5l
cmljLzU2NCBnZW5lcmljLzU2NSBnZW5lcmljLzU2NyBnZW5lcmljLzU2OCBnZW5lcmljLzU3MSBn
ZW5lcmljLzU4NiBnZW5lcmljLzU5MCBnZW5lcmljLzU5MSBnZW5lcmljLzU5OSBnZW5lcmljLzYw
NCBnZW5lcmljLzYwOSBnZW5lcmljLzYxMCBnZW5lcmljLzYxMiBnZW5lcmljLzYxNSBnZW5lcmlj
LzYxNiBnZW5lcmljLzYxNyBnZW5lcmljLzYxOCBnZW5lcmljLzYyMyBnZW5lcmljLzYzMiBnZW5l
cmljLzYzOCBnZW5lcmljLzYzOSBnZW5lcmljLzY0MiBnZW5lcmljLzY0NiBnZW5lcmljLzY0NyBn
ZW5lcmljLzY1MCBnZW5lcmljLzY3NiBnZW5lcmljLzY3OCBnZW5lcmljLzY4MCBnZW5lcmljLzY5
NCBnZW5lcmljLzcwMSBnZW5lcmljLzcwNSBnZW5lcmljLzcwNiBnZW5lcmljLzcwOCBnZW5lcmlj
LzcyOCBnZW5lcmljLzcyOSBnZW5lcmljLzczNiBnZW5lcmljLzczNyBnZW5lcmljLzc0MiBnZW5l
cmljLzc0OCBnZW5lcmljLzc0OSBnZW5lcmljLzc1MSBnZW5lcmljLzc1NSBnZW5lcmljLzc1OCBn
ZW5lcmljLzc1OSBnZW5lcmljLzc2MCBnZW5lcmljLzc2MSBnZW5lcmljLzc2MyAK
--0000000000006817cb063a2c4343--


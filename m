Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 712E6168D74
	for <lists+samba-technical@lfdr.de>; Sat, 22 Feb 2020 09:04:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=ReY31URjLn5VApDustMGxEwM8GwNuCFvK62fv+IDSdo=; b=cF8MTE+QkWI6IBRUt7CQ2kGomd
	klB2u6XposKDhbk07LHh8bYOPonsIWpKujzEXUrk5nBQuQvvRAZQYZfimE/iyqOhY8fHsdopL5qHP
	vKJhEJKlTs3+yK5tfPlj/jbwQ1rGu8NoNFzn537G+L5nmp8yKiZj6MbPfWxVUx4l50+Uq9o8vFiFX
	HHBJXYKTfHp+rv0Ys1TkF25PdRITnw+vSa3airtF3+6GZQEQpHbLcvuumkMCgHdhat8S027pHFv2i
	5DIQEoFiaAUxoD2VgE0dZy2I5UmfWcX9JVuXngC6rd9oSlia9u0ZTpG0IFdy3YGUcnyUbP18yQCl6
	BSHb6VqA==;
Received: from localhost ([::1]:57474 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j5Pl5-00B3i9-Sp; Sat, 22 Feb 2020 08:03:31 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:41383) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j5Pl1-00B3i2-1b
 for samba-technical@lists.samba.org; Sat, 22 Feb 2020 08:03:29 +0000
Received: by mail-io1-xd2c.google.com with SMTP id m25so4979437ioo.8
 for <samba-technical@lists.samba.org>; Sat, 22 Feb 2020 00:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ReY31URjLn5VApDustMGxEwM8GwNuCFvK62fv+IDSdo=;
 b=s6MJEZETWUfOb7AY97CjQDo0dEIn/Ej5mMgH70qfi8k2do9p6zz7lXquz+eUgIcpyN
 fgr1vvoFwLqZh8AIeMtCwGIYfQ9i88Ma9LYnfPLLMvAnzjiPFL3aSD2R9cVGDhSKvuN2
 fgdnl/lbeiJoGWtRGVbunmBCWECKGgabB2qX4hBzu9+DViLmWqUrmx1HxoOBcwc/qful
 OZwM6eTop+zdvviRPqZoERbnMdxv7T8+J2hxPC0zwMuQX74k0WKkMUi/8AvZOHzPSbhF
 koeFlpx37h7APxUGmPTOK9dwyeY2BfxyDoY0QdNKAbh6/FROZZegzMLCQvLIiOZGS0mv
 akeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ReY31URjLn5VApDustMGxEwM8GwNuCFvK62fv+IDSdo=;
 b=BjptrJvLSeTKbUyAUK2t63rYFGSm/2VT34Oqtvd0bEx2Tc04dogJQpYK54kbVD0ZW3
 08ycCXFhDeqm6N36Cg16S200c6p0EVwhbg6yEaKsCMMnP8IvuSk/LDZOQZxUoajEEawX
 o5z2TzFjv1QrdrjiJgnzYK6dfq4ItEjBC9LAbQ+OSyqon83tbhCkoPd6+4CxvzI+FoLq
 xD6o1/o20Mg866nHEaAmrTEI3TF5KXP4TYIeCieUdpgmKo7uTRXGw267yHFr8M8QsXuC
 uzZXPGP5GduV2tyvMrOY+SlYeuY6UnuDTjK8UEygiWW+eDwDDT+I8evbQHSdeeH+dnRu
 ZEbA==
X-Gm-Message-State: APjAAAXpp1xNtm1gfjvsSi4e/E37ZHakjVS3Pvx02q1hz3EuhWWudhc3
 V1OdVlX8zHD+l8j19FbBhvN7X7xQoJhmgh8Y7s3pxm8m
X-Google-Smtp-Source: APXvYqyOctpDQZwHS4ZxFwShsmA+LyR0pLrrb12r3b/j026wZBZgl3m8yZWDbekeLoU7bpF1kiv0+J0otxib8dkOb+E=
X-Received: by 2002:a5d:9cc7:: with SMTP id w7mr33400874iow.159.1582358604662; 
 Sat, 22 Feb 2020 00:03:24 -0800 (PST)
MIME-Version: 1.0
Date: Sat, 22 Feb 2020 18:03:13 +1000
Message-ID: <CAN05THSsnmesxc0UH17OK95KXAY5NCYisNc6pNyGDykYd=R1ig@mail.gmail.com>
Subject: ndr64 support
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

List

Does samba support the NDR64 transfer syntax?
This was introduced in 2008 and makes alignment better for various
fields.

I just noticed that when I use libsmb2 against samba 4.10 it always reject
NDR64 as an unsupported transfer syntax and instead always pick NDR32.
If I disable NDR32 support then the bind will fail completely with no
suitable transfer syntaxes.

I am testing against 4.10. Which is reasonable new.

regards
ronnie sahlberg


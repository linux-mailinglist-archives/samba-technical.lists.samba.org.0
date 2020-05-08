Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FD01CBAED
	for <lists+samba-technical@lfdr.de>; Sat,  9 May 2020 00:52:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=MjFOubR2fM1su4m0AlnsVNrbk/YK2h4ODLQs+9h5V18=; b=CMy3jV4i9l3ELZpt3dE+K3omud
	y/KHuc7r62Yv4MtoP32nEyRhDBp04GKnziJFvsvqxTNUbE3/xU4cf56fCMjlU/dqCi13iMsMYuXgT
	jklEqeEWY/nV8L/RTwc4jeATrfHLqxhelGwjZ47t6kU6zLIlnbbs3JXgVich+TXo6DPS0oRzHrFFB
	VsLwz/8t8FyA9hGXIa3NwM6cdieFBsIfODWsz+4Stc5dJp8qdecQAcCxuhalFGfkkL9JLQokZ4Tlc
	1SsyMzdO5He399faNUjzEG8t1cXyHw+IpqYO2PRFs8RAhsS2pSePmK+eVkbC4cF7IuELLCwAqAa00
	dpfrQOvA==;
Received: from localhost ([::1]:46550 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jXBqE-003KDH-54; Fri, 08 May 2020 22:51:38 +0000
Received: from mail-ed1-f41.google.com ([209.85.208.41]:35040) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jXBq8-003KDA-54
 for samba-technical@lists.samba.org; Fri, 08 May 2020 22:51:34 +0000
Received: by mail-ed1-f41.google.com with SMTP id h15so333077edv.2
 for <samba-technical@lists.samba.org>; Fri, 08 May 2020 15:51:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=MjFOubR2fM1su4m0AlnsVNrbk/YK2h4ODLQs+9h5V18=;
 b=pmbV+UUCE7E9mH7k26zg35wxKmMJS3i8zCcJQ6Ve5QaJpIDV8diWJxZp/dT+G7RSsB
 HT01dbOrBciENAcVBk92cnBWX9mL0cg0Ovn5p9Vl2nQFO0rFBJ46mv+aFhzspSFpmBLu
 FCkZByLoDFIAROxSFP8hCLuyYDYlygJl7fm43MZX1XpEaJxSRFSEab816iLxoE6TRhRa
 RawIf4mzxmm5Ra1jXnlXxh28NInhU7dvETT0xCuzj8pe1WmDtTlk3HDE825htxuBlmYe
 vAvdRmon8bjlGs0+SQbcuj3GlUPu3akZEQUBNCaU2PpmQof9WUFVMURXbcD4ikhmYl0u
 eFqQ==
X-Gm-Message-State: AGi0PubYVK/xtBefzNfuSv26+vJbTGRUD+XoomAbzUVaxfphFx+xS0tE
 cxwXm9xm5Uq0gg6OWOBDQ6CPKc8C1QCydKcP+dN0dfMN
X-Google-Smtp-Source: APiQypIf+ocdZ7HUBnTwJ2D31a7PmoJNgh5R9QjnxG7GKU6URMJ2nPQQWviIZxV2bvELrSJA+8D0D6Ty0FEMsMc4IHQ=
X-Received: by 2002:a05:6402:1f6:: with SMTP id
 i22mr4367531edy.271.1588978289802; 
 Fri, 08 May 2020 15:51:29 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 8 May 2020 18:51:18 -0400
Message-ID: <CALSyjX6H7DgbqJze_01MexNR=SQxozYvhtB9p6cJQicYFuyfUQ@mail.gmail.com>
Subject: [PATCH] trivial quota wscript error message spelling fix
To: Matt Taylor via samba-technical <samba-technical@lists.samba.org>
Content-Type: multipart/mixed; boundary="0000000000008546eb05a52ad610"
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
From: Matt Taylor via samba-technical <samba-technical@lists.samba.org>
Reply-To: Matt Taylor <liverbugg@rinux.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--0000000000008546eb05a52ad610
Content-Type: text/plain; charset="UTF-8"

Noticed this when looking at how other options were handled while
working on the vfs_snapper configure patch.

Trivial fix in the quota configure failure message.

Signed-off-by: Matt Taylor <liverbugg@rinux.org>

--0000000000008546eb05a52ad610
Content-Type: text/plain; charset="US-ASCII"; name="samba-spelling_trivial.patch.txt"
Content-Disposition: attachment; filename="samba-spelling_trivial.patch.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_k9ysiusl0>
X-Attachment-Id: f_k9ysiusl0

ZGlmZiAtcnUgc2FtYmEtbWFzdGVyL3NvdXJjZTMvd3NjcmlwdCBzYW1iYS1tYXN0ZXItcGF0Y2gv
c291cmNlMy93c2NyaXB0Ci0tLSBzYW1iYS1tYXN0ZXIvc291cmNlMy93c2NyaXB0CTIwMjAtMDUt
MDggMDc6MTY6MTguMDAwMDAwMDAwIC0wNDAwCisrKyBzYW1iYS1tYXN0ZXItcGF0Y2gvc291cmNl
My93c2NyaXB0CTIwMjAtMDUtMDggMTg6NDM6NDYuMDAwMDAwMDAwIC0wNDAwCkBAIC0xNjYzLDcg
KzE2NjMsNyBAQAogICAgIGNvbmYuZW52WydsZWdhY3lfcXVvdGFfbGlicyddID0gbGVnYWN5X3F1
b3RhX2xpYnMKIAogICAgIGlmIE9wdGlvbnMub3B0aW9ucy53aXRoX3F1b3RhcyA9PSBUcnVlIGFu
ZCBub3QgY29uZi5DT05GSUdfU0VUKCdXSVRIX1FVT1RBUycpOgotICAgICAgICBjb25mLmZhdGFs
KCdxdW90YSBzdXBwb3J0IG5vdCBmb3VuZCBidXQgaXQgd2FzIGVxdWVzdGVkICEnKQorICAgICAg
ICBjb25mLmZhdGFsKCdxdW90YSBzdXBwb3J0IG5vdCBmb3VuZCBidXQgaXQgd2FzIHJlcXVlc3Rl
ZCAhJykKIAogICAgIGNvbmYuQ0hFQ0tfQ09ERSgnKHZvaWQpdW5zaGFyZShDTE9ORV9GUyk7JywK
ICAgICAgICAgICAgICAgICAgICAgaGVhZGVycz0nc2NoZWQuaCcsCg==
--0000000000008546eb05a52ad610--


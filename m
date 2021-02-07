Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FFB3127B3
	for <lists+samba-technical@lfdr.de>; Sun,  7 Feb 2021 22:52:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=F82X3W2AY/QrMnUkudV3tCnZU4q3c7c2kq5HaNOKLFA=; b=f4FXHhUndEgy0kok89fNC9ETB1
	yGTLHFqzzIW/d/WFcB/5bwSljvkAn1EaWvTjK/HhQfvkvVeg6/iT/C3ZmazByVXbhDg3Vk+FmerpD
	tUAVfJYU2VLRgjzrQ0JZUDEtfad1MIov0/GEexiNZzQOStGhOkiTrW+0CyTHL1OxbY8nx21PAE8BD
	ONr3VnyVyxIAD8ujLvWBIxw7XTAlXEDBi1rAL21AP6KAEV9gWs/59bIEFBpQutxNkpJT55WVfz3S+
	tNxYys24lT49BsCW0T3T56v4MPNQlhKfVEeswCM7d1KmQ3WQvvsi95AfWXe28Tci7QVDBqObA2sc8
	Khf9mWRw==;
Received: from ip6-localhost ([::1]:19822 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l8ryC-00BXxU-I0; Sun, 07 Feb 2021 21:51:52 +0000
Received: from valentin-vidic.from.hr ([2001:470:1f0b:3b7::1]:51051) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l8ry0-00BXxG-Am
 for samba-technical@lists.samba.org; Sun, 07 Feb 2021 21:51:45 +0000
Received: by valentin-vidic.from.hr (Postfix, from userid 1000)
 id E185C4F8B; Sun,  7 Feb 2021 22:51:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=valentin-vidic.from.hr; s=2020; t=1612734691;
 bh=F82X3W2AY/QrMnUkudV3tCnZU4q3c7c2kq5HaNOKLFA=;
 h=Resent-From:Resent-Date:Resent-To:From:To:Cc:Subject:Date:From;
 b=BN0kU5+vz/XSu+eBGBfcab+AF7zWn03tSeXYVIXQZUaCJhg63NR2SgTv7NwFTUEEI
 fYLOAorcXid6ErQmudQaVj8vLuvNzgs0I11fVVCW68jbY1MEBaRInAJWVst7GwYS2d
 KVQzo5wo9jTI51ujzYGxhZOJaItNoEouEYK1sVJQpQyYQJ55Sy1Reo39MLHk59GWE9
 iLhm6HfUJHSp/zivRIXm15p04XoUzARnjkmDEFSc0Qfp5rzzZasi9zp8+qkUYbcO9R
 d5RCN/yWRXAuoC39rCW14+DP2ctuUymaKaz3iJE2xYCfvtwBnIdBwWOpy1YBxv+Nsa
 8MEP0qfMa2knhiP/h8a05i+iGXwV50QcF9eSo4MnL9NiGGkk1sXN14F7FdktlHjmjr
 Ue6rkZW6TO9mHj2vMYowwcoTcBPiwRj7IcWODF+LNlb3a5G3adlBOxRZIS3szOgfil
 UFBnB9D5yPQc3TLDs3oSkp5tCb6p8BzzHAj6JgxU+05bBOs8PqtfUcJexb83Zv7j3E
 kR8NhV3QZ/vks2t9Ykq1+xL7zZHnmz3UqF8Kg3h0i/VAnHfJelSi8MqJP+z1PuYYtu
 iraDPK4kKi+GiiyS3dOSIp+DNnKY+lbc1RymLNtaj/d0YCNE/37lG3gh+JrM0+a/MM
 /CBEfiy2NfWGOjrAzK1kKYMg=
Resent-From: Valentin =?utf-8?B?VmlkacSH?= <vvidic@valentin-vidic.from.hr>
Resent-Date: Sun, 7 Feb 2021 22:51:31 +0100
Resent-Message-ID: <20210207215131.GW29617@valentin-vidic.from.hr>
Resent-To: samba-technical@lists.samba.org
Received: from valentin-vidic.from.hr ([unix socket])
 by valentin-vidic.from.hr with LMTPA; Sun, 07 Feb 2021 21:32:45 +0100
X-Cyrus-Session-Id: cyrus-3216-1612729965-1-13634664766214338081
X-Sieve: CMU Sieve 3.0
Received: by valentin-vidic.from.hr (Postfix, from userid 1000)
 id 6BC074F86; Sun,  7 Feb 2021 21:32:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=valentin-vidic.from.hr; s=2020; t=1612729965;
 bh=F82X3W2AY/QrMnUkudV3tCnZU4q3c7c2kq5HaNOKLFA=;
 h=From:To:Cc:Subject:Date:From;
 b=hkDGEA8DU8EuRDdKA0YH5utu+AS6SYFnIDz5fXNdY4gs//Q8DaY0b7CG60oRfc8Sl
 BQwqBvj61ymugU7WkeEu5iLNKIkOjy5g3CsfPDtsVhgb0jK1DnyzJdeNJsG7jsiQp7
 ZrfAUNFogIg00FuEUz7SbhJqjqCahHosm9ow06ZIvnTiscSXiKgM9oltI5DFMg7BgI
 HRiH/Ks/1/6AagRDRsWJ3xcNKbgcIM+rT7HbU2i8srRP7TWU1DXeh7AuufmBbpq83s
 viTdODgAi7vHJqEXPoI70MRe9A1BAggMgnW1keaNEwtIC/M4xXHPQD4+9ZpQGk4HFo
 uvjOYf4yh6msjOxv+knEtaSlrkQbJlMFFtysgiT8hkk7CAlAY08Hx9Rxr5nE9ozLHd
 ofI7QLKhzdfxDhKMk1zBV05ilcKXA8tfBfY60WUNRJc5l9WwbsmOye7dgLFX0ysth7
 hlEVeGZ3TTKAL+vrs3oZ0N1+tWdwlw2qPMaKWyOrlJjZJ6eCSEL9GwS0DQmEk1Jlh3
 JckDpxyfFi3Bb+JPidL3zLvJYM3OIc3sLDxov0T9H4A/VfEVbvjMuh9latIhLu6TpB
 k3WbliQvvvkTr+s8wH4GQ1eS+ddlwxKs+uxZr60UsMzTM8WSjg72/oU4I7tEY9XECM
 t/Q81cIKt7tZTi/iavqV+3YM=
To: samba-technical@lists.samba.org
Subject: [PATCH] libpamtest: fix comments for pamtest_conv_data
Date: Sun,  7 Feb 2021 21:32:43 +0100
Message-Id: <20210207203243.3284-1-vvidic@valentin-vidic.from.hr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
From: Valentin Vidic via samba-technical <samba-technical@lists.samba.org>
Reply-To: Valentin Vidic <vvidic@valentin-vidic.from.hr>
Cc: Valentin Vidic <vvidic@valentin-vidic.from.hr>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Comment descriptions were reversed for out_err and out_info.

Signed-off-by: Valentin Vidic <vvidic@valentin-vidic.from.hr>
---
 include/libpamtest.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/libpamtest.h b/include/libpamtest.h
index 0307a26..3b1276f 100644
--- a/include/libpamtest.h
+++ b/include/libpamtest.h
@@ -128,12 +128,11 @@ struct pamtest_conv_data {
 	 * an index internally.
 	 */
 	const char **in_echo_on;
-
-	/** Captures messages through PAM_TEXT_INFO. The test caller is
+	/** Captures messages through PAM_ERROR_MSG. The test caller is
 	 * responsible for allocating enough space in the array.
 	 */
 	char **out_err;
-	/** Captures messages through PAM_ERROR_MSG. The test caller is
+	/** Captures messages through PAM_TEXT_INFO. The test caller is
 	 * responsible for allocating enough space in the array.
 	 */
 	char **out_info;
-- 
2.20.1



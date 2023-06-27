Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4160A73FAA6
	for <lists+samba-technical@lfdr.de>; Tue, 27 Jun 2023 13:00:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=RIUt2Ft1o30U23wYcQKX77KPT4EHEePjKFgWZAKiDuw=; b=E7AOt267cRxclBduvgDfEeNID3
	bN6Lrihix34/Mrjz+TuJNZdqP7aHgdfCsX5+0CHzoQ+4jr7qcf17qkrAMlu164IM2Vd7B1aylXBjw
	Pf0532y69t1of4aBF7cynlajlqJD5UHdPI5bHg8/lWmlOjJPos0k/m+SumT0Bj2cMTjKnD2oly682
	xQlbrO5VS3g6zUEOiF1QPSSUKVTPoO5N8inKAgeLm2RqWsAKTXlI/Y9y72coxy0jZ/WuiMNKRx3yk
	n9GO9QiYUW5QEE83ZiIS4+P3W7QacFgkCB9q8MF1tcs3Zko27yWRutjudnHb4BPXDB4jJkTrCaDVI
	aTINM2wg==;
Received: from ip6-localhost ([::1]:55972 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qE6QW-004h33-8K; Tue, 27 Jun 2023 11:00:04 +0000
Received: from lilac.mail.einfra.hu ([2001:738:0:415::6]:44224) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qE6QP-004h2s-88
 for samba-technical@lists.samba.org; Tue, 27 Jun 2023 11:00:00 +0000
Received: from [2a02:ab88:38c:6f80:22f4:369a:de82:97f6] (helo=fin)
 by lilac.mail.einfra.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <wferi@niif.hu>)
 id 1qE68M-0002gn-JB; Tue, 27 Jun 2023 12:41:18 +0200
Received: from wferi by fin with local (Exim 4.94.2)
 (envelope-from <wferi@niif.hu>)
 id 1qE68K-001bSk-9e; Tue, 27 Jun 2023 12:41:16 +0200
To: samba-technical@lists.samba.org
Subject: Is this a real memory leak?
Date: Tue, 27 Jun 2023 12:41:15 +0200
Message-ID: <87v8f9gpbo.fsf@fin.soreny>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
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
From: =?utf-8?q?Ferenc_W=C3=A1gner_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?utf-8?Q?Ferenc_W=C3=A1gner?= <wferi@niif.hu>
Cc: wferi@niif.hu
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Dear Samba developers,

Please take a look at the following patch, taken from
https://github.com/balabit-deps/balabit-os-8-samba/commit/5f46ae6282db1457b8ef8bbfb4e97eb4aadd55b4:

From 5f46ae6282db1457b8ef8bbfb4e97eb4aadd55b4 Mon Sep 17 00:00:00 2001
From: Balazs Scheidler <bazsi@balabit.hu>
Date: Wed, 22 Aug 2012 11:34:43 +0200
Subject: [PATCH] nsswitch/libwbclient: fixed a memory leak in
 wbcAuthenticateUserEx

(cherry picked from commit zorp-os-5.0 / f0e88410bd2528517910f780d71e63f8effb91ef)
---
 nsswitch/libwbclient/wbc_pam.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/nsswitch/libwbclient/wbc_pam.c b/nsswitch/libwbclient/wbc_pam.c
index e4cd2963..b16c9424 100644
--- a/nsswitch/libwbclient/wbc_pam.c
+++ b/nsswitch/libwbclient/wbc_pam.c
@@ -415,6 +415,7 @@ wbcErr wbcCtxAuthenticateUserEx(struct wbcContext *ctx,
                                 params->domain_name,
                                 sep_response.data.info.winbind_separator,
                                 params->account_name);
+                       winbindd_free_response(&sep_response);
                } else {
                        strncpy(request.data.auth.user,
                                params->account_name,

Do you agree that this patches an actual memory leak?  If so, would you
please consider taking it?
-- 
Thanks,
Feri.


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E3946212F96
	for <lists+samba-technical@lfdr.de>; Fri,  3 Jul 2020 00:38:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=+uqm7yFRSuDHbdu4fhhCVoVb/GblzT6ogcfUKoSa38g=; b=vFRkEo2RB6Mnatf3TwUWSR7Yx1
	KDWCqjrkVKmVhwfW7ucW3U5Cq9RfBq7Pe1IByFg9hqPO915crWXAEtj+G+k15L1d3zJw2VflxIwis
	4a+SruGJFLCicYalpdUU3u0NbrnikpgMp3VbWvUb2K3ja5KFtnyhsL4k3VsSEx81BtSilSKN4ZSTw
	TA7s4eYZQJK1ihzrVDTIHMIvNanKppo/0qlJd8C3s/FfErZesvSN9LS+d5M6/fZCBZYijt1WCF9qk
	eMSjbBV/RbCw4jHvfcmWpUKFm1bx46f8eM10iUjBH3nwWUygn5qiLEApYhWJ8YhSXWj37/9PRGSnc
	2HzqRaLQ==;
Received: from localhost ([::1]:45060 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jr7qJ-005CLE-QI; Thu, 02 Jul 2020 22:38:07 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:32986) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jr7qB-005CL7-DQ
 for samba-technical@lists.samba.org; Thu, 02 Jul 2020 22:38:03 +0000
Received: from [10.22.32.23] (wlgwil-nat-wlan.catalyst.net.nz [202.78.240.10])
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 3AE6481413; 
 Fri,  3 Jul 2020 10:18:52 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1593728332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:autocrypt:autocrypt;
 bh=+uqm7yFRSuDHbdu4fhhCVoVb/GblzT6ogcfUKoSa38g=;
 b=MeBQsf0fjTsExSlqtAxh/I+VjXlQRrAHRbgcFwul3oiOB+/OcCiyNkn1JqXUIYOU+9ws/5
 s96IgrL0w7jRdEpVIh2yu8fTQorrLA+LfTKOW8Ly4FF7uIExCn8r9kY3xl6tjoRczh8GHC
 U6cRpeB+7G5P2YlKILyv+dM8IPxORr4VphtxV8otL+16MJccI+ksSSGhBNRCHOiZ74i2fH
 fScDIo8rMIEYGa8THsvUbgAE3GRvWbjb1RxX/uGEsD1cTO1JlKBXTwFYTxr+HioRaFbz4r
 n7N2JTlcbHBYwuSNj4PAU4UY1/uhL6T+XldPrIkDRv2P+gx584NyoaveCfRzHQ==
To: samba-technical <samba-technical@lists.samba.org>
Subject: [PATCH nsswrapper] nwrap_files_getaddrinfo: avoid crash on empty name
Message-ID: <abd3c805-c26b-972c-e721-eb3d373d3682@catalyst.net.nz>
Date: Fri, 3 Jul 2020 10:18:51 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------E2C6BCF84C711E37ED114ABE"
Content-Language: en-NZ
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Cc: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.
--------------E2C6BCF84C711E37ED114ABE
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

This patch helps the test environment stay up when you are looking at
bad DNS packets.

Douglas

--------------E2C6BCF84C711E37ED114ABE
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-nwrap_files_getaddrinfo-avoid-crash-on-empty-name.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-nwrap_files_getaddrinfo-avoid-crash-on-empty-name.patch"

From 0d217bdfe19535093405206c4fcc43978918153e Mon Sep 17 00:00:00 2001
From: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Date: Sun, 17 May 2020 13:14:08 +1200
Subject: [PATCH] nwrap_files_getaddrinfo: avoid crash on empty name

When name is "", we would deref name[-1]. If by chance name[-1] was
'.', we also tried to copy all of memory from one place to another.

Rather than just guard the immediate next branch, let's assume the
empty name is never found.

Signed-off-by: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
---
 src/nss_wrapper.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/src/nss_wrapper.c b/src/nss_wrapper.c
index 17c8732..4f4dc93 100644
--- a/src/nss_wrapper.c
+++ b/src/nss_wrapper.c
@@ -4070,6 +4070,10 @@ static int nwrap_files_getaddrinfo(const char *name,
 	}
 
 	name_len = strlen(name);
+	if (name_len == 0) {
+		return EAI_NONAME;
+	}
+
 	if (name_len < sizeof(canon_name) && name[name_len - 1] == '.') {
 		memcpy(canon_name, name, name_len - 1);
 		canon_name[name_len] = '\0';
-- 
2.17.1


--------------E2C6BCF84C711E37ED114ABE--


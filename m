Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6ED142DC
	for <lists+samba-technical@lfdr.de>; Mon,  6 May 2019 00:29:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=rD1Yv08Hv+vzxudJDCYCwQ/X/4r80KweD+kvN6bC3jk=; b=0J3kPMzpIJiooHr7GN4yZzKvrt
	1R4U5YH/FcAN5Ipy1wgHxcbmnH6XbM5voAmHzV6FrlNHXBlXLgJSCOHCS5VP6T/ajCCTOAN+86SEP
	2ZXLw1hPMNorrlMCc1Z6LuNheeAVLhvdQyuTav7pZEVUruA7yjdqMGLUMe06UY/1TcrJd+RPImxZ7
	eWZKOTPOeyApJzuuqbX3Sh8k3+uvIeN8rj5jHbpWm0M5I1tAyvQNXwIW4GlnnxrlvIeAaYZyWqhP8
	kd/9mCEF2IbKfdfaugpzxpGvEoPlafwLf1kxl+GSGXj3UAAfrXA1Q8l1Q3qCVku3D9AarZ9tWzyQB
	lng1CFZQ==;
Received: from localhost ([::1]:47848 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hNPdG-002UbX-0S; Sun, 05 May 2019 22:29:18 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:44568) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hNPdB-002UbQ-Di
 for samba-technical@lists.samba.org; Sun, 05 May 2019 22:29:15 +0000
Received: by mail-pf1-x429.google.com with SMTP id y13so5677634pfm.11
 for <samba-technical@lists.samba.org>; Sun, 05 May 2019 15:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=rD1Yv08Hv+vzxudJDCYCwQ/X/4r80KweD+kvN6bC3jk=;
 b=qjSYIVQMvCZJxnq9DpunzVOa0s27kPATZDONu/AkTVyezeBTuskaASTh1CkTbvoKUC
 8fC+7hpPP/y7U9Pl0lVUGjeV+FmuEDBk+lchMTweqtmCW1AfVE7vJvaiBOyLuPspVt05
 w1HYy7Dc5FUOMszUi5ce2kQ5Xs+rbIDT4YDO20XANpjHberCNeqBz/SuCophaFiAuplW
 Usgv+Tgt7Nd0c2fnSs8KOdMAL2ly+Z1CVs6aJValwDUtr+cDiGznyXDY3nGt866X1/Tk
 BdByxamU8XgprqipH3BHuwv1MQPP/bokru5tQwYV1Ww9DYAj0VJ8UosPU7ufsDUap6lh
 NMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=rD1Yv08Hv+vzxudJDCYCwQ/X/4r80KweD+kvN6bC3jk=;
 b=WW2ZHn46ewHBAZ7qfHrSUppyy25ODucR+dZ7F5qwgZouVPkc1Rfh0OzKhT2NbCOiMC
 yZqREXXO65DcmOTFCA4QvbEAvV9rjXwOBudp+ZdT6GDSxEL91ZwY1ZCKG0VYHZavLAMu
 Axo7I42Lrgsdge4MkvRLsy9b0tPV08yhPywEjnT/uCHrDNzL84GfSRa08bknmlWgQbot
 2rvQlTOQAftxS3aFMfYJXnUkV9I1qz6dxJqFMesAWXM0p6lv/ZmaNyhsj2wEItpJ0VNh
 s2ghG9oi4KNcinwKUt1k4ojlJAb0EWvoMckyoAfY78AS6EI5mtI0nLlO4PQGOgpMJCgx
 t1XQ==
X-Gm-Message-State: APjAAAWkvkBbQqo1QmM31h0TTMCXCj73Ni5CaJzxw/cMeSIUlIGVTzRa
 7DhIyhx3v1zEFMuhGoaQpq8YRFVW8sKt5PmS+MTkSh92
X-Google-Smtp-Source: APXvYqzHmxwMzw8+SUBGpd5ytn/U7nXw+Q/qPKxaN3qf8Ko2LJEj4INwkBf+sgFVByE58YOyxisB13J/Ea71nasSh/c=
X-Received: by 2002:a62:479b:: with SMTP id p27mr29969265pfi.111.1557095351164; 
 Sun, 05 May 2019 15:29:11 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 5 May 2019 17:28:59 -0500
Message-ID: <CAH2r5mt+ogjdc9w+ppvu+GwWfojFOK_izStTkOgjs07bXVbO2A@mail.gmail.com>
Subject: [PATCH][SMB3] Add SMB3 protocol flags and structs for change notify
To: CIFS <linux-cifs@vger.kernel.org>
Content-Type: multipart/mixed; boundary="00000000000049ea1f05882b83f1"
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--00000000000049ea1f05882b83f1
Content-Type: text/plain; charset="UTF-8"

See MS-FSCC 2.6 and MS-SMB2 2.2.35



-- 
Thanks,

Steve

--00000000000049ea1f05882b83f1
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb3-Add-protocol-structs-for-change-notify-support.patch"
Content-Disposition: attachment; 
	filename="0001-smb3-Add-protocol-structs-for-change-notify-support.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jvbicz2m0>
X-Attachment-Id: f_jvbicz2m0

RnJvbSBhZmU1NDg2YTMxMzMwYTE4MWViMGZkMTQwMGQ5ZDQxMjQyY2JiNTFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFN1biwgNSBNYXkgMjAxOSAxNzoyNToxMiAtMDUwMApTdWJqZWN0OiBbUEFUQ0hdIHNt
YjM6IEFkZCBwcm90b2NvbCBzdHJ1Y3RzIGZvciBjaGFuZ2Ugbm90aWZ5IHN1cHBvcnQKCkFkZCB0
aGUgU01CMyBwcm90b2NvbCBmbGFnIGRlZmluaXRpb25zIGFuZCBzdHJ1Y3RzIGZvcgpjaGFuZ2Ug
bm90aWZ5LiAgRnV0dXJlIHBhdGNoZXMgd2lsbCBhZGQgdGhlIGhvb2tzIHRvCmFsbG93IGl0IHRv
IGJlIGludm9rZWQgZnJvbSB0aGUgY2xpZW50LgoKU2VlIE1TLUZTQ0MgMi42IGFuZCBNUy1TTUIy
IDIuMi4zNQoKU2lnbmVkLW9mZi1ieTogU3RldmUgRnJlbmNoIDxzdGZyZW5jaEBtaWNyb3NvZnQu
Y29tPgotLS0KIGZzL2NpZnMvc21iMnBkdS5oIHwgMzQgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9mcy9jaWZzL3NtYjJwZHUuaCBiL2ZzL2NpZnMvc21iMnBkdS5oCmluZGV4IDg2OGIwMDU2ODA4
Yy4uNmJiZmFlYzQyMjYzIDEwMDY0NAotLS0gYS9mcy9jaWZzL3NtYjJwZHUuaAorKysgYi9mcy9j
aWZzL3NtYjJwZHUuaApAQCAtMTE0OCw2ICsxMTQ4LDQwIEBAIHN0cnVjdCBzbWIyX3dyaXRlX3Jz
cCB7CiAJX191OCAgIEJ1ZmZlclsxXTsKIH0gX19wYWNrZWQ7CiAKKy8qIG5vdGlmeSBmbGFncyAq
LworI2RlZmluZSBTTUIyX1dBVENIX1RSRUUJCQkweDAwMDEKKworLyogbm90aWZ5IGNvbXBsZXRp
b24gZmlsdGVyIGZsYWdzLiBTZWUgTVMtRlNDQyAyLjYgYW5kIE1TLVNNQjIgMi4yLjM1ICovCisj
ZGVmaW5lIEZJTEVfTk9USUZZX0NIQU5HRV9GSUxFX05BTUUJCTB4MDAwMDAwMDEKKyNkZWZpbmUg
RklMRV9OT1RJRllfQ0hBTkdFX0RJUl9OQU1FCQkweDAwMDAwMDAyCisjZGVmaW5lIEZJTEVfTk9U
SUZZX0NIQU5HRV9BVFRSSUJVVEVTCQkweDAwMDAwMDA0CisjZGVmaW5lIEZJTEVfTk9USUZZX0NI
QU5HRV9TSVpFCQkJMHgwMDAwMDAwOAorI2RlZmluZSBGSUxFX05PVElGWV9DSEFOR0VfTEFTVF9X
UklURQkJMHgwMDAwMDAxMAorI2RlZmluZSBGSUxFX05PVElGWV9DSEFOR0VfTEFTVF9BQ0NFU1MJ
CTB4MDAwMDAwMjAKKyNkZWZpbmUgRklMRV9OT1RJRllfQ0hBTkdFX0NSRUFUSU9OCQkweDAwMDAw
MDQwCisjZGVmaW5lIEZJTEVfTk9USUZZX0NIQU5HRV9FQQkJCTB4MDAwMDAwODAKKyNkZWZpbmUg
RklMRV9OT1RJRllfQ0hBTkdFX1NFQ1VSSVRZCQkweDAwMDAwMTAwCisjZGVmaW5lIEZJTEVfTk9U
SUZZX0NIQU5HRV9TVFJFQU1fTkFNRQkJMHgwMDAwMDIwMAorI2RlZmluZSBGSUxFX05PVElGWV9D
SEFOR0VfU1RSRUFNX1NJWkUJCTB4MDAwMDA0MDAKKyNkZWZpbmUgRklMRV9OT1RJRllfQ0hBTkdF
X1NUUkVBTV9XUklURQkJMHgwMDAwMDgwMAorCitzdHJ1Y3Qgc21iMl9jaGFuZ2Vfbm90aWZ5X3Jl
cSB7CisJX19sZTE2CVN0cnVjdHVyZVNpemU7CisJX19sZTE2CUZsYWdzOworCV9fbGUzMglPdXRw
dXRCdWZmZXJMZW5ndGg7CisJX191NjQJUGVyc2lzdGVudEZpbGVJZDsgLyogb3BhcXVlIGVuZGlh
bm5lc3MgKi8KKwlfX3U2NAlWb2xhdGlsZUZpbGVJZDsgLyogb3BhcXVlIGVuZGlhbm5lc3MgKi8K
KwlfX2xlMzIJQ29tcGxldGlvbkZpbHRlcjsKKwlfX3UzMglSZXNlcnZlZDsKK30gX19wYWNrZWQ7
CisKK3N0cnVjdCBzbWIyX2NoYW5nZV9ub3RpZnlfcnNwIHsKKwlfX2xlMTYJU3RydWN0dXJlU2l6
ZTsgIC8qIE11c3QgYmUgOSAqLworCV9fbGUxNglPdXRwdXRCdWZmZXJPZmZzZXQ7CisJX19sZTMy
CU91dHB1dEJ1ZmZlckxlbmd0aDsKKwlfX3U4CUJ1ZmZlclsxXTsgLyogYXJyYXkgb2YgZmlsZSBu
b3RpZnkgc3RydWN0cyAqLworfSBfX3BhY2tlZDsKKwogI2RlZmluZSBTTUIyX0xPQ0tGTEFHX1NI
QVJFRF9MT0NLCTB4MDAwMQogI2RlZmluZSBTTUIyX0xPQ0tGTEFHX0VYQ0xVU0lWRV9MT0NLCTB4
MDAwMgogI2RlZmluZSBTTUIyX0xPQ0tGTEFHX1VOTE9DSwkJMHgwMDA0Ci0tIAoyLjIwLjEKCg==
--00000000000049ea1f05882b83f1--


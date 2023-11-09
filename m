Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 071B07E7406
	for <lists+samba-technical@lfdr.de>; Thu,  9 Nov 2023 22:52:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=71N0m59xLukcDdkm4W+JIoiwHE7GiSCCkWsEYwiOgD4=; b=XgBsfvYgG/xnQN5GVhq/MIVY1V
	bK/uw9u42cLBmV3sIateA9kTxfU96oaMOtHG3glCRaK5A/8VV3jBgDIWYmcQ4+u1EzIM1jDit2cXB
	qq0a/JgpZycuMUQOacRogmjE+8RhausBgIlJM279XBie4AOx+AQGJ2ZjRJ/mPBbvw8u4IoxGcxp8o
	867qCBoE1GioSS65W12dNSDbvU/saOy3iTndeObT6Bgi/hYQnS5d6T6n/7KihIrGnNrgIxyqD1AM5
	X5OiYfZtKd91KSZ0ZK8eQVUfYn+oefoyEzel46OboLo++pg75eXIyEhvov7XbgTSVUjh1czwMuJYi
	XgJNgJtw==;
Received: from ip6-localhost ([::1]:46848 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r1Cwg-007O6H-71; Thu, 09 Nov 2023 21:52:14 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:43409) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r1Cwa-007O68-QZ
 for samba-technical@lists.samba.org; Thu, 09 Nov 2023 21:52:12 +0000
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-507c1936fd5so2746399e87.1
 for <samba-technical@lists.samba.org>; Thu, 09 Nov 2023 13:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699566727; x=1700171527; darn=lists.samba.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=71N0m59xLukcDdkm4W+JIoiwHE7GiSCCkWsEYwiOgD4=;
 b=mUTqphVMla4N7bZr7HsJzBbIovxMYQqAqNZpgvW54lKkwUKcYTY0bdwwLgJqayFYbl
 8VdH5Ra/gFFZ0X+BCRLv20bad+SYWOEXIgmsTLOooPBZcMqHqUBPVMI7ABsm5qS2VvJQ
 Fx7HiAW7X0CSl3AxKdTpmn3c92HaTQRqjGXqxETH3dLxXpPDchSM/W59Y9K8jCyWpimw
 +gEHXE8K09HFLuUbDiE6S3mZIKWbcPMqzfRq2LBelzImoOox9/muG6DxMkggzzzIOhjY
 /PYZdYhry5ZyTBeZ4rotmLS835xhFNmOegmIAsvqM4bv+GBCR/fbPpRv4oSRDMk0tgXM
 0XeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699566727; x=1700171527;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=71N0m59xLukcDdkm4W+JIoiwHE7GiSCCkWsEYwiOgD4=;
 b=s3IDyZY9qoUqBSqRAc7W6F3J0m7gKfHxFEnrqexqayYu3WM0VKaAaciKfPsBPMWUtx
 D89Z5h8N3lgaHirdKHvdyEcfsmmXhqfJVU81UH8Fx7tJ6E0taG5Sx4U5fXOlVbAkbqDT
 cP/+NmmHKeyRzvdj08MjJKB8KJmmGNOhYLfE/w+ZhUtEhrg0Duoyfq8oTjddW8xJGOzu
 8ppqaSysAATAZvlCeF2IMPhkh6N2lqNh5CGmuwDClTgDUfaUtVCGSb1LWC9wwXSK82BV
 tnKGQXlCErOHFrGBv+khgJnyJ3pKT81KXieW6FFO3wdb3qDPe+rygkpYvEIK7s7hQowc
 Llkw==
X-Gm-Message-State: AOJu0Ywba8NvsMelcJ9z+NAhFFYPDerkGXaunfhLwJs+OdhZJgtC09Wj
 IFX2uQ7/3SmMBVJZrmux9o//hfpTv/4C5rqCFlo=
X-Google-Smtp-Source: AGHT+IGvEwR5spf34RJevg9oaG4NQSFW8MnTxOFoHMOBxPSPjaf/pCxyTIZyLN1nDPydcRHYL23zuXdey/PEq4vIwcs=
X-Received: by 2002:a19:ad0d:0:b0:501:b929:48af with SMTP id
 t13-20020a19ad0d000000b00501b92948afmr217206lfc.34.1699566727022; Thu, 09 Nov
 2023 13:52:07 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 9 Nov 2023 15:51:55 -0600
Message-ID: <CAH2r5mt-t0QDZk4Zz+cSs8=s=VhUW09erUBAtm8f7xXG3rHJqw@mail.gmail.com>
Subject: [PATCH][smb3 client] allow debugging session and tcon info to improve
 stats analysis and debugging
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
Content-Type: multipart/mixed; boundary="0000000000000962570609bf378b"
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

--0000000000000962570609bf378b
Content-Type: text/plain; charset="UTF-8"

[PATCH] smb3: allow debugging session and tcon info to improve stats
 analysis and debugging

When multiple mounts are to the same share from the same client it was not
possible to determine which section of /proc/fs/cifs/Stats (and DebugData)
correspond to that mount.  In some recent examples this turned out to  be
a significant problem when trying to analyze performance problems - since
there are many cases where unless we know the tree id and session id we
can't figure out which stats (e.g. number of SMB3.1.1 requests by type,
the total time they take, which is slowest, how many fail etc.) apply to
which mount.

Add an ioctl to return tid, session id, tree connect count and tcon flags.

-- 
Thanks,

Steve

--0000000000000962570609bf378b
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb3-allow-debugging-session-and-tcon-info-to-improv.patch"
Content-Disposition: attachment; 
	filename="0001-smb3-allow-debugging-session-and-tcon-info-to-improv.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lorq4zi10>
X-Attachment-Id: f_lorq4zi10

RnJvbSA1NDc5NmE1NTVhNTVjNDBmZjYxYjE0ZjU3NGExMzljOTEyY2ZmZGVkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFRodSwgOSBOb3YgMjAyMyAxNToyODoxMiAtMDYwMApTdWJqZWN0OiBbUEFUQ0hdIHNt
YjM6IGFsbG93IGRlYnVnZ2luZyBzZXNzaW9uIGFuZCB0Y29uIGluZm8gdG8gaW1wcm92ZSBzdGF0
cwogYW5hbHlzaXMgYW5kIGRlYnVnZ2luZwoKV2hlbiBtdWx0aXBsZSBtb3VudHMgYXJlIHRvIHRo
ZSBzYW1lIHNoYXJlIGZyb20gdGhlIHNhbWUgY2xpZW50IGl0IHdhcyBub3QKcG9zc2libGUgdG8g
ZGV0ZXJtaW5lIHdoaWNoIHNlY3Rpb24gb2YgL3Byb2MvZnMvY2lmcy9TdGF0cyAoYW5kIERlYnVn
RGF0YSkKY29ycmVzcG9uZCB0byB0aGF0IG1vdW50LiAgSW4gc29tZSByZWNlbnQgZXhhbXBsZXMg
dGhpcyB0dXJuZWQgb3V0IHRvICBiZQphIHNpZ25pZmljYW50IHByb2JsZW0gd2hlbiB0cnlpbmcg
dG8gYW5hbHl6ZSBwZXJmb3JtYW5jZSBwcm9ibGVtcyAtIHNpbmNlCnRoZXJlIGFyZSBtYW55IGNh
c2VzIHdoZXJlIHVubGVzcyB3ZSBrbm93IHRoZSB0cmVlIGlkIGFuZCBzZXNzaW9uIGlkIHdlCmNh
bid0IGZpZ3VyZSBvdXQgd2hpY2ggc3RhdHMgKGUuZy4gbnVtYmVyIG9mIFNNQjMuMS4xIHJlcXVl
c3RzIGJ5IHR5cGUsCnRoZSB0b3RhbCB0aW1lIHRoZXkgdGFrZSwgd2hpY2ggaXMgc2xvd2VzdCwg
aG93IG1hbnkgZmFpbCBldGMuKSBhcHBseSB0bwp3aGljaCBtb3VudC4KCkFkZCBhbiBpb2N0bCB0
byByZXR1cm4gdGlkLCBzZXNzaW9uIGlkLCB0cmVlIGNvbm5lY3QgY291bnQgYW5kIHRjb24gZmxh
Z3MuCgpTaWduZWQtb2ZmLWJ5OiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
Ci0tLQogZnMvc21iL2NsaWVudC9jaWZzX2lvY3RsLmggfCAgOCArKysrKysrKwogZnMvc21iL2Ns
aWVudC9pb2N0bC5jICAgICAgfCAyNiArKysrKysrKysrKysrKysrKysrKysrKysrKwogMiBmaWxl
cyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZnMvc21iL2NsaWVudC9j
aWZzX2lvY3RsLmggYi9mcy9zbWIvY2xpZW50L2NpZnNfaW9jdGwuaAppbmRleCAzMzI1ODhlNzdj
MzEuLjJlYjBhNzQ3YjZjMyAxMDA2NDQKLS0tIGEvZnMvc21iL2NsaWVudC9jaWZzX2lvY3RsLmgK
KysrIGIvZnMvc21iL2NsaWVudC9jaWZzX2lvY3RsLmgKQEAgLTI2LDYgKzI2LDEzIEBAIHN0cnVj
dCBzbWJfbW50X2ZzX2luZm8gewogCV9fdTY0ICAgY2lmc19wb3NpeF9jYXBzOwogfSBfX3BhY2tl
ZDsKIAorc3RydWN0IHNtYl9tbnRfdGNvbl9pbmZvIHsKKwlfX3UzMgl0aWQ7CisJX191NjQJc2Vz
c2lvbl9pZDsKKwlpbnQJdGNfY291bnQ7CisJX191MTYJZmxhZ3M7Cit9IF9fcGFja2VkOworCiBz
dHJ1Y3Qgc21iX3NuYXBzaG90X2FycmF5IHsKIAlfX3UzMgludW1iZXJfb2Zfc25hcHNob3RzOwog
CV9fdTMyCW51bWJlcl9vZl9zbmFwc2hvdHNfcmV0dXJuZWQ7CkBAIC0xMDgsNiArMTE1LDcgQEAg
c3RydWN0IHNtYjNfbm90aWZ5X2luZm8gewogI2RlZmluZSBDSUZTX0lPQ19OT1RJRlkgX0lPVyhD
SUZTX0lPQ1RMX01BR0lDLCA5LCBzdHJ1Y3Qgc21iM19ub3RpZnkpCiAjZGVmaW5lIENJRlNfRFVN
UF9GVUxMX0tFWSBfSU9XUihDSUZTX0lPQ1RMX01BR0lDLCAxMCwgc3RydWN0IHNtYjNfZnVsbF9r
ZXlfZGVidWdfaW5mbykKICNkZWZpbmUgQ0lGU19JT0NfTk9USUZZX0lORk8gX0lPV1IoQ0lGU19J
T0NUTF9NQUdJQywgMTEsIHN0cnVjdCBzbWIzX25vdGlmeV9pbmZvKQorI2RlZmluZSBDSUZTX0lP
Q19HRVRfVENPTl9JTkZPIF9JT1IoQ0lGU19JT0NUTF9NQUdJQywgMTIsIHN0cnVjdCBzbWJfbW50
X3Rjb25faW5mbykKICNkZWZpbmUgQ0lGU19JT0NfU0hVVERPV04gX0lPUignWCcsIDEyNSwgX191
MzIpCiAKIC8qCmRpZmYgLS1naXQgYS9mcy9zbWIvY2xpZW50L2lvY3RsLmMgYi9mcy9zbWIvY2xp
ZW50L2lvY3RsLmMKaW5kZXggZjcxNjAwMDNlMGVkLi44MDAwNDMzNDA3ZGYgMTAwNjQ0Ci0tLSBh
L2ZzL3NtYi9jbGllbnQvaW9jdGwuYworKysgYi9mcy9zbWIvY2xpZW50L2lvY3RsLmMKQEAgLTEx
Nyw2ICsxMTcsMjIgQEAgc3RhdGljIGxvbmcgY2lmc19pb2N0bF9jb3B5Y2h1bmsodW5zaWduZWQg
aW50IHhpZCwgc3RydWN0IGZpbGUgKmRzdF9maWxlLAogCXJldHVybiByYzsKIH0KIAorc3RhdGlj
IGxvbmcgc21iX21udF9nZXRfdGNvbl9pbmZvKHN0cnVjdCBjaWZzX3Rjb24gKnRjb24sIHZvaWQg
X191c2VyICphcmcpCit7CisJaW50IHJjID0gMDsKKwlzdHJ1Y3Qgc21iX21udF90Y29uX2luZm8g
dGNvbl9pbmY7CisKKwl0Y29uX2luZi50aWQgPSB0Y29uLT50aWQ7CisJdGNvbl9pbmYuc2Vzc2lv
bl9pZCA9IHRjb24tPnNlcy0+U3VpZDsKKwl0Y29uX2luZi50Y19jb3VudCA9IHRjb24tPnRjX2Nv
dW50OworCXRjb25faW5mLmZsYWdzID0gdGNvbi0+RmxhZ3M7CisKKwlpZiAoY29weV90b191c2Vy
KGFyZywgJnRjb25faW5mLCBzaXplb2Yoc3RydWN0IHNtYl9tbnRfdGNvbl9pbmZvKSkpCisJCXJj
ID0gLUVGQVVMVDsKKworCXJldHVybiByYzsKK30KKwogc3RhdGljIGxvbmcgc21iX21udF9nZXRf
ZnNpbmZvKHVuc2lnbmVkIGludCB4aWQsIHN0cnVjdCBjaWZzX3Rjb24gKnRjb24sCiAJCQkJdm9p
ZCBfX3VzZXIgKmFyZykKIHsKQEAgLTQxNCw2ICs0MzAsMTYgQEAgbG9uZyBjaWZzX2lvY3RsKHN0
cnVjdCBmaWxlICpmaWxlcCwgdW5zaWduZWQgaW50IGNvbW1hbmQsIHVuc2lnbmVkIGxvbmcgYXJn
KQogCQkJdGNvbiA9IHRsaW5rX3Rjb24ocFNNQkZpbGUtPnRsaW5rKTsKIAkJCXJjID0gc21iX21u
dF9nZXRfZnNpbmZvKHhpZCwgdGNvbiwgKHZvaWQgX191c2VyICopYXJnKTsKIAkJCWJyZWFrOwor
CQljYXNlIENJRlNfSU9DX0dFVF9UQ09OX0lORk86CisJCQljaWZzX3NiID0gQ0lGU19TQihpbm9k
ZS0+aV9zYik7CisJCQl0bGluayA9IGNpZnNfc2JfdGxpbmsoY2lmc19zYik7CisJCQlpZiAoSVNf
RVJSKHRsaW5rKSkgeworCQkJCXJjID0gUFRSX0VSUih0bGluayk7CisJCQkJYnJlYWs7CisJCQl9
CisJCQl0Y29uID0gdGxpbmtfdGNvbih0bGluayk7CisJCQlyYyA9IHNtYl9tbnRfZ2V0X3Rjb25f
aW5mbyh0Y29uLCAodm9pZCBfX3VzZXIgKilhcmcpOworCQkJYnJlYWs7CiAJCWNhc2UgQ0lGU19F
TlVNRVJBVEVfU05BUFNIT1RTOgogCQkJaWYgKHBTTUJGaWxlID09IE5VTEwpCiAJCQkJYnJlYWs7
Ci0tIAoyLjM5LjIKCg==
--0000000000000962570609bf378b--


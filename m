Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E2228A4ED
	for <lists+samba-technical@lfdr.de>; Sun, 11 Oct 2020 03:26:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=THcgmlGOC9FfPamwQ91DRL4oK5/e5E+5YuMC036l3hg=; b=sQMDM8beSQN2TsjmIivoC3WHJG
	r8CUnnaTxbHxWBHMnggSxbCF+jml7I3wvPvGJ1d53IE731TaP9ffHTMb+mx9Z4A832Od6dSnHvVDU
	FjPANphqieO4irFYAqaO1H3e729BWg9xNSo8izvBPp0/ZZ6CJoKdp62ZNO8lld7pxlHDSNhhSf5Nr
	nJV5EYXlQvOUZG6nKWlgUe1upGXZlsiznb11l9Jq7dVwkq+qQm+bFQKsPNWrPBRdWClLOYuosPdGE
	peHv8L4kkYQ+sEypegnKzNDr5jVKhTiYEheKWlvjlXShvD+U9ai8n+bk7W1sUFMsQOKO+114UWnxg
	MsevBXyg==;
Received: from ip6-localhost ([::1]:30416 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kRQ7K-00BZIa-Jy; Sun, 11 Oct 2020 01:25:42 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:34281) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kRQ7C-00BZIT-Kw
 for samba-technical@lists.samba.org; Sun, 11 Oct 2020 01:25:37 +0000
Received: by mail-lj1-x232.google.com with SMTP id y16so12176428ljk.1
 for <samba-technical@lists.samba.org>; Sat, 10 Oct 2020 18:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=THcgmlGOC9FfPamwQ91DRL4oK5/e5E+5YuMC036l3hg=;
 b=JIyx5mIQVXhBqgQh2ow+LLeVo8WMMmaHp2wsCLgDl6Tuyjx23b99sxfWGYWRr0Mj+T
 bLcKIqM30LKks60wvrzHUA72IgRqeHlK11RG6RxtxS9LAZbu7L85PdzALVQBVmvcxRUm
 BEfbNuFBfPGF4mK+V6dBFTGvVPX9sc70Exic9ywQm8wAExv+r0gBrYayDSof5yNBVd36
 lKHWxOwry6KE1A6Jmob/dExCWKESzCwbeRJxg5zQDEaEQZMpzghTU0dfLrkwsUWUg7/Q
 4JoI02TEm+tR9+IA0A8W6YxiIUQQDHjpr4WorOsLcW7XT7CAlC6pJgRDUvV2Jomkm6c4
 xFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=THcgmlGOC9FfPamwQ91DRL4oK5/e5E+5YuMC036l3hg=;
 b=bUd47YKuCRH75lTEmtGktvwPZQlpXWzTsGq8/3G6dnxYpj6zTOZp8JF1t56jBIQNXz
 /I6HiTLoqx7v6JowRz5SKJMiJeoQxU0fTRdZYRVcsWpfQutLmBhwvrebgxkq5zN8Xw8w
 eCKJykT79G0bPydKTEN/+k7UiUD5uFJyPkPf3nUrHbaKXm1o2kIu662qa6h6u5EXN/ki
 KuwqsSOIds+zJYFZFkgHCUtEdsazsZMWwhKBXa9cUnFg1U4qMmQS13dLmY5M10kyuRJt
 aY8EQSt+t8UAXWWmk3yR9mzyq9/85CQK8JxiwlFejvdbHJbr4cofeUTmRwcSgQNdkTX5
 Zh1Q==
X-Gm-Message-State: AOAM532h0qUUFUoAucgQiAhp5jSFDVIi4aMLy8G/LRk0Fxh9TQw4b+nx
 X8LPwEZJ4WzLDNZZGLyNMFU4VVFJbp0ZGNkC2Ro=
X-Google-Smtp-Source: ABdhPJxNURjDiL+cCzKIcp8CgWbdxgMc1s1lFZOfz2TKgHg2exphqSU5zdtLmQujKfixN64wbcZZRlKMUUWyE0uNpbk=
X-Received: by 2002:a2e:9ad3:: with SMTP id p19mr7383375ljj.374.1602379531178; 
 Sat, 10 Oct 2020 18:25:31 -0700 (PDT)
MIME-Version: 1.0
Date: Sat, 10 Oct 2020 20:25:19 -0500
Message-ID: <CAH2r5mtwBHTk-Xoeuo+RbgNwiNw-cWTAhdy1YG5y+vXnNDSv4w@mail.gmail.com>
Subject: [PATCH][SMB3.1.1] Add defines for new signing context
To: CIFS <linux-cifs@vger.kernel.org>
Content-Type: multipart/mixed; boundary="000000000000c06bab05b15b0e54"
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--000000000000c06bab05b15b0e54
Content-Type: text/plain; charset="UTF-8"

Add defines for the three supported signing algorithms

Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/cifs/smb2pdu.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/fs/cifs/smb2pdu.h b/fs/cifs/smb2pdu.h
index 4dfb51dd7065..5932fc0dc62c 100644
--- a/fs/cifs/smb2pdu.h
+++ b/fs/cifs/smb2pdu.h
@@ -323,6 +323,7 @@ struct smb2_negotiate_req {
 #define SMB2_NETNAME_NEGOTIATE_CONTEXT_ID cpu_to_le16(5)
 #define SMB2_TRANSPORT_CAPABILITIES cpu_to_le16(6)
 #define SMB2_RDMA_TRANSFORM_CAPABILITIES cpu_to_le16(7)
+#define SMB2_SIGNING_CAPABILITIES cpu_to_le16(8)
 #define SMB2_POSIX_EXTENSIONS_AVAILABLE cpu_to_le16(0x100)

 struct smb2_neg_context {
@@ -416,6 +417,19 @@ struct smb2_rdma_transform_capabilities_context {
  __le16 RDMATransformIds[1];
 } __packed;

+/* Signing algorithms */
+#define SIGNING_ALG_HMAC_SHA256 0
+#define SIGNING_ALG_AES_CMAC 1
+#define SIGNING_ALG_AES_GMAC 2
+
+struct smb2_signing_capabilities {
+ __le16 ContextType; /* 8 */
+ __le16 DataLength;
+ __u32 Reserved;
+ __le16 SigningAlgorithmCount;
+ __le16 SigningAlgorithms[];
+} __packed;
+
 #define POSIX_CTXT_DATA_LEN 16
 struct smb2_posix_neg_context {
  __le16 ContextType; /* 0x100 */
-- 
Thanks,

Steve

--000000000000c06bab05b15b0e54
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-SMB3.1.1-add-defines-for-new-signing-negotiate-conte.patch"
Content-Disposition: attachment; 
	filename="0001-SMB3.1.1-add-defines-for-new-signing-negotiate-conte.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kg4fd3d70>
X-Attachment-Id: f_kg4fd3d70

RnJvbSBlOTEzYjUyYzg5MDNmZjQ0ODhhYjU4N2NhMmU0NzU2MDhlNDA1YjI0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFNhdCwgMTAgT2N0IDIwMjAgMjA6MTE6NDcgLTA1MDAKU3ViamVjdDogW1BBVENIXSBT
TUIzLjEuMTogYWRkIGRlZmluZXMgZm9yIG5ldyBzaWduaW5nIG5lZ290aWF0ZSBjb250ZXh0CgpD
dXJyZW50bHkgdGhlcmUgYXJlIHRocmVlIHN1cHBvcnRlZCBzaWduaW5nIGFsZ29yaXRobXMKClNp
Z25lZC1vZmYtYnk6IFN0ZXZlIEZyZW5jaCA8c3RmcmVuY2hAbWljcm9zb2Z0LmNvbT4KLS0tCiBm
cy9jaWZzL3NtYjJwZHUuaCB8IDE0ICsrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTQg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2ZzL2NpZnMvc21iMnBkdS5oIGIvZnMvY2lmcy9z
bWIycGR1LmgKaW5kZXggNGRmYjUxZGQ3MDY1Li41OTMyZmMwZGM2MmMgMTAwNjQ0Ci0tLSBhL2Zz
L2NpZnMvc21iMnBkdS5oCisrKyBiL2ZzL2NpZnMvc21iMnBkdS5oCkBAIC0zMjMsNiArMzIzLDcg
QEAgc3RydWN0IHNtYjJfbmVnb3RpYXRlX3JlcSB7CiAjZGVmaW5lIFNNQjJfTkVUTkFNRV9ORUdP
VElBVEVfQ09OVEVYVF9JRAljcHVfdG9fbGUxNig1KQogI2RlZmluZSBTTUIyX1RSQU5TUE9SVF9D
QVBBQklMSVRJRVMJCWNwdV90b19sZTE2KDYpCiAjZGVmaW5lIFNNQjJfUkRNQV9UUkFOU0ZPUk1f
Q0FQQUJJTElUSUVTCWNwdV90b19sZTE2KDcpCisjZGVmaW5lIFNNQjJfU0lHTklOR19DQVBBQklM
SVRJRVMJCWNwdV90b19sZTE2KDgpCiAjZGVmaW5lIFNNQjJfUE9TSVhfRVhURU5TSU9OU19BVkFJ
TEFCTEUJCWNwdV90b19sZTE2KDB4MTAwKQogCiBzdHJ1Y3Qgc21iMl9uZWdfY29udGV4dCB7CkBA
IC00MTYsNiArNDE3LDE5IEBAIHN0cnVjdCBzbWIyX3JkbWFfdHJhbnNmb3JtX2NhcGFiaWxpdGll
c19jb250ZXh0IHsKIAlfX2xlMTYJUkRNQVRyYW5zZm9ybUlkc1sxXTsKIH0gX19wYWNrZWQ7CiAK
Ky8qIFNpZ25pbmcgYWxnb3JpdGhtcyAqLworI2RlZmluZSBTSUdOSU5HX0FMR19ITUFDX1NIQTI1
NgkwCisjZGVmaW5lIFNJR05JTkdfQUxHX0FFU19DTUFDCTEKKyNkZWZpbmUgU0lHTklOR19BTEdf
QUVTX0dNQUMJMgorCitzdHJ1Y3Qgc21iMl9zaWduaW5nX2NhcGFiaWxpdGllcyB7CisJX19sZTE2
CUNvbnRleHRUeXBlOyAvKiA4ICovCisJX19sZTE2CURhdGFMZW5ndGg7CisJX191MzIJUmVzZXJ2
ZWQ7CisJX19sZTE2CVNpZ25pbmdBbGdvcml0aG1Db3VudDsKKwlfX2xlMTYJU2lnbmluZ0FsZ29y
aXRobXNbXTsKK30gX19wYWNrZWQ7CisKICNkZWZpbmUgUE9TSVhfQ1RYVF9EQVRBX0xFTgkxNgog
c3RydWN0IHNtYjJfcG9zaXhfbmVnX2NvbnRleHQgewogCV9fbGUxNglDb250ZXh0VHlwZTsgLyog
MHgxMDAgKi8KLS0gCjIuMjUuMQoK
--000000000000c06bab05b15b0e54--


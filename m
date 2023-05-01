Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7256F2E36
	for <lists+samba-technical@lfdr.de>; Mon,  1 May 2023 05:27:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=dat2lOmwD0lAA8LhC9hc2ZhZVDwetUOJd11QGeskZD4=; b=UAjsDXmyv0S8fiCdKfQrzqKYvk
	SpmhnjJD/F+0cbz6foIZbxwq2Oc73AcqT8rcRwV4hsvyz3hCNYSDyg8wz+Lr0SwK0R++40pkryPNJ
	qKbYpM0iiWctY2hO/6NQlwdknjHNg4MsFxH2OtfuvP7v2BgIGDFHO1WDFvibaQ7rYajEFjSV3+TRr
	0xKiJkog1wOW5yI6LqQ1UaviVYLjX/FO8/OEX2xSov6TbSQY+ppE01E5KjtVylxHAj8Nxp3A3G795
	BSp8ReGFxEndm42o4aRuc/V4dyptyaPa0LFyafwAOUQ+52+07AhBNqv1ehkePkEMxCqmaW79CmIq6
	tWdCJvuA==;
Received: from ip6-localhost ([::1]:46224 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ptKBV-007sj3-8s; Mon, 01 May 2023 03:26:41 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:61588) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ptKBQ-007siu-7p
 for samba-technical@lists.samba.org; Mon, 01 May 2023 03:26:38 +0000
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2a8afef50f2so21499611fa.2
 for <samba-technical@lists.samba.org>; Sun, 30 Apr 2023 20:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682911591; x=1685503591;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=dat2lOmwD0lAA8LhC9hc2ZhZVDwetUOJd11QGeskZD4=;
 b=p9bPFMRir43Yn5GaDfelYcDqWrmys4Cc2Kknwdfy7tWCDCS5bJdvJXryjYH1ebjOdG
 B/6rx3LeUdfwiNwULM/tZZhNmA5fAEyPKtYhgJM4TOf0RO00L9atZLB3p6hPkYtGXD8Z
 WobPyEZ8zrkd6bvpX0PsyWmddv/ri09a6/TDe4XCzE57AF5e8B/jXuOAtt1eqzylJWCX
 DNfv6gb00eaqxzjyjYUVtFzTreh3M6H461Us1dgiNNSF7F3rEyagFJ6jxVLe9dsWZG7l
 tgUJ/UhLIg/XwnId8+oZDflbNIZApQflY+byRO/QhZ8qR6wjyoe8g4jrVm/o+z2rKD3l
 r9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682911591; x=1685503591;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dat2lOmwD0lAA8LhC9hc2ZhZVDwetUOJd11QGeskZD4=;
 b=CVqG7n7vJVQZTSz6CKZSxaExycqHDyOllZHfA09Fo+Q/heJg4evcq408B4i/TYx9HR
 T/9rVtEQfar275jtLwfrihUUxGP71ewzP7jm1YB1FXKIuw61ge3uFHICSjTJ3oFjXvsN
 QldiP8xv2x2RM7yjsHzmE9GaAoiocinmKmvhLGshJjTuKkxSxwZ81RqzFlBqpKvRzi5b
 R7c1t8K873BEi0WrqG9CSkBchw6M9ehR46QCWoN+yNTOG3m39KFNhvp0H2Jm9TcnXth6
 mKZfUZXA/VNpZ9zbJX18Ogp3F7ySLnhXHCIkgg1RS9zy9gBAx9XKT88o3OiIDcs4LQOw
 0X/A==
X-Gm-Message-State: AC+VfDzjbwoNtSSH++tS5jXRfmUYS9BQp+a8JzCUvB2OG+cXfz70tBzb
 qI9Ewaq0yTpD2nA8ONknMQuhYaIbgD/cYKKTAg0=
X-Google-Smtp-Source: ACHHUZ6/zZYFWBzB24ccEv8XtQRewo1UgX9Or26bqgM9Yf5W8N5Vcn9a1XsE+cxFwUYYSXAkwcMQg8fKoniIPnrz3Fc=
X-Received: by 2002:a2e:a0d1:0:b0:2a8:ddb0:baa6 with SMTP id
 f17-20020a2ea0d1000000b002a8ddb0baa6mr3465905ljm.4.1682911591263; Sun, 30 Apr
 2023 20:26:31 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 30 Apr 2023 22:26:19 -0500
Message-ID: <CAH2r5msNirMEVz=B8fmZ83r7AwsMcM6hd+vSFcsVSB_=mHWHsA@mail.gmail.com>
Subject: [PATCH][SMB3] correct definitions for app instance open contexts
To: CIFS <linux-cifs@vger.kernel.org>, Namjae Jeon <linkinjeon@kernel.org>
Content-Type: multipart/mixed; boundary="00000000000096287e05fa996306"
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

--00000000000096287e05fa996306
Content-Type: text/plain; charset="UTF-8"

The name length was wrong for the structs:

         SMB2_CREATE_APP_INSTANCE_ID
         SMB2_CREATE_APP_INSTANCE_VERSION

See attached.  Also moves these definitions to common code (fs/smbfs_common)

-- 
Thanks,

Steve

--00000000000096287e05fa996306
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-SMB3.1.1-correct-definition-for-app_instance_id-crea.patch"
Content-Disposition: attachment; 
	filename="0001-SMB3.1.1-correct-definition-for-app_instance_id-crea.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lh4a24im0>
X-Attachment-Id: f_lh4a24im0

RnJvbSA1ZjZlYzQwYmI5YzhiMWY3NDA4MTg4OTgxMDJlZDYyNGFiZjZiODU2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFN1biwgMzAgQXByIDIwMjMgMTI6Mjc6NDkgLTA1MDAKU3ViamVjdDogW1BBVENIXSBT
TUIzLjEuMTogY29ycmVjdCBkZWZpbml0aW9uIGZvciBhcHBfaW5zdGFuY2VfaWQgY3JlYXRlCiBj
b250ZXh0cwoKVGhlIG5hbWUgbGVuZ3RocyB3ZXJlIGluY29ycmVjdCBmb3IgdHdvIGNyZWF0ZSBj
b250ZXh0cy4KICAgICBTTUIyX0NSRUFURV9BUFBfSU5TVEFOQ0VfSUQKICAgICBTTUIyX0NSRUFU
RV9BUFBfSU5TVEFOQ0VfVkVSU0lPTgoKVXBkYXRlIHRoZSBkZWZpbml0aW9ucyBmb3IgdGhlc2Ug
dHdvIHRvIG1hdGNoIHRoZSBwcm90b2NvbCBzcGVjcy4KClNpZ25lZC1vZmYtYnk6IFN0ZXZlIEZy
ZW5jaCA8c3RmcmVuY2hAbWljcm9zb2Z0LmNvbT4KLS0tCiBmcy9rc21iZC9zbWIycGR1LmggICAg
ICAgIHwgMTYgLS0tLS0tLS0tLS0tLS0tLQogZnMvc21iZnNfY29tbW9uL3NtYjJwZHUuaCB8IDIw
ICsrKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyks
IDE2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ZzL2tzbWJkL3NtYjJwZHUuaCBiL2ZzL2tz
bWJkL3NtYjJwZHUuaAppbmRleCA2N2RjNTUyZjJlZjcuLmFjYTljZmM3M2NhYSAxMDA2NDQKLS0t
IGEvZnMva3NtYmQvc21iMnBkdS5oCisrKyBiL2ZzL2tzbWJkL3NtYjJwZHUuaApAQCAtODEsMjIg
KzgxLDYgQEAgc3RydWN0IGNyZWF0ZV9kdXJhYmxlX3JlY29ubl92Ml9yZXEgewogCV9fbGUzMiBG
bGFnczsKIH0gX19wYWNrZWQ7CiAKLXN0cnVjdCBjcmVhdGVfYXBwX2luc3RfaWQgewotCXN0cnVj
dCBjcmVhdGVfY29udGV4dCBjY29udGV4dDsKLQlfX3U4IE5hbWVbOF07Ci0JX191OCBSZXNlcnZl
ZFs4XTsKLQlfX3U4IEFwcEluc3RhbmNlSWRbMTZdOwotfSBfX3BhY2tlZDsKLQotc3RydWN0IGNy
ZWF0ZV9hcHBfaW5zdF9pZF92ZXJzIHsKLQlzdHJ1Y3QgY3JlYXRlX2NvbnRleHQgY2NvbnRleHQ7
Ci0JX191OCBOYW1lWzhdOwotCV9fdTggUmVzZXJ2ZWRbMl07Ci0JX191OCBQYWRkaW5nWzRdOwot
CV9fbGU2NCBBcHBJbnN0YW5jZVZlcnNpb25IaWdoOwotCV9fbGU2NCBBcHBJbnN0YW5jZVZlcnNp
b25Mb3c7Ci19IF9fcGFja2VkOwotCiBzdHJ1Y3QgY3JlYXRlX2FsbG9jX3NpemVfcmVxIHsKIAlz
dHJ1Y3QgY3JlYXRlX2NvbnRleHQgY2NvbnRleHQ7CiAJX191OCAgIE5hbWVbOF07CmRpZmYgLS1n
aXQgYS9mcy9zbWJmc19jb21tb24vc21iMnBkdS5oIGIvZnMvc21iZnNfY29tbW9uL3NtYjJwZHUu
aAppbmRleCAzYjQzYTUxZTZmN2UuLmJhZTU5MGVlYzg3MSAxMDA2NDQKLS0tIGEvZnMvc21iZnNf
Y29tbW9uL3NtYjJwZHUuaAorKysgYi9mcy9zbWJmc19jb21tb24vc21iMnBkdS5oCkBAIC0xMjUw
LDYgKzEyNTAsMjYgQEAgc3RydWN0IGNyZWF0ZV9kaXNrX2lkX3JzcCB7CiAJX191OCAgUmVzZXJ2
ZWRbMTZdOwogfSBfX3BhY2tlZDsKIAorLyogU2VlIE1TLVNNQjIgMi4yLjEzLjIuMTMgKi8KK3N0
cnVjdCBjcmVhdGVfYXBwX2luc3RfaWQgeworCXN0cnVjdCBjcmVhdGVfY29udGV4dCBjY29udGV4
dDsKKwlfX3U4IE5hbWVbMTZdOworCV9fbGUzMiBTdHJ1Y3R1cmVTaXplOyAvKiBNdXN0IGJlIDIw
ICovCisJX191MTYgUmVzZXJ2ZWQ7CisJX191OCBBcHBJbnN0YW5jZUlkWzE2XTsKK30gX19wYWNr
ZWQ7CisKKy8qIFNlZSBNUy1TTUIyIDIuMi4xMy4yLjE1ICovCitzdHJ1Y3QgY3JlYXRlX2FwcF9p
bnN0X2lkX3ZlcnMgeworCXN0cnVjdCBjcmVhdGVfY29udGV4dCBjY29udGV4dDsKKwlfX3U4IE5h
bWVbMTZdOworCV9fbGUzMiBTdHJ1Y3R1cmVTaXplOyAvKiBNdXN0IGJlIDI0ICovCisJX191MTYg
UmVzZXJ2ZWQ7CisJX191MzIgUGFkZGluZzsKKwlfX2xlNjQgQXBwSW5zdGFuY2VWZXJzaW9uSGln
aDsKKwlfX2xlNjQgQXBwSW5zdGFuY2VWZXJzaW9uTG93OworfSBfX3BhY2tlZDsKKwogLyogU2Vl
IE1TLVNNQjIgMi4yLjMxIGFuZCAyLjIuMzIgKi8KIHN0cnVjdCBzbWIyX2lvY3RsX3JlcSB7CiAJ
c3RydWN0IHNtYjJfaGRyIGhkcjsKLS0gCjIuMzQuMQoK
--00000000000096287e05fa996306--


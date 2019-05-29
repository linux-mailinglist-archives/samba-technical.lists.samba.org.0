Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCAC2E1DC
	for <lists+samba-technical@lfdr.de>; Wed, 29 May 2019 18:04:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=OGMTJBC6iV8l5n1NpQ3jYystEK2+dhvYRQZwC/+KNpY=; b=QYBzOB9a/YE6+zCD6e14vZX1yW
	TbWkxtOvBO6E+gfS6sJ+2h8KxssDjmnMqVJzK/YZtsriN5zM/pRvzP0sSsHCfVhVNi5+qCgjA4LY+
	y2vHyHwXl9da23QZhJdZW2NzZuYLY1tF1qXb9pZId22WYCpTbKe7nPMhX5HC7pin6VTpk5TZ6ISKj
	nZmYvuD9J91wmErcGlXVlmmYj0flVObOSjXXU+jcHbaF7o/2o+/98EKun4IetIFM5tvaZLMSBaO6W
	rkRx9C4Yt8uzjmY+jKW58sEcCn9VoEFnRl1o9E8ZUrEOOw7wOvMu/CgwOSiMcaEZrhMVAIbVfbNCc
	JFmUBV5A==;
Received: from localhost ([::1]:33602 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hW13J-002Uz9-65; Wed, 29 May 2019 16:03:45 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:42912) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hW13E-002Uz2-3P
 for samba-technical@lists.samba.org; Wed, 29 May 2019 16:03:42 +0000
Received: by mail-lf1-x12c.google.com with SMTP id y13so2528083lfh.9
 for <samba-technical@lists.samba.org>; Wed, 29 May 2019 09:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=OGMTJBC6iV8l5n1NpQ3jYystEK2+dhvYRQZwC/+KNpY=;
 b=KS6peOhuibGrTrteDtD76Y4VJYOkWGr+0645BZ2nRMG+ijDr5Clfkm+YpXjI6+mvVz
 1tgcQqjAb737WMJwiUUkJyXKttKwwNT4GSxMpuCIqcCUzwD5Fix2bc7RmcdaRhvr1MdM
 w8zNqBl5RcOhsDhODnIDXYXaiHHxQ2ggJ7Oz2SCQ+o3wgljx5FhJC6YSsSb+AiWC7+tV
 OyvnCwoylhEbu0fwZaiNjhmwERT8hbrf8Cm1y5SWtz6OXz5TCBIusezGtFQBOZ4Htx9o
 VGyj8I19Hu+V2pol5JSM1DGC7oF4Cm26A4wFjr6WqLQ7YdFfU8+UwCFr0sv2RKsL+OwW
 l05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=OGMTJBC6iV8l5n1NpQ3jYystEK2+dhvYRQZwC/+KNpY=;
 b=CftTFLW+i0/Aa2igwxwifGRuf5y9rxuwIDvowP4WWFkw1PsQPGIo8TsNfnriX66gTs
 SPw3mNgl7DwLEBZZRcofdb/VSxkjCKcc9ygJuPbVFWZcZ0gQY3Ar9JrneBdnwSGmalxG
 k3zX2eiyzG3mSpZLEqiPxq2WxRGDr/0NPQrboFcFDTQe85sVoTyRRJrIaCmopNNNBpjX
 dV9AY570MVYpKz1KwES5whXCGcQ6nyBUe3aDNyq0Y1/h9atzNlmULwbHGF2iZsllcOJv
 XccF1zBom5FLKHWxauJIkQQFJhw3rdR4WxviZ8sn/fOt1BU10NqgLiwDtkN4xqGA34bf
 SPsg==
X-Gm-Message-State: APjAAAWF3vp1zahPvLTzn383epNWuBmu9OWtzKxjx5tvjAJrWKbeGvlE
 MCgkbbbLg1VmggCxMB/MU+kF7pJ0/kPlliyFTwE0UfZg
X-Google-Smtp-Source: APXvYqzCnDl4TSU9EfoHLzMzgkyxt3UCcWflqDE5EtpZUnM6iBR/y95UKKvSszj0zQK3DEmlvL2k2adt2oZeY/3RP6Q=
X-Received: by 2002:a19:f601:: with SMTP id x1mr11425159lfe.182.1559145813498; 
 Wed, 29 May 2019 09:03:33 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 29 May 2019 18:03:15 +0200
Message-ID: <CAC-fF8RUTx4Zvj3m_bc_tG7gMzbTy7iHyMLVnFur=6b83+pTtw@mail.gmail.com>
Subject: [PATCH] pac-glue: fix delegation info blob
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Content-Type: multipart/mixed; boundary="0000000000005df40e058a08ecb6"
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--0000000000005df40e058a08ecb6
Content-Type: text/plain; charset="UTF-8"

Hi,

Attached patch fixes the delegation-info blob to be the same as
Windows KDC returns, by adding the realm to the correct principal.

In general this blob is processed by the target server when it accepts
the delegated ticket (and I guess Windows server don't fail due to
this bug), but in my experiments with
resource-based-constrained-delegation (cross-realm S4U2Proxy, see
mit-krb5 PR #912), I found that Windows KDC also processes this blob
when in cross-realm tickets, and it would fail the request without
this patch.

I checked separately with Heimdal build to confirm I can see the same
bug using wireshark and also checked Windows behavior in traditional
constrained-delegation as well (you may find captures of S4U2Prox with
keys in wireshark's samples page).
Thoughts? Any idea how to add a test for this?

--0000000000005df40e058a08ecb6
Content-Type: application/octet-stream; name="delegation_info.patch"
Content-Disposition: attachment; filename="delegation_info.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jw9dn6d50>
X-Attachment-Id: f_jw9dn6d50

RnJvbSAyYjZjODc1YTY3NjcwZGEwZDAyOTA4ZDQwODE0NmJkZDM3NDU5MDNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBJc2FhYyBCb3VrcmlzIDxpYm91a3Jpc0BnbWFpbC5jb20+CkRh
dGU6IFdlZCwgMjkgTWF5IDIwMTkgMTg6MTU6MjUgKzAzMDAKU3ViamVjdDogW1BBVENIXSBwYWMt
Z2x1ZTogZml4IGRlbGVnYXRpb24gaW5mbyBibG9iCgpUaGUgdGFyZ2V0IHByb3h5IHByaW5jaXBh
bCBzaG91bGQgYmUgcGFyc2VkIHdpdGhvdXQgcmVhbG0sIHdoaWxlCnRoZSBpbXBlcnNvbmF0b3Ig
cHJpbmNpcGFsIHNob3VsZCBiZSBwYXJzZWQgd2l0aCByZWFsbSAtIHRoYXQncwpob3cgV2luZG93
cyBnZW5lcmF0ZXMgdGhlIGJsb2IuCkluIE1TIHRlcm1pbm9sb2d5IHRoZSBwcm94eSBpcyB0aGUg
dGFyZ2V0IHNlcnZlciAtIG5vdCB0aGUKaW1wZXJzb25hdG9yLCB0cnkgbWFrZSBpdCBjbGVhcmVy
IGluIGNvZGUuCgpTaWduZWQtb2ZmLWJ5OiBJc2FhYyBCb3VrcmlzIDxpYm91a3Jpc0BnbWFpbC5j
b20+Ci0tLQogc291cmNlNC9rZGMvcGFjLWdsdWUuYyB8IDE2ICsrKysrKysrLS0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvc291cmNlNC9rZGMvcGFjLWdsdWUuYyBiL3NvdXJjZTQva2RjL3BhYy1nbHVlLmMKaW5kZXgg
MTI2MDAxY2I3MTguLmFiOThiYzg2NDc3IDEwMDY0NAotLS0gYS9zb3VyY2U0L2tkYy9wYWMtZ2x1
ZS5jCisrKyBiL3NvdXJjZTQva2RjL3BhYy1nbHVlLmMKQEAgLTc4Myw4ICs3ODMsOCBAQCBOVFNU
QVRVUyBzYW1iYV9rZGNfdXBkYXRlX3BhY19ibG9iKFRBTExPQ19DVFggKm1lbV9jdHgsCiBOVFNU
QVRVUyBzYW1iYV9rZGNfdXBkYXRlX2RlbGVnYXRpb25faW5mb19ibG9iKFRBTExPQ19DVFggKm1l
bV9jdHgsCiAJCQkJa3JiNV9jb250ZXh0IGNvbnRleHQsCiAJCQkJY29uc3Qga3JiNV9wYWMgcGFj
LAotCQkJCWNvbnN0IGtyYjVfcHJpbmNpcGFsIHNlcnZlcl9wcmluY2lwYWwsCi0JCQkJY29uc3Qg
a3JiNV9wcmluY2lwYWwgcHJveHlfcHJpbmNpcGFsLAorCQkJCWNvbnN0IGtyYjVfcHJpbmNpcGFs
IHByb3h5X3RhcmdldF9wcmluYywKKwkJCQljb25zdCBrcmI1X3ByaW5jaXBhbCBkZWxlZ19zZXJ2
ZXJfcHJpbmMsCiAJCQkJREFUQV9CTE9CICpuZXdfYmxvYikKIHsKIAlrcmI1X2RhdGEgb2xkX2Rh
dGE7CkBAIC04MzMsMjYgKzgzMywyNiBAQCBOVFNUQVRVUyBzYW1iYV9rZGNfdXBkYXRlX2RlbGVn
YXRpb25faW5mb19ibG9iKFRBTExPQ19DVFggKm1lbV9jdHgsCiAJfQogCXNtYl9rcmI1X2ZyZWVf
ZGF0YV9jb250ZW50cyhjb250ZXh0LCAmb2xkX2RhdGEpOwogCi0JcmV0ID0ga3JiNV91bnBhcnNl
X25hbWUoY29udGV4dCwgc2VydmVyX3ByaW5jaXBhbCwgJnNlcnZlcik7CisJcmV0ID0ga3JiNV91
bnBhcnNlX25hbWVfZmxhZ3MoY29udGV4dCwgcHJveHlfdGFyZ2V0X3ByaW5jLAorCQkJCSAgICAg
IEtSQjVfUFJJTkNJUEFMX1VOUEFSU0VfTk9fUkVBTE0sICZwcm94eSk7CiAJaWYgKHJldCkgewog
CQl0YWxsb2NfZnJlZSh0bXBfY3R4KTsKIAkJcmV0dXJuIE5UX1NUQVRVU19JTlRFUk5BTF9FUlJP
UjsKIAl9CiAKLQlyZXQgPSBrcmI1X3VucGFyc2VfbmFtZV9mbGFncyhjb250ZXh0LCBwcm94eV9w
cmluY2lwYWwsCi0JCQkJICAgICAgS1JCNV9QUklOQ0lQQUxfVU5QQVJTRV9OT19SRUFMTSwgJnBy
b3h5KTsKKwlyZXQgPSBrcmI1X3VucGFyc2VfbmFtZShjb250ZXh0LCBkZWxlZ19zZXJ2ZXJfcHJp
bmMsICZzZXJ2ZXIpOwogCWlmIChyZXQpIHsKLQkJU0FGRV9GUkVFKHNlcnZlcik7CisJCVNBRkVf
RlJFRShwcm94eSk7CiAJCXRhbGxvY19mcmVlKHRtcF9jdHgpOwogCQlyZXR1cm4gTlRfU1RBVFVT
X0lOVEVSTkFMX0VSUk9SOwogCX0KIAogCWQgPSBpbmZvLmNvbnN0cmFpbmVkX2RlbGVnYXRpb24u
aW5mbzsKIAlpID0gZC0+bnVtX3RyYW5zaXRlZF9zZXJ2aWNlczsKLQlkLT5wcm94eV90YXJnZXQu
c3RyaW5nID0gc2VydmVyOworCWQtPnByb3h5X3RhcmdldC5zdHJpbmcgPSBwcm94eTsKIAlkLT50
cmFuc2l0ZWRfc2VydmljZXMgPSB0YWxsb2NfcmVhbGxvYyhtZW1fY3R4LCBkLT50cmFuc2l0ZWRf
c2VydmljZXMsCiAJCQkJCSAgICAgICBzdHJ1Y3QgbHNhX1N0cmluZywgaSArIDEpOwotCWQtPnRy
YW5zaXRlZF9zZXJ2aWNlc1tpXS5zdHJpbmcgPSBwcm94eTsKKwlkLT50cmFuc2l0ZWRfc2Vydmlj
ZXNbaV0uc3RyaW5nID0gc2VydmVyOwogCWQtPm51bV90cmFuc2l0ZWRfc2VydmljZXMgPSBpICsg
MTsKIAogCW5kcl9lcnIgPSBuZHJfcHVzaF91bmlvbl9ibG9iKG5ld19ibG9iLCBtZW1fY3R4LAot
LSAKMi4yMC4xCgo=
--0000000000005df40e058a08ecb6--


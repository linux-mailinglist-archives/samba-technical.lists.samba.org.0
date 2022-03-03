Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B014CC7A1
	for <lists+samba-technical@lfdr.de>; Thu,  3 Mar 2022 22:10:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=pyx8lwsdPJwjcK7XIBauiKCmqgRTmS3+YW7TuUWBxl4=; b=dA8q9fUSvM/H/S/R0H43XMr+vn
	GoUb1LseRpuS8b7wfsi7zyylb54VZxlFqvNO5bqHWRTNyRXTTFFvXydc1ZOpUyBNV71EL8ra2Ob5E
	73jox2eN3G37mqxow2naBUfag/+9y3Qn/lx3FOMq3n6Iu0LtB8lP5PKMEgBJjrXZTw0+nUzTav19M
	nKLw4TensNOG0PsnUxMYsZhoWgJnvOZuldlSJ/bbXJ+Jnc5E8RKkajh7PIS1lTWpp6qbUAMzzcty5
	YjiyrDJSct18aTUICKT6e3DK66kHSLCBaW3/ujc+35o+qej5rrecERlo0GIgyJ//oF6j9CT/TzRu2
	wgD+xO0Q==;
Received: from ip6-localhost ([::1]:43430 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nPshE-00FVF4-4H; Thu, 03 Mar 2022 21:09:12 +0000
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d]:42863) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nPsh8-00FVEv-A1
 for samba-technical@lists.samba.org; Thu, 03 Mar 2022 21:09:09 +0000
Received: by mail-vk1-xa2d.google.com with SMTP id c4so3246930vkq.9
 for <samba-technical@lists.samba.org>; Thu, 03 Mar 2022 13:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=pyx8lwsdPJwjcK7XIBauiKCmqgRTmS3+YW7TuUWBxl4=;
 b=iy0KbbQCMQ507a5aZLukn7D+/ckJtO5+xGwCxBXfO0VrP8bX5adWgLCPtSyxXoaSSx
 ssyBc+6vgPBaBydIGHKY0VN2mQ/2nNs1hpEm+R84kJlCc6AgaJKaEqihiLXI/9/AdgNu
 LVRGXQp9U1jxXefyGRnFhQYROWzoTr1V7ukJdRJk9byo0SfRSC4mVb/YsigZ+540H3P4
 A+3S11HibiwnWrMdKISZffMWJXeDaclCxJ3YEbFcMn9HU4Vys9P94DNLW0kZkRwtNQdF
 2/hxDXyljTUVblktJPDv0zzDH3U4MQs6OW6VA5a01xEnLHXM0g8T7sabg8MWKGygQdl5
 OI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=pyx8lwsdPJwjcK7XIBauiKCmqgRTmS3+YW7TuUWBxl4=;
 b=5e6pa3+UIeYO5+4yF4UoGwzr2l+kyrm+x+bxUMZH/JrY3vrz0BQZ3S7ys3Msth9GX9
 SpYU5sKzBvNErHIJEmyc/e4plOWnAGlOHisTWLUlMVHq3b52N313Dg05uko9iu/8uzW/
 gcjS2KfWrR2tynRfF8Xn8nEelpHp5VEWwzHrlVWfRoRDKdeoVvTmziD9jv5icxrO08gR
 cQh5FilHygbCHvZrLQWvESuigJmi8HFnvjCebJO9tlK8j+vOlOpobNQz1D+D5SC6A+4B
 DEthAzZ9upaI427JVKMe2sdafpiSBc5AYwSNh4jV7mlN+Fwb1VN+Oz5EAkx/TS4JmTOm
 MqVA==
X-Gm-Message-State: AOAM532rkM0T687L2g9R6c50yVC+AYjZrK6szevSDF4KRhjpx+DemdZP
 43yRP9zJFb26qhQzzWyLksVUdz0YZhtrz38OaHCoQ/hL
X-Google-Smtp-Source: ABdhPJx/ex5V3kixdERqTNciR2uCnH9BfEkgakIdc6MFZw/+6ahFRaMckjor1dLLlkSMlDamYoUJNvM8IH8ybXsdkZM=
X-Received: by 2002:a05:6122:1692:b0:336:50d0:c772 with SMTP id
 18-20020a056122169200b0033650d0c772mr7465165vkl.3.1646341744307; Thu, 03 Mar
 2022 13:09:04 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ab0:15a4:0:0:0:0:0 with HTTP;
 Thu, 3 Mar 2022 13:09:03 -0800 (PST)
Date: Thu, 3 Mar 2022 23:09:03 +0200
Message-ID: <CAAQNcwukKj0fXtbFW7A3nm4QOiVG-H4L7kHG30mGkyX_eJBz8A@mail.gmail.com>
Subject: [PATCH] cifs-utils: work around missing krb5_free_string in Heimdal
To: samba-technical@lists.samba.org
Content-Type: multipart/mixed; boundary="000000000000d942cd05d956ce1f"
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
From: atheik via samba-technical <samba-technical@lists.samba.org>
Reply-To: atheik <atteh.mailbox@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--000000000000d942cd05d956ce1f
Content-Type: text/plain; charset="UTF-8"

The krb5_free_string function is not present in Heimdal and instead
krb5_xfree should be used for freeing the string allocation done by
krb5_cc_get_full_name.

--000000000000d942cd05d956ce1f
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-cifs-utils-work-around-missing-krb5_free_string-in-H.patch"
Content-Disposition: attachment; 
	filename="0001-cifs-utils-work-around-missing-krb5_free_string-in-H.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: file0

RnJvbSA0MjE2MTVjY2RmOTRjMmQyYzg0NDJmMDIzZmVlNzQ2YTU5ZDkxYjc3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBhdGhlaWsgPGF0dGVoLm1haWxib3hAZ21haWwuY29tPgpEYXRl
OiBUaHUsIDMgTWFyIDIwMjIgMjI6NDY6MjUgKzAyMDAKU3ViamVjdDogW1BBVENIXSBjaWZzLXV0
aWxzOiB3b3JrIGFyb3VuZCBtaXNzaW5nIGtyYjVfZnJlZV9zdHJpbmcgaW4gSGVpbWRhbAoKVGhl
IGtyYjVfZnJlZV9zdHJpbmcgZnVuY3Rpb24gaXMgbm90IHByZXNlbnQgaW4gSGVpbWRhbCBhbmQg
aW5zdGVhZAprcmI1X3hmcmVlIHNob3VsZCBiZSB1c2VkIGZvciBmcmVlaW5nIHRoZSBzdHJpbmcg
YWxsb2NhdGlvbiBkb25lIGJ5CmtyYjVfY2NfZ2V0X2Z1bGxfbmFtZS4KClNpZ25lZC1vZmYtYnk6
IGF0aGVpayA8YXR0ZWgubWFpbGJveEBnbWFpbC5jb20+Ci0tLQogY2lmcy51cGNhbGwuYyB8IDQg
KysrKwogY29uZmlndXJlLmFjICB8IDUgKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvY2lmcy51cGNhbGwuYyBiL2NpZnMudXBjYWxsLmMKaW5kZXgg
YWQwNDMwMS4uYTMwZjZkYSAxMDA2NDQKLS0tIGEvY2lmcy51cGNhbGwuYworKysgYi9jaWZzLnVw
Y2FsbC5jCkBAIC01MzMsNyArNTMzLDExIEBAIGdldF9leGlzdGluZ19jYyhjb25zdCBjaGFyICpl
bnZfY2FjaGVuYW1lKQogCQlzeXNsb2coTE9HX0RFQlVHLCAiJXM6IGtyYjVfY2NfZ2V0X2Z1bGxf
bmFtZSBmYWlsZWQ6ICVkXG4iLCBfX2Z1bmNfXywgcmV0KTsKIAl9IGVsc2UgewogCQlzeXNsb2co
TE9HX0RFQlVHLCAiJXM6IGRlZmF1bHQgY2NhY2hlIGlzICVzXG4iLCBfX2Z1bmNfXywgY2FjaGVu
YW1lKTsKKyNpZmRlZiBIQVZFX0tSQjVfRlJFRV9TVFJJTkcJLyogTUlUICovCiAJCWtyYjVfZnJl
ZV9zdHJpbmcoY29udGV4dCwgY2FjaGVuYW1lKTsKKyNlbHNlCS8qIEhlaW1kYWwgKi8KKwkJa3Ji
NV94ZnJlZShjYWNoZW5hbWUpOworI2VuZGlmCiAJfQogCiAJaWYgKCFnZXRfdGd0X3RpbWUoY2Mp
KSB7CmRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKaW5kZXggYmE2ZGZl
MS4uMjkzN2VlMiAxMDA2NDQKLS0tIGEvY29uZmlndXJlLmFjCisrKyBiL2NvbmZpZ3VyZS5hYwpA
QCAtMjU2LDYgKzI1NiwxMSBAQCBpZiB0ZXN0ICRlbmFibGVfY2lmc3VwY2FsbCAhPSAibm8iOyB0
aGVuCiAJQUNfQ0hFQ0tfRlVOQ1MoW2tyYjVfYXV0aF9jb25fc2V0YWRkcnMga3JiNV9hdXRoX2Nv
bl9zZXRfcmVxX2Nrc3VtdHlwZV0pCiBmaQogCisjIGRldGVybWluZSBob3cgdG8gZnJlZSBhIHN0
cmluZyBhbGxvY2F0ZWQgYnkgYSBrcmI1IGZ1bmN0aW9uCitpZiB0ZXN0ICRlbmFibGVfY2lmc3Vw
Y2FsbCAhPSAibm8iOyB0aGVuCisJQUNfQ0hFQ0tfRlVOQ1MoW2tyYjVfZnJlZV9zdHJpbmddKQor
ZmkKKwogaWYgdGVzdCAkZW5hYmxlX3N5c3RlbWQgIT0gIm5vIjsgdGhlbgogCUFDX0RFRklORShF
TkFCTEVfU1lTVEVNRCwgMSwgW0VuYWJsZSBzeXN0ZW1kIHNwZWNpZmljIGJlaGF2aW9yIGZvciBt
b3VudC5jaWZzXSkKIGZpCi0tIAoyLjM1LjEKCg==
--000000000000d942cd05d956ce1f--


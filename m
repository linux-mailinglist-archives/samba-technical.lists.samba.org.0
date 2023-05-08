Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA786F9F22
	for <lists+samba-technical@lfdr.de>; Mon,  8 May 2023 07:38:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=ZS7iBiT3MqEhcXXQkzzeQcnpCKE5TAS9/DMn1oh0VNM=; b=ZvBgXvuH24uZuoPZdvf+7wT+H4
	XO+jWqL6xvwj+NfJ6p68Fo8oFau59NCszdRoIK5vL8FIpYN5/Ubw96VCwU/seF2D6w7cjJQhcQE7K
	XMwHUCo/g7bSaXUYh1j+cOmLxwTaJjnQgo6cCBAESFimfkbLKJvB50te31rycNqdvBDcdw5qiP9Es
	kxRTXxUC2Bxw3OBbgfKFz7+iJTF0WolZL/L/lpZX3SgWGdhwriAXupL1NYDcZZQBKmqFomPyrKOe6
	inf5mZrfBePfafX0JujUMizbCDkW1GGG1EdbxgP+h4w73Cok4cXV+VEVwT5SXBYyMNp8WsF1DXubH
	TUcysY2Q==;
Received: from ip6-localhost ([::1]:30106 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pvtYc-008rJJ-SS; Mon, 08 May 2023 05:37:10 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:58790) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pvtYY-008rJA-Kh
 for samba-technical@lists.samba.org; Mon, 08 May 2023 05:37:08 +0000
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2ac78bb48eeso45491331fa.1
 for <samba-technical@lists.samba.org>; Sun, 07 May 2023 22:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683524224; x=1686116224;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ZS7iBiT3MqEhcXXQkzzeQcnpCKE5TAS9/DMn1oh0VNM=;
 b=ePfzG1OBB13l5ChKS6bHvHTNvxWThXVKgykVTmIWtkn9NTXfkumAZ/TWeQwjFZHM1X
 HOL4G3Nk1hjY6K39Fq0rGZx9cWjc/6mOBZeLk+7wklVX5Fl3x7+54YO+os9RK4tFH5Rr
 FzW4st/Vtl8QHCSV/6N1oXt7ZeEu/NbuOGU6gGkNxidStottOV1YAfanZOUVwwdVXVE3
 bznYfkMTq6dC/E313Zn/g9vcuIbq03ZqRThBmi0v0LHQiUW3y7S+ZZenf3WNSbp87E/1
 XaCzjY/8Cui+bOhK43lUsBruCKCnsnabY44TYN87pe3BguPZ++py4A9KTH4noqz2UVFL
 zktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683524224; x=1686116224;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZS7iBiT3MqEhcXXQkzzeQcnpCKE5TAS9/DMn1oh0VNM=;
 b=MKxXvnNx9aRqBOGxMjL0+uTsf9zeKHmJZ2De5c0THH7aWYWLs9ZSt/bhwhwqvlNbkY
 PWotQVMRHHIsLbw7jPo5KBnrwJtuSwJLKDYHlQl2qBVNPsRkfXvAsdfvDRjXI7xMYkBV
 0SUjMPhhrawOoMIc7Ul1UG/5L8jnrCNqLzGKPWGUt1FH64PnsktjzPowMSC9MRouw1TG
 0pGlvgtggI+PUzm/YeKaBPaawNzIP6MIXhUB3K2/zINnqRYJ5VF4kpyzGvS/VYuV2HbX
 dUVJlQ/6eq46zOie19P7gOT6UNeG7qo/PYzqES3wiS2aa7WfZx5hysX824sGHBIIlemY
 RX4w==
X-Gm-Message-State: AC+VfDwAz6GGX7iWogFR16p3G2cHAmDkbw6qDY9L729kZME4PNBiTBpq
 poRUgsCFsRofjD15X8OmYM2xx0oy80fvBqT9fIM=
X-Google-Smtp-Source: ACHHUZ4AbUTrDAhrw3HVUtrP9NNumAyAzWYCmsqkWoVEBS5WiP3TgTeOfH2JS4QC3ac6SKq2Z3DyAz6GCcnYj4IxVfQ=
X-Received: by 2002:a2e:93c3:0:b0:2a8:a5b8:185a with SMTP id
 p3-20020a2e93c3000000b002a8a5b8185amr2426649ljh.10.1683524223921; Sun, 07 May
 2023 22:37:03 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 8 May 2023 00:36:47 -0500
Message-ID: <CAH2r5mtN7BW6AoeNEAPM=+7YM2EUtxJJ9bt-ezsiFcDCYH+e4g@mail.gmail.com>
Subject: [PATCH][CIFS] do not reuse connection if share marked as isolated
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
Content-Type: multipart/mixed; boundary="0000000000005683d405fb2807b0"
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

--0000000000005683d405fb2807b0
Content-Type: text/plain; charset="UTF-8"

"SHAREFLAG_ISOLATED_TRANSPORT" indicates that we should not reuse the socket
for this share (for future mounts).  Mark the socket as server->nosharesock if
share flags returned include SHAREFLAG_ISOLATED_TRANSPORT.

See MS-SMB2 MS-SMB2 2.2.10 and 3.2.5.5

See attached patch


-- 
Thanks,

Steve

--0000000000005683d405fb2807b0
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-SMB3.1.1-do-not-reuse-connection-if-share-marked-as-.patch"
Content-Disposition: attachment; 
	filename="0001-SMB3.1.1-do-not-reuse-connection-if-share-marked-as-.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lheeuekh0>
X-Attachment-Id: f_lheeuekh0

RnJvbSA0MzY1YTM5MWIxYjVjMGYyYTA2NWFiYWZhZmU0YWJkYTllOTYwMzhhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFN1biwgNyBNYXkgMjAyMyAxNzo1NzoxNyAtMDUwMApTdWJqZWN0OiBbUEFUQ0hdIFtT
TUIzLjEuMV0gZG8gbm90IHJldXNlIGNvbm5lY3Rpb24gaWYgc2hhcmUgbWFya2VkIGFzCiBpc29s
YXRlZAoKIlNIQVJFRkxBR19JU09MQVRFRF9UUkFOU1BPUlQiIGluZGljYXRlcyB0aGF0IHdlIHNo
b3VsZCBub3QgcmV1c2UgdGhlCnNvY2tldCBmb3IgdGhpcyBzaGFyZSAoZm9yIGZ1dHVyZSBtb3Vu
dHMpLiAgTWFyayB0aGUgc29ja2V0IGFzCnNlcnZlci0+bm9zaGFyZXNvY2sgaWYgc2hhcmUgZmxh
Z3MgcmV0dXJuZWQgaW5jbHVkZQpTSEFSRUZMQUdfSVNPTEFURURfVFJBTlNQT1JULgoKU2VlIE1T
LVNNQjIgTVMtU01CMiAyLjIuMTAgYW5kIDMuMi41LjUKClNpZ25lZC1vZmYtYnk6IFN0ZXZlIEZy
ZW5jaCA8c3RmcmVuY2hAbWljcm9zb2Z0LmNvbT4KLS0tCiBmcy9jaWZzL3NtYjJwZHUuYyB8IDMg
KysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZnMvY2lm
cy9zbWIycGR1LmMgYi9mcy9jaWZzL3NtYjJwZHUuYwppbmRleCBlMzNjYTBkMzM5MDYuLjllZDYx
YjZmOWIyMSAxMDA2NDQKLS0tIGEvZnMvY2lmcy9zbWIycGR1LmMKKysrIGIvZnMvY2lmcy9zbWIy
cGR1LmMKQEAgLTE5NDcsNiArMTk0Nyw5IEBAIFNNQjJfdGNvbihjb25zdCB1bnNpZ25lZCBpbnQg
eGlkLCBzdHJ1Y3QgY2lmc19zZXMgKnNlcywgY29uc3QgY2hhciAqdHJlZSwKIAlpbml0X2NvcHlf
Y2h1bmtfZGVmYXVsdHModGNvbik7CiAJaWYgKHNlcnZlci0+b3BzLT52YWxpZGF0ZV9uZWdvdGlh
dGUpCiAJCXJjID0gc2VydmVyLT5vcHMtPnZhbGlkYXRlX25lZ290aWF0ZSh4aWQsIHRjb24pOwor
CWlmIChyYyA9PSAwKSAvKiBTZWUgTVMtU01CMiAyLjIuMTAgYW5kIDMuMi41LjUgKi8KKwkJaWYg
KHRjb24tPnNoYXJlX2ZsYWdzICYgU01CMl9TSEFSRUZMQUdfSVNPTEFURURfVFJBTlNQT1JUKQor
CQkJc2VydmVyLT5ub3NoYXJlc29jayA9IHRydWU7CiB0Y29uX2V4aXQ6CiAKIAlmcmVlX3JzcF9i
dWYocmVzcF9idWZ0eXBlLCByc3ApOwotLSAKMi4zNC4xCgo=
--0000000000005683d405fb2807b0--


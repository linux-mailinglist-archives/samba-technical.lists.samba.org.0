Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC0993A57A
	for <lists+samba-technical@lfdr.de>; Tue, 23 Jul 2024 20:22:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=1XDoX4Al4RHvx68f0zteTAdo2hXftFjzCiJ1b8jFKKs=; b=FsGIJaCAYfWpEuRJMHjlqislQh
	7z3yq6cAoKJfNVfVBIq6OIBQ24aQCKv+ekzMKb5nFvvPlhPLFqN/D97bno2cm/HmnZhwx7HQrpzCZ
	9/1tnyFZt4Zd5IYH5LzUr6sXAE5pjzl9B3jEsGhNc/E8Hum84lGi0Kaxp6PWVV06Em2vohwC3lTfn
	3YNnl0napoj0RoQzPau8TSRi96BfsztZvULtL+ZJZpy7Y0NGxLL326peMy0/t3wgVrXDCnma5jOFK
	tw6wcv/pUjl/3OF8jVenHMJtx4WkysPAN70b61Q+yOXLpIKn0osxBbUpoC9G9jHflAgvhf993utMP
	6eH8Cclg==;
Received: from ip6-localhost ([::1]:59314 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sWK9F-001MPs-Il; Tue, 23 Jul 2024 18:22:05 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:58630) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sWK9A-001MPl-Tj
 for samba-technical@lists.samba.org; Tue, 23 Jul 2024 18:22:02 +0000
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52fc14d6689so2233957e87.1
 for <samba-technical@lists.samba.org>; Tue, 23 Jul 2024 11:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721758919; x=1722363719; darn=lists.samba.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=1XDoX4Al4RHvx68f0zteTAdo2hXftFjzCiJ1b8jFKKs=;
 b=cuA0gC61wmoQvWR2zAIWuMfL8qdAPv1uKPIIbNzRnQYRiGmeaIzRVTMC23ddDMP8ol
 nKmCW5OugCePHqVAkTj0E2A6fcYAen98h/WgRh0hsuI8Eq/6qtZNODJjz8/vn15eWxI3
 Peez8S46nh+2Wi8yn8XgXKG8aWEGX4Nu1+fFI5v6m4uarP95HliqUefN5ONFbCuR6DLj
 XQpHR+sLBwk5EctS2IauHrbyms2mWecmBndVRCnumeRRVK+N0azB7nmKkgancw4p9T7V
 qBwhkk/zXTePnwxKjRIezPWHwqdZTlmlPJnGeL9JUI1X/2x4j+U/QqD9LAyYYuXWuC3c
 nG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721758919; x=1722363719;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1XDoX4Al4RHvx68f0zteTAdo2hXftFjzCiJ1b8jFKKs=;
 b=DNj3oDQlVe88Mt/vJfVXbat+i6edMZAWQ9OUTBKSIgNypz/BiZrQl6pg2S7RyrQsVD
 UaqlFDDOZUVh6yVqUQMuWVYFFYIq8ynDV5EcfrDsGNgYRGfsNWZIgEwwxHFbqXyK/8XA
 SbtkheFmeHZ7B20LFIcMYNlwLieYsSxvjI94VX8F8w69iyk0SG6tEbt1TqAQpidG20Im
 IlClL3k9eCfIf7ysHtaEstcwQ27SJU4VCOrrI6BnUulPw6JTjbWzqODNMQQ3aiuYOFpA
 PxLbJwk2k+VGosayVMxq4W//ih1GLdaJpzMcRtpPExkiUUEcUGXmDm7nMXWnYMr7MtPD
 kgEA==
X-Gm-Message-State: AOJu0YyOmKyE/hfEcH7jKvmNUgG1lK3nPYM0Y5EGFfDrWiZyDYbKcoWq
 ZaandPm2w54Rk+tjFd2Ar0GsPOELTmQAPtOlUOQfBwTBd2fEDFmv1hDLSqmnDTEa39xl7nzcQNm
 JHm6YUBDy3MbhxxvgjUrvmwCWctVc1Q==
X-Google-Smtp-Source: AGHT+IE//9pP+xUM5Z92LifXTaCHkgutPFZPFbJlPTZPd0lSuB9uG7JM6RyKFz4IyOl1s5Jcmp1CndwtZKmh0qsjyEw=
X-Received: by 2002:a05:6512:b21:b0:52e:a60e:3a04 with SMTP id
 2adb3069b0e04-52efb85af78mr6876338e87.59.1721758918723; Tue, 23 Jul 2024
 11:21:58 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 23 Jul 2024 13:21:45 -0500
Message-ID: <CAH2r5mvBCuc2tnbLeJnw5zEqqQJ_Qe9eiNiLxHg6eXeAi0n7FA@mail.gmail.com>
Subject: [PATCH v2][CIFS] mount with "unix" mount option for SMB1 incorrectly
 handled
To: samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>, Paulo Alcantara <pc@manguebit.com>
Content-Type: multipart/mixed; boundary="000000000000bd8df9061dee3c22"
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

--000000000000bd8df9061dee3c22
Content-Type: text/plain; charset="UTF-8"

Lightly updated to include feedback from Paulo and add the reviewed-by



-- 
Thanks,

Steve

--000000000000bd8df9061dee3c22
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-cifs-mount-with-unix-mount-option-for-SMB1-incorrect.patch"
Content-Disposition: attachment; 
	filename="0001-cifs-mount-with-unix-mount-option-for-SMB1-incorrect.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lyyqsmqx0>
X-Attachment-Id: f_lyyqsmqx0

RnJvbSAzNmEzYWQyNTI4NzM1YzQwMDdhZGU4NTIwYjY1MTQzYjU3NDAwODEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IFR1ZSwgMjMgSnVsIDIwMjQgMDA6NDQ6NDggLTA1MDAKU3ViamVjdDogW1BBVENIXSBj
aWZzOiBtb3VudCB3aXRoICJ1bml4IiBtb3VudCBvcHRpb24gZm9yIFNNQjEgaW5jb3JyZWN0bHkK
IGhhbmRsZWQKCkFsdGhvdWdoIGJ5IGRlZmF1bHQgd2UgbmVnb3RpYXRlIENJRlMgVW5peCBFeHRl
bnNpb25zIGZvciBTTUIxIG1vdW50cyB0bwpTYW1iYSAoYW5kIHRoZXkgd29yayBpZiB0aGUgdXNl
ciBkb2VzIG5vdCBzcGVjaWZ5ICJ1bml4IiBvciAicG9zaXgiIG9yCiJsaW51eCIgb24gbW91bnQp
LCBhbmQgd2UgZG8gcHJvcGVybHkgaGFuZGxlIHdoZW4gYSB1c2VyIHR1cm5zIHRoZW0gb2ZmCndp
dGggIm5vdW5peCIgbW91bnQgcGFybS4gIEJ1dCB3aXRoIHRoZSBjaGFuZ2VzIHRvIHRoZSBtb3Vu
dCBBUEkgd2UKYnJva2UgY2FzZXMgd2hlcmUgdGhlIHVzZXIgZXhwbGljaXRseSBzcGVjaWZpZXMg
dGhlICJ1bml4IiBvcHRpb24gKG9yCmVxdWl2YWxlbnRseSAibGludXgiIG9yICJwb3NpeCIpIG9u
IG1vdW50IHdpdGggdmVycz0xLjAgdG8gU2FtYmEgb3Igb3RoZXIKc2VydmVycyB3aGljaCBzdXBw
b3J0IHRoZSBDSUZTIFVuaXggRXh0ZW5zaW9ucy4KCiAibW91bnQgZXJyb3IoOTUpOiBPcGVyYXRp
b24gbm90IHN1cHBvcnRlZCIKCmFuZCBsb2dnZWQ6CgogIkNJRlM6IFZGUzogQ2hlY2sgdmVycz0g
bW91bnQgb3B0aW9uLiBTTUIzLjExIGRpc2FibGVkIGJ1dCByZXF1aXJlZCBmb3IgUE9TSVggZXh0
ZW5zaW9ucyIKCmV2ZW4gdGhvdWdoIENJRlMgVW5peCBFeHRlbnNpb25zIGFyZSBzdXBwb3J0ZWQg
Zm9yIHZlcnM9MS4wICBUaGlzIHBhdGNoIGZpeGVzCnRoZSBjYXNlIHdoZXJlIHRoZSB1c2VyIHNw
ZWNpZmllcyBib3RoICJ1bml4IiAob3IgZXF1aXZhbGVudGx5ICJwb3NpeCIgb3IKImxpbnV4Iikg
YW5kICJ2ZXJzPTEuMCIgb24gbW91bnQgdG8gYSBzZXJ2ZXIgd2hpY2ggc3VwcG9ydHMgdGhlCkNJ
RlMgVW5peCBFeHRlbnNpb25zLgoKQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKUmV2aWV3ZWQt
Ynk6IERhdmlkIEhvd2VsbHMgPGRob3dlbGxAcmVkaGF0LmNvbT4KUmV2aWV3ZWQtYnk6IFBhdWxv
IEFsY2FudGFyYSAoUmVkIEhhdCkgPHBjQG1hbmd1ZWJpdC5jb20+ClNpZ25lZC1vZmYtYnk6IFN0
ZXZlIEZyZW5jaCA8c3RmcmVuY2hAbWljcm9zb2Z0LmNvbT4KLS0tCiBmcy9zbWIvY2xpZW50L2Nv
bm5lY3QuYyB8IDggKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9mcy9zbWIvY2xpZW50L2Nvbm5lY3QuYyBiL2ZzL3NtYi9jbGllbnQvY29ubmVj
dC5jCmluZGV4IGI2NmQ4YjAzYTM4OS4uODAyMjMwMDdiY2U0IDEwMDY0NAotLS0gYS9mcy9zbWIv
Y2xpZW50L2Nvbm5lY3QuYworKysgYi9mcy9zbWIvY2xpZW50L2Nvbm5lY3QuYwpAQCAtMjYxNCw2
ICsyNjE0LDE0IEBAIGNpZnNfZ2V0X3Rjb24oc3RydWN0IGNpZnNfc2VzICpzZXMsIHN0cnVjdCBz
bWIzX2ZzX2NvbnRleHQgKmN0eCkKIAkJCWNpZnNfZGJnKFZGUywgIlNlcnZlciBkb2VzIG5vdCBz
dXBwb3J0IG1vdW50aW5nIHdpdGggcG9zaXggU01CMy4xMSBleHRlbnNpb25zXG4iKTsKIAkJCXJj
ID0gLUVPUE5PVFNVUFA7CiAJCQlnb3RvIG91dF9mYWlsOworCQl9IGVsc2UgaWYgKHNlcy0+c2Vy
dmVyLT52YWxzLT5wcm90b2NvbF9pZCA9PSBTTUIxMF9QUk9UX0lEKQorCQkJaWYgKGNhcF91bml4
KHNlcykpCisJCQkJY2lmc19kYmcoRllJLCAiVW5peCBFeHRlbnNpb25zIHJlcXVlc3RlZCBvbiBT
TUIxIG1vdW50XG4iKTsKKwkJCWVsc2UgeworCQkJCWNpZnNfZGJnKFZGUywgIlNNQjEgVW5peCBF
eHRlbnNpb25zIG5vdCBzdXBwb3J0ZWQgYnkgc2VydmVyOiAlc1xuIiwKKwkJCQkJIHNlcy0+c2Vy
dmVyLT5ob3N0bmFtZSk7CisJCQkJcmMgPSAtRU9QTk9UU1VQUDsKKwkJCQlnb3RvIG91dF9mYWls
OwogCQl9IGVsc2UgewogCQkJY2lmc19kYmcoVkZTLAogCQkJCSJDaGVjayB2ZXJzPSBtb3VudCBv
cHRpb24uIFNNQjMuMTEgZGlzYWJsZWQgYnV0IHJlcXVpcmVkIGZvciBQT1NJWCBleHRlbnNpb25z
XG4iKTsKLS0gCjIuNDMuMAoK
--000000000000bd8df9061dee3c22--


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C99EC80F927
	for <lists+samba-technical@lfdr.de>; Tue, 12 Dec 2023 22:24:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=7+ltq4umEyzhbT90BaxvmEdVz/Wa64cQMFpsHfpnqKE=; b=peFZxv9797nuSLRmy9XCSEhK6d
	tlFjTvEGJpBFhsaroRWOwwDeo5dtgn7/IHhX0XgNQL++5+vuuDeVTywzO5rxTReEjYJ0n3M339vn0
	3cP3ia7WwyT8TKq3fWmiz30E6woyuM3P4VEkLPkmrbbC+X2lMTreEoiX1sx0YKflDnz5Wg/hTmD9a
	Izm6vP3Z3mGknvVzYYImLARjH0fthw8yPCUzykq3cw6bfXCbKfp/KrnGUzEXKopihVH57BuO179XH
	2gC+ttmwaE8CtF3+rj1QEO1pJQqXtVJL5jkFLczh2hSpeqeWao6tmzOc4KGjNQ5J+b7ObTgeWF88i
	j51DqmZg==;
Received: from ip6-localhost ([::1]:23218 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rDADu-006WlN-CB; Tue, 12 Dec 2023 21:23:26 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:39310) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1rDADo-006WlE-Jg
 for samba-technical@lists.samba.org; Tue, 12 Dec 2023 21:23:24 +0000
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50bf015e5e4so1190309e87.1
 for <samba-technical@lists.samba.org>; Tue, 12 Dec 2023 13:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702416198; x=1703020998; darn=lists.samba.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:to:references
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7+ltq4umEyzhbT90BaxvmEdVz/Wa64cQMFpsHfpnqKE=;
 b=jY/vObpx8HF29vQ1/rimMkoSv0Glp+yXS17aJtu7BHSwtmb6T4j8ifdMT91MjHbz0Y
 VnEpTyeTqhHqSJcN70V4HV0bJQzIGK2/d05L5oA3aTfvMWJ6ETVRkXZwBuyaOgZZwZls
 ERVjxP+iDaIGWKDYMiLa7Dgw7F4YpUc4ehC50of+/Il11XTQNCRxBSx9nZduczj6rd60
 gjQd2D5tBPCQr80hukt91R54bcqv8cIatNySxsvSEH35PInZZWaleA+GmUbYuy7JsSpI
 YRfLznCrzxPCGLLo5nm592qk1qkaEsyG64HIEwOrMk16Gna4KUT/6gtm4EZ4g4ArWSX+
 1rbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702416198; x=1703020998;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:to:references
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7+ltq4umEyzhbT90BaxvmEdVz/Wa64cQMFpsHfpnqKE=;
 b=Qjy2sDvOQGbQ6MHL7sBlCS+Ln+MLj5veGlC66P2zE2XGXHlA9df0sjlK2Rg2cOxzNK
 uX20QFbVhQxnPPuZHf/pmxEtUbELbYrUYioH78yOmhA0RTAOo32VQrvaBEopKtCPCcTs
 H1dEPpXQpZUwRETSMAMACFB46fELkvgaeW/IAhLHqb3ZXGx8sgYMAbLGdVsp3O5FZ7hG
 NiRMpdA4PnK4QwdFBAXtMHcDapH59woCdPLOoLK/XJRZfugq16z/kH1JN9Weo8UN3gun
 6e9fGWsOs35vLlAgM3xDQjoKS7ZqZPKu/MzKPNrzSYwCDuQt7vw9B4PT1zZHHOaZVyGT
 ZNyQ==
X-Gm-Message-State: AOJu0YyNUgMRkfcM+SpwehmvD66dqvxNNXxQ/sOIxXY2L9qvlTSDPSOK
 zLsGW67HPTTHlsVA35erJvqoWs+hw66Ctg==
X-Google-Smtp-Source: AGHT+IG+s1AD4x/EDP00Tmn7iWjIAQFnShL4ufy70FNOZ4CF+iU4Ei8xxMVMNGqcuHPmK9EteXcDuA==
X-Received: by 2002:a05:6512:3d1d:b0:50c:110a:b5ac with SMTP id
 d29-20020a0565123d1d00b0050c110ab5acmr7371835lfv.3.1702416197851; 
 Tue, 12 Dec 2023 13:23:17 -0800 (PST)
Received: from [192.168.1.2] (h-98-128-130-182.A980.priv.bahnhof.se.
 [98.128.130.182]) by smtp.googlemail.com with ESMTPSA id
 t16-20020a056512069000b0050bfdfdf6ebsm1436343lfe.14.2023.12.12.13.23.17
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Dec 2023 13:23:17 -0800 (PST)
Message-ID: <92f7065a-96eb-4acc-a6f5-9a9b609f6fe2@gmail.com>
Date: Tue, 12 Dec 2023 22:23:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH] nmb/smb.service.in: Silence empty N/SMBDOPTIONS warnings
Content-Language: en-US
References: <a974dcf5-5ab9-41c9-bab4-f828c1202bfa@gmail.com>
To: samba-technical@lists.samba.org
In-Reply-To: <a974dcf5-5ab9-41c9-bab4-f828c1202bfa@gmail.com>
X-Forwarded-Message-Id: <a974dcf5-5ab9-41c9-bab4-f828c1202bfa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
From: Joakim Roubert via samba-technical <samba-technical@lists.samba.org>
Reply-To: Joakim Roubert <joakim.roubert@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Unset/empty NMBDOPTIONS and SMBDOPTIONS triggers the syslog warnings

nmbd.service: Referenced but unset environment variable evaluates to
an empty string: NMBDOPTIONS
smbd.service: Referenced but unset environment variable evaluates to
an empty string: SMBDOPTIONS

Setting the replace-with-nothing-if-not-set substitutions
${NMBDOPTIONS:-} and ${SMBDOPTIONS:-} in the service files rather than
using $NMBDOPTIONS and $SMBDOPTIONS mitigates this and shows this is
what we want and not something that was missed (which the warning is
all about).

Signed-off-by: Joakim Roubert <joakim.roubert@gmail.com>
---
  packaging/systemd/nmb.service.in | 2 +-
  packaging/systemd/smb.service.in | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/packaging/systemd/nmb.service.in 
b/packaging/systemd/nmb.service.in
index ceeeea408ec..2c53558d98c 100644
--- a/packaging/systemd/nmb.service.in
+++ b/packaging/systemd/nmb.service.in
@@ -8,7 +8,7 @@ After=network.target network-online.target
  Type=notify
  PIDFile=@PIDDIR@/nmbd.pid
  EnvironmentFile=-@SYSCONFDIR@/sysconfig/samba
-ExecStart=@SBINDIR@/nmbd --foreground --no-process-group $NMBDOPTIONS
+ExecStart=@SBINDIR@/nmbd --foreground --no-process-group ${NMBDOPTIONS:-}
  ExecReload=/bin/kill -HUP $MAINPID
  LimitCORE=infinity
  @systemd_nmb_extra@
diff --git a/packaging/systemd/smb.service.in 
b/packaging/systemd/smb.service.in
index 64c77c01502..3526339f24d 100644
--- a/packaging/systemd/smb.service.in
+++ b/packaging/systemd/smb.service.in
@@ -9,7 +9,7 @@ Type=notify
  PIDFile=@PIDDIR@/smbd.pid
  LimitNOFILE=16384
  EnvironmentFile=-@SYSCONFDIR@/sysconfig/samba
-ExecStart=@SBINDIR@/smbd --foreground --no-process-group $SMBDOPTIONS
+ExecStart=@SBINDIR@/smbd --foreground --no-process-group ${SMBDOPTIONS:-}
  ExecReload=/bin/kill -HUP $MAINPID
  LimitCORE=infinity
  @systemd_smb_extra@
-- 
2.43.0



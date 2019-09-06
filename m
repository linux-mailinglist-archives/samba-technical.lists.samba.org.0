Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9C5AB1C6
	for <lists+samba-technical@lfdr.de>; Fri,  6 Sep 2019 06:46:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=3VrPeA2ERM/cOlyboUm0Yg/R1ZelGHXFDs/wEBh0lm8=; b=NnmY6ynX1NvS3CCI+r4TMuXIWT
	W776por0pNP96cYjNzB42QvsQWewKZL/3n5rXWkg5Ri4CBdwJVI2TRU0ObIUwV/sf8BBCqAUrUB6t
	wp0/EDqj8NrNsHsfUKDIpv5zL3vbrtd0wA98BAyHzI8k9/sCitD23qQ7D3ZYG/XZ52FlqbhJkaO5o
	tOX3e5GrSlu5rolc7ZLQjSYoIW2ArpvxexbB1UszieguFFokdJvogF6aY3LESauHlKgM1eNf8nA+Q
	o+f4kauB1E7wOfb1GM6LmB8uSVjIRdsKA/QmgyQKd2Xo+nVYe/hNHYDQcmBO/Et/64+0gPWY2BZdX
	pZFtOGgA==;
Received: from localhost ([::1]:33202 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i667c-003rCe-Nb; Fri, 06 Sep 2019 04:45:20 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:35861) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i667S-003rCV-BN
 for samba-technical@lists.samba.org; Fri, 06 Sep 2019 04:45:13 +0000
Received: by mail-pg1-x542.google.com with SMTP id l21so2760570pgm.3
 for <samba-technical@lists.samba.org>; Thu, 05 Sep 2019 21:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3VrPeA2ERM/cOlyboUm0Yg/R1ZelGHXFDs/wEBh0lm8=;
 b=JwIT2YMOXA6MK3boJ1iLIcRlnZhFegpS89ARs+T523jlB6F8+sOTD+ZcP7y/qLRjFM
 AII2rALhImMr7NHx+uwP00fLI7Hrcj59dEGEH+fyGgHQe1IV67rlFcN3CUejNqnV8ATz
 kjN3ptAK31fK2a41eCFy/JnHn5hnd3uvEpNtkmhrCHIOn7SfP1nPOPVwb3LvwMUzOKpm
 uZa8Xt6/YclOeTfB3Ecw4W3EBWb+QP0EK/t/3ni40X89vcq0F+ygw4Br9OhyKk9ZIufV
 IWMcT6LueZYsaLNy4sYs2x+hH2YIyfa4+qiVAhMKDwdUY43gSdU2T5lVT7/AHgHFLc15
 IUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3VrPeA2ERM/cOlyboUm0Yg/R1ZelGHXFDs/wEBh0lm8=;
 b=XqOgMckM0TSbkMiDOe1JzfwEcJf/EQy3F2siwvXdWc3zu0o0PVoK7K7Or3XG4T0smd
 hVgS9bKcfUegZrr+16clZkxHSpFZ2CIe8N8wDncXoZgsO+gsUDHk44XdZP73S+h0aUB6
 46ZfnreXoN9pdOPGl3mXYoqQs1gwXvPxeO8adKZ+N+rf+w1wlw7L78R+qk2J+Ad7E27D
 anXXk73HHJNEkPT5b8PVDhk3sQ7NNxgJMMPgpSwphA1i0BQY1SfRk2wVKfqIcopA4PCX
 wURc+V0mUkLdakXOnmT+55h33etl2bNGoeYwA4DDalT2K2J4Py0MnogzG6vWd6CAEZs9
 kqQA==
X-Gm-Message-State: APjAAAUc6vElgmom3U6KWX8UDNQxjOhUhFloJMMIGpINPltKHxWbahZo
 lOLy+d7oN3IUWhDAqcNAcUi4zm3YNBU=
X-Google-Smtp-Source: APXvYqy9IVwmjwwSIqqkqnu0IiDfGXD+3LTKq+CG7uptIOlY8Ym7Fs5N0YJJa4YPTORLjcLTsbbnBw==
X-Received: by 2002:a17:90a:6581:: with SMTP id
 k1mr7684999pjj.47.1567745106473; 
 Thu, 05 Sep 2019 21:45:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
 [73.71.176.3])
 by smtp.gmail.com with ESMTPSA id v12sm4109060pff.40.2019.09.05.21.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 21:45:06 -0700 (PDT)
To: samba-technical@lists.samba.org
Subject: [PATCH 1/2] lib/replace/wscript: Avoid generating nested main function
Date: Thu,  5 Sep 2019 21:44:46 -0700
Message-Id: <20190906044447.41266-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
From: Khem Raj via samba-technical <samba-technical@lists.samba.org>
Reply-To: Khem Raj <raj.khem@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

clang is not happy when it sees another main nested inside the main
function and fails the test for prctl syscall, therefore avoid adding
implicit main() here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 lib/replace/wscript | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/replace/wscript b/lib/replace/wscript
index a7fd25d..d6767fc 100644
--- a/lib/replace/wscript
+++ b/lib/replace/wscript
@@ -137,6 +137,7 @@ def configure(conf):
                     }
                     ''',
                     'HAVE_PRCTL',
+                    addmain=False,
                     headers='sys/prctl.h',
                     msg='Checking for prctl syscall')
 
-- 
2.23.0



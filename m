Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 20872EB852
	for <lists+samba-technical@lfdr.de>; Thu, 31 Oct 2019 21:19:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Th2+CibBWexidRT75tQ34FfITBJLmrgNSofa0TQFmhA=; b=o8WfzHRxB7VZCuF5AcFjmYU1jz
	f9Ct9P5vDJRBeJehis1ZVzkCuKIr73TFxRCTVR86mwmkREhLQssN9xr9lgnDzv35So+k2oamTN9MX
	8SjQYp9QUaoePkAJopGW9Rvn7bDxKUXVhFpZJDtjviQOBn6617W0yndzoQuCFETFT91UmG6F6ixEk
	mR/9XUa2r5D6J1rrJlmZkvkG9eQGXdeiS6vipDYn5Wj6OOqAfmxgjcuaf29a1rC17TaeWoCQNnkCo
	QZQEP8auu05vLardW1nycylh38M17/Zhj7eOxnEK9UZiPDv2lvfIqaJ3kAdgG0FPy1v7KUBxNdiYm
	xvVEZC6Q==;
Received: from localhost ([::1]:47922 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iQGuP-0043MM-47; Thu, 31 Oct 2019 20:19:05 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:33276) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iQGuK-0043MF-GI
 for samba-technical@lists.samba.org; Thu, 31 Oct 2019 20:19:02 +0000
Received: by mail-io1-xd2c.google.com with SMTP id n17so8289419ioa.0
 for <samba-technical@lists.samba.org>; Thu, 31 Oct 2019 13:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Th2+CibBWexidRT75tQ34FfITBJLmrgNSofa0TQFmhA=;
 b=UzDLfZwp2JuQOZd6UPghG8YH+SboYgriitIjDfg3sgmDZAunGEw4wkELmKE+7n46ux
 Qw+ldj3ULIj2mmfab1Lvy+/Zqm5tkwCH3NPvpBcUYogWDn/l7jIXQ4dfwoXnPWu/n3zt
 1ij6qN/8ObPlOCp+Ijxmz3nMuRNmGyR7LcaAz7kQiAstGiIKUQClvrSHdSS5OSf1L/fi
 OYnvKLUOqS1CTF9KZGj5fLlGSuCa4M20WtuhgHHjv+5o7t8z6531PHtsQSBa4v4L8F31
 M787q3lNq4cQeNKchg+qkYZWeQ2muWCd0xQ0Kqgt5X2K6yp8XhAe7LI5jx4MNzsJpii/
 qE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Th2+CibBWexidRT75tQ34FfITBJLmrgNSofa0TQFmhA=;
 b=pGU1Lk/L21CwQYAqZmDVLsx0bsfpj6tjczHJ8W7QXGi9NOjFFV5zbjrUB2YJRt9DAe
 YMgvCx3syuQGX6LZhqztRcMK3Nu6Mh59eMi8L3k67YXPkGv1sF538jjfWt5AH6W7nBRH
 TRo46BreR44MLEhTr09RqFbmJzvrAiIqfCUrixZ2YracYUQ1vf0HhYJKBEmEVmj4Rm8s
 XQ8Uuw9nct7C73zIF5wvKDwI6qGu8YE/iUqewa69l/SFQLV0d38sM8gi/wmUMVLT7Xb7
 OXqqHibpH5QuaahUoE17bfdah09amokz2r4aYbE12iDA9J71r/hN0BHYUZz9D21ayyv+
 6tlQ==
X-Gm-Message-State: APjAAAUcI5IplcDhobl9Hud9UWcxjgvXfxlR56z/7Ms08qMrzNszNYlT
 GJlTY19d0yuYqHEGJXdJV+5+1tHGZWhW7LcOO6UF0/ty
X-Google-Smtp-Source: APXvYqwa2qY1Dnpxv/8Zp8nM/oyPWiIHtbEoyAeYbK4oxhtEHPgEAiX1qPU1pCOoljyeQQkrVvjXeABZVfqPnjEK5xA=
X-Received: by 2002:a6b:6c14:: with SMTP id a20mr6526200ioh.5.1572553138634;
 Thu, 31 Oct 2019 13:18:58 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 31 Oct 2019 15:18:47 -0500
Message-ID: <CAH2r5muCW3ow-9UkdtBK9sxRrgK92MjVQZfe6W+DS0XKYVRF9Q@mail.gmail.com>
Subject: SMB3 Buildbot regression tests added
To: CIFS <linux-cifs@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

Added xfstests 091 and 109 to the (SMB3 Linux kernel client) Azure target bucket

-- 
Thanks,

Steve


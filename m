Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0954A3998
	for <lists+samba-technical@lfdr.de>; Sun, 30 Jan 2022 21:58:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=pErbJCZ6WAjLj9/cRKvZdCFnuMaW66cGhQZaxSq8z8g=; b=MQMFC1DqIF6jEX1ZgP241UTdZW
	8eha+BH8xjTkaOSqI+qhzqNZKTjk+k8ahviBvxb+3WU4ueIHmoHRgygZknoJVObrS8NqGkpollufn
	uyltJnpfIy6QoIlwgl9ttqhIrPP5KibbI4nFrZr30lgyvZXjG4yj5HqPfSSoOrPKtsYPHTrKEdmON
	V7tutVUin3bFX2ups5/sJgQ+MKYP1MK6F6SqOGB1+gz4H9v60lRRjpyo52wIMipe20ApvheNhAXs5
	hlNPmeJThiPCtTHIbxcq7YMH6NBpAoMUCPAkFibmhoMmJTjWKUpok7jmPMEp8CzKGNIiloXvvzZ4Z
	LjkTc4Iw==;
Received: from ip6-localhost ([::1]:38614 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nEHHR-002X7O-Jr; Sun, 30 Jan 2022 20:58:37 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:44675) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nEHHN-002X7F-0C
 for samba-technical@lists.samba.org; Sun, 30 Jan 2022 20:58:35 +0000
Received: by mail-lf1-x12d.google.com with SMTP id u14so22764828lfo.11
 for <samba-technical@lists.samba.org>; Sun, 30 Jan 2022 12:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=pErbJCZ6WAjLj9/cRKvZdCFnuMaW66cGhQZaxSq8z8g=;
 b=IXzIB9oEAc7j0fPA8LKIrgMGAOPE8efp7v1f7uANKFjMJawXjJ4OnfC8D0NMQzFqZb
 9DaVFIk7xtrD2mdGQWaQR9Yrm0hrQS3aZFhD8WkubbOjIwOzmQrMUEbgPlEOroJJnLCz
 zyrmBiCwKTVn+ZSUt/m/cMdg4LTXy16XN1UpNsF4h4IQc9wFvVMIREhs8IHWWmM04AEX
 u7Y+IuSI1ydxVnEpvICY7wLfyqVSbtOi0GN/wQr+pTO+6QgAeJBwr6kkwa7Yi+b3DiL/
 uIrb3jUaJgsLgS4peAJR45cBPmTLW1YYAigbmFhK36kTzRDnRv4I9eac36HbbsWVfGD1
 6EFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=pErbJCZ6WAjLj9/cRKvZdCFnuMaW66cGhQZaxSq8z8g=;
 b=R8gMpX5cncu/E6Yuij9rmUp30SNGkth0rgO4mT5CHWLBR2k/QZWq1N3Z8Xg1vDEZ9f
 4srooAA5Q9xy/yEmtrHYVrxXnOjDozdDeiUQvCir7MIws1su9O5ZARqV0Q5t8WilsvzC
 e3xe/5R5MmwY3D35hxmnsm3j79AgsjVsx4gDE8Efn8BJN1GZ1UMO2vbiUliDKyeF5sX8
 fZi7OvwmSCu4LAop4F6jhHRex6v0D8DivXkChVkg8WyGMs/CrINnsIPL29t9e8YLKfuw
 MFHaCFEIt4nKUoXZdtFWEA99YW+2jrfqxzGX6mcdQi67VnB4zTrIlqpw3vvT/6CR1M4L
 FB0A==
X-Gm-Message-State: AOAM532tSR/i91XdYuWw1bTWsDfEDmHkWbEt1WS+aBFl3XlkmUbTCJDR
 eQQTLouNyaIc3dKFpq3BJgNG+bdjDsb0TT5xWRGgSlHPbTU=
X-Google-Smtp-Source: ABdhPJzI14Q+ZK4gqomPNAcbQ6U8b1tZO6JhzxoS7TUr7Tcjls27osVt+Prgo8i+UHzdoo1ntNLurxQlBtB41OGykLs=
X-Received: by 2002:ac2:456c:: with SMTP id k12mr13959667lfm.234.1643576311509; 
 Sun, 30 Jan 2022 12:58:31 -0800 (PST)
MIME-Version: 1.0
Date: Sun, 30 Jan 2022 14:58:20 -0600
Message-ID: <CAH2r5mv8pEt7Msx0=2BPFciu8gPGLyMLPvOAzyiKg7=W=6ehOw@mail.gmail.com>
Subject: additional regression tests added for cifs.ko (to the buildbot)
To: samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Added 10 additional regression tests to the buildbot (mostly to Samba
exporting over btrfs)

http://smb3-test-rhel-75.southcentralus.cloudapp.azure.com/#/builders/2/builds/876

Will also need updates to the corresponding xfstest pages on
wiki.samba.org later this week

-- 
Thanks,

Steve


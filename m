Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F413B1B8942
	for <lists+samba-technical@lfdr.de>; Sat, 25 Apr 2020 22:09:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=KB0484GNnw5E86EszPyBsFs7aFLJVQhLoFUSiXuY62c=; b=ZYegqGGwtrL/5RzlXy2B5Ln0ma
	F/G2eFqiUv2lTpqYXxeDD4ZwXyJSlbjFMbCOrk1gT0J8gQV7EMxbvHzGdH7ekfOfbpLxIORw5UR7v
	VWhrCfJzkFr9QPQCakbeuJnIT7WwEGbfdco/3awVXIfkVCXGz46iZrzClwiRCb9op7zS/46C4RUPA
	uojAN/tNoU++g51kmV5rMEXfktvB2UHKjfB+PrkL6gLOHdgozX80tW5gJF1Lwi+vPMKDlc1jGPqxr
	59JobJpqBTwIk9pAKrGRpQCBE4mjSAMC1+xnq5dEn+4FcNsKqzPre657x7R1wLbiWuQ4WqrzPvCPO
	DUKmJeNA==;
Received: from localhost ([::1]:61680 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jSR62-00229P-6M; Sat, 25 Apr 2020 20:08:18 +0000
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a]:46961) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jSR5u-00229I-6i
 for samba-technical@lists.samba.org; Sat, 25 Apr 2020 20:08:13 +0000
Received: by mail-vk1-xa2a.google.com with SMTP id q200so3712441vka.13
 for <samba-technical@lists.samba.org>; Sat, 25 Apr 2020 13:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KB0484GNnw5E86EszPyBsFs7aFLJVQhLoFUSiXuY62c=;
 b=Xo+TxG4dRmhXbmnMmSdaa81Qu+DAC5a6fBUSZnpfipu47g+C223+Hk6IWDmY6e+L67
 +JjaTv3e3N1LBfU8ICjxJ8XG2goV7GjG3tqlf45PhxKV1WoigiMXt1tMa8YWTWT15QAI
 l66Jv8cZap5/godMnPSlCNTSiaxfDU2OstKkKAFw0qvtZJ5EUxI5W5IrKM9rh3miP+VO
 l+KvA1s+Qg4YG+odeA7nHMkxWdaHUPMtAaDGtJm1p+SKtymCm5xrA4+E3wQpvgxeefuJ
 R2O6/bVXL/wlhJpLQXiMlWxr7HGvRbfKZhdrVHAKmpXdYPl2LU6cyOTuTJ6tvx4G1XSL
 WR/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KB0484GNnw5E86EszPyBsFs7aFLJVQhLoFUSiXuY62c=;
 b=k8tdCVMONBIql6u/Pow1pyP5Zuys+kWBq2hX8tWGsCjADnySGkiQdRz4Ry7ae7sSOI
 PC/T2zSxbRTNjIQfsy+Yf9ZYrS3Tx3Q6MoxvoE04lKllt46rnDNxkoAIzXFbWwWYag5V
 V8EGltVNjnoIUvG+VOqAw/OWQZM2NnnrJQPpLfwPwU49KGprzOY+qV50NvWyXk7VC/oJ
 afdLkTEsNdHQ6YwZJPqQhCdVpl58Rq8RrqShA0rkqeVnxk/SYEs0en+D90RhWXS7O96Z
 3Gn+f0SG2drSMzaUZgj/WqZpr1HKCQ/T6jnPeGdR4PWeoTo+9YuGgua6onmwHkmMlOz2
 wQrQ==
X-Gm-Message-State: AGi0Puaw5weoyBq9RaczYcPvUrg6c6Oa/jVarFwrV3MH38kF9HEUy/Kd
 30wxdtBWUIdhKo2YEihDUZIcB6Qg7Xshbo/jrXM=
X-Google-Smtp-Source: APiQypKOkvwetvKPFfRlduq4EK2SPIAkWUXswHMrJuvF1vY6Z6YamD4VHaXxaffu/Ma8UDErVleQILYHrsovTcWHcd4=
X-Received: by 2002:a1f:1ed1:: with SMTP id e200mr10389353vke.96.1587845286088; 
 Sat, 25 Apr 2020 13:08:06 -0700 (PDT)
MIME-Version: 1.0
References: <af287cc4-1b97-da90-11de-60755a77fb14.ref@yahoo.co.uk>
 <af287cc4-1b97-da90-11de-60755a77fb14@yahoo.co.uk>
 <b88fbfaa-969b-8825-568c-741187b8d014@yahoo.co.uk>
In-Reply-To: <b88fbfaa-969b-8825-568c-741187b8d014@yahoo.co.uk>
Date: Sat, 25 Apr 2020 16:07:55 -0400
Message-ID: <CAOCN9rxchQPzyVTKpbwuK1h05pD5wWTyRRXEvPMD63hJ5j0ViA@mail.gmail.com>
Subject: Re: build - ldb depends on missing system library/libraries
To: lejeczek <peljasz@yahoo.co.uk>
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
From: Nico Kadel-Garcia via samba-technical <samba-technical@lists.samba.org>
Reply-To: Nico Kadel-Garcia <nkadel@gmail.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Boys, building from source on CentOS 7 or CentOS 8 gts into build
dependencies pretty fast. They are listed in order in:

https://github.com/nkadel/samba4repo/blob/master/Makefile

Unless you're prepared to pretty seriously trash your working system,
I don't recommend building and installing those system libraries for
libtalloc, libldb, etc. one at a time. Using mock to build them as
clean RPMs  my development *friend*, and lets me install them and play
with them inside the chroot cage of "mock" without risking my
development system itself.

In particular, you need to use Python 3 these days, and activating
that for default compilation can be a bit confusing. Review the .spec
files I've been backporting for CentOS use from Fedora.


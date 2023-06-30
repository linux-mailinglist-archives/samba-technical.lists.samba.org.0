Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 41ADC744503
	for <lists+samba-technical@lfdr.de>; Sat,  1 Jul 2023 01:08:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=rvpcxGVihd5jPPC5zc6dT2pgvRv9LNpUQs78toMlD8M=; b=aCtip+attzVzo41k0sgN6yPSjR
	f34ezUQKKstOWtC3QFO+3o7Z0LKoULchza03zNwsRU3hdLSi6QJtxAGXcIkIp3Ij8TOR4ZkUCkfyD
	NZkgCRqS9yER/YZTgGzGeOgilWipU4u5yUbn1zkvNelOjColYajKq29PBk3E8iTEejRMdHW4XOZuE
	2oZ4cIGbzedhubcRx82CcS3D+Ymnk7MN8iqokNY2vdJV4j9uS93Nag9b8SBmDntVd0zTkhIOcKA8I
	OHfRrgfXKUCYQdgrzMWLxUZheyEshk6RwZplb7+JRCamc1neMsxLjIAowt2cvEYUVtdY4fgxV+SXT
	r9NZWbWw==;
Received: from ip6-localhost ([::1]:21360 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qFNDH-005Qki-58; Fri, 30 Jun 2023 23:07:39 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:51516) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qFNDA-005QkZ-PY
 for samba-technical@lists.samba.org; Fri, 30 Jun 2023 23:07:36 +0000
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3a04cb10465so1694932b6e.3
 for <samba-technical@lists.samba.org>; Fri, 30 Jun 2023 16:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688166449; x=1690758449;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=rvpcxGVihd5jPPC5zc6dT2pgvRv9LNpUQs78toMlD8M=;
 b=SJdeGDAKQege68cahvtoudm+A9P1GNUv0yI1lKOdqzwIAam3V6iYbM8sWhasdj4RWv
 W8J61Q7xRazjwH9LOWtDht1XoaelWmJJgTP11sizl04ZFZqUZXHKmUgGZOGI4fI3VcZo
 fcCFad3AoS1eY1iZtZhquoMBsiSu9wNznUZ23oEXN6wGWc5PUpTUg9BzAuNaA4hJ/nlg
 tSQwhr2oPvWftr64a6W5+qVNGFZrIQFDBUysQxTCRjRkn6Vu4ZNeXRrHT46rRl9nLUP5
 xZ49WrDN1h3SULFod4kRBHwWNM3qif3D40wjeAwCTJ1hp93ye9ClYDGXoblI8EE7J8dW
 lkbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688166449; x=1690758449;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rvpcxGVihd5jPPC5zc6dT2pgvRv9LNpUQs78toMlD8M=;
 b=Jt5oJTQKlYwgh4u2wgoq57QFMr9B6BG1L5elEseHx9AztjzMR0PDXMBABdCkg1oK5l
 +qt4shC1pL02MTPeLbSIiMjBUywX/7et/jdpbMKOKWypzjCGWd5Wp+JkeHe4oX7jC1mU
 Mn37G0+a0tUYK47c9jcRIIeUpJDx5+Z/plCn1S4nhQ9HIixrlv3UHZVd7fHvr4xAbdxO
 0KpU74oqN6Xx09ssVHHM/DOARpLHVgjVWFQtZkOBxOMEzHQ5dCnVnwg2dK3DXCNd7g13
 j0IYZkMpZ+kVW5oIF8445mxM/N/EmwwW2wkyLfx5ecQI69jq7cYKjia2iVbbvrceL5le
 TH/A==
X-Gm-Message-State: AC+VfDzervkUC+9H4V6hUPqwzN65EIMMIwhoyHh/yt03dgLYFFLkRCco
 afH+mxumv7j89VJJ83b+2dGCl2CYMXLmCu6Iw35T7p9C
X-Google-Smtp-Source: ACHHUZ6v8RNH/p5HxfXDUMvvS3ddGTmgWEwDT/65IFX2D6SgQ7Fd+K383fBHn+lNRvNeuzsJsq22iC9YIyZwGAhH+4k=
X-Received: by 2002:a05:6808:2891:b0:3a1:f1b7:75b0 with SMTP id
 eu17-20020a056808289100b003a1f1b775b0mr3892433oib.19.1688166448729; Fri, 30
 Jun 2023 16:07:28 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 30 Jun 2023 19:07:17 -0400
Message-ID: <CAOCN9rxPnS5amB1koGkvWouDzG=TYOXAZ6n6R6h0_Xyqup8GmA@mail.gmail.com>
Subject: Just got asked about running two distinct domains on one Samba domain
 controller
To: samba-technical <samba-technical@lists.samba.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I was just asked if Samba can support two or more domains on one Samba
server. It seemed a very strange idea, in these days of docker based
Samba servers and virtual hosts, since I'd expect each server to run
on a distinct IP address unless you're willing to manipulate your
local firewalls connecting alternative IP addresses to different
ports, and other such nuisances.

Is anyone out there actually running multiple distinct domains on the
same Samba server?  Or are they generally using distinct VMs or docker
containers if they don't have enough servers for their needs? I found
a few notes from a decade ago,

Nico Kadel-Garcia


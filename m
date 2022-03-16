Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCB44DB81B
	for <lists+samba-technical@lfdr.de>; Wed, 16 Mar 2022 19:47:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=Bn/6yZjML7A+r98PpR9uDas1nmqhGJeRo4zM8nuKh0s=; b=5O4ohpNUrLSMxvk/4ujTYXVAbx
	cILZ/uTvoplBiQRr4ZGbe07DUsj9glP9m956uve/uNLsT5xT4ZOHd4Qh5N6DGY/jvsLpioKyQIgek
	O/pAUmu0QyLa6uemS7QMhkA4/e+J/Z+Gd9WhR3OKzOT6POka9FmyClXjz2cpqsJPIBw6AKQvIcGwd
	iZxlVG2BZppImoqzrWTcdOKfamRYuxPzXbburwUoJ8mRB8bmSbNf0gmPVDSBWXPLoLFwH7uXDDqyR
	GelAjv7qZ7W4IdzpdAsL339HoSXp9lh8X4mdezAi/K88WklGPqk3CmsBWIcGtCouJIpU46H0R3XFz
	Pf1lTGkQ==;
Received: from ip6-localhost ([::1]:59108 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nUYev-0033KI-DX; Wed, 16 Mar 2022 18:46:09 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:59080) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nUYen-0033K9-CK
 for samba-technical@lists.samba.org; Wed, 16 Mar 2022 18:46:06 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3632A3F1E5
 for <samba-technical@lists.samba.org>; Wed, 16 Mar 2022 18:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647455240;
 bh=Bn/6yZjML7A+r98PpR9uDas1nmqhGJeRo4zM8nuKh0s=;
 h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type;
 b=oGmk1oqljGWYBD54HeP6YrHxf6qOut7eijKQgVnzoYVXBBklkgpxp4GaqxUH+ndcq
 8eAdR0ShOMJm582P6kHembPZLPQh0HeQ79wGcllPAL1gZ1vxQGN8OKpWif+abFWz84
 xpFmEZnEzFZlLzqALIc0OqaVh5yUZNKeAa5wF36IglCW+sUQZz6xdu2OROg6AAy4/8
 ni/0TPLtlm/s7aD9yMiyzOwGTrhezhwgLNoIiLuxL22YLCIrqh1KGPkKqcjzqj1VN3
 +OrCNFlsH7+7HMYkc7TgD3KqMLUeKr+Po7WvViCwO5sRsbF4xsr5ExcwRZjz2gsKEe
 g8D59J4IWJV7Q==
Received: by mail-ed1-f69.google.com with SMTP id
 s7-20020a508dc7000000b0040f29ccd65aso1807207edh.1
 for <samba-technical@lists.samba.org>; Wed, 16 Mar 2022 11:27:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Bn/6yZjML7A+r98PpR9uDas1nmqhGJeRo4zM8nuKh0s=;
 b=TYKFavQcPRk6A5m/SHhW8wWzNf1STVYKQ2gNbpBDNgLdMdb01r09UihW4g9nvaMKD2
 SLR6wVgYlDvzwx/9dbbJXgLs1h0zcmttuBwTsHPQqcBu2ETcgqmxpRES3TnC/vPPy6Ey
 gy6LcOOfj6/c42qfosCgBrjJdG1d4wlozBJCWyqDaQgxOS7qDNhZ5X9xOconnJJfTWIv
 NMw3RiBVog+v/PC2reJixYeJPiePyjUCvsB9mievrmUI0BKCVpA69DJQZwex7SeEO66i
 pCTCU/hmuDVKgGlCMTdD77l/XAmTP397rAoEdBXmCbAtA4pctMOHVvCOvPz3tLhmIUTQ
 y/ZQ==
X-Gm-Message-State: AOAM5327GIl2QNTvFOmEll/A3PSzGsLreuQ/vVQZGGrUCh8mBNhBJBHI
 Clau5afQgMzy7YbaKko6yWu8VbcWTCxHV4TvF6Rkk3+c42qX0VIcYWsbalUeVtL0nNRvuPSDQvt
 2qby5T4ISUxazV3OHSWbNBYLEywHnGvpdv7Vy7PufaZk7l4PIJO9LeF/Qqg9hOQ==
X-Received: by 2002:a17:907:6e2a:b0:6db:c440:532b with SMTP id
 sd42-20020a1709076e2a00b006dbc440532bmr1068801ejc.95.1647455239844; 
 Wed, 16 Mar 2022 11:27:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzD9oyB1vDG//ZJQXIcMdYrITpakyAYTJPRrrmkUaEtHWN7Mqd6IOZfuUik38O2SNsTLOyEt/M/pzb9zZP0uvI=
X-Received: by 2002:a17:907:6e2a:b0:6db:c440:532b with SMTP id
 sd42-20020a1709076e2a00b006dbc440532bmr1068784ejc.95.1647455239578; Wed, 16
 Mar 2022 11:27:19 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 16 Mar 2022 15:27:08 -0300
Message-ID: <CANYNYEHpqsDONcd24SX3GxdRSX6FPR0BH7Ar9mizqke4Rk2T0Q@mail.gmail.com>
Subject: ctdb nfs rquotad: inconsistency between startup and checks
To: samba-technical@lists.samba.org
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
From: Andreas Hasenack via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Hasenack <andreas@canonical.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

in ctdb/config/nfs-linux-kernel-callout, nfs_rquotad_service contains
the name of the service that starts/stops the rpc.rquotad daemon.

If that name is defined, basic_start() and basic_stop() will,
respectively, use the service command to start/stop it. For example,
basic_start():
basic_start ()
{
    case "$1" in
    nfs)
...
        if [ -n "$nfs_rquotad_service" ] ; then
            service "$nfs_rquotad_service" start
        fi


So if you don't define nfs_rquotad_service, it won't be started.

The nfs event script, however, behaves differently, as there is a
specific check for rpc.rquotad in
ctdb/config/nfs-checks.d/50.rquotad.check. Due to that check, if
rpc.rquotad isn't running, it will be started, either via service
$nfs_rquotad_service start, or a manual direct invocation of the
binary.

In other words, there doesn't seem to be a way to not have rpc.rquotad
running. Either the callout will start it, or the event script via the
check. And if you don't have it installed, they will fail. Is this
desired?

I'm having a problem in a scenario where the server only exports (via
nfs) gluster mount points, for which, as far as I know, rpc.rquotad is
useless, and I would prefer to not run it.


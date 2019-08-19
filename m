Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBB091F6C
	for <lists+samba-technical@lfdr.de>; Mon, 19 Aug 2019 10:56:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=rppplmfoNOUXW8rpvMPVIJUJMeLxD4gBGL+UfrMD8Vg=; b=x0sE3oODqA/HjTCpz20iqopJYT
	eP9Ezpwr0/oAKe0qUBnxAN44248//pT3KKax8mvLIEQlJ2JsxMGSxc7xefvFUoMQnl3KwPyTI8dcQ
	OIRVgdGA3nHLxMEsWsFDiZRoUi96I7eXhlaKlyKCFqbfUyUrJ0dFngzjhc2fIMZrTAtA+g+iSZgZM
	PZxOWfy6LkwkmQdY30m61V31MtOP+RkWHRZt19N0fozNJYb9TyqxdnYRbX/zaz4gXyErG1CyOC2oy
	7XgzKZ5FhieyRPgzFa6Xs/P7oeRzl3y7t4/iicy2jdEOVAgQ4W8cCBp+j/rsXbIro/68YJxN9Pifu
	18PbfFjw==;
Received: from localhost ([::1]:59252 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hzdSK-006xWX-VI; Mon, 19 Aug 2019 08:56:01 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:42935) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hzdSF-006xWQ-NU
 for samba-technical@lists.samba.org; Mon, 19 Aug 2019 08:55:58 +0000
Received: by mail-lf1-x12f.google.com with SMTP id s19so815355lfb.9
 for <samba-technical@lists.samba.org>; Mon, 19 Aug 2019 01:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=X7qsp3AH5qCJZXo5P+Vu1BsbrahXvZP45K576f6kpa0=;
 b=qMfN65eBh8SHLgZqgctRjvl5/xvT38b6qw/bUjP1rDVM56Xoj8S1cdVkJ+fd8wuESs
 IZCvSRzlkXq3Clgi++KUtzqFr9NtZUhTWQSNWPS5OjPzyANj6soEj2YYDkmPVuxJSq1W
 AgJiVMY450tw0jEVaKEHlisZOB2RJ/SJqsMjibs0zaiZO3GVSEv6FOpjgY0SKnBfO2em
 Owoov/O2Z9aBqb707i0uNXrKrbQXko8wTbD68nPSldgvCeBRxPK1xOrAdeY3FmLT2irz
 NiwJtc8DEl9wx+jMcjLiKv/x7o5Wr3WievSAZXT1s3iY/vYkrzk+zH75wHFwDRc5Fawh
 /24Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=X7qsp3AH5qCJZXo5P+Vu1BsbrahXvZP45K576f6kpa0=;
 b=LxHIk1Hs88Yfvopk8r713wmYo6S0y6+Vn/gbF62j1E3deqc8qzZxJ9FEMg/AShsi34
 EWc9G8Br56LcM1iYFrAePMWPGft//xaU4msMK9YZf4uLZERjDiJ+pxyhXA9PpORV/eqr
 8fNc4I1EAwcJv2bgU8lOHnrc7qIh5OUVa2j9ikOqPx7ffOaVQEs+nNfGwwSNwElfrWEn
 87SN8g+mq1hO3ib+KOGvFuDJ8QqpInXrgbjAizC+blHqfNQjNxEEZ1WyPbMW3NlG3Nr/
 CPYYjjZr2VyvDMaORoYUpcUG6xarHevRVgT/9hvzo/ptP9CBo9qUV2b77OxMkJLHvtr9
 kVdg==
X-Gm-Message-State: APjAAAXphtid+WNmGouETcTdUYSj9qm5Y0fcMobzHpSe7OdiVU8CX/cp
 hijgh5Jl7Lel/5Rb5KOEX9lcB2/xyBMydxPfjI3Hiw==
X-Google-Smtp-Source: APXvYqx4WkIGePazW9Y1R5IE5WpGpym6mtyR9b6d/xHrvPLTv61Sgo/d03oBNQ1Bl+5ec0vTd47gzKV4JSAeip7mMuU=
X-Received: by 2002:ac2:59dd:: with SMTP id x29mr11504363lfn.140.1566204954338; 
 Mon, 19 Aug 2019 01:55:54 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 19 Aug 2019 09:55:43 +0100
Message-ID: <CAELK94cw3iyKDHxsk301XL3+z=NhadPu35Yb9wdww4e6eetuPw@mail.gmail.com>
Subject: GSOC 2019: Improve smbcmp - week 10
To: P Mairo via samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: P Mairo via samba-technical <samba-technical@lists.samba.org>
Reply-To: P Mairo <akoudanilo@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello, for this week I did a little GUI for smbcmp, my mentor Aur=C3=A9lien
ported it to windows ( http://zbeul.ist/gsoc/smbcmp-release.zip)
the program is usable with the default diff engine (difflib) while the
second one (pdml-based) is not very readable, for this last week, I intend
to change the widget I use for the diffs view before writing tests,
documentation and submitting my work.

--=20
https://github.com/aaptel/smbcmp <https://github.com/RMPR>

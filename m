Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B8019E609
	for <lists+samba-technical@lfdr.de>; Sat,  4 Apr 2020 17:13:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=cBIaFBiVnvBFOGSgAFwzJ5KjiTyvqM5neCtriEqKz+s=; b=x/PlAygm6IfOirwhNJ5az2a5JK
	GQKfs5XyI5f3AV/e4cfk6WLHEuakJpX96U7N0c4Jc5M6VEbFzen0IZ0rrr3berdX+u4XxsrF36lOI
	edbHNxZOPRTEgaUXIbz1nQKL3PLD1/MmUlUhhmXPgC/5tZgVS/+BY9uKjIjyE7e8s5hvafvF0y6JL
	kBpa8jjykNka+SX//r2KTsHZBxcHniL5Q7gBlDIjnUBtVNlTL8MI+3zg1R6suO2TEYvrYoSFq8d1Q
	ymxYdIGq9PM4JFMOuyW8v+Iw3rSpPqf2n+3UOzqCJZzykmi6XeMrSdEOP2iKyBdyfJ4JyIx1kjrtz
	PI4qUshQ==;
Received: from localhost ([::1]:39542 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jKkTg-003JWf-G9; Sat, 04 Apr 2020 15:12:56 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:38226) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jKkTb-003JWY-2C
 for samba-technical@lists.samba.org; Sat, 04 Apr 2020 15:12:53 +0000
Received: by mail-lj1-x232.google.com with SMTP id v16so10033282ljg.5
 for <samba-technical@lists.samba.org>; Sat, 04 Apr 2020 08:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=cBIaFBiVnvBFOGSgAFwzJ5KjiTyvqM5neCtriEqKz+s=;
 b=KHszeCjTx+I/oIXUxmAnPhvZu4U+2Kvb5fzisv53cbXh3zojOsdm6MFPqxwtSksrPq
 DiEi/PmwOKpu/L5SSPp4XF36WkilNcqldXtQtj36XoxUQGaH49625SQOVAMx6ZfffFz8
 OXgIfjb+PXkstkBFzN4tChokHm47LAcwbX+0un1J2cscXPze+Gs8NqamgoWi4bNUFJQh
 leNkUhKQiVRETPfJqEcuws//KB8Bkg4nTGW+w5xG+C9QId1FWVOiqOPdauWDREq6Fba1
 upzNvFX+noPaj9Eurj/V/Sl/HVUv+6Grzup+gR6iZFlnypRUuhlcWnj9MkCevPSJyNhI
 Aj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=cBIaFBiVnvBFOGSgAFwzJ5KjiTyvqM5neCtriEqKz+s=;
 b=mlmjugOVE3A+4evQ7pvuZWgDp6Ki9/J4lU3KDSAXwdKU9tv+NRt0L3ScmDRFqNPZyq
 1CYRAEoQQ8LlC/yR1kCrnMZyqvXdLW4AI0KPoDSgMVdyjyPz0pRolqTY4piaA9aZ2OKH
 XbUd+6kGEo7pm8DgjBXsZBv+7wjNoyKLEuMo22KAzTofl32LRU16oN2yRV8t+C7YKeKB
 Gk2pZQCdBP/nqR2U00BatIREZdARpAJY1K3B7TWn8bC7++ytURUPK1oPI++LC2ykeA2z
 X41rffjPDuBPbn3mpcKql8KP1tQARelNQ3SwAnQPeUsFwlJIbASWzfG8DIjZ9otoMzU0
 tkrg==
X-Gm-Message-State: AGi0PuZTSe7ZaVRVdQH7VT8QF5dx2xOrbOWS4pT63Sjpnzi8sMGACh6X
 OTD6ljeKxMNtdpNFh31DHvU5PVWngbKwsQKnPCMhYlXC
X-Google-Smtp-Source: APiQypLd6wcHzEm9ZzkPWw5wPxohuaGYwN4c89ij/JfbkIwXr9fpY+xwPj92vnEJxJSS69wpErP+DTrSFhFpKRKC8Ek=
X-Received: by 2002:a2e:9b41:: with SMTP id o1mr7692493ljj.145.1586013168979; 
 Sat, 04 Apr 2020 08:12:48 -0700 (PDT)
MIME-Version: 1.0
Date: Sat, 4 Apr 2020 17:12:38 +0200
Message-ID: <CAC-fF8Ry1imc+yxKpwi4qpZsjbzLejeRX5UB-LAvGM3=yM0A5g@mail.gmail.com>
Subject: gitlab: mit-kdc on fedora 32 with krb5 v1.18
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andreas Schneider <asn@samba.org>, Alexander Bokovoy <ab@samba.org>
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Andreas, all

Any idea how to make the mit-kdc build run on fedora 32 with krb5
v1.18 in gitlab? It looks like it currently isn't.

https://gitlab.com/samba-team/devel/samba/-/commits/iboukris-test

Thanks!


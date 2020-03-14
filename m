Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFEA185439
	for <lists+samba-technical@lfdr.de>; Sat, 14 Mar 2020 04:17:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=H4rF1tzSX3gyv0BFtgf3Sq+ZNAGWrlxouIk72Ow0J1Y=; b=CTF47wZ/XAX4Gusqt4tDnF7DzA
	/25Xb4ttWEwujvYzafEHs/RkMLvw1X6mcGF3D02giV4wcf2RNjan0lkbHsxwyywg6NcLkhCTYw1fN
	/tUyYhujZoV1afEzmKxSH8W6E2hh0mAhbUpiP3es71XsXSxlE7qaXUQMhPoPJyGQ+jQfCdjQrQmaS
	m4pm37VPsry/YgRKW5eYTYoTDU2pVZthIuwqdvnhODfgAqqfJK1Bvtm12fsO/Z7DMl6Fbw+a+aTn8
	mVUl2H4bAE+4jR0BKWrNR28GaGEkc4ROOvoFDIZoLhEepPcdLmN9X+paiuI1JD6RtZpylhOOK0UD/
	ynJBH7YA==;
Received: from ip6-localhost ([::1]:34034 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jCxHS-00G2Sx-H3; Sat, 14 Mar 2020 03:16:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59026) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jCxHN-00G2Sq-Pr
 for samba-technical@lists.samba.org; Sat, 14 Mar 2020 03:16:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=H4rF1tzSX3gyv0BFtgf3Sq+ZNAGWrlxouIk72Ow0J1Y=; b=UK/jJZbNHEx+mIPn5H2HDxMdvi
 m79Bi5Pdqqn447QZfTJ8aIcbX2C87FC4dx2fwtajH6T1A8sYZPmpNLUvsKxyRgEOnxq06K4IbQFG1
 aemGeviGF1CGsT/HbMUXR2F6B1KzBcLd9cFVZpWgOiB5uCV13D4OaU7HCbQ/JZHShsNh1i2G5i6Hr
 xVJis1qKjBkKwYlJqNmiqmy00UkZJAMi9Vxt6uYCEEdaorp6vGcQB+9IIiT1BrJappkMq0Qf17Nov
 Ll+a3E82joVrs5JmvH/MMD0k//4/JJZ/rdb7TPv/uauFq2prRePtAB2PUy8RdRouy43Trf+dgJZlx
 P765mfqVyxTwm54ck+5L7EmqRTOYcXsYIEDOEKC54SY0ujIOGQSpoGHo1HDaD78i39qTXrULbYwEV
 1xhNhnqYB2V0k0k1PrCoMHqvUhohPdk4ZC+rjOYqymcCCAJ7fK6ofJBcoTIejcD3KaSZUV/4h6WKQ
 SNrMtEMyJf62kWHOnXeovlFD;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jCxHL-000530-1G; Sat, 14 Mar 2020 03:15:59 +0000
Date: Fri, 13 Mar 2020 20:15:55 -0700
To: metze@samba.org
Subject: Fighting waf for C preprocessor output.
Message-ID: <20200314031555.GA16932@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Does anyone know how to make waf generate
the actual gcc command line it uses to
compile .c -> .o ?

Doing:

PYTHONHASHSEED=1 WAF_MAKE=1  ./buildtools/bin/waf -v build

causes it to dump out a python array, bracketed
by [] characters, but I was hoping not to have
to fight it any more :-).

Jeremy.


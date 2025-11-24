Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4681BC8274D
	for <lists+samba-technical@lfdr.de>; Mon, 24 Nov 2025 21:56:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=DzDaUiVAAH5BpoPNE9sTsPVTxgdbZhqrjVpE7NI2Pw4=; b=S2KX6Kh8hNfPs+Sr/yXVqM7MaY
	iNkCPCD1jJbeFdANLTjNj32CU9nMblXhJNCbV20jYP4zpmeKy063QuvTIjkaITfokvqxXCVDXuplS
	supIL+HiWRl26huSOtpfG/PWmRkzUZgNQu5+QZgp5FwLw0ES8TUC0FIzuaVfZWl0rw6uV3q931fIB
	xAGHVTulazmKBv4mBoChYClSGvCy+qR4uAXQwGfLWKXwK62215jf7sBqWpzAP7fjmByRExOgUT+um
	Txp1eazmUsPrJ5Vf/zVKk2LfVQ05B5D3d+KMV0boWp5bA2FpdifFpP8g0pfH8PChzZ/S7Co/M0cGD
	lA6NPk+w==;
Received: from ip6-localhost ([::1]:32118 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNdc2-00D2Ch-6C; Mon, 24 Nov 2025 20:56:42 +0000
Received: from mx1.manguebit.org ([143.255.12.172]:58462) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNdbw-00D2Ca-90
 for samba-technical@lists.samba.org; Mon, 24 Nov 2025 20:56:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=manguebit.org; s=dkim; h=Content-Type:MIME-Version:Date:References:
 In-Reply-To:Subject:Cc:To:From:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=DzDaUiVAAH5BpoPNE9sTsPVTxgdbZhqrjVpE7NI2Pw4=; b=zRf00BbS0KJnh0SpRYhNJ3LLrV
 l3CoUu9jGvxNl5bUm5skRBhks/F1W4eEv4MYK7A+uFMGk0JIxUeQ7nV4HKij/naL2jXHfqhoUTn1l
 /1sJ98tCNPStU/GmiRhfh2+iQXPxL+pRMDdp0BCi9hmmq+aU+sxkk/u0FIcRB2qvAHc8mSyzddqCu
 ah61Wn5HPwn+8oRf3nYOkUApIA4vCMJuqxSD2raNgex7ee10uSPvmnR6uUHyo4C9fErXJGrtfY2nf
 o33BdbkuzbzqoBX4uJStaUaulJl9NBE6PBAitdpNcp2v0FgELI5xQ2J8I9XikVTfJ0IhNip5a1Jty
 Cn+Fvz6g==;
Received: from pc by mx1.manguebit.org with local (Exim 4.98.2)
 id 1vNdbm-00000000R50-06ZM; Mon, 24 Nov 2025 17:56:27 -0300
Message-ID: <a5d65f2d2e7cb45bd47317b726f86568@manguebit.org>
To: Stefan Metzmacher <metze@samba.org>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org
Subject: Re: [PATCH 0/4] smb: smbdirect/client/server: relax
 WARN_ON_ONCE(SMBDIRECT_SOCKET_*) checks
In-Reply-To: <cover.1764016346.git.metze@samba.org>
References: <cover.1764016346.git.metze@samba.org>
Date: Mon, 24 Nov 2025 17:56:26 -0300
MIME-Version: 1.0
Content-Type: text/plain
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
From: Paulo Alcantara via samba-technical <samba-technical@lists.samba.org>
Reply-To: Paulo Alcantara <pc@manguebit.org>
Cc: metze@samba.org, Steve French <smfrench@gmail.com>,
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Stefan Metzmacher <metze@samba.org> writes:

> The patches should relax the checks if an error happened before,
> they are intended for 6.18 final, as far as I can see the
> problem was introduced during the 6.18 cycle only.

Since we're late in the v6.18 cycle, I would suggest leave all this
churn (e.g. adding new helpers) for v6.19 and then provide a simple fix
for the problem instead.  This way it will get a higher chance to be
merged in next -rc.


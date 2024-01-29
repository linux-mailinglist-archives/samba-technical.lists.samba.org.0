Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AD0840F9E
	for <lists+samba-technical@lfdr.de>; Mon, 29 Jan 2024 18:24:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=znyJaHOuLJcNZolX8V9QoaKWToVN7LyLdeemV3KxvaA=; b=pLnwU9PZg5iU69WsKPMKeb7Z+g
	9rrv6y9g6n6C6UvRnvkJqpWU2yvK4FeGR1axVzGmEk+yfGvu/wLfc+otabkK42Tk0YS/APDQpKIZN
	5QOKGRM9EvlQ0coUSqQdQFc4PjCMnk0lSB7fPR6vBnwUTWhY/O21ef71fdqYcdUJ9gNjwlqZdJnk/
	TdyhsF10xapVFqIMXlaLgoO5alt3wQXUQdeOiS0G9EMOaw7oIFl03CdjY45YsJWaIHEfzwcwSaRhi
	oa5JszMJpwHVWOzj8ZMMGHJn3F+ljEv9HEn/lpWwWz2Fip0OEmXt7z9OdlIwf6LdEk82Dbn7DiNcP
	F5Qgb+BQ==;
Received: from ip6-localhost ([::1]:56512 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rUVMh-004wiG-7m; Mon, 29 Jan 2024 17:24:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58772) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rUVMc-004wi4-NU; Mon, 29 Jan 2024 17:24:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=znyJaHOuLJcNZolX8V9QoaKWToVN7LyLdeemV3KxvaA=; b=PictindSoqqfdFUPYhTLlpQ0gP
 qHIGOZ/c6PSMWa3Yr12iOVfoLCiMcqDVwLXa3AW8S7l49EbDbmwjHG5dCYFUaQxjnV98IukwghYvP
 maMCJu4CwgKStiAhRBgFM9X85Df5AZ2CshVcQZX0P6uo/mbmJy42OARJWrFeT6R+jVc1ZRdz1mw9h
 YJ2KAp6+FlS7/e/qC0uWHg0BE3pzLRN1sI4YVyiq9U296nYYkb6o+Sxwa28qYKrZuiQufE8yg6gkT
 aZae3ZDHCu9C0Bnx6ZSQuwnuusKJJs7ySOcWBwrMF2x37Z8R27iRsPID6IENQ5L86C4UODsrXNOb/
 A6lXmnak4NvR4BKFdXEHeoaNP1HBuVS8kQ2M8U/Ol54zNm8YQ2Mdu2o8sWsuuPTEItbe32RrsCl9s
 BJzvGWem8lsT29vbbe7LCHkj2KKdRlloj0e4AEdltZgM2Vys8Q8Z5BlOzQab2Au5tLQfEgyznTZB8
 fn/OQ8Wf9SVjwLmaYu7psgXu;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rUVMb-00APSC-2K; Mon, 29 Jan 2024 17:24:06 +0000
Date: Mon, 29 Jan 2024 09:24:02 -0800
To: Ralph Boehme <slow@samba.org>
Subject: Re: [Samba] Invitation to SambaXP 2024: digital & free - 17th and
 18th of April
Message-ID: <ZbffMjb5aE4osjbc@jeremy-HP-Z840-Workstation>
References: <2fa86f4f-925e-47c1-9b98-5571cced984e@samba.org>
 <5d803c66-5740-4943-8985-edfb6e690f4f@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <5d803c66-5740-4943-8985-edfb6e690f4f@samba.org>
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
Cc: sambalist <samba@lists.samba.org>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Jan 29, 2024 at 04:57:27PM +0100, Ralph Boehme via samba-technical wrote:
>Hello Sambas,
>
>My apologies to Jeremy for mistakenly mentioning his former employer 
>rather than his current one, which is CIQ, the Rock Linux folks. Sorry 
>about that!

Close, but it's Rocky Linux, not Rock :-).

>Looking forward to see you all!

Me too !


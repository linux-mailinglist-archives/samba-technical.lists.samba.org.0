Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E890B34B12
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 21:44:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=PNLtEQqBP0cnGZDYQiJflHKJslCWeSmDifbRex8xsw4=; b=TpvmU+Qh8xZy4JRagxCURW58vT
	s5DKwYv01fKB4+RhhJ+uSWlC48k+UvdC49nTXcyRcBunOt/gNqbiCTJ44WOoXb/tbg4tg8oTy8q2u
	oFFI7f2Y5Cdo7BwNXwsPjaEyl4BVqvm4kr0IWglb9bo0jEUomo3JTgzbVr2aElTEBY7H9WGybxzgy
	bXPJiVGudrScpFrxKo3A7G03ZEOpdhGaIVM0rBxuBC4R4MiNkkR9BTD1BcqaVbj3QHpOILccUL1W0
	F/UIqz5VxwYuN4vyyJ7L3UPZlJOFJwPzoMrvOFf0ySgB8CXlmb+HyuxHbJPZRAoSHkm7zk04AgLXP
	PfbbPUMQ==;
Received: from ip6-localhost ([::1]:42060 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqd6h-000L7l-KT; Mon, 25 Aug 2025 19:43:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31748) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqd6c-000L7e-1J
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 19:43:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=PNLtEQqBP0cnGZDYQiJflHKJslCWeSmDifbRex8xsw4=; b=qlhzopHFYNADBLFL7MnvXfSdAB
 sWXudvakbjqn6fDEGcc3BB6XvSM3gJg1MTpDuUxPwZJg4t3AU/yDNIdyNPEMlXU+6Y8WEgF2ptu3P
 RAEI6vHYbzImFQ1wSKFJmPMpI/KbeY07chubWys6NzudmudxCg1gWkiJkrr5C+pbz5ZrNJ7JmHkqM
 FYr0RS8x+9pRnaTxZdYfY/S9pzeckyI9kXjRWMuNXTBLeqDEOaINw01yDr0v9RNacg9Mrr2Icah8r
 S4MADNU+IOVT5CRJc8w1NI8i+Dqtn/1EMRfd2Q1gjhqjkMd/j8wZ5QdH/jnfLjJiTiKax6WxvoZ8K
 nWYg2sDbdNNtb6Y1qL+Z0VLO9JH+qzOJdiEoNZ8YPjjI3gGa2z19FCIrjjqo+QW39iLbPUOB7DcML
 hX78rWTWrUC1iE76TuXGE60Y9wzjBsmuMGmH1La1cPhPFRKDmNErVrufov6dHzf7W332Sd7REBLJL
 z4hQbGorbqEqmbaFX8vS13M1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqd6b-000iqe-1D for samba-technical@lists.samba.org;
 Mon, 25 Aug 2025 19:43:49 +0000
Date: Mon, 25 Aug 2025 20:43:47 +0100
To: samba-technical@lists.samba.org
Subject: Re: Weirdness with Winbind
Message-ID: <20250825204347.6f8a44a7@devstation.samdom.example.com>
In-Reply-To: <CAPfJb3rgf0EWoK=Z6HJ1yvyCzTgJSZ0JcM6mNJULE0nBgkTGGQ@mail.gmail.com>
References: <CAPfJb3rgf0EWoK=Z6HJ1yvyCzTgJSZ0JcM6mNJULE0nBgkTGGQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: "samba@lists.samba.org" <samba@lists.samba.org>
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 25 Aug 2025 15:10:23 -0400
Chuck Payne via samba-technical <samba-technical@lists.samba.org> wrote:

> Hello,
> 
> We are currently having a strange issue with one of the Samba servers.
> 
> We compile Samba 4.18 on Red Hat Enterprise Linux 8.10. We are using
> Winbind to join this server with our domain.

Do you have a reason to compile Samba yourself ? Also 4.18 is a bit old
now. Are you aware that Tranquil IT provides up to date packages ? See
here:

https://samba.tranquil.it/doc/en/samba_config_server/redhat/server_install_samba_redhat.html

> 
> Lately, users are reporting they can't log in. If we do either command
> 
> id userid@domain
> getent passwd userid@domain
> 
> We get back user not found.
> 
> If we test to see to see if server is join, we get that join ok.
> 
> wbinfo -t
> checking the trust secret for domain domain via RPC call succeeded
> 
> The only fix seems to be to remove the server from the domain, and
> rejoin it. These is the second time in like 12 days for us to do that.
> 
> Is there something we can do? "
> 
> I can send config and logs, I just need to clean them up.

It might be an idea to post the smb.conf, that way we can see just how
you are running Samba.

Rowland




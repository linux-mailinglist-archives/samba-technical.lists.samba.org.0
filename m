Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D843D83C716
	for <lists+samba-technical@lfdr.de>; Thu, 25 Jan 2024 16:45:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=kGJWsimsXHUPb3HbyJF8WqrRz/xxrLeoy+cnB5fYQeE=; b=ooJge6+Ve51Fe66WcoGfJREhGy
	1I4VGv3DpcYwwqeaGMRdguN9tzEey6RmAFGr6j/ZD6hXJL5gXJw/MgsGEzlUogIoco5poRw1MQBER
	HKQ5CdVrtLSbCAc7HthAOigxXtD1kvLvauokRoZokE4PEef6LXELs7Me76nuvg2ahCHg+LU5D7eIg
	KVuPNrhZEo5iR473dhwoP1MEDGniUA952F8ZDhvgxkF39svukrWX5t6anaEWGCqMqt4TMQJGrJLn7
	QxZWRx4tRwPruPRhnPrF8He8KZqnUa7Zq/dxCkfQRnBMk7M2D3skCeu+nfVUQF4ticfGE2Z6qXWf3
	FuIKZiUg==;
Received: from ip6-localhost ([::1]:23446 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rT1uH-004S48-GZ; Thu, 25 Jan 2024 15:44:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29740) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rT1uA-004S3c-Ap
 for samba-technical@lists.samba.org; Thu, 25 Jan 2024 15:44:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=kGJWsimsXHUPb3HbyJF8WqrRz/xxrLeoy+cnB5fYQeE=; b=Rx1OjzoIY0Wva6nXbJJHdaZuek
 Hb+Yp0M1l34RGcQMSedjTvy8+3H9IqO6Nw65M2nzZut7zLQmZGft8TvWTRIlTbAFZvf6D1amkId2F
 4MlDXqvul8UthCMiKFs625bYDJchFG6R0tFCIBXnOBsKss+tqkftpVieE5Hd5PmE6G080X6SVI8Km
 anGWIvcOSBc0jfqMUTEk0X9kO9H4Q06GU1wCKO+y8Aa+DfoNUU5QgyvzDrejIeB1d3mffZ2RcMOLl
 B4yhk5THY7vAxYUAPt/Pd/CkAzr1O1zZ04FGTRj+r6YlPXoOlE14M5sDZmomyaA+aLcgz0X0bUmMt
 0EckqBuPGJtTdaJG5yY9JyqXgVHWPYF6yAiuOnRKlyc54BWanutKKYL9b3Y36luiw8Zf/+/ljB57N
 jZdLhfmAeaaQ0x6EUOIO+wgDQMR22x8h6f5ZfCa9weVAGPd1mfCo85EivMb8FAJk5KfFJcmTuhRa/
 AFwmENfXBGIwIiGz+XW4TbwS;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rT1u9-009kWE-2m for samba-technical@lists.samba.org;
 Thu, 25 Jan 2024 15:44:37 +0000
Date: Thu, 25 Jan 2024 15:44:36 +0000
To: samba-technical@lists.samba.org
Subject: Re: Order of getpwnam call in Get_Pwnam_internals
Message-ID: <20240125154436.04a9f5de@devstation.samdom.example.com>
In-Reply-To: <CAPSN9iQ1GJAU1oQTpK2k+z968X71NuO_932QgRPcWS55imdb7A@mail.gmail.com>
References: <CAPSN9iQ1GJAU1oQTpK2k+z968X71NuO_932QgRPcWS55imdb7A@mail.gmail.com>
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

On Thu, 25 Jan 2024 22:40:09 +0800
hhyy ww via samba-technical <samba-technical@lists.samba.org> wrote:

> Hi List,
> 
> I have a question about this commit
> https://git.samba.org/?p=samba.git;a=commitdiff;h=ea4a0d509ef70e91baedc5eebf4f4bcff10dac96
> 
> Why samba change the the order of getpwnam call from
> origin->lowercase->uppercase to lowercase->origin->uppercase?
> 
> Without this commit, what kind of problem will heppen?
> 
> HY Wu

Why are you pointing to a commit that happened over 20 years ago, the
Samba code has changed out of all recognition since then.

Rowland


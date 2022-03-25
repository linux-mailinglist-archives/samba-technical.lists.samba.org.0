Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F025D4E7AEF
	for <lists+samba-technical@lfdr.de>; Fri, 25 Mar 2022 23:10:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=MFlxQ3GJ6NTzwTGq8LDQ+iawS1XcRHaixxZgeCvG1mU=; b=uDsShzWwpMhSNHdTor24i6V0s+
	nShxAV7FOUNMa0+Ub2hNsCF13jyks0JlYUwPTqcKu+CzzwNpbtwB1HmFPMq1xahZ6UvcI5svozM80
	dGQne5A1rvZQqdzgWoieNqvZp6ZOmKo0wEp+o7bBy8SIRHYb/8ig8v2rHKfQHseoMeh7sU802/A46
	2UlJk0b78Nj4ITPQfXZh0ZuzL+DXog1BIQGJ6HPmRKtQjQf+W2vZY9zTSce5cqaVC2vKsVEIl9vCb
	X0SOeVyNYswjf9u8SGCRqkfod7hwXEB/8An1pMjKvkmuUEHdjivJRzNDoNbLOkH5sim68Ibf3Ldzy
	EojRp+/A==;
Received: from ip6-localhost ([::1]:38828 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nXs7z-005Ke6-5D; Fri, 25 Mar 2022 22:09:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37898) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nXs7u-005Kdx-5J
 for samba-technical@lists.samba.org; Fri, 25 Mar 2022 22:09:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=MFlxQ3GJ6NTzwTGq8LDQ+iawS1XcRHaixxZgeCvG1mU=; b=FztuPmrHp7SXM4nyEUiahZf+R0
 aHUOp9eDfd+4cZQsF4grqPm3UlKuM9qobSmErOUx8ljPPsnwYTEwO0CG/Lfu2qCOu7jqSQb4gL3aM
 t/aW82T22ewe7V9nP0ewkD94fiAUg4Vxt6uBygGaF3lCp8DcsOYxPNh6YkYg/fNMSILWQG1BTnBcR
 F8FxfGmOlBzi3+NkqdwLtKLO6cQNpA6p+u46rlx7N411N6/ELKCxoHkfAX7+2Atdnv3f+ltwwl2V5
 UrzP5cjRahaMTN34MzAKHSsl+cq80suumCGq4O5WfSztxkFd1eY5I37eGy6cehRkBG8qnyA1AA2aa
 dzNJxltu+UXHuduaDw3qMygTVJBAJCLuJBVhRIE2qW5ORpuoOe9foI1InD0lEV4AuBRpgSiccJzR5
 7A/WvrwRREFXj8f3yKjHS9zHujercXk4z/Hix9JJTPPc5rV/fThRlPgt6JQqry8s4xxKGiVqTR5VT
 npXKxU/nkklREjyG6Oa0GBBC;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nXs7t-003Xtj-8U
 for samba-technical@lists.samba.org; Fri, 25 Mar 2022 22:09:45 +0000
Message-ID: <f1b560f93cd46cdbabc5c485ad8dfa1ba25585b0.camel@samba.org>
Subject: Re: getpwuid(13891) failed Failed to finalize nt token
To: samba-technical <samba-technical@lists.samba.org>
Date: Fri, 25 Mar 2022 22:09:44 +0000
In-Reply-To: <HE1PR06MB314896FC47360E9341A3710CEE1A9@HE1PR06MB3148.eurprd06.prod.outlook.com>
References: <HE1PR06MB314825C38C5FED0EFE6E2B76EE189@HE1PR06MB3148.eurprd06.prod.outlook.com>
 <be695e607739913e530fb1c8a0ccc191ea8eefe0.camel@samba.org>
 <HE1PR06MB31488952C3D608E9374C7FC6EE189@HE1PR06MB3148.eurprd06.prod.outlook.com>
 <007c551a46cbad5f4e8179c156ce647891f519d5.camel@samba.org>
 <HE1PR06MB31486C485C9614D48D1B0FDFEE189@HE1PR06MB3148.eurprd06.prod.outlook.com>
 <798cdbdcc5bb1f59af4d9c7353a569dbb55036d8.camel@samba.org>
 <HE1PR06MB3148D20F5FB86CE01ED06A7BEE199@HE1PR06MB3148.eurprd06.prod.outlook.com>
 <34f8dd3498a8ca684f20291adbcfd2d7350b0283.camel@samba.org>
 <HE1PR06MB3148DC4E562D9D80E4C1C459EE199@HE1PR06MB3148.eurprd06.prod.outlook.com>
 <HE1PR06MB314896FC47360E9341A3710CEE1A9@HE1PR06MB3148.eurprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
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
Reply-To: samba-technical <samba-technical@lists.samba.org>
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2022-03-25 at 21:46 +0000, capricorn cap wrote:
> The old server doesn't have winbind in nsswitch.conf but I can see in
> samba documentation its stating to  have.
> passwd: files winbind
> group:  files winbind
> 
> My old server has
> 
> passwd: files nis
> group:  files nis
> 
> Does this make any difference?

Yes, this means that your old server wasn't using Samba for
authentication, it was using NIS (also known as yp or yellow pages)

Is there actual data on the new computer, or do you need to copy data
to it ?

Rowland




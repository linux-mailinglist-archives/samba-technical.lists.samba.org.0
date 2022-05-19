Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EC252DE5A
	for <lists+samba-technical@lfdr.de>; Thu, 19 May 2022 22:25:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=67Nhom7MzXNwKUpjYNC6c3ty6Zw9OObpt5Zh1RLMH9U=; b=cYR0HzuUuipCSq2wKQdLyV6kJk
	Ki8ys7XZ8Wc2psZL7LtukWvoTijFq+RaTPzX4CIfJYrS1hjn6RsMxg3aVz/O7qYUzHOYKDXNm2+al
	a4KTWTkAo8EPuaqBNuWFDx7ijfY52IpXJMlxtLmyfbBsZsO+8phbfNOrzt/B/WX9reuGqPuToNsUG
	xEozO5hYGtlnGC1y1zv0jVX3t7S+IAf3SR/PSmz9tIPcomNcieTFtTCFN4xA4wIRl+xtjNH461Hs5
	dqPuV8mKxgakm+Bh4L+jncxWzl9fdqK7V4CyVFOezYKsJdACnhU+dgOIjecp6SyAxwyEr1VMsTjd+
	VjyFBBdQ==;
Received: from ip6-localhost ([::1]:52494 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nrmhu-0025S2-Rv; Thu, 19 May 2022 20:25:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61688) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nrmhl-0025Rs-PI
 for samba-technical@lists.samba.org; Thu, 19 May 2022 20:25:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=67Nhom7MzXNwKUpjYNC6c3ty6Zw9OObpt5Zh1RLMH9U=; b=3H1RnjC+aDk5ahFMU0iUVdekyF
 oP0VgEOXaGWdMojsyxMRboib7hUzAozqaeNFXkdTN6rnzLfyH/uaGKzMk3DMZIeX6mjpNYFhZtQeY
 xE5ABeLF7K73JNLU/w33XfflAI4xuCRf0+qEcKZxekVQq1GQrR/9QQFw5/WlrLEsXtclt5h2cAoq3
 IgYp8RjGnTURU71v6pqMY4RWDI1w9fTbIbUO11lcYlIOxUvEoNGqXmAfihIL0QbO3kXmNoaOyBein
 ecKcd1RXJuBA1RuwPgAxbSQfVJCxetJzJaHWvGYQMYQekk6DmgB68mFsO8Ocy+bjFezZEIzbrMko9
 WsfI+zOEON9Yz/C5OMl046yzmhPyyf36cQbbWMbZ/AlpqZLoVFJXeYafqPWKFdQsJYSpfjQmUnRMF
 5ER3ofTq21ZiK683GCaAZcLE87H3H98uWPSZVARyEoGbrRA/kX09NSYL9af3RlllCZk2j0IqdHLtB
 wR9Vpi8nAnfyEHlGC3+81UYE;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nrmhk-001gpx-P4; Thu, 19 May 2022 20:25:05 +0000
Date: Thu, 19 May 2022 13:25:00 -0700
To: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: Q: RUNPATH missing in libsmbldap.so but not other
 executables/libraries?
Message-ID: <YoannKUkiUp5SfAZ@jeremy-acer>
References: <528f0ed8-cd28-0e7c-f517-4cbf96eb0844@msgid.tls.msk.ru>
 <c5500558-829f-c737-278e-45f4da2b5ab1@msgid.tls.msk.ru>
 <YoaJUS5Gn0MqIl+L@pinega.vda.li>
 <c5e2be16-bd32-a758-3293-2a1c149a1b9c@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <c5e2be16-bd32-a758-3293-2a1c149a1b9c@msgid.tls.msk.ru>
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
Cc: Alexander Bokovoy <ab@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, May 19, 2022 at 11:15:47PM +0300, Michael Tokarev via samba-technical wrote:
>
>Now I know how to deal with this. The prob with submitting is that all
>my patches goes to /dev/null, even the simplest spelling fixes. I had
>enough of that.

That's disturbing Michael and not at all the experience
we want contributors to have.

Can you please try again, submitting via our gitlab interface
and I'll personally promise to review everything you submit.

I really don't want someone who works so hard to help us
have such a hard time.

Apologies for your previous experiences,

Jeremy.


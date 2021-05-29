Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D67E394B79
	for <lists+samba-technical@lfdr.de>; Sat, 29 May 2021 11:57:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Z1HCgd/Tj+ViGfmtsdrRCpt3Eu4lo0O8TEqggzJSD0g=; b=gqPVLxz2tOfcAoZ7jozN53cfbw
	35uBReo49/SIlJyjXnCzA4a+qQUWE+AiNiJCuPJo5S2VyGNFFTIsms7e8L/xHRD9NBKg0X/q+i6IF
	TgPuSm9QYSXsNobsl+WcLRuIoV5mYB4jnc+DCTKVVCQM6f6XuHS/fJJy4wgYQzZ9F5ZOEdPswP6nN
	hZwJocN14bu94B5XrngUslCmzCqX7HNB/mNHkR831QaTMuxDLVCUHtU+p63WaKjxsXKbu5NPR7sqn
	vRlE89Xl/cqFqEaAGaRmOzBWFr2qqgHm+KYj8z/9gcES8HPd/ccnRr4gomszH34EoAn59hv4i2ceo
	/mOn+PLg==;
Received: from ip6-localhost ([::1]:64438 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lmvhV-005AiM-Ab; Sat, 29 May 2021 09:56:13 +0000
Received: from ozlabs.org ([203.11.71.1]:41661) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lmvhM-005AiC-Gx
 for samba-technical@lists.samba.org; Sat, 29 May 2021 09:56:10 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FscPg6nXkz9sVb;
 Sat, 29 May 2021 19:55:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=202004;
 t=1622282152; bh=sNP6a31nl1nQwufnZqkzipdOpYv4ZxEOJGIfnJZ4ZhQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lYLwkzdmCzDWZpsqeCC2TuaxqZUDYnNCfTWIXLtW5sGgXIvfolIW6xYfhBjGaj7r2
 cWwGB7nO5C9g7TY8vUQ3DtgFvFGUgavrLLdD2H8BxPz0Gnv35WoO7m7+1oSonPaP1D
 CgnwM2FjACuF2qAEujgKgIQsXEPXwicsiTJZFC31ot7TO+iYFvyGHPzO3jPhj09IQz
 ukLGWczccfdvvUwTRK4ixpnPQrTXXk5PajQs2UG1zWvDuMG7oII3puCHFdG1z5wPmN
 IxirxlZM7U3J1oBEuAQ4bC9CaMQg4ipR0NwR0yGAJDlaz75BsRGJlsAO8xi/yI3B3g
 H7dD6j2ND3DdQ==
Date: Sat, 29 May 2021 19:55:50 +1000
To: Andrew Walker <awalker@ixsystems.com>
Subject: Re: JSON input / output for CLI utilities
Message-ID: <20210529195550.3dc109c0@martins.ozlabs.org>
In-Reply-To: <CAB5c7xqUC9mZ8-VFDmM44b=EL49yBiWkMikf8BWgU0FjC+25MA@mail.gmail.com>
References: <CAB5c7xqUC9mZ8-VFDmM44b=EL49yBiWkMikf8BWgU0FjC+25MA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Andrew,

On Thu, 27 May 2021 17:42:20 -0400, Andrew Walker via samba-technical
<samba-technical@lists.samba.org> wrote:

> I know we've added JSON output to a few of the CLI utils. Over the past
> year or so I've added this to various utils in FreeNAS (using libjansson).
> Is there an overall strategy for this? I'd be happy to upstream what I have.

Sounds good!

> Also is there an effort to add support for JSON input to them?

Your effort appears to be it!  Thanks for that!  :-)

One wishlist item to think about... and my example is for CTDB...  :-)

If adding JSON output and, perhaps, input it would cool to have the
command-line tools be able to run in a mode where they stay connected
to the relevant Unix domain socket.  The most useful example would
allow "ctdb statistics" to be repeatedly run within the one session, so
a reporting tool can periodically collect the output without the need
to reconnect.

This could go hand-in-hand with addition of an interactive mode on
tools that don't have one (e.g. "ctdb").

If this is an interesting idea then I'm happy to try to work on that
with you in whatever time I have available...

peace & happiness,
martin


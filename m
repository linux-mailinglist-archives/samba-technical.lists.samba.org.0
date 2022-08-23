Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 610DD59D335
	for <lists+samba-technical@lfdr.de>; Tue, 23 Aug 2022 10:20:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=4KIFzYWxgb6n0RFyksbKMA+9gs9GiwkeIPNuACm922w=; b=mjgvKHybin/a1iDaWvqJbb52T7
	x7AJZ5YxfQ7lJAZjaAfYOxir6Mq9rYEDv13iiL9fM6ytHj1Y7FIuuPeMetkYXRZZHnoz7t8Cwb7Wk
	twNTWMGZ124lKcvwV0ViMJNhSEISscJBFwk+Me4DAlf/Lib/2ZKfMZamITikY9nFSeVG14oZU+mF0
	ag6RDtW8ZTJUWFoYIclgrUOIVVdRIx8SP+51a3WR4fJAXQ0Ww8zYcNAiuMSEWTqiBNmIuP12FpoBQ
	iEfXnhooMsSqonTEt+OJ9r+fBalZT8mySw7bKTabsIvfM+rO2BUiXAZWzEdJlZ/cD/rjWgf7j/uO2
	dAErlotw==;
Received: from ip6-localhost ([::1]:26852 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oQP94-001wCT-16; Tue, 23 Aug 2022 08:20:22 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76]:38515) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oQP8t-001wCK-Rt
 for samba-technical@lists.samba.org; Tue, 23 Aug 2022 08:20:16 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4MBhXz62PRz4xD1;
 Tue, 23 Aug 2022 18:02:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meltin.net;
 s=202004; t=1661241764;
 bh=4KIFzYWxgb6n0RFyksbKMA+9gs9GiwkeIPNuACm922w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QAd8S92RvCUx7KEmTPA/RA7svGjZazHgFtrGEMYmFKJ3YIjxfl/JTs5RDfPRc5POX
 0TRR7EfSvh86fb7QdL9WtyhdxITFmqqsOiEvLZosHwzauHDx7z2nlG43xDCPb/hKCC
 NAz+XYJdK2323IOGEadXH//K5jO9rzz6NuN33FpKeiPxHJ5k1oQ+qIIRgYrYkXfi92
 jtljk5UTTnYAjgCzBa+RD/YT0uewtQuS7zIPQK6X+LybdDD/FxzQbqxC19RkA1qsEV
 FdT4OVWz/iP5hLOofw3D+8Cq6N9r6kAnckx+rEDkKknIg2JFZgWNJ4PYC0ZWvwgo8I
 cibtp7m44rNTw==
Date: Tue, 23 Aug 2022 18:02:43 +1000
To: samba-technical@lists.samba.org
Subject: Re: Samba and ShellCheck
Message-ID: <20220823180243.565f35e2@martins.ozlabs.org>
In-Reply-To: <4766256.31r3eYUQgx@magrathea>
References: <4766256.31r3eYUQgx@magrathea>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
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
Cc: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Andreas,

On Tue, 23 Aug 2022 07:50:24 +0200, Andreas Schneider via
samba-technical <samba-technical@lists.samba.org> wrote:

> for Samba master we have ShellCheck with error level in place now. It will 
> check that our scripts are error free!

Yay!

That probably isn't true for CTDB, but we are gradually improving things.

> The next step would be to move ShellCheck to warning level and this will be 
> quite some work.

Yep!

> But first we need to discuss something.
> 
> If I run ShellCheck in warning level:
> 
> ./script/check-shell-scripts.sh $(pwd) warning
> 
> The warning I see most of the time is:
> 
> warning: In POSIX sh, 'local' is undefined. [SC3043]

This is why I never use local in /bin/sh scripts.  It has never made it
into POSIX.  I suspect the reason is that different shells implemented
different semantics.  For example:

  local foo=$(example --command)

I think local in bash eats the exit code of the subshell.  Other shells
may implement it differently.

I use an "excellent" convention for local variables in /bin/sh scripts,
specially designed to reduce readability.  ;-)  I prefix any local
variable with '_'.  However, it makes no semantic difference, it just
acts as a hint.

> Why do do we use POSIX shell (#/bin/sh) for the majority of our tests (we also 
> have scripts with #!/bin/bash)?

For portability.  I would encourage anyone writing scripts that do not
need bash features to use /bin/sh instead.

In CTDB we have switched our bash scripts (we definitely have some)
to use

  #!/usr/bin/env bash

so they have a chance of working on platforms without /bin/bash.

peace & happiness,
martin


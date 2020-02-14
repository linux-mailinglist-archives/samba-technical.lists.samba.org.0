Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9AB15D15D
	for <lists+samba-technical@lfdr.de>; Fri, 14 Feb 2020 06:10:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=BrIn2RbgGfDqR3uxP1kHlSwPEOjjMFTXpvHTQpCwsfY=; b=2mwpPqGuItpMFspVV9uWgPTS/1
	w2vbode3M7Yqu59XsaGCLR14Bo+1LCo76AQFd0Vpq4puyoSV4LQvFeLULXEUjasEzWbnfYPzFvDlv
	Qe3UEPKBmdO8QCysxIiLn/4aOiVWCX+Zj515tYglJuY4zelJI6Z3Vl5/82tPDgID9USfkqbK7mtrS
	nVQqDFyd9TIqOpXdWT994j9bqTCzCTEn1KAtBRqg5cjrffH0Anw1cBD213ZvhDnpIr3BFWlUJIrH9
	DG+x6Rvxo3mylE75Tp9+4MHYZKo7dsvPMoQdbIHGvQk2ZdwXQvSBy3zMq5TC0m1fCwENtaXW3YvmT
	pDdMZWYw==;
Received: from localhost ([::1]:46826 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j2TEi-009pRX-MX; Fri, 14 Feb 2020 05:09:56 +0000
Received: from ozlabs.org ([2401:3900:2:1::2]:44689) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j2TEc-009pRL-Vr
 for samba-technical@lists.samba.org; Fri, 14 Feb 2020 05:09:54 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48JhJ731Ykz9s29;
 Fri, 14 Feb 2020 16:09:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1581656967; bh=OYFp+u5ZQ9/tUh6jVoD3y0XJ0k9A81hsXmP2qSZ/u6o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tgsImfAl3EOCtq/yYUrhK3jEyNQtLSmraNr8pLFslAdw6aKSrm9w8ygRi0htaAfCz
 PuQtENtK4TcG537qzx8YYSNHvV4Jh3zNfh3PuUoJCcJ9oMXfDW7WHbngWTl9HszAYf
 HmXzq8bews7PW5HR9vCavFK9qJnWAFPGMsPH3h/daZ8mjDG91SRLBob6Zfrj3uZ8lW
 THyKUGxOWC4wdgoH1dW4lJcOd478+6adwnOgyUzBSkXDJB6id/OO1iDvNdoTN1L3qY
 CFkAJ6aYVeTXATpB5r6Wu51xH8WJ1jABGfshX7i+/zl4+Lmw49Ytm6NjCuRP5YD9Gu
 KVDcDs2lu0njA==
Date: Fri, 14 Feb 2020 16:09:26 +1100
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: GitLab CI back
Message-ID: <20200214160926.6a23841d@martins.ozlabs.org>
In-Reply-To: <1f5483b6c7349f261b79990f3daea501d7636ffe.camel@samba.org>
References: <1f5483b6c7349f261b79990f3daea501d7636ffe.camel@samba.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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

On Fri, 14 Feb 2020 18:01:16 +1300, Andrew Bartlett via samba-technical
<samba-technical@lists.samba.org> wrote:

> A big thank you to everyone for their patience, the GitLab CI private
> runners are back now.

> [...]

> Let me know if you have any further problems, otherwise please just
> restart the failed jobs.
> 
> Finally, I would plea that some other interested team members learn how
> all this works, so as to avoid having a single point of failure in
> myself.
> 
> Thanks!

No!  Thank you!  :-D

peace & happiness,
martin


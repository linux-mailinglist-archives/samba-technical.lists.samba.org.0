Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E15837B3A6
	for <lists+samba-technical@lfdr.de>; Tue, 30 Jul 2019 21:56:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=i8XkWFf8EC8moc2daX6KBGuhJi9a87pGy3wSTAkcMoU=; b=RamZ3WAj9A8pedN9cPW9xM5R6D
	UqG/boUstZ5qMSuMeZR+S8zUcMDPsCppfVHYps/aZ3vKvWenYcAL4Ld+C+pa82Ajk1BKtf+QMS0Pi
	wvHr9cigOTuYwr/nXvgfQJpEaJBTeMHhKfPxq4WaGqN5eGs9/mRibpQMKUfh7Eb9BeZurKRz8LciZ
	6iaEDYhSCgN9bbGjSXODdiF4wtXs3eDYsrvXxNes0+/+QwBzbiSAaiU96JbfUhPeRUAQz8cHJRW5a
	5B6rTGeQ7oGzDCBhzZgEKXXIJi96F782b0WdWPAGzknWPbe/6rsd7CbGdJmmYKWYgrNXt1hCzHXX3
	BvRFrMUg==;
Received: from localhost ([::1]:51066 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hsYDv-0015A6-7A; Tue, 30 Jul 2019 19:55:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:19416) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hsYDq-00159z-QS
 for samba-technical@lists.samba.org; Tue, 30 Jul 2019 19:55:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=i8XkWFf8EC8moc2daX6KBGuhJi9a87pGy3wSTAkcMoU=; b=k9fvw20g548KPXqpvUPbtzZlHv
 OcW7TS7onZ+n0banGssbrRCSZbcNtLM8EM8w0ekW46LXP7tCrPTNw4REKHAf3R3NmxOjlFumjuGkL
 t4MrQ0Ol28o7YLX7RTAwcP/NaCFQRxPMvOxc4KpA89qDJzggbFfoIjrNUjedwgZPGLnA=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hsYDn-0006rH-JW; Tue, 30 Jul 2019 19:55:43 +0000
Date: Tue, 30 Jul 2019 12:55:41 -0700
To: Andrew Walker <awalker@ixsystems.com>
Subject: Re: Turning off SMB1 make slashdot and theregister !
Message-ID: <20190730195541.GH128128@jra4>
References: <20190710225121.GA142072@jra4>
 <CAN05THQ65himSVSYpzypUwDeJoaV6FPAhQpV4NEeCT3fRaBxFg@mail.gmail.com>
 <dc0d693a2caf311097cf9a0ef8df3add01117ba7.camel@samba.org>
 <4efb83c3-6df7-af2c-798d-b4ec681562ab@samba.org>
 <8219d257b2fe68717939d2f41566ae669fab8466.camel@samba.org>
 <CAN05THQZVBic5xhXNVixp90UfeWz1rt=mF6F0ZXN6aHFCkZmKA@mail.gmail.com>
 <20190730163237.GC128128@jra4>
 <ad9a941e-539a-b864-542f-01a804bbc88b@sapo.pt>
 <20190730172147.GF128128@jra4>
 <CAB5c7xoe+RVeO5rQuL-To0ikpzjkb3HCkTuUiidUjWGBNc_SNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAB5c7xoe+RVeO5rQuL-To0ikpzjkb3HCkTuUiidUjWGBNc_SNg@mail.gmail.com>
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
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Jul 30, 2019 at 03:36:34PM -0400, Andrew Walker via samba-technical wrote:
> To clarify, is this something that would be done in 4.12 or farther off in
> the future (like 5.0)?

My opinion is that whenever we delete the SMB1 code we
call the next release 5.0 by definition :-).


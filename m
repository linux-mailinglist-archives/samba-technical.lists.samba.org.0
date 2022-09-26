Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4486A5EAD27
	for <lists+samba-technical@lfdr.de>; Mon, 26 Sep 2022 18:49:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=bJ6FbWnz07eRTG/U+0fkxUDkgL6mjggaJUjB/Isib/c=; b=hzcGE5NkjFa7wxxmfDGP/T7/+7
	Pl9grw8l+dhXMa1cYn2mPs2j+plYVQMv7tURRjvZgqTsRxZNt34zqCm+FXQAG0f/zlIc2o3l5OtPU
	CCejJ0K6lOLHq2x966tu6ubORK+ISOoLytDPknyMffK6Pfgih5Cj9Z73JcXqHmmdVgqZFgmOUg8X2
	/bcuytArHQmHSH5G3XranvP5Tw+1MJsyxbGV+VRAbXqNPdue3w43TRpsfpMpQ4ecvc5roXYDr7iMv
	em34zDNhsfNYFZ2BkH6waoC47xfPunZKnCxBXmWPjUXRaPw3sYdNi/6eHbX46nUKIsVlE7Sv+5fuI
	IrPQr/3Q==;
Received: from ip6-localhost ([::1]:57746 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ocrHc-004Gri-Hn; Mon, 26 Sep 2022 16:48:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44284) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ocrHX-004GrZ-O3
 for samba-technical@lists.samba.org; Mon, 26 Sep 2022 16:48:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=bJ6FbWnz07eRTG/U+0fkxUDkgL6mjggaJUjB/Isib/c=; b=dW8PubyXBhccGL7RHMJU50ADzo
 jwpPPzhRX7M/NlrBEy3cVqHPf4qodbbFIzE2eyV2w0QRuzhl9oBNVfNKdPUunSLnIVl48HBU/fQ1m
 ilFse7pqIc0s/8SjUrA0ntUDQB4rvo3tgmr1rdwiuDIY+7Ls9gzSxDYf/cRZB1V8CX0CbzJQZPFsM
 oO4iHPom9glENhtAZV6+lPc4HvADHUimbdYhzApxRRz0aUKx2qEkV+tKCwVRg8A5VbCAtLuNOBaTW
 Uuyf4vpQeqhVyOgzBjmoadWf8sa0bXD7fFaQWGfBzvwhqSspqqxULqHcwqOguaajR9PhaHG6nA78v
 sFtZiDLru6G4bgsp+AXYAopuN60SDArro6RHzJ/AFKqa0jhVAO9G4wkHngz1f3yWEqhLcKKxeOtag
 EWaehBMIK98Y1TTgRqu+1cqXQK8gIoRwx8rF0Nd+jYDu248Sg+0BAAJLYEb3FPiedZB/f5tGnIN6l
 3PSF78QUiqPULjrF/im7kIjY;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ocrHO-001zMg-D4; Mon, 26 Sep 2022 16:48:26 +0000
Date: Mon, 26 Sep 2022 09:48:22 -0700
To: "Nathaniel W. Turner" <nathanielwyliet@gmail.com>
Subject: Re: IPv6 and commit d882add695bbd5ea03961c08ac2c0380fbf2947b
Message-ID: <YzHX1mIyc2dQLdhz@jeremy-acer>
References: <YyTdlsd2ExgX8U9r@jeremy-acer> <YyToAYaXsfopiTdh@jeremy-acer>
 <CAPw4iV5LFvdoici7f5opBUA5bz86QG2cX9muzQ8GDsMU3RcW3Q@mail.gmail.com>
 <YyqQ9HtsTM2lmkQF@jeremy-acer> <Yys3/WVPd/gjBbEi@jeremy-acer>
 <CAPw4iV4AH7e4odCQ=xjzG-bAcr=5mGVPFA8qf18WBz8wun_SLQ@mail.gmail.com>
 <Yy4uev/AGxGDAJB4@jeremy-acer>
 <CAPw4iV4xM0FEvPhbY-7S-uSdF9StW1ZeSniA1qoxzdNh9MdNDA@mail.gmail.com>
 <Yy4xsp3cNIp083La@jeremy-acer>
 <CAPw4iV7imoXjC6RdUttRkr5DkXbbMwFyynomQtR3R0uJRJzqXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPw4iV7imoXjC6RdUttRkr5DkXbbMwFyynomQtR3R0uJRJzqXw@mail.gmail.com>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, Sep 24, 2022 at 10:17:07PM -0400, Nathaniel W. Turner wrote:
>   On Fri, Sep 23, 2022 at 6:22 PM Jeremy Allison <[1]jra@samba.org> wrote:
>
>     This code:
>
>              * We're only returning up to 2 addresses per
>              * DC name, so just allocate size numdcs x 2.
>              */
>
>             dclist = talloc_zero_array(mem_ctx,
>                                        struct ip_service_name,
>                                        numdcs * 2);
>             if (!dclist) {
>                     TALLOC_FREE(dcs);
>
>     needs an integer wrap tests for numdcs * 2 before
>     passing it to an allocation function. Something
>     like:
>
>             if (numdcs + numdcs < numdcs) {
>                     TALLOC_FREE(dcs);
>                     return NT_STATUS_INVALID_PARAMETER;
>             }
>
>   Oh, good point. Updated.
>   Does the overall approach seem like an OK compromise for now?
>   Changing process_dc_dns() to do parallel pings does seem like a natural
>   next step, but is also much larger in scope. I might be able to work on
>   that at some point, but my time (and risk tolerance) is pretty limited at
>   the moment.

Err. Can you resend the gitlab URLs. I forgot to save them (sorry).


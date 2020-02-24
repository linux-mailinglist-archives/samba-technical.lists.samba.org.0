Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FFD16B100
	for <lists+samba-technical@lfdr.de>; Mon, 24 Feb 2020 21:34:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=5KmY4mxGU3QA5ZE5dJRw2FyTQcNWZxC4ebUikiGyHjs=; b=X7J8HfjjjDlguNwUWxhe/+Uff4
	XeEuTwLhH/0fiY3d/oyTRMWFgkFJfvRLD7Rh1So/vRW2lzU1jc83UeY481Ge+7Bm7flN2dIrYkOAl
	f9/LKJm9RZzZt7oDlnHssf29p86A9e92DnoAqx5+uaSv1w34OAZAxKS/Mv4nfqL3YviYoHsw2OPM7
	AEUXJ4NnJYflF9rKamf6rWgmulggvN1DVT7GpoDl14bIt3lG7UqGXm6eVVbnMFJU5zCIldbWuBcEW
	e9w2fP6GJQleNbYkZwxt5KpBhxrrhhrA5pSWofdtgCen3GbSAB4xWGAmRmEHwRqmj0cjuF9mrthHo
	cvliwsOA==;
Received: from localhost ([::1]:24022 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j6KQb-00BTx2-8w; Mon, 24 Feb 2020 20:34:09 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26648) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j6KQX-00BTwv-7d
 for samba-technical@lists.samba.org; Mon, 24 Feb 2020 20:34:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=5KmY4mxGU3QA5ZE5dJRw2FyTQcNWZxC4ebUikiGyHjs=; b=M0jhEwGamjAJWMyO82mDPgswUy
 trzi6Ry2/K+v4qT0N17/s7vpiEIfMSM8ruv5MnksSpBKSB7UkZw2XBKeyIbcsKwO2oP374B2+HROk
 /72+JRpSeCW2DiRkxXMEJb5Ej0aH0X0QTitXmYHaxjgVo2vHSTL2y+pQSwq6N4cYZueazfzaD0RYo
 AQU/Aj+57YkjEB5nZbrKmTjsuCv6rVhGj1hGvGfj3dorpPLgHOrLzZrsBxl3LFghq8pKa36L/WTJo
 YcMweLozTgW9/LpQhE21w9dd/corxTXk4vUYw2uv4txLlSQxON8SzyBqA8mlcI/CrGhNKySPxe3z3
 36fuON1BaqWTW0/P1uCXuvVwgNcgtlsp0tDv3rL4iw/U+Z4qzjyX/fckL8gehB0i+NLKfKv2TqDYU
 NN3VA0z/Jawfg4/JRwGDOwE6AhnY3Ecjam8d5P1WX/rXW3C6BJWJoDEiXH0sBn24e3A7wIRJhE7A9
 xL9fMubLCasqjLqQth1DUto2;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1j6KQW-0001ii-G1; Mon, 24 Feb 2020 20:34:04 +0000
Date: Mon, 24 Feb 2020 12:34:01 -0800
To: "Arthur M. Gallagher" <art@arthurmgallagher.com>
Subject: Re: [Samba] vfs fruit disk_free fails on tmsize overflow with macOS
 Time Machine
Message-ID: <20200224203401.GB15879@jeremy-ThinkPad-X1>
References: <mailman.231.1582110513.713.samba@lists.samba.org>
 <f09b7d28-4b3d-4211-b151-bb51d783ef4d@www.fastmail.com>
 <20200224193237.GA15759@jeremy-ThinkPad-X1>
 <d3a08bb5-3f56-4c51-b50c-78b7aeacb75d@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d3a08bb5-3f56-4c51-b50c-78b7aeacb75d@www.fastmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Mon, Feb 24, 2020 at 08:11:34PM +0000, Arthur M. Gallagher wrote:
> On Mon, Feb 24, 2020 at 7:32PM +0000, Jeremy Allison via samba wrote:
> 
> > Having said that, your fix looks like it's
> > removing a bunch of overflow safety checks,
> > so I'm not sure it's the right one.
> 
> >> - if (bandsize > SIZE_MAX/nbands) {
> >> - DBG_ERR("tmsize overflow: bandsize [%zu] nbands [%zu]\n",
> >> <snip>
> >> - if (state->total_size + tm_size < state->total_size) {
> >> - DBG_ERR("tmsize overflow: bandsize [%zu] nbands [%zu]\n",
> >> <snip>
> >> + tm_size = (off_t)bandsize * (off_t)nbands;
> 
> The problem was that the overflow failsafes were tripping, so this simply increased the precision by forced typing in the arithmetic – that should obviate the need for the overflow checks in the first place. However if you'd rather I can ensure it scales up to check for bigger overflows instead

Yes please. We need to keep the overflow checks,
as this is on user-supplied data I believe.


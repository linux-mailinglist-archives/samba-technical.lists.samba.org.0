Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4671DBE07
	for <lists+samba-technical@lfdr.de>; Wed, 20 May 2020 21:33:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=d/RyxPEqo3cR9NFHZzbxDuNUejxvzjWNJtAZncID/kw=; b=e+pj4wghpnVaXqxEXUz4XTkxJy
	X9WnXnD8WANytyOBfVG6FeTb6DgTeLzldEKTJjK9CTfcUR1IAOf4yhn0B3aZNuKj85crAycQskNVR
	oYJSm6gilkSM4Koej8iBuOGGh4q1+bXxVyfZWlpOVqxb/2g0ybxV2Be6ZOrwpvNZe4zJWc0lFaQgV
	qe3KkT4kwvR+iCl4357I94qbIhnmLAho3+RYRdJG9pPl5uoknjEi6lJKmMmtzZXGlvI7MEWltLHa+
	fUxBhQA/jQqz4fIgc70dVQ5MuLbZ9pWOS5bYw2GiMvh6o+nDIgaSg2NBtinAH1p6mecAAU0jC5xsg
	n9FijQGg==;
Received: from localhost ([::1]:52542 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jbUSO-005Hme-Q3; Wed, 20 May 2020 19:32:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:51874) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jbUSK-005HmX-Bn
 for samba-technical@lists.samba.org; Wed, 20 May 2020 19:32:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=d/RyxPEqo3cR9NFHZzbxDuNUejxvzjWNJtAZncID/kw=; b=aKvCpykuAHn6cIw9MCsTE0e4Xr
 ZmLEC7u4D4+z6HazYFiQxHmLtEoSpHg9nBFwbWrbQy1Vwlro7KQWuiZ5ZwAxHabHZGcksbMiqujnJ
 6XsLyABLcWEzWfl6RTSyf6zih8dXNWrviCbEHFSFd40qTmH/l/r9aXmKI1pDtSxSGYKYqhHPWQPvH
 VdozsCubKey2mwTXaB7y19hbcDOj9r+5BGm6MjlRe9tCmUYYlPdKdKdkcxD2fi2U0PDSPtFsBu8/B
 myQIpAoJE4BDLVl9xFzNUAnhyL+SINt+CJ29VMJy7GVW4Hct27F0cCC24r76pCNK3k5mf9H/YtTN9
 1iYZEf9ub1ZvYNrL9oPneI2YBl8Jehl5lbGEUfAtnVqxsdhhy6supgtoBG0ikOoXv1XG7+KYHxI4Z
 7xCzi33iM1RtmWQPfhz+gwARmco7qPHYm5D11PUZBiT9ltbtFtPM/qWB47QL/NLMF1Vdrw6WIAHtu
 SiFzri0laSKjn0itYyL5ofgm;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jbUSJ-0004F7-Br; Wed, 20 May 2020 19:32:43 +0000
Date: Wed, 20 May 2020 12:32:37 -0700
To: hezekiah maina <hezekiahmaina3@gmail.com>
Subject: Re: Why use TDB and LMDB?
Message-ID: <20200520193237.GD27061@jeremy-acer>
References: <CAH72RCX1ATg=SOwihfT0D6vDvaJPLUC0pWpaUT6RFx81RWcYaw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH72RCX1ATg=SOwihfT0D6vDvaJPLUC0pWpaUT6RFx81RWcYaw@mail.gmail.com>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, May 20, 2020 at 09:46:02PM +0300, hezekiah maina via samba-technical wrote:
> Hi everyone,
> 
> I'm still learning Samba and one of the question I haven't figured out yet
> is why
> Samba uses TDB or LMDB instead of RDBMS like Postgres or MySQL?

RDBMS like Postgres or MySQL are more heavyweight than tdb and
lmdb. i.e. we think they'll be slower. A lot slower.


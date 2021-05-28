Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8CF393A05
	for <lists+samba-technical@lfdr.de>; Fri, 28 May 2021 02:04:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=4xiufwoZKgp4BeVLJU6E/Pf7JPM/TfZSNCh+E/0tdTY=; b=SHDufGtBdS029FXcT5Kwqqizwl
	tEwcezFKShRysrO0nLysSJbn/Qsy44xo91sfT1O9E018RIhpmz6XjsfSmBPlj8/2R6T07gatfYmwZ
	kQnEPYxGoK6/ZB2oPpUBhsWguc8R2KldZ7smOh6aIFcgeqdTxHO7K4nv86g2Qfp+JFZmDDrLaqUgI
	z7QkvS6JepczlZ73AL4u98AUe/zB0Y4+DVXhh2ZYTL6KE0qLyWA8x2rCu5UyTT8OeuqIhH3BU36sH
	Y/fIUH2d6oG6bo8gqIuFR9U+Ha9VM92FDKMPJ8uVJg+1D0xEbcSH9Yi/Stfczlyn/9qvA49dgIXvY
	OdYBP3Rw==;
Received: from ip6-localhost ([::1]:40650 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lmPyU-004vhW-S5; Fri, 28 May 2021 00:03:38 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:59218) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lmPyN-004vhN-7Q
 for samba-technical@lists.samba.org; Fri, 28 May 2021 00:03:35 +0000
Received: from [IPv6:2404:130:0:1000:3483:8d54:45b1:56a] (unknown
 [IPv6:2404:130:0:1000:3483:8d54:45b1:56a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id E6A4480FA5; 
 Fri, 28 May 2021 12:03:18 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1622160198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4xiufwoZKgp4BeVLJU6E/Pf7JPM/TfZSNCh+E/0tdTY=;
 b=a0yg6SbskpdWuNuTu04RNJTsdYTt2X3qrSXAUX96ajZaheuE0YxE/YJNOYBcy2WLSRPruG
 HT5Sqcy0SYdrxnbrG6Bp8EYjju+QWeOJYvQ/crvCdpZKtj+IrWsQPL+qjJzSU0W9pGxOKJ
 DJpjPt4jPIzFRGEn90Bh51B6So2O/asgMIALO+U0krTDQrLnJeoZl6plUqHkvmF8tBxKcR
 IOFtGmwT1KiHylPsAq+AbgkvCRCaZR7BQAH8n27S0z4e/euBwvQmRrA3xCDHKqDFxzl9h0
 x+5dgNqNsoTRNxDtcJQ5PxcUl20UuJEDwlNzBHWVUhagsMoHcVXqGWUuqpd/ww==
Subject: Re: JSON input / output for CLI utilities
To: Andrew Walker <awalker@ixsystems.com>,
 samba-technical <samba-technical@lists.samba.org>
References: <CAB5c7xqUC9mZ8-VFDmM44b=EL49yBiWkMikf8BWgU0FjC+25MA@mail.gmail.com>
Message-ID: <cf23d39b-a13b-a9fb-64b1-e5094a4336e5@catalyst.net.nz>
Date: Fri, 28 May 2021 12:03:17 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAB5c7xqUC9mZ8-VFDmM44b=EL49yBiWkMikf8BWgU0FjC+25MA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-NZ
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.10 / 15.00]; ARC_NA(0.00)[];
 MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[catalyst.net.nz:s=default];
 MIME_TRACE(0.00)[0:+]; MID_RHS_MATCH_FROM(0.00)[]
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 28/05/21 9:42 am, Andrew Walker via samba-technical wrote:
> I know we've added JSON output to a few of the CLI utils. Over the past
> year or so I've added this to various utils in FreeNAS (using libjansson).
> Is there an overall strategy for this? I'd be happy to upstream what I have.

Yes, please upstream.

I think the strategy is to look around and aim for consistency between 
tools, but don't let the lack of clear conventions stop you.

jansson is the right thing for C; the standard python library is right 
for python.

> Also is there an effort to add support for JSON input to them?

No effort, but I think we would want to where it makes sense.

Douglas




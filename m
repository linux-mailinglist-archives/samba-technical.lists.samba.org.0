Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B393939388E
	for <lists+samba-technical@lfdr.de>; Fri, 28 May 2021 00:07:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=YLjxaHYQKNjqjNwOEi847+hOLoYgKLLt1AVoUmL9Hcw=; b=ROKXzpSfUPFivFCYB9mDU76t3k
	rMEJu5sAsqTU0akcCiH1pPeIvyyvCsQxdP8+jdcrXGUKbmedpPKl5DdgD4xgSJ7kR4XJcSo2xZWxe
	lZ2yJa5A3U4ukokoj8ubBkkooELG0OAR4lI3HLd3Xiv8qeUymRBK6MPVGIVVKPMKqTBJxzO7JnPpL
	5opdCHxj61Gte0E1w91ZvklHAhTBIbfiQ5+nEAijKuBZpED6pg2sMGEmXrrvKw32cW/fNhcfxM6lo
	2mD/eB+dEHM16ke6nmQEeo9PCM+cNQ/17F1gkmS/xQbiuIAT3FJvl3XMInzKGvX1rpXeGt0rk3sN1
	Vx4DGyKQ==;
Received: from ip6-localhost ([::1]:39752 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lmO9i-004v47-2S; Thu, 27 May 2021 22:07:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54704) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lmO9c-004v3y-QZ
 for samba-technical@lists.samba.org; Thu, 27 May 2021 22:07:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=YLjxaHYQKNjqjNwOEi847+hOLoYgKLLt1AVoUmL9Hcw=; b=SJ5U3JDiokTQ4zCjUNJjfBP3lc
 CRUwkK3nFd/tcgyiitdrb5CmsJjBbD+Ofsygk+xgr3CJyLqdrAXnw8PY0VrSZhHhyOyEqFZJZHu8S
 ZJt3F2xRCLHiVUwfCdTLaXlOLDbVwYmvMT4bRk0ppkbRhiRFSVKSCBfPW+F9KsvtWQxJsU61ie05z
 KAqfDxMuDlf/Yi3RlhzC6piTSEYCC/vHPpxG2xSOR2HOHop3o9m3J0es7Zs6FTvPfGoInmKNukNbb
 DzU4vAajZ8MOrI6FjGIzeeniSSjdyrApUHGA+bHjX50Opoy9+TMwjXafDqxgDJU9HTjF88G8eFTnN
 e72Z0fmgH9FLawrQsur7+jz7izUvTRyk+E32VsTcGhilolxdDg0v4HrFLysv7BnIV3kPkouqx9XBg
 HrhNZGQUZAU67pxzIAa3/PN+JeqlTRpc4uD/S6+DQ8IWXhhxn+iFd1cTdppXxRipywMlQzkhz27Q4
 Jn5hDJxCd/aQ+SbML80iIoUo;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lmO9b-0000oc-4K; Thu, 27 May 2021 22:06:59 +0000
Date: Thu, 27 May 2021 15:06:56 -0700
To: Andrew Walker <awalker@ixsystems.com>
Subject: Re: JSON input / output for CLI utilities
Message-ID: <20210527220656.GB3874838@jeremy-acer>
References: <CAB5c7xqUC9mZ8-VFDmM44b=EL49yBiWkMikf8BWgU0FjC+25MA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAB5c7xqUC9mZ8-VFDmM44b=EL49yBiWkMikf8BWgU0FjC+25MA@mail.gmail.com>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, May 27, 2021 at 05:42:20PM -0400, Andrew Walker via samba-technical wrote:
>I know we've added JSON output to a few of the CLI utils. Over the past
>year or so I've added this to various utils in FreeNAS (using libjansson).
>Is there an overall strategy for this? I'd be happy to upstream what I have.

More and automatable scriptability of our tools is always a good idea !

Please upstream.

>Also is there an effort to add support for JSON input to them?

Not that I know of.


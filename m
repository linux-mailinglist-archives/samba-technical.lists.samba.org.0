Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B622D7B4
	for <lists+samba-technical@lfdr.de>; Wed, 29 May 2019 10:24:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Zw18DMSG6NPFg60A5XeW6TSedUYWYobHU8H625+jY3U=; b=Qb8fr0WQBm3GbXFLhbFJnyKv0g
	ktzkA5rvmfxAN4dRKLiKOi4VvPwx5YdkJ5NEKJJ4obCjk+SoLjtgznHnZbb87MXToIlLOF5oRN9AW
	c3NQ01iwckJpFEMs153MsUYdoblvmCzELWV3q9oZpPI1yuSnNH9ipoSzNFrsvJRu9rT07izQUkiNZ
	7rHOY+BWPL/KZgnF5WwyxctPz1RHT0/Pa2or+DQ/I6LoOUfbaLfUMbiQkagzdgzoFeOxsmOfOqU7y
	n29hf0ArdkUJAhfcu1rQCxMm8lpcxwEjwxggqEoydXbgY8kkNhI7v2klOlDJ/3etSPkPGtuiAK5f8
	hZd9clkA==;
Received: from localhost ([::1]:23164 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hVtsz-002Skw-OL; Wed, 29 May 2019 08:24:37 +0000
Received: from [2a01:4f8:192:486::147:1] (port=54608 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hVtsv-002Sjw-NF
 for samba-technical@lists.samba.org; Wed, 29 May 2019 08:24:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=Zw18DMSG6NPFg60A5XeW6TSedUYWYobHU8H625+jY3U=; b=aWhKJxxxphygjvG+PAcgZAxkr7
 BSW7rSiQidR4aljvsCbCkcfAbNASvZIR3bk83uNJuLbJ6hIAAeqEXYFBpCI8esim4TPbh3xzqaHdu
 ohZF2nm6zl5BhK/9uF1kaBfHbpAQ+CnLGLdUgUKmvkeBXtfwcWT0l3j9d8YyJB2Id7HI=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hVtsq-0008If-9f; Wed, 29 May 2019 08:24:28 +0000
Date: Wed, 29 May 2019 11:24:26 +0300
To: Ralph Boehme <slow@samba.org>
Subject: Re: [PATCH] Fix compile error with --enable-selftest
Message-ID: <20190529082426.GD4871@onega.vda.li>
References: <42f879d1e0abfd4dd2e6c299b9184a7dfc5afacd.camel@cryptolab.net>
 <20190529075805.zc4qabjyb7plsajg@inti>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190529075805.zc4qabjyb7plsajg@inti>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: Anoop C S <anoopcs@cryptolab.net>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On ke, 29 touko 2019, Ralph Boehme via samba-technical wrote:
> Hi Anoop,
> 
> On Wed, May 29, 2019 at 12:10:53PM +0530, Anoop C S via samba-technical wrote:
> > Please find the attached patch which fixes the following error while
> > compiling with --enable-selftest configure option:
> > 
> > ...
> > 
> 
> Lgtm. Second team reviewer?
See my separate email -- there is a typo in the commit message
(undecalred). With that fixed, RB+, please push.

-- 
/ Alexander Bokovoy


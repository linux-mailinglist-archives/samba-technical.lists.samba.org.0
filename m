Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED67DDD2E
	for <lists+samba-technical@lfdr.de>; Sun, 20 Oct 2019 09:29:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=N4e4S76gs/a1b1eLKyp0iNVSnbKvNICvRtehvtFJ9LY=; b=jEqeTkw5z6vKtd1V6kYuD+20M4
	zZFiTlqx7/U47c87WRJi7J4VMoA2iZzFB6xWarbrtyWy0Uyoz2fj5o/iVy4VDI/qDTr5CwSS6FhK7
	vSfZhieP9bOxbD7t4kV4qJUKY4CzDWPKT0ZNfWY4Qumb5Nzr/iWxzZO/vA582RrcZqqq+Z5TE44q9
	ogDEbm40JZOSE17jju1lGWtQgXqudTFWMjOrB40VwfKvwhgycUCRWIDgbFaAVosLg3hog0qka0p1K
	WGXcslAlM1e9VQux9Hv9mYcxZf0PlZWIPP4rYbJRMv9yITmzRgmiLjmAfyBvjhqyBgMNIAvYYvTS8
	rKc7SvQw==;
Received: from localhost ([::1]:56528 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iM5eW-000mm6-Qk; Sun, 20 Oct 2019 07:29:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14810) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iM5eQ-000mlx-CF
 for samba-technical@lists.samba.org; Sun, 20 Oct 2019 07:29:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=N4e4S76gs/a1b1eLKyp0iNVSnbKvNICvRtehvtFJ9LY=; b=w6y3q83gWYkcMy8tkUbTMhzEbg
 GpkHZcYs/dhElijDDIP1mL6vxVHG6mpua5QQDzXVeQ/5gRzr6qWLrPV9JJ9tguiy5q/FFM3meQX+t
 6lNtYBNIednMCXBswok2DrZ1JSv9IbtIZ9XVacnfl7WYWD21KGyYhncWT8aq4EHlO/L7dApDr/rbM
 BOsNmPuOeGk8H3jgPyf2r0c8y2ndIjPfxqiUryIIXI5XEsMGIGLJmlfXa1itM271xC9RVE+J34sf6
 Y6r8Df2YxKT5XJIINGcSXFC6cKseg30JWZesKA0NBlOMd5L9iyFAJkLKlh+BSiv68z3/3hjjZPu26
 gN8t0iuRr0YijKjlIol7vcKkJQEkxPsWAMUXpqtmL3Jh2JL0l2GrI+af1WuqQS87FkbLyXPd8zPgo
 /4mIin5JDPEg6r0RbQJFK8vsbe568SyBMxz8RnCXSlJ1Qn34bZscpw2T8rFdPFCkMEz6faohlNlAO
 0D25SKl6+yEA8WQAmbhIkKY9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iM5eM-0007VV-9B; Sun, 20 Oct 2019 07:29:14 +0000
Subject: Re: [PATCH] build - use system asn1_compile to cross-compile Samba's
 bundled Heimdal
To: Andrew Bartlett <abartlet@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
References: <80f0d797-a4df-2694-f707-4dfb41b0bbdf@samba.org>
 <ab5a51e6f8b7b45e552c70db9a5ab517e328c4ae.camel@samba.org>
Message-ID: <8eafc867-d09f-c899-c4ff-d0c0520a9f0a@samba.org>
Date: Sun, 20 Oct 2019 10:29:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <ab5a51e6f8b7b45e552c70db9a5ab517e328c4ae.camel@samba.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
From: Uri Simchoni via samba-technical <samba-technical@lists.samba.org>
Reply-To: Uri Simchoni <uri@samba.org>
Cc: neil@nmacleod.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 20/10/2019 9:56, Andrew Bartlett via samba-technical wrote:
> 
> Samba's waf is meant to be able to prepare host binaries using
> use_hostcc=yes on the targets, but that may well have bit-rotted.
> 

That must have bit-rotted a long time ago because we set use_hostcc 
correctly yet the embedded vendor workarounds have been there for years.

> it should just work or not be available at
> all.
> 

Understood. Embedded vendors /distros are of course welcome to use this 
patch and as a Team I think it would be practical or even necessary to 
support issues with embedded Samba even if they use patches, and even if 
they use embedded heimdal, because from installed-base POV they probably 
represent the lion's share of Samba instances out there.

> I understand you are running out of time, my suggestion is to lock in
> what we can agree on for now until someone can either make a fool-proof
> fully automatic recipe, one way or the other.
> 
> Sorry,
> 
> Andrew Bartlett
> 

OK, will do.

Thanks,
Uri.


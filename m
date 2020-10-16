Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A9D290C65
	for <lists+samba-technical@lfdr.de>; Fri, 16 Oct 2020 21:45:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=j/cXnncGboN+O2jnxi0iQkfzGJIksc7JBAq94Crb0E0=; b=Zp4oOpeDZ/x95K0+BKW+aYfF2L
	1LSzy/r7rKXbq8TTu+Pmx/UurHp3BGuHqzFB/IYJV3kgOZgFE8ktz5J59nqhpOOwNfbuDdiwY5wE7
	h2JcO5Dpo0TrhGw9M+kVY4EdGe416lch1hKZHS++145Dkb9T8JG408sQ1GukhQrNsvIBXZHaVKxdX
	pJcp7i09WAwfl0CUVmMdxcAlkHlqMGM6h0MJmmb5eVb/Rv4NB/mTbuiY+SsFqWpGaEBUTvuNKRONK
	w5K5HYEYaUeAOIh9AU9CVTtqsxD7w1jFzmxnnbZbYRg6AMlpOOfh8D1ra8fwtI5LKcwIkwyP/uR9t
	Im+VDhYw==;
Received: from ip6-localhost ([::1]:58454 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kTVer-00CRa7-SE; Fri, 16 Oct 2020 19:44:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32604) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTVeh-00CRZz-Hg
 for samba-technical@lists.samba.org; Fri, 16 Oct 2020 19:44:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=j/cXnncGboN+O2jnxi0iQkfzGJIksc7JBAq94Crb0E0=; b=OpoIpbI48y2/adevbSv533wk2n
 gOYZRhIP2n8wu7b883vzmO10kBV3i8wMhFOELCLn1pH+16G8CPFgvdLYi2simTjNKsJ6/XgbtEdfg
 xeVryBJ6GeEuuyyubYmb/K+ibq3M8BnIQeoCfRgbCCbdmamYhB8+5ERf/6VbS8yrVOLpsKa+i60Rg
 7NTAr061SkZzAwb/3d8lVe3j6XEiUDLDo/Xhi0YWNtFe+TH0oi2+Y0BHL+nDg4XBoVjTB8U0gYcCz
 hpmgdHiYQl7Szm2OuPMCIqg354EcyVwdq4T4CVw1io9s0aKLfGbYT0FjTOdeL4T7v80x9Ikp18BTe
 BMhf+VwiST2Mgvskq87igjkIYfhCnV2JIIR4VoXXme4J3+urkpSu8eVVxqxCOPKefIcXX2qRh2Z1U
 z9wKYk3VN65L4JxhOsgtbcFU0NXSCpz3/u8BauN5Wj1Otg+NliZ6U1pb8yMyyd1V9GrM8gS9SWcND
 sbDPiFxO/tcjpFoSL6NGOqHB;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTVeZ-00065X-AW; Fri, 16 Oct 2020 19:44:39 +0000
Date: Fri, 16 Oct 2020 12:44:36 -0700
To: Arran Cudbard-Bell <a.cudbardb@freeradius.org>
Subject: Re: talloc: talloc_set_memlimit causes all reallocs to fail when
 used on pools.   talloc_set_memlimit not enforced correctly on pools.
Message-ID: <20201016194436.GD67086@jeremy-acer>
References: <DA0D6B87-BA18-41EA-8ACE-E431841902FE@freeradius.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DA0D6B87-BA18-41EA-8ACE-E431841902FE@freeradius.org>
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

On Fri, Oct 16, 2020 at 01:59:11PM -0500, Arran Cudbard-Bell via samba-technical wrote:
> Reviewing the talloc code shows provisions (and test cases) for applying memlimits to pools, unfortunately in practice, memlimit functionality on pools seems fairly broken.
> 
> #include <talloc.h>
> #include <stdio.h>
> 
> int main(int argc, char **argv)
> {
>        TALLOC_CTX *pool = talloc_pool(NULL, 1024);
>        TALLOC_CTX *chunk, *fail_chunk;
> 
>        if (pool) {
>                printf("Pool allocated\n");
>        } else {
>                printf("Pool allocation failed\n");
>        }
> 
>        if (talloc_set_memlimit(pool, 512) < 0) {
>                printf("talloc_set_memlimit failed\n");
>        } else {
>               printf("talloc_set_memlimit success\n");
>        }

OK, looking at this more closely, I think this is
a fundemental misunderstanding of what a talloc_pool
is.

A talloc_pool() is pre-allocated memory, that can
then be further divided without having to call
into malloc.

It's ALREADY allocated memory, so setting a memlimit size
smaller than the pool size makes no sense - once you've
done that all allocations should fail.

Jeremy.


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EE516965F
	for <lists+samba-technical@lfdr.de>; Sun, 23 Feb 2020 07:09:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=owQJvgeXB5EhPP5ncFEAYXczSkJ4Xh6Imare7fd8KNE=; b=WDcCmebZAMgt/4ZLUBeudW8bVW
	0xSQm3z+vEoVzKdQuNaEcDA3SV89rb3iTyolEhRMikTZsSVVfgjchKMb74RLXvGpVksiSFhARfQgv
	EVXbx+eht6InCmjbSy7EZuGOCaZTj8rNY/X6AfuMrMWCPem1Hgrdj6eo15BivT1mhBAUthzKymZON
	xBxVu3GCOcea2/SotVg/sfGKFcl2/haJCN9uOfY9iR0X0j0x22mTILLAYjRmyj4OV5VvclJSr+cfC
	Db6v6bL0O6Y5qk+3qulUfCPgQEUKGoAa5hveopWrzFZ25Aip3/CfAw9IB0g7HwWcUBM/U7mmNQBQ9
	pVSl7PKg==;
Received: from localhost ([::1]:21466 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j5kR7-00B95r-KD; Sun, 23 Feb 2020 06:08:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:51722) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j5kR3-00B95k-Bb
 for samba-technical@lists.samba.org; Sun, 23 Feb 2020 06:08:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=owQJvgeXB5EhPP5ncFEAYXczSkJ4Xh6Imare7fd8KNE=; b=goSV2KUIgDm45eV0twNDtRAInn
 TobUWo1AMFA4xMt/G4SgzrwJAQe+V9ac6fV/0tt7bvP44bansu+Sa5UJGk0497WR+NMluiV9hBQ3w
 +WvqmiHkKQaa9i3X/KPqpt0rrZrRJF34hxEFOQK0Wq4O3QtbEpv9ed+OiWzmtsoylSaIPpwAxstnm
 D9R+gIDOff/nHmeiUrIF5AxFOEa0ZWbSY9dm3CzS7fTtEcgVdYswerCHw38WXsdl7pA+K7hF3SO/1
 Efe5dtbJuQrXxU/V+fxeatKwg8L0LQLctbPPah4zjuOlJtNy7AiNjwereqD1/OX9cuVxVjfKc3UG9
 W8gge++jTqggVblj4hJ0gxOTFgkJxESMJF+eBtVB5u6e1Qj8NGCZrx/1jQM+KVN3t5Ii/GEJYUw+R
 HYceHpmFPBkAbIi7xD5DbNfwC59H8E2FrY9mW36Dd3S0STDCkOWm1s+pSqees7eqfw5Yp1oGfsjJp
 wlJ0rm8/zGkMqa6DZagNWYor;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j5kR0-0002YK-Mo; Sun, 23 Feb 2020 06:08:11 +0000
Date: Sat, 22 Feb 2020 22:08:04 -0800
To: ronnie sahlberg <ronniesahlberg@gmail.com>
Subject: Re: ndr64 support
Message-ID: <20200223060804.GA32193@jeremy-acer>
References: <CAN05THSsnmesxc0UH17OK95KXAY5NCYisNc6pNyGDykYd=R1ig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAN05THSsnmesxc0UH17OK95KXAY5NCYisNc6pNyGDykYd=R1ig@mail.gmail.com>
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

On Sat, Feb 22, 2020 at 06:03:13PM +1000, ronnie sahlberg via samba-technical wrote:
> List
> 
> Does samba support the NDR64 transfer syntax?
> This was introduced in 2008 and makes alignment better for various
> fields.
> 
> I just noticed that when I use libsmb2 against samba 4.10 it always reject
> NDR64 as an unsupported transfer syntax and instead always pick NDR32.
> If I disable NDR32 support then the bind will fail completely with no
> suitable transfer syntaxes.
> 
> I am testing against 4.10. Which is reasonable new.

I *think* (although I'm sure Metze will be able
to give a comprehensive answer) that we support
it as a client for testing purposes, but not as
a server.


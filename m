Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B5584201A30
	for <lists+samba-technical@lfdr.de>; Fri, 19 Jun 2020 20:20:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=mNvPW6GsCUrwls1vOLwjjNUtVQZT3QuzDxxYu8v4nHs=; b=Ojf50C5GZ6GdXWVBoYPMQ2zqhm
	17s6Q9qyqEyGkIPEFw7RZHK4dzmV7uuopj/J8f6Ps0+QvUsAQATziA07HIhEWQMOZl/n8TCjqeZRo
	gk05tzgBdQpmlDI8XDNgTjkradZdbEhg5pZHVnTp5ETpG/lTs6fumplCaOn5ID4Hql69tdqo6Hev7
	THKnhBnHxUsTabZdJHnFb5+3bU5obaMK3gxKi8+k9/hyQW6MkMX4jSjVnFK5OzjkRf+EAE4HdEEkp
	i8T8XoeVFJXC946FExrELaR3rAWK1iKtmMobKwCmMsl3Fy28EWM6ffve1dTpBgthtaLlFxphYOHvI
	05rJp1uQ==;
Received: from localhost ([::1]:42720 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jmLcX-001T0i-Cb; Fri, 19 Jun 2020 18:20:09 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50164) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jmLcR-001T0b-7N
 for samba-technical@lists.samba.org; Fri, 19 Jun 2020 18:20:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=mNvPW6GsCUrwls1vOLwjjNUtVQZT3QuzDxxYu8v4nHs=; b=pBbkuog+fv8yzeoQrUMYz1VZEu
 LuWQJBCME7kqC375Pw+49m/iOVyp6frHaRIXXCh8L0H/wcCHLNgE1fGW2mjmOn1GPx2ZwXPh77Xmp
 2OVxWQBJ0deh50P8RA4lSR6HX/ZJwf9C/QOzNFtHZjF2gtzs11uqaM+Gw8NJ23iozayE9vc7+w+B4
 jGfrXjKWaPfCGUPhmsxlC0Wpx8Rxo+tZGejzIpFUcBiw9wWfmQCqL2Nk39Xx70Lq3raZIScLspTUE
 7FvwLypS36h9GGsClCgQRhOLYFMOeozGWeWllQejmqff/G+xMnTkmfjKEvXspJDfFzaDtlt0YmMhl
 tyODqw5MCQ49MCjiVu0rsGB+171g3+Dcf1eMb/I8gAHE6CA2EPghO7CjFW8kIKvjeOVf2vBTNrRXq
 9AD83cO7qLvuJ8jx6hETKIZxgHnXumDp09MY3990fhl8ASpW8LHoTHku3V7eShKOETrA4dfi6gQUh
 NjBkLq+9NUh4lDm1M/b72bQA;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jmLcQ-0007dQ-8u; Fri, 19 Jun 2020 18:20:02 +0000
Date: Fri, 19 Jun 2020 11:19:56 -0700
To: Isaac Boukris <iboukris@gmail.com>
Subject: Re: gitlab: testing of ldap-ssl-ads option
Message-ID: <20200619181956.GF10191@jeremy-acer>
References: <CAC-fF8TH5sf6ekjfG5QqnEwG41fopV1bWOMxBH_UnodfjDo_qA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAC-fF8TH5sf6ekjfG5QqnEwG41fopV1bWOMxBH_UnodfjDo_qA@mail.gmail.com>
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Jun 19, 2020 at 07:45:28PM +0200, Isaac Boukris via samba-technical wrote:
> Hi,
> 
> I'm trying to add some tests for the ldap-ssl-ads option in
> ad_dc_ntvfs and fl2008r2dc environments (as ad_dc doesn't allow SASL
> over TLS):
> https://gitlab.com/samba-team/samba/-/merge_requests/1402
> 
> The tests work locally but in gitlab I get this error:
> 
>  UNEXPECTED(failure): samba4.blackbox.net_ads_tls.join(ad_dc_ntvfs:client)
> 7111 REASON: Exception: Exception: Failed to issue the StartTLS
> instruction: Connect error
> 7112 Failed to join domain: failed to connect to AD: Connect error
> ...
>  TLS ../../source4/lib/tls/tls_tstream.c:554 - An unexpected TLS
> packet was received.

That's coming from:

 553         if (gnutls_error_is_fatal(ret) != 0) {
 554                 DEBUG(1,("TLS %s - %s\n", __location__, gnutls_strerror(ret)));
 555                 tlss->error = EIO;
 556                 tevent_req_error(req, tlss->error);
 557                 return;
 558         }

so that's an error message from gnutls_strerror().
Might be worthwhile looking inside the gnutls
code for the source of that.

> Does anyone have any idea on this error and why I only get it on gitlab?

My guess would be differing gnutls library
versions. Not sure how to determine what
gnutls library version is on gitlab.


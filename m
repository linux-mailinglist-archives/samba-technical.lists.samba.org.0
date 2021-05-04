Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F18D737277B
	for <lists+samba-technical@lfdr.de>; Tue,  4 May 2021 10:44:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Jq2eA7cGYisZq8JR2y6fDV/8apC4ujUQpYMtjQrRZIU=; b=ZVACkG1OC52DoQHaJsmRzIuRAz
	f94KxPSwoPbJrjPqt+p88apAqHKOSSL4ZoLYIZ1aO3Nh4OjIAV7Qc2z8ZI2osrNAb8zGVVNT1dRsC
	sskSW+uZm/mZ5qxqGe/7t60XJ/iRnb6cb8d3oXBH5gE3JQgq578o77xqJL0GwsPMyjphXT2bZSGQL
	BjgwnT/BWZVTaB/mJiKNYPuWpp3xRx7EL3toU7V50IPlo3/SPDVqlnxEHSGOx02xkSvxyBPyGe6TF
	XIUqGPOdWz4n8n7+z5G/an1PUpXCjQylczdJynpy77vFznUmwdeGaAdIo/oVR148uJAOL/z7XjjiG
	vVKUOOYA==;
Received: from ip6-localhost ([::1]:48632 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ldqek-00FPfW-IJ; Tue, 04 May 2021 08:43:50 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:41536) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ldqef-00FPfP-Uq
 for samba-technical@lists.samba.org; Tue, 04 May 2021 08:43:48 +0000
Received: by mail-ej1-x630.google.com with SMTP id zg3so11909029ejb.8
 for <samba-technical@lists.samba.org>; Tue, 04 May 2021 01:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jq2eA7cGYisZq8JR2y6fDV/8apC4ujUQpYMtjQrRZIU=;
 b=YiQI901oe/8e4D8iZaVaVi/ZXU7gHbuZxf7jpu2O2kS7g4vogr4JkqQoG9+NVl4TKE
 izJfJX/OgaUOgI5s47EpE3s5IXFouThtg4vCVcZg67HBa2wr1qro3PZ8tOvXJenQ3pKa
 ReGvupGsrl7+OCschrW3pGCiNWKRv6H1RSi98sF9UDY4xvEt2f64hyNx/kyvTczn2OaH
 LL0AtNWIjOaq5QlTQHPxDhqXxMO1DKuR+r3Q6T1ycdLTnQSHUa6kaHoA7b1yQ+QYiJM6
 OpFYUJ07nObrL+WvxNMf2AN+4DIseCreWd98wi7jS9ztIApqyqXUCL3L1A9ZEmX4iRfc
 gGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jq2eA7cGYisZq8JR2y6fDV/8apC4ujUQpYMtjQrRZIU=;
 b=DWB91r5feSd9xZG9GIZjRcc+GI4mV+ntjw1nqb3WMothKx3H+EtFEBD4zdIFqn2ivS
 EQ2CuRUNOSh0FEQ1OYW7BwXq8gUIgMGHRW13rhTVTq541n6quRgg+yQFJyZWUD6KW9mk
 lzAIs/xlMz1Fuz/NmfDwqSHzJSALATXDuvPqT4xRipKdrXzB1eewJsi7+lQOszZsTlSu
 eemR4V4VnXifPEWrVpdXBuegzuPgHcM0nzzIaX5o4tWYcePYNAo54k5x8eGwdEOPVcS7
 a9Vwpt3PtN2mHfUWnA8pMlE9cIZ+gILgOuMzr5yuW5fdXUU0Pbpv8v/ACt/kdrAVWmnd
 uUgw==
X-Gm-Message-State: AOAM532eCSXJMz53wGYd7KbOvdbNusa54x5XKl/ij/sK9/UYepFgGPe2
 Z3kO4Sot9aF4oxD7+XRKKO9CRclJGW0xSB3h3fR4Ic+cAZk9UQ==
X-Google-Smtp-Source: ABdhPJwxDPcaJaRLRP2V//bME3uy4ae7GdkFGA5FDowpP/UXpapqerI0SEOWZ8KS9x5q1hhBWGEiibeXkj1s0tLpy8Y=
X-Received: by 2002:a17:906:32d1:: with SMTP id
 k17mr20610014ejk.94.1620117825000; 
 Tue, 04 May 2021 01:43:45 -0700 (PDT)
MIME-Version: 1.0
References: <aaf1bedfbba1dde583281c86eaff5f73d8008318.camel@samba.org>
In-Reply-To: <aaf1bedfbba1dde583281c86eaff5f73d8008318.camel@samba.org>
Date: Tue, 4 May 2021 16:43:35 +0800
Message-ID: <CAC6SzHKr+x2-1EZq_zXQDsrPpRaqwKmBLrsv6nMobSY2aa6kQA@mail.gmail.com>
Subject: Re: New Samba Developer: Joseph Sutton
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: d tbsky via samba-technical <samba-technical@lists.samba.org>
Reply-To: d tbsky <tbskyd@gmail.com>
Cc: Joseph Sutton <josephsutton@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
> I wanted to introduce Joseph Sutton, who a number of you will have
> already noticed has been working in some Samba bugs around the AD DC so
> far.
> I'm not promising anything, but if you have a long-standing but small
> issue you think would be a good introduction to Samba development
> please let us know.

I am sorry but today a user ask me again why our samba service need
"samdom\account" to access.
that's issue https://bugzilla.samba.org/show_bug.cgi?id=13543. but of
course I told him that's Microsoft's fault.
it's interesting that many of our services are using ldap to
authenticate against samba DC, and all of them can use
"account/password" to login.
only samba file server need "samdom\account" to login.
maybe new developer has some new magic thought which would solve it in
a blink of an eye/finger...


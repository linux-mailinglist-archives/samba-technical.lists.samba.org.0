Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAE31557B4
	for <lists+samba-technical@lfdr.de>; Fri,  7 Feb 2020 13:27:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Dv9wvP3KHXa1E5JYZzJizwfRahjh6d3QSksZ49PxBlo=; b=6SVj+65/vdoavqRJTfNMxFQbzd
	i3/2JIYq6tPfZmtZJ3Q2HVxIaszdTpjujET3qCBEbbyFrsQGC4WpYs5EhUfSgSuexEMzmTwJB8KPU
	AZFQGnAEjSwpUmXH6/i0WiKhbtTsvmD+oXxzhCvpvkMqHLgWtdSG53ywO/lL9228mrTAtA31Hr7oZ
	cpvJW4v610VeVij2pvL966cefoknAaiDGrMK91sRklPSK6pdNADy+EZEUF5CuvQLuJzZUNECHbWMG
	6hMCgchH/V6hV8VA34XYcXyJZ3R81IwmLLxkXYwFi6s1KOinz+54ne2SOH4jY5w7c6YRuRM0y71zF
	W6LaEtOw==;
Received: from localhost ([::1]:18104 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j02iN-008hTi-TL; Fri, 07 Feb 2020 12:26:32 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:45841) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j02iJ-008hTb-8l
 for samba-technical@lists.samba.org; Fri, 07 Feb 2020 12:26:29 +0000
Received: by mail-lf1-x135.google.com with SMTP id 203so1379528lfa.12
 for <samba-technical@lists.samba.org>; Fri, 07 Feb 2020 04:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dv9wvP3KHXa1E5JYZzJizwfRahjh6d3QSksZ49PxBlo=;
 b=qfCnWExxMuPcJz19CTGOA2Qgi3zL/7QZ+yB2PPFg2WiFBrl+37bxmpc2Ete69ce0lh
 9/R6R9PzaybyNXorMAmRhEAAHtGVdumiQ+wFAKDNDvMiWkUDyD4kuDzb9Jp6BnZGMbHn
 M+tQG4dUmaDrSdfnXHPgAbs6s6E3RvO6m8mZCF3UFMCPzj6euExrtfst5hkUiq2HWbt+
 RsqtyRW6+kZ02lhgW4NH19SV0oAHkfiftwopi5uUzD9nyrJjiNisGGChCTCnHN0YZq0I
 He9A4Ay6pGj0M+ynhgzU2nZQ+ON6okQDGO4bAHnMtfV3A6tMISOdZVUq4ySFop4Mf2Xa
 /7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dv9wvP3KHXa1E5JYZzJizwfRahjh6d3QSksZ49PxBlo=;
 b=oBTTlr20lcsWT3KHEO0I0nWJ/HouJG9SUR6bwBTQPNV0SnRlJQdAUYo87q+UzELnNu
 zArOCQbLctBz9RXT33jDMyY8AQUpZJZOrhjCxHgHvY+3NF+4tqJKJEuqv9awIzpEXFyI
 sQzUteXaO7RS6SuuNtox6ymJpXdFg1lcNX+EoeXCbC87GfRszZgFXpbs4Ehxxj7uQt8N
 ejhNx8j76gfDONvyOvkPlxUmHj+ACBt70AQdpBiBLar9kL1hIf+lrriujoKiXy6rJQEX
 S9uvJSPhfIRGsFH86NK6F/7sLMFwWV1jG4dk3JcJsNQBHUjFNTor1bwwyb1Rn/L+bSnY
 jafw==
X-Gm-Message-State: APjAAAXLmq1tgprTDV1uWBFEBMDLr+GNTB07UIkc348C5A0gJTyMyk9B
 btK0xeRP1CUbxvWbYdvZWrR1F521y/6SGJA4UMk=
X-Google-Smtp-Source: APXvYqzr2wQvMemibqCzeNPyKHqqpQoHj3NKfPKDX0qPKo6Uwpv5xAEseQG459cIo1nqrtmdWXaHvJW42m21LS6YwFI=
X-Received: by 2002:ac2:5f65:: with SMTP id c5mr4471962lfc.207.1581078385999; 
 Fri, 07 Feb 2020 04:26:25 -0800 (PST)
MIME-Version: 1.0
References: <69d80d24-d461-1652-3cfb-e55d90d31fbf@samba.org>
 <ec067a72-313e-1878-33a0-a3259d2979d5@mit.edu>
 <1503578184.3428.19.camel@redhat.com>
 <db882372-aa1d-e58e-4c94-a268539bd2ee@samba.org>
 <1503596189.3428.26.camel@redhat.com>
 <F363B51E-FDF7-4C91-9ABD-B623B5CE97BC@dukhovni.org>
 <8f68cfb0-2d6b-d86f-4ff0-a9282aa0bf55@samba.org>
 <cb0d7433-9e23-5bce-4e06-1213bf88cade@samba.org>
 <20191121223908.GC26241@localhost>
 <22f96c93-0217-0b2b-d7e1-684f9269fba4@samba.org>
 <20191122224526.GA28614@localhost>
In-Reply-To: <20191122224526.GA28614@localhost>
Date: Fri, 7 Feb 2020 13:26:14 +0100
Message-ID: <CAC-fF8S=yxgx5qL5ZwFocij_DzsHPBzf8LcZACo9HVF5DDSxLA@mail.gmail.com>
Subject: Re: [kitten] Checking the transited list of a kerberos ticket in a
 transitive cross-realm trust situation...
To: Nico Williams <nico@cryptonector.com>
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Cc: Stefan Metzmacher <metze@samba.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 "heimdal-discuss@sics.se" <heimdal-discuss@sics.se>,
 "krbdev@mit.edu Dev List" <krbdev@mit.edu>, kitten@ietf.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

On Fri, Nov 22, 2019 at 11:45 PM Nico Williams <nico@cryptonector.com> wrote:
>
> On Fri, Nov 22, 2019 at 11:24:44AM +0100, Stefan Metzmacher wrote:
> > > Correspondingly and symmetrically, the right way to request some
> > > behavior on the side where the credential is available, is to associate
> > > that request with the desired_name for which the credential is acquired.
> >
> > So you mean we need to pass an explicit desired_name to
> > gss_acquire_cred_from() and use gss_set_name_attribute() calls
> > (for no_transit_check and iterate_acceptor_keytab) on that desired_name
> > before?
>
> Oh, wait, right.  That's not going to work when you want a default
> credential.

Maybe the name-attributes can be made complementary to the proposed
credential-options, if a service wishes to inquire this info.


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AC87E20C9AA
	for <lists+samba-technical@lfdr.de>; Sun, 28 Jun 2020 20:44:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=VZkjeLFuoh7PvJDg6hPx67A/7MVEZGZ0xQjoWfK+Qus=; b=lud/PiB0xiEjAOyltDvEIsXrvj
	A/jQkSC9fW4DH83DLexPhkpozrinj/dDy7TxPYWO3K41b1+TCSsqwtwB+7/3Q886SFF08l9z8iGtu
	94efS0fAv5XEGa2lTmI3eLA3OrZrUH8LH7l3JvUVofuFJtu63YDtBP/0D3LjK1nqZzsMC1bq4IEqM
	Xe4P6HbPHh9XpzZTFkNACSwCa9A7SSy0dmholrZ5mXeQ/QQnbvv6N5UqmD5uP83qet0jehBRCkrk7
	UxvowJik+8XusG9FrIzFZSlohdA2usq5HuogadRWTK8jIaUWIjEGUwap6t5num7aSEmJv3PrMThKQ
	xVgq/vOw==;
Received: from localhost ([::1]:40770 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jpcH2-002V3p-Jg; Sun, 28 Jun 2020 18:43:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14572) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jpcGw-002V3i-8d
 for samba-technical@lists.samba.org; Sun, 28 Jun 2020 18:43:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=VZkjeLFuoh7PvJDg6hPx67A/7MVEZGZ0xQjoWfK+Qus=; b=OI6nMsQSbJnM+bCInUcxOhrQ8H
 IcWjWgVAZEAo60vJnBk7pt3uv/qWNPzUDjOjKFUgzSvSsfbCRwbr4kcfuc0vThEvzbi14TJRf5Ccv
 i3iH/oIsxLM5/o65+5qYz9SPbnEMKkgjT25Udi5DLq3AsJWiMm7KeRzNhRsmnMQc6ruAd1qUFr1ke
 w1MATvxNTzabd74IWL9nhSBYANh8/yituTLb1My4ujKzKG1bmWGEMwhcQAw+gNt9SygsCsKjROSMa
 iAXSuwAZlrAVRJhIN63HHtVpfPZcKh5A7ucDvXEYPQY/Jn0g7Bx4XYiU0RZkHp/Oils3q3hgysc37
 YCTS/TiPJDQwSZ8LdE30Q9C6laDSSqJMSg7abJcRcB7winHNRTsfg2I2TGc1svqbiyVZPd261bmU2
 UIxBuQLrpJmIKvwHrECRJTvXjNsvm4QrImkwQdIu0+mxE1Srb4AqhxB0bmgnhfIcRZLQh7wNxa6xY
 2Mkm73fD26aBX2DRXZHiRe9C;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jpcGv-0005vI-3v; Sun, 28 Jun 2020 18:43:21 +0000
Date: Sun, 28 Jun 2020 21:43:18 +0300
To: hezekiah maina <hezekiahmaina3@gmail.com>
Subject: Re: GSoC Week 4 Progress
Message-ID: <20200628184318.GB25598@pinega.vda.li>
References: <CAH72RCXajQj9ZgOuLphOmY8MseOZuXdUCTtNTKWWKg=XGRXAsA@mail.gmail.com>
 <20200628165252.GA25598@pinega.vda.li>
 <CAH72RCX8ttcU+bp6iU8CpVKNkjdnrdBdYPZ0SofEeoRXbAPFAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH72RCX8ttcU+bp6iU8CpVKNkjdnrdBdYPZ0SofEeoRXbAPFAA@mail.gmail.com>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>,
 "abartlet@samba.org" <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On su, 28 kesä 2020, hezekiah maina wrote:
>    I hadn't seen the issue. Thank you for pointing that out.                    
>    Let me try out what Martin recommended and will let you know how it goes.    
>    Are automated package builds the same as Cockpituous Release Automation?     

I think some of the scripts from https://github.com/cockpit-project/cockpituous/tree/master/release
could be used but overally they are tied to Cockpit project own
infrastructure.

For example, we can use OBS (open build service,
https://openbuildservice.org/) to automatically build packages for
multiple distributions when you push commits to gitlab repo.

It will take few steps to adopt this approach but we can go through that
in the next weeks.


>    On Sun, Jun 28, 2020 at 7:52 PM Alexander Bokovoy <[1]ab@samba.org> wrote:   
>                                                                                 
>      On su, 28 kesä 2020, hezekiah maina wrote:                                 
>      > During the week I worked on the following:                               
>      >    Forest Management                                                     
>      >    DNS Management                                                        
>      >    Group Management                                                      
>      > Repo: [2]https://gitlab.com/HezekiahM/samba-ad-dc/-/tree/develop         
>                                                                                 
>      Thanks, Hezekiah.                                                          
>                                                                                 
>      Please note an issue filed by Cockpit maintainers:                         
>      [3]https://gitlab.com/HezekiahM/samba-ad-dc/-/issues/1                     
>                                                                                 
>      Do you have any problems, questions?                                       
>                                                                                 
>      I think we should start to provide automated package builds so that        
>      people could try the package. Let's look at it next week.                  
>                                                                                 
>      --                                                                         
>      / Alexander Bokovoy                                                        
> 
> References
> 
>    Visible links
>    1. mailto:ab@samba.org
>    2. https://gitlab.com/HezekiahM/samba-ad-dc/-/tree/develop
>    3. https://gitlab.com/HezekiahM/samba-ad-dc/-/issues/1

-- 
/ Alexander Bokovoy


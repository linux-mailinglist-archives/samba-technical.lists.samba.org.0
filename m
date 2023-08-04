Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F0E7704F5
	for <lists+samba-technical@lfdr.de>; Fri,  4 Aug 2023 17:39:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Lb+2GSzocgVttmSUkbg1eM+B0mHe5YBqNfC6I3V3PBY=; b=Df31LNJ/2XBewA0frRLPXSDkKi
	SGBlFBIHD/zI+YxRIcj2sTRtuqWedprpYcRykhUU87YAFEFZ7UbKzxIzyK6mWHdaH392wi+UQ7OXW
	LUiZiS5iJBBthjhGP82a0nDFCKRTa5jo1j8iuwmqwQ5riS7AahG63mPL+NW7aDKTKOy2tOb9mHpmF
	wipQsWpS20lX7ngm7jEhdehZPQvNGVjoXkVKonb89AcSYeOsRZ4PbAc34uE7TXngsLyeY/6xGzTjT
	k/Gc+jAIZYlaPAc7QWEIVav2st8MfU81RXWTWUVPssmvfK/7SVBcatjc+ak5tSj2Qa61rz/3k+ZAC
	aXOvrN2g==;
Received: from ip6-localhost ([::1]:53286 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qRwsw-009skd-KS; Fri, 04 Aug 2023 15:38:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62316) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qRwsp-009skU-C8
 for samba-technical@lists.samba.org; Fri, 04 Aug 2023 15:38:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=Lb+2GSzocgVttmSUkbg1eM+B0mHe5YBqNfC6I3V3PBY=; b=Bv0qZjGB5CKjYBzVUGGLcq/DTq
 aT3pZkFUaGYSXd6iyJOMrsN6/R7eXLWmlB0QbT2j3ZdlC9m3thhoJXVuQqEq2uTOm4phPPv+c3yTJ
 Rb9piCK6ZkhhbOqOn2k0+8ZziguPysjys3HVyFN5zJbYtJEtIdNuhxrMdRHMatI7GZIfCSC83DYEM
 hk6zUuxyn1dcqzEQKyopsPVV2bmPBwtFhDCz4+Vh/weeucxHj55fgTgtYv9UKoCAmtxty28eGsSZ2
 FjAZLRw5voQamT15R8+YizQ7R1kZ3Tscqrvs3+3Krfg/7DnZtKUYclwDnnC85eBxtiUTn7i/hBzf2
 eBToK6CRdWE5jvAfkrZSzG6sdXVtKuS88yC4xvY5R5Pxr0sPzX5+X3KWItezlmR1bLa3nFVTk7tDv
 oEFIhx1Lg8WyK35qRYD82fChyS+ATbhVyVTrgjodTQ1kvj4gvy5MUZ3P+1xRTyejPx6dKlgyXUudP
 vz/IOjgO5v3xWnZJyO3CN63S;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qRwso-00600F-2J for samba-technical@lists.samba.org;
 Fri, 04 Aug 2023 15:38:30 +0000
Message-ID: <19061148-c951-50c4-2055-7bc226b4571f@samba.org>
Date: Fri, 4 Aug 2023 16:38:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Samba master as AD seems to return 127.17.0.1 as one of its
 addresses in DNS responses
Content-Language: en-GB
To: samba-technical@lists.samba.org
References: <CACyXjPwLkUOSFWBNnGPnQhRTZCbF7NEr3_9kiY5keMTgaz38Og@mail.gmail.com>
In-Reply-To: <CACyXjPwLkUOSFWBNnGPnQhRTZCbF7NEr3_9kiY5keMTgaz38Og@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



On 04/08/2023 15:08, Richard Sharpe via samba-technical wrote:
> Hi folks,
> 
> I have built and installed Samba master from about three days ago. I
> then configured it as an AD server and started samba.

I take it by 'AD server', you mean as the first AD DC in a domain.

> 
> I now find that in the DNS responses for requests for the domain along
> with the actual address of the server there is also, as the first
> address 172.17.0.1. I have not yet figured out where this is coming
> from but it screws up CLDAP requests when trying to join that domain
> with another Samba server.

Two things, first, in the subject line you refer to '127.17.0.1' (which 
is a loopback address), but you then refer to '172.17.0.1', is the 
subject address correct or the one in the post ? Second, you say 'join 
that domain with another Samba server', can you please explain that a 
little bit better, I ask because it sounds like you are trying to do it 
backward, you normally join things to the first DC, though I could be 
completely misunderstanding what you are saying.

> 
> The CLDAP requests are sent to 172.17.0.1 and never leave the joining server.

That again makes me think you mean '127.17.0.1', if that is the case, it 
sounds like you have something misconfigured in dns.

> 
> Have I done something wrong?
> 

Rowland


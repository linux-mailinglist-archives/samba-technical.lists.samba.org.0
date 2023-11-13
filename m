Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2188E7E9DEC
	for <lists+samba-technical@lfdr.de>; Mon, 13 Nov 2023 14:56:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=si8GVCKZJ/wEHbG62Pv89NOHpKpROPOsT/6W0nYmqdQ=; b=F+aGzoHA/A4BCc/PxXaQfDCJb5
	MYOoFtOxUVnFHY+8Q42CYhaEVQwrX3z1dr1U3iqMqvjsQYb5rWHImmwv2B0d0wbUyf9brg6+rU+8i
	xEtAmFweopg9ZMTpmIKu8ZY1mFFOCRsRuT4tuGmv8xE/v0Mn4w9AAyLzB8jrh6oM0dCAIXuzf+VBZ
	xrkImU2Kbn2ZwrveANfGy6z07aVgm7E1XTcsMbfuDB3uEI3ruffpgmObrwJX9E1va0cNixGsJDyR7
	u6gAmfLQq2yP923Z2+j1Fr/FELvnZa/DuFMsdDtXwYv6cTdv+0qDCkoRqmUtvbROiD1k4slQo/SGT
	GYUgKMLA==;
Received: from ip6-localhost ([::1]:64086 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r2XQR-007wkG-8f; Mon, 13 Nov 2023 13:56:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36446) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r2XQL-007wk7-EK
 for samba-technical@lists.samba.org; Mon, 13 Nov 2023 13:56:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=si8GVCKZJ/wEHbG62Pv89NOHpKpROPOsT/6W0nYmqdQ=; b=08PgwqunrGpFqLPq2VqJLG8hS0
 crVgr6U61bxzrprYH3Mp8HxC3J3+Vx71xvKAUzc45Ub1DhEGJzGUjjxjyPbXW4jOr0FSdZ0HE7tOl
 bK1t+fJ6diN/Hgf5oqw+Z8L+TcOxCdTvlhrlxZJXJfwCNzIF+OkJTXdJOpFmxQvuCoD79Z4dGVeXs
 Kn1GfQLVLg/bovr1atWhbEWoqqa6tr5Qe0QyThNDuymwSlKqZnZIR4PhQvapN7SlJ+hK7ZwPAIbks
 6QREgM5pMBamUEsqUIsWiEkLYfk0Cm4RHry4TYAwxQbANfVjxKuHNP8ltEwTUZB0Qjy+WmBEc4JE5
 yQY6O4xWcQo0H9zqAmUZ3HhpXbPK5yqpxAaS+/jX+J9FJ5dsGgftybd0EStNrnoV7/t9jyq0e4UUb
 Ay6ubcqoJkCmf2Gvkn8rhGDToKiKcE1GP6MEfWOwIUsf8G0y5pbKsSiA3IEczvJN6mnnhOXggC/C7
 T6Zlo/GTAkaTt1GGL3QMxQS5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r2XQI-005vPd-30 for samba-technical@lists.samba.org;
 Mon, 13 Nov 2023 13:56:19 +0000
Message-ID: <19507e01-a2f0-fcd1-9b98-47a72cdf11f2@samba.org>
Date: Mon, 13 Nov 2023 06:56:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: I want to make ADCS support better and I need some advice
To: samba-technical@lists.samba.org
References: <922de58f-d011-427d-8248-9f8ce7c90e74@app.fastmail.com>
Content-Language: en-US
In-Reply-To: <922de58f-d011-427d-8248-9f8ce7c90e74@app.fastmail.com>
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
From: David Mulder via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Mulder <dmulder@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


On 11/10/23 7:09 PM, Joe Dillon via samba-technical wrote:
> I want to improve samba's support for auto-enrolling and auto-renewing certificates.  I've identified a few key issues I want to resolve:
>
> 1. Certificate Services Web Enrollment is required for discovering the PKI environment.  Web enrollment, while *probably* installed on a CA, isn't a component of auto enrollment, per MS-CAESO.  Additionally, CAWE *most likely* presents a certificate anchored by the PKI environment, which presents a chicken-egg type problem for using it to discover CA certificates.  Samba breaks this dependency cycle by retrieving the CA over HTTP, but that presents an opportunity for an attacker to potentially inject a rogue CA.
> 2. Samba's discovery of enrollment services/other PKI configuration assumes the current domain is the forest root domain.  I'm trying to work on this as a good first issue.
> 3. The GP client is currently limited to interacting with CA servers that expose WCCE and WSTEP endpoints.  These are optional roles, and as a result aren't guaranteed to exist.  Samba has MSRPC support, which is very unique on *nix platforms.  Samba could support MS-ICPR for CA servers that don't provide the web protocols.
>
> I really want to help improve the above.  My challenge is my python skills.  I've written most of an MS-CAESO client in rust.  Should I complete this rust client, would it be of any use?  Should it be wrapped up in a nice python API?  Can I submit the necessary code to add MS-ICPR support to samba - purely so I could consume it myself?  Should I scrap the whole thing, learn python, and rewrite it?

I'd additionally like to be able to contribute rust code to Samba, and 
I'm certainly glad to see someone wanting to work on certificate auto 
enrollment. I know there is some opposition to providing rust code in 
Samba, I think because of platform support.

Would you be able to contribute C code instead, perhaps? I could help 
you tie that into the existing Python code. Take a look at the bindings 
in `libgpo/pygpo.c`, for example.

-- 
David Mulder
Labs Software Engineer, Samba
SUSE
1221 S Valley Grove Way, Suite 500
Pleasant Grove, UT 84062
(P)+1 385.208.2989
dmulder@suse.com
http://www.suse.com



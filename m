Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AB96F7ECE5C
	for <lists+samba-technical@lfdr.de>; Wed, 15 Nov 2023 20:42:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=Q3r3VBfzbtE/sxeXhhNLfxnAN1xYv459goca+Uj8WKs=; b=LJvKFD7Z9rXvjcGQhoN8M7bWP1
	4qGxchj3GH0OqtGb2/H7TnSe2keea8vvjcfMEnkBMjSXTROvY9UX4eiJpr8UIVB8vIpNmwaugFrPY
	99AUmSXCrVGB37xojp4Ka47BPtxiNZpuhS5RJxfeghf6Kc1pH+b7gwOVDvGdqrAMzuBVsMppj5H1Z
	uuIsCOurhvIjvnaRkvCLjHdaI7ZPBNHmomh+TsZ+uusENWuSUNiMmhLOHRwMM+RYGl7Tg+pl0lWWR
	ih1G54cLbPgOXF+CnTRp2oBNtyxoqLTt3CnNRj+3l8rTgveZ0lqff4LIqjkFghGdd2gHTZ5SgCT56
	Wv41Tt9g==;
Received: from ip6-localhost ([::1]:44256 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r3Lls-008TvZ-Vg; Wed, 15 Nov 2023 19:41:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53860) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r3Lln-008TvP-AZ
 for samba-technical@lists.samba.org; Wed, 15 Nov 2023 19:41:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=Q3r3VBfzbtE/sxeXhhNLfxnAN1xYv459goca+Uj8WKs=; b=gY9G/Yd58KjY/z0PbAdv1Dm+Fo
 kUB8/SxjtlpYRMrI2P1hQvzMlVK0D1UQ+3k86k50kECtadd002RGcWBWem0qj4Eb2l9fK2ls6Pjqp
 ZpAO1luab+RqWIgCKOPoYZ4zf4kkB9Fu9x0EXq/ULoqeSx5mMtMyo/x39OYe7Mqcoz0GfJuydNqNa
 kbjiwdepq2c9ecVK9XoCsMZYRX6k1Sp6s9KbYjD/qT/hZJ+tKk7w3T8OkzgGZDXVVUSH3u+tv7zB5
 RPHeRC9awwiGPdnqAukUWEu44+NbpTEtGrPkEOhRadU/YoBk87BxyaXjD90aFrF+ebLOhPuMzaNmd
 V/03dwOgKKrty8ZEGeeDCd9dE84VBoHWbLVzspNwMUPCL0MK613cxQGGy8POetRhvtPh39Gx6qN79
 TWhjnsLcsJxIXtL+g3JSgUNGXH0fk8egtN8Bv05pypWFCmQ7nNApqmSGJMOYQpRbHhVlzRqwcwIb0
 ibSbh72PEDJwIes3V/GWnjAS;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r3Llk-006OG2-1c for samba-technical@lists.samba.org;
 Wed, 15 Nov 2023 19:41:49 +0000
Message-ID: <66505624-8efa-843d-ede0-8968d2951f59@samba.org>
Date: Wed, 15 Nov 2023 12:41:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: I want to make ADCS support better and I need some advice
Content-Language: en-US
To: samba-technical@lists.samba.org
References: <922de58f-d011-427d-8248-9f8ce7c90e74@app.fastmail.com>
 <19507e01-a2f0-fcd1-9b98-47a72cdf11f2@samba.org>
 <6c0ddbb6-4375-4d18-8e4e-0114dc7736cd@samba.org>
 <4baa6aa2-052f-1e19-63c0-ef3711d9febd@samba.org>
 <7b96929d-54f6-4e2f-8180-2810d7b6ae10@app.fastmail.com>
In-Reply-To: <7b96929d-54f6-4e2f-8180-2810d7b6ae10@app.fastmail.com>
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


On 11/13/23 2:53 PM, Joe Dillon via samba-technical wrote:
> AIX support is a tier-3 target in rust: https://github.com/rust-lang/compiler-team/issues/553.  Samba already depends dev-depends on rust (selftest requires python3-cryptography).  What's usually a showstopper for rust is gcc support.
>
> In my opinion, it makes the most sense to not re-invent the wheel though.  I had to write a Certificate Management over CMS implementation in rust because one didn't exist.  Python has python-cmc.  Would pulling in a dependency on python-asn1crypto be acceptable?  As I understand the source, the samba python module doesn't pull in any dependencies right now?
>
> Am I correct that the modules samba.dcerpc and ldb are currently undocumented?

I've hacked up a way to build Rust via WAF here: 
https://gitlab.com/samba-team/samba/-/merge_requests/3394

This is ugly right now. There is probably a better way to do this. I 
don't understand WAF well enough to make sensible changes here.

-- 
David Mulder
Labs Software Engineer, Samba
SUSE
1221 S Valley Grove Way, Suite 500
Pleasant Grove, UT 84062
(P)+1 385.208.2989
dmulder@suse.com
http://www.suse.com



Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFFB4DE11F
	for <lists+samba-technical@lfdr.de>; Fri, 18 Mar 2022 19:37:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=fAfBoZQIsPokKikRM2oyjZzvNid5uT2n6K/I+9nUa4U=; b=PwI+0cqUMbk9dCCseRth04riT+
	kHsNWFe9dUbhqcKts5YkvUkIWd9zhI5XygU+Sy/Atup0nvOl545MFu7mEhLPtQluQyHv5f+Nr1gfd
	yKjn/OUoNDaZtDrRJG+cVeTndS2x8r0I+XDP0E/hqym4mKmokDLzfnXCE/f55kqgLAHnX7AGHRvbl
	IpT9QnePYyEy6MS8sGfQ/o84/SZGwhcmp1zCrG9BwGOyYRUAKJqCnpt6PFH4FO6EPvSu9HBTWzKdN
	KRru9dstd1yHJNRX9ZeZSttkvM//k8kQ2h5ZyKCOgvPhVN4/FSQdFskBa9UTqpk4WI9QGzbbcR8CB
	UFMyXKiA==;
Received: from ip6-localhost ([::1]:59042 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nVHSR-003UA2-S4; Fri, 18 Mar 2022 18:36:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37706) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nVHSM-003U9s-8t
 for samba-technical@lists.samba.org; Fri, 18 Mar 2022 18:36:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=fAfBoZQIsPokKikRM2oyjZzvNid5uT2n6K/I+9nUa4U=; b=siGjJnf5P6VQBwbAh0zyR+r6d8
 FHQyZnbFDTzsHks0JDkwM/EZbn8IIPGgeBnwAtl+NC7sy4g4AoklchFrDAAxu0MX2zwZnXGWDzb8+
 hIwm2+TeHDwe8fHI7xJJ5kuWiuyPoR3jyuyUDahpU2xodl3zmQ3G4noHR5JXOo+R9684p5R52rohJ
 sIjohUg42CIY5l5eC/hnmnMYLa4PdBAAA8eSqv1UTQ7G11UoePW3DiiEJisY3OxbmoDIHQYEWlicA
 dh4x7yIXklx+JcW5slePmULMkL7xWF9tXrJt/u+fqz7/YlSzBh8PHedfTuykzazAgXhu+cNfj5QUz
 TKWhclgmYA4fhBhJU8QCmlronimWXuSMRrbKSkCbYwNSKOMh3J2VJt+DunA4NRPzT8a3tbXTAleG8
 t0UsvQwQzJwxcGoSxYx/xUDg6ikMAeHm1leIdWJyDGXDDoO+lk0vSUoMxHP+/lwV71Hd4uNPrvs7T
 o1J31NIOUKM6uGsycMzZv/27;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nVHSK-002Bfq-Bm; Fri, 18 Mar 2022 18:36:09 +0000
Message-ID: <0d1584239bc53567cb2165074b63338d6570f4d6.camel@samba.org>
Subject: Re: We need to rework FIPS mode in Samba
To: Aleksandar Kostadinov <akostadinov@gmail.com>
Date: Sat, 19 Mar 2022 07:36:05 +1300
In-Reply-To: <CAH9M6r+uJ8VPTdHy_=094QXOqQaf63DpfN9H0k0kUaKfUk5ajA@mail.gmail.com>
References: <e0c3b5921e018a5b74448f40a26af4015193824c.camel@samba.org>
 <CAH9M6r+uJ8VPTdHy_=094QXOqQaf63DpfN9H0k0kUaKfUk5ajA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35) 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Correct, Samba can't be FIPS compliant, but we can avoid using known
poor cryptography not for certification purposes, but for sensible
'secure by default' or at least 'can be configured to be sensibly
secure' design principles. 

Just as you wouldn't offer SSLv3 even when the host is not FIPS-140
certified.

Samba's CI system runs on a Ubuntu 20.04 base for the majority of the
tests (as mentioned, we run a tiny number of tests in a Fedora 35
environment to test "FIPS mode"), but most importantly the final
autobuild is under the Ubuntu 20.04 platform, so we should ensure that
our tests are run there when possible.

I'm quite disappointed at the "FIPS mode" in GnuTLS is optional in this
way - also denying any application or administrator the opportunity to
opt out of weak ciphers on a per-app basis - but that is life.

Andrew Bartlett

On Fri, 2022-03-18 at 12:07 +0200, Aleksandar Kostadinov via samba-
technical wrote:
> How can samba be FIPS compliant on a non-FIPS compliant operating system?
> Might be easier to just run the tests in a FIPS compliant environment.

-- 
Andrew Bartlett (he/him)        https://samba.org/~abartlet/
Samba Team Member (since 2001)  https://samba.org
Samba Developer, Catalyst IT    https://catalyst.net.nz/services/samba



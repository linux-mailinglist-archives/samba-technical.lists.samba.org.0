Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8823978375B
	for <lists+samba-technical@lfdr.de>; Tue, 22 Aug 2023 03:30:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=9K9hA1r7SgBuHAj2D/5jIzPt9pozJ+Zyshk33uN2O4o=; b=k/a5l874+YyQ1lAe/UVucK/uFq
	BZHQoEvDGaywqOGgpeZKlN/4mgKJJAx4CRNZoRVF9NwFQb6St10z05KKthLkuIdZxVsM2PrI7DjtM
	nPzmgyVm413nuatfjNxXT8n8vP3B6aSp2ROBFtueRQADZ1Aagnl/EgcZS4OJ6rCYZj6YhN7KGiI47
	BMIyijM17Flh1YoovQ6TlPeKSNn0Xl8og0i+3IB98IwluGuhicHrKKOrlj1UVldVcWtk2zasGQgtW
	ODoSENQNeVPhgRXEEBST0qfZ2Tq76CO91BFhTatl3kBDmdzSdBlUoXnikau32mh/k017jAqXLtvHw
	Igq/dgqg==;
Received: from ip6-localhost ([::1]:29340 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qYGDL-00DqSC-8f; Tue, 22 Aug 2023 01:29:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23284) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qYGDD-00DqS3-H7
 for samba-technical@lists.samba.org; Tue, 22 Aug 2023 01:29:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=9K9hA1r7SgBuHAj2D/5jIzPt9pozJ+Zyshk33uN2O4o=; b=VTuaiTW5V/yk8CuYEgMslAo1iP
 RHpFIrDGQDFBtuEnAUrrzVKSoYkdFqN8OXZc7O9xDBTbKkmIBF8kB67mWzc9QAhNb7hisoh78RYxx
 ahXzWNk2zzJd6mFoD8Otk7OGCcnrJtVnZmS0dS8R11waBlXAXr5cBbcI50hAcxsP4H4UX5o4TUhwA
 yFgV2YeRgk//OwcyB34VJf2OmWglWtM3iPsYxV/2KVFXak+hQcnai2KtV8bJHHRqWUt16LWXiYUJC
 t8Fjt+fKp8jyDwzuwwJ5KmEjk6etrLb0FCooTyEIJUMSGnw5r0k1nkxl0wx7bLDhddTv59e3GiEpR
 IrVRNng8/sCC1uPr28uZF5NgUhDNoX+F3Z38Uc96+U6/nDF0AYQJs5gBUi/rr+X7qfzMT6OoKqFb+
 FbzHEsJ6+eNG1kXbWl9HSmmdIQOQRV+58KZ7oV/+hWxQOK7junkn9/NOqYqSvuEooQRRD7jObifOJ
 9uaLuqd+l7UV90kjjWtJ2AXf;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qYGDC-009I5j-1l for samba-technical@lists.samba.org;
 Tue, 22 Aug 2023 01:29:39 +0000
Message-ID: <47072be0-982f-d844-8868-aa3b255fc8ea@samba.org>
Date: Tue, 22 Aug 2023 13:29:30 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: codespell mysteries explained
Content-Language: en-GB
To: samba-technical@lists.samba.org
References: <9a667dfb-0f7f-71e9-c5b8-885bc7570d8f@catalyst.net.nz>
In-Reply-To: <9a667dfb-0f7f-71e9-c5b8-885bc7570d8f@catalyst.net.nz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
From: Joseph Sutton via samba-technical <samba-technical@lists.samba.org>
Reply-To: Joseph Sutton <jsutton@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 22/08/23 12:58 pm, Douglas Bagnall via samba-technical wrote:
> I was trying to run
> 
>   codespell $(git diff origin/master --name-only)
> 
> to catch my typos before CI does, but they seem to find completely 
> disjoint sets of complaints. That is, *none* of the local codespell 
> issues were raised by CI, and vice versa.
> 
> Locally I have "codespell 2.1.0" on Ubuntu 22.04. It doesn't care when I 
> write "secuirty" in a C comment, while CI does. And it does say a lot of
> 
>   python/samba/tests/sddl.py:193: BA ==> BY, BE
> 
> which CI doesn't mention.
> 
> Adding "ba" to .codespellignore makes the "BA" complaints disappear. I 
> would prefer to just ignore uppercase "BA", but when the manpage says
> 
>    Words are case sensitive based on how they are written in
>    the dictionary file
> 
> it is saying you *can't* ignore uppercase only if the codespell 
> dictionary[1] doesn't contain a "BA->..." line. It doesn't.
> 
> [1]/usr/lib/python3/dist-packages/codespell_lib/data/dictionary.txt
> 
> The local dictionary also doesn't contain "secuirty". The upstream 
> version does, and it doesn't have the "ba". So that explains everything.
> 
> When I started this email, it was going to be along the lines of "WTF am 
> I missing", but it turns out to be quite simple. If you have an ancient 
> OS (from, say, last year) don't expect to be able to replicate codespell 
> CI locally.
> 
> Douglas
> 

It seems that there is a way to get a more recent dictionary for those 
of us who are stuck on an older version of codespell:

https://github.com/codespell-project/codespell#updating-the-dictionaries

I’m not sure exactly which dictionary the CI will be using, but the 
latest version should at least be closer to it than whatever Ubuntu has.

It might be a good idea to use the ‘-D’ option in codespell.sh to 
specify a particular local dictionary (or dictionaries), so that 
spelling is enforced consistently for everyone.

Joseph


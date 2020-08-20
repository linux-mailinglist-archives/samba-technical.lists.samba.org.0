Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FFD24C8A8
	for <lists+samba-technical@lfdr.de>; Fri, 21 Aug 2020 01:37:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=u+sHvFioM86vRCESRgOd40yOjJmIfnWe2mBRJldmIIs=; b=Y9jwnRhOZusIe83kn8B54ovDun
	P1mRdAO7lKdY2mmvBur96U+LOigPbp/7ZynTXKf7XUgf3ONRE3pCoo8jr3VClZNNWoVaa7txu2o3l
	Uo+iG/yaUBQ3Eb038Ba188Icu/rbICwucQSJuB+Sggh+1px9a1upVdnB0DzvT6p4u1SmU2sqYvT1t
	6oJkfqXzfyGhd1evpRbK6tedvsckLISQsEWTPiGrsblDvaQUpGdZD2G1trpiu8x8FaTJAwo60cczt
	zoiun8DF+zViXv+1TxZkau5c9i77NeDXAKG45u71RrcV1Y0M17aGW9yEB6x5GYTy1t253V1eiQnwJ
	ollbRJiw==;
Received: from localhost ([::1]:58770 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k8u6t-00EVEA-OJ; Thu, 20 Aug 2020 23:36:43 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:53692) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k8u6m-00EVE3-IM
 for samba-technical@lists.samba.org; Thu, 20 Aug 2020 23:36:40 +0000
Received: from [192.168.1.110] (unknown [114.23.142.188])
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 065F181511; 
 Fri, 21 Aug 2020 11:36:24 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1597966585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u+sHvFioM86vRCESRgOd40yOjJmIfnWe2mBRJldmIIs=;
 b=Bl9KaTf8qUoYD6/d3cSQbJzDpgERPig98R0PK6tRdTMq4ET9g7kj3vrfCQMXa6BReAWmu3
 yGmaM2NanZVrZjykM3FdX63nZih41IL+uRBEp6NxBXgI4wfDGB0Oh5jwJ3PZp8tQMOfRvE
 YlDce/8wD5hHs1DPZ/PUWVd7SnSa1eH/p7zme3gfJ0scFXu+9ZHbRAhpwN6mpIzU4qogos
 4+tQ5rGY45/pbHKLdg7BwPC4oy2s6+lNODOMMYO/ieT1Ve7jzVd13RUX0TrkIISdiCxBoR
 z+8ya9QQDeH2oFCi1SF/kUbgTLi+IsobLjhWfhWygVHmitt57JVFqU7j3T28RA==
Subject: Re: "auto" for Kerberos, a history
To: Stefan Metzmacher <metze@samba.org>, Rowland penny <rpenny@samba.org>,
 Andrew Bartlett <abartlet@samba.org>, samba-technical@lists.samba.org,
 Andreas Schneider <asn@samba.org>
References: <3749194.YmznvRLumo@magrathea>
 <02a8997f-b8c0-617a-2744-c970de255dca@samba.org>
 <88fea226ef46a6f2dc702c74e413860bd3425ab7.camel@samba.org>
 <239bf247-b000-511c-cf12-d83a037e3c83@samba.org>
 <775998ab-6432-2007-7849-19e4c5ced421@samba.org>
Message-ID: <90412921-9cbf-cde3-0e2d-539eddb0187b@catalyst.net.nz>
Date: Fri, 21 Aug 2020 11:36:24 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <775998ab-6432-2007-7849-19e4c5ced421@samba.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=douglasb@catalyst.net.nz
 smtp.mailfrom=douglas.bagnall@catalyst.net.nz
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 20/08/20 6:53 pm, Stefan Metzmacher via samba-technical wrote:
> 
> yes means no fallback to NTLM,
> 
> Should we use "disabled", "if_available", "required"
> instead of "no", "auto", "yes"?
> 

I am a fan of "auto", as telling the tool "you decide".

It is nice for the user because there is a convention, and it is nice for
the toolmaker because there is no implicit guarantee about what decision
it will make.

There is considerable precedence for --foo=auto in command line culture.

The biggest cluster is --color=WHEN, where WHEN is conventionally
always|auto|never. This is shared by  ls, rustc, rpm, tc, grep, ip, git,
and dozens or hundreds or thousands of other tools.

While --color=WHEN's always/never is a different take than yes/no, yes/no
are usually also accepted:

  $ ls --color=maybe
  ls: invalid argument ‘maybe’ for ‘--color’
  Valid arguments are:
    - ‘always’, ‘yes’, ‘force’
    - ‘never’, ‘no’, ‘none’
    - ‘auto’, ‘tty’, ‘if-tty’
  Try 'ls --help' for more information.


A very brief search for other --foo=auto options reveals:

cp --reflink=auto --sparse=auto
xz --format=auto
flake8 -j auto
git log --decorate=auto
git format-patch --cover-letter=auto --numbered=auto --base=auto
etags --language=auto
gpg --trust-model=auto --tofu-default-policy=auto
valgrind --expensive-definedness-checks=auto
crash --kaslr=auto
grub-install --core-compress=auto
mount -t auto


Now, of course, I am not saying we want to follow gpg's human interface
guidelines, just that this pattern will have some resonance with users. If
the option is "if_available", people like me will be always forgetting the
exact term and whether it uses an underscore or a hyphen.

OK, so sorry for being late and somewhat bikesheddy. I don't object to new
more precise terms, but please let's not remove "auto". It is alright to
be vague, because it is SUPPOSED to be vague.

cheers,
Douglas


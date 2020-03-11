Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AD1180D0C
	for <lists+samba-technical@lfdr.de>; Wed, 11 Mar 2020 01:59:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Gpr+UadmaB+r0Bo6LUn87vancMB7AQnSdgOU+1tiLH0=; b=uBtnkIfiTR6aY4P14OAmQ4iWPO
	+/XoG3bweOcabJRSHL1L278z626XVdjIQffoF7uYYlhC2dYCVwmH6hSAcuGLUse46/zzpTQLT7naO
	gWv/6uWmf9ur+Lex7wWbODp6PSpzWYwJtfqT5SfCGD15fXa+hBpsYePk1GLEIS4cDyNo1dTp/5i9S
	Cqyd6a6k3gEA3qWaTVQoy0OCMKUHxV4K/7WXUC6uWBsJ0rLHRC9bnfd/0+eoTlCOT+YSYlTUhxESf
	ogvH6gqCw6TkUS9oh9d/uPAWYfCxH7w0taVwoPx21p0iL/a62l0MkNI23/pU+jUUkwO4KD5apDpTF
	O+bxv/xw==;
Received: from ip6-localhost ([::1]:54316 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jBphs-00FmzM-05; Wed, 11 Mar 2020 00:58:44 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz ([202.78.240.226]:42114) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jBphl-00FmzF-Lu
 for samba-technical@lists.samba.org; Wed, 11 Mar 2020 00:58:40 +0000
Received: from [192.168.1.110] (unknown [114.23.142.188])
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 311CF80E61; 
 Wed, 11 Mar 2020 13:58:18 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1583888298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gpr+UadmaB+r0Bo6LUn87vancMB7AQnSdgOU+1tiLH0=;
 b=E/oOa/dB+Ww8a53PP1DyB2wg6XHUGcBbsM0b0HwdP1ftPIYL36cgWiysvWD1bmYQkNM/eD
 7B4Cbm/0vrcscW9v2Is28+KsD0K2mc7pMegAkIgwRAXJBhyx3hQrJQtzBGd/80ndiNmgek
 KobQdWoBU9eHEUkSslsI01YbeDZBgRXd3NM31psalnfGyn14ACLFEjiILdL43O39U98G6z
 nRdAEBMVRl6cDN8jmPVBW731HuEcxmIaY1QyG/Ev98rnko8ITR3V2mFZbNN4sSw3uYaSAU
 gNitOs4MZLh2HnodMnXYGI5zx6CwaqnlzG1vW+Gf6iOU/ujoH4O1M0xU2cD9Jg==
Subject: Re: Idea for someone: Run with python warnings in --enable-developer
 mode
To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
References: <6288bb3c3367182cf773c932d85e0144de6fa3a3.camel@samba.org>
Message-ID: <dee6a471-b4e4-669b-6632-b102b3765eb4@catalyst.net.nz>
Date: Wed, 11 Mar 2020 13:58:16 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <6288bb3c3367182cf773c932d85e0144de6fa3a3.camel@samba.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 11/03/20 10:21 am, Andrew Bartlett via samba-technical wrote:
> We got a wake-up-call with "samba fails to build with Python 3.9:
> invalid open() mode U"
> https://bugzilla.samba.org/show_bug.cgi?id=14266
> 
> We need to find a way to run waf and selftest with python warnings
> turned on.

With Python 3.7 at least, you see a lot of warnings with:

PYTHONDEVMODE=1 make test

which leads to crazy commits like  c247afbda00013bf4821e5a2d4f3166bf31814f0.

From memory, most of the warnings are really false positives, warning
about unclosed files in situations where we know the GC will close the
file soon and we aren't opening them in a tight loop or in long running
processes.

Also from memory, there are more interesting warnings in waf and the
wscripts than samba itself.

> It might be as simple as setting an environment variable in autobuild
> or .gitlab-ci.yml, but my current gut feeling is to control it in waf
> so we can see it during routine pre-commit testing.
> 
> I would like, just with our C warnings, for --disable-warnings-as-
> errors to work, so we can still build older versions of Samba with
> developer features on newer python (which might have deprecated things
> we use). 
> 
> https://docs.python.org/3/library/warnings.html
> 
> I think we want to set PYTHONWARNINGS=error into the environment and
> have waf set on itself
>  
> import warnings
>     warnings.simplefilter("error")
> 
> Is anyone interested in taking this on?  Of course what follows would
> be no doubt a pile of warning fixes, so it may not be a small task.  

I think it would be quite a small task once the file warnings are ignored,
so long as third_party/ is swept back under its rug.

(that is not me volunteering).

Douglas


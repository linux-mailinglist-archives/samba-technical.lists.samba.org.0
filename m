Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4826579FC6
	for <lists+samba-technical@lfdr.de>; Tue, 30 Jul 2019 06:13:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=zbD7nJtbaX9t8sFRlNjNhKhp33Bj5XvXuDROO/z3Jn4=; b=NIwzsjXE6lshFS7ohhEwbz6Sgy
	Qq7D0JYZOj0LucnOYL9SKmbjCSXs4kAgDGj2EomFxJ6hE8NL4/NobgNKOaowkvi/cqAG+YEsjb9gd
	172PJPFLmk8hHivuXIDlMfBMa8xEFLTZU8veYl92kXnOoNy7uT0EwJ7yiJu9W9QXKpHjSp5F1HWXC
	pgxwv5dSYt6kXQCEgbxrnkXcMY5FMvZ7uAd1rc68bc5SyznuNSdxbMckBAP3zQSlHh6rk3jtknBYf
	nzy+84F40iYqUn8k5Fl5d0NeF9x76iggx2yzYudYv7ANPfRdlhMV5FutN6visaOUty4xTsR45KzDX
	hjIkN6jw==;
Received: from localhost ([::1]:62946 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hsJUc-000shB-1U; Tue, 30 Jul 2019 04:12:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48250) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hsJUW-000sh3-Rj
 for samba-technical@lists.samba.org; Tue, 30 Jul 2019 04:12:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:To:From:Message-ID:CC;
 bh=zbD7nJtbaX9t8sFRlNjNhKhp33Bj5XvXuDROO/z3Jn4=; b=G4bamcRZXIeE9bIkikak27+Nup
 GNj+bDHBnDRHlaiFECc9UNBswyoytg4CnGWI0bRbIKUQrx+vy2ayE1zCKtBTJihxI8ZdjUeAdDjgA
 /kMm/O5tgPTgD0jnRqyzdixsELYedhebvtXEhofVGpp+jjqBSlV8/DkCJoZY4O/1okWw=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hsJUU-0005zK-OQ; Tue, 30 Jul 2019 04:11:59 +0000
Message-ID: <1564459915.4261.33.camel@samba.org>
Subject: Re: RFC --picky-developer (for developer builds)
To: Noel Power <NoPower@suse.com>, samba-technical
 <samba-technical@lists.samba.org>
Date: Tue, 30 Jul 2019 16:11:55 +1200
In-Reply-To: <82e23c37-0bdc-e35a-373c-71b0591becd9@suse.com>
References: <82e23c37-0bdc-e35a-373c-71b0591becd9@suse.com>
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAIAAADYYG7QAAAAA3NCSVQICAjb4U/gAAACRklEQVRYw81YS67DIAwkVe8FPRm5menJeAu3lmUCbyBGKqsmRXjwb8Y5aq3hl9Yj/Nh6Tu0upZRS+EdKiV+e5+mJqMKLiHLORBRjzDmbc/hlvb1QD2k3sG84+dhhvF6vlzymlNY8dyBJzUdLjAwyvaeU8n6/2WHpu/xDRkREJI8cOBMgfuRQxhj58JzzbBwhQDFGA07M6/efE0MQxDHGFvpdQHy6MUxqtU4yezRcH0B4GfbM44BWGqOurF6Omz140a0ASimJvdbwZT32XrpRh5yuwY1d0vPrdNkv91+T8uBRG8l1uiX+JtsHxPNIWE27ugwTctTdHCIiYXvuy4P7IDl0CxAzl2xgZTJwgw+g3kGaHwYh5g2sljyrjIVEq4pYBg2Kq3yXZ5WxjfO7zF9jRdXrnLcEmlbTRnNpcT0gvpTScUC2HlOE2ipAvPuJanMT+Xc0PC4dFzu1DEO4HgczaS5kOnZ4vM7zxNU+mtRyRVPDgqyX3cdx8AQCCrQnfkV9VzMA9Ryg3ek8Sgsg3QX+nbz03Og5l10ytp6HusQUwpjd1rnsksbHlhjuVGdBAbWzIiJu5MvEFkA6OkiwBO4uQL3ADeQ9b57t74+FBo1s47IqpVxqBDcuQ66r94QQJOH2ctnAf9oZtdbZYejpi2bQEveO0sb2JXu09OJJrnpil4SV5G2N6Y+1QjL+gHSKDApHJoJWF3hW2fInh6lutGW216OPRBZtRZscwyQvI+KuTj3rp4VP1VsAcTobxgDngukqm3LPgmL8A4m377Y5OvTKAAAAAElFTkSuQmCC
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2019-07-29 at 09:48 +0000, Noel Power via samba-technical
wrote:
> Hi All,
> 
> I had a merge request https://gitlab.com/samba-team/samba/merge_requests/591 (now closed) to enable --picky-developer for developer builds, this was a pretty low impact change to make developer builds build with '---picky-developer' by default.
> 
> note: it modified the configure.developer wrapper script rather than the --developer option itself
> 
> Metze however pointed out that he had an old branch hanging around trying to achieve the same result (but I think at the time too many warning as errors still existed in the codebase)
> 
> Metze's branch:
> 
>   a) removes the '--picky-developer' option but instead make the --developer option use the same flags (in otherwords make --developer do the same a --picky-developer)
> 
>   b) replaces the '--picky-developer' option with '--disable-warnings-as-errors'<https://gitlab.com/samba-team/samba/merge_requests/667/diffs?commit_id=3195e4a57ea74fae2b81536b327c13148b1529fa> to allow to avoid -Werror

I really like this, as it removes the social/professional implication
and instead talks about what the option does.  

This is important as often new/old compilers introduce raise errors
unconnected to the developers area of work, but which impedes progress
(occasionally there is even no acceptable solution, except to allow
warnings in a subsystem). 

Just as some are forced to build with --abi-check-disable for
environmental reasons (no, not that environment, the other type of
environment... ;-). 

> I think Metzes' approach is better and so rebased his branch,  (see https://gitlab.com/samba-team/devel/samba/pipelines/72975003)
> 
> Surely it's better (for developer builds) to be as 'picky' as possible and ensure we keep passing with that)
> 
> what do others think? I'm all for merging this but such a change probably needs some wider discussion/agreement

So this is:
https://gitlab.com/samba-team/samba/merge_requests/667

That looks OK to me.

Thanks!

Andrew Bartlett
-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT   
https://catalyst.net.nz/services/samba






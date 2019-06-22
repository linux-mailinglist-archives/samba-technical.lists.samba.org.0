Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0FF4F7F4
	for <lists+samba-technical@lfdr.de>; Sat, 22 Jun 2019 21:34:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=KC+19wjrDyV/hPKtN2f5znaLyMTbl5JeFD7f/GoBGLg=; b=NK9+zl/GKOLbbmcP6Iv3TpVeyl
	wmtrC6VO4za9n67DE0VsrZnxnCw1EY4zUk83zEAXsk3+X2rDmOZ86gHHBxWolGl6wECC6gcMFQq6k
	m6j7QLRLCT8xs+tgrB8avFYFvtrGYA4oEa25JeRILGhh+EAeac8aHnxyq2M4XfPpyulVEugs8fmGg
	PzilnTicCPi5mOQuou3KnbHd27Gq6UvIB7VEc7CZ6MDAResc1ttGcF4YhWrghzcuO6Qwkco+c0svT
	BUrvsw2+qkP4toSPjNvaXWCQ/lrq4aNwHGl2LvwvsruZCyWX/Y0FBT3M1M2tG0IKYL+1ZvX1pFyq2
	M0yKA2Qw==;
Received: from localhost ([::1]:49950 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hellV-0017sg-83; Sat, 22 Jun 2019 19:33:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26946) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hellN-0017sZ-Tu
 for samba-technical@lists.samba.org; Sat, 22 Jun 2019 19:33:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=KC+19wjrDyV/hPKtN2f5znaLyMTbl5JeFD7f/GoBGLg=; b=gdX0unOfIIYiWtXcVYDW/9rQA/
 oaq4zEZrCR/EWqbekNTNGJafBBCBlnRBvs4d8KU+4SA7LJz5UlGvh7H1pJgADQsg8EK9eg3wsMtys
 qKD55FSYIwGriPWo10hegHXXS1WU75sA1CVJdTJwYtTU9c4ehR8g3VVOZcYEQnt9ntUQ=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hellI-0002lp-EC; Sat, 22 Jun 2019 19:33:21 +0000
Subject: Re: WANTED: gitlab automation help (was: Re: Document GitLab as the
 only way to contribute to Samba?)
To: Andrew Bartlett <abartlet@samba.org>, samba-technical@lists.samba.org
References: <1561079117.28284.21.camel@samba.org>
 <1335d0cf-bb13-6fcc-a4ea-75e6d4345cf5@samba.org>
 <71ad9ba3182d72cc7ec7f398d5f61368b5434169.camel@samba.org>
Openpgp: preference=signencrypt
Message-ID: <0f6ef568-693e-6e16-e839-85e78b7b297b@samba.org>
Date: Sat, 22 Jun 2019 22:33:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <71ad9ba3182d72cc7ec7f398d5f61368b5434169.camel@samba.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
From: Uri Simchoni via samba-technical <samba-technical@lists.samba.org>
Reply-To: Uri Simchoni <uri@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 6/22/19 8:04 AM, Andrew Bartlett via samba-technical wrote:

> On Sat, 2019-06-22 at 07:30 +0300, Uri Simchoni wrote:
<snip>

>> a. With online tools, a revised MR may trump the comments made by the
>> previous version.
> 
> The history of pushes is included in the history of comments on the MR,
> if that is what concerns you. 
> 

Yes, that's really good. Much better than Bitbucket/Github.

>> b. How to find the MR from a commit hash to see those comments.
> 
> Currently this is just as poor as finding the mails on samba-technical, 
> but there is hope.  We either need someone to write a script to watch
> the merge requests for the closing comments mentioning a git hash and
> to tag that commit with a git tag named after the merge request (eg
> gitlab-mr-456) and containing in the text:
>  - the URL of the merge request
>  - the test of the merge request description
> 

That would seem (to me) as a non-idiomatic use of the git tag system for
something not *that* important. Perhaps a simpler approach to both b.
and c. would be to channel the samba-team-bot emails to a special
mailing list that gets archived and can be browsed via lists.samba.org.

<snip>

> We also need help to automate the backups from GitLab.

I ran a short test of that - create my own small repo, review and merge
an MR, export the thing, setup a local gitlab instance, import. It
doesn't fully restore the state of the repo. MR comments are now on
behalf of the user who did the import (root), with the original
commenter mentioned in an additional line. I didn't get all versions of
the MR, "likes" are gone.

As noted above, maybe it would be more practical to make a mailing list
out of the MR discussion and archive that.

I'd be happy to help with automation but I'm currently not buying into
those particular automation tasks (I can do the backup if I understand
what we try to achieve by that and can demonstrate that we achieve it).

Thanks,
Uri.


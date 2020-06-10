Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 718DF1F4FAA
	for <lists+samba-technical@lfdr.de>; Wed, 10 Jun 2020 09:53:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=iWvya/ypjHU+xzmV82KqYCAYdHaP00iLHvB/IYkSpnk=; b=BDtdOlV4qUnAs2EiBdlAvS7Key
	Z/1hLBcA9lC4YVnaGWGXarHWbzycPxVH6kqDPaeWqa7Lzf7e3cC1xBroPBp8KyegoAV20Uuraog0i
	KvC0PkwODDb5k0WkUuYCW0TDq8WGvhllzSDkF4TIrrqWmzvqbOCloyK9YnKZakYGZWQel0KjjEtNu
	7GQUH7AaVjITT7q08qT2l8Wc6qE/ejnXFy1X2kl6Aw6Khq5MZQnTRkDI7TGX4qsD3ftS2uClybh40
	OnjUnp7m2sfw8KkWyboC81qWAHZ2eBP3duNBk0jZ4adMY4JcEkWiiCCvlwfLrcRF0qQfiBtpebZpi
	n9oFwbsw==;
Received: from localhost ([::1]:23474 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jivY7-009iQO-JT; Wed, 10 Jun 2020 07:53:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48146) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jivY1-009iQH-T5
 for samba-technical@lists.samba.org; Wed, 10 Jun 2020 07:53:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=iWvya/ypjHU+xzmV82KqYCAYdHaP00iLHvB/IYkSpnk=; b=HkftfI5MGOdkxACpU/CPaqEESp
 WoKgiKo8/7R1LguEC8tnK7DkwPekA0PKtddg44Jl3fjpWQAoXtV6jNZpvGQGMEtLOnjEdN5ENhM/P
 LjvNzhAJdIN7ovlrnAPTIIZtSrgQ1UZyL9jJViJ/QptFYmDtGLSiEw4hVOkMtwsookpH1ob8pR5v7
 9k/zKsp3ibp0y+I9NnkQstL6AEpmpC3oW4Gjsb0O/YccXGB1d+vFvz72zZH8J3Yr9GGi2Gkvesbet
 r5uN4Xx5EfSFzF3126mRd436UwcaH6ViilfAU9ZM9+4YrrOoSXEN28usUKr7vBwK8wQynEYCan+Hg
 MdNx3EhwEZcXYIzyaebxwXgnifmHcKcf43MnB5iz/4hKpivW37Zfy1r+U8SmKU8j1VBwqjUWkSJYd
 tJpsSRo0gQZe68jdak4BqTM1yvw/S/5BYKqtgrp0ikiDb7FXcKAIFkH0lUr3ePOu7MRR91AM0fbI4
 +tw2LgUADQdIjANHlvVnx0WB;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jivY0-0005iA-Vd; Wed, 10 Jun 2020 07:53:21 +0000
To: samba-technical@lists.samba.org
Subject: Re: Merge Request Template for Gitlab
Date: Wed, 10 Jun 2020 09:53:20 +0200
Message-ID: <1771645.yoCd8TQoOe@magrathea>
In-Reply-To: <e530f93b80c095696fe588a51615bb3bfce106cc.camel@samba.org>
References: <3443591.AXIHuhjjAK@magrathea> <4274398.2CJHkuDXdR@magrathea>
 <e530f93b80c095696fe588a51615bb3bfce106cc.camel@samba.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wednesday, 10 June 2020 09:08:02 CEST Andrew Bartlett via samba-technical 
wrote:
> > > >  * [ ] Code modified for feature
> > > 
> > > I'm not sure exactly what you mean by this checkbox.
> > 
> > Maybe name it: Preparation for a feature
> > 
> > There will be follow up merge requests ...
> > 
> > Better ideas?
> 
> * [ ] (optional) This MR is just one part towards a larger feature.

:+1:

> > > >  * [ ] CI timeout is 3h or higher (see Settings/CICD/General
> > > > 
> > > > pipelines/
> > > > Timeout)
> > > 
> > > This is not needed for the shared development repo, but saying so
> > > in a
> > > succinct way will be a challenge.
> > > 
> > > Some wording pointing at the Contributing page on the wiki might be
> > > a
> > > good idea also.
> > 
> > We could make it a link to the contribution page where it is
> > described in
> > detail.
> 
> Sounds good.  Remind me what the syntax for that would be?  To many
> wiki/markdown syntaxes muddle my brain...

[link text](https://url)
 


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D




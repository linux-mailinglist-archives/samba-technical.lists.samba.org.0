Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BB21C1DE536
	for <lists+samba-technical@lfdr.de>; Fri, 22 May 2020 13:17:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=RrQXCu40AEtP2i8QDkaCKyuOsTG0DkVw+XqQSeha9xg=; b=hHicvL+MYTM0++dnxDK9NkpRU+
	f6I8OIqr9MJ+AqgmuboXUsS5CKp7OgTkWcDXWL5MXpi9Mhw83fYaxLorw8DGH9wtDwBjSP3KG8Pkf
	AtCA+apseZlhQFgwLigIOlWHDp2f3nrsq3jFbZGcxqZTVk/O/q2whiVLaMqwCyqlJQZKRZ8v9PIPj
	/wCsCDZphwYo3Kv3hya2I84dc7koYema6O68MWI9j33DjRFa7ihPYJI+uEoVeADmQbi/AEkPpMuwp
	dVkruJRPMTS8R9H9ge1YXSRZz3lYidficxlmU9ovHSfldgztO9/VoUHXEzUfcx0u3t6PjODcr8aL8
	JFqhMULw==;
Received: from localhost ([::1]:32884 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jc5fb-005URu-2X; Fri, 22 May 2020 11:16:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47578) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jc5fV-005URn-Qn
 for samba-technical@lists.samba.org; Fri, 22 May 2020 11:16:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=RrQXCu40AEtP2i8QDkaCKyuOsTG0DkVw+XqQSeha9xg=; b=YCqM9UVxN6KfCEZe2wFneiHZBC
 rGRznsrwFa7ke4e3J4BwoX5Mev6dWzxOEbIaoJSTklhqnULp8PxGRhRtYQ7+PtbyPrBkwns0Ugvgo
 U+/BjOlM1tS+5aS7FaWr7JdtnLCZQtjriTgLX/TTFV0K5FgPZr/GBQJb5ZtDtazK1wfLO79xHgZRO
 nw23FmFHnxBnFjc9Tt/60BGMgeQwYALejv2OaC+exMiEPXA2wPiWYutLnNr8SY1YIrefYi5migWY0
 fdfW5lF1R56lz/F6vs4oE3dz5/vS+hg3EYPaOnZQx3tC10vhIsozVLIsIvkw48VmYuyNpWFRsVoIs
 JKxSE+RhYPaCCpHxF0+piyb9NBNzFP81p6tg0kw/vX4uvXOUqFV/3RJjQMNjUacP6iWopXnTlUfS7
 ciGInV8X/pT2SRfLHmatAsFHH8ymWrncoSW0LVVGzW410RYUdeCCJdx6VgGZhDesMTIYFfIX8zgZ2
 SAEn7Jz1NaawaCQbSYsXL/W5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jc5fU-0006jJ-By; Fri, 22 May 2020 11:16:49 +0000
Message-ID: <e73f8e0919a9ee239f53f6864ae605f6d0e9e199.camel@samba.org>
Subject: Re: GSoC: Community bonding questions
To: Alexander Bokovoy <ab@samba.org>, hezekiah maina <hezekiahmaina3@gmail.com>
Date: Fri, 22 May 2020 23:16:41 +1200
In-Reply-To: <20200522093211.GF5779@onega.vda.li>
References: <CAH72RCWL=4v4Ek9c-YbH0JYLX64iYK2NA83NOTYOHMN0uZ7A4A@mail.gmail.com>
 <20200522093211.GF5779@onega.vda.li>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2020-05-22 at 12:32 +0300, Alexander Bokovoy wrote:
> On to, 21 touko 2020, hezekiah maina wrote:
> > G'day everyone,
> > 
> > Please correct me if I am wrong. So when you provision an AD DC
> > using the
> > samba-tool command line utility the following files are created or
> > modified:
> >   smb.conf
> >   *.ldb / *.tdb
> >   krb5.conf
> >   resolv.conf
> >   /etc/hosts
> > 
> > Are there any other files that Samba creates or changes?
> 
> I don't remember the full list but you can generate a difference by
> using 'find' command with -newer check:
> 
>  - touch a file before running samba-tool on a system
>  - run samba-tool ...
>  - run find after running samba-tool on a new system

That's a good way to check.  Another is to use the --targetdir option. 
This will create all the provision-generated files in a single
directory  tree, and you can examine that.

Andrew Bartlett
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba





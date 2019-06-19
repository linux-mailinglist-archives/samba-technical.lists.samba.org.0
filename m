Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5770E4B143
	for <lists+samba-technical@lfdr.de>; Wed, 19 Jun 2019 07:19:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=soV3HRWGX4thfV83IzFBO1T7+Lpy0tbGmwOYmCobVAE=; b=HRJWM+Z3dMC4xajGN77WX9yX05
	kXiJhIcT4YR4hOzQORFox3H2lgV2BCmjxGlKAanDH/bf4FQcXkmtU8DYYBt1ITLfg6nejBAekcoL1
	/mvgqXDh1aK/+hPTVOBKEthRNZRiAKiUXgdqCWeXo7Nd7u5Fa+GCN2cUdZSJKQtsUCgZacX1cGTpi
	YjNvQ+641iZXQnoY6UyJ5cqYjex7T1i4I4ltFcp9HBIKbhHqcywjcO4Et2hoHw5DV2jRpyTSYrloy
	Ga6q68PEZXHeFeeQenB1HtBVD5JElw1X5ZfdJBtTNiiQVKCP4G0l+dfN6r5zZfh4ezP+gxj0kjgIh
	H6iWFfFQ==;
Received: from localhost ([::1]:57718 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hdSzU-000F3k-CE; Wed, 19 Jun 2019 05:18:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:22002) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hdSzP-000F3d-9M
 for samba-technical@lists.samba.org; Wed, 19 Jun 2019 05:18:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=soV3HRWGX4thfV83IzFBO1T7+Lpy0tbGmwOYmCobVAE=; b=ul7RNvBkyOK68IR5xME7Z/5UBc
 tLApGI0gpt0AY4YmtXcjgOb2SKIGR3OHATLL5Phyt3OeUAvISVpmAI1EBrdQWHg7mKpm3U3s+N6k4
 kj4RyYahfNXzzFyH8/TEQ5gYGBd9ffRnb1x38y/sQT8woU2dCMz9Cfy3KtGzdsxPh6wk=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hdSzO-0003Op-2d; Wed, 19 Jun 2019 05:18:30 +0000
Message-ID: <79b47f9c34a9154ce94c0129c37b77410d33f15c.camel@samba.org>
Subject: WANTED: bugzilla help (automated and semi-automated) closing bugs
To: =?ISO-8859-1?Q?Bj=F6rn?= JACKE <bj@SerNet.DE>
Date: Wed, 19 Jun 2019 17:18:25 +1200
In-Reply-To: <e5622276b22de37212b27b908ee9dc065519fa72.camel@samba.org>
References: <c976289f207aa7ab941cb368e38e806201eff36c.camel@samba.org>
 <f916dfd9c395ea1589daddefaa31f8ef4615cd8e.camel@cryptolab.net>
 <9c4fa2da0d467c72a822f0151a08b006daf332bd.camel@samba.org>
 <20190612135627.GA24651@sernet.de>
 <e5622276b22de37212b27b908ee9dc065519fa72.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
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
Cc: Anoop C S <anoopcs@cryptolab.net>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2019-06-12 at 22:45 +0200, Andrew Bartlett via samba-technical
wrote:
> On Wed, 2019-06-12 at 15:56 +0200, Björn JACKE wrote:
> > On the other hand I think it's not too
> > much to ask
> > for also to look the exact release version up in the release notes
> > (or the git
> > history if you prefer) in case that someone is interested in the
> > exact
> > version where a fix went in. All the bug IDs are listed nicely in
> > the
> > release notes already.
> 
> A bot that looks for BUG: URLs and adds comments saying that a commit
> with id xxxxx was applied to branch yyyy mentioning this bug would be
> incredibly helpful.  
> 
> Most of the triage time is spent finding that by hand.  (And our
> users
> should not have to do that, it requires git searches or reading
> multiple release note files to determine which version something
> landed
> in). 
> 
> Our bugzilla as currently used requires way to much manual work that
> could be automated, costing both team members and our end users. 

We could at least close another 100 bugs if we closed out bugs that are
open, not waiting for Karolin but referenced in a git commit.  

Currently these bugs have a BUG: tag in master yet are open[1]:

https://bugzilla.samba.org/buglist.cgi?bug_id=8630%2C9976%2C10066%2C10286%2C10440%2C10803%2C10812%2C10882%2C11012%2C11198%2C11592%2C11600%2C11628%2C11665%2C11823%2C11836%2C11894%2C12155%2C12292%2C12293%2C12297%2C12385%2C12399%2C12402%2C12416%2C12423%2C12451%2C12468%2C12739%2C12761%2C12841%2C12845%2C12851%2C12876%2C12881%2C12921%2C12926%2C13004%2C13039%2C13059%2C13093%2C13151%2C13159%2C13178%2C13213%2C13214%2C13223%2C13225%2C13229%2C13247%2C13307%2C13309%2C13311%2C13343%2C13350%2C13353%2C13365%2C13378%2C13379%2C13381%2C13415%2C13442%2C13448%2C13452%2C13458%2C13461%2C13462%2C13466%2C13469%2C13471%2C13475%2C13525%2C13564%2C13565%2C13573%2C13591%2C13604%2C13612%2C13627%2C13630%2C13655%2C13658%2C13680%2C13698%2C13699%2C13723%2C13761%2C13771%2C13772%2C13806%2C13822%2C13825%2C13843%2C13852%2C13864%2C13880%2C13915%2C13932%2C13939%2C13948%2C13949%2C13952%2C13959%2C13967%2C13973&bug_id_type=anyexact&list_id=22103&query_format=advanced

What do folks think of closing those as fixed?  Would someone be
willing to write a script to find the git hash from the BUG number and
close the bug with that and the version it was found in?  

Or should we just close them all in bulk (perhaps a more refined list)?
 
Of course, anyone actively doing a backport can just re-open them when
needed.

We would get a nicer outcome if we did it manually, and the manual
process I use would be (eg):

git log --grep="BUG: https://bugzilla.samba.org/show_bug.cgi?id=10000"

(guess which version it is in)
git log origin/v4-10-test

/3e11421e7476d968a3d550491279d0ad6b6c398f
(to search for the git hash)
then search trees until it is both found and not found, record that as
the fixed version.  Perhaps a smarter script could checkout the hash
and check the VERSION. 

Close the bug as RESOLVED/FIXED with the commit message and version.

As you can see, it is a pretty involved process and even 100 bugs will
take several hours manually, but if someone has the time it would be
incredibly helpful.  It doesn't need samba coding skills, just
patience!

Long term I think we really need a bot doing this, watching git and
closing bugs in real time. 

Andrew Bartlett 

[1] The way I got that list is to go to:

https://bugzilla.samba.org/query.cgi?bug_id=1%202&bug_id_type=anyexact&bug_status=NEW&bug_status=ASSIGNED&bug_status=REOPENED&f1=assigned_to&list_id=22106&o1=notequals&query_format=advanced&v1=kseeger%40samba.org

Then edit the comma-separated bug list to be the output of:

git log | grep "BUG: https://bugzilla.samba.org/show_bug.cgi?id=" | cut -f 2 -d =| sort | uniq| grep -v maybe| xargs echo | tr " " ","


-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba





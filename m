Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 674971FFFE9
	for <lists+samba-technical@lfdr.de>; Fri, 19 Jun 2020 03:53:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=SXvzxW+YOSFsGjJ56VA2TANHwsUpzF8QqxFvh6ICJms=; b=m16rog0/RwlM/tbcFwUvbA47dl
	GlhmAels67Me2+qoUjQixJ1C5G92XUD77Z/zr12imuy1wQezhOB1LGj11KonYGte3HC2Wbxvzv0bp
	AmJj4QByp7me2mGU5KBkuzxySKfSzcV0y/Y5KmjBRhOhdyZ/Uhsnj1MOz92AY5VAC7iBTYMHLa2R/
	dTw4u3uf5wCNGW0040gLxUwILZCIfIncxz9F3HbHn15r9EtQdjF7fn0pAQ9uGuR5ADFUTGpt4V0j/
	FBLxvyizi7LFNS7oRbvj/KkjXPSdZKCVycLGu9ougT9naY3/DsuNLVJHjgK+badXqqH62yeP124Z3
	aeRiQomg==;
Received: from localhost ([::1]:43006 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jm6DS-001KBo-GG; Fri, 19 Jun 2020 01:53:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13882) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jm6DL-001KBh-63
 for samba-technical@lists.samba.org; Fri, 19 Jun 2020 01:53:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=SXvzxW+YOSFsGjJ56VA2TANHwsUpzF8QqxFvh6ICJms=; b=naPfJL8rDD5zyoFp0kekqTToqk
 jBcFNxfz814AcmGBXKWipGDANCR8/JrjCiu+RVBwQ5vbRqh2uR8BA3QZ0MiXdMI03xySJZJBf7NPx
 DN6c2f+LvpyREEdOqmQxSskwhmfLa2DSmgEjT6SOl+V/7G0DYcZkiE7w3y+8XAPIs4O1bigerNI5A
 A63NVCd1JpbF0b7wAvxCja7VbHBkvR/gANybV5T3pWUf+56a+EFrmxWeBb23FdFFqiLCnThpve9xI
 rQrfKxg9ESMT5R2i5kZIXohZ3RrprpWykkZkZ/rFvSROp0wK4BSrX3xN2glhN3thraTaTMvLkXP9n
 xoY1aO1PSoKGUn9S20OWiMnKGsH6BcpMhFnAzfsRkoteaXjXvErwRK4bR9XVIGHj+myWJXrLn5MZp
 I913PmDf9YeQMWOJt07AQ5Kfn6RDvHmRNZZ8VJNLn63LnHltxj4Me10W+5rDXEA/65NdlRZq2xKRB
 5is2BfmDncb4liwuJuS/k5fs;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jm6DD-0006eN-Fw; Fri, 19 Jun 2020 01:53:00 +0000
Message-ID: <bd697f519c3b34b941b7ba06cb2c9ae024de7472.camel@samba.org>
Subject: Re: New Contribute page on the wiki
To: William Brown <wbrown@suse.de>, Martin Schwenke <martin@meltin.net>
Date: Fri, 19 Jun 2020 13:52:54 +1200
In-Reply-To: <FECF7A7A-D9CE-4D60-AE6D-53E58120C37D@suse.de>
References: <8b444948-cef4-74d8-a455-958446832aaa@suse.com>
 <20200526172611.GG18267@jeremy-acer>
 <9f00da33e7c31f8f6304af90280bdef8f917c7c3.camel@samba.org>
 <20200619111338.2e5deb21@martins.ozlabs.org>
 <FECF7A7A-D9CE-4D60-AE6D-53E58120C37D@suse.de>
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

On Fri, 2020-06-19 at 11:38 +1000, William Brown wrote:
> > On 19 Jun 2020, at 11:13, Martin Schwenke via samba-technical <
> > samba-technical@lists.samba.org> wrote:
> > 
> > Also, although the page goes close, I feel it is missing the beauty
> > of
> > this statement:
> > 
> >  Finally remember that Samba is Git patches as performance
> > art.  Each
> >  is to be carefully prepared, polished and presented with love, as
> > a hand-
> >  crafted gift to the future.  The beauty is in the stream of
> > individual
> >  gems.  It often feels overkill, but here today we see why we have
> > the
> >  emphasis, because it means that anybody - even someone outside
> > CTDB
> >  expertise, can say 'sure, that makes sense', and review it. 
> > 
> >  
> > https://lists.samba.org/archive/samba-technical/2018-July/129353.html
> > 
> > I feel that the author of this statement really captured something
> > that
> > day and it would be a shame if it were lost to only the mailing
> > list
> > archive...  ;-)
> 
> As poetic and beautiful as this statement is, the message it conveys
> is "Samba is hard" rather than "Anyone can be in this community".
> This could turn people away from wanting to start or contribute. So
> it's probably better to avoid things like this, as glorious and
> elegantly written as it is. 

William,

I'm to sorry to have to say, but this really killed the mood.

Martin,

Thanks.  I really enjoy that you found the time to locate that, it
really made my day.  At the very least I'll include it as a link.

Andrew Bartlett


-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




